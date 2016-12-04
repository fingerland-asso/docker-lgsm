#!/usr/bin/env bash

function install {
    cd "${INSTALL_DIR}"
    wget https://gameservermanagers.com/dl/${SERVER} -O ${SERVER}
    chmod +x ${SERVER}
    ./${SERVER} auto-install
}

function update {
    ./${SERVER} update
}

##################################### Main #####################################
[ ! -f "${INSTALL_DIR}/${SERVER}" ] && install
[ "${UPDATE_ON_START}" -eq "1" ] && update

./${SERVER} start
tmux attach-session -r