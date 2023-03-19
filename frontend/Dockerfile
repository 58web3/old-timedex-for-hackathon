FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y curl git unzip xz-utils zip libglu1-mesa gnupg \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get update && apt-get install -y --no-install-recommends apt-utils \
    && apt-get upgrade -y \
    && apt-get install -y vim \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
    && install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ \
    && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' \
    && apt-get update \
    && apt-get install -y code

RUN useradd -ms /bin/bash flutteruser \
    && mkdir -p /home/flutteruser/.config/Code/User \
    && chown -R flutteruser:flutteruser /home/flutteruser

COPY --chown=flutteruser:flutteruser ./vscode_settings.json /home/flutteruser/.config/Code/User/settings.json

WORKDIR /home/flutteruser

ENV PATH="/usr/local/flutter/bin:${PATH}"

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter \
    && chmod -R a+rwx /usr/local/flutter \
    && chown -R flutteruser:flutteruser /usr/local/flutter

USER flutteruser

RUN flutter config --no-analytics \
    && flutter doctor \
    && chown -R flutteruser:flutteruser /home/flutteruser

COPY . .

EXPOSE 8080

CMD ["flutter", "run", "--release", "-d", "web-server", "--web-port", "8080", "--web-hostname", "0.0.0.0"]
