docker:
	docker build -t gvegayon/phs7045:latest .

push:
	docker push gvegayon/phs7045:latest

docs/index.md: docs/index.qmd
	quarto render docs/index.qmd

	
