latex:
	latexmk -output-directory=out -aux-directory=out -pdf

upload:
	make latex
	scp out/*.pdf elrod.me:/srv/webmount/hakyll/

open:
	xdg-open out/paper.pdf

clean:
	rm -rf out

fedoradeps:
	sudo yum install `grep usepackage paper.tex | cut -d'{' -f2 | cut -d'}' -f1 | sed 's/^/texlive-/' | tr "\\n" " "` libfontenc latexmk texlive-latex-bin-bin texlive-latex-bin
