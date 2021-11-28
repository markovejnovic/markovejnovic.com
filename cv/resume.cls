%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage{graphicx}
\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen}
\usepackage{multicol}
\usepackage{fontspec}
\usepackage{setspace}
\setmainfont [
    Path = fonts/eb-garamond/static/,
    UprightFont = *-Regular,
    BoldFont = *-Bold,
    ItalicFont = *-Italic
]{EBGaramond}
\setmonofont [
    Path = fonts/ibm-plex-mono/,
    UprightFont = *-Regular,
    BoldFont = *-Medium,
    ItalicFont = *-Italic
]{IBMPlexMono}

\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \image#1{\def\@image{#1}}
\def \@image {}

\def \addressSep {\hspace{0.05in}}

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
    \@ifundefined{@addresstwo}{
        \def \@addresstwo {#1}
        }{
        \@ifundefined{@addressthree}{
            \def \@addressthree {#1}
            }{
            \def \@addressone {#1}
    }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
    \begin{flushleft}
        \begingroup
        \def \\ {\addressSep}
        #1
        \endgroup
    \end{flushleft}
}

% \printname is used to print the name as a page header
\def \printname {
    \begingroup
    \begin{flushleft}
        {\namesize \@name \par}
        \nameskip
    \end{flushleft}
    \endgroup
}

\def \printimage {
    \begingroup
    \begin{flushleft}
        \hfill \includegraphics[width=.4\textwidth]{\@image}
        \nameskip\break
    \end{flushleft}
    \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
    \ori@document  % Begin document
    \begin{minipage}{.6\textwidth}
        \vspace{0pt}%
        \parbox{\textwidth}{\printname}%
        \@ifundefined{@addressone}{} {
            \printaddress{\@addressone}
        }
        \@ifundefined{@addresstwo}{} {
            \printaddress{\@addresstwo}
        }
        \@ifundefined{@addressthree}{} {
            \printaddress{\@addressthree}
        }

    \end{minipage}%
    \begin{minipage}{.4\textwidth}
    \vspace{0pt}%
        \parbox{\textwidth}{\printimage}%
    \end{minipage}
}

\newenvironment{rSection}[1]{
    \sectionskip
    % Section Title
    \textsc{\large #1}
    \sectionlineskip
    \hrule % Horizontal line
    \begin{list}{}{ % List for each individual item in the section
            \setlength{\leftmargin}{1.5em} % Margin within the section
        }
        \item[]
            }{
        \end{list}
    }

    %----------------------------------------------------------------------------------------
    %	WORK EXPERIENCE FORMATTING
    %----------------------------------------------------------------------------------------

    \newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
        {\bf #1} \hfill {#2} % Bold company name and date on the right
        \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
            \\
            {\em #3} \hfill {\em #4} % Italic job title and location
        }\smallskip
        \begin{list}{$\cdot$}{\leftmargin=1em} % \cdot used for bullets, no indentation
            \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
            }{
        \end{list}
        \vspace{0.4em} % Some space after the list of bullet points
    }

    % The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
    \def\namesize{\Huge} % Size of the name at the top of the document
    \def\sectionlineskip{\vspace{2pt}} % The space above the horizontal line for each section 
    \def\nameskip{\smallskip} % The space after your name at the top
    \def\sectionskip{\vspace{1pt}} % The space after the heading section
