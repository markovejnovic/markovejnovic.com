.PHONY: clean clean-all

all: | build clean

build:
	lualatex cv.tex
	lualatex cv.tex

clean:
	rm -f cv.aux
	rm -f cv.log
	rm -f cv.out
	mv cv.pdf Resume_MarkoVejnovic.pdf

clean-all: clean
	rm -f cv.pdf Resume_MarkoVejnovic.pdf
