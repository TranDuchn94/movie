<%@ page import="fa.training.constants.AppConstant" %><%--
  Created by IntelliJ IDEA.
  User: knigh
  Date: 04/02/2023
  Time: 11:16 SA
  To change this template use File | Settings | File Templates.
--%>

<div id="side-menu"
     class="col-sm-4 col-md-3 col-xl-2 border-start border-end border-muted bg-light overflow-hidden">
    <ul class="list-group row">
        <a class="border-start-0 border-end-0 border-top-0 rounded-0 list-group-item list-group-item-action
                                text-primary text-left d-block bg-light pt-2 pb-2 text-nowrap text-decoration-none btn-hover"
           href="${pageContext.request.contextPath}/employees"><i class="fa fa-dashboard"></i> Dashboard</a>
        <li class="border-start-0 border-end-0 border-top-0 rounded-0 p-0 dropdown list-group-item d-flex">
            <button
                    class="btn btn-light border-0 dropdown-toggle w-100 h-100 rounded-0 text-primary text-start"
                    type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="ps-1 fa-sharp fa-solid fa-chart-column"></i> Employee Managing
            </button>
            <ul class="dropdown-menu shadow border-0 w-100 bottom-100 p-0 m-0"
                aria-labelledby="dropdownMenuButton1">
                <li><a class="d-block dropdown-item border-bottom border-muted bg-light btn-hover text-primary"
                       href="${pageContext.request.contextPath}/employees">
                    <i class="ps-2 fa-solid fa-list-ul"></i>
                    Employee List</a></li>
                <li><a class="d-block dropdown-item border-bottom border-muted bg-light btn-hover text-primary"
                       href="${pageContext.request.contextPath}/employees/add?pageNumber=&totalRecord="><i class="ps-2 fa-solid fa-plus"></i>
                    Add Employee</a></li>
            </ul>
        </li>
    </ul>
</div>
