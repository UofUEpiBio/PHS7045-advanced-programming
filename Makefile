docker:
	docker build -t gvegayon/phs7045:latest .

push:
	docker push gvegayon/phs7045:latest

README.md: README.qmd
	quarto render README.qmd

	
