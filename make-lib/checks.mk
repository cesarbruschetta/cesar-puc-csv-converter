format: isort-save black-save ## Runs isort and black on save mode 

isort-save: ## Formats imports
	@poetry run isort cesar_puc_csv_converter && \
	echo 'Isort save success!\n'

black-save: ## Formats code
	@poetry run black cesar_puc_csv_converter  && \
	echo 'Black save success!\n'

check-code: format flake8 mypy ## Runs format, flake8 and mypy

checks: blank-line check-code ## Runs security checks, format, flake8 and mypy

blank-line:
	@echo

flake8: ## Runs some checks on code
	@poetry run flake8 cesar_puc_csv_converter  && \
	echo 'Flake8 check success!\n'

mypy: ## Checks python typing
	@poetry run mypy \
	    --strict cesar_puc_csv_converter  && \
	echo 'Mypy check success!\n'

checks-nosave: blank-line isort black flake8 mypy ## Runs isort and black on check mode (don't automatic format the code), flake8 and mypy

isort: ## Shows diff for correct formating imports
	@poetry run isort --recursive --diff --check-only cesar_puc_csv_converter  && \
	echo 'Isort check success!\n'

black: ## Shows diff for correct formating code
	@poetry run black --check --diff cesar_puc_csv_converter  && \
	echo 'Black check success!\n'
