all-tests: ## Runs all tests
	@poetry run coverage run -p -m pytest -xvv cog_platform --disable-warnings --import-mode=importlib

tests: ## Runs unit tests
	@make tests-matching-cov && \
	make coverage

define run-tests-matching
@DJANGO_SETTINGS_MODULE=cog_platform.settings_test \
poetry run pytest -xvv cog_platform -k "$(k)" $(1) \
--ignore="$(i)" \
--disable-warnings \
--import-mode=importlib
endef

tests-matching: ## Runs tests matching a patter with the 'k' parameter
	$(call run-tests-matching)

tests-matching-cov: ## Runs tests matching a patter with the 'k' parameter with coverage
	$(call run-tests-matching,--cov=cog_platform --no-cov-on-fail --cov-report=)

coverage: ## Runs the coverage command
	@echo "Running coverage..." && \
	poetry run coverage report && \
	poetry run coverage xml

report-html: ## Runs the coverage report in HTML
	@echo "Running coverage report in HTML..." && \
	poetry run coverage html