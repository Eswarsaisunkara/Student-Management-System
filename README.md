# 🎓 Student Management System

A web-based Student Management System developed using Java Servlets, JSP, and JDBC. The application helps educational institutions manage student records, attendance, courses, reports, and extracurricular activities through a centralized dashboard.

## 🚀 Features

* Student Registration & Management
* User Login & Signup Authentication
* Student Attendance Tracking
* Course Management
* Student Performance Reports
* Extracurricular Activities Management
* Session-Based Authentication
* Dynamic JSP Pages
* JDBC Database Connectivity

## 🛠️ Tech Stack

### Backend

* Java
* Java Servlets
* JDBC

### Frontend

* JSP
* HTML
* CSS
* Tailwind CSS

### Database

* MySQL

### Server

* Apache Tomcat

## 📁 Project Structure

```text
Student-Management-System/
│
├── java/
│   ├── model/
│   │   └── Student.java
│   │
│   └── servlet/
│       ├── LoginServlet.java
│       ├── SignupServlet.java
│       └── AddStudentServlet.java
│
├── webapp/
│   ├── WEB-INF/
│   │   └── web.xml
│   │
│   ├── assets/
│   ├── login.jsp
│   ├── signup.jsp
│   ├── home.jsp
│   ├── addStudent.jsp
│   ├── viewStudents.jsp
│   ├── attendancefees.jsp
│   ├── manageCourses.jsp
│   ├── extracurricular.jsp
│   ├── studentReport.jsp
│   └── logout.jsp
│
└── README.md
```

## ⚙️ Run Locally

### Prerequisites

* Java 8+
* Apache Tomcat 9+
* MySQL
* Eclipse IDE (Enterprise Edition recommended)

### Clone Repository

```bash
git clone https://github.com/Eswarsaisunkara/Student-Management-System.git
```

### Configure Database

1. Create a MySQL database.
2. Update database credentials in the JDBC connection file.
3. Import the required tables.

### Deploy on Tomcat

1. Import the project into Eclipse.
2. Configure Apache Tomcat Server.
3. Add the project to the server.
4. Start Tomcat.

### Access Application

```text
http://localhost:8080/Student-Management-System
```

## 📌 Modules

### Authentication

* User Registration
* User Login
* Session Management
* Logout Functionality

### Student Management

* Add Student
* View Students
* Update Student Information
* Manage Records

### Academic Management

* Course Management
* Attendance Tracking
* Student Reports

### Activities

* Extracurricular Activity Management

## 🎯 Learning Outcomes

This project demonstrates:

* MVC Architecture Basics
* Java Servlet Development
* JSP Page Integration
* JDBC Database Operations
* Session Handling
* CRUD Operations
* Web Application Deployment using Tomcat

## 👨‍💻 Author

**Sunkara Eswar Sai Ravi Chandu**

* GitHub: https://github.com/Eswarsaisunkara
