\ProvidesClass{shard}[22/03/23 Class for typesetting presentations]



%% Require packages
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
\RequirePackage[most]{tcolorbox}
\RequirePackage[T1]{fontenc}
\RequirePackage[nott]{inconsolata}
\RequirePackage{calculator}
\RequirePackage{ifthen}
\RequirePackage{xparse}



%% Set up some commands and define some properties
\newcommand{\titling}{\fontsize{8pt}{3pt}\selectfont}
\newcommand{\titlingB}{\fontsize{9pt}{5pt}\selectfont}
\newcommand{\BigTitle}{\fontsize{13pt}{15pt}\selectfont}
\newcommand{\large}{\fontsize{9pt}{5pt}\selectfont}
\newcommand{\Large}{\fontsize{8pt}{6pt}\selectfont}
\newcommand{\body}{\fontsize{9pt}{11pt}\selectfont}
\newcommand{\normal}{\fontsize{5pt}{7pt}\selectfont}
\newcommand{\header}{\fontsize{6pt}{10pt}\selectfont}
\renewcommand{\normalsize}{\fontsize{5pt}{7pt}}
\newcommand{\small}{\fontsize{4pt}{6pt}\selectfont}
\setlength{\paperwidth}{15.00cm}
\setlength{\paperheight}{9.60cm}
\setlength\parindent{0pt}
\newcommand{\sss}{ \scriptscriptstyle }
\setlength\labelsep{3pt}
\setlength\topsep{0.3em}
\setlength\leftmargin{12pt}
\setlength\itemsep{0.2em}


%% Set up fonts
\RequirePackage[]{concmath}
\renewcommand\rmdefault{zi4}
\renewcommand\sfdefault{zi4}
\renewcommand\ttdefault{zi4}
\renewcommand\ttdefault{zi4}
\renewcommand\familydefault{zi4}
\renewcommand\seriesdefault{zi4}
\renewcommand\shapedefault{zi4}
\renewcommand\bfdefault{zi4} 
\renewcommand\mddefault{zi4}
\renewcommand\itdefault{zi4}
\renewcommand\sldefault{zi4}
\renewcommand\scdefault{zi4}
\renewcommand\updefault{zi4}




%% pull in dimension dependent packages
\RequirePackage[ papersize={\paperwidth, \paperheight}, hmargin=0in, vmargin=0cm,
                 head=0.5cm, headsep=0cm, foot=0.5cm, right=0cm ]{geometry}
\RequirePackage{lastpage}
\RequirePackage[ subdivisions=3, heightr=1, width=\textwidth, borderwidth=0.0pt, roundnessa=0pt, linecolor=darkgray, tickswidth=0.0pt, ticksheight=0.0pt, emptycolor=gray, filledcolor=black]{ progressbar }


%% Do the permanancy thing
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


%% Define the commands needed for the later environments
\newtcolorbox{bgbox}[1][]{nobeforeafter,leftright skip=0in,boxrule=0pt,enhanced jigsaw,sharp corners,#1}
\newtcolorbox{bgbox2}[1][]{nobeforeafter,leftright skip=0in,boxrule=0pt,enhanced jigsaw,sharp corners,#1,left=5pt,right=5pt,top=10pt,bottom=10pt}
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


 
%% Title frame environment
\NewDocumentCommand \titleframe{O{Title} O{Subtitle} O{Author} O{Location/Date} }
    { 
        \normal
        \pagecolor{darkgray}
	    \begin{bgbox}[ height=0.1\paperheight, colback=darkgray, width=\textwidth, rightrule=0pt ]
        \end{bgbox}
        \begin{bgbox}[ height=0.4\paperheight, colback=white, width=\textwidth, rightrule=0pt ]
            \vspace{30pt}
            \begin{center}
            \BigTitle#1
            \vspace{10pt}
            \titling\\#2
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



%%Standard frame environment
\RenewDocumentEnvironment{frame}{O{Title} O{Author} O{Date} O{Collaboration} O{{}} O{CENTER} }
	{ 
		\newpage 
        \pagecolor{darkgray}
        \normal
		\begin{bgbox2}[ height=\paperheight, colback=darkgray, width=0.2\textwidth, rightrule=0pt ]
		\vbox to 0.9\textheight{
		\color{white}
		\begin{center}
            \vspace{0.1cm}
            \titlingB{#1} \\
			\normal{\secmark}
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
            \vspace{3pt}
            \setlength{\leftmargin}{5pt}
            \setlength\topsep{0em}
			\begin{itemize}
            \setlength{\itemsep}{0pt}
            \setlength{\parindent}{0pt}
			\@for\refitem:=#5\do{%
				\item[\idot]\refitem	
			}
			\end{itemize}
			\message{ref}	
		}
		\ifthenelse{ \equal{#2}{0} }{
			\message{noref}	
		}{
            \vspace{0.3cm}
            \header{\underline{References}:}\normal
            \vspace{2pt}
            \setlength{\leftmargin}{5pt}
            \setlength\topsep{0em}
            \begin{itemize}
            \setlength{\itemsep}{0pt}
            \setlength{\parindent}{0pt}
			\@for\refitem:=#3\do{%
				\item[\idot]\refitem	
			}
			\end{itemize}
            %%}
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
		\end{bgbox2}\begin{bgbox}[ height=\paperheight, colback=white, width=0.8\textwidth, rightrule=0pt ]
		\body
        \ifthenelse{ \equal{#6}{1} }{
            \begin{minipage}[t][0.9\textheight][c]{\textwidth}%
        }
	}
	{
        \ifthenelse{ \equal{#6}{1} }{
            \end{minipage}
        }

		\end{bgbox}
		\pagebreak
	}
	
\pagenumbering{arabic}
