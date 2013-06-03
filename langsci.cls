\NeedsTeXFormat{LaTeX2e}\ProvidesClass{langsci}[2013/06/02 v0.1 Language Science Publications]


\newcommand{\lsSeriesNumber}{1}
\newcommand{\lsISBN}{98000000}
\newcommand{\lsSeries}{eotms}

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
\DeclareVoidOption{blackandwhite}{
	\newcommand{\blackandwhite}{}}
\DeclareVoidOption{printondemand}{
	\newcommand{\printondemand}{}}
\ProcessKeyvalOptions{langsci}


% TODO
% PrintOnDemand wo die leeren Innenblätter und das eine Blatt mit dem bunten Text eingefügt werden
% Draft-Option an scrbook weiterreichen

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

% for absolute positioning in titlepage
\usepackage[absolute 
			%,showboxes
			]{textpos}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{\TPHorizModule}
\textblockorigin{0mm}{0mm}
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonts and graphics:

\RequirePackage{libertine}	% TODO difference between RequirePackage and usepackage?

\usepackage[utf8]{inputenc}
\usepackage{mathptmx,helvet} % times and helvetia
\usepackage[T1]{fontenc}
\usepackage{microtype}

\usepackage{graphicx}

\newcommand{\lsCoverTitleFont}{\fontencoding{T1}\fontfamily{ptm}\fontshape{sc}\fontsize{52pt}{16.75mm}\selectfont}
\newcommand{\lsCoverAuthorFont}{\fontfamily{ptm}\fontsize{25pt}{12.5mm}\selectfont}
\newcommand{\lsCoverSeriesFont}{\fontencoding{T1}\fontfamily{phv}\fontseries{b}\fontsize{14pt}{7.5mm}\selectfont}
\newcommand{\lsCoverSeriesHistoryFont}{\fontencoding{T1}\fontfamily{phv}\fontseries{b}\fontsize{10pt}{5mm}\selectfont}
\newcommand{\lsInsideFont}{\fontencoding{T1}\fontfamily{fxlj}\fontsize{10.5pt}{5mm}\selectfont}
\newcommand{\lsBackTitleFont}{\lsCoverAuthorFont}
\newcommand{\lsBackBodyFont}{\lsInsideFont}


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

\newcommand{\BackBody}[1]{\renewcommand{\lsBackBody}{#1}} 
\newcommand{\BackTitle}[1]{\renewcommand{\lsBackTitle}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Series information:

\newcommand{\eotms}{eotms}
\newcommand{\lsSeriesFontColor}{white}

\ifx\lsSeries\eotms
 	\newcommand{\lsSeriesTitle}{Empirically Oriented Theoretical \\ Morphology and Syntax, number \lsSeriesNumber}
 	\@ifundefined{blackandwhite}
 		{\newcommand{\lsSeriesColor}{lsLightBlue}}
 		{\newcommand{\lsSeriesColor}{black}}
%\else
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Titlepage:

\newcommand{\lsTitleFontColor}{white}
\newcommand{\lsTitleBlockColor}{\lsSeriesColor}

\newcommand{\lsTitleBlock}{
\begin{textblock}{155}(7.5,7.5)
\color{\lsTitleBlockColor}
\raggedright\rule{155mm}{225mm}
\end{textblock}
}

\newcommand{\lsTitlePage}{
\lsTitleBlock

\begin{textblock}{140}(15,17.5)
\color{\lsTitleFontColor}
\raggedright
\textls[-60]{\lsCoverTitleFont  
	\@title\\} 

\vspace{11.2mm} % 20mm - 25pt

\raggedright
{\lsCoverAuthorFont 
	\@author\\}
\end{textblock}


\begin{textblock}{95}(7.4,209)
\color{\lsTitleFontColor}
\raggedright\rule{3.6mm}{3.5mm}
\hspace{3mm}\parbox[t]{85mm}{\raggedright\lsCoverSeriesFont   
	\lsSeriesTitle\\}
\end{textblock}

\begin{textblock}{33}(124.6,205)
\raggedright\IfFileExists{logo_rz_buch.pdf}{\includegraphics{logo_rz_buch.pdf}}{langsci logo}  
\end{textblock}
}

\newcommand{\lsBackPage}{		% Back page
\lsTitleBlock

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
\end{textblock}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\maketitle}{
\begin{titlepage}
\thispagestyle{empty}

% First titlepage:
{\lsTitlePage}
%%%%%%%%%%%%%%%%%%%

\newpage\thispagestyle{empty}
\null\newpage\thispagestyle{empty}

% First titlepage:
{\lsBackPage}
%%%%%%%%%%%%%%%%%%%

\newpage\thispagestyle{empty}
\null\newpage\thispagestyle{empty}


% Series information:
\lsSeriesHistory
%%%%%%%%%%%%%%%%%%%%%

\null\newpage\thispagestyle{empty}

% Second titlepage:
{\renewcommand{\lsTitleBlockColor}{white}
\renewcommand{\lsTitleFontColor}{\lsSeriesColor}
\lsTitlePage
\setcounter{page}{1}}
%%%%%%%%%%%%%%%%%%%%
\end{titlepage}


\null\newpage\thispagestyle{empty}
\hypersetup{colorlinks=false, pdfborder={0 0 0}} 	% hyperref
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
Titelgestaltung und Designkonzept: \\
Ulrike Harbort \\
www.langsci-press.org \\[3ex]

ein Projekt der FU Berlin \\[3ex]  	% TODO \InputIfFileExists{logo_rz_buch.pdf}{}{}

\IfFileExists{fu_logo.pdf}{\includegraphics{fu_logo.pdf}}{FU-Logo} \\
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
  pdfkeywords={},%
  ps2pdf=true]{hyperref}
\usepackage{breakurl} 	% Must apeear begin hyperref! 
 


\endinput