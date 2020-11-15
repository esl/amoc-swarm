FROM python:3.9-slim
RUN pip install ansible
RUN apt-get update
RUN apt-get install -y sshpass
COPY ./ansible /ansible
WORKDIR /ansible
ENV ANSIBLE_HOST_KEY_CHECKING=False
CMD /bin/bash
