%% softmax_preprint.cls -- single-column preprint class (SoftMax Lab).
%%
%% Typography (fonts, margins, spacing, headings, captions) follows the
%% Berkeley RAIL / Google DeepMind tech-report template (CC BY-SA 4.0);
%% the abstract box follows a common arXiv preprint style.
%%
%% Commands for the front matter (see main.tex):
%%   \title{...}  \runningtitle{...}  \author{...}  \affiliation{...}
%%   \logo{...}   \runninglogo{...}   \banner{...}   \codelink{URL}{shown text}
%%   \affmark{1,2}   \authornote{...}   \emails{\email{address}, ...}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{softmax_preprint}[2026/11/03 SoftMax Lab single-column preprint]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax
\LoadClass{extarticle}

%% ---- Fonts: Charter text, Palatino math, Latin Modern typewriter ----
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{mathpazo}
\IfFileExists{XCharter.sty}{\RequirePackage{XCharter}}{\RequirePackage{charter}}
\IfFileExists{zlmtt.sty}{\RequirePackage[scaled=1.1]{zlmtt}}{}
\RequirePackage{microtype}
\RequirePackage{amsmath,amssymb,amsfonts}

%% ---- Page layout ----
\RequirePackage[letterpaper,left=1.9cm,right=1.9cm,top=3cm,bottom=2.5cm,
  headheight=40pt,headsep=20pt]{geometry}
\setlength{\parskip}{0.5\baselineskip}

%% ---- General packages ----
\RequirePackage{graphicx}
\RequirePackage{fontawesome5}
\RequirePackage[svgnames]{xcolor}
\RequirePackage{booktabs}
\RequirePackage{enumitem}
\setlist[itemize]{noitemsep}
\setlist[enumerate]{noitemsep}
\RequirePackage{float}
\RequirePackage{url}
\RequirePackage[comma,authoryear,compress]{natbib}
\definecolor{WolfpackRed}{HTML}{CC0000}
\RequirePackage{hyperref}
\hypersetup{colorlinks=true,citecolor=WolfpackRed,linkcolor=WolfpackRed,urlcolor=WolfpackRed}
\g@addto@macro\UrlBreaks{\do\-\do\_}

%% ---- Float placement: keep floats close to their text ----
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\renewcommand{\textfraction}{0.07}
\renewcommand{\floatpagefraction}{0.85}
\setcounter{topnumber}{3}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}

%% ---- Section headings (black) ----
\RequirePackage{titlesec}
\titleformat{\section}{\bfseries\fontsize{13}{14}\selectfont}{\thesection.}{0.5em}{}
\titleformat{name=\section,numberless}{\bfseries\fontsize{13}{14}\selectfont}{}{0em}{}
\titleformat{\subsection}{\bfseries}{\thesubsection.}{0.5em}{}
\titleformat{\subsubsection}{\bfseries\itshape}{\thesubsubsection.}{0.5em}{}
\titlespacing*{\section}{0pt}{3ex plus4pt minus3pt}{5pt}
\titlespacing*{\subsection}{0pt}{2.5ex plus3pt minus2pt}{2pt}
\titlespacing*{\subsubsection}{0pt}{2ex plus2.5pt minus1.5pt}{2pt}
\titleformat{\paragraph}[runin]{\bfseries}{}{0pt}{}
\titlespacing*{\paragraph}{0pt}{1.2ex plus .5ex minus .2ex}{1em}

%% ---- Captions ----
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{pipe}{:~}
\captionsetup{labelfont=bf,labelsep=pipe,singlelinecheck=off}

%% ---- Headers and footers ----
\RequirePackage{fancyhdr}
\newcommand{\footerfont}{\normalfont\fontsize{8}{10}\selectfont}
\newcommand{\headerfont}{\normalfont\fontsize{9}{11}\selectfont}
\newcommand\@runningtitle{}
\newcommand\runningtitle[1]{\renewcommand\@runningtitle{#1}}
\newcommand\@logo{}
\newcommand\logo[1]{\renewcommand\@logo{#1}}
\newcommand\@runninglogo{}
\newcommand\runninglogo[1]{\renewcommand\@runninglogo{#1}}
\newcommand\@banner{}
\newcommand\banner[1]{\renewcommand\@banner{#1}}
\pagestyle{fancy}
\fancyhf{}
% Equal side columns keep the title centered and separate from the logo.
\fancyhead[C]{%
  \makebox[\textwidth][l]{%
    \makebox[0.14\textwidth][l]{\headerfont\color{WolfpackRed}Preprint}%
    \parbox[b]{0.72\textwidth}{\centering\headerfont\color{WolfpackRed}\strut\@runningtitle\strut}%
    \makebox[0.14\textwidth][r]{\@runninglogo}}}
\fancyfoot[C]{\footerfont\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\let\softmax@headrule\headrule
\renewcommand{\headrule}{{\color{WolfpackRed}\softmax@headrule}}

%% ---- Colours of the title block ----
\RequirePackage[most]{tcolorbox}
\colorlet{titlerule}{WolfpackRed}            % thick rule under the header, banner initials
\colorlet{bannerlight}{WolfpackRed!45}       % lighter letters of the banner
\definecolor{abstractbg}{RGB}{253,240,240} % abstract box

%% ---- First page: SoftMax identity on the left, institution logo on the right ----
\fancypagestyle{firststyle}{%
  \fancyhf{}%
  \fancyhead[L]{\vskip 4mm\raisebox{-12mm}[0pt][0pt]{\makebox[\textwidth][l]{%
    \raisebox{0.18cm}{\color{titlerule}\bfseries\fontsize{14}{16}\selectfont\@banner}\hfill\@logo}}}%
  \fancyfoot[C]{\footerfont\thepage}%
  \renewcommand{\headrulewidth}{0pt}}

%% ---- Title block ----
\newcommand\@affiliation{}
\newcommand\affiliation[1]{\renewcommand\@affiliation{#1}}
% Reuse the same markers beside authors and their institution names.
\newcommand\affmark[1]{\textsuperscript{\normalfont #1}}
\newcommand*\@authornote{}
\newcommand\authornote[1]{\renewcommand*\@authornote{#1}}
\renewcommand\maketitle{%
  \thispagestyle{firststyle}%
  \begingroup
  \setlength{\parskip}{0pt}%
  \centering
  \vspace*{1mm}%
  {\color{titlerule}\hrule height 1.5pt}%
  \vskip 6mm
  {\bfseries\fontsize{17.8}{22.5}\selectfont\@title\par}%
  \vskip 7mm
  {\bfseries\fontsize{12}{15}\selectfont\@author\par}%
  \vskip 3mm
  {\fontsize{10}{12}\selectfont\@affiliation\par}%
  \ifx\@authornote\@empty\else
    \vskip 1.5mm
    {\fontsize{9}{11}\selectfont\@authornote\par}%
  \fi
  \vskip 6mm
  \endgroup
}

%% ---- Abstract box (optional contact emails and code link at the bottom) ----
\newcommand*\@emails{}
\newcommand\emails[1]{\renewcommand*\@emails{#1}}
\newcommand\email[1]{\href{mailto:#1}{\nolinkurl{#1}}}
\newcommand\softmax@printemails{%
  \ifx\@emails\@empty\else
    \vspace{3mm}%
    {\centering\fontsize{9.5}{12}\selectfont\makebox[1.3em][c]{\faEnvelope}\hspace{0.4em}\@emails\par}%
  \fi}
\newcommand\@codelink{}
\newcommand\codelink[2]{\renewcommand\@codelink{%
  \vspace{3mm}{\centering\fontsize{9.5}{12}\selectfont\href{#1}{%
    \textcolor{black}{\makebox[1.3em][c]{\faGithub}}\hspace{0.4em}%
    {\ttfamily #2}}\par}}}
\renewenvironment{abstract}{%
  \tcolorbox[enhanced,frame hidden,colback=abstractbg,arc=5pt,
    left=0.5cm,right=0.5cm,top=0.5cm,bottom=0.5cm,before skip=0pt,after skip=6mm,
    grow to left by=1.5pt,grow to right by=1.5pt]%
  \setlength{\parskip}{0pt}%
  {\centering\bfseries\fontsize{13}{14}\selectfont Abstract\par}\vskip 3mm
  \normalsize\ignorespaces}{%
  \par\softmax@printemails\@codelink
  \endtcolorbox}

%% ---- Highlighted finding box: \finding{One-sentence takeaway.} ----
\RequirePackage{needspace}
\newtcolorbox{findingbox}{colback=black!7,colframe=black!7,boxrule=0pt,arc=1.5pt,
  left=5pt,right=5pt,top=3.5pt,bottom=3.5pt,boxsep=0pt,before skip=5pt,after skip=3pt}
\newcommand{\finding}[1]{\Needspace{4\baselineskip}\begin{findingbox}\textbf{#1}\end{findingbox}\noindent\ignorespaces}
