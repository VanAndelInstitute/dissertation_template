all: diss

diss:
	latexmk -interaction=nonstopmode -pdf -lualatex -jobname=dissertation dissertation.tex

clean:
	rm -f *.aux *.log *.out *.bbl *.blg *.fls *.dvi *.toc *.bcf* *.lof *.run* *.fdb_latexmk *.pdf
	rm -f *.acn *.acr *.alg *.glg *.glo *.gls *.glsdefs *.ist *.lot
	rm -f *-SAVE-ERROR

.PHONY: clean
