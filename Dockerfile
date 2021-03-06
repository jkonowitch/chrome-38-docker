FROM ubuntu:trusty-20191217
LABEL maintainer "Jeffrey Konowitch <jeff.konowitch@onepeloton.com>"

# Install Chrome
RUN apt-get update && apt-get install -y \
  software-properties-common \
  libnss3 \
  libgconf-2-4 \
  fontconfig \
  libpangocairo-1.0-0 \
  libxi6 \
  libxcursor-dev \
  libxcomposite1 \
  libasound2 \
  libxdamage1 \
  libxtst6 \
  libxrandr2 \
  libcups2 \
  libgtk2.0-0 \
  libxss1 \
  libgl1-mesa-glx \
  libexif-dev \
  && rm -rf /var/lib/apt/lists/*

RUN ln -sf /lib/$(arch)-linux-gnu/libudev.so.1 /lib/$(arch)-linux-gnu/libudev.so.0

VOLUME /chrome-user-data

COPY ./chrome-38-files /chrome-38
COPY ./*.sh /

CMD [ "/start-chrome.sh" ]
