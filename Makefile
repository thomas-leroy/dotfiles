chmod:
	@find . -type f -name '*.sh' -exec chmod +x {} \;

install-mac:
	@./mac/install.sh

install-ubuntu:
	./ubuntu/install.sh

update:
	git pull origin main

install:
	make update
	make install-$(OS)o

init: 
	@./commons/init.sh	
	
