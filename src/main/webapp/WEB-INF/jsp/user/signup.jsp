<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="   crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
</head>
<body>
    <div id="wrap" class="container">
         <header class="bg-warning">
            <div class="display-2 text-center bg-primary">MEMO</div>
        </header>
        <form method="post"> <!--api뚫어야함-->
        <div>
            <br>
            <!--이메일-->
            <div>
                user name : <input type="text" name="userName" id="userName" class="form-control input-text">
            </div>
            <br>
            <!--비밀번호 & 확인-->
            <div>
                password : <input type="password" name="password" id="password" class="form-control input-text" >
            <br>
                confirm password : <input type="password" id="passwordCheck" class="form-control input text">
                <div id="confirmFailedPW" class="d-none"><small class="text-danger">비밀번호가 다릅니다.</small></div>
                <div id="confirmedPW" class="d-none"><small class="text-info">비밀번호가 같습니다.</small></div>
            </div>
            <br>
            <br>
            <div><input id="joinButton" class="button btn btn-primary" type="submit"></div>
        </div>
        </form>
        <footer>
        <div class="small text-secondary text-center">2022 All Rights Reserved, Note me</div>
        </footer>
    </div>

</body>
</html>