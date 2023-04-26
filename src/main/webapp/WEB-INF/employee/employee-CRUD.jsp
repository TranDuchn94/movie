<%@ page import="fa.training.modal.entities.Employee" %>
<%@ page import="fa.training.modal.entities.Account" %>
<%@ page import="fa.training.enums.Department" %>
<%@ page import="jakarta.validation.ConstraintViolation" %>
<%@ page import="java.util.Set" %><%--
  Created by IntelliJ IDEA.
  User: nguye
  Date: 2/3/2023
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Add</title>
    <jsp:include page="../fragment/head-import.jsp"/>
</head>
<body>
<div class="container-fluid">
    <jsp:include page="../fragment/header.jsp"/>
    <div class="row vh-100">
        <jsp:include page="../fragment/aside-left.jsp"/>

        <% String action = (String) request.getAttribute("CRUD");
            String pageNumber = (String) request.getAttribute("pageNumber");
            String totalRecord = (String) request.getAttribute("totalRecord");
            String keyword = (String) request.getAttribute("keyword");
            String filter = (String) request.getAttribute("filter");
        %>

        <div class="col-sm-8 col-md-9 col-xl-10 bg-white pb-3">
            <div class="p-2">
                <h1 class="pt-3 pb-3 border-bottom border-muted mb-3">Employee <%=action%></h1>
                <form name="employeeForm" method="post"
                      action="${pageContext.request.contextPath}/employees/<%=action%>">
                    <% Employee employee = (Employee) request.getAttribute("employee");
                        Account account = (Account) request.getAttribute("account");
                        Set<ConstraintViolation<Employee>> errorEmployee = (Set<ConstraintViolation<Employee>>) request.getAttribute("errorEmployee");
                        Set<ConstraintViolation<Account>> errorAccount = (Set<ConstraintViolation<Account>>) request.getAttribute("errorAccount");
                    %>
                    <div class="mb-3">
                        <input class="form-control" name="employeeId" type="text" value="<%=employee == null ? "": employee.getId()%>" hidden="">
                        <label class="form-label">First name <span class="text-danger">(*)</span></label>
                        <input class="form-control" name="firstName" type="text" placeholder="First name"
                               <%="view".equalsIgnoreCase(action) ? "disabled" : ""%>
                               value="<%= employee == null ? "": employee.getFirstName()%>">
                        <%if(errorEmployee != null){
                            for(ConstraintViolation e : errorEmployee){
                                if("firstName".equalsIgnoreCase(e.getPropertyPath().toString())){ %>
                                    <span class="text-danger"><%=e.getMessage()%></span>
                                <%}
                            }
                        } %>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Last name <span class="text-danger">(*)</span></label>
                        <input class="form-control" name="lastName" type="text" placeholder="Last name"
                            <%="view".equalsIgnoreCase(action) ? "disabled" : ""%>
                               value="<%=employee == null ? "": employee.getLastName()%>">
                        <%if(errorEmployee != null){
                            for(ConstraintViolation e : errorEmployee){
                                if("lastName".equalsIgnoreCase(e.getPropertyPath().toString())){ %>
                                    <span class="text-danger"><%=e.getMessage()%></span>
                                <%}
                            }
                        } %>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone number <span class="text-danger">(*)</span></label>
                        <input class="form-control" name="phoneNumber" type="text" placeholder="Phone number"
                            <%="view".equalsIgnoreCase(action) ? "disabled" : ""%>
                               value="<%=employee == null ? "": employee.getPhone()%>">
                        <%if(errorEmployee != null){
                            for(ConstraintViolation e : errorEmployee){
                                if("phone".equalsIgnoreCase(e.getPropertyPath().toString())){ %>
                                    <span class="text-danger"><%=e.getMessage()%></span>
                                <%}
                            }
                        } %>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Date of birth<span class="text-danger">(*)</span></label>
                        <input class="form-control" name="dateOfBirth" type="date"
                            <%="view".equalsIgnoreCase(action) ? "disabled" : ""%>
                               value="<%=employee == null ? "": employee.getDateOfBirth()%>">
                    </div>
                    <div class="mb-3">
                        <div>
                            <label class="form-label">Gender <span class="text-danger">(*)</span></label>
                        </div>
                        <input class="form-check-input" type="radio" name="gender" id="radio1"
                            <%="view".equalsIgnoreCase(action) ? "disabled" : ""%>
                               value="0" <%=employee != null ? employee.getGender()==0 ? "checked":"" : ""%>>
                        <label class="form-label" for="radio1">Female</label>
                        <input class="form-check-input" type="radio" name="gender" id="radio2"
                            <%="view".equalsIgnoreCase(action) ? "disabled" : ""%>
                               value="1" <%=employee != null ? employee.getGender()==1 ? "checked":"" : ""%>>
                        <label class="form-label" for="radio2">Male</label>
                    </div>
                    <div class="mb-3">
                        <input class="form-control" name="accountId" type="text"
                            <%="view".equalsIgnoreCase(action) ? "disabled" : ""%>
                               value="<%=account == null ? "": account.getId()%>" hidden="">
                        <label class="form-label">Account <span class="text-danger">(*)</span></label>
                        <input class="form-control" name="account" type="text" placeholder="Account"
                            <%="view".equalsIgnoreCase(action) ? "disabled" : ""%>
                               value="<%=account == null ? "": account.getAccount()%>">
                        <%if(request.getAttribute("duplicateAccount") != null) { %>
                            <span class="text-danger"><%=request.getAttribute("duplicateAccount")%></span>
                        <% } %>
                        <%if(errorEmployee != null){
                            for(ConstraintViolation a : errorAccount){
                                if("account".equalsIgnoreCase(a.getPropertyPath().toString())){ %>
                                    <span class="text-danger"><%=a.getMessage()%></span>
                                <%}
                            }
                        } %>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email <span class="text-danger">(*)</span></label>
                        <input class="form-control" name="email" type="email" placeholder="Email"
                            <%="view".equalsIgnoreCase(action) ? "disabled" : ""%>
                               value="<%=account == null ? "": account.getEmail()%>">
                        <%if(request.getAttribute("duplicateEmail") != null) { %>
                            <span class="text-danger"><%=request.getAttribute("duplicateEmail")%></span>
                        <% } %>
                        <%if(errorEmployee != null){
                            for(ConstraintViolation a : errorAccount){
                                if("email".equalsIgnoreCase(a.getPropertyPath().toString())){ %>
                            <span class="text-danger"><%=a.getMessage()%></span>
                                <%}
                            }
                        } %>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password <span class="text-danger">(*)</span></label>
                        <input class="form-control" name="password" type="password" placeholder="Password"
                            <%="view".equalsIgnoreCase(action) ? "disabled" : ""%>
                               value="<%=account == null ? "": account.getPassword()%>">
                        <%if(errorEmployee != null){
                            for(ConstraintViolation a : errorAccount){
                                if("password".equalsIgnoreCase(a.getPropertyPath().toString())){ %>
                                    <span class="text-danger"><%=a.getMessage()%></span>
                                <%}
                            }
                        } %>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <textarea class="form-control" name="address" placeholder="Address" rows="3"><%=employee == null ? "": employee.getAddress()%></textarea>
                    </div>
                    <div class="mb-3">
                        <div>
                            <label class="form-label" for="status">Status</label>
                        </div>
                        <% Integer status= 0;
                            if(account != null) status  = account.getStatus();%>
                        <input class="form-check-input" type="checkbox" name="status"
                            <%="view".equalsIgnoreCase(action) ? "disabled" : ""%>
                               value="1" <%= status ==1 ? "checked":""%> id="status">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Department <span class="text-danger">(*)</span></label>
                        <select name="department" class="form-select" aria-label="Default select example">
                            <option value="<%=(employee != null) ? employee.getDepartmentName().name() : Department.PRODUCT%>" selected hidden><%=(employee != null) ? employee.getDepartmentName().getLabel() : Department.PRODUCT%></option>
                            <%
                                Department[] departments = Department.values();
                                for(Department d : departments){
                            %>
                            <option value="<%=d.name()%>"><%=d.getLabel()%></option>
                            <%}%>
                        </select>
                    </div>
                    <input type="text" name="pageNumber" value="<%=pageNumber%>" hidden>
                    <input type="text" name="totalRecord" value="<%=totalRecord%>" hidden>
                    <input type="text" name="keyword" value="<%=keyword == null ? "" : keyword%>" hidden>
                    <input type="text" name="filter" value="<%=filter == null ? "" : filter%>" hidden>
                    <div class="mb-3">
                        <label class="form-label">Remark</label>
                        <textarea class="form-control" name="remark" placeholder="Remark"
                                <%="view".equalsIgnoreCase(action) ? "disabled" : ""%>
                                  value="<%=employee == null ? "": employee.getRemark()%>"  rows="3"></textarea>

<%--                        Check data of search or data of list all--%>
                    <% if(keyword == null || keyword.length() == 0) { %>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/employees?pageNumber=<%=pageNumber%>"><i class="fa-solid fa-backward"></i> Back </a>
                    <% } else { %>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/employees/search?pageNumber=<%=pageNumber%>&keyword=<%=keyword == null ? "" : keyword%>&filter=<%=filter == null ? "" : filter%>"><i class="fa-solid fa-backward"></i> Back </a>
                        <% } %>
                        <%if("add".equalsIgnoreCase(action)) { %>
                        <button type="reset" class="btn btn-warning" style="color: white"><i class="fas fa-undo"></i>Reset</button>
<%--                            <a class="btn btn-warning" href="${pageContext.request.contextPath}/employees/add">Reset</a>--%>
                            <button class="btn btn-success" type="submit">+ Add</button>
                        <% } else if ("update".equalsIgnoreCase(action)) { %>
                            <a class="btn btn-warning" href="${pageContext.request.contextPath}/employees/update?id=<%=employee != null ? employee.getId() : ""%>&pageNumber=<%=pageNumber%>&keyword=<%=keyword == null ? "" : keyword%>&filter=<%=filter == null ? "" : filter%>">Reset</a>
                            <button class="btn btn-success" type="submit">Update</button>
                        <% } %>
                    </div>
                </form>
            </div>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</body>
</html>
