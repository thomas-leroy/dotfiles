.PHONY: chmod install-mac install-ubuntu update install init import-vscode export-vscode

chmod:
	@find . -type f -name '*.sh' -exec chmod +x {} +

install-mac:
	@echo "Installing for macOS..."
	@./mac/install.sh

install-ubuntu:
	@echo "Installing for Ubuntu..."
	@./ubuntu/install.sh

update:
	@git pull origin main

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
