BASIC = 00-matrix-algebra.md 01-efficiency.md
MEDIUM = 02-functional-programming.md
ADVANCED = 03-parallel-computing.md

README.md: $(BASIC) $(MEDIUM) $(ADVANCED)
	echo "# Example problems\n\nThe following is a list of problems for Advanced Programming.\n" > README.md && \
		echo "# Basic difficulty problems" >> README.md && \
		($(foreach fn, $(BASIC), cat $(fn) >> README.md;)) && \
		echo "# Medium difficulty problems" >> README.md && \
		($(foreach fn, $(MEDIUM), cat $(fn) >> README.md;)) && \
		echo "# Advanced difficulty problems" >> README.md && \
		($(foreach fn, $(ADVANCED), cat $(fn) >> README.md;))
