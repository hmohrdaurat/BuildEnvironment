FROM ubuntu:latest
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -yy git curl latexmk emacs cm-super texlive-latex-extra texlive-science 
RUN DEBIAN_FRONTEND=noninteractive apt upgrade -yy
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -yy python3-pygments make qpdf gnuplot texlive-font-utils texlive-extra-utils
