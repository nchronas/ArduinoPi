FROM resin/rpi-node
RUN apt-get update -y && apt-get install -y usbutils wireless-tools \
python python-pip python-dev python-dbus python-flask python-pycurl \
dropbear \
arduino \
&& apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pip install ino

COPY . /app

CMD ["bash", "/app/start.sh"]
