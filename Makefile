.PHONY: deps test

deps:
	pip install -r requirements.txt; \
		pip install -r test_requirements.txt

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test --verbose -s

run:
	PYTHONPATH=. FLASK_APP=hello_world flask run


docker_build:
	docker build -t hello-world-printer .

test_smoke_I:
	curl --fail 127.0.0.1:5000

test_smoke_II:
	curl -s -o /dev/null -w "%{http_code}" --fail 127.0.0.1:5000
