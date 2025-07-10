# Virtual Kaskha

**Virtual Kaskha** is a dynamic web application built using core web technologies and Java backend. The project demonstrates full-stack development using Servlet and JSP with MySQL database integration. It offers a clean, responsive user interface and smooth functionality for a seamless experience.

## 🚀 Features

- 🎨 Clean and modern UI using Bootstrap
- 🗃️ Data storage with MySQL database
- 🔁 Full CRUD operations (Create, Read, Update, Delete)
- 🌐 JSP and Servlets-based backend logic
- ⚡ Responsive design for all screen sizes
- 🔐 Secure form handling and input validation

## 🛠️ Tech Stack

- **Frontend:** HTML, CSS, JavaScript, Bootstrap
- **Backend:** Java Servlet, JSP
- **Database:** MySQL
- **Tools:** Apache Tomcat, VS Code / Eclipse, Git

## 📂 Project Structure

VirtualKaskha/
├── WebContent/
│ ├── index.jsp
│ ├── login.jsp
│ ├── dashboard.jsp
│ └── assets/
│ └── css, js, images
├── src/
│ └── com.virtualkaskha.servlets/
│ └── *.java
├── WEB-INF/
│ ├── web.xml
├── README.md




## 💻 How to Run Locally

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/virtual-kaskha.git

2. **Import into IDE**  
   Open **Eclipse** or **IntelliJ IDEA** and import the project as a **Dynamic Web Project**.

3. **Configure Apache Tomcat**  
   - Download and install [Apache Tomcat](https://tomcat.apache.org/).
   - In your IDE, go to **Server settings** and configure Tomcat.
   - Set the Tomcat server runtime environment for the project.
4. **Set up the MySQL Database**
   - Open MySQL Workbench or phpMyAdmin.
   - Run the following command to create the database:
     ```sql
     CREATE DATABASE virtualkaskha;
     ```
   - Import the tables if you have an `.sql` file, or manually create tables as needed.
5. **Update Database Configuration**
   - Go to your `DBConnection.java` or wherever you have the JDBC connection.
   - Update your MySQL credentials:
     ```java
     String url = "jdbc:mysql://localhost:3306/virtualkaskha";
     String username = "your_mysql_username";
     String password = "your_mysql_password";
     ```
6. **Build and Run the Project**
   - Right-click on the project > **Run on Server**.
   - Make sure Apache Tomcat is selected.
   - Once deployed, open your browser and go to:
     ```
     http://localhost:8080/VirtualKaskha/
     ```
7. **You're all set! 🎉**

