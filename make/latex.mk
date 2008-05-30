LILYDIR = lily
FIGSDIR = figs
DATADIR = data

OTHER_PNG1= $(patsubst %.dia,%.png,$(wildcard $(FIGSDIR)/*.dia))
OTHER_EPS1= $(patsubst %.dia,%.eps,$(wildcard $(FIGSDIR)/*.dia))
OTHER_EPS2= $(patsubst %.svg,%.eps,$(wildcard $(FIGSDIR)/*.svg))
OTHER_EPS3= $(patsubst %.plot,%.eps,$(wildcard $(DATADIR)/*.plot))

#LILY_EPS4= $(patsubst %.ly,%.eps,$(wildcard $(LILYDIR)/*.ly))
#LILY_PNG2= $(patsubst %.ly,%.png,$(wildcard $(LILYDIR)/*.ly))
#LILY_PS1 = $(patsubst %.ly,%.ps,$(wildcard $(LILYDIR)/*.ly))
#LILY_PDF1= $(patsubst %.ly,%.pdf,$(wildcard $(LILYDIR)/*.ly))
#LILY_SVG1= $(patsubst %.ly,%.svg,$(wildcard $(LILYDIR)/*.ly))

#OTHER += $(LILY_EPS4) $(LILY_PNG2) $(LILY_PS1) $(LILY_PDF1) $(LILY_SVG1)

OTHER += $(OTHER_EPS1) $(OTHER_EPS2) $(OTHER_EPS3) $(OTHER_PNG1) 

CLEAN_FILES+= $(OTHER_EPS3:.plot=.eps)
CLEAN_FILES+= $(OTHER_EPS2:.svg=.eps)
CLEAN_FILES+= $(OTHER_EPS1:.dia=.eps)
CLEAN_FILES+= $(OTHER_PNG1:.dia=.png)
CLEAN_FILES+= $(LILY_EPS4:.ly=.eps)
CLEAN_FILES+= $(LILY_PNG2:.ly=.png)
CLEAN_FILES+= $(LILY_PS1:.ly=.ps)
CLEAN_FILES+= $(LILY_PDF1:.ly=.pdf)
CLEAN_FILES+= $(LILY_SVG1:.ly=.svg)

LATEX_ENV+= BIBINPUTS=~/bib/:
LATEX_ENV+= BSTINPUTS=~/lib/latex/bib/:bib:
LATEX_ENV+= TEXINPUTS=~/lib/latex//:~/lib/emacs/bbdb/tex/:~/lib/license//:src:config:

vpath %.eps $(FIGSDIR)
vpath %.eps $(DATADIR)
vpath %.ly $(LILYDIR)

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

%.png: %.ly
	lilypond --png -o  $(basename $@) $<

%.eps: %.ly
	lilypond -b eps -o  $(basename $@) $<

%.ps: %.ly
	lilypond -f ps -o  $(basename $@) $<

%.pdf: %.ly
	lilypond --pdf -o  $(basename $@) $<

%.svg: %.ly
	lilypond -b svg -o  $(basename $@) $<

-include /usr/share/latex-mk/latex.gmk
