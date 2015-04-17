FROM resin/rpi-node
RUN apt-get update -y && apt-get install -y usbutils wireless-tools \
python python-pip python-dev python-dbus python-flask python-pycurl \
dropbear \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . /app

CMD ["bash", "/app/start.sh"]
