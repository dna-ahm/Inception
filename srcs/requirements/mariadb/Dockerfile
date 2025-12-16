FROM debian:bookworm

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
RUN rm -rf /var/lib/apt/lists/*


COPY tools/script.sh /usr/local/bin

RUN chmod +x /usr/local/bin/script.sh

#port on which MariaDB listens
EXPOSE 3306

CMD ["/usr/local/bin/script.sh"]
