NAME = tese-doutorado
TEXSRCS = corpoDoTexto.tex comandos.tex abstract.tex resumo.tex agradecimentos.tex glossario.tex referencias.bib config/ppgmus.cls
USE_PDFLATEX = 1
LATEX_ENV+=TEXINPUTS=.:tex:config:figs:
LATEX_ENV+=BIBINPUTS=.:
LATEX_ENV+=BSTINPUTS=.:config:
PDFLATEX_ENV+= $(LATEX_ENV)
GV = open

OTHER += $(LILY_PDF) $(GNUPLOT_PDF) $(SVG_PDF) $(DIA_EPS) $(EPS_PDF)
CLEAN_FILES += *.acn *.ist

LATEX_MK = config/make/latex-mk/latex-mk
include config/make/latex.mk
include config/make/latex-mk/latex.gmk

default: pdf

light-clean:
	rm -f *.acn ;\
	rm -f *.aux ;\
	rm -f *.bbl ;\
	rm -f *.blg ;\
	rm -f *.g* ;\
	rm -f *.i* ;\
	rm -f *.loa ;\
	rm -f *.lof ;\
	rm -f *.lof.old ;\
	rm -f *.log ;\
	rm -f *.lot ;\
	rm -f *.lot.old ;\
	rm -f *.out ;\
	rm -f *.toc ;\
	rm -f *.toc.old ;\
	rm -f *.xdy ;\
