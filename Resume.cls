%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Small, Medium, Large Length Professional CV - RESUME CLASS FILE
%
% This class file defines the structure and design of the template.
%
% Original header:
% Copyright (C) 2023 by Omar Shawky
%
% Copying and distribution of this file, with or without modification, are not permitted in any medium without royalty provided the copyright notice and this notice are preserved. This file is offered as-is, without any warranty.
%
% Created by Trey Hunner and modified by Omar Shawky
% The original template has been downloaded from: http://www.LaTeXTemplates.com
%
% Custom Style Version: v4.4-CV-PageStyle
% Author: Omar Shawky
% LinkedIn: https://linkedin.com/in/omarshawky1/
% Date: 2024-11-28
%
% Co-Author Omar's Notes:
% Code is intended to run on compiler "pdflatex" version: 2020(legacy) on overleaf. For 2023+, use "Table2" Style.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
% Importted Packages
%----------------------------------------------------------------------------------------
\ProvidesClass{resume}[2024/11/28 v4.4-CV-PageStyle Resume & CV class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
% \usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements

\usepackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=blue,
  filecolor=magenta,
  urlcolor=blue,
}

\usepackage[left=0.4 in,top=0.4in,right=0.4in,bottom=0.4in]{geometry} % Resume margins
% \usepackage[left=0.4 in,top=0.4in,right=0.4in,bottom=0.8in]{geometry} % CV margins
%\usepackage[margin=0.4in]{geometry} % Or just use this if they all should be consistent

% Used in Profile Picture
\usepackage[]{graphicx}
\usepackage[absolute,overlay]{textpos}
% How to use: (you can tinker with values because each image is different)
% \begin{textblock*}{\paperwidth}(\dimexpr7in+0.13in,0.3in)\noindent\includegraphics[scale=0.35]{omar-shawky.png}\end{textblock*}

% For Resumes
\pagestyle{empty} % Suppress page numbers

% For CVs
% \usepackage{fancyhdr}
% \pagestyle{fancy}
% \fancyhf{} % Clear all header and footer fields
% \fancyfoot[C]{\thepage/\pageref{LastPage}}
% \usepackage{lastpage}
% \renewcommand{\headrulewidth}{0pt} % This removes the horizontal line in the header

% Replaced with the one in \inlineitem
% \usepackage{enumitem} % For rItemize left margin

%----------------------------------------------------------------------------------------
% Constants
%----------------------------------------------------------------------------------------
% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip

\def\namesize{\Huge} % Size of the name at the top of the document
\def\jobsize{\Large} % Old job printing
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\addressSep {$\diamond$} % Set default address separator to a diamond
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section
\def\nameskip{\medskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section


% Resume Compression command
\usepackage{fp} % For floating point calculations of decompress
\newcommand{\compress}{0} % Value between 0 and 100
\FPeval{\decompress}{1 - (3*\compress)/1000} % Calculate decompress value, max value is 30% (0.3). If you want to go further, change values that causes wrong rendering and start with the 1.6 value in the longtable.
\def\decompressMinVal{0.7}
\parskip=\decompress\parskip
\newcommand{\rItemizeSkip}{\vspace*{-0.5\baselineskip}}
\newcommand{\rItemizeSkipN}{\vspace*{0.5\baselineskip}}


% Values that aren't useful yet
% For reference, check [overleafhttps](://www.overleaf.com/learn/latex/Articles/How_to_change_paragraph_spacing_in_LaTeX) especially primitive commands section
% \parindent=0pt
% \baselineskip=\decompress\baselineskip
% \lineskiplimit=\decompress\lineskiplimit
% \lineskip=\decompress\lineskip
%\newcommand{\tab}[1]{\hspace{.2667\textwidth}\rlap{#1}}
%\newcommand{\itab}[1]{\hspace{0em}\rlap{#1}}
%----------------------------------------------------------------------------------------
%	Headings Commands: Commands for printing name and address
%----------------------------------------------------------------------------------------

%----------------------------------------------------------------------------------------
% Name Section

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \role#1{\def\@role{#1}} % Defines the \@role command to set role
\def \@role {} % Sets \@role to empty by default

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
  \ifthenelse{\equal{\@role}{}} % If role is not provided
  {\centerline{\namesize{\textbf{\MakeUppercase\@name}}}} % Print only the name
  {\centerline{\namesize{\textbf{\MakeUppercase\@name, \@role}}}} % Print name and role
  \ifthenelse{\equal{\@JobTitle}{}} %For JobTitle function only
  {\nameskip}
  {\bigskip}
  \endgroup
}

% How to use:
% \name{Your Name}
% \role{Your Role} % Optional, you can comment it out

%-----------------------------------------------------------------------------------------
% Job Section

% Style 1
% One, two or three job lines can be specified
\let \@jobone \relax
\let \@jobtwo \relax
\let \@jobthree \relax

% \job command can be used to set the first, second, and third job (last 2 optional)
\def \job #1{
  \@ifundefined{@jobone}
  {
    \def \@jobone {#1}
  }
  {%else
    \@ifundefined{@jobtwo}
    {
      \def \@jobtwo {#1}}
    {%else
      \def \@jobthree {#1}}
  }
}

% \printjob is used to style an job line (given as input)
\def \printjob #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% How to use: (Note: you can use \job command up to 3 times at most)
% \job{one \\ two \\ three} % put at least one job but can put as many jobs as you want
% \job{Software Engineer \\ Electrical \& Communications Engineer \\ Academic Writer} % put at least one job but can put as many addresses as you want


% Style 2
\def \JobTitle#1{\def\@JobTitle{#1}} % Defines the \JobTitle command to set name
\def \@JobTitle{} % Sets \@JobTitle to empty by default

% Old job printing
\def \printJobTitle {
  \begingroup
    \centerline{\MakeUppercase{\jobsize\bf \@JobTitle}}
    \nameskip
  \endgroup
}

% How to use:
% \JobTitle{Software Engineer} % Job title
%----------------------------------------------------------------------------------------
% Address Section

% One, two or three address lines can be specified
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addressone}
  {
    \def \@addressone {#1}
  }
  {%else
    \@ifundefined{@addresstwo}
    {
      \def \@addresstwo {#1}}
    {%else
      \def \@addressthree {#1}}
  }
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% How to use: (Note: you can use \address command up to 3 times at most)
% \address{one \\ two \\ three} % put at least one address but can put as many addresses as you want
% \address{\href{mailto:omarmshawky11@gmail.com}{omarmshawky11@gmail.com} \\ \href{https://linkedin.com/in/omarshawky1/}{linkedin.com/in/omarshawky1/} \\ \href{https://github.com/OmarShawky1}{github.com/OmarShawky1}}


%----------------------------------------------------------------------------------------
%	Print The Heading Lines
%----------------------------------------------------------------------------------------
\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \ifthenelse{\equal{\@JobTitle}{}}{}{\printJobTitle} % Print the name specified with \JobTitle} % Old job printing, don't use "\@ifundefined{@JobTitle}{}{\printJobTitle}" as it will add extra space even if JobTitle is not provided.
  \@ifundefined{@jobone}{}{ % Print the first job if specified
    \printjob{\@jobone}}
  \@ifundefined{@jobtwo}{}{ % Print the first job if specified
    \printjob{\@jobtwo}}
  \@ifundefined{@jobthree}{}{ % Print the first job if specified
    \printjob{\@jobthree}}
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
  \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
}

%----------------------------------------------------------------------------------------
%	Section Formatting
%----------------------------------------------------------------------------------------
% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
\begin{rSection1}{#1}
}{
\end{rSection1}
}

% How to Use:
\iffalse
  \begin{rSection}
    % Write here anything. From list to paragraphs. Refer to Template.tex for examples.
  \end{rSection}
\fi

%----------------------------------------------------------------------------------------
% Implementation
% Dev Notes: This is made to solve a problem with the \item command and kept for the future

% Implementation 1
\newenvironment{rSection1}[1]{ % 1 input argument - section name
  \sectionHeading{#1}
  \begin{list}{}{ % List for each individual item in the section
      \setlength{\leftmargin}{0em} % Margin within the section
    }
    \item
}{
  \end{list}
}

\def \sectionHeading #1{
  \ifthenelse{\equal{\compress}{100}}{}{\sectionskip}
  \MakeUppercase{ % Section title
    \textbf{#1}
  }
  \sectionlineskip
  \hrule % Horizontal line
}

% How to Use:
\iffalse
  \sectionHeading{Title} % Section title
\fi

%----------------------------------------------------------------------------------------
%	Section Formatting (Designed Mainly for Work Experience)
%----------------------------------------------------------------------------------------
\usepackage{xparse} % used for any mmooo...
\usepackage{tokcycle}
\Macrodirective{\addcytoks[1]{\string#1}}% needed for backslash

% 4 mandatory arguments and 3 optional argument
% Role, Company Name, Date, Location: (Gov, Country) or (City, State), Company Description, Project Link, Project Name
% Date: Mon Year \\ Mon Year: Aug 2019 - Sep 2023
% (Gov, Country): Cairo, Egypt
% (City, State): (Palo Alto, CA), (LA, CA), (Upstate, NY), (San Francisco, CA), (Philadephia, PA)
\NewDocumentEnvironment{rSubsection}{mmmoooo}{
  % To change style, just replace rSubsection1 with the other style
  \begin{rSubsection1}{#1}{#2}{#3}[#4][#5][#6][#7]
  \end{rSubsection1}
}{}

% How to Use:
\iffalse
  % For Work Experience (Full time, Internship, Training), Extracurricular Experience, Leadership Experience
  \begin{rSubsection}
    {Role}
    {Company Name}
    {Start Date \\ End Date}
    [Location]
    [Company description] % Optional, erase if unneeded
    \begin{rItemize}
      \item Achieved X As Measured by Y Using Z.
      \begin{rItemize}
        \item Achieved X, by doing Z.
        \item Achieved X, as measured by Y, by doing Z.
        \item Achieved X\%, as measured by Y, by using technologies A, B and skills C, D.
        \item Achieved X\% growth for Y, by using technologies A, B and skills C, D.
        \item Led X, Y that led to Z\% of improvement in A, B, C.
      \end{rItemize}
    \end{rItemize}
  \end{rSubsection}
\fi

% Note for the future: Date parsing is left for user, if this needs to change, check these working solution: https://tex.stackexchange.com/questions/693370/how-to-replace-single-hyphen-with-other-text-such-as-double-hyphen

% Old way
\iffalse
  \NewDocumentEnvironment{rSubsection}{mmmmo}{ % 4 mandatory arguments and 1 optional argument
  {\bf #1} \hfill {#2} % Bold company name and date on the right
  \\
  {#3} \hfill {\em #4} % Italic job title and location
  \IfValueT{#5}{ % If the fifth argument is specified, print the company description
    \\
    \small{#5}
  }
  \smallskip
  }{}

  % How to Use:
  \begin{rSubsection}{Role}{Aug 2019 - Sep 2023}{Company Name}{City, Country}
    \begin{rItemize}
      \item
    \end{rItemize}
  \end{rSubsection}

  \begin{rSubsection}{Role}{Aug 2019 - Sep 2023}{Company Name}{City, Country}[Company description]
    \begin{rItemize}
      \item
    \end{rItemize}
  \end{rSubsection}
\fi

%----------------------------------------------------------------------------------------
% Implementation

% Implementation 1
\NewDocumentEnvironment{rSubsection1}{mmmoooo}{
% Bold Role, Company Name, Emphasised Location and date on the right
  \textbf{#1}, % Bold Role
  {#2}% Company Name
  \ifthenelse{\equal{#4}{}}{}{, \textit{#4}}. % Emphasised Location
  \hfill {\def \\ {--\ } #3} % Date on the right
  \\ % New line then - line is used to align portfolio link with date. It is correct in rSubsection2 & 3 because they create new line unlike inrSubsection1
  \vspace{-\baselineskip}
  \begin{rSubSectionCompanyDescription}[#5][#6][#7]
  \end{rSubSectionCompanyDescription}
}{}

% Implemenatation 2
% For long company names
\NewDocumentEnvironment{rSubsection2}{mmmoooo}{
% Bold Role, date on the right
% Company Name, emphasised Location on the right
  \textbf{#1}% Bold Role
  \hfill {\def \\ {--\ } #3}% Date
  \\
  {#2}% Company Name
  \hfill {\def \\ {--\ } \textit{#4}}% Emphasised Location on the right
  \begin{rSubSectionCompanyDescription}[#5][#6][#7]
  \end{rSubSectionCompanyDescription}
}{}

\NewDocumentEnvironment{rSubsection3}{mmmoooo}{
% Bold Company Name, emphasised Location on the right
% Role, date on the right
  \textbf{#2}% Bold Company Name
  \hfill {\def \\ {--\ } \textit{#4}}% Emphasised Location on the right
  \\
  {#1}%  Role
  \hfill {\def \\ {--\ } #3}% Date
  \begin{rSubSectionCompanyDescription}[#5][#6][#7]
  \end{rSubSectionCompanyDescription}
}{}

% Signature: Company Description, Project link Name, Project Link
\NewDocumentEnvironment{rSubSectionCompanyDescription}{ooo}{
  \IfValueT{#1}{ % Company Description (If the fifth argument is specified)
    \\
    \IfValueF{#2}{ % Default Company Description (If Project link is not available)
      \begin{minipage}[t]{0.99\textwidth} % To prevent company description from overflowing page width
        \raggedright\small{#1}
      \end{minipage}
      \ifthenelse{\equal{\compress}{0}}
      {}
      {\rItemizeSkip}
    }
    \begin{rOpenSourceSubsectionProject}[#1][#2][#3]
    \end{rOpenSourceSubsectionProject}
  }\par
}{}

% Signature: Company Description, Project link Name, Project Link
\NewDocumentEnvironment{rOpenSourceSubsectionProject}{ooo}{
  \IfValueT{#2}{ % Open Source Project or Self Education (If specified, print it)
    \begin{minipage}[t]{0.819\textwidth} % Company Description (with 0.82 to make it not reach project name)
      \raggedright\small{#1}
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.183\textwidth}
      \tokcyclexpress{#2} % For parsing hyperlinks
      \raggedleft
      \IfValueT{#3}{ % Used to prevent needing to write empty []
        \ifthenelse{\equal{#3}{}}
        {\expandafter\href\expandafter{\the\cytoks}{GitHub Link}}
        {\expandafter\href\expandafter{\the\cytoks}{#3}}
      }
    \end{minipage}\par
  }
}{}

%----------------------------------------------------------------------------------------
%	Education Formatting
%----------------------------------------------------------------------------------------
% 3 mandatory arguments and 1 optional argument
% Degree and Field, Place, Date, Location,
% Degree and field: B.S. Computer Science.
% Date: Mon Year \\ Mon Year: Aug 2019 - Sep 2023
% Location: San Jose, CA (Check below for more options)
\NewDocumentEnvironment{rESubsection}{vmmoo}{
  \begin{rSubsection}{#1}{#2}{#3}[#4] % Bold Degree name, university name and date on the right.
  \end{rSubsection}
  \par
}{}

% How to use:
\iffalse
  \begin{rESubsection}
    {Degree and field}
    {University Name}
    {Start Date \\ End Date}
    [Location] % Optional
  \end{rESubsection}
\fi

% Not recomended to use this style directly. Instead, rely on choosing your rSubsection style and make it global
% left in case one wants to use it
\NewDocumentEnvironment{rESubsection2}{vmmoo}{
  \begin{rSubsection2}{#1}{#2}{#3}[#4] % Bold Degree name, university name and date on the right.
  \end{rSubsection2}
  \par
}{}

%----------------------------------------------------------------------------------------
%	Open Experience Formatting
%----------------------------------------------------------------------------------------
% For Open Source Projects, Self-Education, Freelance jobs, Career Breaks/Haitus (E.g., Self learning, illness...)
% 3 mandatory arguments and 3 optional argument
% Open Role, Open Explanation, Date, Open Description, Project Link, Project Name
% Date: Mon Year \\ Mon Year: Aug 2019 - Sep 2023
% Open Role: Self-Learning, Freelancing, Career Break.
% Open Explanation: (Educational: OSSU & MOOCs) (Freelance: Created X Project) (Career Break: Taking care of my newborn)
\NewDocumentEnvironment{rOSubsection}{mmmooo}{
  \begin{rSubsection}{#1}{#2}{#3}[][#4][#5][#6]
  \end{rSubsection}
}{}

% How to Use:
\iffalse
  % For Open Source Projects
  \begin{rOSubsection}
    {Paid Contributor}
    {Chromium Web Browser}
    {Mar 2024 \\ Present}
    [Open source web browser which Chrome, Edge, and Brave are built on.]
    [https://github.com/OmarShawky1/CS-Roadmap#projects]
    [Pull Requests]
    \begin{rItemize}
      \item [Built X which did A, B, and C using D, E, and F.][https://github.com/][PR]
      \item [Developed Y which did A, B, and C using D, E, and F.][https://github.com/][PR]
      % Highly unrecomended unless necessary
      \begin{rItemize}
        \item Achieved X\% As Measured by Y by using/doing Z.
        \item Achieved X\% growth for XYZ using A, B, and C skills/technologies.
        \item Led XYZ which led to X\% of improvement in ABC.
        \item Leveraged knowledge X, Y, Z.
      \end{rItemize}
      % Most of the following points are rarely used for open source.
      \item Achieved X\% As Measured by Y by using/doing Z.
      \item Achieved X\% growth for XYZ using A, B, and C skills/technologies.
      \item Led XYZ which led to X\% of improvement in ABC.
      \item Leveraged knowledge X, Y, Z.
    \end{rItemize}
  \end{rOSubsection}

  % For Self-Education, Freelance Jobs
  \begin{rOSubsection}
    {Open Role}
    {Open Explanation with \href{https://github.com/OmarShawky1/CS-Roadmap\#projects}{Link}} % If it is education
    {Date \\ Date}
    \begin{rItemize}
      \item Achieved X\% As Measured by Y by using/doing Z.
      \item Achieved X\% growth for XYZ using A, B, and C skills/technologies.
      \item Led XYZ which led to X\% of improvement in ABC.
      \item Developed XYZ that did A, B, and C using X, Y, and Z.
    \end{rItemize}
  \end{rOSubsection}

  % For Self-Education, Freelance Jobs
  \begin{rOSubsection}
    {Open Role}
    {Open Explanation} % If it is education
    {Start Date \\ End Date}
    [Open Explanation] % Educational Sources Explanation, Freelance Project Explanation
    [https://github.com/OmarShawky1/CS-Roadmap#projects]  % Optional
    [Project Name] % Optional, replace "Project Name" or leave it empty for default naming. empty if Career Break
    \begin{rItemize}
      \item Achieved X\% As Measured by Y by using/doing Z.
      \item Achieved X\% growth for XYZ using A, B, and C skills/technologies.
      \item Led XYZ which led to X\% of improvement in ABC.
      \item Developed XYZ that did A, B, and C using X, Y, and Z.
    \end{rItemize}
  \end{rOSubsection}

  % For Certificates
  \begin{rOSubsection}
    {AZ-400} % Certificate Name
    {Designing \& Implementing Microsoft DevOps Solutions} % Explanation
    {Mar 2024} % Issued Date
  \end{rOSubsection}

  % For Career Breaks/Haitus
  \begin{rOSubsection}
    {Taking care of elders} % Situation name
    {Taking care of parents due to emergency} % Explanation
    {Mar 2023 \\ Mar 2024} % Issued Date
  \end{rOSubsection}
\fi

% Item format
% Format specifically written for open source projects as to add PR at end of line.
% Does not affect any other piece of code if not used as expected
% Define \ritem with three optional arguments
\NewDocumentCommand{\ritem}{O{} O{} O{}}{
  \ifblank{#2}{% Check if the URL (second argument) is empty
    \item #1 % Only show the description if URL is not provided
  }{
    \item % Start the item
    \begin{minipage}[t]{0.85\textwidth}
      #1 % First optional argument (description)
    \end{minipage}
    % Numbers were arbitrarly calculated:
    % 1. to fit width without overflowing to the Project Link (in company description not the item which is we are currently editing)
    % 2. from using min and max decompression values (1 and 0.7 respectively) and min width values (0.1 (old number before this edit), 0.12 respectively). Use linear equation formula (y = mx + b) to calculate the equation below.
    % y2 = 0.12, y1 = 0.1
    % x2 = 0.7, x1 = 1
    % y = (-1/15)x + 1/6
    \FPeval{\rightMiniPageSize}{(1 / 6) - (\decompress/15)}
    \begin{minipage}[t]{\rightMiniPageSize\textwidth}
      \raggedleft
      \href{#2}{#3} % Second argument (URL), third argument (display text)
    \end{minipage}\par
  }
}
% How to Use:
\iffalse
  \ritem [Built X which did A, B, and C using D, E, and F.][https://github.com/][PR]
\fi


% Old Implementation. Replaced with above because of the newly added publications. Kept for reference.
\iffalse
\let\olditem\item
\RenewDocumentCommand{\item}{ooo}{
  \IfValueTF{#1}
  {
    \begin{minipage}[t]{0.85\textwidth}
      \olditem #1
    \end{minipage}
    % Numbers were arbitrarly calculated:
    % 1. to fit width without overflowing to the Project Link (in company description not the item which is we are currently editing)
    % 2. from using min and max decompression values (1 and 0.7 respectively) and min width values (0.1 (old number before this edit), 0.12 respectively). Use linear equation formula (y = mx + b) to calculate the equation below.
    % y2 = 0.12, y1 = 0.1
    % x2 = 0.7, x1 = 1
    % y = (-1/15)x + 1/6
    \FPeval{\rightMiniPageSize}{(1 / 6) - (\decompress/15)}
    \begin{minipage}[t]{\rightMiniPageSize\textwidth}
      \raggedleft
      \href{#2}{#3}
    \end{minipage}\par
  }
  {\olditem}
}
\fi

% How to Use:
\iffalse
  \item [Built X which did A, B, and C using D, E, and F.][https://github.com/][PR]
\fi

%----------------------------------------------------------------------------------------
%	Projects Formatting
%----------------------------------------------------------------------------------------
% 2 mandatory arguments and 2 optional argument
% Project Name, Project Description, Project Link, Link Name
\NewDocumentEnvironment{rProjects}{mmoo}{
  \textbf{#1}. {#2} % Bold Project Name then Description
  \IfValueT{#3}{
    \tokcyclexpress{#3} %For parsing hyperlinks
    \ifthenelse{\equal{#4}{}} % Project Link & Name
      {\hfill \expandafter\href\expandafter{\the\cytoks}{GitHub Link}}
      {\hfill \expandafter\href\expandafter{\the\cytoks}{#4}}
  }\par
  \ifthenelse{\equal{\compress}{0}}
  {}
  {\rItemizeSkip} % If uncommented, uncomment the one also in {rItemize}
}{}

% How to use:
\iffalse
  \begin{rProjects}{Project name}{Achieved X\% growth for XYZ using A, B, and C skills/technologies.}
  \end{rProjects}

  \begin{rProjects}{Project name}{Description.}
    \begin{rItemize}
      \item Achieved X\% As Measured by Y by using/doing Z.
      \item Achieved X\% growth for XYZ using A, B, and C skills/technologies.
      \item Led XYZ which led to X\% of improvement in ABC.
      \item Developed XYZ that did A, B, and C using X, Y, and Z.
      \item Leveraged knowledge X, Y, Z.
    \end{rItemize}
  \end{rProjects}

  \begin{rProjects}{Project name}{Description.}
    [https://github.com/OmarShawky1/CS-Roadmap#projects]
    []
    \begin{rItemize}
      \item Same as above.
    \end{rItemize}
  \end{rProjects}

  \begin{rProjects}{Project name}{Description}
    [https://github.com/OmarShawky1/CS-Roadmap#projects]
    [Project Link] % Replace "Project Link" with the name you want
    \begin{rItemize}
      \item Same as above.
    \end{rItemize}
  \end{rProjects}
\fi

%----------------------------------------------------------------------------------------
%	Table Formatting (Designed mainly for Skills Section)
%----------------------------------------------------------------------------------------
\newenvironment{rTable}{
  % To change style, just replace rTable1 with the other style
  \begin{rTable1}
}{
  \end{rTable1}
}

%----------------------------------------------------------------------------------------
% Implementation

% Default Table
\usepackage{longtable}

% Constants for all tables
\FPeval\arraystretch{1.6 * \decompress}
% y2 = 6ex, y1 = 2ex
% x2 = 0.7, x1 = 1
% y = 40/3x - 22/3
\FPeval\tabspace{(40/3) * \decompress - 22/3}

\newenvironment{rTable1}{
  \vspace{-\baselineskip}
  \begin{longtabu} to \textwidth {
      @{} >{\bfseries}l @{\extracolsep{\tabspace ex}}
      X[l]
  }
}{
  \end{longtabu}
  \vspace{-1.7\baselineskip}
}

% For 2023 LaTeX Compiler
\usepackage{tabu}
\newenvironment{rTable2}{
  \FPeval\arraystretch{1.6 * \decompress}
  \begin{tabular}{ @{} >{\bfseries}l  @{\extracolsep{\tabspace ex}} >{\raggedright\arraybackslash}p{0.850\linewidth}}
}{
  \end{tabular}
}

% For a special case table where it shouldn't be on multiple pages
\newenvironment{rTable3}{
  \def\arraystretch{1.6}
  \begin{longtabu} to \textwidth {
    @{} | >{\centering\arraybackslash}m{0.22\textwidth} | >{\centering\arraybackslash}m{0.22\textwidth} | >{\centering\arraybackslash}m{0.22\textwidth} | >{\centering\arraybackslash}m{0.22\textwidth} | @{}
    }
    \hline
    }{
    \hline
  \end{longtabu}
  \vspace*{
    -
    1.7
    \baselineskip}
}

%----------------------------------------------------------------------------------------
%	Recommendations Formatting
%----------------------------------------------------------------------------------------
\NewDocumentEnvironment{recommendation}{mmm}{
  % To change style, just replace recommendation1 with the other style
  \begin{recommendation1}{#1}{#2}{#3}
  \end{recommendation1}
}{}

% How to use
\iffalse
  \begin{recommendation}
    {Text}
    {Author}
    {Role}
  \end{recommendation}
\fi

%-----------------------------------------------------------------------------------------
% Implementation

% Implementation 1
\NewDocumentEnvironment{recommendation1}{mmm}{
  \textit{\textquotedblleft{#1}\textquotedblright}\\
  -\textbf{#2}, \textit{#3}
}{}


% Implementation 2
\usepackage{amsmath}
\usepackage{mdframed}
\NewDocumentEnvironment{recommendation2}{mmm}{
  \vspace{\baselineskip}
  \begin{siderules}
    \textit{\textquotedblleft{#1}\textquotedblright}
  \end{siderules}
  --\textbf{#2}, \textit{#3}
}{}

\newmdenv[
  topline=false,
  bottomline=false,
  rightline=false,
  skipabove=\topsep,
  skipbelow=\topsep
]{siderules}

%----------------------------------------------------------------------------------------
%	Publications Formatting
%----------------------------------------------------------------------------------------
\usepackage[numbers]{natbib} % numbers for numbering style

\newcommand{\rPublications}[1]{
  % For future, environment can be replaced with:
  % \sectionHeading{Publications} % Section title
  \begin{rSection}{Publications}
    \renewcommand{\refname}{\vspace{-1.25\baselineskip}} % Redefine \refname to suppress "References" and remove extra huge text line space
    \nocite{*}
    \bibliographystyle{unsrtnat}
    \bibliography{#1}
  \end{rSection}
}

% How to use:
\iffalse
  \rPublications{publications} % 'publications' is the name of a BibTeX file
\fi

\iffalse
  \NewDocumentEnvironment{publications}{}{
    \patchcmd{\thebibliography}{\section*{\refname}}{}{}{}
    \nocite{*}
    \bibliographystyle{unsrt}
    \bibliography{publications}    % 'publications' is the name of a BibTeX file
  }{}

  % How to use
  \begin{rSection}{Publications}
    \begin{publications}
    \end{publications}
  \end{rSection}
\fi

%----------------------------------------------------------------------------------------
% Implementations

% Documentation
% 1. Create a publications.bib file.
% 2. Use the following template to fill for eacch publication:
% @article{citationkey,
%   title={Title},
%   author={Author},
%   journal={Journal},
%   pages={123456},
%   year={2020},
%   publisher={Publisher Name}

% }

%----------------------------------------------------------------------------------------
%	Itemize Formatting
%----------------------------------------------------------------------------------------
% New rItemize to compress points if needed in the future
% 1 optional argument, Bullet pionts Heading, Don't use with {rProjects} as it handles heading differently and it should be merged with this.
\NewDocumentEnvironment{rItemize}{o}{
  \IfValueT{#1}{
    \textbf{#1}
  }
  \ifthenelse{\equal{\compress}{100}}
  {
    \begin{itemize}
      [
      leftmargin=0.16in, % Set the left margin to 0.16 inch
      align=left, % Align the text with the left edge
      labelsep=-8pt, % Space between bullet point and text
      itemindent=0pt, % No additional indentation for the item
      itemsep=0pt, % No additional space between items
      parsep=0pt, % No additional space between paragraphs within an item
      ]
  }
  {
    \begin{itemize}
  }
}{
      \raggedright
    \end{itemize}
}

% How to use:
\iffalse
  \begin{rItemize}
    \item Learns \& adapts fast.
  \end{rItemize}

  \begin{rItemize}[What he excels at:]
    \item Learns \& adapts fast.
  \end{rItemize}
\fi

%----------------------------------------------------------------------------------------
% rHItemize Formatting
%----------------------------------------------------------------------------------------
% This is not used at all because it is ugly but kept just in case
% It is better to use comma separated values.
% Some people might favor it because it displays items more clearer
\usepackage[inline]{enumitem}
\usepackage{multicol}

\newenvironment{rHItemize}{
  \begin{multicols}{4} % adjust the number for the number of columns you want
    \begin{itemize}
}{
    \end{itemize}
  \end{multicols}
}

\newcommand{\inlineitem}[1]{\item #1}

\iffalse
  % How to use:
  \begin{rHItemize}
    \inlineitem Item 1
    \inlineitem Item 2
    \inlineitem Item 3
    \inlineitem Item 4
    \inlineitem Item 5
    \inlineitem Item 6
    \inlineitem Item 7
    \inlineitem Item 8
    \inlineitem Item 9
  \end{rHItemize}
\fi

%----------------------------------------------------------------------------------------
%	Job Description Echo (for ATS)
%----------------------------------------------------------------------------------------
%  Untested and may cause harm
\usepackage{adjustbox}
\newcommand{\ATS}[1]{%
    \begingroup
    \color{white}
    \fontsize{1pt}{1pt}\selectfont
    \parskip=0pt
    \def\par{} % Escape new paragraph using new lines
    \begin{adjustbox}{minipage=\textwidth,scale=0.2} % Adjust the width and scale as needed
      \detokenize{#1} % Escape all special characters
    \end{adjustbox}
    \endgroup
}