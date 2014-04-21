latex:
	latexmk -output-directory=out -aux-directory=out -pdf

upload:
	make latex
	scp out/*.pdf elrod.me:/srv/webmount/hakyll/

open:
	xdg-open out/paper.pdf

clean:
	rm -rf out
