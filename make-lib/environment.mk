install-poetry: ## Installs poetry as user
	@pip install poetry --user

dependencies: ## Installs dev dependencies
	@poetry install --no-root

install-env-file: ## Create an .env file based on .env.example
	$(eval $(call check-var,SECRET_KEY))
	@if test -f .env; then cp .env .env.bkp && \
	echo "Warning: Backing up existing '.env' file"; fi
	@cp .env.example .env && \
	sed .env -i -r \
	-e 's/SECRET_KEY=/SECRET_KEY=$(SECRET_KEY)/g' && \
	echo "'.env' file create successfully"

lock: ## Update Locks Pipfile.lock
	@poetry lock
