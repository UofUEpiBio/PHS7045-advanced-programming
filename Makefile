docker:
	docker build -t gvegayon/phs7045:latest .

push:
	docker push gvegayon/phs7045:latest

docs/README.md: docs/README.qmd
	quarto render docs/README.qmd

	