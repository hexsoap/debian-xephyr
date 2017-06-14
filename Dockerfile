FROM hexsoap/debian-base:v1.0
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y -q -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" locales apt-utils console-setup
RUN echo "Europe/Brussel" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN apt-get install -y -q -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"\
	zsh \
	fontconfig \
	python-pip \
  tmux \
  i3 \
  i3blocks \
  xserver-xephyr \
  xpra \
  dbus-x11 \
  xterm \
  pulseaudio \
	&& rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apt/archives
COPY .oh-my-zsh /root/.oh-my-zsh
COPY .zsh* /root/
COPY .tmux.conf /root/
COPY console-setup /etc/default/
RUN mkdir /root/.fonts
RUN pip install powerline-status
RUN wget -O PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
RUN wget -O 10-powerline-symbols.conf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
COPY PowerlineSymbols.otf /root/.fonts
COPY 10-powerline-symbols.conf /etc/fonts/conf.d/
RUN fc-cache -vf /etc/fonts/conf.d/
RUN chsh -s /bin/zsh 
ENV DEBIAN_FRONTEND teletype
