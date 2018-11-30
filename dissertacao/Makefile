FILE=dissertacao
TEMP_FILE_EXTENSIONS=log aux lol lof loc soc lot bit idx glo bbl brf nlo nls ilg toc ind out blg synctex.gz snm nav dvi tdo thm spl
all: clean build

build: 
	make pdf 
	make bib 
	make pdf 
	make index 
	make pdf

pdf:
	pdflatex -file-line-error -synctex=1 -interaction=nonstopmode "$(FILE).tex" | grep ".*:[0-9]*:.*" || true

bib:
	bibtex "$(FILE).aux" || true

index:
	makeindex "$(FILE).nlo" -s nomencl.ist -o "$(FILE).nls" > /dev/null 2>&1 || true
	
clean:
	$(foreach ext,$(TEMP_FILE_EXTENSIONS),rm -rf *.$(ext);)

wordcount:
	texcount -sum -total *.tex

#aliases for the "wordcount" target
wordscount: wordcount
wc: wordcount