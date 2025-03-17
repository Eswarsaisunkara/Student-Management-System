<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="tailwind.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Student</title>
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
	<div class="container mx-auto px-4 py-4">
		<h1 class="text-3xl font-bold text-center text-sky-400 mb-8">Add
			New Student</h1>
		<form action="AddStudentServlet" method="post"
			class="max-w-lg mx-auto bg-white p-5 rounded shadow-md">
			<div class="mb-3">
				<label for="name" class="block text-gray-900 font-bold ">Name:</label>
				<input type="text" id="name" name="name"
					class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-1 focus:ring-blue-500"
					required>
			</div>
			<div class="mb-3">
				<label for="pin" class="block text-gray-900 font-bold ">PIN:</label>
				<input type="text" id="pin" name="pin"
					class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-1 focus:ring-blue-500"
					required>
			</div>
			<div class="mb-3">
				<label for="email" class="block text-gray-900 font-bold ">Email:</label>
				<input type="email" id="email" name="email"
					class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-1 focus:ring-blue-500"
					required>
			</div>
			<div class="mb-3">
				<label for="branch" class="block text-gray-900 font-bold ">Branch:</label>
				<input type="text" id="branch" name="branch"
					class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-1 focus:ring-blue-500"
					required>
			</div>
			<div class="mb-3">
				<label for="year" class="block text-gray-900 font-bold">Year:</label>
				<input type="number" id="year" name="year"
					class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-1 focus:ring-blue-500"
					min="1" max="4" required>
			</div>

			<button type="submit"
				class="w-full bg-sky-500 text-white px-4 py-2 rounded hover:bg-sky-700">Add
				Student</button>
		</form>
		<div class="mt-4 text-center">
			<a href="home.jsp" class="text-red-600 hover:underline"><button
					class="bg-red-600 text-white px-2 py-2 rounded-lg">Back to
					Home</button></a>
		</div>

	</div>
</body>
</html>
