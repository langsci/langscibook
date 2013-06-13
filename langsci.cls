\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{langsci}[2013/06/12 Language Science Publications]

\usepackage{epstopdf}


% Default values:
\newcommand{\lsSeriesNumber}{1}
\newcommand{\lsISBN}{98000000}
\newcommand{\lsSeries}{eotms}
\newcommand{\lsSpineBreadth}{20mm}
\newcommand{\lsOutput}{printondemand}

% Option handling:
\RequirePackage{kvoptions}		% for key-value options
\SetupKeyvalOptions{
	family=langsci,
	prefix=langsci@ }
\DeclareStringOption{number}[1]
	\define@key{langsci}{number}{%
		\renewcommand{\lsSeriesNumber}{#1}}
\DeclareStringOption{isbn}[98000000]
	\define@key{langsci}{isbn}{%
		\renewcommand{\lsISBN}{#1}}
\DeclareStringOption{series}[eotms]
	\define@key{langsci}{series}{%
		\renewcommand{\lsSeries}{#1}}
\DeclareStringOption{output}[printondemand]
	\define@key{langsci}{output}{%
		\renewcommand{\lsOutput}{#1}}
\DeclareVoidOption{blackandwhite}{
	\newcommand{\blackandwhite}{}}
\DeclareVoidOption{printondemand}{
	\renewcommand{\lsOutput}{printondemand}}
\DeclareStringOption{draft}[yes]		% pass the draft option to scrbook, TODO does not work?
	\define@key{langsci}{draft}{
	\PassOptionsToClass{draft=#1}{scrbook}}
\ProcessKeyvalOptions{langsci}

\LoadClass[
	fontsize=10.5pt%,
	%draft=yes,
	]{scrbook}
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page size and text area:
 
\usepackage[ papersize={170mm,240mm}
			,top=27.4mm % TODO nachgemessen, nach Vermassung eigentlich 30mm-16pt = 25.8mm
			,inner=20mm, 
			,outer=25mm
			%,showframe,pass
			]{geometry}
			
\setlength{\marginparwidth}{50pt}

\usepackage[absolute 		% for absolute positioning in titlepage
			%,showboxes
			]{textpos}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{\TPHorizModule}
\textblockorigin{0mm}{0mm}

\usepackage{pbox}   % boxes with maximum width
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonts, language and graphics:

\newcommand{\fontpath}{./fonts/}

\usepackage{ifxetex}
\ifxetex				
  \usepackage{fontspec}
  %\setmainfont[Scale=0.95,Ligatures={TeX,Common}]{Charis SIL}
  %\setmainfont[Ligatures={TeX,Common},Numbers={OldStyle}]{Linux Libertine B}
  %\setmainfont[Ligatures={TeX,Common}]{FreeSerif}
  \setmainfont[Ligatures={TeX,Common},Path=\fontpath]{FreeSerif_B.otf}
  
  \usepackage{unicode-math}
  \setmathfont[Path=\fontpath]{texgyretermes-math.otf}

  \setsansfont[Ligatures={TeX,Common},Scale=MatchLowercase,Path=\fontpath]{FreeSans_B.otf}
  \setmonofont[Ligatures={TeX},Scale=MatchLowercase,Path=\fontpath]{FreeMono_B.otf}

  %\usepackage{polyglossia}
  %\setdefaultlanguage{british}
\else
  \usepackage{ucs}  			% extended UTF8 support TODO remove this?
  \usepackage[utf8x]{inputenc}
  \usepackage[T1]{fontenc}
  \usepackage{libertine}		% To be placed before times and helvetica to preserve the KOMA style.
  \usepackage{mathptmx,helvet} 	% times and helvetica
  \usepackage{tgtermes}
  %\usepackage[british]{babel}   % TODO remove this?
\fi



\usepackage{microtype}
\usepackage{graphicx}

\ifxetex
%  \newcommand{\lsCoverTitleFont}[1]{\fontspec[LetterSpace=-2.0]{TeXGyreTermes}\fontshape{sc}\fontsize{52pt}{16.75mm}\selectfont #1}
  \newcommand{\lsCoverTitleFont}[1]{\fontshape{sc}\fontsize{52pt}{16.75mm}\selectfont #1}
\else
  \newcommand{\lsCoverTitleFont}[1]{\textls[-16]{\fontencoding{T1}\fontfamily{qtm}\fontshape{sc}\fontsize{52pt}{16.75mm}\selectfont #1}}
  % Times uses fake small caps:
  % \textls[-60]{\fontencoding{T1}\fontfamily{ptm}\fontshape{sc}\fontsize{52pt}{16.75mm}\selectfont \@title\\}
\fi
\newcommand{\lsCoverAuthorFont}{\fontencoding{T1}\fontfamily{qtm}\fontsize{25pt}{12.5mm}\selectfont}
\newcommand{\lsCoverSeriesFont}{\fontencoding{T1}\fontfamily{phv}\fontseries{b}\fontsize{14pt}{7.5mm}\selectfont}
\newcommand{\lsCoverSeriesHistoryFont}{\fontencoding{T1}\fontfamily{phv}\fontseries{b}\fontsize{10pt}{5mm}\selectfont}
\newcommand{\lsInsideFont}{\fontencoding{T1}\fontfamily{fxlj}\fontsize{10.5pt}{5mm}\selectfont}
\newcommand{\lsBackTitleFont}{\lsCoverAuthorFont}
\newcommand{\lsBackBodyFont}{\lsInsideFont}
\newcommand{\lsSpineAuthorFont}{\fontencoding{T1}\fontfamily{qtm}\fontsize{12pt}{14pt}\selectfont}
\newcommand{\lsSpineTitleFont}{\fontencoding{T1}\fontfamily{qtm}\fontshape{sc}\fontsize{16pt}{14pt}\selectfont}


% qtm = tgtermes
% ptm = times
% phv = helvet
% fxlj = libertine


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Colors:

\usepackage{xcolor}
\definecolor{lsLightBlue}{cmyk}{0.6,0.05,0.05,0}
\definecolor{lsMidBlue}{cmyk}{0.75,0.15,0,0}
\definecolor{lsDarkBlue}{cmyk}{0.9,0.5,0.15,0.3}
\definecolor{lsYellow}{cmyk}{0,0.25,1,0}
\definecolor{lsOrange}{cmyk}{0,0.50,1,0}
\definecolor{lsRed}{cmyk}{0.05,1,0.8,0}
\definecolor{lsWine}{cmyk}{0.3,1,0.6,0}
\definecolor{lsLightGreen}{cmyk}{0.4,0,1,0}
\definecolor{lsMidGreen}{cmyk}{0.55,0,0.9,0.1}
\definecolor{lsDarkGreen}{cmyk}{0.6,0,0.9,0.35}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Special commands for authors:

% defaults:
\newcommand{\lsBackBody}{Europan lingues es membres del sam familie. Lor separat existentie es un
myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li
lingues differe solmen in li grammatica, li pronunciation e li plu commun vo-
cabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa
continuar payar custosi traductores.}
\newcommand{\lsBackTitle}{Back Title}

\newcommand{\BackTitle}[1]{\renewcommand{\lsBackTitle}{#1}}
\newcommand{\BackBody}[1]{\renewcommand{\lsBackBody}{#1}} 

\newcommand{\newlineCover}{\\}	% \newline only on cover
\newcommand{\newlineSpine}{\\}	% \newline only on spine

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Series information:

\newcommand{\eotms}{eotms}
\newcommand{\eotmsig}{eotmsig}
\newcommand{\sidl}{sidl}
\newcommand{\algad}{algad}
\newcommand{\tamnlp}{tamnlp}
\newcommand{\lsSeriesFontColor}{white}

\ifx\lsSeries\eotms
 	\newcommand{\lsSeriesTitle}{Empirically Oriented Theoretical \\ Morphology and Syntax, number \lsSeriesNumber}
 	\newcommand{\lsSeriesColor}{lsMidBlue}
\fi
\ifx\lsSeries\eotmsig
 	\newcommand{\lsSeriesTitle}{Implemented Grammars, number \lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsMidBlue}
\fi
\ifx\lsSeries\sidl
 	\newcommand{\lsSeriesTitle}{Studies in Diversity Linguistics, number \lsSeriesNumber}
 	\newcommand{\lsSeriesColor}{lsDarkGreen}
\fi
\ifx\lsSeries\algad
 	\newcommand{\lsSeriesTitle}{African Language Grammars\\ and Dictionaries, number \lsSeriesNumber}
 	\newcommand{\lsSeriesColor}{lsOrange}
\fi
\ifx\lsSeries\tamnlp
 	\newcommand{\lsSeriesTitle}{Translation and Multilingual Natural\\ Language Processing , number \lsSeriesNumber}
 	\newcommand{\lsSeriesColor}{lsWine}
\fi	

\@ifundefined{blackandwhite}
 	{}
 	{\renewcommand{\lsSeriesColor}{black}}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cover:

\newcommand{\lsCoverFontColor}{white}
\newcommand{\lsCoverBlockColor}{\lsSeriesColor}

\newcommand{\lsCoverBlock}{
	\begin{textblock}{155}(7.5,7.5)
	\color{\lsCoverBlockColor}
	\raggedright\rule{155mm}{225mm}
	\end{textblock}}

\newcommand{\lsCoverTitleAuthor}{
	\renewcommand{\newlineSpine}{}
	\lsCoverBlock

	\begin{textblock}{140}(15,17.5)
	\color{\lsCoverFontColor}
	\raggedright
	{\lsCoverTitleFont{\@title\\}}

	\vspace{11.2mm} % 20mm - 25pt
 
	\raggedright
	{\lsCoverAuthorFont 
		\@author\\}
	\end{textblock}}

\newcommand{\lsCoverSeries}{
	\begin{textblock}{95}(7.4,209)
	\color{\lsCoverFontColor}
	\raggedright\rule{3.6mm}{3.5mm}
	\hspace{3mm}\parbox[t]{85mm}{\raggedright\lsCoverSeriesFont   
		\lsSeriesTitle\\}
	\end{textblock}}

\newcommand{\lsCoverLogo}{		
	\begin{textblock}{33}(124.6,205)
	\raggedright\IfFileExists{logo_rz_buch.pdf}{\includegraphics{logo_rz_buch}}{langsci logo}  
	\end{textblock}}

\newcommand{\lsFrontPage}{		% Front page
	\lsCoverBlock
	\lsCoverTitleAuthor
	\lsCoverSeries
	\lsCoverLogo}

\newcommand{\lsSchmutztitel}{	% Schmutztitel
	\lsCoverBlock
	\lsCoverTitleAuthor
	\lsCoverLogo}

\newcommand{\lsBackPage}{		% Back page
	\lsCoverBlock

	\begin{textblock}{115}(15,30)
	\color{white}
	{\raggedright
	 \lsBackTitleFont 
	 \lsBackTitle \\ \null} 

	\lsBackBodyFont

	\noindent 
	\lsBackBody
	\end{textblock}

	\begin{textblock}{30}(115,212.5)
	\lsBackBodyFont
	ISBN \lsISBN			
	\end{textblock}}

\newcommand{\lsSpine}{			% Book spine
	\renewcommand{\newlineSpine}{\\}
	\renewcommand{\newlineCover}{}
	\begin{textblock}{40}(65,0)
	\rotatebox{90}{\color{black}\fbox{\begin{minipage}[c][\lsSpineBreadth][c]{\paperheight}
		\color{\lsSeriesColor}
		\hspace{7.5mm}
		\IfFileExists{logo_spine_color.pdf}{\includegraphics{logo_spine_color.pdf}}{logo}
		\hspace{10mm}
 		{\lsSpineTitleFont
			\pbox{100mm}{\@title}  }
		\hspace{10mm}
		{\lsSpineAuthorFont 
			\pbox{100mm}{\@author}}
	\end{minipage}}} 
	\end{textblock}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\lsOutputPrintondemand}{printondemand}
\newcommand{\lsOutputShort}{short}
\newcommand{\lsOutputProof}{proof}


\renewcommand{\maketitle}{
\begin{titlepage}
\thispagestyle{empty}

%\@ifundefined{printondemand}{}{		
\ifx\lsOutput\lsOutputPrintondemand		% only if output=printondemand 
	% First titlepage:
	{\lsFrontPage}
	%%%%%%%%%%%%%%%%%%%
	\newpage\thispagestyle{empty}
	\null\newpage\thispagestyle{empty}
	% Back page:
	{\lsBackPage}
	%%%%%%%%%%%%%%%%%%%
	\newpage\thispagestyle{empty}
	\null\newpage\thispagestyle{empty}
	% Book spine:
	{\lsSpine}
	%%%%%%%%%%%%%%%%
	\newpage\thispagestyle{empty}
	\null\newpage\thispagestyle{empty}
	% Series information:
	{\lsSeriesHistory}
	%%%%%%%%%%%%%%%%%%%%%
	\null\newpage\thispagestyle{empty}
	% Schmutztitel:
	{\renewcommand{\lsCoverBlockColor}{white}
	 \renewcommand{\lsCoverFontColor}{\lsSeriesColor}
	\lsSchmutztitel}
	%%%%%%%%%%%%%%%%%%%%
\fi										

\ifx\lsOutput\lsOutputProof				% only if output=proof
  	{\renewcommand{\lsCoverBlockColor}{white}
  	 \renewcommand{\lsCoverFontColor}{black}
  	 \lsFrontPage}
\fi

\setcounter{page}{1}
\end{titlepage}


\null\newpage\thispagestyle{empty}
\hypersetup{colorlinks=false, pdfborder={0 0 0}} 	% for hyperref
\color{black}
\lsInsideFont

\null\vfill

% Impressum:
\lsImpressum
%%%%%%%%%%%%%

\null\clearpage\thispagestyle{plain}
%\pagenumbering{roman}	% TODO pagenumbering (Change \tableofcontents?)
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Series history:

\newcommand{\lsSeriesHistory}{
\color{black}
\raggedright\lsCoverSeriesHistoryFont
 TODO Series information: name, editors, previous numbers
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Impressum:


\newcommand{\lsImpressum}{
\begin{center}
{\bf Impressum} \\
Info Info Info \\
Info Info Info \\
Info Info Info \\
Cover and concept of design: \\
Ulrike Harbort \\
www.langsci-press.org \\[3ex]

Storage and catalogueing done by FU Berlin \\[3ex]  	

\IfFileExists{FULogo_sw_RGB.pdf}{\includegraphics[width=5cm]{FULogo_sw_RGB}}{FU-Logo} \\
\end{center}
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header and footer:

\usepackage{scrpage2}
\ohead{\pagemark}
\ihead{\headmark}
\cfoot{}
\ofoot[]{}
\ifoot{}
\renewcommand*{\partpagestyle}{empty}

\pagestyle{scrheadings}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Citation:

\usepackage{natbib}
\setcitestyle{notesep={:}}   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hyperref:

\usepackage[bookmarks=true,bookmarksopen=true,%
  hyperindex=true,%
  breaklinks=true,
  draft=false,plainpages=false,
  pdfauthor={},%
  pdfkeywords={}
%  ,ps2pdf=true
]{hyperref}

% xelatex hates this.
%\usepackage{breakurl} 	

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% footnotes:

\raggedbottom
\deffootnote{5mm}{0mm}{\textsuperscript{\normalfont\thefootnotemark}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% subsubsubsection:

\setcounter{secnumdepth}{4} % und (f"urs Inhaltsverzeichnis)
% \setcounter{tocdepth}{4} (oder so) angegeben werden.

\def\subsubsubsection{\@startsection{paragraph}{3}{\z@}{-3.25ex plus
    -1ex minus-.2ex}{1.5ex plus.2ex}{\reset@font\normalsize}}
%
\let\subsubsubsectionmark\@gobble
%

\def\subsubsubsubsection{\@startsection{subparagraph}{3}{\z@}{-3.25ex plus
    -1ex minus-.2ex}{1.5ex plus.2ex}{\reset@font\normalsize}}
%
\let\subsubsubsubsectionmark\@gobble
% needed for hyperref
\def\toclevel@subsubsubsection{4}
%    



\endinput
