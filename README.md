# Inception
Learning system administration through the use of Docker images

## Description
In this project, I learned to manipulate containers with Docker and Docker Compose.
Each of the containers I configured contains only one application, in order to keep a true seperate environment for each of them.
Here's what each of them does:
* A web server with NGinx
  NGinx, or a web server in general works this way:
  - The server waits/listens for a connexion/request, sent via a transport protocol (here I am using TLS)
  - The server treats the request (= what was requested? was it to access a file? was it a demand to post something? to access data?)
  - It then sends back an answer, based on the request of course
  Now on which port will the server listen? Or which transport protocol will it use? This il all defined in a configuration file, usually named something like default.conf
* A database with MariaDB
* 
