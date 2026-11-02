\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vaigs}[VAIGS dissertation template]

\LoadClass[12pt]{report}
\RequirePackage[utf8]{inputenc}

\RequirePackage[document]{ragged2e}
\setlength{\RaggedRightParindent}{0.5in}

% fonts
\RequirePackage{lmodern}
% \RequirePackage[libertine]{newtxmath}

%\RequirePackage{fontspec}
%\setmainfont{Linux Libertine O}%
%   [Ligatures={Common}, Numbers=OldStyle]

% margins
\RequirePackage[margin=1in]{geometry}

% paragraph indent
\RequirePackage{indentfirst}
\setlength\parindent{0.5in}

\RequirePackage[hidelinks]{hyperref}

% spacing
\RequirePackage{setspace}
\renewcommand{\doublespacing}{%
  \setstretch{1.93}%  default
}

% Prevent orphans and widows
\clubpenalty=10000      % Penalty for orphans (lines at page bottom)
\widowpenalty=10000     % Penalty for widows (lines at page top)
\displaywidowpenalty=10000

% ============================================================================
% TITLE PAGE
% ============================================================================

\newcommand{\dissertationtitle}[1]{\def\@dissertationtitle{#1}}
\newcommand{\dissertationauthor}[1]{\def\@dissertationauthor{#1}}
\newcommand{\dissertationcopyright}[1]{\def\@dissertationcopyright{#1}}
\newcommand{\degree}[1]{\def\@degree{#1}}
\newcommand{\dissertationyear}[1]{\def\@year{#1}}

% Default values
\def\@dissertationtitle{DISSERTATION TITLE}
\def\@dissertationauthor{Student Full Name}
\def\@dissertationcopyright{\@dissertationauthor}
\def\@degree{DOCTOR OF PHILOSOPHY}
\def\@year{\the\year}

% \maketitle DEFINITION

\renewcommand{\maketitle}{%
  \thispagestyle{empty}
  \vspace*{1in}

  % Title - centered, double-spaced, all caps
  \begin{center}
    \doublespacing
    \MakeUppercase{\@dissertationtitle}
  \end{center}

  % "by" on next line
  % \vspace{0.5\baselineskip}
  \begin{center}
    by
  \end{center}

  % Student name
  % \vspace{0.5\baselineskip}
  \begin{center}
    \@dissertationauthor
  \end{center}

  % "A DISSERTATION" 6.5 inches from top
  \vspace*{3.5in}
  \begin{center}
    \singlespacing
    A DISSERTATION
  \end{center}

  % Single-spaced blank line
  % \vspace{\baselineskip}

  % Submission text
  \begin{center}
    Submitted to\\
    Van Andel Institute Graduate School\\
    in partial fulfillment of the requirements\\
    for the degree of
  \end{center}

  % Blank line before degree
  % \vspace{\baselineskip}

  % Degree name
  \begin{center}
    \MakeUppercase{\@degree}
  \end{center}

  % Blank line before year
  % \vspace{\baselineskip}

  % Year
  \begin{center}
    \@year
  \end{center}

  \newpage
  \doublespacing
}

% ============================================================================
% COPYRIGHT PAGE
% ============================================================================

\newcommand{\makecopyright}{%
  \vspace*{\fill}
  \begin{center}
    Copyright by \\
    \@dissertationcopyright\\
    \@year
  \end{center}
  \vspace*{2in}
  \newpage
}

% ============================================================================
% ABSTRACT
% ============================================================================

\renewcommand{\abstract}[1]{%
  \thispagestyle{plain}

  % "ABSTRACT" heading - bold, centered, single-spaced
  \begin{center}
    \singlespacing
    \textbf{ABSTRACT}
  \end{center}

  % Title - bold, centered, sentence-style capitals, single-spaced
  \begin{center}
    \singlespacing
    \textbf{\@dissertationtitle}
  \end{center}

  % Abstract text - double-spaced, left-justified
  \doublespacing
  #1

  \newpage
}

% ============================================================================
% TABLE OF CONTENTS
% ============================================================================
\setcounter{tocdepth}{2}
\renewcommand{\contentsname}{\centering TABLE OF CONTENTS}

\RequirePackage{titlesec}
\titlespacing*{\chapter}{0pt}{0pt}{0pt}

% boldface the chapter titles
\RequirePackage{titletoc}
\titlecontents{chapter}[0in]{}{\bfseries}{\bfseries}{\dotfill\contentspage}
\titlecontents{section}[0.5in]{}{}{}{\dotfill\contentspage}
\titlecontents{subsection}[1in]{}{}{}{\dotfill\contentspage}
% Add Figure prefix to list of figures entries
\titlecontents{figure}[0mm]%
    {\makebox{Figure~}}%
    {\makebox{\thecontentslabel.\quad}}%
    {}%
    {\dotfill\thecontentspage}

% Add Table prefix to list of figures entries
\titlecontents{table}[0mm]%
    {\makebox{Table~}}%
    {\makebox{\thecontentslabel.\quad}}%
    {}%
    {\dotfill\thecontentspage}

% Chapter titles
\titleformat{\chapter}[display]
  {\bfseries\centering}
  {}
  {0pt}
  {}

% Section headings
\titleformat{\section}
  {\bfseries\centering}
  {}
  {0pt}
  {}

% Subsection headings
\titleformat{\subsection}
  {\bfseries}
  {}
  {0pt}
  {}

% Subsubsection headings (if needed)
\titleformat{\subsubsection}
  {\bfseries}
  {}
  {0pt}
  {}


% ============================================================================
% LISTS OF FIGURES, TABLES, ABBREVIATIONS
% ============================================================================
\renewcommand{\listfigurename}{LIST OF FIGURES}
\let\originallistoffigures\listoffigures
\renewcommand{\listoffigures}{%
  \originallistoffigures
  \addcontentsline{toc}{chapter}{\listfigurename}%
}

\renewcommand{\listtablename}{LIST OF TABLES}
\let\originallistoftables\listoftables
\renewcommand{\listoftables}{%
  \originallistoftables
  \addcontentsline{toc}{chapter}{\listtablename}%
}

% continuous figure numbering instead of chapterNo.figureNo
\RequirePackage{chngcntr}
\counterwithout{figure}{chapter}
\renewcommand{\thefigure}{\arabic{figure}}

% setup acronym tables
\RequirePackage[style=long, nopostdot, nonumberlist, nogroupskip, shortcuts, toc=true]{glossaries}
\makeglossaries
\renewcommand*{\glsnamefont}[1]{\textbf{#1}} %have the terms be in bold
\setlength{\glsdescwidth}{\textwidth}
\setlength{\LTleft}{0pt} % this and the next line ensure alignment is left not centered
\setlength{\LTright}{0pt}
\renewenvironment{theglossary} %
    {\begin{longtable}{@{}lp{\glsdescwidth}@{}}} % the @{} removes horizontal padding at left and right edges
    {\end{longtable}}

% print acronym list with \listofabbreviations
\newcommand{\listofabbreviations}{
  \phantomsection
  \printglossary[type=\acronymtype, title={LIST OF SYMBOLS AND ABBREVIATIONS}]
  \glsaddall
}


% ============================================================================
% CAPTIONS
% ============================================================================
\RequirePackage[labelfont=bf,format=plain,figurewithin=none]{caption}

\newcommand{\Caption}[2][]{%
  \setlength{\RaggedRightParindent}{0in}%
  \caption[#1]{#2}%
}

% ============================================================================
% URLs
% ============================================================================
\urlstyle{same}

% ============================================================================
% FIGURES
% ============================================================================
\RequirePackage[section]{placeins}
\RequirePackage{float}
\floatplacement{figure}{p!}

% ============================================================================
% TABLES
% ============================================================================
% landscape tables
\RequirePackage{rotating}
% newlines in a cell
\RequirePackage{makecell}
\renewcommand\theadfont{\bfseries}

% don't add a line above footnotes so footnotes go immediately under the table
\renewcommand\footnoterule{}

% to allow referencing existing footnotes with \footnoteref{label}
\makeatletter
\newcommand\footnoteref[1]{\protected@xdef\@thefnmark{\ref{#1}}\@footnotemark}
\makeatother


% ============================================================================
% CITATIONS AND BIBLIOGRAPHY
% ============================================================================

\RequirePackage[
  backend=biber,
  hyperref=true,
  style=numeric-comp,
  sorting=none,
  giveninits,
  uniquelist=false,
  uniquename=false,
  url=false,
  natbib=true,
  maxcitenames=2,
  mincitenames=1,
  minbibnames=10,
  maxbibnames=10
]{biblatex}

% author name citations with superscript reference number
\renewcommand{\textcite}[1]{\citeauthor{#1}\supercite{#1}}

% Space between bibliography entries
\AtBeginBibliography{\singlespacing}
\setlength{\bibitemsep}{6pt}

\AtEveryBibitem{%
  \clearfield{issn}%
  \clearfield{month}%
  \clearfield{number}%
}

% no brackets around numbers
\DeclareFieldFormat{labelnumberwidth}{#1\adddot}

% CELL STYLE
% https://tex.stackexchange.com/questions/404757/cell-citation-style-for-biblatex
\RequirePackage{xpatch}

% Some general changes
\DeclareNameAlias{sortname}{last-first}
\renewcommand*{\bibinitdelim}{}
\renewbibmacro*{in:}{%
    \iffieldequalstr{entrytype}{inproceedings}{%
        \printtext{\bibstring{in}\addspace}%
    }{}%
}

% Wrap year in parentheses
\DeclareFieldFormat{year}{\mkbibparens{#1}}

% Changes in Article
\DeclareFieldFormat[article]{title}{#1.}
\DeclareFieldFormat[article]{journaltitle}{#1}
\DeclareFieldFormat[article]{volume}{\textit{#1}}
\DeclareFieldFormat[article]{pages}{#1}

% Changes for Book
\csletcs{abx@macro@publisher+location+date@orig}{abx@macro@publisher+location+date}
\renewbibmacro*{publisher+location+date}{%
    \printtext[parens]{\usebibmacro{publisher+location+date@orig}}
}
\DeclareFieldFormat[book]{title}{#1\printunit{\addspace}}

% Changes for inproceedings
\DeclareFieldFormat[inproceedings]{title}{#1\isdot}
\DeclareFieldFormat{booktitle}{#1\addcomma}
\xpatchbibmacro{byeditor+others}{%
    \usebibmacro{byeditor+othersstrg}%
    \setunit{\addspace}%
    \printnames[byeditor]{editor}%
    \clearname{editor}%
}{%
    \printnames[byeditor]{editor}%
    \clearname{editor}
    \addcomma\addspace
    \bibstring{editor}
    \setunit{\addspace}%
}{}{}

% CELL PRESS STYLE
\DeclareBibliographyDriver{article}{%
  \usebibmacro{bibindex}%
  \usebibmacro{begentry}%
  \usebibmacro{author/translator+others}%
  \setunit{\addspace}%
  \printfield{year}%
  \setunit{\addcomma\space}%
  \usebibmacro{title}%
  \setunit{\addcomma\space}%
  \printfield{journaltitle}%
  \setunit{\addspace}%
  \printfield{volume}%
  \setunit{\addcomma\space}%
  \printfield{pages}%
  \newunit%
  \printfield{doi}%
  \newunit%
  \usebibmacro{finentry}%
}
