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

<title>SignIn</title>
</head>
<body>
   <div id="wrap" class="container">
        <header class="bg-warning">
            <div class="display-2 text-center bg-primary">MEMO</div>
        </header>
            <br>
            <!--이메일-->
            <div>user name : </div>
            <div class="d-flex">
                <input type="text" name="userName" id="userName" class="form-control input-text">
            </div>
            <br>
            <!--비밀번호 & 확인-->
            <div>
                password : <input type="password" name="password" id="password" class="form-control input-text" >
            </div><br>
            <div>
            <button id="loginButton" class="button btn btn-primary" type="submit">Log in</button>
            <button id="signupButton" class="button btn btn-primary"><a href="/user/signup/view" class="text-white">회원가입</a></button>
            </div>
        <footer>
        <div class="small text-secondary text-center">2022 All Rights Reserved, Note me</div>
        </footer>
	</div>
        <script>
        	$(document).ready(function(){
        		$("#loginButton").on("click", function(){
        			if($("#userName").val()==""){
        				alert("입력을 완료하세요.")
        			}
        			if($("#password").val()==""){
        				alert("입력을 완료하세요.")
        			}
        			if($("#userName").val() != "" && $("#password").val()!=""){
        			
        				$.ajax({
        					type : "post"
        					, url : "/user/login"
        					, data : {
        						"userId" : $("#userName").val()
        						,"password" : $("#password").val()
        					}
        					, success : function(data){
        					if(data.result == true){
        						alert("로그인 완료!");
        						location.href = "/user/signin/view";
        					} else{
        						alert("비밀번호를 확인하세요.");
        					}
        					}
        					, error : function(){
        						alert("무언가 더더욱 잘못됨");
        						alert("code : " + request.status + "\n" + "message: " + request.responseText + "\n" + "errer : " + error);

        					}
        				})
        			}
        		})
        	})
        	
	
        </script>
        
</body>
</html>