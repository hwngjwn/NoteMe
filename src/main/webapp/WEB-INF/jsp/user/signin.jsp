<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User</title>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="   crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="text-center display-1">
			환영합니다.
		</div>
		<div class="d-flex flex-row justify-content-center mb-4 mt-2">
			<button id="addMemoButton" class="btn button btn-primary text-white item">메모추가</button>
			<button id="deleteMemoButton" class="btn button btn-primary text-white item ml-2 mr-2">메모삭제</button>
			<button id="logoutButton" class="btn button btn-primary text-white item">로그아웃</button>
		</div>
		<section>
		<hr class="mb-3">
			<table class="table">
				<thead>
					<tr>
						<th id="deleteCheckbox"></th>
						<th> No </th>
						<th> Date </th>
						<th> Title </th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="memo" items = "${memos}" varStatus="status">
					<tr>
						<td><input name="forDelete" type="checkbox" class="d-none" value="${memo.id}"></td>
						<td>${status.count }</td>
						<td>${memo.createdAt }</td>
						<td><a href="/memo/viewMemo/view?id=${memo.id }">${memo.title}</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="d-flex flex-row justify-content-end">
			<button id="deleteOk" class="d-none button text-white btn-danger btn">삭제</button>
			</div>
		</section>
	</div>
	<script>
		$(document).ready(function(){
			var selectForDelete = $("input[name=forDelete]");
			var deleteButton = $("#deleteMemoButton");
			var deleteSelected = $("#deleteOk");
			deleteButton.on("click", function(){
				$("#deleteOk").removeClass("d-none");
				selectForDelete.removeClass("d-none");
			})
			
			$("#addMemoButton").on("click", function(){
				location.href = "/memo/addMemo/view";
			})
			$("#logoutButton").on("click", function(){
				location.href = "/user/logout";
			})	
			$("#deleteOk").on("click", function(){
				$("input:checkbox[name=forDelete]:checked").each(function(){
					let thisurl = "/memo/deleteEntry?id=" + this.value;
					$.ajax({
						type : "get"
						, url : thisurl
						, data : {"id" : this.value}
						, success : function(data){
							if(data.result == "success"){
								alert("삭제됨");
								location.href = "/user/signin/view";
							} else{
								alert("안삭제됨");
							}
						}
						, error : function(){
							alert("매우잘못됨");
						}
						
					})
				})
			})
		})
	</script>

</body>
</html>