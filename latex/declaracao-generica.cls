\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{declaracao-generica}
\LoadClass[12pt,oneside]{article}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[brazil]{babel}
\usepackage{graphicx}
\usepackage{multicol}
\usepackage{url}
\usepackage[a4paper,left=2.5cm,right=2.5cm,bottom=3cm,top=2cm]{geometry}
\parindent 0pt

\def\declaracao#1{\gdef\@declaracao{#1}}
\def\declarador#1{\gdef\@declarador{#1}}
\def\local#1{\gdef\@local{#1}}
\def\data#1{\gdef\@data{#1}}

\newcommand{\eng}[1]{\textit{#1}}

\newcommand{\documento}{
\thispagestyle{empty}

\includegraphics[scale=.1]{ufbaselo}

\normalsize \textbf{UNIVERSIDADE FEDERAL DA BAHIA}\\ESCOLA DE MÚSICA
DA UFBA

\vspace{3cm}

\begin{center}
  \huge Declaração
\end{center}

\vspace{1cm}

\normalsize
\begin{flushright}
  \@local{}, \@data{}
\end{flushright}
\vspace{1cm}

\@declaracao{}

\vspace{2cm}

\rule{8.5cm}{.1mm}\\\@declarador{}

\end{document}
}
