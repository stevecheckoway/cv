# This just runs latexmk

main := cv
source := $(wildcard *.tex)
bibs := $(wildcard *.bib)

.PHONY: all clean
all: $(main).pdf

$(main).pdf: $(source) $(bibs)
	latexmk -pdf $(main)

clean:
	latexmk -pdf -C $(main)
