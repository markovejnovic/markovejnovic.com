all: cv site

dist: all
	mkdir -p dist
	cp -r _site dist
	cp Dockerfile dist

site: cv
	bundle exec jekyll build
	cp cv/cv.pdf _site

cv: cv/*
	cd cv && $(MAKE) all
	mv cv/cv.pdf cv.pdf

