#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <uv.h>

uv_loop_t *loop;
uv_tcp_t client;

void on_connect(uv_connect_t *req, int status) {
    if (status < 0) {
        fprintf(stderr, "Connect error: %s\n", uv_strerror(status));
        return;
    }
    printf("Connected!\n");

    // 发送数据
    const char *request = "Hello, server!";
    uv_buf_t buf = uv_buf_init((char*) request, strlen(request));
    uv_write_t write_req;
    uv_write(&write_req, (uv_stream_t*) req->handle, &buf, 1, NULL);

    // 关闭连接
    uv_close((uv_handle_t*) &client, NULL);
}

int main(int argc, char **argv) {
    loop = uv_default_loop();

    // 初始化TCP句柄
    uv_tcp_init(loop, &client);

    // 建立连接
    struct sockaddr_in dest;
    uv_ip4_addr("192.168.1.204", 7000, &dest);
    uv_connect_t connect_req;
    uv_tcp_connect(&connect_req, &client, (const struct sockaddr*)&dest, on_connect);
    // 运行事件循环
    uv_run(loop, UV_RUN_DEFAULT);
    return 0;
}