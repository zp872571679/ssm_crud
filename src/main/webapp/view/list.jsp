<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/22 0022
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--web资源的引入--%>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>Title</title>
    <link href="static/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="static/js/jquery-3.4.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="static/js/bootstrap.min.js"></script>

</head>
<body>
<%--页面的搭建--%>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM_CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                <tr>
                    <th>${emp.empId}</th>
                    <th>${emp.empName}</th>
                    <th>${emp.gender=="M"?"男":"女"}</th>
                    <th>${emp.email}</th>
                    <th>${emp.department.deptName}</th>
                    <th>
                        <button class="btn btn-primary btn-sm">
                            <span class="icon-pencil" aria-hidden="true" aria-label="Left Align"></span>
                            编辑
                        </button>
                        <button class="btn btn-danger btn-sm">
                            <span class="icon-trash" aria-hidden="true" aria-label="Left Align"></span>
                            删除
                        </button>
                    </th>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%--分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6">
            当前第${pageInfo.pageNum}页,总${pageInfo.pages}页,总${pageInfo.total}条记录
        </div>
        <div class="col-md-6 pagination">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="${APP_PATH}/emps?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li class="page-item">
                            <a class="page-link" href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                        <c:if test="${pageNum==pageInfo.pageNum}">
                            <li class="page-item active"><a class="page-link" href="#">${pageNum}</a></li>
                        </c:if>
                        <c:if test="${pageNum!=pageInfo.pageNum}">
                            <li class="page-item"><a class="page-link" href="${APP_PATH}/emps?pn=${pageNum}">${pageNum}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                    <li class="page-item">
                        <a class="page-link" href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                            <li class="page-item"><a class="page-link" href="${APP_PATH}/emps?pn=${pageInfo.pages}">尾页</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
