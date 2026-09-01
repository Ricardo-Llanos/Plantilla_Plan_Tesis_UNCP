\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uncp-thesis}[2026/05/26 UNCP Plan de Tesis Template Advanced Class]

% --- CLASE BASE DE REPORTE ---
\LoadClass[11pt,oneside]{report}

% --- PAQUETES NATIVOS DE LA CLASE ---
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[spanish,es-tabla]{babel} % Idioma español y 'Tabla' en vez de 'Cuadro'
\RequirePackage{csquotes}
\RequirePackage{newtxtext,newtxmath}     % Configura Times New Roman real y moderno
\RequirePackage{graphicx}                % Soporte para el logo institucional
\RequirePackage{geometry}                % Gestión estricta de márgenes
\RequirePackage{setspace}                % Control del interlineado
\RequirePackage{fancyhdr}                % Numeración y paginación
\RequirePackage{float}                   % Posicionamiento estricto [H]
\RequirePackage{indentfirst}             % Fuerza sangría en el primer párrafo
\RequirePackage{ragged2e}                % Permite justificación homogénea
\RequirePackage{booktabs}                % Tablas profesionales
\RequirePackage{tabularx}                % Tablas con ancho flexible
\RequirePackage{array}                   % Extensiones de tabular
\RequirePackage{xltabular}               % Tablas que ocupan múltiples páginas
\RequirePackage{amsmath}                 % Matemáticas avanzadas
\RequirePackage[style=apa, backend=biber]{biblatex} % Estilo APA 7 para bibliografía
\RequirePackage{mfirstuc}                % Capitalización automática avanzada

% --- CONFIGURACIÓN DE MÁRGENES (3cm Izquierdo, 2cm los demás) ---
\geometry{
    a4paper,
    top=2cm,
    bottom=2cm,
    left=3cm,
    right=2cm,
    headheight=15pt,
    headsep=0.5cm
}

% --- ESPACIADO E INTERLINEADO BASE (1.5 general) ---
\onehalfspacing
\setlength{\parindent}{1.5cm} % Sangría reglamentaria
\setlength{\parskip}{0pt}     % Evita espacios extras entre párrafos

% --- JUSTIFICACIÓN AUTOMÁTICA AL INICIAR ---
\AtBeginDocument{\justifying}

% --- CARGAR PAQUETE DE ESTILOS PERSONALIZADOS ---
\RequirePackage{uncp-style}

% --- PAGINACIÓN INSTITUCIONAL (Esquina superior derecha) ---
\pagestyle{fancy}
\fancyhf{}
\rhead{\fontsize{10pt}{12pt}\selectfont\thepage}
\renewcommand{\headrulewidth}{0pt}

% Redefinimos el estilo 'plain' para que las hojas de inicio de capítulo no bajen el número
\fancypagestyle{plain}{
  \fancyhf{}
  \rhead{\fontsize{10pt}{12pt}\selectfont\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

% --- VARIABLES REQUERIDAS PARA LA CARÁTULA ---
\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\thesistitle}[1]{\def\@thesistitle{#1}}
\newcommand{\degree}[1]{\def\@degree{#1}}
\newcommand{\city}[1]{\def\@city{#1}}
\newcommand{\thesisyear}[1]{\def\@thesisyear{#1}}
\newcommand{\advisor}[1]{\def\@advisor{#1}}

% --- MANEJO DINÁMICO DE MÚLTIPLES AUTORES ---
\newcommand{\@authorslist}{}
\newcommand{\addauthor}[2]{%
  \gappto\@authorslist{%
    {\fontsize{14pt}{16pt}\selectfont \MakeUppercase{#1}, \capitalisewords{#2}\par}\vspace{0.2cm}%
  }%
}

% --- CARÁTULA OFICIAL: PLAN DE TESIS ---
\newcommand{\makethesistitle}{
    \begin{titlepage}
        \clearpage
        \thispagestyle{empty}
        \centering
        {\fontsize{22pt}{24pt}\selectfont\bfseries UNIVERSIDAD NACIONAL DEL CENTRO DEL PERÚ\par}
        \vspace{0.6cm}
        \includegraphics[width=0.28\textwidth]{src/imgs/logo_uncp.png}\\[0.8cm]
        {\fontsize{16pt}{18pt}\selectfont\bfseries FACULTAD DE \MakeUppercase{\@faculty}\par}
        \vspace{1.2cm}
        {\fontsize{14pt}{16pt}\selectfont\bfseries PLAN DE TESIS\par}
        \vspace{0.6cm}
        
        % TÍTULO ENTRE DOS BARRAS HORIZONTALES (Formato seguro sin saltos fantasmas)
        \rule{\textwidth}{1pt}\par\vspace{0.4cm}
        {\fontsize{14pt}{18pt}\selectfont\bfseries \MakeUppercase{\@thesistitle}\par}\vspace{0.4cm}
        \rule{\textwidth}{1pt}\par
        
        \vspace{1.5cm}
        {\fontsize{14pt}{16pt}\selectfont\bfseries PRESENTADO POR:\par}
        \vspace{0.3cm}
        
        % IMPRESIÓN DINÁMICA DE AUTORES
        \@authorslist

        \vspace{1.5cm}
        {\fontsize{14pt}{16pt}\selectfont\bfseries PARA OPTAR EL TÍTULO PROFESIONAL DE:\par}
        \vspace{0.3cm}
        {\fontsize{14pt}{16pt}\selectfont \MakeUppercase{\@degree}\par}
        \vfill
        {\fontsize{14pt}{16pt}\selectfont\bfseries \MakeUppercase{\@city} -- PERÚ\par}
        \vspace{0.2cm}
        {\fontsize{14pt}{16pt}\selectfont\bfseries \@thesisyear\par}
    \end{titlepage}
}
\endinput