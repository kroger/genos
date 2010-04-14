\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{declaracao-genos}
\LoadClass[12pt,oneside]{article}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[brazil]{babel}
\usepackage{graphicx}
\usepackage{multicol}
\usepackage{url}
\usepackage[a4paper,left=2.5cm,right=2.5cm,bottom=3cm,top=2cm]{geometry}
\parindent 0pt

\def\pessoa#1{\gdef\@pessoa{#1}}
\def\declaracao#1{\gdef\@declaracao{#1}}
\def\declarador#1{\gdef\@declarador{#1}}
\def\data#1{\gdef\@data{#1}}

\newcommand{\documento}{
  \thispagestyle{empty}
  \begin{multicols}{3}
    \begin{flushleft}
      \includegraphics[scale=.1]{ufbaselo}
    \end{flushleft}
    \begin{center}
      \tiny \textbf{UNIVERSIDADE FEDERAL DA BAHIA}\\ ESCOLA DE MÚSICA DA
      UFBA\\ GRUPO DE PESQUISA GENOS\\\url{http://genos.mus.br}
    \end{center}
    \begin{flushright}
      \includegraphics[scale=.1]{logomarca-genos}
    \end{flushright}
  \end{multicols}

  \vspace{2cm}

  \begin{center}
    \huge Declaração
  \end{center}

  \vspace{1cm}

    \normalsize
  \begin{flushright}
    Salvador, \@data
  \end{flushright}
  \vspace{1cm}
  Declaro para os devidos fins que \@pessoa{} \@declaracao{}.

  \vspace{2cm}
  \rule{6.5cm}{.1mm}\\\@declarador{}
}
