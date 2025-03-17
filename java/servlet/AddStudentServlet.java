package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String pin = request.getParameter("pin");
		String email = request.getParameter("email");
		String branch = request.getParameter("branch");
		String year = request.getParameter("year");
		try {
			String dbDriver = "com.mysql.cj.jdbc.Driver";
	        String dbURL = "jdbc:mysql://localhost:3307/sms";
	        String dbUsername = "Eswar";  
	        String dbPassword = "Eswar1412";

	        Class.forName(dbDriver);
			Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
			String sql = "INSERT INTO students (name,pin,email,branch,year) VALUES (?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, pin);
			ps.setString(3, email);
			ps.setString(4, branch);
			ps.setString(5, year);
			ps.executeUpdate();
			ps.close();
			conn.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			
		}

		response.sendRedirect("home.jsp");
	}
}
