%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%      File: langscibook.cls
%%    Author: Language Science Press (http://langsci-press.org)
%%      Date: #FIXME UTC
%%   Purpose: This file defines the basic document class 
%%            for books published with Language Science Press.
%%  Language: LaTeX
%%  Copyright 2012- Language Science Press
%%  Licence: This work may be distributed and/or modified under the
%%  conditions of the LaTeX Project Public License, either version 1.3
%%  of this license or (at your option) any later version.
%%  The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%%  and version 1.3 or later is part of all distributions of LaTeX
%%  version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Sebastian Nordhoff.
%% 
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Structure of this file:
%   \- Paths
%   \- Default values of variables
%   \- Definition of conditionals
%   \- Option handling
%   \- MAIN CLASS
%   \- General packages
%   \- print on demand macros
%   \- Output types (book, draft, cover)
%   \- Page geometry
%   \- Fonts 
%   \- Colors
%   \- Book cover
%   \- Series history
%   \- Imprint
%   \- Dedication
%   \- Header and footer
%   \- Sectioning 
%   \- Epigrams
%   \- Footnotes
%   \- Quotes
%   \- Citations
%   \- Floats
%   \- Appendices
%   \- Indexes
%   \- Hyperref 
%   \- Edited volumes (Collection)
%   \_ Miscellaneous
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{langscibook}[2017/06/21 Language Science Press]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     Paths
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\fontpath}{} 
\newcommand{\logopath}{}
\newcommand{\seriesinfopath}{}
\newcommand{\bstpath}{}
\newcommand{\bbxpath}{}
\newcommand{\cbxpath}{}
\newcommand{\stylepath}{}
% Paths can be overwritten with option "nonflat"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     Default values
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
\usepackage{xspace}
\newcommand{\lsp}{Language Science Press\xspace}
\newcommand{\lsSeriesNumber}{??}
\newcommand{\lsISSN}{??}
\newcommand{\lsISBNdigital}{000-0-000000-00-0}
\newcommand{\lsISBNhardcover}{000-0-000000-00-0}
\newcommand{\lsISBNsoftcover}{000-0-000000-00-0}
\newcommand{\lsISBNsoftcoverus}{000-0-000000-00-0}
\newcommand{\lsBookDOI}{??}
\newcommand{\lsChapterDOI}{??}
\newcommand{\lsURL}{http://langsci-press.org/catalog}
\newcommand{\lsSeries}{eotms}
\newcommand{\lsSpineBreadth}{20mm}
\newcommand{\lsOutput}{book} %"short" makes no sense if "long" is deprecated
\newcommand{\lsFontsize}{11pt}
\newcommand{\lsChapterFooterSize}{\small} %footers in editedvolumes
\newcommand{\lsCopyright}{CC-BY}
\newcommand{\lsSpinewidth}{20mm}
\newcommand{\lsBiblatexBackend}{biber}
\newcommand{\logotext}{{\color{red}no logo}}
\newcommand{\lsYear}{\the\year}

\newcommand{\lsBackBody}{Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores.}
\newcommand{\lsBackTitle}{\@title}
\newcommand{\BackTitle}[1]{\renewcommand{\lsBackTitle}{#1}}
\newcommand{\BackBody}[1]{\renewcommand{\lsBackBody}{#1}} 

\newcommand{\newlineCover}{\\}  % \newline only on cover
\newcommand{\newlineSpine}{\\}  % \newline only on spine
\newcommand{\newlineTOC}{\\}    % \newline only in TOC entry

\newcommand{\lsSpineTitle}{\@title}
\newcommand{\lsSpineAuthor}{\@author}
\newcommand{\SpineTitle}[1]{\renewcommand{\lsSpineTitle}{#1}}
\newcommand{\SpineAuthor}[1]{\renewcommand{\lsSpineAuthor}{#1}} 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     Conditionals
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\iflsDraft \lsDraftfalse
\newif\iflsOpenReview \lsOpenReviewfalse
\newif\iflsUndecapitalize \lsUndecapitalizefalse
\newif\iflsShowIndex \lsShowIndexfalse
\newif\iflsBiblatex \lsBiblatextrue
\newif\iflsCollection \lsCollectionfalse
\newif\iflsCollectionChapter \lsCollectionChapterfalse
\newif\iflsCollectionTOCLong \lsCollectionTOCLongfalse
\newif\iflsNewtxmath \lsNewtxmathtrue
\newif\iflsCover \lsCoverfalse %output format is cover
\newif\iflsUscover \lsUscoverfalse
\newif\iflsModfonts \lsModfontsfalse
\newif\iflsNoBabel \lsNoBabelfalse
\newif\iflsMultiauthors \lsMultiauthorsfalse


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     Option handling
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{kvoptions}		% for key-value options
\SetupKeyvalOptions{
	family=langscibook,
	prefix=langscibook@ }
\DeclareStringOption{output}[book]
	\define@key{langscibook}{output}{%
		\renewcommand{\lsOutput}{#1}}
\DeclareStringOption{copyright}[CC-BY]
	\define@key{langscibook}{copyright}{%
		\renewcommand{\lsCopyright}{#1}}
\DeclareStringOption{biblatexbackend}[biber]
	\define@key{langscibook}{biblatexbackend}{%
		\renewcommand{\lsBiblatexBackend}{#1}}
\DeclareStringOption{spinewidth}[20mm]
	\define@key{langscibook}{spinewidth}{%
		\renewcommand{\lsSpinewidth}{#1}} 
\DeclareVoidOption{smallfont}{  			
	\renewcommand{\lsFontsize}{10pt}}
\DeclareVoidOption{undecapitalize}{  			
	\lsUndecapitalizetrue }	
\DeclareVoidOption{draftmode}{	% 'draftmode' instead of 'draft' due to undesirable side efects	
	 \lsDrafttrue
	 \overfullrule=5pt	}	% to indicate overfull hboxes
\DeclareVoidOption{openreview}{
	\lsOpenReviewtrue%
	\AtBeginDocument{\renewcommand{\lsISBNdigital}{000-0-000000-00-0}}}
\DeclareVoidOption{nonflat}{  			
	\renewcommand{\fontpath}{./langsci/fonts/} 
	\renewcommand{\logopath}{./langsci/graphics/}
	\renewcommand{\seriesinfopath}{./langsci/seriesinfo/}
	\renewcommand{\bstpath}{./langsci/bst/}
  \renewcommand{\bbxpath}{\bstpath biblatex-sp-unified/bbx/}
  % \renewcommand{\bbxpath}{\bstpath}
  \renewcommand{\cbxpath}{\bstpath biblatex-sp-unified/cbx/}
  % \renewcommand{\cbxpath}{\bstpath}
	\renewcommand{\stylepath}{./langsci/styles/}	
}
\DeclareVoidOption{nobabel}{  			
    \lsNoBabeltrue}
\DeclareVoidOption{modfonts}{  			
    \lsModfontstrue}
\DeclareVoidOption{multiauthors}{  			
    \lsMultiauthorstrue}
\DeclareVoidOption{showindex}{  			
	\lsShowIndextrue}
\DeclareVoidOption{biblatex}{  			
	\lsBiblatextrue}
\DeclareVoidOption{bibtex}{
  \ClassWarningNoLine{langscibook}{BibTeX frontend deprecated. Please use BibLaTeX in the final version}
	\lsBiblatexfalse}
\DeclareVoidOption{nonewtxmath}{  			
	\lsNewtxmathfalse}
\DeclareVoidOption{collection}{  			
	\lsCollectiontrue}
\DeclareVoidOption{collectionchapter}{  			
	\lsCollectiontrue%
	\lsCollectionChaptertrue}
\DeclareVoidOption{collectiontoclong}{  			
	\lsCollectiontrue%
	\lsCollectionTOCLongtrue} 
\ProcessKeyvalOptions{langscibook}
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     Class
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\LoadClass[
  fontsize=\lsFontsize, % default is 11pt
  footnotes=multiple,
  numbers=noenddot,   % no point after last number of chapters/sections
  toc=bibliography,
  index=totoc,
  %chapterprefix=true,
  %draft=yes,
  %appendixprefix
  ]{scrbook}	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     Packages
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{morewrites} %more helper files to write to
\usepackage{etex}
\reserveinserts{18}
\usepackage{xstring}	 
\usepackage{graphicx}	
\usepackage{hyphenat}	

\usepackage{tikz} % Needed for covers and advert page
	\usetikzlibrary{positioning}
	\usetikzlibrary{calc}

\usepackage{pbox}   % boxes with maximum width
\usepackage[hyphens]{url}
\urlstyle{same}

	
%% standard commands
\usepackage{\stylepath langsci-basic}
%% useful commands for glossings:
% \usepackage{\stylepath langsci-lgr} #FIXME this should probably be replaced by \usepackage{leipzig}
\usepackage{todonotes}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%      Print on demand macros
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Basic cover commands, including PGF layers
\newcommand{\podsetup}{
  \lsCovertrue
  \renewcommand{\maketitle}{}  %no need for this
  \StrLen{\@subtitle}[\subtitleStrLen]     % Get the length of the subtitle. Later, we use this length to check if a subtitle exists.
  \pagestyle{empty}
  \pgfdeclarelayer{lspcls_bg}    % Create a background layer that serves as the canvas for the coloured rectangles.
  \pgfsetlayers{lspcls_bg,main}  % Order the background layer behind the main layer of TikZ.
  \renewcommand{\and}{, }% 
  \renewcommand{\lastand}{ \& }%  
  \renewcommand{\affiliation}[1]{}
}

% \usepackage[outline]{contour}

% Content creation for the spine. Including Logo, author, title, and volume number on spine. 
\newcommand{\podspine}{  
  \renewcommand{\newlineCover}{}
  \renewcommand{\and}{, }
  \renewcommand{\lastand}{ \& }
  \node [above = 0mm of CoverSpine.south, anchor=base] (lspcls_spinelogo) {\color{\lsSeriesColor}\includegraphics{\logopath langsci_spinelogo_nocolor.pdf}};
% add number on spine
% inside logo
%   \node [below = -7mm of lspcls_spinelogo] (lspcls_splinenumber)  { \hspace*{4mm}{\parbox{.37cm}{\centering \contour{\lsSeriesColor}{\color{white}\sffamily \large \lsSeriesNumber }}}};
% bottom centered
%   \node [below = -1mm of lspcls_spinelogo] (lspcls_splinenumber)  {\color{\lsSeriesColor} \hspace*{4mm}{\parbox{.37cm}{\centering\sffamily \large \lsSeriesNumber }}};
% bottom leftaligned
%   \node [below = -1mm of lspcls_spinelogo] (lspcls_splinenumber)  {\color{\lsSeriesColor} \hspace*{4mm}{\parbox{.37cm}{\sffamily \large \lsSeriesNumber }}};
%
\node [below = 0mm of CoverSpine.north, anchor=north] (lspcls_splinenumber)  {\color{\lsSeriesColor} 
  {\parbox{.47cm}{
   \centering
    \sffamily 
    \huge
    \lsSeriesNumber 
  }
  }
};

  \node [font=\fontsize{18pt}{14pt}\selectfont, above left = 15mm and 4mm of lspcls_spinelogo.north, rotate=270] (lspcls_spinetitle) {\color{\lsSeriesColor} \lsSpineAuthorFont{\lsSpineAuthor\xspace\lsEditorSuffix} \hspace{13mm} \lsSpineTitleFont{\lsSpineTitle}}; 
  \renewcommand{\newlineCover}{\\}
}

% Fill the canvas for the cover with coloured areas on back and front cover
% Argument 1: White margin that encompasses the coloured title and backtitle form. Input: 12.34mm
% Argument 2: Height of the coloured title and backtitle form and of the spine. Input: 12.45cm
% Argument 3: Width  of the coloured title and backtitle form. Input: 12.45cm
\newcommand{\podgeometry}[3]{
    \begin{pgfonlayer}{lspcls_bg} % Draw on the background layer
      \node [ bg, % Draw the coloured background on the front cover
	      left = #1 of current page.east, 
	      fill=\lsSeriesColor, 
	      minimum height=#2, 
	      minimum width=#3
	     ] (CoverColouredRectangleFront) {}; % Die können wir noch dynamisch bestimmen % 7.5mm -> 10.675mm for bleed
      \node [ bg, % Draw the coloured background on the back cover 
              right = #1 of current page.west, 
              fill=\lsSeriesColor, 
              minimum height=#2, 
              minimum width=#3  
            ] (CoverColouredRectangleBack) {}; 
      \node at (current page.center) [ % Create a reference node for the spine
              bg, 
              minimum height=#2, 
              minimum width=\spinewidth,dashed
            ] (CoverSpine) {}; % add [draw] option for preview mode 
    \end{pgfonlayer}   
}

% Generates the content of the back cover
% Argument 1: Text width, corresponding to Argument 1 of \podfrontcovertoptext
\newcommand{\podbackcover}[1]{
  \node [ font=\fontsize{25pt}{10mm}\selectfont, 
          right,
          below right = 10mm and 7.5mm of CoverColouredRectangleBack.north west, 
          text width=#1
         ] (lspcls_backtitle) {\color{\lsCoverFontColour}\lsBackTitleFont{\raggedright\lsBackTitle\par}};
  \node [ below = 10mm of lspcls_backtitle,
          text width=#1,
          align=justify
        ] {\color{\lsCoverFontColour}\lsBackBodyFont{\parindent=15pt\lsBackBody}};
 \node [  below right = 192.5mm and 97.5mm of CoverColouredRectangleBack.north west, 
          text width=4cm] {%
    \colorbox{white}{
      \begin{pspicture}(0,0)(4.1,1in)
        \psbarcode[transx=.4,transy=.3]{\lsISBNcover}{includetext height=.7}{isbn}%
      \end{pspicture}
      }
    };
}

% Generates the content on the front cover, including title, author, subtitle. See below for remaining commands
% Argument 1: Text width on the front cover. Input: 12.34mm
% Argument 2: Font size on the front cover. Adjust to compensate varying text width. Input: 12.34pt
\newcommand{\podfrontcovertoptext}[2]{
  \newcommand{\lsCoverFontColour}{white}
  \renewcommand{\and}{\\}
  \renewcommand{\lastand}{\\}
  
  \node [ execute at begin node={}, 
          font=\fontsize{#2}{17.25mm}\selectfont, 
          below right = 10mm and 7.5mm of CoverColouredRectangleFront.north west, 
          text width=#1, 
          align=left
        ] (lspcls_covertitle) {\color{\lsCoverFontColour}\lsCoverTitleFont{\raggedright\@title\par}};
  
  \ifnum\subtitleStrLen=0  % Is there a subtitle? If no, just print the author.
  \node [ font=\fontsize{25pt}{12.5mm}\selectfont, 
          right, 
          below = 11.2mm of lspcls_covertitle.south, 
          text width=#1
        ] {\color{\lsCoverFontColour}\lsCoverAuthorFont\nohyphens{\lsEditorPrefix\@author\par}}; 
  \else % If yes, create a node for subtitle and author
  \node [ font=\fontsize{25pt}{10mm}\selectfont,
          below = 8mm of lspcls_covertitle.south, 
          text width=#1
        ] (lspcls_coversubtitle) {\color{\lsCoverFontColour} \lsCoverSubTitleFont \nohyphens{\@subtitle}\par}; 
  \node [
          font=\fontsize{25pt}{12.5mm}\selectfont, 
          right, 
          below = 11.2mm of lspcls_coversubtitle.south, 
          text width=#1
        ] {\color{\lsCoverFontColour}\lsCoverAuthorFont{\nohyphens{\lsEditorPrefix\@author\par}}};
  \fi
}

% Generates the bottom half of the front cover content: series, series number, logo.
\newcommand{\podcoverbottomtext}{
  \node [ above right = 18.5mm and -.1mm of CoverColouredRectangleFront.south west, 
          rectangle, 
          fill=white, 
          minimum size=17pt] (lspcls_square) {}; % This is the white square at the bottom left of the front cover
  \node [ above left = 10mm and 7.5mm of CoverColouredRectangleFront.south east] {\color{\lsCoverFontColour}\includegraphics{\logopath langsci_logo_nocolor.pdf}}; % Print the Language Science press Logo
  \path let \p1 = (lspcls_square.north east), % Calculate the exact coordinates for the Series Title to print.
            \p2 = (lspcls_covertitle.west) 
            in node at (\x2,\y1) (lspcls_seriesinfo) [
                  font=\fontsize{17pt}{7.5mm}\selectfont,
                  right,
                  text width=95mm,
                  anchor=north west] 
            {\color{\lsCoverFontColour}\lsCoverSeriesFont{\lsSeriesTitle\par}};  
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%      Output types  
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \newcommand{\lsOutputLong}{long}
\newcommand{\lsOutputBook}{book}             % standard book 
\newcommand{\lsOutputInprep}{inprep}          % marks manuscript as in preparation
\newcommand{\lsOutputPaper}{paper}            % paper in edited volume
\newcommand{\lsOutputGuidelines}{guidelines}  % guidelines 
\newcommand{\lsOutputCoverBODsc}{coverbodsc}      % cover with BoD measurements 
\newcommand{\lsOutputCoverBODhc}{coverbodhc}      % cover with BoD measurements 
\newcommand{\lsOutputCoverCS}{covercreatespace} % cover with CreateSpace measurements


%% Output types are defined with \newcommand above so they can be used with geometry.

\AtBeginDocument{
\ifx\lsOutput\lsOutputPaper       % only if output=paper
  \usepackage{chngcntr}
  \counterwithout{figure}{chapter}
  \counterwithout{table}{chapter}
  \lsPaper
\else                 % only if output!=paper
\renewcommand{\maketitle}{
\begin{titlepage}
\thispagestyle{empty}
 

\ifx\lsOutput\lsOutputBook   % only if output=book
  \setcounter{page}{-1}
  %% First titlepage:
  {\lsFrontPage}
  %%%%%%%%%%%%%%%%%%%
  \newpage\thispagestyle{empty}
  \null\newpage\thispagestyle{empty}
  %% Series information:
  {\lsSeriesHistory}
  %%%%%%%%%%%%%%%%%%%%%
  \newpage\thispagestyle{empty}
  %% Schmutztitel:
  {\renewcommand{\lsCoverBlockColor}{white}
   \renewcommand{\lsCoverFontColor}{\lsSeriesColor}
  \lsSchmutztitel}
  %%%%%%%%%%%%%%%%%%%%
  \AtEndDocument{
    \lsPageStyleEmpty
    \null\newpage\thispagestyle{empty}
    %% Advertisement:
    {\lsAdvertisement}
    \null\newpage\thispagestyle{empty}
    %% Back page:
    {\lsBackPage}
    \null\newpage\thispagestyle{empty}
  }
\fi 

\ifx\lsOutput\lsOutputInprep          % only if output=inprep
  {\renewcommand{\lsCoverBlockColor}{white}
   \renewcommand{\lsCoverFontColor}{black}
   \lsCoverBlock
   \lsCoverTitleAuthor}
\fi               

\ifx\lsOutput\lsOutputGuidelines        % only if output=guidelines
  {\setcounter{page}{-1}
  \renewcommand{\lsAdvertisement}{}
  %% First titlepage:
  {\lsFrontPage}
  }

\fi

\ifx\lsOutput\lsOutputCoverBODhc         % only if output=cover 
  \podsetup  
  \begin{tikzpicture}[remember picture, overlay,bg/.style={outer sep=0}] 
    \podgeometry{24.2mm}{23.1cm}{15.5cm}
    \podspine 
    \podfrontcovertoptext{140mm}{51pt} % Due to different cover sizes, the text size was adjusted so that the difference in line breaks would be minimal between hard and softcover books. 
    \podcoverbottomtext
    \newcommand{\lsISBNcover}{\lsISBNhardcover}
    \podbackcover{137mm}  
  \end{tikzpicture}  
  %exit the document right here
  \end{titlepage}
  \end{document}    
  \fi 
  

\ifx\lsOutput\lsOutputCoverBODsc         % only if output=cover 
  \podsetup  
  \begin{tikzpicture}[remember picture, overlay,bg/.style={outer sep=0}] 
    \podgeometry{13.75mm}{23.1cm}{15.5cm}
    \podspine 
    \podfrontcovertoptext{140mm}{51pt} % Due to different cover sizes, the text size was adjusted so that the difference in line breaks would be minimal between hard and softcover books. 
    \podcoverbottomtext
    \newcommand{\lsISBNcover}{\lsISBNsoftcover}
    \podbackcover{137mm}  
  \end{tikzpicture}  
  %exit the document right here
  \end{titlepage}
  \end{document}    
  \fi 
  
  
%   ============================
\ifx\lsOutput\lsOutputCoverCS        % only if output=covercs   
  \podsetup
  \begin{tikzpicture}[remember picture, overlay,bg/.style={outer sep=0}]
    \podgeometry{10.675mm}{22.5cm}{15.5cm}
    \podspine
    \podfrontcovertoptext{140mm}{52pt} % Due to different cover sizes, the text size was adjusted so that the difference in line breaks would be minimal between hard and softcover books.
    \podcoverbottomtext
%     %unclear why this was different between BOD and CS
%     %-----------------------------
%     \node [above right = 18.5mm and -.1mm of CoverColouredRectangleFront.south west, rectangle, fill=white, minimum size=17pt] (lspcls_square) {}; % 2
%     \node [above left = 10mm and 7.5mm of CoverColouredRectangleFront.south east] {\color{\lsCoverFontColour}\includegraphics{\logopath langsci_logo_nocolor.pdf}};
% %     \node [below right = 197.5mm and 117.1mm of CoverColouredRectangleFront.north west] {\color{\lsCoverFontColour}\includegraphics{\logopath langsci_logo_nocolor.pdf}};
%     \path let \p1 = (lspcls_square.north east), \p2 = (lspcls_covertitle.west) in node at (\x2,\y1) (lspcls_seriesinfo) [font=\fontsize{17pt}{7.5mm}\selectfont, right, text width=95mm, anchor=north west] {\color{\lsCoverFontColour}\lsCoverSeriesFont{\lsSeriesTitle\par}};
%     %-----------------------------
	\iflsUscover\newcommand{\lsISBNcover}{\lsISBNsoftcoverus}\else\newcommand{\lsISBNcover}{\lsISBNsoftcover}\fi
    \podbackcover{140mm}
  \end{tikzpicture} 
  %exit the document right here  
  \end{titlepage}
  \end{document}      
\fi   
    
\end{titlepage}

\frontmatter
\renewcommand{\frontmatter}{}

\null\newpage\thispagestyle{empty}
\hypersetup{colorlinks=false, pdfborder={0 0 0}}  % for hyperref
\color{black}
\lsInsideFont

%% Imprint:
\ifx\lsOutput\lsOutputInprep{}
\else{
  \ifx\lsOutput\lsOutputGuidelines{}
  \else{\lsImpressum}
  \fi}
\fi
%%%%%%%%%%%%%

\null\newpage\thispagestyle{plain}
%\pagenumbering{roman}    % or \frontmatter

%% Dedication:
\ifx\@dedication\empty{}
\else{\lsDedication}
\fi
%%%%%%%%%%%%%%%%

} %% \maketitle
\fi

%% for those who like the example in numbered example sentences to be typeset in italics
%% this is possible for a complete series only.
\ifx\lsSeries\sidl
  %\def\exfont{\normalsize\itshape}
  \renewcommand{\eachwordone}{\itshape} % only \gll
  
  \let\oldtable\table   % footnotes in tables without horizontal line
  \let\endoldtable\endtable
  \renewenvironment{table}{\setfootnoterule{0pt}\oldtable}{\endoldtable} 
\fi

\ifx\lsSeries\pmwe
 \renewcommand{\eachwordone}{\itshape} 
\fi

\ifx\lsSeries\nc
 \renewcommand{\eachwordone}{\itshape} 
\fi



} %% \AtBeginDocument




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Geometry
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 
% For output type cover
% \usepackage{catchfilebetweentags}
\newlength{\csspine}   % CS spine width algorithm, when page count is known:  Total Page Number (excluding cover), usually (Total Page - 3) * 0.0572008 mm 
\newlength{\bodspine}  % BoD spine width algorithm located at http://www.bod.de/hilfe/coverberechnung.html (German only, please contact LangSci for help)
\newlength{\bleed}
\newlength{\seitenbreite}
\newlength{\seitenhoehe}
\newlength{\spinewidth}
\newlength{\totalwidth}
\newlength{\totalheight}
% \IfFileExists{./localmetadata.tex}{\ExecuteMetaData[localmetadata.tex]{coverdimen}}{\typeout{No local meta data found, therefore default spline length was chosen}} % Get only the information between the tag "coverdimen" from localmetadata.tex
\setlength{\bleed}{3.175mm}
\setlength{\spinewidth}{\lsSpinewidth} % Create Space Version
\usepackage{calc}
 
 \ifx\lsOutput\lsOutputCoverCS % if output = cover; This is the CreateSpace Version  
    \lsCovertrue
    \setlength{\bleed}{3.175mm}
    \setlength{\seitenbreite}{169.9mm}
    \setlength{\seitenhoehe}{244.1mm} 	
    

    \setlength{\totalwidth}{\spinewidth+\seitenbreite+\seitenbreite+\bleed+\bleed}
    \setlength{\totalheight}{\seitenhoehe+\bleed+\bleed}
    \usepackage[paperheight=\totalheight, paperwidth=\totalwidth]{geometry}
    \hyphenpenalty 750
\fi
 	   
\ifx\lsOutput\lsOutputCoverBODhc 
  \lsCovertrue 	 
  \newlength{\bodfold}
  \newlength{\totalspine}
  \setlength{\bodfold}{8mm}
  \setlength{\seitenbreite}{192mm}
  \setlength{\seitenhoehe}{280mm} % For BOD: Hardcover, Runder Rücken, Kaschiert, papier 80g/m², weiß, Papier 17x24cm
%   \setlength{\spinewidth}{\bodspine}  
%   \setlength{\totalspine}{\spinewidth+\bodfold+\bodfold}
  \setlength{\totalspine}{\spinewidth} 
  \setlength{\totalwidth}{\spinewidth+\seitenbreite+\seitenbreite}
  \setlength{\totalheight}{\seitenhoehe}
  \usepackage[paperheight=\totalheight, paperwidth=\totalwidth]{geometry}
  \hyphenpenalty 750
\fi
  
 	   
\ifx\lsOutput\lsOutputCoverBODsc 
  \lsCovertrue
  \newlength{\totalspine}
  \setlength{\seitenbreite}{170mm}
  \setlength{\seitenhoehe}{240mm} % For BOD: Softcover, papier 80g/m², weiß, Papier 17x24cm
  \setlength{\bleed}{5mm}
  \setlength{\totalspine}{\spinewidth} 
  \setlength{\totalwidth}{\spinewidth+\seitenbreite+\seitenbreite+\bleed+\bleed}
  \setlength{\totalheight}{\seitenhoehe+\bleed+\bleed}
  \usepackage[paperheight=\totalheight, paperwidth=\totalwidth]{geometry}
  \hyphenpenalty 750
\fi
  
%Page size and text area if not cover 

\iflsCover
%output types cover have already been handled
\else % output != cover
  \usepackage[ 					
  papersize={170mm,240mm}
  ,top=27.4mm % TODO nachgemessen, nach Vermassung eigentlich 30mm-16pt = 25.8mm
  ,inner=20.5mm, 
  ,outer=24.5mm
  %,showframe,pass
  ,marginparwidth=50pt
  ]{geometry}
\fi			

\usepackage[
	absolute 		% for absolute positioning in titlepage
	%,showboxes
	]{textpos}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{\TPHorizModule}
\textblockorigin{0mm}{0mm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Fonts 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{ifxetex}
\ifxetex\else\ClassError{langsci/langscibook}{Please use XeLaTeX!}{}\fi	
\usepackage{amssymb} % has to be loaded before other stuff
\PassOptionsToPackage{no-math}{fontspec} % must appear before metalogo or any fontspec stuff; deactivates fontspec's math settings, which is necessary to let newtxmath do the job 
\usepackage{metalogo}\newcommand{\xelatex}{\XeLaTeX\xspace}
\usepackage{dejavu}
\usepackage{libertine}

\setmonofont[
	Ligatures={TeX},Scale=MatchLowercase,
	BoldFont = DejaVuSansMono-Bold.ttf ,
	SlantedFont = DejaVuSansMono-Oblique.ttf ,				
	BoldSlantedFont = DejaVuSansMono-BoldOblique.ttf 		
	]{DejaVuSansMono.ttf}

\iflsModfonts{% use Langsci fonts
  \setsansfont[
	  %Ligatures={TeX,Common},		% not supported by ttf
	  Scale=MatchLowercase,
	  Path=\fontpath,
	  BoldFont = Arimo-Bold_B.ttf ,
	  ItalicFont = Arimo-Italic_B.ttf ,				
	  BoldItalicFont = Arimo-BoldItalic_B.ttf 		
	  ]{Arimo_B.ttf}
		  

  \setmainfont[
	  Ligatures={TeX,Common},
	  Path=\fontpath,
	  PunctuationSpace=0,
	  Numbers={Proportional},
	  BoldFont = LinLibertine_RZ_B.otf ,
	  ItalicFont = LinLibertine_RI_B.otf ,
	  BoldItalicFont = LinLibertine_RZI_B.otf,
	  BoldSlantedFont = LinLibertine_RZ_B.otf,
	  SlantedFont    = LinLibertine_R_B.otf,
	  SlantedFeatures = {FakeSlant=0.25},
	  BoldSlantedFeatures = {FakeSlant=0.25},
	  SmallCapsFeatures = {FakeSlant=0},
	  ]{LinLibertine_R_B.otf}		
\else % use standard fonts
    \setsansfont[
	  %Ligatures={TeX,Common},		% not supported by ttf
	  Scale=MatchLowercase,
	  Path=\fontpath,
	  BoldFont = Arimo-Bold.ttf ,
	  ItalicFont = Arimo-Italic.ttf ,				
	  BoldItalicFont = Arimo-BoldItalic.ttf 		
	  ]{Arimo-Regular.ttf}
		  

  \setmainfont[
	  Ligatures={TeX,Common},
	  Path=\fontpath,
	  PunctuationSpace=0,
	  Numbers={Proportional},
	  BoldFont = LinLibertine_RZ.otf ,
	  ItalicFont = LinLibertine_RI.otf ,
	  BoldItalicFont = LinLibertine_RZI.otf,
	  BoldSlantedFont = LinLibertine_RZ.otf,
	  SlantedFont    = LinLibertine_R.otf,
	  SlantedFeatures = {FakeSlant=0.25},
	  BoldSlantedFeatures = {FakeSlant=0.25},
	  SmallCapsFeatures = {FakeSlant=0},
	  ]{LinLibertine_R.otf}		

\fi

\iflsNewtxmath		% some users have problems when installing newtxmath
% 	\usepackage[libertine]{newtxmath}

	%% following http://tex.stackexchange.com/questions/297328/xelatex-does-not-load-newtxmath-with-linuxlibertine-sometimes
	%% due to a bug in XeTeX; unfortunately this is NOT extensively tested!
	\usepackage{xpatch}
	\xpretocmd{\textsuperscript}
	 {{\sbox0{$\textstyle x$}}}
	 {}{}
	\AtBeginDocument{%
	  \DeclareSymbolFont{operators}{\encodingdefault}{\familydefault}{m}{n}%
	  \SetSymbolFont{operators}{bold}{\encodingdefault}{\familydefault}{b}{n}%
	}	
\fi 	

\let\oldtabular\tabular	% number in tabulars
\let\endoldtabular\endtabular
\renewenvironment{tabular}{\normalfont\addfontfeatures{Numbers=Lining}\selectfont\oldtabular}{\endoldtabular}

%\frenchspacing			
\usepackage[final]{microtype}

\newcommand{\lsCoverTitleFont}[1]{\sffamily\addfontfeatures{Scale=MatchUppercase}\fontsize{52pt}{17.25mm}\selectfont #1}
\newcommand{\lsCoverSubTitleFont}{\sffamily\addfontfeatures{Scale=MatchUppercase}\fontsize{25pt}{10mm}\selectfont}
\newcommand{\lsCoverAuthorFont}{\fontsize{25pt}{12.5mm}\selectfont}
\newcommand{\lsCoverSeriesFont}{\sffamily\fontsize{17pt}{7.5mm}\selectfont}			% fontsize?
\newcommand{\lsCoverSeriesHistoryFont}{\sffamily\fontsize{10pt}{5mm}\selectfont}
\newcommand{\lsInsideFont}{}	% obsolete, see \setmainfont
\newcommand{\lsDedicationFont}{\fontsize{15pt}{10mm}\selectfont}
\newcommand{\lsBackTitleFont}{\sffamily\addfontfeatures{Scale=MatchUppercase}\fontsize{25pt}{10mm}\selectfont}
\newcommand{\lsBackBodyFont}{\lsInsideFont}
\newcommand{\lsSpineAuthorFont}{\bfseries\fontsize{16pt}{14pt}\selectfont}
\newcommand{\lsSpineTitleFont}{\sffamily\bfseries\fontsize{18pt}{14pt}\selectfont}

\setkomafont{sectioning}{\normalcolor\bfseries}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Colors:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{xcolor}
\input{\seriesinfopath langsci-series.def} % \lsSeriesColor, \lsSeriesTitle, \lsISSN and colors are defined here

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Cover:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{pst-barcode}          % for generating bar codes 
\newcommand{\lsCoverFontColor}{white}
\newcommand{\lsCoverBlockColor}{\lsSeriesColor} 
   
   
\newcommand{\lsEditorPrefix}{}
\newcommand{\lsEditorSuffix}{}
\iflsCollection   % for collections: set \lsEditorSuffix depending on \@author
  \AtBeginDocument{
    \renewcommand{\newlineCover}{}
    \renewcommand{\newlineSpine}{}  
    \renewcommand{\lsEditorPrefix}{{\Large Edited by\\}}  
    \renewcommand{\lsEditorSuffix}{(ed.)}
      \iflsMultiauthors
	\renewcommand{\lsEditorSuffix}{(eds.)} 
      \fi
  }
\else
\fi

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
  \fi
  \iflsOpenReview
    \iflsDraft
      \ClassError{langsci/langscibook}{Open review mode not compatible with draft mode. Please disable one of them}{} 
    \fi
    \begin{textblock}{170}(-20,75)
      \rotatebox{30}{
      \colorbox{red}{
      \parbox[c][15ex][c]{220mm}{\centering\lsCoverTitleFont\color{white}Open Review\\[-0.1ex]}
      % \begin{tabular}{c}
      %   ~\\
      %   \scalebox{6}{\color{red}Open Review}\\[-0.5ex]
      %   ~%version of \today, \currenttime
      % \end{tabular}
      }
      }
     \end{textblock}
  \fi
  \iflsUndecapitalize 
    \begin{textblock}{170}(-20,75)
      \rotatebox{30}{
      \colorbox{red}{
      \parbox[c][15ex][c]{220mm}{\centering\lsCoverTitleFont\color{white}Undecapitalized\\[-0.1ex]}
      % \begin{tabular}{c}
      %   ~\\
      %   \scalebox{6}{\color{red}Open Review}\\[-0.5ex]
      %   ~%version of \today, \currenttime
      % \end{tabular}
      }
      }
     \end{textblock}
  \fi
  
  }

\newcommand{\lsCoverTitleAuthor}{
  \renewcommand{\and}{\\}
  \renewcommand{\lastand}{\\}
  \renewcommand{\newlineCover}{\\}
  \renewcommand{\newlineSpine}{}
  \lsCoverBlock

  \begin{textblock}{140}(15,17.5)
  \color{\lsCoverFontColor}
  \raggedright
  {\lsCoverTitleFont{\@title\\}}

  \ifx\@subtitle\empty
  \else \vspace{8mm} {\lsCoverSubTitleFont \@subtitle\\}
  \fi

  \vspace{11.2mm} % 20mm - 25pt
 
  \raggedright
  {\lsCoverAuthorFont 
    \lsEditorPrefix\@author\\}
  \end{textblock}}

\newcommand{\lsCoverSeries}{
  \begin{textblock}{95}(7.4,209)
  \color{white}
  \raggedright\rule{3.6mm}{3.5mm}
  \color{\lsCoverFontColor}
  \hspace{3mm}\parbox[t]{85mm}{\raggedright\lsCoverSeriesFont   
    \lsSeriesTitle\\}
  \end{textblock}}

\newcommand{\lsCoverLogo}{    
  \begin{textblock}{33}(124.6,205)
    \raggedright\IfFileExists{\logopath langsci_logo_nocolor.pdf}{\includegraphics{\logopath langsci_logo_nocolor.pdf}}{langsci logo}  
  \end{textblock}}

\newcommand{\lsFrontPage}{    % Front page
  \lsCoverBlock
  \lsCoverTitleAuthor
  \lsCoverSeries
  \lsCoverLogo}

\newcommand{\lsSchmutztitel}{ % Schmutztitel
  \lsCoverBlock
  \lsCoverTitleAuthor
  \lsCoverLogo}

%\usepackage{pdfpages}
\newcommand{\lsAdvertisement}{
  \include{\logopath langsci-advertisement}
}

\newcommand{\lsBackPage}{   % Back page
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

  \begin{textblock}{40}(105,200)
    \lsBackBodyFont\sffamily
    \colorbox{white}{%
    \begin{pspicture}(0,0)(4.1,1in)
    \psbarcode[transx=0.4,transy=0.3]{\lsISBNdigital}{includetext height=0.7}{isbn}
    \end{pspicture}
    }%  
  \end{textblock}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Series history:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\lsSeriesHistory}{
\color{black}
\raggedright\lsCoverSeriesHistoryFont

\IfFileExists{\seriesinfopath \lsSeries-info.tex}{\input{\seriesinfopath\lsSeries-info}}{
  Series information: \seriesinfopath \lsSeries-info.tex not found!} 

\IfStrEq{\lsISSN}{??}   % \IfStrEq from xstring
  {}
  {\vfill\hfill ISSN: \lsISSN}

}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Imprint:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% for imprint:
\def\translator#1{\gdef\@translator{#1}}
\translator{}

\def\typesetter#1{\gdef\@typesetter{#1}}
\typesetter{}

\def\proofreader#1{\gdef\@proofreader{#1}}
\proofreader{}

\def\openreviewer#1{\gdef\@openreviewer{#1}}
\openreviewer{}

\def\illustrator#1{\gdef\@illustrator{#1}}
\illustrator{}

\newcommand{\lsAdditionalFontsImprint}{}
\newcommand{\AdditionalFontImprint}[1]{
  \edef\fontstemp{\lsAdditionalFontsImprint}
  \renewcommand{\lsAdditionalFontsImprint}{\fontstemp, #1}
}
  
%\def\@author{\@latex@warning@no@line{No \noexpand\author given}}
\newcommand{\ISBNdigital}[1]{\renewcommand{\lsISBNdigital}{#1}}
\newcommand{\ISBNsoftcover}[1]{\renewcommand{\lsISBNsoftcover}{#1}}
\newcommand{\ISBNsoftcoverus}[1]{\renewcommand{\lsISBNsoftcoverus}{#1}}
\newcommand{\ISBNhardcover}[1]{\renewcommand{\lsISBNhardcover}{#1}}

\newcommand{\URL}[1]{\renewcommand{\lsURL}{#1}}
\newcommand{\Series}[1]{\renewcommand{\lsSeries}{#1}}
\newcommand{\SeriesNumber}[1]{\renewcommand{\lsSeriesNumber}{#1}}
\newcommand{\BookDOI}[1]{\renewcommand{\lsBookDOI}{#1}}
  
\newcommand{\lsImpressumCitationText}{
  \onlyAuthor
  \renewcommand{\newlineCover}{}
  \renewcommand{\newlineSpine}{}
  {\@author}\if\lsEditorSuffix\empty\else\ \lsEditorSuffix\fi. %
  {\lsYear}. %
  \textit{\@title}\if\@subtitle\empty\else: \textit{\@subtitle}\fi\ %
  (\lsSeriesTitle). %
  Berlin: Language Science Press.
}

\newcommand{\lsImpressum}{
\raggedright

\lsImpressumCitationText

\vfill

This title can be downloaded at:\\
\url{\lsURL}

© \lsYear, \iflsCollection the authors\else\@author\fi

\newcommand{\ccby}{CC-BY} 
\ifx\lsCopyright\ccby 
Published under the Creative Commons Attribution 4.0 Licence (CC BY 4.0):
http://creativecommons.org/licenses/by/4.0/ 
\else
Published under the Creative Commons Attribution-NoDerivatives 4.0 Licence (CC BY-ND 4.0):
http://creativecommons.org/licenses/by-nd/4.0/ 
\fi
 
\begin{tabular}{@{}l@{~}l}
ISBN: & 
\IfStrEq{\lsISBNdigital}{000-0-000000-00-0} 
{\color{red}no digital ISBN}
{\lsISBNdigital~(Digital)}
\\
&
\IfStrEq{\lsISBNhardcover}{000-0-000000-00-0} 
{\color{red}no hardcover ISBN}
{\lsISBNhardcover~(Hardcover)}
\\&
\IfStrEq{\lsISBNsoftcover}{000-0-000000-00-0} 
{\color{red}no softcover ISBN}
{\lsISBNsoftcover~(Softcover)}
\\
%       & \lsISBNhardcover~(Hardcover)\\
%       & \lsISBNsoftcover~(Softcover)\\
%       & \lsISBNsoftcoverus~(Softcover US)\\
\end{tabular}

\IfStrEq{\lsISSN}{??}   % \IfStrEq from xstring
  {}
  {ISSN: \lsISSN}

\IfStrEq{\lsBookDOI}{??}    % \IfStrEq from xstring
  {{\color{red} no DOI}}
  {\doi{\lsBookDOI}}


\bigskip
 
Cover and concept of design:
Ulrike Harbort \\
\if\@translator\empty\else
Translator:
\@translator \\
\fi
\if\@typesetter\empty\else
Typesetting:
\@typesetter \\
\fi
\if\@illustrator\empty\else
Illustration:
\@illustrator \\
\fi
\if\@proofreader\empty\else
Proofreading:
\@proofreader \\
\fi
\if\@openreviewer\empty\else
Open reviewing:
\@openreviewer \\
\fi
Fonts: Linux Libertine, Arimo, DejaVu Sans Mono\lsAdditionalFontsImprint\\
Typesetting software: \XeLaTeX

\bigskip

Language Science Press\\
Unter den Linden 6\\
10099 Berlin, Germany\\
\href{http://langsci-press.org}{langsci-press.org}

\vfill

Storage and cataloguing done by FU Berlin \\[3ex]   

\IfFileExists{\logopath logo.pdf}{\includegraphics[width=5cm]{\logopath langscibook-logo.pdf}}{\logotext} \\[3ex]


\vfill



\noindent
\lsp has no responsibility for the persistence or accuracy of URLs for
external or third-party Internet websites referred to in this
publication, and does not guarantee that any content on such websites
is, or will remain, accurate or appropriate. 
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Dedication:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\lsDedication}{
	\vspace*{.2\textheight}	
	\begin{center}
	{\lsDedicationFont
	\@dedication }
	\end{center}
	\vfill
	\clearpage}
	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Header and footer:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{datetime}
\usepackage{scrpage2}
\ohead{\headmark}
\ihead{}
\cfoot{}
\ofoot[]{\pagemark}
\iflsDraft
  \ifoot{Draft of \today, \currenttime}
\fi
\iflsOpenReview
  \ifoot{{\color{lsRed}Open review version}. Final version at \url{\lsURL}.}
\fi

\newcommand{\lsPageStyleEmpty}{
  \ohead{}
  \ihead{}
  \cfoot{}
  \ofoot[]{}
}

\renewcommand*{\partpagestyle}{empty}

\pagestyle{scrheadings}
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Sectioning
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setcounter{secnumdepth}{4} 

\def\subsubsubsection{\@startsection{paragraph}{3}{\z@}{-3.25ex plus
-1ex minus-.2ex}{1.5ex plus.2ex}{\reset@font\normalsize}}

\let\subsubsubsectionmark\@gobble%

\def\subsubsubsubsection{\@startsection{subparagraph}{3}{\z@}{-3.25ex plus
-1ex minus-.2ex}{1.5ex plus.2ex}{\reset@font\normalsize}}

\let\subsubsubsubsectionmark\@gobble

%% needed for hyperref
\def\toclevel@subsubsubsection{4}   


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Epigrams:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\epigram#1{\gdef\@epigram{#1}}      % needs to be defined this way to check emptiness
\epigram{}
\def\epigramsource#1{\gdef\@epigramsource{#1}}
\epigramsource{}


%%% epigraph configuration
\usepackage{epigraph}
\setlength{\epigraphrule}{0pt}
\renewcommand{\textflush}{flushepinormal}
%\setlength{\epigraphwidth}{.2\textwidth}
\setlength{\afterepigraphskip}{0\baselineskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Footnotes:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifxetex
\addtokomafont{footnote}{\addfontfeatures{Numbers=Lining}}      % numbers in footnotes
%\addtokomafont{footnotelabel}{\addfontfeatures{Numbers=Lining}}  % numbers in footnote labels
%\addtokomafont{footnotereference}{\addfontfeatures{Numbers=Lining}}  % numbers in footnote references
\fi

\raggedbottom
\deffootnote[1.5em]{1.5em}{\normalparindent}{\textsuperscript{\thefootnotemark}} % putting a space after footnotemark has undesirable side effects with footnotes that start with an empty line; instead use \xspace in the footnote definition below
\newlength{\normalparindent}
\AtBeginDocument{\setlength{\normalparindent}{\parindent}}

\KOMAoptions{footnotes=multiple}

%% http://tex.stackexchange.com/questions/28465/multiple-footnotes-at-one-point/71015#71015
\let\oldFootnote\footnote
\newcommand\nextToken\relax

\renewcommand\footnote[1]{%
\oldFootnote{\xspace#1}\futurelet\nextToken\isFootnote}

\newcommand\isFootnote{%
\ifx\footnote\nextToken\textsuperscript{,}\fi}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Quotes:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% quotes are indented at one side only.
\renewenvironment{quote}{\list{}{\rightmargin0pt\leftmargin8mm}%{\rightmargin\leftmargin}%
\item\relax}
{\endlist}

%% quotations are indented at one side only
%% there is no indentation at the beginning of the quote
\renewenvironment{quotation}
{\list{}{\listparindent 1.5em%
%\itemindent    \listparindent
%\rightmargin   \leftmargin
\parsep        \z@ \@plus\p@}%
\item\relax}
{\endlist}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Citations:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[
	natbib=true,
	% \iflsUndecapitalize
	% style=\bstpath biblatex-langsci-unified-undecap,
	% \else
	% style=\bstpath biblatex-langsci-unified,
	% \fi
  style=\bbxpath biblatex-sp-unified,
	citestyle=\cbxpath sp-authoryear-comp,
	%refsection=chapter,
	maxbibnames=99,
	isbn=false,
	doi=false,
	url=false,
	eprint=false,
	backend=\lsBiblatexBackend,
	indexing=cite,
	\iflsCollection\else
		toc=bib 		% make bibliography appear in toc
	\fi
	]{biblatex}


%% changes of citestyle (cbx) (FIXME: documentation missing)   
\renewcommand{\postnotedelim}{: }%
\renewcommand{\multicitedelim}{\addsemicolon\space}%  
\renewcommand{\compcitedelim}{\multicitedelim}
% \renewcommand{\nameyeardelim}{ }%

%% changes of bibliography style (bbx)
\DeclareFieldFormat{postnote}{#1}%
\DeclareBibliographyAlias{inbook}{incollection} % see https://github.com/semprag/biblatex-sp-unified/issues/35
%% DOIs are handled after hyperref.
\defbibheading{references}{\chapter{References}} % FIXME: adjust with language
 
\let\cite=\citet 	% in order to prevent inconsistencies between \cite and \citet

%% penalties against widows and orphans in bibliography
%% http://tex.stackexchange.com/questions/297705/atbeginenvironment-does-not-work-with-natbib/297721#297721
\usepackage{etoolbox}
\apptocmd{\thebibliography}{%
\clubpenalty\@M
\@clubpenalty\clubpenalty
\widowpenalty\@M
}
{}{}

% % temporary workaround to fix wrong wrapping for \verb in bibtex
% \makeatletter
% \def\blx@maxline{77}
% \makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Floats:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{floatrow}	% For adjusting the position of the caption (default is below).
\floatsetup[table]{capposition=top} 	% As for tables, the caption appears above.
%% This sets the default for the positioning of floats
\renewcommand{\fps@figure}{htbp}
\renewcommand{\fps@table}{htbp}

\usepackage{booktabs} % for nicer lines

%% floats
%% http://mintaka.sdsu.edu/GF/bibliog/latex/floats.html
%% Alter some LaTeX defaults for better treatment of figures:

%% See p.105 of "TeX Unbound" for suggested values.
%% See pp. 199-200 of Lamport's "LaTeX" book for details.
%%   General parameters, for ALL pages:
\renewcommand{\topfraction}{0.9}	% max fraction of floats at top
\renewcommand{\bottomfraction}{0.8}	% max fraction of floats at bottom
%%   Parameters for TEXT pages (not float pages):
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}     % 2 may work better
\setcounter{dbltopnumber}{2}    % for 2-column pages
\renewcommand{\dbltopfraction}{0.9}	% fit big float above 2-col. text
\renewcommand{\textfraction}{0.07}	% allow minimal text w. figs
%%  Parameters for FLOAT pages (not text pages):
\renewcommand{\floatpagefraction}{0.7}	% require fuller float pages
    %% N.B.: floatpagefraction MUST be less than topfraction !!
\renewcommand{\dblfloatpagefraction}{0.7}	% require fuller float pages

\usepackage{setspace}
\usepackage{caption}
% \captionsetup{labelfont=bf} 
\captionsetup{%
font={%
stretch=.8%
,small%
},%
width=.8\textwidth
}

\setcapindent{0pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Appendices:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\appto\appendix{%
	%% format of the appendix title page
	\renewcommand*{\chapterformat}{%
		\mbox{\chapapp~\thechapter\autodot:\enskip}%
	}
	%% format of the TOC entry
	\renewcommand{\addchaptertocentry}[2]{
		\ifstr{#1}{}{%
		\addtocentrydefault{chapter}{}{#2}%
		}{%
		\addtocentrydefault{chapter}{}{\chapapp~#1: #2}%
		}%
	}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Indexes:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{index}
%% Wie im Stylefile, aber ohne \MakeUppercase
\renewenvironment{theindex}{%
  \edef\indexname{\the\@nameuse{idxtitle@\@indextype}}%
  \if@twocolumn
	  \@restonecolfalse
  \else
	  \@restonecoltrue
  \fi
  \columnseprule \z@
  \columnsep 35\p@
  \twocolumn[%
	  \@makeschapterhead{\indexname}%
	  \ifx\index@prologue\@empty\else
		  \index@prologue
		  \bigskip
	  \fi
  ]%
%        \@mkboth{\MakeUppercase\indexname}%
%                {\MakeUppercase\indexname}%
  \@mkboth{\indexname}%
		  {\indexname}%
  \thispagestyle{plain}%
  \parindent\z@
  \parskip\z@ \@plus .3\p@\relax
  \let\item\@idxitem
  \providecommand*\seealso[2]{\emph{see also} ##1}
}{%
  \if@restonecol
	  \onecolumn
  \else
	  \clearpage
  \fi
}

\newcommand{\lsLanguageIndexTitle}{Language index}	% This can be changed according to the language.
\newcommand{\lsSubjectIndexTitle}{Subject index}
\newcommand{\lsNameIndexTitle}{Name index}

\AtBeginDocument{
	\makeindex
	\newindex{lan}{ldx}{lnd}{\lsLanguageIndexTitle} 
	\newindex{sbj}{sdx}{snd}{\lsSubjectIndexTitle}
	\renewindex{default}{adx}{and}{\lsNameIndexTitle} %biblatex can only deal with the default index
% 	\newindex{wrd}{wdx}{wnd}{Expression index}
% 	\newindex{rwrd}{rdx}{rnd}{Reverse expression index}
}

\indexproofstyle{\setlength{\overfullrule}{0pt}\raggedright\footnotesize}

%% \index inside footnote
\def\infn#1#2{%
% 	\hyperpage{#2}n#1%  99n2
% 	\hyperpage{#2}*%   99*
	\hyperpage{#2}\textsuperscript{#1}%  99²
}%
\newcommand{\footnoteindex}[2]{\index{#2|infn{#1}}}
\newcommand{\footnoteindex@sbj}[2]{\index[sbj]{#2|infn{#1}}}
\newcommand{\footnoteindex@lan}[2]{\index[lan]{#2|infn{#1}}}
\newcommand{\footnoteindex@wrd}[2]{\index[wrd]{#2|infn{#1}}}


% Author index
\newcommand{\ia}[1]{%
  \if@noftnote%
    \index{#1}%
    \else%
    \edef\tempnumber{\thefootnote}%
    \expandafter\footnoteindex\expandafter{\tempnumber}{#1}%
    % \index{#1|fn{\thefootnote}}%
  \fi%
}

% Subject index
\newcommand{\is}[1]{%
  \if@noftnote%
    \index[sbj]{#1}%
    \else%
    \edef\tempnumber{\thefootnote}%
    \expandafter\footnoteindex@sbj\expandafter{\tempnumber}{#1}%
    %\indexftn{#1}{\value{footnotemark}}%
  \fi%
}

% Language index
\newcommand{\il}[1]{%
  \if@noftnote
    \index[lan]{#1}%
    \else%
    \edef\tempnumber{\thefootnote}%
    \expandafter\footnoteindex@lan\expandafter{\tempnumber}{#1}%
  \fi%
}

% \iflsDraft
%   \usepackage{showidx} 	% Doesn't work with multiple indexes?
% \fi

%% this is required by authorindex
\newif\ifshowindex \showindexfalse
\usepackage{authorindex}

\iflsShowIndex	% shows index commands in text
    \RequirePackage{soul}
%     \RequirePackage[noadjust]{marginnote}
    \renewcommand{\marginpar}{\marginnote}
    \let\isold\is 
    \let\ilold\il 
    \let\iaold\ia 
    \renewcommand{\isi}[1]{\sethlcolor{green}\hl{#1}\isold{#1}}
    \renewcommand{\is}[1]{{\tikzstyle{notestyleraw} += [text width=1.5cm]\todo[color=green,size=\scriptsize]{\tiny#1}\isold{#1}}}
    \renewcommand{\ili}[1]{\sethlcolor{yellow}\hl{#1}\ilold{#1}}
    \renewcommand{\il}[1]{{\tikzstyle{notestyleraw} += [text width=1.5cm]\todo[color=yellow,size=\scriptsize]{\tiny#1}\ilold{#1}}}
    \renewcommand{\iai}[1]{\sethlcolor{pink}\hl{#1}\iaold{#1}}
    \renewcommand{\ia}[1]{{\tikzstyle{notestyleraw} += [text width=1.5cm]\todo[color=pink,size=\scriptsize]{\tiny#1}\iaold{#1}}}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Hyperref:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[
	bookmarks=true,bookmarksopen=true,bookmarksopenlevel=1,%
	bookmarksdepth=5,
	bookmarksnumbered=true,
	hyperindex=true,%
	breaklinks=true,
	draft=false,
	plainpages=false,
	pdfusetitle=true,  % puts author and title in automatically, maybe only in final mode?
	pdfkeywords={},
	pdfpagelayout=TwoPageRight,   % first page is separate
	%ps2pdf=true
	]{hyperref}

%% gets rid of the warnings:
%% Failed to convert input string to UTF16
%% http://tex.stackexchange.com/questions/66722/tex-live-2012-xelatex-moderncv-error-failed-to-convert-input-string-to-utf1
\hypersetup{unicode,pdfencoding=auto,bookmarksopenlevel=0}

%% add hyperlinks for DOIs in bibliography; must appear after hyperref
\usepackage{doi}
\renewcommand{\doitext}{DOI:}
\iflsBiblatex
\renewbibmacro*{finentry}{\finentry
	\iffieldundef{url}{}{ \url{\thefield{url}}\iffieldundef{urlday}{}{, accessed \thefield{urlyear}-\thefield{urlmonth}-\thefield{urlday}}.}
	\iffieldundef{doi}{}{ {\color{lsGuidelinesGray}\doi{\thefield{doi}}}}
}
%\DeclareFieldFormat{doi}{{\color{lsGuidelinesGray}\doi{#1}}}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Collection (edited volume):
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% for papers of collections:
\newcommand{\lsCollectionPaperAbstract}{Put abstract here with \string\abstract.}
\newcommand{\abstract}[1]{\renewcommand{\lsCollectionPaperAbstract}{#1}}
\newcommand{\ChapterDOI}[1]{\renewcommand{\lsChapterDOI}{#1}}


%% inside \author:
\renewcommand{\and}{}       
\newcommand{\lastand}{}
\newcommand{\affiliation}[1]{}  

%% to be used below chapter titles
\newcommand{\chaptersubtitle}[1]{
  \vspace*{-2ex}
  {\Large #1}
  \chapterheadendvskip
  \@afterindentfalse
  \@afterheading
  }
  

\iflsCollection
	\iflsBiblatex\else
		\ClassError{langsci/langscibook}{Collection option not compatible with plain BibTeX. Please use biblatex option}{}
	\fi
	

\AtBeginDocument{	% for the citation in the footer
	\onlyAuthor
	\renewcommand{\newlineCover}{}
	\renewcommand{\newlineSpine}{} 
	\edef\lsCollectionTitle{\@title\ifx\@subtitle\empty\else{: \@subtitle}\fi}		% \edef immediately expands \@title
	\edef\lsCollectionEditor{\@author}
	\addbibresource{collection_tmp.bib}
	\newwrite\tempfile						% open temporary bib file
	\immediate\openout\tempfile=collection_tmp.bib
}
\AtEndDocument{\immediate\closeout\tempfile}% close temporary bib file

%% customize \tableofcontents
\renewcommand{\@dotsep}{2.5}		% space between dots
\renewcommand{\@tocrmarg}{1.5em}	% right margin for leader 
\renewcommand{\@pnumwidth}{1.5em}	% width of page numbers
\usepackage{tocstyle}
\usetocstyle{standard}				%\usetocstyle{allwithdot}
\settocfeature[toc]{raggedhook}{\raggedright} 
\iflsCollectionTOCLong\else
	\setcounter{tocdepth}{0}\fi			% show only parts and chapters
\settocstylefeature[-1]{pagenumberbox}{\csname @gobble\endcsname}	% parts without page number
\settocstylefeature[-1]{leaders}{\hfill}							% parts without dots#
	
\usepackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

%% Modified code from:
%% http://pastcounts.wordpress.com/2010/12/20/how-to-construct-a-collection-of-articles-with-latex/
\newenvironment{collectionpaper}{
	\renewcommand{\documentclass}[2][]{}%
	\renewcommand{\usepackage}[2][]{}%
	\renewenvironment{document}{\begingroup}{\endgroup}%

	\renewcommand{\title}[1]{\renewcommand{\@title}{##1}}
	\renewcommand{\author}[1]{\renewcommand{\@author}{##1}}
	%\renewcommand{\thanks}[1]{\symbolfootnote[1]{##1}}
	\lsPaper
	}
	{}

\newcommand{\includepaper}[1]{
	\begin{collectionpaper}
	\begin{refsection}

	\DeclareCiteCommand{\fullciteFooter}
		{\defcounter{maxnames}{\blx@maxbibnames}%
		  \usebibmacro{prenote}}
		{\usedriver
		   {\DeclareNameAlias{sortname}{default}}
		   {\thefield{entrytype}}}
		{\multicitedelim}
		{\usebibmacro{postnote}}
	\renewcommand{\lsCollectionPaperCitationText}{\fullciteFooter{#1}} 
	
	\include{#1}%
  \addtocounter{page}{-1}
	\edef\lsCollectionPaperLastPage{\thepage}	% \lsCollectionPaperFirstPage is defined in \lsPaper
  \addtocounter{page}{1}
  
	%%% for citation in footer
	%% preprocessing of author/editor names
	\onlyAuthor		
	\renewcommand{\newlineCover}{}
	\renewcommand{\newlineSpine}{}
	\renewcommand{\newlineTOC}{}
	\StrSubstitute{\@author}{,}{ and }[\authorTemp]
	\StrSubstitute{\authorTemp}{\&}{ and }[\authorTemp]
	\StrSubstitute{\lsCollectionEditor}{,}{ and }[\editorTemp]
	\StrSubstitute{\editorTemp}{\&}{ and }[\editorTemp]

	%% write bib entry to file
	%% FIXME: the publisher field needs a final period, since this is not provided by \fullciteFooter together with DOIs.
	\immediate\write\tempfile{@incollection{#1,author={\authorTemp},title={{\@title}},booktitle={{\lsCollectionTitle}},editor={\editorTemp},publisher={Language Science Press.},Address={Berlin},year=\lsYear,pages={\lsCollectionPaperFirstPage --\lsCollectionPaperLastPage},doi={\lsChapterDOI},options={skipbib=true,skiplab=true}}}
 
	\end{refsection}
	\end{collectionpaper}}
\fi

 

\newcommand{\onlyAuthor}{%    % collection paper
  \renewcommand{\and}{, }% 
  \renewcommand{\lastand}{ \& }%  
  \renewcommand{\affiliation}[1]{}
  }
  
\newcommand{\AuthorAffiliation}{
  \renewcommand{\and}{\newline\newline} 
  \renewcommand{\lastand}{\newline\newline} 
  \renewcommand{\affiliation}[1]{\\[0.5ex]{\normalsize ##1}}}

\newcommand{\lsCollectionPaperHeaderAuthor}{{%
  \renewcommand{\newlineCover}{}%
  \renewcommand{\newlineTOC}{}%
  \onlyAuthor\@author}}
  
\newcommand{\lsCollectionPaperHeaderTitle}{%
  \renewcommand{\newlineCover}{}
  \renewcommand{\newlineTOC}{}
  \iflsCollectionChapter%
    \thechapter\hspace{0.5em}\fi
  \@title}
  
\newcommand{\lsCollectionPaperTOC}{{%
  \iflsCollectionChapter%
    \protect\numberline{\thechapter}\fi
  \@title\newline{\normalfont\@author}}}
  
\newcommand{\lsCollectionPaperTitle}{{%
  \renewcommand{\newlineTOC}{}
  \renewcommand{\newlineCover}{\\} 
%     \\[-1\baselineskip]
%     \vspace*{-2\baselineskip}
  \renewcommand{\chapterheadstartvskip}{}
  {\LARGE \noindent \hspace*{-.7cm} Chapter \thechapter}\\ %there must be a better way to undo this length than a hard value
  \bigskip  
  \@title}}
  
\newcommand{\lsCollectionPaperAuthor}{{%
  \renewcommand{\newlineTOC}{}
  \renewcommand{\newlineCover}{\\[0.5ex]}
  \AuthorAffiliation\Large\@author}}
  
\newcommand{\lsCollectionPaperCitation}{\scalebox{1.2}{
  \includegraphics{\logopath langsci_spinelogo_nocolor.pdf}}%
  % \hspace{0.8em}%
  \hfill%
  \parbox[b]{.87\textwidth}{\linespread{0.8}\lsChapterFooterSize\normalfont\lsCollectionPaperCitationText}}
  
\newcommand{\lsCollectionPaperCitationText}{\string\lsCollectionPaperCitationText.}

\newcommand{\lsPaper}{
  \renewcommand{\maketitle}{
    \addtocounter{chapter}{1}
    \addchap*{\lsCollectionPaperTitle}
    \global\edef\lsCollectionPaperFirstPage{\thepage} % for citation in footer
    \onlyAuthor
    \renewcommand{\newlineCover}{}
    \renewcommand{\newlineTOC}{\\}
    \addcontentsline{toc}{chapter}{\lsCollectionPaperTOC}%
    \ifoot[\lsCollectionPaperCitation]{\iflsDraft Draft of \today, \currenttime \fi}
    \vspace*{-2ex}
    \lsCollectionPaperAuthor%
    \vspace*{\baselineskip}%
    \ifx\@epigram\empty%
      \else {\epigraph{\@epigram\\[-5ex]}{\@epigramsource}% 
          \epigram{}\epigramsource{}}% 
    \fi% 
    \begin{quote}
    \small\lsCollectionPaperAbstract
    \end{quote}
  } 

  \renewcommand*{\thesection}{\arabic{section}}
  \setcounter{section}{0}
  \setcounter{footnote}{0}
  \setcounter{figure}{0}
  \setcounter{table}{0}
  \setcounter{equation}{0}  % for examples
  \ohead{}
  \lehead{\lsCollectionPaperHeaderAuthor}
  \rohead{\lsCollectionPaperHeaderTitle}
}


%writeout page numbers for separation of chapters 

% \usepackage{newfile}
% \newoutputstream{pages}
% \openoutputfile{\jobname.pgs}{pages}
% \newcommand{\writechapterpages}{\addtostream{pages}{\thepage}}
% 
% \AtEndDocument{
%  \closeoutputstream{pages}
% }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Miscellaneous:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[figuresright]{rotating}

%% hspace over width of something without showing it
\newlength{\LSPTmp}
\newcommand*{\hspaceThis}[1]{\settowidth{\LSPTmp}{#1}\hspace*{\LSPTmp}}

\iflsNoBabel
  \else
  \usepackage[english]{babel}
\fi

\endinput