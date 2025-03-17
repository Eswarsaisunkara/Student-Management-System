<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="tailwind.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Signup</title>
<link
	href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
	rel="stylesheet">
</head>

<body class="bg-gray-100">
	<nav class="bg-gray-900 shadow-lg">
		<div
			class="container mx-auto px-4 py-8 flex justify-between items-center">
			<div class="text-2xl font-bold text-white">Student Management
				System</div>
		</div>
	</nav>
	<div class="container mx-auto px-4 py-10">
		<div class="max-w-md mx-auto bg-white shadow-lg rounded-lg p-6">
			<h1 class="text-3xl font-bold text-center text-blue-900 mb-6">Faculty
				Signup</h1>
			<form action="SignupServlet" method="post" class="space-y-4">
				<div>
					<label for="name" class="block text-lg font-bold text-gray-900">Name:</label>
					<input type="text" name="name" required
						class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-500">
				</div>
				<div>
					<label for="email" class="block text-lg font-bold text-gray-900">Email:</label>
					<input type="email" name="email" required
						class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-500">
				</div>
				<div class="mb-3">
					<label for="password" class="block text-lg text-gray-900 font-bold">Password:</label>
					<input type="number" id="password" name="password"
						class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-1 focus:ring-blue-500"
						min="1" max="4" required>
				</div>
				<div>
					<label for="dept" class="block text-lg font-bold text-gray-900">Department:</label>
					<input type="text" name="dept" required
						class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-500">
				</div>
				<div class="text-center">
					<input type="submit" value="Signup"
						class="bg-blue-500 text-white text-lg px-4 py-2 font-medium rounded hover:bg-blue-700 cursor-pointer">
				</div>
			</form>
			<div class="text-center mt-6">
				<p class="text-gray-600">
					Already have an account? <a href="login.jsp"
						class="text-blue-500 font-medium hover:underline">Login</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>
