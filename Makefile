build:
	podman build -t uofuepibio/phs7045-advanced-programming:fall2024 .

push:
	podman tag uofuepibio/phs7045-advanced-programming:fall2024 ghcr.io/uofuepibio/phs7045-advanced-programming:fall2024
	podman push ghcr.io/uofuepibio/phs7045-advanced-programming:fall2024

README.md: README.qmd
	quarto render README.qmd

all:
	for i in $$(find . -regex './[0-9].*\.qmd'); do \
		quarto render $$i; \
	done ;
