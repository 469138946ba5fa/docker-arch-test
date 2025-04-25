# ubuntu 滚动版，追求新颖，不稳定
FROM docker.io/library/ubuntu:rolling

# 添加常用LABEL（根据需要修改）添加标题 版本 作者 代码仓库 镜像说明，方便优化
LABEL org.opencontainers.image.description='docker multi-arch test' \
      org.opencontainers.image.title='Multi-arch Test' \
      org.opencontainers.image.version='1.0.0' \
      org.opencontainers.image.authors='469138946ba5fa <af5ab649831964@gmail.com>' \
      org.opencontainers.image.source='https://github.com/469138946ba5fa/docker-arch-test' \
      org.opencontainers.image.licenses='MIT'

# 复制所有脚本到 /usr/local/bin（保持工作目录干净）
# 执行安装与配置脚本（全部以 root 执行）
COPY scripts/ /usr/local/bin/

# 执行 初始化 安装
# 保留日志脚本 common.sh
# 启动脚本 start_test.sh
RUN apt update && \
    apt -y install --no-install-recommends tini && \
    apt autoremove -y && \
    apt clean && \
    apt autoclean && \
    rm -rf /var/lib/apt/lists/* && \
    cd /usr/local/bin/ && \
    chmod -v a+x *.sh

# 使用 tini 作为入口，调用 entrypoint 脚本或者直接启动 /usr/local/bin/start_test.sh
ENTRYPOINT ["tini", "--"]
# 脚本执行
CMD [ "/usr/local/bin/start_test.sh" ]