# FROM node:12.20.1-buster-slim
FROM node:10.23.1-buster-slim
WORKDIR /opt/
RUN BUILD_DEPS="git make build-essential" && apt-get update && apt-get install -y ${BUILD_DEPS} python3 && \
    git clone https://github.com/rt-net/dynamixel_checker.git && \
    cd dynamixel_checker/src && npm install && \
    apt-get purge -y ${BUILD_DEPS} && apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /opt/dynamixel_checker/src
CMD ["npm", "start"]
# CMD ["/bin/bash"]
