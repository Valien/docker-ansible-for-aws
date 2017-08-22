FROM alpine:3.6

MAINTAINER Allen Vailliencourt <allen.vailliencourt@forty8fiftylabs.com>
# parts of this dockerfile are from here - https://github.com/William-Yeh/docker-ansible/blob/master/alpine3/Dockerfile
# customized this for AWS usage primarily (adding boto3 dependencies)

RUN apk --update add python py-pip openssl ca-certificates && \
    apk --update add --virtual build-dependencies python-dev libffi-dev openssl-dev build-base && \
    pip install --upgrade pip cffi boto boto3 && \
    pip install ansible && \
    # not required but good for ssh access and file management (jq and nano)
    apk --update add sshpass openssh-client jq nano && \
    # clean up time...
    apk del build-dependencies && \
    rm -rf /var/cache/apk/*

COPY ec2.ini ec2.py ansible.cfg /etc/ansible/

RUN chmod +x /etc/ansible/ec2.py

CMD [ "ansible-playbook", "--version" ]