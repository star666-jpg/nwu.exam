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

\node[rotate=90, anchor=west, font=\footnotesize] at ([xshift=1.2cm, yshift=-13cm]current page.west) {
(请考生在密封线内填写个人信息，密封线外作答无效)
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
\par \noindent \hspace*{2em}
\makebox[2em][l]{\bfseries #1.}
\parbox[t]{ \linewidth - 4.5em } { #2 }
}
{
\makebox[#3][l]{
\hspace*{2em} \makebox[1.5em][l]{\bfseries #1.} #2
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
{
\str_case:nnF { #1 }
{ {T} { $\checkmark$ } {F} { $\times$ } }
{ #1 }
}
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

\par \vspace{1em} \noindent
\textbf{\thequestion .}~
\fp_compare:nNnTF { \l_nwu_current_points_fp } > { 0 }
{ \textbf{ ( \fp_to_decimal:N \l_nwu_current_points_fp ~ 分 ) } ~ }
{ }
\ignorespaces
}
{ \par }

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
\endinput
%%
%% End of file `nwu-exam.cls'.
