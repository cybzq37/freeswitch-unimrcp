-- apt install lua-socket
local http = require("socket.http")
local ltn12 = require("ltn12")

session:answer() -- 开始应答

-- 全局变量
host = "http://192.168.1.96:8080"
uuid = session:getVariable("uuid")
caller_id_number = session:getVariable("caller_id_number")
created_time = session:getVariable("answered_time") -- 或 created_time

-- 语音工单保存
order_step = 0
order = {}
order.uuid = uuid
order.createdTime = created_time
order.callerIdNumber = caller_id_number

-- 聊天记录
chat_record = uuid .. "|" .. caller_id_number .. "|" .. created_time .. "@"

-- 发送POST请求
function send_post_request(url, data)
    local response = {}
    local result, status, headers = http.request{
        url = url,
        method = "POST",
        headers = {
            ["Content-Type"] = "application/json",
            ["Content-Length"] = string.len(data)
        },
        source = ltn12.source.string(data),
        sink = ltn12.sink.table(response)
    }
    if status == 200 then
        return table.concat(response)
    else
        return nil
    end
end

-- 字符串分割函数
function split(inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

function saveChatRecord(time, type, content)
    if content == nil or string.find(content, 'Completion%-Cause: 002') or content == "Unrecognized" or string.find(content, 'Completion%-Cause: 000') then
        -- 未识别到聊天记录，不保存
        return
    end
    chat_record = chat_record .. time .. "|" .. type .. "|" .. content .. ","
end

function speak(text)
    saveChatRecord(os.time()*1000, "a", text)
    session:speak(text)
end

function handleOrderProcess(asrText)
    if order_step == 0 then
        order.question = asrText
        order_step = order_step + 1
        speak("请说出您的姓名")

    elseif order_step == 1 then
        order.realname = asrText
        order_step = order_step + 1
        speak("请说出问题关联的业务系统")

    elseif order_step == 2 then
        order.system = asrText
        order_step = order_step + 1
        speak("请详细描述您的问题")

    else
        order.question = asrText
        order_step = 0 -- 重置下单流程
    end    
end

-- 设置挂机钩子函数，只有手动调用hangup才有效
function onHangup()    
    send_post_request(host .. "/saveChatRecord", chat_record) -- 上传聊天记录
    session:execute("play_and_detect_speech", "stop")
end
session:setHangupHook("onHangup")

say_welcome = "ivr/8000/say_welcome.wav"
say_please = "ivr/8000/say_please.wav"
say_unrecognized = "ivr/8000/say_unrecognized"

session:set_tts_params("unimrcp", "siyue")
session:streamFile(say_welcome)

tryagain = 1
while (tryagain == 1) do
    session:execute("play_and_detect_speech", say_please .. "detect:unimrcp {start-input-timers=true,no-input-timeout=15000,speech-complete-timeout=200,recognition-timeout=20000}" .. "ivr")
    local asrText = session:getVariable("detect_speech_result")
    saveChatRecord(os.time()*1000, "q", asrText) -- 保存聊天记录

    -- 会话未准备好/识别文本为nil/静音超时
    if not session:ready() or asrText == nil or string.find(asrText, 'Completion%-Cause: 002') then 
        tryagain = 0 --退出
    
    -- 未识别/返回为空字符串
    elseif asrText == "Unrecognized" or string.find(asrText, 'Completion%-Cause: 000') then
        -- 不执行任何操作

    elseif order_step > 0 then -- 自助下单流程
        handleOrderProcess(asrText)
        if order_step == 0 then
            local orderText =  order.uuid .. "|" .. order.createdTime .. "|" .. order.callerIdNumber .. "|" .. order.realname .. "|" .. order.system .. "|" .. order.question
            send_post_request(host .. "/saveOrder", orderText)
            speak("自助下单成功")
            tryagain = 0
        end
    else
        local answer = send_post_request(host .. "/answer", asrText) -- 知识库查询答案
            
        if answer == nil or answer == "NoAnswer" then
            speak("对不起，未在知识库中找到相对应的回答，您可以选择自助下单或转人工")

        elseif answer == "PlaceOrder" then -- 自助下单开始
            handleOrderProcess(asrText)
                
        elseif answer == "TurnManual" then -- 转人工
--            session:execute("bridge", "sofia/external/sip:88888888@10.138.19.101:5080")
            session:setVariable("effective_caller_id_name", caller_id_number)
            session:execute("bridge", "{origination_caller_id_number=" .. caller_id_number .. "}sofia/external/sip:88888888@10.138.19.101:5080")

        else
            speak(answer)

        end
    end
    session:sleep(250)
end

session:hangup()