<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <jsp:include page="/WEB-INF/fragment/head-import.jsp" />
</head>
<body>
<div class="container-fluid">
    <div class="row justify-content-center align-items-center vh-100">
        <div class="col-11 col-sm-6 col-lg-4">
            <div class="border border-1 rounded">
                <h1 class="fs-5 fw-normal p-3 bg-light">Member Login</h1>
                <%  String account = (String) request.getAttribute("account");
                    String password = (String) request.getAttribute("password");
                %>

                <form class="px-3" method="POST" action="${pageContext.request.contextPath}/auth/login" >
                    <div class="input-group mb-3">
                        <div class="input-group-prepend ">
                            <span class="bg-white rounded-0 rounded-start border-end-0 h-100 input-group-text" id="user-icon"><i class="fa-solid fa-user"></i></span>
                        </div>
                        <input type="account" class="form-control" name="account" id="example" placeholder="account" value="<%=(account != null) ? account : ""%>">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend ">
                            <span class="bg-white rounded-0 rounded-start border-end-0 h-100 input-group-text" id="password-icon"><i class="fa-solid fa-lock"></i></span>
                        </div>
                        <input type="password" class="form-control" name="password" id="password" placeholder="Password" value="<%=(password != null) ? password : ""%>">
                    </div>
                    <div class="mb-3">
                        <input class="form-check-input" name="remember" type="checkbox" value="1" id="flexCheckDefault">
                        <label class="form-check-label" for="flexCheckDefault">Remember me</label>
                    </div>
                    <div class="mb-3">
                        <%
                            String errorMsg = (String) request.getAttribute("invalidAccountMsg");
                            if(errorMsg != null){ %>
                        <div class="text-danger"> <%=errorMsg%></div>
                        <% } %>
                        <button type="submit" class="btn btn-success w-100">Login</button>
                    </div>
                    <div style="height: 40px" class="row bg-light align-items-center">
                        <a href="#"
                           class="text-center text-secondary text-decoration-none">Forgot password?</a>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div><
script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
</script>

<script>
    // function check() {
    //     bool = true;
    //     let account = document.getElementById("user").value;
    //     let password = document.getElementById("password").value;
    //     accountCheck = acc.trim();
    //     passwordCheck = password.trim();
    //     if(!account || accountCheck.isEmpty()){
    //         bool = false;
    //         alert("user can not be blank or empty")
    //     }
    //     if(!password || passwordCheck.isEmpty()){
    //         bool = false;
    //         alert("password can not be blank or empty");
    //     }
    //     return bool;
    // }
</script>
</body>
</html>
