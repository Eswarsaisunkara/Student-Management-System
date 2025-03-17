package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    private Connection getConnection() throws SQLException {
        String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost:3307/sms";
        String DB_USER = "Eswar";
        String DB_PASSWORD = "Eswar1412";

        try {
            Class.forName(JDBC_DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dept = request.getParameter("dept");

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("INSERT INTO faculty (name, email, dept) VALUES (?, ?, ?)")) {

            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, dept);

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("login.jsp");
    }
}
