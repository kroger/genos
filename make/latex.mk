FIGSDIR = figs
DATADIR = data

OTHER_PNG= $(patsubst %.dia,%.png,$(wildcard $(FIGSDIR)/*.dia))
OTHER_EPS1= $(patsubst %.dia,%.eps,$(wildcard $(FIGSDIR)/*.dia))
OTHER_EPS2= $(patsubst %.svg,%.eps,$(wildcard $(FIGSDIR)/*.svg))
OTHER_EPS3= $(patsubst %.plot,%.eps,$(wildcard $(DATADIR)/*.plot))
OTHER += $(OTHER_EPS1) $(OTHER_EPS2) $(OTHER_EPS3) $(OTHER_PNG)
CLEAN_FILES+= $(OTHER_EPS1:.plot=.eps)
CLEAN_FILES+= $(OTHER_EPS2:.svg=.eps)
CLEAN_FILES+= $(OTHER_PNG:.dia=.eps)


LATEX_ENV+= BIBINPUTS=~/bib/:
LATEX_ENV+= BSTINPUTS=~/lib/latex/bib/:bib:
LATEX_ENV+= TEXINPUTS=~/lib/latex//:~/lib/emacs/bbdb/tex/:~/lib/license//:src:config:

vpath %.eps figs

#BIBTEXSRCS = 
#USE_HEVEA = 1
#USE_LATEX2HTML = 1
#USE_PDFLATEX = 1
#USE_TEX2PAGE = 1
USE_DVIPDFM = 1

doc: pdf

%.html: %.tex
	htlatex $<

%.txt:  %.html
	lynx -dump $< > $@

%.eps: %.plot %.dat
	gnuplot $<

%.eps: %.svg
	inkscape -T --export-eps=$@ $<

%.eps: %.dia
	dia --export=$@ $<

%.png: %.dia
	dia --export=$@ $<

-include /usr/share/latex-mk/latex.gmk
