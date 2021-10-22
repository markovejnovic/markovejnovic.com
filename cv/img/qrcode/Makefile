default: generate_webqr

generate_contactqr: marko_vejnovic.vcf
	cat marko_vejnovic.vcf \
	| qrencode -l L -t PNG --output=- -m 0 -s 2.5 \
	> contact.png

generate_webqr:
	echo 'https://markovejnovic.com' \
		| qrencode -l H -t PNG --output=- -m 0 -s 2.5 \
		> contact.png
