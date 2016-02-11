TEX_COMPILER=pdflatex
BIB_COMPILER=bibtex

TARGET=tamuthesis
REF_DB=references.bib
VPATH=./figs

SRC=$(wildcard *.tex)

all: $(TARGET).bbl
	$(TEX_COMPILER) $(TARGET).tex

$(TARGET).bbl: $(REF_DB) $(SRC)
	$(TEX_COMPILER) $(TARGET).tex
	$(BIB_COMPILER) $(TARGET)

run: 
	gnome-open $(TARGET).pdf

run-osx: 
	open $(TARGET).pdf

clean:
	@rm -f *.log
	@rm -f *.aux
	@rm -f *.bbl
	@rm -f *.blg
	@rm -f *.dvi
	@rm -f *.lof
	@rm -f *.lot
	@rm -f *.toc
