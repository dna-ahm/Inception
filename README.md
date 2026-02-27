# Inception
*Learning system administration through the use of Docker images*


A multi-container application that serves a website

## Description

### The containers
In this project, I learned to manipulate containers with Docker and Docker Compose.
Each of the containers I configured contains only one application, in order to keep a true separate environment for each of them.
Here's what each of them does:
* A web server with NGinx
  Nginx, or a web server in general works this way:
  - The server waits/listens for a connection/request, sent via a transport protocol (here I am using TLSv1.2 and TLSv1.3)
  - The server treats the request (= what was requested? was it to access a file? was it a demand to post something? to access data?)
  - It then sends back an answer, based on the request of course
  Now on which port will the server listen? Or which transport protocol will it use? This il all defined in a configuration file, usually named something like default.conf. This file determines how the server behaves.
* A database with MariaDB
  MariaDB is a database management system, it is an open-source version of mysql.
  A database stores data in tables, in the case of our application, it stores:
  - WordPress posts and comments
  - User accounts and passwords
  And in internal system tables, there is:
  - Users
  - Passwords and permissions
  - Privileges
  - Metadata
* Management of dynamic files with Wordpress
  Wordpress will deal with the whole 'logic' part of our webpages: a .html file for example is a static file, there is no logic or interaction needed to view it. It's just a 'visual' page.
  On the other hand, if we have a .php file (which we do on this website), it will need to be executed, because it's a program, it can interact with the user etc. So that is where Wordpress comes in, its an application that can:
  - Ask the database for posts
  - Check users/passwords
  - Build html pages
  In the case of this project, the dynamic PHP files are executed with FPM(FastCGI Process Manager).

### How they work together
Now how do all these applications work together, and how are they linked?
Here's the process:

<img width="1466" height="825" alt="DOCKER NETWORK-2" src="https://github.com/user-attachments/assets/7398ba23-da9a-4c91-8359-d4b022e39640" />

#### The link between the applications
A client/user wants to connect to our website, our web server (Nginx) will deal with the request. If the request demands a .php file (dynamic), it will send that request to our Wordpress container. The request might require some data from the database (like if the user wants to see a post), so Wordpress will have to ask the necessary data from MariaDB. Then, once it has executed the file, has all the data it needs, and has an .html response ready, Wordpress will send it back to Nginx, which will then send that as a response to the client.
Any communication between the web server and the client is in HTTPS(HyperText Transfer Protocol Secure), which is a secure version of HTTP, the protocol your browser uses to load web pages. The “S” means the connection is encrypted (by TLS).
#### How Docker Compose links them
Now is time to wonder, if each of these applications are in separate containers, how can they work and communicate with eachother?
Well that's where `docker-compose` comes in: it will link all the containers you ask it to together, thanks to a docker-compose file.
In it, you determine:
* Which containers you want to start
* On which containers do they depend
* Their volumes (a folder OUTSIDE of a container, that is connected to it)
* The network on which they communicate
So once you run `docker-compose`, all your container images are created, and all the containers can communicate together, how practical!

## Instructions
*How to launch and use this project*

### Requirements
* Docker >= 20.10
* Docker Compose >= 2.0
* Make

### Launching
1) Clone the repository:
`git clone https://github.com/yourname/inception.git && cd inception` ///modify
2) Create a .env file, copy the text below into it and fill it with your credentials:

`DB_NAME = `
   
  ` DB_ROOT_PASSWORD = `
   
  ` DB_USER = `
   
  ` DB_PASSWORD = `
   
  ` DB_ADMIN_USER = `
   
   `DB_ADMIN_PASSWORD = `
   
   `DOMAIN_NAME =`
   
  ` SITE_TITLE =`
   
   `DB_ADMIN_EMAIL =`
   
   `USER_LOGIN =`
   
   `USER_EMAIL =`
   
   `USER_PASSWORD =`

4) Build and start the containers:

   run `make all`





