# FastAPI MySQL Blog API

This is a simple RESTful API for managing blog articles and user authentication, built with **FastAPI** and **SQLModel**. It connects to a MySQL database for storing user and article data.

## Features

- **User Authentication**:
  - Login using username and password via OAuth2 with a Bearer token.
  - Role-based access control (`admin` and `user` roles).

- **Article Management**:
  - Create, retrieve, update, delete, and list articles.
  - Articles are linked to their authors.
  - Access control ensures users can only view/edit their own articles unless they are an admin.

- **Database Integration**:
  - Uses MySQL as the database backend.
  - Integrates SQLModel for ORM and schema definition.

- **Endpoints**:
  - User login
  - CRUD operations for articles
  - Endpoint to fetch the logged-in user's details

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
   ```
2. Create a virtual environment and install dependencies:
  ```python
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
  ```
3. Create a .env file in the root directory and add the following environment variables:
  ```python
    MYSQL_USER=<your-mysql-username>
    MYSQL_PASSWORD=<your-mysql-password>
    MYSQL_DATABASE=<your-database-name>
    MYSQL_PORT=3306
  ```
4. Set up the mysql database in Docker and check its status:
   3.1 Build the docker-compose.yml file with all specifiy the config for docker
   3.2 Start the docker:
   ```bash
    docker compose up -d" to start the docker
   ```
   4.3 Check the status of the running docker 
   ```bash
   docker compose ps
   ```
   4.4 If there is any error, check the logs
   ```bash
   docker compose logs db
   ```
   4.5 Login the mysql instance in docoker:
   ```bash
	 docker exec -it myblog -uroot -p$MYSQL_ROOT_PASSWORD
   ```
   4.6 If you need to restart mysql from scratch
   ```bash
   docker compose down
   rm -rf dbdata  # To remove the instance-related data dump outside the container
   docker compose up
   ```
   *"Docker compose up" = "docker compose create" & "docker compose start"
   4.7 Insert the data into the myblog db:
   ```bash
   docker exec -it myblog-mysql bash
   mysql -uroot -p$MYSQL_ROOT_PASSWORD myblog < /setup.sql
5. Run the application
   5.1 Start the FastAPI development server:
   ```bash
   fastapi dev main.py
   ```
   5.2 Access the API documentation:
   In the browser, open the url: http://127.0.0.1:8000/docs, then you can simulate different endpoints defined in the main.py and troubleshooting.




   

