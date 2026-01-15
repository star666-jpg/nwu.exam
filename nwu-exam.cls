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
\ProvidesExplClass{nwu-exam}{2025/06/01}{0.7}{NWU Exam Class Final}

\LoadClass[a4paper,11pt]{article}
\RequirePackage{geometry}
\RequirePackage[scheme=plain]{ctex}
\RequirePackage{eso-pic}
\RequirePackage{tikz}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath, amssymb}
\RequirePackage{array}
\RequirePackage{lastpage}
\RequirePackage{chngcntr} % 关键：用于大题重新计数

\geometry{left=2.5cm, right=2cm, top=2.5cm, bottom=3.0cm}

\ExplSyntaxOn

\tl_new:N \g_nwu_term_tl
\tl_new:N \g_nwu_subject_tl
\tl_new:N \g_nwu_paper_type_tl
\tl_new:N \g_nwu_department_tl
\tl_new:N \g_nwu_date_tl       % 新增：考试日期

\NewDocumentCommand{\SetTerm}{m}{ \tl_gset:Nn \g_nwu_term_tl {#1} }
\NewDocumentCommand{\SetSubject}{m}{ \tl_gset:Nn \g_nwu_subject_tl {#1} }
\NewDocumentCommand{\SetPaperType}{m}{ \tl_gset:Nn \g_nwu_paper_type_tl {#1} }
\NewDocumentCommand{\SetDept}{m}{ \tl_gset:Nn \g_nwu_department_tl {#1} }
\NewDocumentCommand{\SetDate}{m}{ \tl_gset:Nn \g_nwu_date_tl {#1} } % 设置日期接口

\SetTerm{2021 ---- 2022~学年第一学期}
\SetSubject{数学分析}
\SetPaperType{A}
\SetDept{数学学院}
\SetDate{\the\year 年\the\month 月\the\day 日} % 默认当天

\NewDocumentCommand{\MakePaperHeader}{ }{
\begin{center}
{ \zihao{2} \heiti \bfseries \g_nwu_term_tl } \\
\vspace{0.8cm}

\renewcommand{\arraystretch}{1.6}
\begin{tabular}{| p{2.5cm} | p{8cm} | p{1.5cm} | p{2cm} |}
\hline
\centering \textbf{考试科目} & \centering \g_nwu_subject_tl & \centering \textbf{总分} &  \\
\hline
\end{tabular}
\end{center}

\vspace{0.3cm}
\noindent \textbf{\underline{注意：答案一律写在答题纸上，否则无效！}}
\par \vspace{0.5cm}
}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}

\fancyfoot[C]{
\begin{tikzpicture}[remember~picture, overlay]
\node[yshift=1.5cm] at (current~page.south) {
\footnotesize
\renewcommand{\arraystretch}{1.3}
\begin{tabular}{|c|c|c|c|c|c|c|c|c|c|}
\hline
本卷为 & 团卷 & 本卷为 & \g_nwu_paper_type_tl ~卷 & 印数 & 220 & 出题院系 & \g_nwu_department_tl & 出题人 & \underline{\hspace{2em}} \\
\hline
\end{tabular}
};
\node[yshift=0.8cm] at (current~page.south) { \thepage \ / \pageref{LastPage} };
\end{tikzpicture}
}

\newcommand{\DrawSealedLine}{%
\AddToShipoutPictureBG{%
\begin{tikzpicture}[remember~picture, overlay]
\tikzset{sealed/.style={dashed, color=black!60, line~width=0.8pt}}
\tikzset{textstyle/.style={rotate=90, anchor=center, color=black}}

\draw[sealed] ([xshift=1.5cm]current~page.south~west) -- ([xshift=1.5cm]current~page.north~west);
\draw[sealed] ([xshift=1.8cm]current~page.south~west) -- ([xshift=1.8cm]current~page.north~west);

\node[textstyle] at ([xshift=1.65cm]current~page.west) {
\zihao{4}\heiti\bfseries \quad 密 \qquad 封 \qquad 线 \quad
};

\node[textstyle, anchor=east] at ([xshift=1.3cm, yshift=6cm]current~page.west) {
\zihao{5}\songti 姓~~名：\underline{\makebox[3cm]{}}
};
\node[textstyle, anchor=east] at ([xshift=1.3cm, yshift=0cm]current~page.west) {
\zihao{5}\songti 学~~号：\underline{\makebox[3cm]{}}
};
\node[textstyle, anchor=east] at ([xshift=1.3cm, yshift=-6cm]current~page.west) {
\zihao{5}\songti 专~~业：\underline{\makebox[3cm]{}}
};
\end{tikzpicture}%
}%
}
\AtBeginDocument{\DrawSealedLine}

\dim_new:N \l_nwu_choice_max_width_dim
\dim_new:N \l_nwu_line_width_dim
\box_new:N \l_nwu_choice_a_box
\box_new:N \l_nwu_choice_b_box
\box_new:N \l_nwu_choice_c_box
\box_new:N \l_nwu_choice_d_box

\cs_new_protected:Npn \__nwu_print_item:nnn #1#2#3 {
\dim_compare:nNnTF { #3 } = { 0pt }
{ \par \noindent \hspace*{2em} \makebox[2em][l]{\bfseries #1.} \parbox[t]{ \linewidth - 4.5em } { #2 } }
{ \makebox[#3][l]{ \hspace*{2em} \makebox[1.5em][l]{\bfseries #1.} #2 } }
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

\par \addvspace{0.5em} \noindent
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
\NewDocumentCommand{\xx}{ m m m m }{ \nwu_choices:nnnn {#1} {#2} {#3} {#4} }

\newcounter{question}
\newcounter{nwu_part_cnt}[question]
\fp_new:N \g_nwu_total_points_fp
\fp_new:N \l_nwu_current_points_fp
\seq_new:N \g_nwu_score_seq
\bool_new:N \g_nwu_show_answer_bool
\bool_set_false:N \g_nwu_show_answer_bool

\NewDocumentCommand{\fillin}{ O{} O{3cm} }
{
\underline{ \makebox[#2][c]{ \bool_if:NTF \g_nwu_show_answer_bool { \bfseries #1 } { } } }
\hspace{0.2em}
}

\NewDocumentCommand{\tf}{ O{} }{
\unskip \nobreak \dotfill
( ~ \makebox[1.5em][c]{
\bool_if:NTF \g_nwu_show_answer_bool
{ \str_case:nnF { #1 } { {T} { $\checkmark$ } {F} { $\times$ } } { #1 } }
{ }
} ~ )
}

\NewDocumentCommand{\sol}{ }{ \par \noindent \textbf{解：} }
\NewDocumentCommand{\zm}{ }{ \par \noindent \textbf{证明：} }

\NewDocumentEnvironment{question}{ O{0} }
{
\refstepcounter{question}
\fp_set:Nn \l_nwu_current_points_fp { #1 }
\fp_gadd:Nn \g_nwu_total_points_fp { \l_nwu_current_points_fp }

\fp_compare:nNnTF { \l_nwu_current_points_fp } > { 0 }
{ \seq_gput_right:Ne \g_nwu_score_seq { \fp_to_decimal:N \l_nwu_current_points_fp } }
{ \seq_gput_right:Nn \g_nwu_score_seq { - } }

\par \vspace{0.5em} \noindent
\textbf{\thequestion .}~
\ignorespaces
}
{ \par \vspace{0.5em} }

\NewDocumentCommand{\qpart}{ O{0} }
{
\stepcounter{nwu_part_cnt}
\par \vspace{0.3em} \hspace{2em}
(\alph{nwu_part_cnt})~
\fp_set:Nn \l_tmpa_fp { #1 }
\fp_compare:nNnTF { \l_tmpa_fp } > { 0 }
{
\textbf{ ( \fp_to_decimal:N \l_tmpa_fp ~ 分 ) } ~
\fp_gadd:Nn \g_nwu_total_points_fp { \l_tmpa_fp }
}
{ }
}

\NewDocumentCommand{\MakeGradingTable}{ }{
\par \vspace{2em}
\begin{center}
\renewcommand{\arraystretch}{1.5}
\setlength{\tabcolsep}{10pt}
\begin{tabular}{ | c | *{\seq_count:N \g_nwu_score_seq}{c|} c | }
\hline
\textbf{题号}
\int_step_inline:nn { \seq_count:N \g_nwu_score_seq } { & \textbf{##1} }
& \textbf{总分} \\
\hline
\textbf{分值}
\seq_map_inline:Nn \g_nwu_score_seq { & ##1 }
& \fp_to_decimal:N \g_nwu_total_points_fp \\
\hline
\textbf{得分}
\int_step_inline:nn { \seq_count:N \g_nwu_score_seq } { & }
& \\
\hline
\end{tabular}
\end{center}
}

\ExplSyntaxOff

\ctexset{
section = {
number = \chinese{section},
format = \zihao{4}\bfseries\heiti,
name = { ,、},
aftername = {},
indent = 0pt,
beforeskip = 1ex,
afterskip = 1ex
}
}

\counterwithin*{question}{section}

\endinput
%%
%% End of file `nwu-exam.cls'.
