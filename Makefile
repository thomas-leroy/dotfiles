.PHONY: chmod install-mac install-ubuntu install-fedora install init import-vscode export-vscode

chmod:
	@find . -type f -name '*.sh' -exec chmod +x {} +

install-mac:
	@echo "Installing for macOS..."
	@./mac/install.sh

install-ubuntu:
	@echo "Installing for Ubuntu..."
	@./ubuntu/install.sh
	
install-fedora:
	@echo "Installing for Fedora..."
	@./fedora/install.sh

install:
	@$(MAKE) update
	@$(MAKE) install-$(OS)

init: 
	@echo "Initializing environment..."
	@./commons/init.sh

import-vscode:
	./vscode/import-vscode.sh

export-vscode:
	./vscode/export-vscode.sh
