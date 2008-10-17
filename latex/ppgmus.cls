\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ppgmus}

\LoadClass[12pt,oneside]{book}
\usepackage[brazil]{babel}
\usepackage{graphicx}
\usepackage[utf8x]{inputenc}
\usepackage[a4paper,top=3cm,left=3cm,bottom=3cm,right=2cm]{geometry}
\usepackage{times}
\usepackage{ifthen}
\usepackage{fancyhdr} 
\usepackage{setspace}
\usepackage{url}
\usepackage{subfig}
\usepackage{color}
\usepackage{colortbl}

%\setlength\parskip{\smallskipamount}
%\setlength\parindent{0cm}

\setlength\parskip{\medskipamount}

\pagestyle{fancy}                       % Sets fancy header and footer
\renewcommand{\chaptermark}[1]{%         % Lower Case Chapter marker style
  \markboth{\thechapter.\ #1}{.}} %
\renewcommand{\sectionmark}[1]{%         % Lower case Section marker style
  \markright{\thesection.\ #1}}         %
\fancyhead[LE,RO]{\thepage}    % Page number (boldface) in left on even
                                % pages and right on odd pages
\fancyhead[LO]{}      % Chapter in the right on even pages
\fancyhead[RE]{}     % Section in the left on odd pages
\fancyfoot{}     % Section in the left on odd pages
\renewcommand{\headrulewidth}{0.0pt}    % Width of head rule

\newcommand{\texto}{
Texto texto texto texto texto texto texto texto texto texto texto
texto texto texto texto texto texto texto texto texto texto texto
texto texto texto texto texto texto texto texto texto texto texto
texto texto texto texto texto texto texto texto texto texto texto
texto texto texto texto texto texto texto texto texto texto texto
texto texto texto texto texto texto texto texto texto texto texto
texto texto texto texto texto texto texto texto texto texto texto
texto texto texto texto texto texto texto texto texto texto texto
texto texto texto texto texto texto texto texto texto texto texto
texto texto texto texto texto texto texto texto texto texto texto
texto texto texto texto 
}

\def\titulo#1{\gdef\@titulo{#1}}
\def\autor#1{\gdef\@autor{#1}}
\def\ano#1{\gdef\@ano{#1}}
\def\tipo#1{\gdef\@tipo{#1}}
\def\area#1{\gdef\@area{#1}}
\def\lugar#1{\gdef\@lugar{#1}}
\def\orientador#1{\gdef\@orientador{#1}}
\def\mes#1{\gdef\@mes{#1}}
\def\localDefesa#1{\gdef\@localDefesa{#1}}
\def\dataDefesa#1{\gdef\@dataDefesa{#1}}

\def\bancaiNome#1{\gdef\@bancaiNome{#1}}
\def\bancaiTitulo#1{\gdef\@bancaiTitulo{#1}}
\def\bancaiEstudo#1{\gdef\@bancaiEstudo{#1}}
\def\bancaiAtuacao#1{\gdef\@bancaiAtuacao{#1}}

\def\bancaiiNome#1{\gdef\@bancaiiNome{#1}}
\def\bancaiiTitulo#1{\gdef\@bancaiiTitulo{#1}}
\def\bancaiiEstudo#1{\gdef\@bancaiiEstudo{#1}}
\def\bancaiiAtuacao#1{\gdef\@bancaiiAtuacao{#1}}

\def\bancaiiiNome#1{\gdef\@bancaiiiNome{#1}}
\def\bancaiiiTitulo#1{\gdef\@bancaiiiTitulo{#1}}
\def\bancaiiiEstudo#1{\gdef\@bancaiiiEstudo{#1}}
\def\bancaiiiAtuacao#1{\gdef\@bancaiiiAtuacao{#1}}

\def\bancaivNome#1{\gdef\@bancaivNome{#1}}
\def\bancaivTitulo#1{\gdef\@bancaivTitulo{#1}}
\def\bancaivEstudo#1{\gdef\@bancaivEstudo{#1}}
\def\bancaivAtuacao#1{\gdef\@bancaivAtuacao{#1}}

\def\bancavNome#1{\gdef\@bancavNome{#1}}
\def\bancavTitulo#1{\gdef\@bancavTitulo{#1}}
\def\bancavEstudo#1{\gdef\@bancavEstudo{#1}}
\def\bancavAtuacao#1{\gdef\@bancavAtuacao{#1}}

\def\textoDedicatoria#1{\gdef\@textoDedicatoria{#1}}
\def\textoEpigrafe#1{\gdef\@textoEpigrafe{#1}}
\def\autorEpigrafe#1{\gdef\@autorEpigrafe{#1}}

\newcommand{\titulofonte}[1]{\textsf{\textbf{\MakeUppercase#1}}\\}

\newcommand{\capa}{
  \begin{center}
    \large
    \thispagestyle{empty}
    \includegraphics[scale=0.1]{ufbaselo}\\
    \titulofonte{UNIVERSIDADE FEDERAL DA BAHIA}
    \titulofonte{ESCOLA DE MÚSICA}
    \titulofonte{PROGRAMA DE PÓS-GRADUAÇÃO EM MÚSICA}
    \vfill
    \titulofonte{\@titulo}
    \vfill
    \titulofonte{\@autor}
    \vfill
    \textsf{\@lugar} \par \textsf{\@ano} \par
  \end{center} \par
  \newpage
}

 \newenvironment{dadosTese}
 {\list{}{\setlength{\leftmargin}{6cm}}
 \item\relax}
 {\endlist}

\newcommand{\folhaDeRosto}{
  \pagenumbering{roman}
  \setcounter{page}{1}

  \thispagestyle{empty}
  \begin{center}
    \large
    \titulofonte{\@autor}
    \vspace{8cm}
    \titulofonte{\@titulo}
  \end{center}
  \vspace{4cm}
  \begin{dadosTese}
    \ifthenelse{\equal{\@tipo}{doutorado}}{Tese}{Dissertação}
    apresentada ao Programa de Pós-graduação em Música, Escola de
    Música, Universidade Federal da Bahia, como requisito parcial
    para obtenção do grau de
    \ifthenelse{\equal{\@tipo}{doutorado}}{Doutor}{Mestre} em Música.\\
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

\newcommand{\fichaCatalografica}{
  \thispagestyle{empty}
  [ficha catalográfica]
  \newpage
}

\newcommand{\termoDeAprovacao}{
  \thispagestyle{empty}
  \begin{center}
    \large
    \titulofonte{TERMO DE APROVAÇÃO}
    \vspace{1cm}
    \titulofonte{\@autor}
    \vspace{1cm}
    \titulofonte{\@titulo}
    \vspace{2cm}

    \begin{minipage}{.8\linewidth}
      \ifthenelse{\equal{\@tipo}{doutorado}}{Tese}{Dissertação} aprovada
      como requesito parcial para a obteção do grau de
      \ifthenelse{\equal{\@tipo}{doutorado}}{Doutor}{Mestre} em Música,
      Universidade Federal da Bahia, pela seguinte banca examinadora:
    \end{minipage}
    \vspace{2cm}
  \end{center}

  \banca{\@bancaiNome}{\@bancaiTitulo, \@bancaiEstudo}{\@bancaiAtuacao}
  \vspace{.5cm}
  \banca{\@bancaiiNome}{\@bancaiiTitulo, \@bancaiiEstudo}{\@bancaiiAtuacao}
  \vspace{.5cm}
  \banca{\@bancaiiiNome}{\@bancaiiiTitulo, \@bancaiiiEstudo}{\@bancaiiiAtuacao}
  \ifthenelse{\equal{\@tipo}{doutorado}}{
    \vspace{.5cm}
    \banca{\@bancaivNome}{\@bancaivTitulo, \@bancaivEstudo}{\@bancaivAtuacao}
    \vspace{.5cm}
    \banca{\@bancavNome}{\@bancavTitulo, \@bancavEstudo}{\@bancavAtuacao}
  }{}

  \vfill
  \begin{center}
    \@localDefesa, \@dataDefesa
  \end{center}
  \newpage
}

\newcommand{\banca}[3]{
  \setlength\parindent{0em}
  #1 \hrulefill \\
  #2 \\
  #3 \par
  \setlength\parindent{1em}
}

\newcommand{\folhaDeGuarda}{
  \thispagestyle{empty}
  ~
  \vfill
  \begin{center}
    \copyright{} Copyright by \\
    \@autor \\
    \@mes, \@ano
  \end{center}
  \newpage
}

\newcommand{\dedicatoria}{
  \thispagestyle{empty}
  ~
  \vspace*{3cm}
  \hfill\@textoDedicatoria
  \newpage
}

\newcommand{\epigrafe}{
  \thispagestyle{empty}
  ~
  \vfill
  \begin{flushright}
    \begin{minipage}{.8\linewidth}
      \@textoEpigrafe
    \end{minipage}
  \end{flushright}
  \ifdefined\@autorEpigrafe\hfill \@autorEpigrafe\fi
  \newpage
}

\renewcommand{\maketitle}{
  \capa
  \folhaDeRosto
  \fichaCatalografica
  \folhaDeGuarda
  \ifdefined\@bancaiNome\termoDeAprovacao\fi
  \ifdefined\@textoDedicatoria\dedicatoria\fi
  \ifdefined\@textoEpigrafe\epigrafe\fi
}

\renewcommand\frontmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \singlespacing
  \pagenumbering{roman}}

\renewcommand\mainmatter{%
    \cleardoublepage
  \@mainmattertrue
  \doublespacing
  \setlength\parindent{1em}
  \pagenumbering{arabic}}

\renewcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \singlespacing
  \setlength\parindent{0em}
  \@mainmatterfalse}

\makeatletter

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi
                    \thispagestyle{empty}
                  }
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \addcontentsline{toc}{chapter}{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                   \@afterheading
                 \fi}

\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}
  \addcontentsline{toc}{chapter}{\appendixname}
}

\makeatother

