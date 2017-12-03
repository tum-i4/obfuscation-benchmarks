# Use an official KLEE runtime a parent image
FROM klee/klee:1.4.0

# Set environment variables
ENV USERNAME klee
ENV HOME=/home/$USERNAME

USER root

# Facilitate X11 Forwarding
RUN echo "$USERNAME:$USERNAME" | chpasswd && \
    usermod --shell /bin/bash $USERNAME && \
    usermod -aG sudo $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    # Replace 1000 with your user/group id
    usermod  --uid 1000 $USERNAME && \
    groupmod --gid 1000 $USERNAME && \
    # Install needed packages
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install default-jre-headless default-jdk && \
    apt-get -y install gcc g++ mono-mcs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
USER $USERNAME
    
# Set the working directory
WORKDIR ${HOME}

# Copy the needed files and folders into the container
ADD ./resources ${HOME}
COPY ./simple-hash-functions ${HOME}/simple-hash-functions/
COPY ./scripts ${HOME}/scripts/ 

# Install the Tigress Obfuscator, SatGraf and Z3
RUN unzip tigress-Linux-x86_64-2.2.zip && \
    echo 'export TIGRESS_HOME='${HOME}'/tigress-2.2' >> /home/$USERNAME/.bashrc && \
    echo 'export PATH=$PATH:'${HOME}'/tigress-2.2' >> /home/$USERNAME/.bashrc && \
    unzip -o satgraf-0.2.zip && \
    unzip -o z3-z3-4.5.0.zip && \
    rm ./*.zip && \
    mv z3-z3-4.5.0 z3 && \
    cd z3 && patch src/sat/tactic/sat_tactic.cpp < ../scripts/z3_dimacs.patch && \
    python scripts/mk_make.py && \
    cd build && \
    make
USER root
RUN cd z3/build && sudo make install && \
    cd ${HOME} && \
    chown -R $USERNAME ./scripts/ ./simple-hash-functions/ && \
    chgrp -R $USERNAME ./scripts/ ./simple-hash-functions/ 
USER $USERNAME  
