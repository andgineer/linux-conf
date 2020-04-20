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

# tmuximator

RUN apt-get install -y tmux ruby-dev build-essential libssl-dev libreadline-dev zlib1g-dev nano rbenv \
    && rbenv install 2.4.1 \
    && rbenv global 2.4.1 \
    && gem update --system \
    && gem install tmuxinator bundler \
    && echo "export EDITOR='nano'" >> ~/.bashrc \
    && wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.bash -O /etc/bash_completion.d/tmuxinator.bash \
    && curl https://raw.githubusercontent.com/andgineer/linux-conf/master/linux/.tmux.conf -o ~/.tmux.conf

# Micro
RUN curl https://getmic.ro | bash \
    && mv micro /usr/bin/

# snap does not work just after installation?
#apt install -y snapd && snap install micro --classic

