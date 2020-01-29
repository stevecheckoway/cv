# I don't like writing a Makefile for LaTeX so this is super minimal.

LATEX := pdflatex
BIBTEX := bibtex8

main := cv
source := $(wildcard *.tex)
bibs := $(wildcard *.bib)

.PHONY: all clean
all: $(main).pdf

$(main).pdf: $(source) $(bibs)
	$(LATEX) $(main)
	for bu in bu*.aux; do \
		test -f "$${bu}" && $(BIBTEX) -M 9999 "$${bu}"; \
	done
	$(LATEX) $(main)
	$(LATEX) $(main)

clean:
	$(RM) $(addprefix $(main).,aux log pdf out) $(wildcard bu*.aux) $(wildcard bu*.bbl) $(wildcard bu*.blg)
