LILYDIR = lily
FIGSDIR = figs
DATADIR = data

OTHER_PNG1= $(patsubst %.dia,%.png,$(wildcard $(FIGSDIR)/*.dia))
OTHER_EPS1= $(patsubst %.dia,%.eps,$(wildcard $(FIGSDIR)/*.dia))
OTHER_EPS2= $(patsubst %.svg,%.eps,$(wildcard $(FIGSDIR)/*.svg))
OTHER_EPS3= $(patsubst %.plot,%.eps,$(wildcard $(DATADIR)/*.plot))

LILY_EPS= $(patsubst %.ly,%.eps,$(wildcard $(LILYDIR)/*.ly))
LILY_PNG= $(patsubst %.ly,%.png,$(wildcard $(LILYDIR)/*.ly))
LILY_PS = $(patsubst %.ly,%.ps,$(wildcard $(LILYDIR)/*.ly))
LILY_PDF= $(patsubst %.ly,%.pdf,$(wildcard $(LILYDIR)/*.ly))
LILY_SVG= $(patsubst %.ly,%.svg,$(wildcard $(LILYDIR)/*.ly))
OTHER_PNG2= $(patsubst %.svg,%.png,$(wildcard $(FIGSDIR)/*.svg))

INKSCAPE_PDF = $(patsubst %.svg,%.pdf,$(wildcard $(FIGSDIR)/*.svg))

#OTHER += $(LILY_EPS) $(LILY_PNG) $(LILY_PS) $(LILY_PDF) $(LILY_SVG) $(OTHER_PNG2) 

OTHER += $(OTHER_EPS1) $(OTHER_EPS2) $(OTHER_EPS3) $(OTHER_PNG1) 

CLEAN_FILES+= $(OTHER_EPS3:.plot=.eps)
CLEAN_FILES+= $(OTHER_EPS2:.svg=.eps)
CLEAN_FILES+= $(OTHER_EPS1:.dia=.eps)
CLEAN_FILES+= $(OTHER_PNG1:.dia=.png)
CLEAN_FILES+= $(LILY_EPS:.ly=.eps)
CLEAN_FILES+= $(LILY_PNG:.ly=.png)
CLEAN_FILES+= $(LILY_PS:.ly=.ps)
CLEAN_FILES+= $(LILY_PDF:.ly=.pdf)
CLEAN_FILES+= $(LILY_SVG:.ly=.svg)

LATEX_ENV+= BIBINPUTS=~/bib/:$(BIBINPUTS):
LATEX_ENV+= BSTINPUTS=~/lib/latex/bib/:bib:$(BSTINPUTS):
LATEX_ENV+= TEXINPUTS=~/lib/latex//:~/lib/emacs/bbdb/tex/:~/lib/license//:src:config:figs:data:lily:out:$(TEXINPUTS):

vpath %.eps $(FIGSDIR)
vpath %.eps $(DATADIR)
vpath %.ly $(LILYDIR)

#BIBTEXSRCS = 
#USE_HEVEA = 1
#USE_LATEX2HTML = 1
#USE_PDFLATEX = 1
#USE_TEX2PAGE = 1
#USE_DVIPDFM = 1

doc: pdf

%.html: %.tex
	htlatex $<

%.txt:  %.html
	lynx -dump $< > $@

%.eps: %.plot %.dat
	gnuplot $<

%.eps: %.svg
	inkscape -T --export-eps=$@ $<

%.png: %.svg
	inkscape -T --export-area-drawing --export-png=$@ $<

%.pdf: %.svg
	inkscape -T --export-area-snap --export-pdf=$@ $<

%.eps: %.dia
	dia --export=$@ $<

%.eps: %.png
	convert $< $@

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
