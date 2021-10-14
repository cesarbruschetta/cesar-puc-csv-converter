
integration-pipeline-local: poetry-check checks-nosave all-tests coverage ## Runs all steps for integrating locally or Bitbucket CI

poetry-check: safety ## Runs poetry check
	@poetry check

safety:
	@poetry run safety check --full-report -i 37894

wait:
	@sleep 20
