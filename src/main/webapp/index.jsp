<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/22 0022
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
        <div class="col-md-8 col-md-offset-8">
            <button type="button" class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_del_modal_btn">删除</button>
        </div>
    </div>
    <!--员工修改的模态框 -->
    <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="ModalLabel">员工修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label" for="empName_add_input">empName</label>
                            <div class="controls">
                                <p class="form-control-static" id="empName_update_static"></p>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="email_add_input">Email</label>
                            <div class="controls">
                                <input type="email" id="email_update_input" placeholder="email@guigu.com" name="email">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Gender</label>
                            <div class="controls">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_update_input" value="M"
                                           checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">deptName</label>
                            <div class="controls">
                                <select name="dId" id="dept_update_select">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
                </div>
            </div>
        </div>
    </div>


    <!--员工添加模态框 -->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">员工添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="control-group">
                            <label class="control-label" for="empName_add_input">empName</label>
                            <div class="controls">
                                <input type="text" id="empName_add_input" placeholder="empName" name="empName">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="email_add_input">Email</label>
                            <div class="controls">
                                <input type="email" id="email_add_input" placeholder="email@guigu.com" name="email">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Gender</label>
                            <div class="controls">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_add_input" value="M"
                                           checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">deptName</label>
                            <div class="controls">
                                <select name="dId" id="dept_add_select">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>
    <%--表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th><input type="checkbox" id="check_all"></th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area">
        </div>
        <div class="col-md-6 pagination" id="page_nav_area">
        </div>
    </div>
</div>
<script type="text/javascript">
    //保存总记录数
    var totalRecord;
    var currentPage;
    $(function () {
        to_page(1);
    });

    //跳转多少页的方法
    function to_page(pn) {
        $.ajax({
            // 编写json格式，设置属性和值
            url: "${APP_PATH}/emps",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                //console.log(result);
                /*显示并解析员工数据*/
                build_emps_table(result);
                build_page_info(result);
                /*显示并解析分页信息*/
                build_page_nav(result);
            }
        });
    }

    /*表格数据显示的方法*/
    function build_emps_table(result) {
        $("#emps_table tbody").empty();
        var emps = result.exent.pageInfo.list;
        $.each(emps, function (index, item) {
            var empDelTd = $("<td></td>").append("<input type='checkbox' class='check_item'/>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var empGenderTd = $("<td></td>").append(item.gender == "M" ? "男" : "女");
            var empEmailTd = $("<td></td>").append(item.email);
            var empDepartment = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append("编辑");
            editBtn.attr("edit_id", item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append("删除");
            delBtn.attr("delete_id", item.empId);
            var btn_Td = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(empDelTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(empGenderTd)
                .append(empEmailTd)
                .append(empDepartment)
                .append(btn_Td)
                .appendTo("#emps_table tbody");

        });
    }

    /*分页的数据显示方法*/
    function build_page_info(result) {
        $("#page_info_area").empty();
        var pageInfo = result.exent.pageInfo;
        $("#page_info_area").append("当前第" + pageInfo.pageNum + "页，总" + pageInfo.pages + "页，总" + pageInfo.total + "条数据");
        totalRecord = pageInfo.pages;
        currentPage = pageInfo.pageNum;
    }

    /*分页条的显示方法*/
    function build_page_nav(result) {
        /*清除原来的数据 下一次访问数据不同*/
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var a1 = $("<a></a>").append("首页").attr("href", "#");
        var a2 = $("<a></a>").append("&laquo;");
        var firsPageLi = $("<li></li>").append(a1);
        var prePageLi = $("<li></li>").append(a2);
        if (result.exent.pageInfo.hasPreviousPage == false) {
            firsPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            firsPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.exent.pageInfo.pageNum - 1);
            });
        }
        var a3 = $("<a></a>").append("&raquo;");
        var a4 = $("<a></a>").append("尾页").attr("href", "#");
        var nextPageLi = $("<li></li>").append(a3);
        var lastPageLi = $("<li></li>").append(a4);
        /*判断是否是最后一页*/
        if (result.exent.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            lastPageLi.click(function () {
                to_page(result.exent.pageInfo.pages);
            });
            nextPageLi.click(function () {
                to_page(result.exent.pageInfo.pageNum + 1);
            });
        }
        ul.append(firsPageLi).append(prePageLi);
        $.each(result.exent.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.exent.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        })
        ul.append(nextPageLi).append(lastPageLi);
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav_area");
    }

    /*弹出模态框的方法*/
    $("#emp_add_modal_btn").click(function () {
        /*发送ajax请求先查出部门的信息在弹出模态框*/
        $("#empAddModal form")[0].reset();
        $("#empName_add_input").next("span").text("");
        getDepts("#dept_add_select");
        $("#empAddModal").modal({
            backdrop: "static"
        });
    });

    function getDepts(ele) {
        $(ele).empty();
        /*查询部门信息 显示下拉列表*/
        $.ajax({
            // 编写json格式，设置属性和值
            url: "${APP_PATH}/depts",
            type: "GET",
            success: function (result) {
                //console.log(result);
                $.each(result.exent.depts, function (index, item) {
                    var optionEle = $("<option></option>").append(item.deptName).attr("value", item.deptId);
                    optionEle.appendTo(ele);
                });
            }
        });
    }

    //提交表单数据的校验的方法
    function validate_add_form() {
        var empName = $("#empName_add_input").val();
        var empEmail = $("#email_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regName.test(empName)) {
            $("#empName_add_input").parent().addClass("has-error");
            $("#empName_add_input").next("span").text("用户名不合法");
            return false;
        }
        ;
        if (!regEmail.test(empEmail)) {
            $("#empEmail_add_input").parent().addClass("has-error");
            $("#empEmail_add_input").next("span").text("邮箱输入有误");
            return false;
        }
        return true;
    }

    //判断用户名是否重复
    $("#empName_add_input").change(function () {
        //发送ajax请求 校验数据
        var empName = this.value;
        $.ajax({
            // 编写json格式，设置属性和值
            url: "${APP_PATH}/checkuse",
            type: "POST",
            data: "empName=" + empName,
            success: function (result) {
                if (result.code != 100) {
                    $("#empName_add_input").next("span").text(result.exent.va_msg);
                    $("#emp_save_btn").attr("ajax_va", result.code);
                } else {
                    $("#empName_add_input").next("span").text("用户名可用");
                    $("#emp_save_btn").attr("ajax_va", result.code);
                }
            }
        });
    });

    /*提交保存信息的方法*/
    $("#emp_save_btn").click(function () {
        //校验数据
        if (!validate_add_form()) {
            return false;
        }
        //用户名的校验
        if ($(this).attr("ajax_va") != 100) {
            return false;
        }

        //把模态框的数据交给服务器
        $.ajax({
            // 编写json格式，设置属性和值
            url: "${APP_PATH}/emp",
            type: "POST",
            data: $("#empAddModal form").serialize(),
            success: function (result) {
                //alert(result.msg);
                //校验后台数据是否合法
                if (result.code == 100) {
                    //保存成功 关闭模态框
                    $("#empAddModal").modal('hide');
                    //跳转到最后一页
                    to_page(totalRecord);
                } else {
                    if (undefined != result.exent.errorField.empName) {
                        $("#empName_add_input").next("span").text("用户名不合法");
                    }
                    if (undefined != result.exent.errorField.email) {
                        $("#empEmail_add_input").next("span").text("邮箱输入有误");
                    }

                }

            }
        });
    });

    //为编辑按钮绑定事件
    $(document).on("click", ".edit_btn", function () {
        //查询部门信息
        getDepts("#empUpdateModal select");
        //查询员工信息
        getEmp($(this).attr("edit_id"));
        $("#emp_update_btn").attr("edit_id", $(this).attr("edit_id"));
        //显示模态框
        $("#empUpdateModal").modal({
            backdrop: "static"
        });

    });
    //为删除按钮绑定事件
    $(document).on("click", ".delete_btn", function () {
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        var empId = $(this).attr("delete_id");
        if (confirm("确认删除【" + empName + "】吗？")) {
            $.ajax({
                url: "${APP_PATH}/emp/" + empId,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });

    //查询员工信息
    function getEmp(id) {
        $.ajax({
            // 编写json格式，设置属性和值
            url: "${APP_PATH}/emp/" + id,
            type: "GET",
            success: function (result) {
                var empDate = result.exent.emp;
                $("#empName_update_static").text(empDate.empName);
                $("#email_update_input").val(empDate.email);
                $("#empUpdateModal input[name=gender]").val([empDate.gender]);
                $("#dept_update_select").val([empDate.dId]);
            }
        });
    }

    //点击更新 更新员工信息
    $("#emp_update_btn").click(function () {
        $.ajax({
            url: "${APP_PATH}/emp/" + $(this).attr("edit_id"),
            type: "PUT",
            data: $("#empUpdateModal form").serialize(),
            success: function (result) {
                if (result.code == 100) {
                    //保存成功 关闭模态框
                    $("#empUpdateModal").modal('hide');
                    //跳转到本页
                    to_page(currentPage);
                }
            }
        });
    });

    //删除全选
    $("#check_all").click(function () {
        $(".check_item").prop("checked", $(this).prop("checked"));
    });
    //判断全点满的时候 最上面的也选中
    $(document).on("click",".check_item",function () {
       var flag=$(".check_item:checked").length==$(".check_item").length;
           $("#check_all").prop("checked",flag);

    })
    //批量删除
    $("#emp_del_modal_btn").click(function () {
        var empNames="";
        var del_idstr="";
       $.each($(".check_item:checked"),function () {
           empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
           del_idstr+=$(this).parents("tr").find("td:eq(1)").text()+"-";
       })
        empNames=empNames.substring(0,empNames.length-1);
        del_idstr=del_idstr.substring(0,del_idstr.length-1);
        if (confirm("确认删除【" + empNames + "】吗？")) {
            $.ajax({
                url: "${APP_PATH}/emp/" + del_idstr,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });
</script>
</body>
</html>
