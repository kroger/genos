# Seja bem vindo ao latex.mk do grupo de pesquisa genos.
# 
# Esse arquivo é o resultado de anos de frustração com o funcionamento
# padrão do make e do latex-mk. O objetivo é poder, incluindo esse
# arquivo no seu Makefile, compilar arquivos latex automaticamente,
# sem maiores confusões. Pra isso funcionar, no entanto, precisamos de
# algumas convenções e suposições sobre seu computador, senão as
# coisas podem explodir de maneiras desagradáveis (não pergunte ;-) ).
#
# A primeira é que você está trabalhando com o seu latex organizado de
# forma razoavelmente bonitinha. Esperamos uma estrutura de diretórios
# mais ou menos assim:
#
# <projeto>/              <- o nome do seu projeto
# <projeto>/<arquivo>.tex <- o seu arquivo tex
# <projeto>/figs          <- as suas figuras estáticas
# <projeto>/data          <- arquivos .plot e .dat pro gnuplot
# <projeto>/lily          <- arquivos lilypond
# ~/lib                   <- essa biblioteca
# ~/bib                   <- a bibliografia do genos
#
# Para um projeto que use todos esses componentes, o Makefile
# recomendado, <projeto>/Makefile é:
#  
#   NAME = <arquivo>
#   USE_PDFLATEX = 1
#   VIEWPDF = evince
#   # OTHER += $(LILY_PDF) # descomente se usar lilyponds
#   # OTHER += $(GNUPLOY_PDF) # descomente se usar gnuplot
#   # OTHER += $(SVG_PDF) # descomente se usar imagens svg
#   # OTHER += $(DIA_PNG) # descomente se usar diagramas dia
#   -include ~/lib/make/latex.mk # esse arquivo
#   -include ~/repositorios/genos-repos/lib/make/latex.mk # no pc de marcos
#
# E pronto!
# 
# Com isso feito, o seu artigo latex será compilado pra pdf com
# "make", será mostrado no evince com "make view", arquivos do gnuplot
# serão plotados em pdf, diagramas svg serão convertidos para pdf,
# diagramas dia serão convertidos pra png e o mundo viverá para sempre
# de mãos dadas em um gramado infinito, e todo dia será natal (bom,
# esses dois últimos são exagero, mas você entende).
#
# Caso tenha alguma dúvida, mande email para genos-users@listas.genos.mus.br
#
# Para ajudar, se quiser converter arquivos FOO em BAR antes de
# incluir no seu artigo, coloque a linha OTHER += $(FOO_BAR) no seu
# Makefile. Se ela não existir aqui, adicione!
#

LILYDIR = lily
FIGSDIR = figs
DATADIR = data

DIA_PNG= $(patsubst %.dia,%.png,$(wildcard $(FIGSDIR)/*.dia))
DIA_EPS= $(patsubst %.dia,%.eps,$(wildcard $(FIGSDIR)/*.dia))
CLEAN_FILES+= $(DIA_EPS:.dia=.eps)
CLEAN_FILES+= $(DIA_PNG:.dia=.png)

PNG_EPS= $(patsubst %.png,%.eps,$(wildcard $(FIGSDIR)/*.png))
PNG_PDF= $(patsubst %.png,%.pdf,$(wildcard $(FIGSDIR)/*.png))
CLEAN_FILES+= $(PNG_EPS:.plot=.eps)
CLEAN_FILES+= $(PNG_PDF:.plot=.pdf)

EPS_PDF= $(patsubst %.eps,%.pdf,$(wildcard $(FIGSDIR)/*.eps))
CLEAN_FILES+= $(PNG_PDF:.plot=.pdf)

GNUPLOT_PDF= $(patsubst %.plot,%.pdf,$(wildcard $(DATADIR)/*.plot))
GNUPLOT_EPS= $(patsubst %.plot,%.eps,$(wildcard $(DATADIR)/*.plot))
CLEAN_FILES+= $(GNUPLOT_PDF:.plot=.pdf)
CLEAN_FILES+= $(GNUPLOT_EPS:.plot=.eps)

LILY_EPS= $(patsubst %.ly,%.eps,$(wildcard $(LILYDIR)/*.ly))
LILY_PNG= $(patsubst %.ly,%.png,$(wildcard $(LILYDIR)/*.ly))
LILY_PS = $(patsubst %.ly,%.ps,$(wildcard $(LILYDIR)/*.ly))
LILY_PDF= $(patsubst %.ly,%.pdf,$(wildcard $(LILYDIR)/*.ly))
LILY_SVG= $(patsubst %.ly,%.svg,$(wildcard $(LILYDIR)/*.ly))
LILY_WAV= $(patsubst %.ly,%.wav,$(wildcard $(LILYDIR)/*.ly))
CLEAN_FILES+= $(LILY_EPS:.ly=.eps)
CLEAN_FILES+= $(LILY_PNG:.ly=.png)
CLEAN_FILES+= $(LILY_PS:.ly=.ps)
CLEAN_FILES+= $(LILY_PDF:.ly=.pdf)
CLEAN_FILES+= $(LILY_PDF:.ly=.wav)

TXT_HTML= $(patsubst %.txt,%.html,$(wildcard *.txt))
CLEAN_FILES+= $(TXT_HTML:.txt=.html)

SVG_PNG= $(patsubst %.svg,%.png,$(wildcard $(FIGSDIR)/*.svg))
SVG_PDF = $(patsubst %.svg,%.pdf,$(wildcard $(FIGSDIR)/*.svg))
SVG_EPS= $(patsubst %.svg,%.eps,$(wildcard $(FIGSDIR)/*.svg))
CLEAN_FILES+= $(SVG_PNG:.svg=.pdf)
CLEAN_FILES+= $(SVG_PDF:.svg=.png)
CLEAN_FILES+= $(SVG_EPS:.svg=.eps)

CLEAN_BEAMER = .nav .snm .vrb
CLEAN_FILES+= $(foreach suffix,$(CLEAN_BEAMER),$(addsuffix $(suffix),$(NAME)))

LATEX_ENV+= TEXINPUTS=:src:config:figs:data:lily:out:$(TEXINPUTS):

vpath %.eps $(FIGSDIR)
vpath %.eps $(DATADIR)
vpath %.ly $(LILYDIR)
vpath %.svg $(FIGSDIR)

#BIBTEXSRCS = 
#USE_HEVEA = 1
#USE_LATEX2HTML = 1
#USE_PDFLATEX = 1
#USE_TEX2PAGE = 1
#USE_DVIPDFM = 1
#VIEWPDF

doc: pdf

%.html: %.tex
	htlatex $<

%.pdf: %.eps
	epstopdf $<

%.txt:  %.html
	lynx -dump $< > $@

%.eps: %.plot %.dat
	gnuplot $<

%.pdf: %.plot %.dat
	gnuplot $<
	epstopdf --outfile=$@ $(patsubst %.plot,%.eps, $<)

%.eps: %.svg
	inkscape -T --export-eps=$@ $<

%.png: %.svg
	inkscape -T --export-area-drawing --export-png=$@ $<

%.pdf: %.svg
	inkscape -T --export-area-snap --export-pdf=$@ $<

%.pdf: %.plot
	gnuplot $<
	convert $(subst plot,eps, $<) $@

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

%.wav: %.midi
	timidity -Ow $<

%.wav: %.mid
	timidity -Ow $<
