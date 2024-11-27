---
header-includes:
- |
  ```{=latex}
  \usepackage{awesomebox}
  \definecolor{primaryowlorange}{rgb}{0.96,0.5,0.12}
  \definecolor{primaryowlblue}{rgb}{0.16,0.35,0.68}
  \definecolor{primaryowlyellow}{rgb}{0.99,0.87,0.02}
  \definecolor{primaryowlblack}{rgb}{0.14,0.12,0.13}
  \definecolor{secundaryowlblue}{rgb}{0.29,0.77,0.9}
  \definecolor{secundaryowlgreen}{rgb}{0.63,0.83,0.29}
  \definecolor{secundaryowlgray}{rgb}{0.57,0.56,0.56}
  \definecolor{secundaryowlmagenta}{rgb}{0.57,0.06,0.33}
  \usepackage{tcolorbox}
  \usepackage{tabularx}
  \usepackage{float}
  \newtcolorbox{info-box}{colback=secundaryowlblue!5!white,arc=0pt,outer arc=0pt,colframe=secundaryowlblue!60!black}
  \newtcolorbox{warning-box}{colback=orange!5!white,arc=0pt,outer arc=0pt,colframe=orange!80!black}
  \newtcolorbox{error-box}{colback=red!5!white,arc=0pt,outer arc=0pt,colframe=red!75!black}

  \newcommand{\bookTitle}{Data Science Workflow Management}
  \newcommand{\bookPDFTitle}{Data Science Workflow Management}
  \newcommand{\bookAuthor}{Ibon Mart\'inez-Arranz}
  \newcommand{\bookSubject}{Data Science}
  \newcommand{\bookProducer}{Ibon Mart\'inez-Arranz}
  \newcommand{\bookCreator}{Ibon Mart\'inez-Arranz}
  \newcommand{\bookKeywords}{Data Science,Machine Learning,Python,matplotlib,pandas,numpy,scipy,jupyter}

  \hypersetup{
      breaklinks=true,
      bookmarks=true,
      pdftitle={\bookPDFTitle},
      pdfauthor={\bookAuthor},
      pdfsubject={\bookSubject},
      pdfproducer={\bookProducer},
      pdfcreator={\bookCreator},
      pdfkeywords={\bookKeywords},
      pdftoolbar=true, % show or hide Acrobat’s toolbar
      pdfmenubar=true, % show or hide Acrobat’s menu
      pdffitwindow=true, % resize document window to fit document size
      pdfstartview={FitH}, % fit the width of the page to the window (,{FitV})
      bookmarksopen=true,
      pdfborder={0 0 0}
  }

  ```
pandoc-latex-environment:
  noteblock: [note]
  tipblock: [tip]
  warningblock: [warning]
  cautionblock: [caution]
  importantblock: [important]
  tcolorbox: [box]
  info-box: [info]
  warning-box: [warning]
  error-box: [error]
---

# Essential Guide to SQLite: Harnessing the Power of Data Analysis
