%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      File: langscibook.cls
%%    Author: Language Science Press (http://langsci-press.org)
%%      Date: 2018-08-29 13:12 UTC
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
%%% This work has the LPPL maintenance status `maintained'.
%%% The Current Maintainer of this work is Sebastian Nordhoff.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Structure of this file:
%   \- Early load packages
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
%   \- Languages
%   \- Citations
%   \- Floats
%   \- Appendices
%   \- Indexes
%   \- Hyperref
%   \- Edited volumes (Collection)
%   \- Localisation
%   \_ Miscellaneous
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{langscibook}[2020/02/12 Language Science Press]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Early load packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[]{silence}
\WarningsOff[hyperref]
\WarningsOff[tocstyle]
\WarningsOff[microtype]
\WarningFilter{microtype}{Unknown slot}
\WarningFilter{scrbook}{package incompatibility}
\WarningFilter{todonotes}{The length}
\WarningFilter{biblatex}{'babel/polyglossia'}
\hbadness=99999 % get rid of underfull box warnings
\typeout{Warnings are disabled in langscibook.cls for underfull boxes, hyperref, tocstyle, microtype and scrbook package incompatibility, todonotes length and babel/polyglossia csquotes}
\usepackage{etoolbox}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Paths
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \newcommand{\fontpath}{}
% \newcommand{\logopath}{}
% \newcommand{\seriesinfopath}{}
% \newcommand{\localepath}{}
% \newcommand{\bibstylepath}{}
% \newcommand{\bbxpath}{}
% \newcommand{\cbxpath}{}
% \newcommand{\stylepath}{}
% Paths can be overwritten with option "nonflat"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Default values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{xspace}
\newcommand{\lsp}{Language Science Press\xspace}
\newcommand{\lsSeriesNumber}{??}
\newcommand{\lsSeriesText}{\color{red}{No series description provided}}
\newcommand{\lsISSN}{??}
\newcommand{\lsISSNprint}{??}
\newcommand{\lsISSNelectronic}{??}
\newcommand{\lsISBNdigital}{000-0-000000-00-0}
\newcommand{\lsISBNhardcover}{000-0-000000-00-0}
\newcommand{\lsISBNsoftcover}{000-0-000000-00-0}
\newcommand{\lsISBNsoftcoverus}{000-0-000000-00-0}
\newcommand{\lsBookDOI}{??}
\newcommand{\lsChapterDOI}{??}
\newcommand{\lsID}{000}
\newcommand{\lsURL}{http://langsci-press.org/catalog/book/\lsID}
\newcommand{\lsSeries}{eotms}
\newcommand{\lsOutput}{book}
\newcommand{\lsBookLanguage}{english}
\newcommand{\lsFontsize}{11pt}
\newcommand{\lsChapterFooterSize}{\small} %footers in editedvolumes
\newcommand{\lsCopyright}{CC-BY}
\newcommand{\lsSpinewidth}{20mm}
\newcommand{\lsBiblatexBackend}{biber}
\newcommand{\logotext}{{\color{red}no logo}}
\newcommand{\lsYear}{\the\year}

\newcommand{\lsBackBody}{Set blurb on back with {\textbackslash}BackBody\{my blurb\}}
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

% Default commands for loaded graphics
\newcommand{\includespinelogo}{~}
\newcommand{\includestoragelogo}{~}
\newcommand{\includepublisherlogo}{~}
\newcommand{\includechapterfooterlogo}{~}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Conditionals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\iflsDraft \lsDraftfalse
\newif\iflsOpenReview \lsOpenReviewfalse
\newif\iflsResetCapitals \lsResetCapitalsfalse
\newif\iflsShowIndex \lsShowIndexfalse
\newif\iflsBiblatex \lsBiblatextrue
\newif\iflsCollection \lsCollectionfalse
\newif\iflsCollectionChapter \lsCollectionChapterfalse
\newif\iflsCollectionTOCLong \lsCollectionTOCLongfalse
\newif\iflsNewtxmath \lsNewtxmathfalse
\newif\iflsMinimal \lsMinimalfalse
\newif\iflsCover \lsCoverfalse %output format is cover
\newif\iflsNoBabel \lsNoBabelfalse
\newif\iflsBabelShorthands \lsBabelShorthandsfalse
\newif\iflsMultiauthors \lsMultiauthorsfalse
\newif\iflsArseneau \lsArseneaufalse
\newif\iflsOldStyleNumbers \lsOldStyleNumbersfalse

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Option handling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{kvoptions}		% for key-value options
\SetupKeyvalOptions{
	family=langscibook,
	prefix=langscibook@ }
\DeclareStringOption{output}[book]
	\define@key{langscibook}{output}{%
		\renewcommand{\lsOutput}{#1}}
\DeclareStringOption{booklanguage}[english]
	\define@key{langscibook}{booklanguage}{%
		\renewcommand{\lsBookLanguage}{#1}}
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
\DeclareVoidOption{decapbib}{
	\lsResetCapitalstrue }
\DeclareVoidOption{draftmode}{	% 'draftmode' instead of 'draft' due to undesirable side efects
	 \lsDrafttrue
	 \overfullrule=5pt	}	% to indicate overfull hboxes
\DeclareVoidOption{openreview}{
	\lsOpenReviewtrue%
	\AtBeginDocument{\renewcommand{\lsISBNdigital}{000-0-000000-00-0}}}
% \DeclareVoidOption{nonflat}{
% 	\renewcommand{\fontpath}{./langsci/fonts/}
% 	\renewcommand{\logopath}{./langsci/graphics/}
% 	\renewcommand{\seriesinfopath}{./langsci/seriesinfo/}
% 	\renewcommand{\localepath}{./langsci/locale/}
% 	\renewcommand{\bibstylepath}{./langsci/}
% 	\renewcommand{\stylepath}{./langsci/styles/}
% }
\DeclareVoidOption{nobabel}{
  \lsNoBabeltrue}
\DeclareVoidOption{babelshorthands}{
  \lsBabelShorthandstrue}
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
\DeclareVoidOption{newtxmath}{
	\lsNewtxmathtrue}
\DeclareVoidOption{minimal}{
	\lsMinimaltrue}
\DeclareVoidOption{collection}{
	\lsCollectiontrue}
\DeclareVoidOption{collectionchapter}{
	\lsCollectiontrue%
	\lsCollectionChaptertrue}
\DeclareVoidOption{collectiontoclong}{
	\lsCollectiontrue%
	\lsCollectionTOCLongtrue}
\DeclareVoidOption{arseneau}{\lsArseneautrue}
\DeclareVoidOption{oldstylenumbers}{\lsOldStyleNumberstrue}
\DeclareVoidOption{chinesefont}{
	\newfontfamily\cn[Mapping=tex-text,Ligatures=Common,Scale=MatchUppercase]{AR PL UMing CN}
% 	\newcommand{\zh}[1]{{\cn #1}}
	\XeTeXlinebreaklocale 'zh'
	\XeTeXlinebreakskip = 0pt plus 1pt
	\AdditionalFontImprint{UMing}
}
\DeclareVoidOption{japanesefont}{
	  \newfontfamily\jpn[Mapping=tex-text,Ligatures=Common,Scale=MatchUppercase]{TakaoPGothic} %Japanese
% 	  \newcommand{\jp}[1]{{{\jpn #1}}}
	  \XeTeXlinebreaklocale 'ja'
	  \AdditionalFontImprint{TakaoPGothic}
}
% \DeclareVoidOption{koreanfont}{
% 	\newfontfamily\hangul[Mapping=tex-text,Ligatures=Common,Scale=MatchUppercase]{./SourceHanSerifK.otf}
% 	\newcommand{\kr}[1]{{\sffamily #1}}
% 	\AdditionalFontImprint{Korean}}
\DeclareVoidOption{arabicfont}{
	\newfontfamily\arabicfont[Script=Arabic,ItalicFont=*,Scale=1.4]{arabtype.ttf}
% 	\newcommand{\textarabic}[1]{{\arabicfont #1}}
	\AdditionalFontImprint{Arabtype}
}
\DeclareVoidOption{hebrewfont}{
	\newfontfamily\hebrewfont[Script=Hebrew,ItalicFont=*, Scale=0.9]{SBLHebrew.ttf}
% 	\newcommand{\texthebrew}[1]{{\hebrewfont #1}}
	\AdditionalFontImprint{SBLHebrew}
}
\DeclareVoidOption{syriacfont}{
	\newfontfamily\syriacfont[Script=Syriac]{EstrangeloEdessa.ttf}
% 	\newcommand{\textsyriac}[1]{{\syriacfont #1}}
	\AdditionalFontImprint{Estrangelo Edessa}
}

\ProcessKeyvalOptions{langscibook}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\LoadClass[
  fontsize=\lsFontsize, % default is 11pt
  footnotes=multiple,
  numbers=noenddot,   % no point after last number of chapters/sections
  toc=bibliography,
  index=totoc,
  headings=optiontohead,
  %chapterprefix=true,
  %draft=yes,
  %appendixprefix
  ]{scrbook}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Packages
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
\usepackage{langsci-basic}
\usepackage{todonotes}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Print on demand macros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\iflsMinimal\else % The minimal mode skips cover generation
% Basic cover commands, including PGF layers
\newcommand{\podsetup}{
  \lsCovertrue
  \renewcommand{\maketitle}{}  %no need for this
  \pagestyle{empty}
  \pgfdeclarelayer{lspcls_bg}    % Create a background layer that serves as the canvas for the coloured rectangles.
  \pgfsetlayers{lspcls_bg,main}  % Order the background layer behind the main layer of TikZ.
  \renewcommand{\and}{, }%
  \renewcommand{\lastand}{ \& }%
  \renewcommand{\affiliation}[1]{}
}

% Content creation for the spine. Including Logo, author, title, and volume number on spine.
\newcommand{\podspine}{
  \renewcommand{\newlineCover}{}
  \renewcommand{\and}{, }
  \renewcommand{\lastand}{ \& }
  \node [above = 0mm of CoverSpine.south, anchor=base] (lspcls_spinelogo) {\color{\lsSeriesColor}\includespinelogo};
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
         ] (lspcls_backtitle) {\color{white}\lsBackTitleFont{\raggedright\lsBackTitle\par}};
  \node [ below = 10mm of lspcls_backtitle,
          text width=#1,
          align=justify
        ] {\color{white}\lsBackBodyFont{\parindent=15pt\lsBackBody}};
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
\newcommand{\podfrontcovertoptext}[3][white]{
  \renewcommand{\and}{\\}
  \renewcommand{\lastand}{\\}
  \renewcommand{\newlineCover}{\\}

  \node [ execute at begin node={},
          font=\fontsize{#3}{17.25mm}\selectfont,
          below right = 10mm and 7.5mm of CoverColouredRectangleFront.north west,
          text width=#2,
          align=left
        ] (lspcls_covertitle) {\color{#1}\lsCoverTitleFont{\raggedright\@title\par}};

  \ifx\@subtitle\empty  % Is there a subtitle? If no, just print the author.
  \node [ font=\fontsize{25pt}{12.5mm}\selectfont,
          right,
          below = 11.2mm of lspcls_covertitle.south,
          text width=#2
        ] {\color{#1}\lsCoverAuthorFont\nohyphens{\lsEditorPrefix\@author\par}};
  \else % If yes, create a node for subtitle and author
  \node [ font=\fontsize{25pt}{10mm}\selectfont,
          below = 8mm of lspcls_covertitle.south,
          text width=#2,
          align=left
        ] (lspcls_coversubtitle) {\color{#1}\lsCoverSubTitleFont{\raggedright\@subtitle\par}};
  \node [
          font=\fontsize{25pt}{12.5mm}\selectfont,
          right,
          below = 11.2mm of lspcls_coversubtitle.south,
          text width=#2
        ] {\color{#1}\lsCoverAuthorFont{\nohyphens{\lsEditorPrefix\@author\par}}};
  \fi
}

% Generates the bottom half of the front cover content: series, series number, logo.
\newcommand{\podcoverbottomtext}[1][white]{
  \node [ above right = 18.5mm and -.1mm of CoverColouredRectangleFront.south west,
          rectangle,
          fill=white,
          minimum size=17pt] (lspcls_square) {}; % This is the white square at the bottom left of the front cover
  \node [ above left = 10mm and 7.5mm of CoverColouredRectangleFront.south east] {\color{#1}\includepublisherlogo}; % Print the Language Science press Logo
  \path let \p1 = (lspcls_square.north east), % Calculate the exact coordinates for the Series Title to print.
            \p2 = (lspcls_covertitle.west)
            in node at (\x2,\y1) (lspcls_seriesinfo) [
                  font=\fontsize{17pt}{7.5mm}\selectfont,
                  right,
                  text width=95mm,
                  anchor=north west]
            {\color{#1}\lsCoverSeriesFont{\lsSeriesTitle\par}};
}
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Output types
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \newcommand{\lsOutputLong}{long}
\newcommand{\lsOutputBook}{book}             % standard book
\newcommand{\lsOutputPaper}{paper}            % paper in edited volume
\newcommand{\lsOutputGuidelines}{guidelines}  % guidelines
\newcommand{\lsOutputCoverBODsc}{coverbodsc}      % cover with BoD measurements
\newcommand{\lsOutputCoverBODhc}{coverbodhc}      % cover with BoD measurements
\newcommand{\lsOutputCoverCS}{covercreatespace} % cover with CreateSpace measurements


%% Output types are defined with \newcommand above so they can be used with geometry.

\AtBeginDocument{
\iflsMinimal\renewcommand{\maketitle}{You are using the minimal mode.}\else % The minimal mode skips cover generation
\ifx\lsOutput\lsOutputPaper       % only if output==paper
  \usepackage{chngcntr}
  \counterwithout{figure}{chapter}
  \counterwithout{table}{chapter}
  \lsPaper
\else                 % only if output!=paper
\renewcommand{\maketitle}{
\begin{titlepage}
 \thispagestyle{empty}
\ifx\lsOutput\lsOutputBook   % only if output==book
  \setcounter{page}{-1}
  %% First titlepage:
  {\lsFrontPage}
  %%%%%%%%%%%%%%%%%%%
  \pagenumbering{roman}\clearpage\thispagestyle{empty} % We use roman pagenumbering here instead of \frontmatter because scrbook's frontmatter command issues a \clear(double)page, which is unnec. in digital publications.
  %% Series information:
  {\lsSeriesHistory}
  %%%%%%%%%%%%%%%%%%%%%
  \clearpage%\thispagestyle{empty}
  %% Schmutztitel:
  {\renewcommand{\lsCoverBlockColor}{white}
   \renewcommand{\lsCoverFontColor}{\lsSeriesColor}
  \lsSchmutztitel}
  %%%%%%%%%%%%%%%%%%%%
  \AtEndDocument{
    \lsPageStyleEmpty
    \null\newpage\thispagestyle{empty} % add a final blank page
	%% Back page:
    {\lsBackPage}
    \null\newpage\thispagestyle{empty}
  }
\fi

\ifx\lsOutput\lsOutputGuidelines        % only if output==guidelines
  {\setcounter{page}{-1}
  {\lsFrontPage}
  }

\fi

\ifx\lsOutput\lsOutputCoverBODhc         % only if output==cover
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


\ifx\lsOutput\lsOutputCoverBODsc         % only if output==cover
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


\ifx\lsOutput\lsOutputCoverCS        % only if output==covercs
  \podsetup
  \begin{tikzpicture}[remember picture, overlay,bg/.style={outer sep=0}]
    \podgeometry{10.675mm}{22.5cm}{15.5cm}
    \podspine
    \podfrontcovertoptext{140mm}{52pt} % Due to different cover sizes, the text size was adjusted so that the difference in line breaks would be minimal between hard and softcover books.
    \podcoverbottomtext
% 	\iflsUscover\newcommand{\lsISBNcover}{\lsISBNsoftcoverus}\else\newcommand{\lsISBNcover}{\lsISBNsoftcover}\fi
    \podbackcover{140mm}
  \end{tikzpicture}
  %exit the document right here
  \end{titlepage}
  \end{document}
\fi
\end{titlepage}

% \null\newpage\thispagestyle{empty}
\hypersetup{colorlinks=false, citecolor=brown, pdfborder={0 0 0}}  % for hyperref
\color{black}
\lsInsideFont

%% Imprint:
\ifx\lsOutput\lsOutputGuidelines{}
\else{\lsImpressum}
\fi
%%%%%%%%%%%%%

% \null\newpage\thispagestyle{plain}
%\pagenumbering{roman}    % or \frontmatter

%% Dedication:
\ifx\@dedication\empty{}
\else{\newpage\lsDedication}
\fi
%%%%%%%%%%%%%%%%

} %% \maketitle
\fi
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
 \renewcommand{\eachwordone}{\normalfont}
\fi

\ifx\lsSeries\nc
 \renewcommand{\eachwordone}{\itshape}
\fi



} %% \AtBeginDocument


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Geometry
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% For output type cover
% CS spine width algorithm, when page count is known:  Total Page Number (excluding cover), usually (Total Page - 3) * 0.0572008 mm
% BoD spine width algorithm located at http://www.bod.de/hilfe/coverberechnung.html (German only, please contact LangSci for help)
\newlength{\bleed}
\newlength{\seitenbreite}
\newlength{\seitenhoehe}
\newlength{\spinewidth}
\newlength{\totalwidth}
\newlength{\totalheight}
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{ifxetex}
\ifxetex\else\ClassError{langscibook}{Please use XeLaTeX!}{}\fi

%% Typesetting of mathematical formulas
\usepackage{amssymb} % has to be loaded before other stuff
\usepackage{amsmath} % has to be loaded before mathspec/unicode-math

\iflsMinimal\else % The minimal mode skips font loading
    \iflsNewtxmath\else
    %% There is a known problem in the interplay between \binom, unicode-math, and OTF
    %% https://tex.stackexchange.com/questions/269980/wrong-parentheses-size-in-binom-with-xelatex-and-unicode-math-in-displaystyle
    \ifx\Umathcode\@undefined\else

    \DeclareRobustCommand{\genfrac}[6]{%
    \def\@tempa{#1#2}%
    \edef\@tempb{\@nx\@genfrac\@mathstyle{#4}%
        % just \over or \above never withdelims versions
        \ifx @#3@\@@over\else\@@above\fi
    }%
    \ifx\@tempa\@empty \else
    \bgroup % so mathord not mathinner
    \left\ifx\relax#1\relax.\else#1\fi % assumes . is null delimiter
    % otherwise add specified delimiter
    \kern-\nulldelimiterspace % fractions add extra nulldelimiter space
    \fi
    \@tempb{#3}{\mathstrut{#5}}{\mathstrut{#6}}%
    \ifx\@tempa\@empty \else
    \kern-\nulldelimiterspace
    \right\ifx\relax#2\relax.\else#2\fi
    \egroup
    \fi
    }
    \fi
    %% Provides \setmathfont
    \usepackage{unicode-math}
    \fi

    \iflsNewtxmath
    %% Deprecated:
    \PassOptionsToPackage{no-math}{fontspec} % must appear before metalogo or any fontspec stuff; deactivates fontspec's math settings, which is necessary to let newtxmath do the job
    \fi

    \usepackage{metalogo}\newcommand{\xelatex}{\XeLaTeX\xspace}

    \setmonofont[
    %   Ligatures={TeX},% not supported by ttf
    Scale=MatchLowercase,
    BoldFont = DejaVuSansMono-Bold.ttf ,
    SlantedFont = DejaVuSansMono-Oblique.ttf ,
    BoldSlantedFont = DejaVuSansMono-BoldOblique.ttf
    ]{DejaVuSansMono.ttf}

    \setsansfont[
    %Ligatures={TeX,Common},% not supported by ttf
    Scale=MatchLowercase,
%     Path=\fontpath,
    BoldFont = Arimo-Bold.ttf,
    ItalicFont = Arimo-Italic.ttf,
    BoldItalicFont = Arimo-BoldItalic.ttf
    ]{Arimo-Regular.ttf}

    \iflsNewtxmath\else
    \setmathfont[AutoFakeBold
%     ,Path=\fontpath
    ]{LibertinusMath-Regular.otf}
    \setmathfont[range={cal},StylisticSet=1%,Path=\fontpath
    ]{XITSMath-Regular.otf}
    \setmathfont[range={bfcal},StylisticSet=1%,Path=\fontpath
    ]{XITSMath-Bold.otf}
    \fi

    \iflsOldStyleNumbers
    \defaultfontfeatures[LibertinusSerif-Semibold.otf,LibertinusSerif-Italic.otf,LibertinusSerif-SemiboldItalic.otf,LibertinusSerif-Regular.otf]{SmallCapsFeatures={Numbers=OldStyle}}
    \fi

    \setmainfont[
    Ligatures={TeX,Common},
%     Path=\fontpath,
    PunctuationSpace=0,
    Numbers={Proportional},
    BoldFont = LibertinusSerif-Semibold.otf,
    ItalicFont = LibertinusSerif-Italic.otf,
    BoldItalicFont = LibertinusSerif-SemiboldItalic.otf,
    BoldSlantedFont = LibertinusSerif-Semibold.otf,
    SlantedFont    = LibertinusSerif-Regular.otf,
    SlantedFeatures = {FakeSlant=0.25},
    BoldSlantedFeatures = {FakeSlant=0.25},
    SmallCapsFeatures = {FakeSlant=0},
    ]{LibertinusSerif-Regular.otf}

    %% Deprecated:
    \iflsNewtxmath		% some users have problems when installing newtxmath
            \usepackage[libertine]{newtxmath}
            %% following http://tex.stackexchange.com/questions/297328/xelatex-does-not-load-newtxmath-with-linuxlibertine-sometimes
            %% due to a bug in XeTeX. This also seems to fix an issue with \url in footnotes.
    %% Unfortunately, this is NOT extensively tested!
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

    \frenchspacing	%see https://en.wikipedia.org/wiki/Sentence_spacing#Typography
    \usepackage[final]{microtype}

    \newcommand{\lsCoverTitleFontSize}{52pt}
    \newcommand{\lsCoverTitleFontBaselineskip}{17.25mm}
    \newcommand{\lsCoverTitleSizes}[2]{\renewcommand{\lsCoverTitleFontSize}{#1}\renewcommand{\lsCoverTitleFontBaselineskip}{#2}}
    \newcommand{\lsCoverTitleFont}[1]{\sffamily\addfontfeatures{Scale=MatchUppercase}\fontsize{\lsCoverTitleFontSize}{17.25mm}\selectfont #1}
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
\fi % end minimal mode switch from line ~677

\setkomafont{sectioning}{\normalcolor\bfseries}
\setkomafont{descriptionlabel}{\normalfont\itshape}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\usepackage{xcolor}

\definecolor{lsLightBlue}{cmyk}{0.6,0.05,0.05,0}
\definecolor{lsMidBlue}{cmyk}{0.75,0.15,0,0}
\definecolor{lsMidDarkBlue}{cmyk}{0.9,0.4,0.05,0}
\definecolor{lsDarkBlue}{cmyk}{0.9,0.5,0.15,0.3}
\definecolor{lsNightBlue}{cmyk}{1,0.47,0.22,0.68}

\definecolor{lsYellow}{cmyk}{0,0.25,1,0}
\definecolor{lsLightOrange}{cmyk}{0,0.50,1,0}
\definecolor{lsMidOrange}{cmyk}{0,0.64,1,0}
\definecolor{lsDarkOrange}{cmyk}{0,0.78,1,0}
\definecolor{lsRed}{cmyk}{0.05,1,0.8,0}

\definecolor{lsLightWine}{cmyk}{0.3,1,0.6,0}
\definecolor{lsMidWine}{cmyk}{0.54,1,0.65,0.1}
\definecolor{lsDarkWine}{cmyk}{0.58,1,0.70,0.35}
\definecolor{lsSoftGreen}{cmyk}{0.32,0.02,0.72,0}
\definecolor{lsLightGreen}{cmyk}{0.4,0,1,0}

\definecolor{lsMidGreen}{cmyk}{0.55,0,0.9,0.1}
\definecolor{lsRichGreen}{cmyk}{0.6,0,0.9,0.35}
\definecolor{lsDarkGreenOne}{cmyk}{0.85,0.02,0.95,0.38}
\definecolor{lsDarkGreenTwo}{cmyk}{0.85,0.05,1,0.5}
\definecolor{lsNightGreen}{cmyk}{0.88,0.15,1,0.66}

\definecolor{lsLightGray}{cmyk}{0,0,0,0.17}
\definecolor{lsGuidelinesGray}{cmyk}{0,0.04,0,0.45}

\definecolor{lsDOIGray}{cmyk}{0,0,0,0.45}
\definecolor{RED}{cmyk}{0.05,1,0.8,0}

\definecolor{langscicol1}{cmyk}{0.6,0.05,0.05,0}
\definecolor{langscicol2}{cmyk}{0.75,0.15,0,0}
\definecolor{langscicol3}{cmyk}{0.9,0.4,0.05,0}
\definecolor{langscicol4}{cmyk}{0.9,0.5,0.15,0.3}
\definecolor{langscicol5}{cmyk}{1,0.47,0.22,0.68}
\definecolor{langscicol6}{cmyk}{0,0.25,1,0}
\definecolor{langscicol7}{cmyk}{0,0.50,1,0}
\definecolor{langscicol8}{cmyk}{0,0.64,1,0}
\definecolor{langscicol9}{cmyk}{0,0.78,1,0}
\definecolor{langscicol10}{cmyk}{0.05,1,0.8,0}
\definecolor{langscicol11}{cmyk}{0.3,1,0.6,0}
\definecolor{langscicol12}{cmyk}{0.54,1,0.65,0.1}
\definecolor{langscicol13}{cmyk}{0.58,1,0.70,0.35}
\definecolor{langscicol14}{cmyk}{0.32,0.02,0.72,0}
\definecolor{langscicol15}{cmyk}{0.4,0,1,0}
\definecolor{langscicol16}{cmyk}{0.55,0,0.9,0.1}
\definecolor{langscicol17}{cmyk}{0.6,0,0.9,0.35}
\definecolor{langscicol18}{cmyk}{0.85,0.02,0.95,0.38}
\definecolor{langscicol19}{cmyk}{0.85,0.05,1,0.5}
\definecolor{langscicol20}{cmyk}{0.88,0.15,1,0.66}


% \newcommand{\lsptable}[2]{
% \resizebox{#1}{!}{
% \begin{tabularx}{\textwidth}{XXXXXXXXXXXXXXXXXXXX}
%  \cellcolor{langscicol1}&\cellcolor{langscicol2}&\cellcolor{langscicol3}&\cellcolor{langscicol4}&\cellcolor{langscicol5}&\cellcolor{langscicol6}&\cellcolor{langscicol7}&\cellcolor{langscicol8}&\cellcolor{langscicol9}&\cellcolor{langscicol10}&\cellcolor{langscicol11}&\cellcolor{langscicol12}&\cellcolor{langscicol13}&\cellcolor{langscicol14}&\cellcolor{langscicol15}&\cellcolor{langscicol16}&\cellcolor{langscicol17}&\cellcolor{langscicol18}&\cellcolor{langscicol19}&\cellcolor{langscicol20}
%  \rule{0pt}{#2}
% \end{tabularx}
% }
% }


\input{langsci-series.def}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Cover
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

\pgfdeclarelayer{lspcls_bg}    % Create a background layer that serves as the canvas for the coloured rectangles.
\pgfsetlayers{lspcls_bg,main}  % Order the background layer behind the main layer of TikZ.

\newcommand{\lsFrontPage}{% Front page
  \ifcsname tikz@library@external@loaded\endcsname\tikzexternaldisable\fi
  \pgfdeclarelayer{lspcls_bg}    % Create a background layer that serves as the canvas for the coloured rectangles.
  \pgfsetlayers{lspcls_bg,main}  % Order the background layer behind the main layer of TikZ.
  \thispagestyle{empty}
  \renewcommand{\and}{, }%
  \renewcommand{\lastand}{ \& }%
  \renewcommand{\affiliation}[1]{}
\begin{tikzpicture}[remember picture, overlay,bg/.style={outer sep=0}]
  \begin{pgfonlayer}{lspcls_bg}
    \node [ bg,
	    left=7.5mm of current page.east,
	    fill=\lsSeriesColor,
	    minimum width=155mm,
	    minimum height=225mm
	    ] (CoverColouredRectangleFront) {};
  \end{pgfonlayer}
  \podfrontcovertoptext{140mm}{51pt}
  \podcoverbottomtext
  \iflsDraft \node [rotate=45,align=center,scale=3,color=white,text opacity=.75] at (current page.center) {\lsCoverTitleFont Draft\\of \today, \currenttime}; \fi
  \iflsOpenReview \node [rotate=45,align=center,scale=1.5,color=white,text opacity=.75] at (current page.center) {\lsCoverTitleFont Open Review\\Version of \today, \currenttime}; \fi
%   \iflsUndecapitalize \node [rotate=45,scale=1.5,color=white,text opacity=.75] at (current page.center) {\lsCoverTitleFont Undecapitalized}; \fi
\end{tikzpicture}
\ifcsname tikz@library@external@loaded\endcsname\tikzexternalenable\fi
}

\newcommand{\lsSchmutztitel}{% Schmutztitel
  \ifcsname tikz@library@external@loaded\endcsname\tikzexternaldisable\fi
  \pgfdeclarelayer{lspcls_bg}    % Create a background layer that serves as the canvas for the coloured rectangles.
  \pgfsetlayers{lspcls_bg,main}  % Order the background layer behind the main layer of TikZ.
  \thispagestyle{empty}
  \renewcommand{\and}{, }%
  \renewcommand{\lastand}{ \& }%
  \renewcommand{\affiliation}[1]{}%
\begin{tikzpicture}[remember picture, overlay,bg/.style={outer sep=0}]
  \begin{pgfonlayer}{lspcls_bg}
    \node [ bg,
	    left=7.5mm of current page.east,
	    fill=white,
	    minimum width=155mm,
	    minimum height=225mm
	    ] (CoverColouredRectangleFront) {};
  \end{pgfonlayer}
  \podfrontcovertoptext[\lsSeriesColor]{140mm}{51pt}
  \node [ above left = 10mm and 7.5mm of CoverColouredRectangleFront.south east] {\color{\lsSeriesColor}\includepublisherlogo}; % Print the Language Science press Logo
\end{tikzpicture}
\ifcsname tikz@library@external@loaded\endcsname\tikzexternalenable\fi
}

%\usepackage{pdfpages}
% \newcommand{\lsAdvertisement}{%
%   \include{\logopath langsci-advertisement}
% }

\newcommand{\lsBackPage}{%
  \ifcsname tikz@library@external@loaded\endcsname\tikzexternaldisable\fi
  \pgfdeclarelayer{lspcls_bg}    % Create a background layer that serves as the canvas for the coloured rectangles.
  \pgfsetlayers{lspcls_bg,main}  % Order the background layer behind the main layer of TikZ.
  \pagestyle{empty}
  \renewcommand{\and}{, }%
  \renewcommand{\lastand}{ \& }%
  \renewcommand{\affiliation}[1]{}
  \newcommand{\lsISBNcover}{\lsISBNdigital}
\begin{tikzpicture}[remember picture, overlay,bg/.style={outer sep=0}]
  \begin{pgfonlayer}{lspcls_bg}
    \node [ bg,
	    right=7.5mm of current page.west,
	    fill=\lsSeriesColor,
	    minimum width=155mm,
	    minimum height=225mm
	    ] (CoverColouredRectangleBack) {};
  \end{pgfonlayer}
  \podbackcover{137mm}
  \end{tikzpicture}
  \ifcsname tikz@library@external@loaded\endcsname\tikzexternalenable\fi
  }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Series history
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\lsSeriesHistory}{
\color{black}
\raggedright\lsCoverSeriesHistoryFont

% \IfFileExists{./\lsSeries-info.tex}{\input{./\lsSeries-info}}{
%   Series information:  \lsSeries-info.tex not found!}

{\lsSeriesText}
\IfStrEq{\lsISSNprint}{??}   % \IfStrEq from xstring
  {}
  {\vfill\hfill ISSN (print): \lsISSNprint\\
         \hfill ISSN (electronic): \lsISSNelectronic\\}
\IfStrEq{\lsISSN}{??}   % \IfStrEq from xstring
  {}
  {\vfill\hfill ISSN: \lsISSN}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Imprint
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


%invert names of first author for citation on impressum page

\newcommand{\lsFirstAuthorFullName}{}%temporary, will be overwritten
\newcommand{\lsFirstAuthorFirstName}{}%temporary, will be overwritten
\newcommand{\lsFirstAuthorLastName}{}%temporary, will be overwritten
\newcommand{\lsFirstAuthorString}{\lsFirstAuthorLastName, \lsFirstAuthorFirstName} %can be customized in localmetadata.tex
\newcommand{\lsNonFirstAuthorsString}{}  %default, will be overwritten iff more than one author
% \newcommand{\lsImpressionCitationAuthor}{\lsFirstAuthorString \lsNonFirstAuthorsString}


\AtBeginDocument{
\makeatletter
\let\theauthor\@author
\makeatother
\ifdefempty{\lsFirstAuthorFirstName}{% Check if the \lsFirstAuthorFirstName is given in localmetadata.tex (or somewhere else).
\renewcommand{\and}{NONLASTAND} %expand for easier checking. Might need to be undone later on
\renewcommand{\lastand}{LASTAND} %expand for easier checking

\IfSubStr{\theauthor}{NONLASTAND}{%2+authors
  \renewcommand{\lsFirstAuthorFullName}{\StrBefore{\theauthor}{\and }}
  \renewcommand{\lsFirstAuthorFirstName}{\StrBefore{\theauthor}{ }}
  \renewcommand{\lsFirstAuthorLastName}{\StrBetween{\theauthor}{ }{\and }}
  \renewcommand{\lsNonFirstAuthorsString}{\and\StrBehind{\theauthor}{\and }}
  }{%else
    \IfSubStr{\theauthor}{LASTAND}{%less than two authors, more than one
    \renewcommand{\lsFirstAuthorFullName}{\StrBefore{\theauthor}{\lastand }}
    \renewcommand{\lsFirstAuthorFirstName}{\StrBefore{\theauthor}{ }}
    \renewcommand{\lsFirstAuthorLastName}{\StrBetween{\theauthor}{ }{\lastand }}
    \renewcommand{\lsNonFirstAuthorsString}{\lastand\StrBehind{\theauthor}{\lastand }}
    }{%else exactly one author
      \renewcommand{\lsFirstAuthorFirstName}{\StrBefore{\theauthor}{ }}
      \renewcommand{\lsFirstAuthorLastName}{\StrBehind{\theauthor}{ }}
      }
    }
  }{}
}


\newcommand{\lsImpressionCitationAuthor}{
\lsFirstAuthorLastName, \lsFirstAuthorFirstName \lsNonFirstAuthorsString}

\newcommand{\lsImpressumCitationText}{
  \onlyAuthor
  \renewcommand{\newlineCover}{}
  \renewcommand{\newlineSpine}{}
  {\lsImpressionCitationAuthor}\if\lsEditorSuffix\empty\else\ \lsEditorSuffix\fi. %
  {\lsYear}. %
  \textit{\@title}\if\@subtitle\empty\else: \textit{\@subtitle}\fi\ %
  (\lsSeriesTitle). %
  Berlin: Language Science Press.
}
\newcommand{\lsImpressumExtra}{}%for legal notes required for revised theses ("... in fulfillment of ... ")

\newcommand{\publisherstreetaddress}{%
Language Science Press\\
Xhain\\
Grünberger Str. 16\\
10243 Berlin, Germany}
\newcommand{\publisherurl}{\href{http://langsci-press.org}{langsci-press.org}}
\newcommand{\storageinstitution}{FU Berlin}
\newcommand{\githubtext}{Source code available from \href{https://www.github.com/langsci/\lsID}{www.github.com/langsci/\lsID}}
\newcommand{\paperhivetext}{Collaborative~reading:~\href{https://paperhive.org/documents/remote?type=langsci&id=\lsID}{paperhive.org/documents/remote?type=langsci\&id=\lsID}}


\newcommand{\lsImpressum}{
\thispagestyle{empty}
\raggedright

\lsImpressumCitationText

\vfill

This title can be downloaded at:\\
\url{\lsURL}

© \lsYear, \iflsCollection the authors\else\@author\fi

\newcommand{\ccby}{CC-BY}
\newcommand{\ccbynd}{CC-BY-ND}
\ifx\lsCopyright\ccby
Published under the Creative Commons Attribution 4.0 Licence (CC BY 4.0):
http://creativecommons.org/licenses/by/4.0/ \includegraphics[height=.75em]{ccby.pdf}
\else
\ifx\lsCopyright\ccbynd
Published under the Creative Commons Attribution-NoDerivatives 4.0 Licence (CC BY-ND 4.0):
http://creativecommons.org/licenses/by-nd/4.0/ \includegraphics[height=.75em]{ccbynd.pdf}
\else
Published under the Creative Commons Attribution-ShareAlike 4.0 Licence (CC BY-SA 4.0):
http://creativecommons.org/licenses/by-sa/4.0/ \includegraphics[height=.75em]{ccbysa.pdf}
\fi
\fi

{\lsImpressumExtra}

\ifx\lsSeries\sidl
Indexed in EBSCO\smallskip
\fi



\begin{tabular}{@{}l@{~}l}
ISBN: &
\IfStrEq{\lsISBNdigital}{000-0-000000-00-0}{%no digital ISBN, issue warning
  \color{red}no digital ISBN
}{%digital ISBN present, write ISBN
  \lsISBNdigital~(Digital)
}
\\
\IfStrEq{\lsISBNhardcover}{000-0-000000-00-0}{ %hardcover ISBN not present
}{%hardcover ISBN present, write ISBN
  &\lsISBNhardcover~(Hardcover)\\
}

\IfStrEq{\lsISBNsoftcover}{000-0-000000-00-0}{ %softcover ISBN not present
  \IfStrEq{\lsISBNhardcover}{000-0-000000-00-0}{ %neither hardcover nor softcover, issue warning
    \color{red} no print ISBNs!
  }{%hardcover present, no warning
  }
}{%only softcover present, write ISBN
  &\lsISBNsoftcover~(Softcover)\\
}
\end{tabular}

\IfStrEq{\lsISSNprint}{??}   % \IfStrEq from xstring
  {}
  {ISSN (print): \lsISSNprint\\
   ISSN (electronic): \lsISSNelectronic\\}
\IfStrEq{\lsISSN}{??}
  {}
  {ISSN: \lsISSN}


\IfStrEq{\lsBookDOI}{??}
  {{\color{red} no DOI}}
  {DOI: \href{https://doi.org/\lsBookDOI}{\nolinkurl{\lsBookDOI}}}\\
\IfStrEq{\lsID}{000}{\color{red} ID not assigned!}{%
\githubtext\\
\paperhivetext
}%
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
Fonts: Libertinus, Arimo, DejaVu Sans Mono\lsAdditionalFontsImprint\\
Typesetting software: \XeLaTeX

\bigskip

\publisherstreetaddress\\
\publisherurl

\vfill

Storage and cataloguing done by \storageinstitution\\[3ex]

\includestoragelogo\\[3ex]


% \vfill

% \noindent
% \lsp has no responsibility for the persistence or accuracy of URLs for
% external or third-party Internet websites referred to in this
% publication, and does not guarantee that any content on such websites
% is, or will remain, accurate or appropriate.
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Dedication
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\lsDedication}{\thispagestyle{empty}
	\vspace*{\fill}
	\begin{center}
	{\lsDedicationFont
	\@dedication\par}
	\end{center}
	\vspace*{\fill}
	\clearpage}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Header and footer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{datetime}
\usepackage{scrlayer-scrpage}
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
%    Sectioning
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
%    Epigrams
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
%    Footnotes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifxetex\iflsMinimal\else
\addtokomafont{footnote}{\addfontfeatures{Numbers=Lining}}      % numbers in footnotes
%\addtokomafont{footnotelabel}{\addfontfeatures{Numbers=Lining}}  % numbers in footnote labels
%\addtokomafont{footnotereference}{\addfontfeatures{Numbers=Lining}}  % numbers in footnote references
\fi\fi

\raggedbottom
\deffootnote[1.5em]{1.5em}{\normalparindent}{\textsuperscript{\thefootnotemark}} % putting a space after footnotemark has undesirable side effects with footnotes that start with an empty line; instead use \xspace in the footnote definition below
\newlength{\normalparindent}
\AtBeginDocument{\setlength{\normalparindent}{\parindent}}

\KOMAoptions{footnotes=multiple}

%% http://tex.stackexchange.com/questions/28465/multiple-footnotes-at-one-point/71015#71015
\let\oldFootnote\footnote
\newcommand\nextToken\relax

% \renewcommand\footnote[1]{% breaks more footnotes than it fixes
% \oldFootnote{\xspace#1}\futurelet\nextToken\isFootnote}

\newcommand\isFootnote{%
\ifx\footnote\nextToken\textsuperscript{,}\fi}


\let\oldfootnotemark\footnotemark
\renewcommand{\footnotemark}{\upshape\oldfootnotemark}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Quotes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% quotes are indented at one side only.
\renewenvironment{quote}{\list{}{\rightmargin0pt\leftmargin8mm}%{\rightmargin\leftmargin}%
\item\relax}
{\endlist}

%% quotations are indented at one side only
%% there is no indentation at the beginning of the quote
\renewenvironment{quotation}
{\list{}{\listparindent 1.5em%\itemindent    \listparindent
%\rightmargin   \leftmargin
\parsep        \z@ \@plus\p@}%
\item\relax}
{\endlist}

\newenvironment{modquote}[1][6mm]% slightly less indented quote for hyphenation issues
  {\list{}{\leftmargin=#1\rightmargin=0mm}\item[]}%
  {\endlist}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Language-specific settings
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Must apear before biblatex and hyperref.

%% languages
\newcommand{\lsBookLanguageEnglish}{english}
\newcommand{\lsBookLanguageFrench}{french}
\newcommand{\lsBookLanguagePortuguese}{portuguese}
\newcommand{\lsBookLanguageGerman}{german}
\newcommand{\lsBookLanguageChinese}{chinese}

\iflsNoBabel
  \else
  \ifx\lsBookLanguage\lsBookLanguageChinese
	    \usepackage{xeCJK}%Chinese doesn't load babel, but xeCJK.
	\else
	 \iflsBabelShorthands
	    \ifx\lsBookLanguage\lsBookLanguageEnglish
	            \usepackage[ngerman,main=\lsBookLanguage]{babel}
				\addto\extrasenglish{\languageshorthands{german}\useshorthands{"}}
	        \fi
		\ifx\lsBookLanguage\lsBookLanguageFrench
                    \usepackage[ngerman,main=\lsBookLanguage]{babel}
					\addto\extrasfrench{\languageshorthands{german}\useshorthands{"}}
                \fi
		\ifx\lsBookLanguage\lsBookLanguageGerman
                    \usepackage[ngerman]{babel}
                \fi
		\ifx\lsBookLanguage\lsBookLanguagePortuguese
                    \usepackage[ngerman,main=\lsBookLanguage]{babel}
                    \addto\extrasportuges{\languageshorthands{german}\useshorthands{"}}
                \fi
	   \else
		\usepackage[\lsBookLanguage]{babel}
	   \fi%Close \iflsBabelShorthands
     \fi%Close language=chinese
\fi%Close \iflsNoBabel


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Citations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[
	natbib=true,
	style=langsci-unified,
	citestyle=langsci-unified,
	datamodel=langsci,   % add authauthor and autheditor as possible fields to bibtex entries
	%refsection=chapter,
	maxbibnames=99,
	uniquename=false,
	mincrossrefs=99,
	maxcitenames=2,
	isbn=false,
	autolang=hyphen,
	\iflsResetCapitals
        language=english,
    \fi
	backend=\lsBiblatexBackend,
	indexing=cite,
	\iflsCollection\else
		toc=bib, % make bibliography appear in toc
	\fi
]{biblatex}

% If the user provided a shortauthor in the bibtex entry, we use the authentic author (as with the
% authorindex package) if it is defined, otherwise we use the author.
% This gets F/T as shorthand right and puts the guys in the index.

\renewbibmacro*{citeindex}{%
  \ifciteindex
    {\iffieldequalstr{labelnamesource}{shortauthor} % If biblatex uses shortauthor as the label of a bibitem
      {\ifnameundef{authauthor}                     % we check whether there is something in authauthor
        {\indexnames{author}}                       % if not, we use author
        {\indexnames{authauthor}}}                  % if yes, we use authauthor
      {\iffieldequalstr{labelnamesource}{author}    % if biblatex uses author we similarly test for
                                                    % authauthor and use this field
        {\ifnameundef{authauthor}% if defined use authauthor
          {\indexnames{author}}
          {\indexnames{authauthor}}} % if defined use this field
        {\iffieldequalstr{labelnamesource}{shorteditor} % same for editor
          {\ifnameundef{autheditor}
            {\indexnames{editor}}
            {\indexnames{autheditor}}}
          {\indexnames{labelname}}}}}               % as a fallback we index on whatever biblatex used.
    {}}




%% DOIs are handled after hyperref.
\defbibheading{references}{\chapter{References}\sloppy}
\defbibheading{french}{\chapter{Références bibliographiques}\sloppy}
\defbibheading{german}{\chapter{Literaturverzeichnis}\sloppy}
\defbibheading{portuguese}{\chapter{Referências}\sloppy}
\defbibheading{chinese}{\chapter{参考文献}\sloppy}


% fix \citep* et.al.
% unclear why it was overwritten, these are the definitions from blx-natbib.def
\renewrobustcmd*{\citet}{%
  \@ifstar
    {\AtNextCite{\AtEachCitekey{\defcounter{maxnames}{999}}}%
     \textcite}
    {\textcite}}

\renewrobustcmd*{\citep}{%
  \@ifstar
    {\AtNextCite{\AtEachCitekey{\defcounter{maxnames}{999}}}%
     \parencite}
    {\parencite}}

\renewrobustcmd*{\citealt}{%
  \@ifstar
    {\AtNextCite{%
       \def\nameyeardelim{\addspace}%
       \AtEachCitekey{\defcounter{maxnames}{999}}}%
     \orgcite}
    {\AtNextCite{\def\nameyeardelim{\addspace}}%
     \orgcite}}

\renewrobustcmd*{\citealp}{%
  \@ifstar
    {\AtNextCite{\AtEachCitekey{\defcounter{maxnames}{999}}}%
     \orgcite}
    {\orgcite}}

\let\citew\citet

\let\orgcite=\cite
\let\cite=\citet 	% in order to prevent inconsistencies between \cite and \citet

%% penalties against widows and orphans in bibliography
%% http://tex.stackexchange.com/questions/297705/atbeginenvironment-does-not-work-with-natbib/297721#297721
\apptocmd{\thebibliography}{%
\clubpenalty\@M
\@clubpenalty\clubpenalty
\widowpenalty\@M
}
{}{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Floats
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
%    Appendices
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


% for papers that have appendices, a replacement for \appendix.
% Usage: \begin{paperappendix} \section{Title} ... \end{paperappendix
%        Will result in "Appendix A: Title"
%
\newcounter{paperappendixsection}
\newenvironment{paperappendix}{%
    \let\oldthesection\thesection%
    \let\oldsectionformat\sectionformat%
    \setcounter{paperappendixsection}{0}%
    \def\thesection{\Alph{paperappendixsection}}%
    \def\sectionformat{\stepcounter{paperappendixsection}\appendixname\ \thesection:\enskip}%
    }{%
    \let\thesection\oldthesection%
    \let\sectionformat\oldsectionformat}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Indexes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{index} %% Wie im Stylefile, aber ohne \MakeUppercase
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
  ]%        \@mkboth{\MakeUppercase\indexname}%                {\MakeUppercase\indexname}%
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

% \AtBeginDocument{% FK 16-Jan-19: It is unclear why this was set. It conflicts with TikZ externalisation.
	\makeindex
	\newindex{lan}{ldx}{lnd}{\lsLanguageIndexTitle}
	\newindex{sbj}{sdx}{snd}{\lsSubjectIndexTitle}
	\renewindex{default}{adx}{and}{\lsNameIndexTitle} %biblatex can only deal with the default index
% 	\newindex{wrd}{wdx}{wnd}{Expression index}
% 	\newindex{rwrd}{rdx}{rnd}{Reverse expression index}
% }

\indexproofstyle{\setlength{\overfullrule}{0pt}\raggedright\footnotesize}

%% \index inside footnote
\def\infn#1#2{% 	\hyperpage{#2}n#1%  99n2
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

\providecommand{\isi}[1]{\is{#1}#1}
\providecommand{\iai}[1]{\ia{#1}#1}
\providecommand{\ili}[1]{\il{#1}#1}

\iflsShowIndex	% shows index commands in text
    \RequirePackage{soul}
%     \RequirePackage[noadjust]{marginnote}
    \renewcommand{\marginpar}{\marginnote}
    \let\isold\is
    \let\ilold\il
    \let\iaold\ia
    \renewcommand{\isi}[1]{\sethlcolor{lsSoftGreen}\hl{#1}\isold{#1}}
    \renewcommand{\is}[1]{{\tikzstyle{notestyleraw} += [text width=1.5cm]\todo[color=lsSoftGreen,size=\scriptsize]{\tiny#1}\isold{#1}}}
    \renewcommand{\ili}[1]{\sethlcolor{yellow}\hl{#1}\ilold{#1}}
    \renewcommand{\il}[1]{{\tikzstyle{notestyleraw} += [text width=1.5cm]\todo[color=yellow,size=\scriptsize]{\tiny#1}\ilold{#1}}}
    \renewcommand{\iai}[1]{\sethlcolor{pink}\hl{#1}\iaold{#1}}
    \renewcommand{\ia}[1]{{\tikzstyle{notestyleraw} += [text width=1.5cm]\todo[color=pink,size=\scriptsize]{\tiny#1}\iaold{#1}}}
\fi

% integrate see also in multiple indexes
\def\igobble#1 {}
\newcommand{\langsciseealso}{\par\addvspace{.1\baselineskip}\hspace*{1.4cm}\hangindent=1.4cm\seealso}
\newcommand{\ilsa}[2]{\il{#1@\igobble | langsciseealso{#2}}}
\newcommand{\issa}[2]{\is{#1@\igobble | langsciseealso{#2}}}
\newcommand{\iasa}[2]{\ia{#1{}@\igobble | langsciseealso{#2}}}


\newcommand{\name}[3][]{%add person names to text and author index
#2 %output first name
\ifstrempty{#1}{%if no optional argument present
\ia{#3, #2@#3, #2}%add lastname, firstname to index
}{%if optional argument present
\ia{#1@#1}% add optional argument to index
}%
#3}%output last name in text

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Hyperref
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

%% autoref (part of hyperref)
\ifx\lsBookLanguage\lsBookLanguageEnglish
\renewcommand{\partautorefname}{Part}%
\renewcommand{\chapterautorefname}{Chapter}%
\renewcommand{\sectionautorefname}{Section}%
\renewcommand{\subsectionautorefname}{Section}%
\renewcommand{\subsubsectionautorefname}{Section}%
\renewcommand{\figureautorefname}{Figure}%
\renewcommand{\tableautorefname}{Table}%
\renewcommand{\Hfootnoteautorefname}{Footnote}%
\fi

\providecommand{\sectref}[1]{§\ref{#1}}
\providecommand{\chapref}[1]{Chapter~\ref{#1}}
\providecommand{\partref}[1]{Part~\ref{#1}}
\providecommand{\tabref}[1]{Table~\ref{#1}}
\providecommand{\figref}[1]{Figure~\ref{#1}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Collection (edited volume):
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
	\if@partsw\AfterEndDocument{\typeout{langscibook Warning: You are in includeonly mode.}\typeout{The bibliographical information for the chapters in this volume have not been updated}}\else% Check for \includeonly mode
	\newwrite\tempfile						% open temporary bib file
	\immediate\openout\tempfile=collection_tmp.bib
	\fi
}
% Only touch the \tempfile if we are NOT in \includeonly mode, prevent flushing of the file
\AtEndDocument{\if@partsw\else\immediate\closeout\tempfile\fi}% close temporary bib file

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
	\renewcommand{\lsCollectionPaperCitationText}{\fullciteFooter{#1footer}}

	\include{#1}%
        \if@partsw\relax\else% This switch controls whether the included chapter is in the range of \includeonly. It's from source2e.
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
	\immediate\write\tempfile{@incollection{#1,author={\authorTemp},title={{\lsCollectionPaperFooterTitle}},booktitle={{\lsCollectionTitle}},editor={\editorTemp},publisher={Language Science Press.},Address={Berlin},year={\lsYear},pages={\lsCollectionPaperFirstPage --\lsCollectionPaperLastPage},doi={\lsChapterDOI},keywords={withinvolume}}}
	\immediate\write\tempfile{@incollection{#1footer,author={\authorTemp},title={{\lsCollectionPaperFooterTitle}},booktitle={{\lsCollectionTitle}},editor={\editorTemp},publisher={Language Science Press.},Address={Berlin},year={\lsYear},pages={\lsCollectionPaperFirstPage --\lsCollectionPaperLastPage},doi={\lsChapterDOI},options={dataonly=true}}}
        \fi% If the paper is not within \includeonly, don't do anything.
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
    \@title\ \newline{\normalfont\@author}}} % space between \@title and \newline is needed for bookmarks

\newcommand{\localizedchaptestring}{Chapter}
\newcommand{\lsCollectionPaperTitle}{{%
  \renewcommand{\newlineTOC}{}
  \renewcommand{\newlineCover}{\\}
  \renewcommand{\chapterheadstartvskip}{}
  {\LARGE \noindent \hspace*{-.7cm} \localizedchaptestring~\thechapter}\\ %there must be a better way to undo this length than a hard value
  \bigskip
  \@title}}

\newcommand{\lsCollectionPaperFooterTitle}{\@title}

\newcommand{\lsCollectionPaperFrontmatterMode}{% %%% Sometimes, chapters like prefaces appear in edited volumes that need special treatment in their headers and TOC
  \renewcommand{\lsCollectionPaperTitle}{{%
  \renewcommand{\newlineTOC}{}
  \renewcommand{\newlineCover}{\\}
  \\[-1\baselineskip]
  \noindent{\LARGE ~}\\
  \bigskip
  \noindent\@title}}

  \renewcommand{\lsCollectionPaperTOC}{{%
  \iflsCollectionChapter%
    \protect\numberline{~}\fi
  \@title\ \newline{\normalfont\@author}}}
}

\newcommand{\lsCollectionPaperMainmatterMode}{% %%% This resets the changes done by FrontmatterMode
  \renewcommand{\lsCollectionPaperTitle}{{%
  \renewcommand{\newlineTOC}{}
  \renewcommand{\newlineCover}{\\}
  \\[-1\baselineskip]
% \vspace*{-2\baselineskip}
  \noindent{\LARGE Chapter \thechapter}\\
  \bigskip
  \@title}}

  \renewcommand{\lsCollectionPaperTOC}{{%
  \iflsCollectionChapter%
    \protect\numberline{\thechapter}\fi
  \@title\ \newline{\normalfont\@author}}}}

\newcommand{\lsCollectionPaperAuthor}{{%
  \renewcommand{\newlineTOC}{}
  \renewcommand{\newlineCover}{\\[0.5ex]}
  \AuthorAffiliation\Large\@author}}

\newcommand{\lsCollectionPaperCitation}{\scalebox{1.2}{%
  \includechapterfooterlogo}%
  % \hspace{0.8em}%
  \hfill%
  \parbox[b]{.87\textwidth}{\linespread{0.8}\lsChapterFooterSize\normalfont\lsCollectionPaperCitationText \includegraphics[height=.75em]{ccby.pdf}}}
\ifx\lsOutput\lsOutputPaper       % only if output==paper
	\renewcommand{\lsCollectionPaperCitation}{Change with \string\papernote}
\fi

\newcommand{\lsCollectionPaperCitationText}{\string\lsCollectionPaperCitationText.}

\newcommand{\papernote}[1]{
  \renewcommand{\lsCollectionPaperCitation}{#1}}

\newcommand{\lsPaper}{
  \renewcommand{\maketitle}{
    \refstepcounter{chapter}
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

\providecommand\shorttitlerunninghead[1]{\rohead{\thechapter\hspace{.5em} #1}}

\providecommand{\markuptitle}[2]{
  \title{\texorpdfstring{#1}{#2}}
  \shorttitlerunninghead{#2}
  \renewcommand{\lsChapterFooterSize}{\scriptsize}
  \renewcommand{\lsCollectionPaperFooterTitle}{Add\noexpand\texttt{\textbackslash renewcommand\{\textbackslash lsCollectionPaperFooterTitle\}\{A new theory of \textbackslash noexpand\textbackslash textit\{This\} and \textbackslash noexpand\textbackslash textit\{that\}\}} to preamble}
}


%writeout page numbers for separation of chapters

% \usepackage{newfile}
% \newoutputstream{pages}
% \openoutputfile{\jobname.pgs}{pages}
% \newcommand{\writechapterpages}{\addtostream{pages}{\thepage}}
% \AtEndDocument{
%  \closeoutputstream{pages}
% }



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Localisation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




\ifx\lsBookLanguage\lsBookLanguageFrench
  \renewcommand{\chapref}[1]{Chapitre~\ref{#1}}
  \renewcommand{\partref}[1]{Partie~\ref{#1}}
  \renewcommand{\tabref}[1]{Tableau~\ref{#1}}
  \renewcommand{\figref}[1]{Figure~\ref{#1}}
\fi

\ifx\lsBookLanguage\lsBookLanguageGerman
  \renewcommand{\chapref}[1]{Kapitel~\ref{#1}}
  \renewcommand{\partref}[1]{Teil~\ref{#1}}
  \renewcommand{\tabref}[1]{Tabelle~\ref{#1}}
  \renewcommand{\figref}[1]{Abbildung~\ref{#1}}
\fi

\ifx\lsBookLanguage\lsBookLanguagePortuguese
  \renewcommand{\chapref}[1]{Capítulo~\ref{#1}}
  \renewcommand{\partref}[1]{Parte~\ref{#1}}
  \renewcommand{\tabref}[1]{Tabela~\ref{#1}}
  \renewcommand{\figref}[1]{Figura~\ref{#1}}
\fi

\ifx\lsBookLanguage\lsBookLanguageChinese
    %%Fonts for Chinese typesetting. If booklanguage=chinese, then 
    %%xeCJK is loaded, which provides the font commands below.
    \setCJKmainfont[
%       Path=\fontpath,
      BoldFont = SourceHanSerifSC-Semibold.otf
      ]
      {SourceHanSerifSC-Regular.otf}

    \setCJKsansfont[
%       Path=\fontpath,
      BoldFont = SourceHanSansSC-Bold.otf
      ]
      {SourceHanSansSC-Regular.otf}
      
      %% Settings for Punctuation
      \xeCJKsetup{CheckFullRight=true}
      \xeCJKsetup{PunctStyle=CCT}
	
      %% Localisation strings
      \renewcommand{\sectionname}{节}  
      \renewcommand{\figurename}{图}  
      \renewcommand{\tablename}{表}
      \renewcommand{\contentsname}{目\hspace{1em}录}
      \renewcommand{\appendixname}{附录}
      %   \renewcommand{\chapref}[1]{}
      %   \renewcommand{\partref}[1]{}
      \renewcommand{\tabref}[1]{表~\ref{#1}}
      \renewcommand{\figref}[1]{图~\ref{#1}}
      \renewcommand{\sectref}[1]{节~\ref{#1}}
      \renewcommand*{\partformat}{第\zhdig{part}部分\hspace{20pt}}
      \renewcommand*{\partheadmidvskip}{}
      \renewcommand*{\chapterformat}{第\zhnum{chapter}章\hspace{20pt}}
      \renewcommand*{\raggedchapter}{\centering}
      \renewcommand*{\sectionformat}{\thesection\hspace{10pt}}
\fi

\newcommand{\lsIndexTitle}{Index}
\newcommand{\lsLanguageIndexTitle}{Language index}	% This can be changed according to the language.
\newcommand{\lsSubjectIndexTitle}{Subject index}
\newcommand{\lsNameIndexTitle}{Name index}
\newcommand{\lsPrefaceTitle}{Preface}
\newcommand{\lsAcknowledgementTitle}{Acknowledgments}
\newcommand{\lsAbbreviationsTitle}{Abbreviations}
\newcommand{\lsReferencesTitle}{references} % This aligns with \defbibheading
% \IfFileExists{{\localepath langsci-hyphenation-universal}}{\input{\localepath langsci-hyphenation-universal}}{}

\ifx\lsBookLanguage\lsBookLanguageFrench
\renewcommand{\lsIndexTitle}{Index}
\renewcommand{\lsNameIndexTitle}{Index des auteurs cités}
\renewcommand{\lsSubjectIndexTitle}{Index des termes}
\renewcommand{\lsLanguageIndexTitle}{Index des langues}
\renewcommand{\lsPrefaceTitle}{Préface}
\renewcommand{\lsAcknowledgementTitle}{Remerciements}
\renewcommand{\lsAbbreviationsTitle}{Liste des abréviations utilisées dans les gloses des exemples}
\renewcommand{\lsReferencesTitle}{french}
  \iflsNoBabel
  \else
    \renewcommand\frenchfigurename{Figure}
    \renewcommand\frenchtablename{Table}
  \fi
% \IfFileExists{{\localepath langsci-hyphenation-fr}}{\input{\localepath langsci-hyphenation-fr}}{}
\fi

\ifx\lsBookLanguage\lsBookLanguageGerman
\renewcommand{\lsIndexTitle}{Register}
\renewcommand{\lsNameIndexTitle}{Autorenregister}
\renewcommand{\lsSubjectIndexTitle}{Sachregister}
\renewcommand{\lsLanguageIndexTitle}{Sprachregister}
\renewcommand{\lsPrefaceTitle}{Vorwort}
\renewcommand{\lsAcknowledgementTitle}{Danksagung}
\renewcommand{\lsAbbreviationsTitle}{Abkürzungsverzeichnis}
\renewcommand{\lsReferencesTitle}{german}
% \IfFileExists{{\localepath langsci-hyphenation-de}}{\input{\localepath langsci-hyphenation-de}}{}
\fi

\ifx\lsBookLanguage\lsBookLanguagePortuguese
\renewcommand{\lsIndexTitle}{Índices}
\renewcommand{\lsNameIndexTitle}{Índice remissivo de autores citados}
\renewcommand{\lsSubjectIndexTitle}{Índice remissivo temático}
\renewcommand{\lsLanguageIndexTitle}{Índice remissivo de línguas}
\renewcommand{\lsPrefaceTitle}{Prefácio}
\renewcommand{\lsAcknowledgementTitle}{Agradecimentos}
\renewcommand{\lsAbbreviationsTitle}{\colorbox{red}{Translation info for Abbv missing}}
\renewcommand{\lsReferencesTitle}{portugese}
% \IfFileExists{{\localepath langsci-hyphenation-pt}}{\input{\localepath langsci-hyphenation-pt}}{}
\fi

\ifx\lsBookLanguage\lsBookLanguageChinese
\renewcommand{\lsIndexTitle}{索引}
\renewcommand{\lsNameIndexTitle}{人名索引}
\renewcommand{\lsSubjectIndexTitle}{术语索引}
\renewcommand{\lsLanguageIndexTitle}{语言索引}
\renewcommand{\lsPrefaceTitle}{前言}
\renewcommand{\lsAcknowledgementTitle}{致谢}
\renewcommand{\lsAbbreviationsTitle}{\colorbox{red}{Translation info for Abbv missing}}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Miscellaneous
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[figuresright]{rotating}

%% hspace over width of something without showing it
\newlength{\LSPTmp}
\newcommand*{\hspaceThis}[1]{\settowidth{\LSPTmp}{#1}\hspace*{\LSPTmp}}

% no this does add vertical space instead of horizontal St. Mü. 04.03.2018
% \newcommand*{\hspaceThis}[1]{\hphantom{#1}} %should be equivalent

% in this example
%% \eal
%% \ex \hspaceThis{*~}The boy who is running fast can jump high. $\to$\\
%%  {}* Is the boy who running fast can jump high?
%% \ex \hspaceThis{*~}The boy who can run fast can jump high. $\to$\\
%%  {}* Can the boy who run fast can jump high?
%% \zl

\iflsArseneau% Donald Arseneau's automatic handling of page breaking from comp.text.tex: https://groups.google.com/d/topic/comp.text.tex/3eehwzortPg/discussion
% With the optimisations from the memoir class. The memoir class has relative instead of absolute values.
\def\sloppybottom{%
  \def\@textbottom{\vskip \z@ \@plus.0001fil \@minus .95\topskip}%
  \topskip=1\topskip \@plus 0.625\topskip \@minus .95\topskip%
  \def\@texttop{\vskip \z@ \@plus -0.625\topskip \@minus -0.95\topskip}%
}
\sloppybottom
\fi

\endinput
