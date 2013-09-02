\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{langsci}[2013/08/20 Language Science Publications]

% Default values:
\newcommand{\lsSeriesNumber}{??}
\newcommand{\lsISBN}{????????}
\newcommand{\lsSeries}{eotms}
\newcommand{\lsSpineBreadth}{20mm}
\newcommand{\lsOutput}{long}
\newif\iflsDraft
\lsDraftfalse

% Option handling:
\RequirePackage{kvoptions}		% for key-value options
\SetupKeyvalOptions{
	family=langsci,
	prefix=langsci@ }
\DeclareStringOption{number}[??]
	\define@key{langsci}{number}{%
		\renewcommand{\lsSeriesNumber}{#1}}
\DeclareStringOption{isbn}[????????]
	\define@key{langsci}{isbn}{%
		\renewcommand{\lsISBN}{#1}}
\DeclareStringOption{series}[eotms]
	\define@key{langsci}{series}{%
		\renewcommand{\lsSeries}{#1}}
\DeclareStringOption{output}[long]
	\define@key{langsci}{output}{%
		\renewcommand{\lsOutput}{#1}}
\DeclareVoidOption{blackandwhite}{
	\newcommand{\blackandwhite}{}}
\DeclareVoidOption{long}{
	\renewcommand{\lsOutput}{long}}
\DeclareStringOption{draftmode}[yes]		% 'draftmode' instead of 'draft' due to undesirable side efects	
	\define@key{langsci}{draftmode}{			
	 \lsDrafttrue
	 %\PassOptionsToClass{draft=#1}{scrbook}  % pass the draft option to scrbook, TODO does not work?
	 }
\ProcessKeyvalOptions{langsci}

\LoadClass[
	fontsize=10.5pt,
    footnotes=multiple,
    numbers=noenddot,		% no point after last number of chapters/sections
	%draft=yes,
	]{scrbook}


\usepackage{etex}
	
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

\usepackage{ifxetex}
\ifxetex
 	
  \usepackage{amssymb} % has to be loaded before other stuff			
  \usepackage{fontspec}
  \newcommand{\fontpath}{./fonts/}
			
  \setsansfont[
  			%Ligatures={TeX,Common},		% not supported by ttf
  			Scale=MatchLowercase,
  			Path=\fontpath,
            BoldFont = Arimo-Bold_B.ttf ,
			ItalicFont = Arimo-Italic_B.ttf ,				
			BoldItalicFont = Arimo-BoldItalic_B.ttf 		
			]
			{Arimo_B.ttf}
			
  \setmonofont[
  			Ligatures={TeX},Scale=MatchLowercase,Path=\fontpath,
			BoldFont = FreeMonoBold_B.otf ,
			SlantedFont = FreeMonoOblique_B.otf ,				
			BoldSlantedFont = FreeMonoBoldOblique_B.otf 		
			]
			{FreeMono_B.otf}



  \setmainfont[
  			Ligatures={TeX,Common},
  			Path=\fontpath,
  			PunctuationSpace=0,							
  			Numbers={OldStyle,Proportional},				% for tables use \addfontfeatures{Numbers={Monospaced,Lining}}
			BoldFont = LinLibertine_RZ_B.otf ,				% semi-bold
			ItalicFont = LinLibertine_RI_B.otf ,			
			BoldItalicFont = LinLibertine_RZI_B.otf ]		% semi-bold
			{LinLibertine_R_B.otf}			
  
  \usepackage[libertine]{newtxmath}
 
  %\usepackage{unicode-math} 	% Does it support LinuxLibertine?
 
  %\usepackage{polyglossia}		% TODO remove this?
  %\setdefaultlanguage{british}
\else
  \usepackage[T1]{fontenc}
  \usepackage{ucs}  				% extended UTF8 support TODO remove this?
  \usepackage[utf8x]{inputenc}
  \usepackage{libertine}			% TODO 
  
  %\usepackage[british]{babel}   	% TODO remove this?
\fi

%\frenchspacing			
\usepackage[final]{microtype}
\usepackage{graphicx}



\ifxetex
  \newcommand{\lsCoverTitleFont}[1]{\sffamily\addfontfeatures{Scale=MatchUppercase}\fontsize{52pt}{16.75mm}\selectfont #1}
  \newcommand{\lsCoverAuthorFont}{\fontsize{25pt}{12.5mm}\selectfont}
  \newcommand{\lsCoverSeriesFont}{\sffamily\fontsize{17pt}{7.5mm}\selectfont}			% fontsize?
  \newcommand{\lsCoverSeriesHistoryFont}{\sffamily\fontsize{10pt}{5mm}\selectfont}
  \newcommand{\lsInsideFont}{}	% obsolete, see \setmainfont
  \newcommand{\lsBackTitleFont}{\sffamily\addfontfeatures{Scale=MatchUppercase}\fontsize{25pt}{10mm}\selectfont}
  \newcommand{\lsBackBodyFont}{\lsInsideFont}
  \newcommand{\lsSpineAuthorFont}{\fontsize{12pt}{14pt}\selectfont}
  \newcommand{\lsSpineTitleFont}{\sffamily\fontsize{16pt}{14pt}\selectfont}
\else 	% PDFLaTeX:
  \newcommand{\lsCoverTitleFont}[1]{\sffamily\fontfamily{fxlj}\fontsize{52pt}{16.75mm}\selectfont #1}
  \newcommand{\lsCoverAuthorFont}{\fontencoding{T1}\fontfamily{fxlj}\fontsize{25pt}{12.5mm}\selectfont}
  \newcommand{\lsCoverSeriesFont}{\fontencoding{T1}\fontfamily{phv}\fontseries{sc}\fontsize{14pt}{7.5mm}\selectfont}
  \newcommand{\lsCoverSeriesHistoryFont}{\fontencoding{T1}\fontfamily{phv}\fontseries{b}\fontsize{10pt}{5mm}\selectfont}
  \newcommand{\lsInsideFont}{\fontencoding{T1}\fontfamily{fxlj}\selectfont}
  \newcommand{\lsBackTitleFont}{\lsCoverAuthorFont}
  \newcommand{\lsBackBodyFont}{\lsInsideFont}
  \newcommand{\lsSpineAuthorFont}{\fontsize{12pt}{14pt}\selectfont}
  \newcommand{\lsSpineTitleFont}{\sffamily\fontsize{16pt}{14pt}\selectfont}
  
  \renewcommand{\bfseries}{\textsb}  	% bold -> semibold
\fi

\setkomafont{sectioning}{\normalcolor\bfseries}

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
\definecolor{lsLightGray}{cmyk}{0,0,0,0.17}


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
\newcommand{\tmnlp}{tmnlp}
\newcommand{\lsSeriesFontColor}{white}

\ifx\lsSeries\eotms
 	\newcommand{\lsSeriesTitle}{Empirically Oriented Theoretical \\ Morphology and Syntax, No \lsSeriesNumber}
 	\newcommand{\lsSeriesColor}{lsMidBlue}
\fi
\ifx\lsSeries\eotmsig
 	\newcommand{\lsSeriesTitle}{Implemented Grammars, No \lsSeriesNumber}
	\newcommand{\lsSeriesColor}{lsMidBlue}
\fi
\ifx\lsSeries\sidl
 	\newcommand{\lsSeriesTitle}{Studies in Diversity Linguistics, No \lsSeriesNumber}
 	\newcommand{\lsSeriesColor}{lsDarkGreen}
\fi
\ifx\lsSeries\algad
 	\newcommand{\lsSeriesTitle}{African Language Grammars\\ and Dictionaries, No \lsSeriesNumber}
 	\newcommand{\lsSeriesColor}{lsOrange}
\fi
\ifx\lsSeries\tmnlp
 	\newcommand{\lsSeriesTitle}{Translation and Multilingual Natural\\ Language Processing , No \lsSeriesNumber}
 	\newcommand{\lsSeriesColor}{lsWine}
\fi	

\@ifundefined{blackandwhite}
 	{}
 	{\renewcommand{\lsSeriesColor}{black}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header and footer:

\usepackage{datetime}
\usepackage{scrpage2}
\ohead{\headmark}
\ihead{}
\cfoot{}
\ofoot[]{\pagemark}
\iflsDraft
  \ifoot{Draft of \today, \currenttime}
\fi
%% \ihead{\upshape{\headmark}}
%% \ohead{\pagemark}
%% \cfoot{}
%% \ifoot[]{}
%% \ofoot{\upshape{Draft of \today, \currenttime}}


\renewcommand*{\partpagestyle}{empty}

\pagestyle{scrheadings}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Citation:

\usepackage{natbib}
% unified style sheet for linguistics journals
% put directory in BST_INPUTS
% http://celxj.org/downloads/unified.bst
\bibliographystyle{unified} 
% This does not work ...
%% \setcitestyle{
%% notesep={: }, % 2002: 125
%% aysep={~}     % Gazdar 2002
%% }

% check what the unified people have to say on this.
\bibpunct[: ]{(}{)}{;}{a}{}{,}
\let\citew=\citet


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hyperref:

% Xelatex likes this:
\usepackage[hyphens]{url}
\urlstyle{same}

\usepackage[bookmarks=true,bookmarksopen=true,bookmarksopenlevel=1,%
  hyperindex=true,%
  breaklinks=true,
  draft=false,
  plainpages=false,
  pdfauthor={},%
  pdfkeywords={}
%  ,ps2pdf=true
]{hyperref}

\KOMAoptions{footnotes=multiple}

% xelatex hates this.
%\usepackage{breakurl} 	


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cover:

\newcommand{\lsCoverFontColor}{white}
\newcommand{\lsCoverBlockColor}{\lsSeriesColor}
\setcounter{page}{-3}

\newcommand{\lsCoverBlock}{
	\begin{textblock}{155}(7.6,7.5)
	\color{\lsCoverBlockColor}
	\raggedright\rule{155mm}{225mm}
	\end{textblock}
    \iflsDraft
       \begin{textblock}{155}(30,80)
         \color{lsLightGray}
         \rotatebox{40}{
       		\begin{tabular}{c}
       		\scalebox{10}{DRAFT}\\
       		of \today, \currenttime
       		\end{tabular}}
       \end{textblock}
    \fi}

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
		\raggedright\IfFileExists{langsci_logo_nocolor.pdf}{\includegraphics{langsci_logo_nocolor.pdf}}{langsci logo}  
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

	\begin{textblock}{115}(15,24)  % 30mm-6mm
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
	\sffamily
	ISBN \lsISBN			
	\end{textblock}}

\newcommand{\lsSpine}{			% Book spine
	\renewcommand{\newlineSpine}{\\}
	\renewcommand{\newlineCover}{}
	\begin{textblock}{40}(65,0)
	\rotatebox{90}{\color{black}\fbox{\begin{minipage}[c][\lsSpineBreadth][c]{\paperheight}
		\color{\lsSeriesColor}
		\hspace{7.5mm}
		\IfFileExists{langsci_spinelogo_nocolor.pdf}{$\vcenter{\hbox{\includegraphics[angle=-90,origin=c]{langsci_spinelogo_nocolor.pdf}}}$}{logo}
		\hspace{15mm} 
 		{\lsSpineTitleFont
			\rotatebox[origin=c]{180}{\pbox[c]{150mm}{\@title}}}
		\hspace{13mm}
		{\lsSpineAuthorFont 
			\rotatebox[origin=c]{180}{\pbox[c]{100mm}{\@author}}}
	\end{minipage}}} 
	\end{textblock}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\lsOutputLong}{long}
\newcommand{\lsOutputShort}{short}
\newcommand{\lsOutputInprep}{inprep}


\renewcommand{\maketitle}{
\begin{titlepage}
\thispagestyle{empty}

%\@ifundefined{long}{}{		
\ifx\lsOutput\lsOutputLong				% only if output=long
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

\ifx\lsOutput\lsOutputShort				% only if output=short
  	{\renewcommand{\lsCoverBlockColor}{white}
  	 \renewcommand{\lsCoverFontColor}{black}
  	 \lsFrontPage}
\fi

\ifx\lsOutput\lsOutputInprep				% only if output=inprep
	{\renewcommand{\lsCoverBlockColor}{white}
  	 \renewcommand{\lsCoverFontColor}{black}
  	 \lsCoverBlock
	 \lsCoverTitleAuthor}
\fi								


\setcounter{page}{1}
\end{titlepage}

\null\newpage\thispagestyle{empty}
\hypersetup{colorlinks=false, pdfborder={0 0 0}} 	% for hyperref
\color{black}
\lsInsideFont

\null\vfill

% Impressum:
\ifx\lsOutput\lsOutputInprep
	{}
\else
	{\lsImpressum}
\fi
%%%%%%%%%%%%%

\null\clearpage\thispagestyle{plain}
%\pagenumbering{roman}	% TODO pagenumbering (Change \tableofcontents?)
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Series history:

\newcommand{\lsSeriesHistory}{
\color{black}
\raggedright\lsCoverSeriesHistoryFont
 Series information: name, editors, previous numbers
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

\IfFileExists{FULogo_sw_CMYK.pdf}{\includegraphics[width=5cm]{FULogo_sw_CMYK.pdf}}{FU-Logo} \\
\end{center}
}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% footnotes:

\raggedbottom
\deffootnote[1.5em]{1.5em}{0mm}{\textsuperscript{\normalfont\thefootnotemark}\ }

\KOMAoptions{footnotes=multiple}

% http://tex.stackexchange.com/questions/28465/multiple-footnotes-at-one-point/71015#71015
\let\oldFootnote\footnote
\newcommand\nextToken\relax

\renewcommand\footnote[1]{%
    \oldFootnote{#1}\futurelet\nextToken\isFootnote}

\newcommand\isFootnote{%
    \ifx\footnote\nextToken\textsuperscript{,}\fi}

%\deffootnote{1.5em}{1em}{% 
%    \makebox[1.5em][l]{\thefootnotemark}}

%% % this should be removed here, temporary
%% \newif\if@noftnote\@noftnotetrue
%% \newif\if@xrec\@xrecfalse
%% \@definecounter{fnx}

%% %%%% adapted from latex.tex to get examples in footnotes right
%% \long\def\@footnotetext#1{%
%%     \@noftnotefalse\setcounter{fnx}{0}%
%%     \insert\footins{\reset@font\footnotesize
%%     \interlinepenalty\interfootnotelinepenalty
%%     \splittopskip\footnotesep
%%     \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
%%     \hsize\columnwidth \@parboxrestore
%%    \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
%%     {\rule{\z@}{\footnotesep}\ignorespaces
%%       #1\strut}}\@noftnotetrue}



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

% bidi has to be loaded in the individual documents
%\ifxetex
%\usepackage{bidi} 		% wants to be placed below hyperref, natbib, graphicx, ...
%\fi



\usepackage[figuresright]{rotating}


\endinput
