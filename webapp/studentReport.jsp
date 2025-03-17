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
    <title>Student Management - Reports and Timetable</title>
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
            <button id="reportTab" class="px-4 py-2 font-semibold rounded active-tab" onclick="showSection('report')">Student Report</button>
            <button id="timeTableTab" class="px-4 py-2 font-semibold rounded" onclick="showSection('timeTable')">Time Table</button>
        </div>
    </div>

    <!-- Student Report Section -->
    <div id="reportSection" class="container mx-auto px-4 py-8">
        <h1 class="text-3xl font-bold text-center text-blue-900 mb-8">Student Report</h1>

        <!-- Student PIN Form -->
        <form method="GET" class="max-w-lg mx-auto bg-white p-5 rounded shadow-md">
            <div class="mb-4">
                <label for="pin" class="block text-gray-900 font-bold">Enter Student ID (PIN):</label>
                <input type="text" id="pin" name="pin" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-1 focus:ring-blue-500" required>
            </div>
            <button type="submit" class="w-full bg-sky-500 text-white px-4 py-2 rounded hover:bg-sky-700">Get Report</button>
        </form>

        <!-- Display Student Report -->
        <%
        String pin = request.getParameter("pin");
        if (pin != null && !pin.isEmpty()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/sms", "Eswar", "Eswar1412");
                PreparedStatement ps = con.prepareStatement(
                		"SELECT students.name, students.email, students.branch, student_reports.subject, student_reports.marks, student_reports.grade " +
                        "FROM students " +
                        "JOIN student_reports ON students.pin = student_reports.pin " +
                        "WHERE students.pin = ?"
                        );
                ps.setString(1, pin);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
        %>
        <div class="mt-8 bg-violet-100 p-6 rounded-lg shadow-md">
            <h2 class="text-2xl font-bold text-lime-500 mb-4">Report of <%= rs.getString("name") %></h2>
            <p class="text-1xl"><strong>Name:</strong> <%= rs.getString("name") %></p>
            <p class="text-1xl"><strong>Email:</strong> <%= pin %></p>
            <p class="text-1xl"><strong>Branch:</strong> <%= rs.getString("branch") %></p>
            <p class="text-1xl"><strong>Email:</strong> <%= rs.getString("email") %></p>

            <!-- Student Report Table -->
            <h3 class="text-xl font-bold mt-6 mb-2">Subject-wise Marks</h3>
            <table class="table-auto w-full border-collapse">
                <thead>
                    <tr class="bg-gray-900 text-white">
                        <th class="border-2 border-gray-900 px-4 py-2">Subject</th>
                        <th class="border-2 border-gray-900 px-4 py-2">Marks</th>
                        <th class="border-2 border-gray-900 px-4 py-2">Grade</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    do { 
                    %>
                    <tr>
                        <td class="border-2 border-lime-600 px-3 py-2 font-medium"><%= rs.getString("subject") %></td>
                        <td class="border-2 border-lime-600 px-3 py-2 font-medium text-center"><%= rs.getInt("marks") %></td>
                        <td class="border-2 border-lime-600 px-3 py-2 font-medium text-center"><%= rs.getString("grade") %></td>
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
            No report found for Student ID: <%= pin %>.
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

    <!-- Time Table Section -->
    <div id="timeTableSection" class="hidden container mx-auto px-4 py-8">
        <h1 class="text-3xl font-bold text-center text-blue-900 mb-8">Class Time Table</h1>
        <div class="max-w-lg mx-auto bg-white p-5 rounded shadow-md">
            <form method="GET">
                <div class="mb-4">
                    <label for="branch" class="block text-gray-900 font-bold">Select Branch:</label>
                    <select id="branch" name="branch" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-1 focus:ring-blue-500">
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
                <button type="submit" class="w-full bg-sky-500 text-white px-4 py-2 rounded hover:bg-sky-700">Get Time Table</button>
            </form>
        </div>

        <!-- Display Timetable -->
        <%
        String branch = request.getParameter("branch");
        if (branch != null && !branch.isEmpty()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/sms", "Eswar", "Eswar1412");
                PreparedStatement ps = con.prepareStatement("SELECT * FROM class_timetable WHERE branch=?");
                ps.setString(1, branch);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
        %>
        <div class="mt-8 bg-gray-100 p-6 rounded-lg">
            <h2 class="text-2xl font-bold text-gray-800 mb-4">Time Table for <%= branch %> Branch</h2>
            <table class="table-auto w-full border-collapse">
                <thead>
                    <tr class="bg-gray-300">
                        <th class="border bg-gray-800 text-white px-4 py-2">Day</th> 
                        <th class="border bg-gray-800 text-white px-4 py-2">09 AM - 10AM</th>
                        <th class="border bg-gray-800 text-white px-4 py-2">10 AM - 11AM</th>
                        <th class="border bg-gray-800 text-white px-4 py-2">11 AM - 12PM</th>
                        <th class="border bg-gray-800 text-white px-4 py-2">12 PM - 01PM</th>
                        <th class="border bg-gray-800 text-white px-4 py-2">01 PM - 02PM</th>
                        <th class="border bg-gray-800 text-white px-4 py-2">02 PM - 03PM</th>
                        <th class="border bg-gray-800 text-white px-4 py-2">03 PM - 04PM</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    do { 
                    %>
                    <tr>
                        <td class="border px-4 py-2"><%= rs.getString("day_of_week") %></td>
                        <td class="border px-4 py-2"><%= rs.getString("time_9_to_10") %></td>
                        <td class="border px-4 py-2"><%= rs.getString("time_10_to_11") %></td>
                        <td class="border px-4 py-2"><%= rs.getString("time_11_to_12") %></td>
                        <td class="border px-4 py-2"><%= rs.getString("time_12_to_1") %></td>
                        <td class="border px-4 py-2"><%= rs.getString("time_1_to_2") %></td>
                        <td class="border px-4 py-2"><%= rs.getString("time_2_to_3") %></td>
                        <td class="border px-4 py-2"><%= rs.getString("time_3_to_4") %></td>
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
            No timetable found for <%= branch %> branch.
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
    function showSection(section) {
        document.getElementById('reportSection').classList.add('hidden');
        document.getElementById('timeTableSection').classList.add('hidden');
        document.getElementById('reportTab').classList.remove('active-tab');
        document.getElementById('timeTableTab').classList.remove('active-tab');

        if (section === 'report') {
            document.getElementById('reportSection').classList.remove('hidden');
            document.getElementById('reportTab').classList.add('active-tab');
        } else if (section === 'timeTable') {
            document.getElementById('timeTableSection').classList.remove('hidden');
            document.getElementById('timeTableTab').classList.add('active-tab');
        }
    }

    document.getElementById("branchForm").addEventListener("submit", function(event) {
        event.preventDefault(); 
     });
</script>
</body>
</html>
