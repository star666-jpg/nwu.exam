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
\zihao{4}\heiti\bfseries \quad 密 \qquad 封 \qquad 线 \quad
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
\end{tikzpicture}%
}%
}
\AtBeginDocument{\DrawSealedLine}
\ExplSyntaxOn
\msg_new:nnn { nwu-exam } { welcome } { Engine~Online. }

\dim_new:N \l_nwu_choice_max_width_dim
\dim_new:N \l_nwu_line_width_dim
\box_new:N \l_nwu_choice_a_box
\box_new:N \l_nwu_choice_b_box
\box_new:N \l_nwu_choice_c_box
\box_new:N \l_nwu_choice_d_box

\cs_new_protected:Npn \__nwu_print_item:nnn #1#2#3 {
\dim_compare:nNnTF { #3 } = { 0pt }
{
\par
\noindent
\hspace*{2em} % 整体左缩进，对齐中文段落
\makebox[2em][l]{\bfseries #1.}
\parbox[t]{ \linewidth - 4.5em } { #2 }
}
{
\makebox[#3][l]{
\hspace*{2em} % 整体左缩进
\makebox[1.5em][l]{\bfseries #1.} #2
}
}
}

\cs_new_protected:Npn \nwu_choices:nnnn #1#2#3#4 {
\hbox_set:Nn \l_nwu_choice_a_box { #1 }
\hbox_set:Nn \l_nwu_choice_b_box { #2 }
\hbox_set:Nn \l_nwu_choice_c_box { #3 }
\hbox_set:Nn \l_nwu_choice_d_box { #4 }

\dim_set:Nn \l_nwu_choice_max_width_dim { 0pt }
\dim_set:Nn \l_nwu_choice_max_width_dim { \dim_max:nn { \l_nwu_choice_max_width_dim } { \box_wd:N \l_nwu_choice_a_box } }
\dim_set:Nn \l_nwu_choice_max_width_dim { \dim_max:nn { \l_nwu_choice_max_width_dim } { \box_wd:N \l_nwu_choice_b_box } }
\dim_set:Nn \l_nwu_choice_max_width_dim { \dim_max:nn { \l_nwu_choice_max_width_dim } { \box_wd:N \l_nwu_choice_c_box } }
\dim_set:Nn \l_nwu_choice_max_width_dim { \dim_max:nn { \l_nwu_choice_max_width_dim } { \box_wd:N \l_nwu_choice_d_box } }

\dim_add:Nn \l_nwu_choice_max_width_dim { 4em }

\dim_set:Nn \l_nwu_line_width_dim { \linewidth }

\par \addvspace{0.5em} % 增加题干与选项的间距
\noindent
\dim_compare:nNnTF { 4 \l_nwu_choice_max_width_dim } < { \l_nwu_line_width_dim }
{
\__nwu_print_item:nnn {A} {#1} {0.25\linewidth}
\__nwu_print_item:nnn {B} {#2} {0.25\linewidth}
\__nwu_print_item:nnn {C} {#3} {0.25\linewidth}
\__nwu_print_item:nnn {D} {#4} {0.25\linewidth}
}
{
\dim_compare:nNnTF { 2 \l_nwu_choice_max_width_dim } < { \l_nwu_line_width_dim }
{
\__nwu_print_item:nnn {A} {#1} {0.5\linewidth}
\__nwu_print_item:nnn {B} {#2} {0.5\linewidth} \\ \vspace{0.3em}
\__nwu_print_item:nnn {A} {#3} {0.5\linewidth} % 注意: 这里应该是C
\__nwu_print_item:nnn {B} {#4} {0.5\linewidth} % 注意: 这里应该是D
}
{
\__nwu_print_item:nnn {A} {#1} {0pt}
\__nwu_print_item:nnn {B} {#2} {0pt}
\__nwu_print_item:nnn {C} {#3} {0pt}
\__nwu_print_item:nnn {D} {#4} {0pt}
}
}
\par \addvspace{0.5em}
}

\cs_set_protected:Npn \nwu_choices:nnnn #1#2#3#4 {
\hbox_set:Nn \l_nwu_choice_a_box { #1 }
\hbox_set:Nn \l_nwu_choice_b_box { #2 }
\hbox_set:Nn \l_nwu_choice_c_box { #3 }
\hbox_set:Nn \l_nwu_choice_d_box { #4 }
\dim_set:Nn \l_nwu_choice_max_width_dim { 0pt }
\dim_set:Nn \l_nwu_choice_max_width_dim { \dim_max:nn { \l_nwu_choice_max_width_dim } { \box_wd:N \l_nwu_choice_a_box } }
\dim_set:Nn \l_nwu_choice_max_width_dim { \dim_max:nn { \l_nwu_choice_max_width_dim } { \box_wd:N \l_nwu_choice_b_box } }
\dim_set:Nn \l_nwu_choice_max_width_dim { \dim_max:nn { \l_nwu_choice_max_width_dim } { \box_wd:N \l_nwu_choice_c_box } }
\dim_set:Nn \l_nwu_choice_max_width_dim { \dim_max:nn { \l_nwu_choice_max_width_dim } { \box_wd:N \l_nwu_choice_d_box } }
\dim_add:Nn \l_nwu_choice_max_width_dim { 4em }
\dim_set:Nn \l_nwu_line_width_dim { \linewidth }

\par \addvspace{0.5em}
\noindent
\dim_compare:nNnTF { 4 \l_nwu_choice_max_width_dim } < { \l_nwu_line_width_dim }
{
\__nwu_print_item:nnn {A} {#1} {0.25\linewidth}
\__nwu_print_item:nnn {B} {#2} {0.25\linewidth}
\__nwu_print_item:nnn {C} {#3} {0.25\linewidth}
\__nwu_print_item:nnn {D} {#4} {0.25\linewidth}
}
{
\dim_compare:nNnTF { 2 \l_nwu_choice_max_width_dim } < { \l_nwu_line_width_dim }
{
\__nwu_print_item:nnn {A} {#1} {0.5\linewidth}
\__nwu_print_item:nnn {B} {#2} {0.5\linewidth} \\ \vspace{0.3em}
\__nwu_print_item:nnn {C} {#3} {0.5\linewidth}
\__nwu_print_item:nnn {D} {#4} {0.5\linewidth}
}
{
\__nwu_print_item:nnn {A} {#1} {0pt}
\__nwu_print_item:nnn {B} {#2} {0pt}
\__nwu_print_item:nnn {C} {#3} {0pt}
\__nwu_print_item:nnn {D} {#4} {0pt}
}
}
\par \addvspace{0.5em}
}

\NewDocumentCommand{\xx}{ m m m m }{
\nwu_choices:nnnn {#1} {#2} {#3} {#4}
}% =======================================================

\newcounter{question}
\newcounter{nwu_part_cnt}[question] % 让小题号随大题自动重置

\fp_new:N \g_nwu_total_points_fp
\fp_new:N \l_nwu_current_points_fp

\NewDocumentEnvironment{question}{ O{0} }
{
\refstepcounter{question}

\fp_set:Nn \l_nwu_current_points_fp { #1 }
\fp_gadd:Nn \g_nwu_total_points_fp { \l_nwu_current_points_fp }

\par \vspace{1em} % 题间距
\noindent
\textbf{\thequestion .}~

\fp_compare:nNnTF { \l_nwu_current_points_fp } > { 0 }
{ \textbf{ ( \fp_to_decimal:N \l_nwu_current_points_fp ~ 分 ) } ~ }
{ }

\ignorespaces
}
{
\par
}

\NewDocumentCommand{\qpart}{ }{
\stepcounter{nwu_part_cnt}
\par \vspace{0.3em}
\hspace{2em}
(\alph{nwu_part_cnt})~
}

\NewDocumentCommand{\ShowTotalScore}{ }{
\par \vspace{1em} \noindent
\fbox{ \bfseries 当前试卷总分：\fp_to_decimal:N \g_nwu_total_points_fp }
}
\endinput
%%
%% End of file `nwu-exam.cls'.
