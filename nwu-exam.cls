%%
%% This is file `nwu-exam.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% nwu-exam.dtx  (with options: `class')
%% 
%% This is a generated file.
%% Copyright (C) 2025 by NWU-Exam Team
%% 
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\ProvidesExplClass{nwu-exam}{2025/06/01}{0.1}{NWU Exam Class}

\LoadClass[a4paper,11pt]{article}
\RequirePackage{geometry}
\RequirePackage[scheme=plain]{ctex}
\RequirePackage{eso-pic}
\RequirePackage{tikz}

\ExplSyntaxOff

\newcommand{\DrawSealedLine}{%
\AddToShipoutPictureBG{%
\begin{tikzpicture}[remember picture, overlay]
\tikzset{sealed/.style={dashed, color=black!60, line width=0.8pt}}
\tikzset{textstyle/.style={rotate=90, anchor=center, color=black}}

\draw[sealed] ([xshift=1.5cm]current page.south west) -- ([xshift=1.5cm]current page.north west);
\draw[sealed] ([xshift=1.8cm]current page.south west) -- ([xshift=1.8cm]current page.north west);

\node[textstyle] at ([xshift=1.65cm]current page.west) {
\zihao{4}\heiti\bfseries
\quad 密 \qquad 封 \qquad 线 \quad
};

\node[textstyle, anchor=east] at ([xshift=1.3cm, yshift=6cm]current page.west) {
\zihao{5}\songti 姓~~名：\underline{\makebox[3cm]{}}
};
\node[textstyle, anchor=east] at ([xshift=1.3cm, yshift=0cm]current page.west) {
\zihao{5}\songti 学~~号：\underline{\makebox[3cm]{}}
};
\node[textstyle, anchor=east] at ([xshift=1.3cm, yshift=-6cm]current page.west) {
\zihao{5}\songti 专~~业：\underline{\makebox[3cm]{}}
};

\node[rotate=90, anchor=west, font=\footnotesize] at ([xshift=1.2cm, yshift=-13cm]current page.west) {
(请考生在密封线内填写个人信息，密封线外作答无效)
};

\end{tikzpicture}%
}%
}

\AtBeginDocument{\DrawSealedLine}

\ExplSyntaxOn

\msg_new:nnn { nwu-exam } { welcome } { Engine~Online. }

\endinput
%%
%% End of file `nwu-exam.cls'.
