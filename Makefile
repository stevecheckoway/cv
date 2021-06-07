# This just runs latexmk

main := cv
source := $(wildcard *.tex)
bibs := $(wildcard *.bib)

.PHONY: all clean
all: $(main).pdf

$(main).pdf: $(source) $(bibs)
	latexmk $(main)

clean:
	latexmk -C $(main)
