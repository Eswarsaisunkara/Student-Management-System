<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ include file="tailwind.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student List</title>
<style>
th {
	position: sticky;
	top: 0;
	background-color: #2d3748;
	z-index: 1;
}
</style>
</head>
<body class="bg-gray-100">
	<nav class="bg-gray-900 shadow-lg">
		<div
			class="container mx-auto px-4 py-4 flex justify-between items-center">
			<div class="text-2xl font-bold text-white">
				<a href="home.jsp">Student Management System</a>
			</div>
			<div>
				<a href="logout.jsp" class="text-white"> <svg
						xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 22 22"
						stroke-width="1.5" stroke="currentColor" class="size-10">
                        <path stroke-linecap="round"
							stroke-linejoin="round"
							d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9" />
                    </svg>Logout
				</a>
			</div>
		</div>
	</nav>
	<div class="container mx-auto mt-10 px-4">
		<div class="flex justify-center">
			<div class="w-full lg:w-10/12">
				<div class="bg-white shadow-md rounded-lg">
					<div class="bg-gray-800 text-white text-center py-4 rounded-t-lg">
						<h4 class="text-xl font-semibold">Student Details</h4>
					</div>
					<div class="p-6">
						<!-- Scrollable table body with fixed header -->
						<div class="overflow-y-auto max-h-96">
							<table class="min-w-full bg-white">
								<thead class="bg-gray-800 text-white">
									<tr>
										<th class="w-1/10 py-2">ID</th>
										<th class="w-3/10 py-2">Name of the Student</th>
										<th class="w-4/10 py-2">PIN Number</th>
										<th class="w-4/10 py-2">Email of the Student</th>
										<th class="w-1/10 py-2">Branch</th>
										<th class="w-1/10 py-2">Year</th>

									</tr>
								</thead>
								<tbody>
									<%
									try {
										Class.forName("com.mysql.cj.jdbc.Driver");
										Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/sms", "Eswar", "Eswar1412");
										String sql = "SELECT * FROM students";
										PreparedStatement pmst = conn.prepareStatement(sql);
										ResultSet rs = pmst.executeQuery();
										while (rs.next()) {
									%>
									<tr class="bg-gray-100 hover:bg-gray-200">
										<td
											class="py-2 px-1 border-b text-center font-medium border-gray-300"><%=rs.getInt("id")%></td>
										<td
											class="py-2 px-6 border-b text-center font-medium border-gray-300"><%=rs.getString("name")%></td>
										<td
											class="py-2 px-8 border-b text-center font-medium border-gray-300"><%=rs.getString("pin")%></td>
										<td
											class="py-2 px-8 border-b text-center font-medium border-gray-300"><%=rs.getString("email")%></td>
										<td
											class="py-2 px-1 border-b text-center font-medium border-gray-300"><%=rs.getString("branch")%></td>
										<td
											class="py-2 px-1 border-b text-center font-medium border-gray-300"><%=rs.getString("year")%></td>
									</tr>
									<%
									}
									} catch (Exception e) {
									e.printStackTrace();
									}
									%>
								</tbody>
							</table>
						</div>
						<div class="mt-4 text-center">
							<a href="home.jsp" class="text-red-600 hover:underline"><button
									class="bg-red-600 text-white px-2 py-2 rounded-lg">Back
									to Home</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
