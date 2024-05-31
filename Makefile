dev:
	poetry run django-admin version

debug:
	poetry run flask --app page_analyzer:app --debug run

build:
	./build.sh

PORT ?= 8000
start:
	poetry run gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer:app

lint:
	poetry run flake8 page_analyzer

selfcheck:
	poetry check

check: selfcheck lint

install:
	poetry install

remove-envs:
	rm -rf .venv && poetry env remove --all