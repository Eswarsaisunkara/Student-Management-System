<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ include file="tailwind.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management - Attendance, Fees, Report and Timetable</title>
    <style>
        .hidden { display: none; }
        .active-tab { background-color: #4F46E5; color: white; }
    </style>
</head>
<body class="bg-gray-100">
    <nav class="bg-gray-900 shadow-lg">
        <div class="container mx-auto px-4 py-4 flex justify-between items-center">
            <div class="text-2xl font-bold text-white"><a href="home.jsp">Student Management System</a></div>
            <div>
                <a href="logout.jsp" class="text-white">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 22 22" stroke-width="1.5" stroke="currentColor" class="size-10">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9" />
                    </svg>Logout
                </a>
            </div>
        </div>
    </nav>

    <!-- Tab Menu -->
    <div class="container mx-auto px-4 py-4">
        <div class="flex justify-center space-x-4">
            <button id="attendanceTab" class="px-4 py-2 font-semibold rounded active-bar" onclick="showSection('attendance')">Attendance</button>
            <button id="feesTab" class="px-4 py-2 font-semibold rounded" onclick="showSection('fees')">Fees</button>
        </div>
    </div>

    <!-- Attendance Section -->
    <div id="attendanceSection" class="hidden container mx-auto px-4 py-8">
        <h1 class="text-3xl font-bold text-center text-blue-900 mb-8">Attendance</h1>

        <!-- Student PIN Form -->
        <form method="GET" class="max-w-lg mx-auto bg-white p-5 rounded shadow-md">
            <div class="mb-4">
                <label for="pin" class="block text-gray-900 font-bold">Enter Student ID (PIN):</label>
                <input type="text" id="pin" name="pin" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-1 focus:ring-blue-500" required>
            </div>
            <button type="submit" class="w-full bg-sky-500 text-white px-4 py-2 rounded hover:bg-sky-700">Get Attendance</button>
        </form>

        <!-- Display Attendance -->
        <%
        String pin = request.getParameter("pin");
        if (pin != null && !pin.isEmpty()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/sms", "Eswar", "Eswar1412");
                PreparedStatement ps = con.prepareStatement(
                    "SELECT subject, total_classes, attended_classes, (attended_classes/total_classes)*100 AS attendance_percentage " +
                    "FROM attendance WHERE pin = ?"
                );
                ps.setString(1, pin);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
        %>
        <div class="mt-8 bg-violet-100 p-6 rounded-lg shadow-md">
            <h2 class="text-2xl font-bold text-lime-600 mb-4">Attendance Report for Student PIN: <%= pin %></h2>
            <table class="table-auto w-full border-collapse">
                <thead>
                    <tr class="bg-gray-900 text-white">
                        <th class="border-2 border-gray-900 px-4 py-2">Subject</th>
                        <th class="border-2 border-gray-900 px-4 py-2">Total Classes</th>
                        <th class="border-2 border-gray-900 px-4 py-2">Attended Classes</th>
                        <th class="border-2 border-gray-900 px-4 py-2">Attendance (%)</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    do {
                    %>
                    <tr>
                        <td class="border-2 border-lime-600 px-3 py-2 font-medium"><%= rs.getString("subject") %></td>
                        <td class="border-2 border-lime-600 px-3 py-2 font-medium text-center"><%= rs.getInt("total_classes") %></td>
                        <td class="border-2 border-lime-600 px-3 py-2 font-medium text-center"><%= rs.getInt("attended_classes") %></td>
                        <td class="border-2 border-lime-600 px-3 py-2 font-medium text-center"><%= rs.getFloat("attendance_percentage") %></td>
                    </tr>
                    <%
                    } while (rs.next());
                    %>
                </tbody>
            </table>
        </div>
        <%
                } else {
        %>
        <div class="text-red-500 mt-4 text-center">
            No attendance record found for Student ID: <%= pin %>.
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

    <!-- Fees Section -->
    <div id="feesSection" class="hidden container mx-auto px-4 py-8">
        <h1 class="text-3xl font-bold text-center text-blue-900 mb-8">Fees Status</h1>

        <!-- Student PIN Form -->
        <form method="GET" class="max-w-lg mx-auto bg-white p-5 rounded shadow-md">
            <div class="mb-4">
                <label for="pin" class="block text-gray-900 font-bold">Enter Student ID (PIN):</label>
                <input type="text" id="pin" name="pin" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-1 focus:ring-blue-500" required>
            </div>
            <button type="submit" class="w-full bg-sky-500 text-white px-4 py-2 rounded hover:bg-sky-700">Get Fees Status</button>
        </form>

        <!-- Display Fees -->
        <%
         pin = request.getParameter("pin");
        if (pin != null && !pin.isEmpty()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/sms", "Eswar", "Eswar1412");
                PreparedStatement ps = con.prepareStatement(
                    "SELECT total_fees, paid_fees, (paid_fees/total_fees)*100 AS payment_status " +
                    "FROM fees WHERE pin = ?"
                );
                ps.setString(1, pin);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
        %>
        <div class="mt-8 bg-blue-100 p-6 rounded-lg shadow-md">
            <h2 class="text-2xl font-bold text-blue-600 mb-4">Fees Status for Student PIN: <%= pin %></h2>
            <table class="table-auto w-full border-collapse">
                <thead>
                    <tr class="bg-gray-900 text-white">
                        <th class="border-2 border-gray-900 px-4 py-2">Total Fees</th>
                        <th class="border-2 border-gray-900 px-4 py-2">Paid Fees</th>
                        <th class="border-2 border-gray-900 px-4 py-2">Payment Status (%)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="border-2 border-blue-600 px-3 py-2 font-medium"><%= rs.getFloat("total_fees") %></td>
                        <td class="border-2 border-blue-600 px-3 py-2 font-medium"><%= rs.getFloat("paid_fees") %></td>
                        <td class="border-2 border-blue-600 px-3 py-2 font-medium text-center"><%= rs.getFloat("payment_status") %></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <%
                } else {
        %>
        <div class="text-red-500 mt-4 text-center">
            No fees record found for Student ID: <%= pin %>.
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
    <div class="mb-2 text-center">
		<a href="home.jsp" class="text-red-600 hover:underline"><button
				class="bg-red-600 text-white px-2 py-2 rounded-lg">Back to
				Home</button></a>
	</div>

    <script>
        function showSection(sectionId) {
            document.getElementById('attendanceSection').classList.add('hidden');
            document.getElementById('feesSection').classList.add('hidden');
            document.getElementById('attendanceTab').classList.remove('active-tab');
            document.getElementById('feesTab').classList.remove('active-tab');
            document.getElementById(sectionId + 'Section').classList.remove('hidden');
            document.getElementById(sectionId + 'Tab').classList.add('active-tab');
        }
        
        showSection("attendance");
    </script>
</body>
</html>
