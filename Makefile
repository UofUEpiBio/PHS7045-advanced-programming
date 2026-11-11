build:
	podman build -t uofuepibio/phs7045-advanced-programming:fall2024 .

push:
	podman tag uofuepibio/phs7045-advanced-programming:fall2024 ghcr.io/uofuepibio/phs7045-advanced-programming:fall2024
	podman push ghcr.io/uofuepibio/phs7045-advanced-programming:fall2024

README.md: README.qmd
	quarto render README.qmd

book:
	quarto render

all:
	for i in $$(find . -regex './[0-9].*\.qmd'); do \
		quarto render $$i; \
	done ;

# Zip of the Lab 11 files students download (rebuild after changing 11-simpi/scripts/)
11-simpi/lab11.zip: $(wildcard 11-simpi/scripts/* 11-simpi/scripts/buggy/*)
	rm -rf 11-simpi/lab11 $@
	mkdir 11-simpi/lab11
	cp -R 11-simpi/scripts/. 11-simpi/lab11/
	find 11-simpi/lab11 -name '.DS_Store' -delete
	cd 11-simpi && zip -rqX lab11.zip lab11
	rm -rf 11-simpi/lab11
