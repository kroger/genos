\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{programa-concerto}[2010/10/25]
\LoadClass[12pt]{book}

\RequirePackage[brazil]{babel}
\RequirePackage[a4paper,landscape,top=1.5cm,bottom=1.5cm,left=1cm,right=1cm]{geometry}
\RequirePackage{graphicx,url,ucs,multicol,setspace}
\RequirePackage[utf8,utf8x]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[pdftex]{hyperref}
\RequirePackage{parskip}

\setlength{\columnsep}{5em}
\setlength{\columnseprule}{0.3pt}

\def\texto#1{\gdef\@texto{#1}}
\def\titulo#1{\gdef\@titulo{#1}}
\def\subtitulo#1{\gdef\@subtitulo{#1}}
\def\local#1{\gdef\@local{#1}}
\def\cidade#1{\gdef\@cidade{#1}}
\def\data#1{\gdef\@data{#1}}
\def\horario#1{\gdef\@horario{#1}}
\def\organizacao#1{\gdef\@organizacao{#1}}
\def\ensemble#1{\gdef\@ensemble{#1}}
\def\obras#1{\gdef\@obras{#1}}
\def\infopecas#1{\gdef\@infopecas{#1}}
% \def\#1{\gdef\@{#1}}

\newcommand{\musicositem}[2]{\textbf{#1} --- {#2}\\}

\newcommand{\obrasitem}[5]{\textbf{#1} ({#2}) --- {#3} ({#4})\\
  {#5}\\\\
}

\newcommand{\infoitem}[2]{\textbf{#1} --- {#2}\\}

\newcommand{\capa}{
  \begin{center}
    \includegraphics[scale=.12]{ufbaselo}\\
    \vspace{1em}
    Universidade Federal da Bahia
    \vfill
    \textsc{\Large \@titulo}\\
    \vspace{1em}
    \textsc{\large \@subtitulo}\\
    \vfill
    \@local\\
    \@cidade{}, \@data\\
    \@horario\\
  \end{center}
}

\newcommand{\verso}{
  \@texto{}
  \vfill
  \@ensemble{}
  \vfill
  \textbf{Realização:}\\
  \@organizacao{}
}

\newcommand{\listaobras}{
  \textsc{\Large \@titulo}\\
  \vspace{1em}
  \textsc{\large \@subtitulo}\\
  \vspace{4em}\\
  \textbf{Programa}\\
  \vspace{1em}\\
  \@obras{}
}

\newcommand{\info}{
  \textsc{\Large \@titulo}\\
  \vspace{1em}
  \textsc{\large \@subtitulo}\\
  \vspace{4em}\\
  \@infopecas{}
}

\newcommand{\programa}[0]{
  \begin{document}

  \pagestyle{empty}
  \twocolumn

  \verso{}
  \pagebreak

  \capa{}
  \pagebreak
  \newpage

  \listaobras{}
  \pagebreak

  \info{}

\end{document}
}
