FROM ubuntu:18.04  
LABEL maintainer="marianne.bjoroen@avella.no"
WORKDIR /usr/local/
RUN  apt-get -y update && apt-get -y install texlive-latex-base
RUN apt-get -y install texlive-fonts-recommended 
#&& apt-get -y install texlive-fonts-extra 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install texlive-latex-extra


# Make folder and add the bingo-files
RUN mkdir /usr/local/bingo
ADD bingotex/main.tex /usr/local/bingo/main.tex
ADD bingotex/generate_board.tex /usr/local/bingo/generate_board.tex
#ADD bingotex/picture.png /usr/local/bingo/picture.png
#ADD autobingo.sh /usr/local/bingo/autobingo.sh

# Run autobingo
#RUN cd /usr/local/bingo/
#RUN ./autobingo.sh

RUN cd /usr/local/bingo/
RUN pdflatex /usr/local/bingo/main.tex
RUN sleep 3
COPY bingomaker.html /usr/local/index.html
EXPOSE 80
#CMD ["/usr/sbin/nginx", "-g", "daemon off;"]

