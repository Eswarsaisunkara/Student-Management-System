<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="tailwind.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Faculty Login</title>
<style>
body {
	background-image:url("");
	background-size :cover;
	width:100%;
	height:10vh;
}
</style>
</head>
<body class="bg-gray-100">
<nav class="bg-gray-900 shadow-lg">
		<div class="container mx-auto px-4 py-8 flex justify-between items-center">
			<div class="text-2xl font-bold text-white">Student Management System</div>
		</div>
</nav>

	<div class="container mx-auto px-4 py-16">
		<div class="max-w-md mx-auto bg-white shadow-lg rounded-lg p-8">
			<h1 class="text-3xl font-bold text-center text-blue-900  mb-6">Faculty
				Login</h1>

			<form action="LoginServlet" method="post" class="space-y-6">
				<div>
					<label for="email" class="block text-lg font-bold text-gray-900">Email
						Address</label> <input type="email" name="email" id="email" required
						class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-500">
				</div>
				<div>
					<label for="password"
						class="block text-lg font-bold text-gray-900">Password</label> <input
						type="password" name="password" id="password" required
						class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-500">
				</div>
				<div class="text-center">
					<input type="submit" value="Login"
						class="bg-blue-500 text-white text-lg px-4 py-2 font-medium rounded-lg hover:bg-blue-700 cursor-pointer">
				</div>
			</form>

			<div class="text-center mt-6">
				<p class="text-gray-600">
					Don't have an account? <a href="signup.jsp"
						class="text-blue-500 font-medium hover:underline">Sign Up</a>
				</p>
			</div>
		</div>
	</div>

</body>
</html>
