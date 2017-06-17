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
COPY .config /root/.config
COPY .oh-my-zsh /root/.oh-my-zsh
COPY .zsh* /root/
COPY .tmux.conf /root/
COPY console-setup /etc/default/
RUN apt-get install -y -q -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
	zsh \
	fontconfig \
	python-pip \
  tmux \
  i3 \
  i3blocks \
  xserver-xephyr \
  dbus-x11 \
  xterm \
  curl \
  feh \
  iceweasel \
  xfce4-terminal \
  pulseaudio \
	&& rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apt/archives
RUN mkdir /root/.fonts
RUN pip install powerline-status
RUN wget -O PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
RUN wget -O 10-powerline-symbols.conf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
RUN curl http://winswitch.org/gpg.asc | apt-key add -
RUN echo "deb http://winswitch.org/ jessie main" > /etc/apt/sources.list.d/winswitch.list
RUN apt-get update && apt-get install -y -q -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
  xpra \
  && rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apt/archives
COPY .fonts /root/.fonts
COPY .i3 /root/.i3
COPY my_xmodmap /root/my_xmodmap
COPY PowerlineSymbols.otf /root/.fonts
COPY 10-powerline-symbols.conf /etc/fonts/conf.d/
COPY dark_aurora-1440x900.jpg /root/
RUN fc-cache -vf /etc/fonts/conf.d/
RUN chsh -s /bin/zsh 
ENV DEBIAN_FRONTEND teletype
