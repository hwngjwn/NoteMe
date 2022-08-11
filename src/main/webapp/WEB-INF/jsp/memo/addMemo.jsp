<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="   crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<title>Add Memo</title>
</head>
<body>
	<div class="container">
		<header>
			<div class="display-4 text-center">Note Me</div>
		</header>
		<section>
		<div class="d-flex justify-content-center">
			<div>Title :<input type="text" name="title" id="title" class="form-control"></div><br>
		</div>	
			<textarea cols="50" rows="20" id="entry" name="entry" class="form-control d-flex justify-content-center mt-3"></textarea>
			<div class="d-flex justify-content-end">
				<button id="submitEntry" class="btn button btn-primary mt-3">입력</button>
				<button class="btn button btn-primary mt-3 ml-2"><a href="#" class="text-white">취소</a></button>
			</div>
		</section>
	</div>
	<script>
		$(document).ready(function(){
			$("#submitEntry").on("click", function(){
				if($("#title").val() == ""){
					alert("제목을 입력해주세요");
				} else{
				$.ajax({
					type : "post"
					,url : "/memo/addMemoEntry"
					,data : {
						"title" : $("#title").val(),
						"entry" : $("#entry").val()
					}
					,success : function(data){
						if(data.result == "success"){
							alert("입력됨");
							location.href = "/user/signin/view";
						} else{
							alert("입력안됨");
						}
					}
					,error : function(){
						alert("도대체왜안된거임");
						alert("code : " + request.status + "\n" + "message: " + request.responseText + "\n" + "errer : " + error);

					}
				})
				}
			})
		})
	</script>	
</body>
</html>