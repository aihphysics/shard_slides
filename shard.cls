\ProvidesClass{shard}[22/03/23 Class for typesetting presentations]

\RequirePackage{textpos}
\RequirePackage{calc}
\RequirePackage{graphicx}
\RequirePackage{pifont}
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
\RequirePackage{kvoptions}
%%\RequirePackage{contents}
\RequirePackage[most]{tcolorbox}
\RequirePackage[nott, scaled=0.5]{inconsolata}
\RequirePackage[T1]{fontenc}
\RequirePackage{calculator}
\RequirePackage{ifthen}
\RequirePackage{xparse}


\newcommand{\titling}{\fontsize{18pt}{7pt}\selectfont}
\newcommand{\BigTit}{\fontsize{25pt}{30pt}\selectfont}
\newcommand{\large}{\fontsize{15pt}{8pt}\selectfont}
\newcommand{\Large}{\fontsize{15pt}{8pt}\selectfont}
\newcommand{\normal}{\fontsize{10pt}{10pt}\selectfont}
\newcommand{\header}{\fontsize{12pt}{10pt}\selectfont}
\renewcommand{\normalsize}{\fontsize{10pt}{10pt}}
\newcommand{\small}{\fontsize{4pt}{6pt}\selectfont}
\setlength{\paperwidth}{12.80cm}
\setlength{\paperheight}{9.60cm}
\setlength\parindent{0pt}

\RequirePackage[ papersize={\paperwidth, \paperheight}, hmargin=0in, vmargin=0cm,
                 head=0.5cm, headsep=0cm, foot=0.5cm, right=0cm ]{geometry}
\RequirePackage{lastpage}
\RequirePackage[ subdivisions=3, heightr=1, width=\textwidth, borderwidth=0.0pt, roundnessa=0pt, linecolor=darkgray, tickswidth=0.0pt, ticksheight=0.0pt, emptycolor=gray, filledcolor=black]{ progressbar }


\AtBeginDocument{
    \newcounter{sectionwritecounter}
    \setcounter{sectionwritecounter}{0}
    \def\sectionlist{}
    \newcounter{section}
    \setcounter{section}{0}
    \newcounter{sectionprintout}

}

\AtEndDocument{ 
	\immediate\write\@auxout{\gdef\string\notinitial{1}}
    \immediate\write\@auxout{\gdef\string\outsection{\sectionlist}}
    \immediate\write\@auxout{\gdef\string\totalsections{\thesection}}
}


\newtcolorbox{bgbox}[1][]{nobeforeafter,leftright skip=0in,boxrule=0pt,enhanced jigsaw,sharp corners,#1}
\def\token{TOKEN}

\newcommand\tableofcontents{%
    \raggedright \header{\underline{Progress}:}\normal\\\@starttoc{toc}
}

\newcommand{\secmark}{\sectionmark}

\newcommand{\section}[1]{
  \par\refstepcounter{section}% Increase section counter
  \renewcommand{\secmark}{\sectionmark[#1}
  %%\addcontentsline{toc}{section}{\protect\numberline{\thesection}#1}% Add section to ToC
  \addcontentsline{toc}{section}{#1\\}% Add section to ToC
  \g@addto@macro\sectionlist{#1,}
  \message{\sectionlist}
}

\newcommand{\idot}{{\textcolor{white}{\textbullet}}}
\newcommand{\bdot}{{\textcolor{black}{\textbullet}}}


\NewDocumentCommand \titleframe {O{Title} O{Subtitle} O{Author} O{Location/Date} }
    { 
        \normal
	    \begin{bgbox}[ height=0.1\paperheight, colback=darkgray, width=\textwidth, rightrule=0pt ]
        \end{bgbox}
        \begin{bgbox}[ height=0.4\paperheight, colback=gray, width=\textwidth, rightrule=0pt ]
            \vspace{30pt}
            \begin{center}
            \BigTit #1
            \vspace{10pt}
            \titling \\ #2
            \end{center}
            \vfill
		\end{bgbox}
	    \begin{bgbox}[ height=0.5\paperheight, colback=darkgray, width=0.5\textwidth, rightrule=0pt ]
            \vspace{30pt}
            \begin{center}
                \includegraphics[width=0.6\textwidth]{ATLAS_LOGO.png}
            \end{center}
        \end{bgbox}\begin{bgbox}[ height=0.5\paperheight, colback=darkgray, width=0.5\textwidth, rightrule=0pt ]
            \vspace{45pt}
            \begin{center}
                \color{white}
                \titling #3 \\ #4
            \end{center}

        \end{bgbox}
	}




%%\renewenvironment{frame}[2][Title]
\RenewDocumentEnvironment{frame}{O{Title} O{0} O{{}} O{0} O{{}} }
	{ 
		\newpage 
        \normal
		\begin{bgbox}[ height=\paperheight, colback=darkgray, width=0.3\textwidth, rightrule=0pt ]
		\vbox to 0.9\textheight{
		\color{white}
		\begin{center}
            \vspace{0.1cm}
            \titling{ #1 } \\
			\normal{\secmark }
            \vspace{0.1cm}
		\end{center}
		\ifcsname notinitial\endcsname
            \header{\underline{Contents}:}\\\normal
            \setcounter{sectionprintout}{1}
            \@for\content:=\outsection\do{%
                \ADD{\totalsections}{1}{\sectionlimit}
                \ifthenelse{ \thesectionprintout < \sectionlimit }{
                    \ifthenelse{ \thesection = \thesectionprintout}{
                        \textcolor{white}{\thesectionprintout\hfill\content}
                    }{
                        \textcolor{gray}{\thesectionprintout\hfill\content}
                    }\\
                \addtocounter{sectionprintout}{1}
                }{}
			}
        \else
            \header{\underline{RERUN FOR CONTENTS}}
        \fi
		\vfill
        \ifthenelse{ \equal{#4}{0} }{
			\message{noref}	
		}{
            \header{\underline{Learning Outcomes}:}\normal
			\begin{itemize}
			\@for\refitem:=#5\do{%
				\item[\idot\;\;]\refitem	
			}
			\end{itemize}
			\message{ref}	
		}
		\ifthenelse{ \equal{#2}{0} }{
			\message{noref}	
		}{
            \vspace{0.3cm}
            \header{\underline{References}:}\normal
			\begin{itemize}
			\@for\refitem:=#3\do{%
				\item[\idot\;\;]\refitem	
			}
			\end{itemize}
		}
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
