FROM ubuntu:22.04 as ubuntu_jammy_penguin
ARG DEBIAN_FRONTEND=noninteractive
ARG USERNAME=penguin
ARG PASSWORD=penguin
SHELL ["/bin/bash", "-c"]
RUN echo "sudo権限を持つユーザーを追加" && \
    apt update && apt upgrade -y && \
    apt install -y sudo && \
    useradd -m -s /bin/bash --user-group --groups sudo ${USERNAME} && \
    echo ${USERNAME}:${PASSWORD} | chpasswd && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

FROM ubuntu_jammy_penguin as hugo
ARG DEBIAN_FRONTEND=noninteractive
ARG USERNAME=penguin
SHELL ["/bin/bash", "-c"]
USER ${USERNAME}
WORKDIR /home/${USERNAME}
RUN echo "Hugoの開発環境を構築" && \
    sudo apt update && sudo apt upgrade -y && \
    sudo apt install -y curl git wget && \
    wget https://github.com/gohugoio/hugo/releases/download/v0.105.0/hugo_0.105.0_linux-amd64.deb && \
    sudo dpkg -i hugo_0.105.0_linux-amd64.deb && rm -rfv hugo_0.105.0_linux-amd64.deb && \
    sudo apt update && sudo apt upgrade -y && sudo apt autopurge -y && \
    sudo apt clean && sudo rm -rf /var/lib/apt/lists/*