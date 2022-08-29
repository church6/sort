.PHONY: all clean

AUXFILES=*.aux *.log *.out *-pdftex.tex
AUXFILES += *.lof *.toc


SOURCE=EN_Church_ZHONG_0825_linux_awk
PDFTEX_PDF=$(SOURCE)-pdftex.pdf

OUTPUT= \
 $(PDFTEX_PDF)


# This is the default pseudo-target.
all: $(OUTPUT)

# This target typesets the LaTeX example using the pdfTeX engine.
$(PDFTEX_PDF): $(SOURCE).tex
	@echo "\033[32m enter to make $(PDFTEX_PDF) \033[0m"
	cp $(SOURCE).tex $(SOURCE)-pdftex.tex
	pdflatex -shell-escape $(SOURCE)-pdftex
#	bibtex $(SOURCE)-pdftex.aux
#	biber $(SOURCE)-pdftex.bcf
	pdflatex -shell-escape $(SOURCE)-pdftex
	pdflatex -shell-escape $(SOURCE)-pdftex
	@echo "\033[32m leave to make $(PDFTEX_PDF) \033[0m"

# This pseudo-target removes any existing auxiliary files and directories.
clean:
	@echo "\033[32menter to make clean \033[0m"
	rm -f $(AUXFILES)
	@echo "\033[32mleave to make clean \033[0m"

