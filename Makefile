PACKAGE := "markovejnovic.com"

make_temp:
	$(eval TMP := $(shell mktemp -d))
	mkdir $(TMP)/$(PACKAGE)

rm_temp:
	rm -rf $(TMP)

build_extras:
	make -C extras
