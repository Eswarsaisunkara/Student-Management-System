<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ include file="tailwind.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Courses by Branch</title>
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

	<!-- Branch Selection Form -->
	<div class="container mx-auto px-4 py-8">
		<h1 class="text-3xl font-bold text-center text-blue-900 mb-8">Manage
			Courses by Branch</h1>
		<div class="max-w-lg mx-auto bg-white p-5 rounded shadow-md">
			<form method="GET">
				<div class="mb-4">
					<label for="branch" class="block text-gray-900 font-bold">Select
						Branch:</label> <select id="branch" name="branch"
						class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-1 focus:ring-blue-500">
						<option value="">-- Select Branch --</option>
						<option value="CSE">CSE</option>
						<option value="CSM">CSM</option>
						<option value="CSC">CSC</option>
						<option value="CDS">CDS</option>
						<option value="ECE">ECE</option>
						<option value="EEE">EEE</option>
						<option value="MECH">MECH</option>
					</select>
				</div>
				<button type="submit"
					class="w-full bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-700">Get
					Courses</button>
			</form>
		</div>

		<!-- Display Courses Based on Branch -->
		<%
		String branch = request.getParameter("branch");
		if (branch != null && !branch.isEmpty()) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/sms", "Eswar", "Eswar1412");
				PreparedStatement ps = con
				.prepareStatement("SELECT course_code, course_name, branch FROM courses WHERE branch = ?");
				ps.setString(1, branch);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
			int count = 0; // To alternate colors
		%>
		<div
			class="mt-8 grid grid-cols-1 gap-6 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-3 xl:grid-cols-3">
			<%
			do {
				String bgColor = (count % 2 == 0) ? "bg-sky-100" : "bg-lime-100"; // Alternate between sky and lime
				String textColor = (count % 2 == 0) ? "text-sky-500" : "text-lime-500"; // Alternate text colors as well
				String btnColor = (count % 2 == 0) ? "bg-sky-500" : "bg-lime-500";
				String btnhColor = (count % 2 == 0) ? "bg-sky-600" : "bg-lime-600";
				String borderColor = (count % 2 == 0) ? "border-sky-500" : "border-lime-500";
				String cardColor = (count % 2 == 0) ? "border-2 border-sky-500" : "border-2 border-lime-500";
				count++;
			%>
			<!-- Course Card -->
			<div class="<%=bgColor%> shadow-lg rounded-lg p-6 <%=cardColor%>">
				<div class="flex items-center">
					<div class="flex-shrink-0">
						<img src="assets/courses.jpg" alt="Course Image"
							class="w-32 h-32 border-2 <%=borderColor%> rounded-md">
					</div>
					<div class="ml-6">
						<h2 class="text-xl font-bold <%=textColor%>"><%=rs.getString("course_name")%></h2>
						<p class="text-gray-900 font-medium mt-2">Organize and manage
							the course details for students.</p>
						<div class="mt-4">
							<p class="text-gray-900 font-medium">
								Course Code:
								<%=rs.getString("course_code")%></p>
							<p class="text-gray-900 font-medium">
								Branch:
								<%=rs.getString("branch")%></p>
						</div>
						<div class="mt-4">
							<a href="#"
								class=" <%=btnColor%> hover:<%=btnhColor%> text-white px-4 py-2 rounded-lg">View
								Details</a>
						</div>
					</div>
				</div>
			</div>
			<%
			} while (rs.next());
			%>
		</div>
		<%
		} else {
		%>
		<div class="text-red-500 mt-4 text-center">
			No courses found for the
			<%=branch%>
			branch.
		</div>
		<%
		}
		con.close();
		} catch (Exception e) {
		out.println("Error: " + e.getMessage());
		}
		}
		%>
		
	</div>
	<div class=" mb-4 text-center">
		<a href="home.jsp" class="text-red-600 hover:underline"><button
				class="bg-red-600 text-white px-2 py-2 rounded-lg">Back to
				Home</button></a>
	</div>
</body>
</html>
