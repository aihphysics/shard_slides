\ProvidesClass{shard}[22/03/23 Class for typesetting presentations]

\RequirePackage{textpos}
\RequirePackage{calc}
\RequirePackage{graphicx}
\RequirePackage{transparent}
\RequirePackage[linktoc=none]{hyperref}
\RequirePackage{eso-pic}
\RequirePackage{cancel}
\RequirePackage{amsmath}
\RequirePackage{fixmath}
\RequirePackage{setspace}
\RequirePackage{blindtext}
\RequirePackage{xcolor}
\RequirePackage{fontawesome5}
\RequirePackage[page]{totalcount}
%%\RequirePackage{contents}
\RequirePackage[most]{tcolorbox}
\RequirePackage[nott, scaled=0.5]{inconsolata}
\RequirePackage[T1]{fontenc}
\RequirePackage{calculator}
\RequirePackage{ifthen}
%%\RequirePackage[tocflat]{tocstyle}

%%\renewcommand*\familydefault{\ttdefault} %% Only

\newcommand{\titling}{\fontsize{15pt}{10pt}\selectfont}
\newcommand{\large}{\fontsize{15pt}{8pt}\selectfont}
\newcommand{\Large}{\fontsize{15pt}{8pt}\selectfont}
\newcommand{\normal}{\fontsize{10pt}{10pt}\selectfont}
\renewcommand{\normalsize}{\fontsize{10pt}{10pt}}
\newcommand{\small}{\fontsize{4pt}{6pt}}
\setlength{\paperwidth}{12.80cm}
\setlength{\paperheight}{9.60cm}
\setlength\parindent{0pt}

\RequirePackage[ papersize={\paperwidth, \paperheight}, hmargin=0in, vmargin=0cm,
                 head=0.5cm, headsep=0cm, foot=0.5cm, right=0cm ]{geometry}
\RequirePackage{lastpage}
\RequirePackage[ subdivisions=3, heightr=1, width=\textwidth, borderwidth=0.0pt, roundnessa=0pt, linecolor=darkgray, tickswidth=0.0pt, ticksheight=0.0pt, emptycolor=gray, filledcolor=black]{ progressbar }

\AtEndDocument{ 
	\immediate\write\@auxout{\gdef\string\notinitial{1}}
}

\newcounter{section}
\setcounter{section}{0}

\newtcolorbox{bgbox}[1][]{nobeforeafter,leftright skip=0in,boxrule=0pt,enhanced jigsaw,sharp corners,#1}
\def\token{TOKEN}

\newcommand\tableofcontents{%
	\raggedright Progress\\\@starttoc{toc}
}

\newcommand{\secmark}{\sectionmark}

\newcommand{\section}[1]{
  \par\refstepcounter{section}% Increase section counter
  \renewcommand{\secmark}{\sectionmark[#1}
  %%\addcontentsline{toc}{section}{\protect\numberline{\thesection}#1}% Add section to ToC
  \addcontentsline{toc}{section}{#1\\}% Add section to ToC
}

\renewenvironment{frame}[1]
	{ 
		\newpage 

        \normal
		\begin{bgbox}[ height=\paperheight, colback=darkgray, width=0.3\textwidth, rightrule=0pt ]
		\vbox to 0.9\textheight{
		\color{white}
		\begin{center}
            \titling #1\\
			\normal{\secmark }
		\end{center}
		\tableofcontents
		\vfill
		\begin{center}
			\thepage/\pageref*{LastPage}
		\end{center}
		\ifcsname notinitial\endcsname
			\SUBTRACT{ \totalpages }{ 1 }{ \actualpages }
            \DIVIDE{\thepage}{ \actualpages }{ \fracprogress }
		\else
            \providecommand\fracprogress{0.5}
		\fi
		\progressbar{\fracprogress }
		}
		\end{bgbox}\begin{bgbox}[ height=\paperheight, colback=gray, width=0.7\textwidth, rightrule=0pt ]
		\normal
	}
	{
		\end{bgbox}
		\pagebreak
	}
	
\pagenumbering{arabic}

