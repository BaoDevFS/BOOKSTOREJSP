<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style type="text/css">
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container center well" style="margin-top: 50px;">
    <div class="modal-header">
        <h4 class="modal-title">Quên mật khẩu</h4>
    </div>
    <div class="modal-body">
        <form role="form" action="Serv_ForgotPassword" method="post">
            <div class="form-group">
                <label for="email">Tên đăng nhập:</label>
                <input name="username" type="text" class="form-control" id="text" placeholder="Tên đăng nhập">
            </div>
            <div class="form-group">
                <label for="mail">Email:</label>
                <input name="email" type="email" class="form-control" id="email" placeholder="Nhập email">
            </div>
            <div class="checkbox">
            </div>
            <button type="submit" class="btn btn-default">Gửi</button>
        </form>
    </div>
    <div class="modal-footer">
        <a href="trangchu.jsp">
            <button type="button" class="btn btn-default">Close</button>
        </a>
    </div>
</div>

</body>
</html>