all: | cv site

site:
	bundle exec jekyll build

cv: cv/*
	cd cv && $(MAKE) all
	mv cv/cv.pdf cv.pdf

