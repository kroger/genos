\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{genos-technical-report}[2010/10/25]
\LoadClass[10pt,oneside]{article}

\RequirePackage[a4paper,top=2cm,left=1.5cm,right=1.5cm,bottom=2cm]{geometry}
\RequirePackage{graphicx,url}
\RequirePackage[utf8,utf8x]{inputenc}
\RequirePackage{parskip}
\usepackage[normalem]{ulem}

\def\title#1{\gdef\@title{#1}}
\def\author#1{\gdef\@author{#1}}
\def\TRyear#1{\gdef\@TRyear{#1}}
\def\TRnumber#1{\gdef\@TRnumber{#1}}

\newcommand{\titulofonte}[1]{\textsf{\textbf{\MakeUppercase#1}}\\}

\newcommand{\capa}[0]{
  \onecolumn
  \begin{center}

    \includegraphics[scale=.1]{ufbaselo} \hfill
    \Huge GENOS TECHNICAL REPORT \hfill
    \includegraphics[scale=.1]{new-genos-logo} \\
  \end{center}

  \begin{flushright}
    ISSN 123456
  \end{flushright}

  \vspace{1em}
  \hrule height .1em

  \Large Number \@TRnumber

  \begin{flushright}
    \Large
    Universidade Federal da Bahia\\
    Genos Research Group
  \end{flushright}

  \vfill

  \begin{center}
    \Huge \@title\\
    \vspace{1em}
    \large \textit{\@author}
    \vfill
    \@TRyear
  \end{center}

  \vfill

  \begin{flushright}
    \normalsize
    Av. Araújo Pinho, 58\\
    Escola de Música da UFBA\\
    40110-040 Salvador BA\\
    Brasil\\
    \vspace{.5em}
    \url{http://genos.mus.br}
  \end{flushright}

  \thispagestyle{empty}

  \pagebreak

  \date{}
  \setlength{\columnsep}{1em}
  \twocolumn
  \maketitle

  \thispagestyle{empty}
  \pagestyle{myheadings}
  \markright{Genos Technical Reports\hfill Year \@TRyear, Number
    \@TRnumber \hfill}

  \normalsize
}
