<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Prog.kiev.ua</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
    <h3><img height="50" width="55" src="<c:url value="/static/logo.png"/>"/><a href="/">Contacts List</a></h3>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul id="groupList" class="nav navbar-nav">
                    <li><button type="button" id="add_contact" class="btn btn-default navbar-btn">Add Contact</button></li>
                    <li><button type="button" id="add_group" class="btn btn-default navbar-btn">Add Group</button></li>
                    <li><button type="button" id="contacts" class="btn btn-default navbar-btn">All Contacts</button></li>
                    <li><button type="button" id="delete_groups" class="btn btn-default navbar-btn">Delete Groups</button></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

    <table class="table table-striped">
        <thead>
        <tr>
            <td></td>
            <td><b>Id</b></td>
            <td><b>Name</b></td>
        </tr>
        </thead>
        <c:forEach items="${groups}" var="group">
            <tr>
                <td><input type="checkbox" name="toDeleteGroup[]" value="${group.id}" id="checkbox_${group.id}"/></td>
                <td>${group.id}</td>
                <td>${group.name}</td>
            </tr>
        </c:forEach>
    </table>
    </div>

<script>
    $('#add_contact').click(function(){
        window.location.href='/contact_add_page';
    });
    $('#add_group').click(function(){
        window.location.href='/group_add_page';
    });
    $('#contacts').click(function () {
        window.location.href='/';
    })
    $('#delete_groups').click(function(){
        var data = { 'toDeleteGroup[]' : []};
        $(":checked").each(function() {
            data['toDeleteGroup[]'].push($(this).val());
        });
        $.post("/group/delete", data, function(data, status) {
            window.location.reload();
        });
    });
</script>
</body>
</html>