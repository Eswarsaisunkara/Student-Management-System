<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="tailwind.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
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
				          <path stroke-linecap="round" stroke-linejoin="round"
							d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9" />
				    </svg>Logout
				</a>
			</div>
		</div>
	</nav>

	<div class="container mx-auto px-4 py-2">
		<div class="text-center mb-8">
			<h1 class="text-4xl font-extrabold text-blue-900 py-5">Manage
				Students Efficiently</h1>
			<p class="text-lg text-gray-900 font-bold mt-4">A simple,
				efficient, and intuitive way to manage students for faculty members.</p>
		</div>

		<!-- Cards for various functionalities -->
		<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 ">
			<!-- Add Student Card -->
			<div class="bg-sky-100 shadow-lg rounded-lg p-6 flex items-center border-2 border-sky-500">
				<div class="flex-shrink-0">
					<img src="assets/addStudent.jpg" alt="Add Students"
						class="w-32 h-32 border-2 border-sky-500 rounded-md">
				</div>
				<div class="ml-6">
					<h2 class="text-xl font-bold text-sky-500">Add Student</h2>
					<p class="text-gray-900 font-medium mt-2">Create and add new
						student profiles to the system.</p>
					<div class="mt-4">
						<a href="addStudent.jsp"
							class="bg-sky-500 hover:bg-sky-600 text-white px-4 py-2 rounded-lg">Add
							Student</a>
					</div>
				</div>
			</div>

			<!-- View Students Card -->
			<div class="bg-lime-100 shadow-lg rounded-lg p-6 flex items-center border-2 border-lime-500">
				<div class="flex-shrink-0">
					<img src="assets/view-students.jpg" alt="View Students"
						class="w-32 h-32 border-2 border-lime-500 rounded-md">
				</div>
				<div class="ml-6">
					<h2 class="text-xl font-bold text-lime-500">View Students</h2>
					<p class="text-gray-900 font-medium mt-2">Browse and view the
						details of all registered students.</p>
					<div class="mt-4">
						<a href="viewStudents.jsp"
							class="bg-lime-500 hover:bg-lime-600 text-white px-4 py-2 rounded-lg">View
							Students</a>
					</div>
				</div>
			</div>

			<!-- Class Time Table and Student Report Card -->
			<div class="bg-yellow-100 shadow-lg rounded-lg p-6 flex items-center border-2 border-yellow-500">
				<div class="flex-shrink-0">
					<img src="assets/report.jpg" alt="Student Reports"
						class="w-32 h-32 border-2 border-yellow-500 rounded-md">
				</div>
				<div class="ml-6">
					<h2 class="text-xl font-bold text-yellow-500">Student Reports
						& Time Table</h2>
					<p class="text-gray-900 font-medium mt-2">View class schedules
						and student reports.</p>
					<div class="mt-4">
						<a href="studentReport.jsp"
							class="bg-yellow-500 hover:bg-yellow-600 text-white px-4 py-2 rounded-lg">View
							Report & Time Table</a>
					</div>
				</div>
			</div>

			<!-- Attendance and Fee Due Card -->
			<div class="bg-red-100 shadow-lg rounded-lg p-6 flex items-center border-2 border-red-500">
				<div class="flex-shrink-0">
					<img src="assets/attendance.jpg" alt="Attendance and Fee Dues"
						class="w-32 h-32 border-2 border-red-500 rounded-md">
				</div>
				<div class="ml-6">
					<h2 class="text-xl font-bold text-red-500">Attendance & Fee
						Due</h2>
					<p class="text-gray-900 font-medium mt-2">Track attendance and
						check fee dues for students.</p>
					<div class="mt-4">
						<a href="attendancefees.jsp"
							class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded-lg">Track
							Attendance & Fees</a>
					</div>
				</div>
			</div>

			<!-- Course Management Card -->
			<div class="bg-teal-100 shadow-lg rounded-lg p-6 flex items-center border-2 border-teal-500">
				<div class="flex-shrink-0">
					<img src="assets/courses.jpg" alt="Manage Courses"
						class="w-32 h-32 border-2 border-teal-500 rounded-md">
				</div>
				<div class="ml-6">
					<h2 class="text-xl font-bold text-teal-500">Manage Courses</h2>
					<p class="text-gray-900 font-medium mt-2">Organize and assign
						courses to students, manage course details.</p>
					<div class="mt-4">
						<a href="manageCourses.jsp"
							class="bg-teal-500 hover:bg-teal-600 text-white px-4 py-2 rounded-lg">Manage
							Courses</a>
					</div>
				</div>
			</div>

			<!-- Extracurricular Activities Card -->
			<div class="bg-purple-100 shadow-lg rounded-lg p-6 flex items-center border-2 border-purple-500">
				<div class="flex-shrink-0">
					<img src="assets/activities.jpg" alt="Extracurricular Activities"
						class="w-32 h-32 border-2 border-purple-500 rounded-md">
				</div>
				<div class="ml-6">
					<h2 class="text-xl font-bold text-purple-500">Extracurricular
						Activities</h2>
					<p class="text-gray-900 font-medium mt-2">Manage
						extracurricular activities, clubs, and events for students.</p>
					<div class="mt-4">
						<a href="extracurricular.jsp"
							class="bg-purple-500 hover:bg-purples-600 text-white px-4 py-2 rounded-lg">Manage
							Activities</a>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
