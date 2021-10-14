install-poetry: ## Installs poetry as user
	@pip install poetry --user

dependencies: ## Installs dev dependencies
	@poetry install --no-root

lock: ## Update Locks Pipfile.lock
	@poetry lock
