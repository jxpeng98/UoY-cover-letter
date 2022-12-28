% UoYletter.cls -- a document class for writing letters with OSU letterhead 
% This class based on "brownletter.cls" Copyright 2003, Nesime Tatbul (tatbul@cs.brown.edu)
%
% This version modifications by Huang Weiran 
% (huangweiran1998@outlook.com), 28 October 2019
% 
% The previous version modifications by Fanchao Chen
% (chenfanchao_robin@outlook.com), 23 October 2021
%
% This version is modified by Jiaxin Peng (jp1367@york.ac.uk), 23 September 2022

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uoycoverletter}
%% Support non-ascii characters
%% ----- RequirePackage -----
\RequirePackage{graphicx}
\RequirePackage{ragged2e}
%% Add support for hyperlinks
\RequirePackage{hyperref}
    \hypersetup{
        colorlinks,
        breaklinks,
        urlcolor=linkcolour,  % Color them black
        linkcolor=linkcolour  % Color them black
    }
%% Add support for nuanced list formatting
%\RequirePackage{enumitem}
%\setlist{nosep,topsep=0pt,leftmargin=12pt}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{fontawesome5}
\RequirePackage{tikz}
\RequirePackage{bookmark}
\RequirePackage{multirow}
\RequirePackage{tabularx}
\RequirePackage{tabu}
\RequirePackage{lastpage}
\usepackage{blindtext}
%% ----- parent class -----
\LoadClass[letterpaper]{letter}
%% Define page layout
\RequirePackage[margin=1in]{geometry}
    \pagestyle{fancy}
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot[R]{Page \thepage\ of \pageref{LastPage}}
    \setlength{\parindent}{0pt}
    \setlength{\parskip}{\baselineskip}

%% ----- Custom Commands -----
%% keycommand
\RequirePackage{keycommand}
    \begingroup
    \makeatletter
    \catcode`\/=8 %
    \@firstofone
        {
        \endgroup
        \renewcommand{\ifcommandkey}[1]{%
            \csname @\expandafter \expandafter \expandafter
            \expandafter \expandafter \expandafter \expandafter
            \kcmd@nbk \commandkey {#1}//{first}{second}//oftwo\endcsname
        }
        }

\newcommand{\email}[1]{\faIcon{envelope} \href{mailto:#1}{#1}}
\newcommand{\website}[1]{\faIcon{globe} \href{https://#1}{#1}}
\newcommand{\phone}[1]{\faIcon{phone-alt} \href{tel:#1}{#1}}
\newkeycommand{\coverletterheader}[department,university,address,
postcode,phone,email,website,logo]{%
\begin{flushleft}
    \begin{tabularx}{\linewidth}{@{}lr@{}}
        {
        \begin{tabu}to 0.6\textwidth{X[l]}
        \ifcommandkey{department}{%
            \textbf{\commandkey{department}}\\
        }%
        {}%
        \ifcommandkey{university}{
            \textbf{\commandkey{university}}\\
        }%
        {}%
        \ifcommandkey{address}{
            \commandkey{address}\\
        }%
        {}%
        \ifcommandkey{postcode}{
            \commandkey{postcode}\\
        }%
        {}%
        \ifcommandkey{phone}{
            \phone{\commandkey{phone}}\\
        }%
        {}%
        \ifcommandkey{email}{
            \email{\commandkey{email}}\\
        }%
        {}%
        \ifcommandkey{website}{
            \website{\commandkey{website}}\\
        }%
        {}%
    \end{tabu}
        }
& \begin{tabu} to 0.4\textwidth{X[l]}
    {\includegraphics[width=0.35\textwidth]{\commandkey{logo}}}\\
\end{tabu}
    \end{tabularx}
\end{flushleft}
}