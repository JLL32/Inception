include srcs/.env

up: build
	if ! grep -q ${DOMAIN_NAME} /etc/hosts; then sudo sh -c "echo 127.0.0.1 ${DOMAIN_NAME} >> /etc/hosts"; fi;
	cd srcs && docker compose up

build:
	mkdir -p /home/${VM_NAME}/data/wordpress
	mkdir -p /home/${VM_NAME}/data/wordpress
	cd srcs && docker compose build

down:
	cd srcs && docker compose down

rm:
	sudo rm -rf /home/${VM_NAME}/data/wordpress/*
	sudo rm -rf /home/${VM_NAME}/data/wordpress/*
