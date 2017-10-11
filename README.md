# docker-ansible-for-aws
This is built/inspired/modified from the fantastic williamyeh/ansible repo.

Do a simple 
    `docker run --rm valien/docker-ansible-for-aws` to see if the image works and shows Ansible version, etc.

You can mount your playbooks with the following command:

    docker run -it -v "<PATH/TO/YOUR/PLAYBOOKS/>":/ansible:rw -v "<PATH/TO/YOUR/KEYS/.ssh/>":/root/.ssh/:rw -v "<PATH/TO/YOUR/AWS_KEYS/>.aws/":/root/.aws/:ro --name ansible4aws valien/docker-ansible-for-aws /bin/sh

