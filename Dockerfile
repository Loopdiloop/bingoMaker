FROM ubuntu:18.04  
LABEL maintainer="marianne.bjoroen@avella.no"
WORKDIR /usr/local/

RUN  apt-get -y update && apt-get -y install texlive-latex-base
RUN apt-get -y install texlive-fonts-recommended 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install texlive-latex-extra
RUN apt-get -y install git


# Make folder and add the bingo-files
RUN cd /usr/local/
RUN git clone https://github.com/Loopdiloop/bingoMaker.git


RUN cd /usr/local/bingoMaker/
RUN pdflatex /usr/local/bingoMaker/bingotex/main.tex
RUN sleep 3
COPY bingomaker.html /usr/local/bingoMaker/index.html
EXPOSE 80
#CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

