#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/common.sh"

# 设置输出信息：如果 INFOS 变量未设置，则采用默认值
if [[ -z "${INFOS:-}" ]]; then
    log_warning "INFOS variable not set, using default value: hello world!"
    export INFOS=123456
fi
echo ${INFOS}
# 彩色打印测试
log_debug "${INFOS} -> $(uname -m)"
log_info "${INFOS} -> $(uname -m)"
log_success "${INFOS} -> $(uname -m)"
log_warning "${INFOS} -> $(uname -m)"
log_error "${INFOS} -> $(uname -m)"
log_critical "${INFOS} -> $(uname -m)"