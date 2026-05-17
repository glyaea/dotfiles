\LoadClass[
  aspectratio=1610,
  notheorems,
  10pt
]{beamer}

\usepackage{algorithm}
\usepackage[noend]{algpseudocode}
\usepackage{amsthm}
\usepackage{helvet}
\usepackage{xcolor}

\definecolor{black}{HTML}{000000}
\definecolor{mit}{HTML}{750014}
\newcommand{\C}{\mathbb{C}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Z}{\mathbb{Z}}

\usecolortheme[named=black]{structure}
\useinnertheme{circles}
\useoutertheme[subsection=false]{smoothbars}
\renewcommand{\familydefault}{\sfdefault}
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{theorems}[numbered]
\setlength{\parindent}{0pt}
\theoremstyle{definition}
\newtheorem{definition}{\small\bfseries Definition}
\newtheorem{theorem}{\small\bfseries Theorem}
\theoremstyle{remark}
\newtheorem{remark}{\small\bfseries Remark}
