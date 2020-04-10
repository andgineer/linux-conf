from ubuntu:18.04

# install docker & dependencies
RUN apt-get update -y \
    && apt-get install -y apt-transport-https ca-certificates curl software-properties-common systemd \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" \
    && apt-get update -y \
    && apt-get install -y docker-ce docker-ce-cli containerd.io

# install anaconda
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get install -y wget bzip2 libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 \
        libasound2 libxi6 libxtst6 \
    && curl -O https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh \
    && bash ./Anaconda3-2020.02-Linux-x86_64.sh -b -p /opt/conda \
    && rm ./Anaconda3-2020.02-Linux-x86_64.sh \
    && ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh \
    && echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc \
    && echo "conda activate base" >> ~/.bashrc
