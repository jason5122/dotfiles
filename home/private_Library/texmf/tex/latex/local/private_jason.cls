\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jason}[2022/09/14 Jason's homework template]
\LoadClass{article}

\RequirePackage[margin=1in]{geometry}
% Load pagella first, then mathpazo
% \RequirePackage{tgpagella}
% Note that "osf" includes real small caps, so no sc option needed
% \RequirePackage[osf]{mathpazo}
\linespread{1.069} % Palatino needs more space between lines
% \RequirePackage[doublespacing]{setspace}
\RequirePackage[T1]{fontenc}
% use AMS bold letters instead of Palatino's
% https://tex.stackexchange.com/a/22044/230326
\AtBeginDocument{
  \DeclareSymbolFont{AMSb}{U}{msb}{m}{n}
  \DeclareSymbolFontAlphabet{\mathbb}{AMSb}}
% Fall back to Pagella for bold small caps. This needs to be done late.
% \AtBeginDocument{%
%   \DeclareFontShape{T1}{pplj}{b}{sc}{<-> ec-qplb-sc}{}
%   \DeclareFontShape{T1}{pplj}{bx}{sc}{<->ssub * qpl/b/sc}{}
% }
\RequirePackage{mathtools}
% \RequirePackage[md]{titlesec}
\RequirePackage{enumerate}
\RequirePackage{amsmath}
% Header
\RequirePackage{fancyhdr}
% \pagestyle{fancy}

\usepackage{graphicx}

\usepackage{array}   % for \newcolumntype macro
\newcolumntype{C}{>{$}c<{$}} % math-mode version of "c" column type
\newcolumntype{L}{>{$}l<{$}} % math-mode version of "l" column type

\usepackage{indentfirst}
