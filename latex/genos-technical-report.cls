\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{genos-technical-report}[2010/10/25]
\LoadClass[10pt,oneside]{article}

\RequirePackage[a4paper,top=2cm,left=1.5cm,right=1.5cm,bottom=2cm]{geometry}
\RequirePackage{graphicx,url}
\RequirePackage[utf8,utf8x]{inputenc}
\RequirePackage{parskip}
\usepackage[normalem]{ulem}

\newcounter{instn}
\setcounter{instn}{1}
\newcommand{\instnum}{\arabic{instn}}
\newcommand{\inst}[1]{\ensuremath{^{#1}}}
\newcommand{\nextinstitute}{\\\mbox{}\\[-6pt] \addtocounter{instn}{1}\inst{\instnum}}
\newcommand{\email}[1]{\\\mbox{}\\[-6pt]\footnotesize\texttt{#1}}
\renewcommand{\and}{, }

\def\title#1{\gdef\@title{#1}}
\def\author#1{\gdef\@author{#1}}
\def\address#1{\gdef\@address{#1}}

\def\TRyear#1{\gdef\@TRyear{#1}}
\def\TRnumber#1{\gdef\@TRnumber{#1}}

\def\@maketitle{\newpage
  \begin{center}
    \vspace*{2em}
    {\huge\bf\@title\par}
    \vglue 6pt plus 3pt minus 3pt
    {\normalsize
      \textbf{\begin{tabular}[t]{c}\@author\end{tabular}}\par}
    \vglue 6pt plus 3pt minus 3pt
    {\normalsize
      \begin{tabular}[t]{c}\inst{\instnum}\@address\end{tabular}\par}
    \vglue 6pt plus 3pt minus 3pt
  \end{center}
  \vspace*{3em}
}

\newcommand{\titulofonte}[1]{\textsf{\textbf{\MakeUppercase#1}}\\}

\newcommand{\cover}[0]{
  \onecolumn
  \begin{center}
    \includegraphics[scale=.1]{ufbaselo} \hfill
    \Huge GENOS TECHNICAL REPORT \hfill
    \includegraphics[scale=.115]{new-genos-logo} \\
  \end{center}

  \begin{flushright}
    ISSN [in progress]
  \end{flushright}

  \vspace{1em}
  \hrule height .1em

  \begin{center}
    \Large Number \@TRnumber, \@TRyear
    \hfill
    \Large
    Universidade Federal da Bahia
  \end{center}

  \begin{flushright}
    \Large
    Genos Research Group
  \end{flushright}

  \vfill

  \begin{center}
    \Huge \@title\\
    \vspace{1em}
    \large \textit{\@author}
  \end{center}

  \vfill
  \vspace{10em}

  \begin{flushright}
    \normalsize
    Av. Araújo Pinho, 58\\
    Escola de Música da UFBA\\
    40110-040 Salvador BA Brazil\\
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
  \markright{Genos Technical Reports\hfill Number
    \@TRnumber, \@TRyear \hfill}

  \normalsize
}
