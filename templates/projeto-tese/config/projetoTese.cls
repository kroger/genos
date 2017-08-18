\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{projetoTese}

\LoadClass[12pt,oneside]{article}
\usepackage[english,brazil]{babel}
\usepackage{kchicago}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{ifthen}
\usepackage{graphicx}
\usepackage[a4paper,top=3cm,left=3cm,bottom=3cm,right=2cm]{geometry}
\usepackage{setspace}
\usepackage{subfig}
\usepackage{url}
\usepackage{color}
\usepackage{parskip}
\usepackage{multirow}
\usepackage{hhline}
\usepackage{color}
\usepackage{colortbl}



\def\titulo#1{\gdef\@titulo{#1}}
\def\autor#1{\gdef\@autor{#1}}
\def\ano#1{\gdef\@ano{#1}}
\def\tipo#1{\gdef\@tipo{#1}}

\def\area#1{\gdef\@area{#1}}
\def\lugar#1{\gdef\@lugar{#1}}
\def\orientador#1{\gdef\@orientador{#1}}


\newcommand{\titulofonte}[1]{\textsf{\textbf{\MakeUppercase#1}}\\}

\newenvironment{dadosTese}
 {\list{}{\setlength{\leftmargin}{6cm}}
 \item\relax}
 {\endlist}

\newcommand{\capa}{
  \thispagestyle{empty}
  \begin{center}
    \large
    \thispagestyle{empty}
    \includegraphics[scale=0.1]{ufbaselo}\\
    \titulofonte{UNIVERSIDADE FEDERAL DA BAHIA}
    \titulofonte{ESCOLA DE MÚSICA}
    \titulofonte{PROGRAMA DE PÓS-GRADUAÇÃO EM MÚSICA}
    \vspace{5cm}
    \titulofonte{\@titulo}
    \vspace{3cm}
    \titulofonte{\@autor}

  \end{center}
  \vspace{4cm}
  \begin{dadosTese}
    Projeto de \ifthenelse{\equal{\@tipo}{doutorado}}{tese}{dissertação}
    apresentado ao Programa de Pós-graduação em Música, Escola de
    Música, Universidade Federal da Bahia.\\
    Área de concentração: \@area\par
    \vspace{1cm}
    Orientador: \@orientador
  \end{dadosTese}
  \vfill
  \begin{center}
    \textsf{Salvador} \par \textsf{\@ano} \par
  \end{center}
  \newpage
}

\renewcommand{\maketitle}{
  \capa
}

\addto{\captionsbrazil}{\renewcommand{\refname}{Bibliografia}}

%% Comandos pessoais

%% Usar para termos estrangeiros
\newcommand{\eng}[1]{\textit{#1}}

%% Usar para tabela com cronograma
\newcommand{\ok}{
  \multicolumn{1}{>{\columncolor[gray]{.6}}c}{}
}

%% Comando para citação integral indentada com tradução.
%% Exemplo de uso:
%% \citacaolonga{Meu texto em português no corpo do texto}
%% {My text in english in the text body}
%% {\cite{mycitation}}
\newcommand{\citacaolonga}[3]{
  \begin{quote}
    \normalsize
   \selectlanguage{english}
    {#1}\footnote{
      \selectlanguage{brazil}
      ``{#2}''.
    } \selectlanguage{brazil} #3.
  \end{quote}
}

%% Comando para citação integral inline com tradução.
%% Exemplo de uso:
%% \citacaoinline{Meu texto em português no corpo do texto}
%% {My text in english in the text body}
%% {\cite{mycitation}}
\newcommand{\citacaoinline}[3]{
  ``#1''\footnote{
    \selectlanguage{brazil}
    ``{#2}''.} \selectlanguage{brazil} #3.
}
