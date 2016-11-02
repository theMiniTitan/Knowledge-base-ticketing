<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
  Created by IntelliJ IDEA.s
  User: Jack Newley
  Date: 10/20/2016
  Time: 7:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="Models.User" scope="session"/>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">UoN IT Services</a>
        </div>
        <div id="navbar" class ="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="ReportIssue">Report Issue</a></li>
                <li><a href="KnowledgeBase">Knowledge Base</a></li>
                <c:choose>
                    <c:when test="${user.isStaff()}">
                        <li><a href="ReportedIssues">View Reported Issues</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="ReportedIssues">View Current Issues</a></li>
                    </c:otherwise>
                </c:choose>
                <li><a href="index.jsp">Logout</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>