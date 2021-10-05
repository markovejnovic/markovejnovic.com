.PHONY: clean clean-all

all: | build clean

build:
	pdflatex cv.tex
	pdflatex cv.tex

clean:
	rm -f cv.aux
	rm -f cv.log
	rm -f cv.out

clean-all: clean
	rm -f cv.pdf
