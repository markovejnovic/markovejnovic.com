# markovejnovic.com

## What is this?

This suite is a set of `gnu-make` rules which compile my website.

## The Philosophy

This website's philosophy resembles that of
[suckless](https://suckless.org/philosophy/). In brief, this website is intended
to be:

* Simple
* Fast
* Usable

### The Requirements

The website should be renderable and easily usable on all of the following:

* Firefox
* Chromium
* Webkit
* Terminal-based browsers (lynx)
* Mobile devices

Furthermore, the website must be readable in less than 80 columns in raw HTML.

## The Implementation

To minimize the amount of code written, all webpages are writable in `markdown`.

The folder structure is to be as follows:
```
── src/
   ├── group1/
   │   └── page1.md
   ├── group2/
   │   └── page1.md
   └── about.md
── public/
```

The build system will automatically populate `public/` based off `src/`. The
website you can expect for the previous example is:
```
── public/
   ├── group1/
   │   └── page1.md
   ├── group2/
   │   └── page1.md
   └── about.md
```

## Compiling

### Dependencies

You need:
* `gnu make`
* `pandoc`
* `curl`
* `jq`
* `sed`
