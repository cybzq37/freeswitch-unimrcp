package com.test.common.json;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.datatype.jsr310.ser.key.Jsr310NullKeySerializer;
import com.fasterxml.jackson.module.paramnames.ParameterNamesModule;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.List;
import java.util.TimeZone;

/**
 * @author lichunqing
 */
public class JsonUtils {
    private static final Logger LOG = LoggerFactory.getLogger(JsonUtils.class);
    private static final ObjectMapper objectMapper = new ObjectMapper();

    static {
        //允许key为null
        objectMapper.getSerializerProvider().setNullKeySerializer(new Jsr310NullKeySerializer());
        // 支持java8的日期和时间类型
        objectMapper.registerModule(new JavaTimeModule());
        // 支持在反序列化时获取构造函数或方法参数的名称，提供错误日志信息
        objectMapper.registerModule(new ParameterNamesModule());
        // 用于查找并注册所有可用的 Jackson 模块
        objectMapper.registerModules(ObjectMapper.findModules());

        //是否允许使用注释
        objectMapper.configure(JsonParser.Feature.ALLOW_COMMENTS, false);
        //字段允许去除引号
        objectMapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES, false);
        //允许单引号
        objectMapper.configure(JsonParser.Feature.ALLOW_SINGLE_QUOTES, false);
        //允许转义字符
        objectMapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_CONTROL_CHARS, false);
        //严格重复检测
        objectMapper.configure(JsonParser.Feature.STRICT_DUPLICATE_DETECTION, false);
        //不检测失败字段映射
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

        // 配置不输出空字段，全局设置
        objectMapper.configure(SerializationFeature.WRITE_NULL_MAP_VALUES, false);
        //不输出空值字段，单个对象设置
        objectMapper.setDefaultPropertyInclusion(JsonInclude.Include.NON_NULL);
        //空对象不出错
        objectMapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);

        // 设置时区
        objectMapper.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
        //时间字段输出时间戳
        objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, true);
        //时间输出为毫秒而非纳秒
        objectMapper.configure(SerializationFeature.WRITE_DATE_TIMESTAMPS_AS_NANOSECONDS, false);
        //时间读取为毫秒而非纳秒
        objectMapper.configure(DeserializationFeature.READ_DATE_TIMESTAMPS_AS_NANOSECONDS, false);
        //通过启用默认的类型信息，Jackson 将在序列化时包含类型信息，
        //MAPPER.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
        //MAPPER.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
    }

    private JsonUtils() {}

    public static JsonNode toJsonNode(String text) {
        if(text == null || text.isEmpty()){
            throw new RuntimeException("input text is null");
        }
        try {
            return objectMapper.readTree(text);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    public static ObjectNode toObjectNode(String text) {
        if(text == null || text.isEmpty()){
            throw new RuntimeException("input text is null");
        }
        try {
            JsonNode jsonNode = objectMapper.readTree(text);
            return objectMapper.treeToValue(jsonNode, ObjectNode.class);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
    }

    public static String toJsonString(Object object) {
        if (object == null) {
            return null;
        }
        try {
            return objectMapper.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("JSON transformation error");
        }
    }

    public static <T> T toObject(String text, Class<T> clazz) {
        if(text == null || text.isEmpty()){
            throw new RuntimeException("input text is null");
        }
        try {
            return objectMapper.readValue(text, clazz);
        } catch (IOException e) {
            throw new RuntimeException("json string cannot be converted to object");
        }
    }

    public static <T> T toObject(String text, TypeReference<T> typeRef) {
        if(text == null || text.isEmpty()){
            throw new RuntimeException("input text is null");
        }
        try {
            return objectMapper.readValue(text, typeRef);
        } catch (JsonProcessingException e) {
            throw new RuntimeException("json string cannot be converted to type");
        }
    }

    public static <T> T toObject(InputStream in, Class<T> clazz) {
        if (in == null) {
            throw new RuntimeException("InputStream is null");
        }
        try {
            return objectMapper.readValue(in, clazz);
        } catch (IOException e) {
            throw new RuntimeException("json string cannot be converted");
        }
    }

    public static <T> T toObject(Reader reader, Class<T> clazz) {
        if (reader == null) {
            throw new RuntimeException("reader is null");
        }
        try {
            return objectMapper.readValue(reader, clazz);
        } catch (IOException e) {
            throw new RuntimeException("json string cannot be converted");
        }
    }

    public static <T> List<T> toObjectArray(String json, Class<T> clazz) {
        JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, clazz);
        try {
            return objectMapper.readValue(json, javaType);
        } catch (IOException e) {
            throw new RuntimeException("json string cannot be converted to array");
        }
    }

    public static ObjectNode createObjectNode() {
        return objectMapper.createObjectNode();
    }

}
