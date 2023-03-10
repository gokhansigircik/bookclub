<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/main.css" />
    <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>
    <!-- change to match your file/naming structure -->
  </head>
  <body>
    <div class="container" class="d-flex">
      <h1 style="color: rgb(8, 8, 16)">Welcome <c:out value="${user.userName}" />!</h1>
      <p>This is your dashboard.</p>
      <a href="/logout">Logout</a>
      <a href="/books/new">+ Add to my shelf</a>



      <div class="container">
          <table class="table table-bordered">
            <thead class="table-info">
              <tr>
                <th scope="col">Id</th>
                <th scope="col">Title</th>
                  <th scope="col">Author</th>
                  <th scope="col">Posted by</th>
                  <th scope="col">Delete</th>
                  <th scope="col">Edit</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="book" items="${books}">
                <tr class="table-secondary">
                <td scope="row">${book.id}</td>
                <td scope="row"><a href="/books/${book.id}">${book.title}</a></td>
                <td scope="row">${book.author}</td>
                <td scope="row">${book.user.userName}</td>
              <!-- this can be a good logic for employees -->
                <c:if test="${book.getUser().getId() == user.getId()}">
                <td>
                <form action="/books/delete/${book.id}" method="post">
                  <input type="hidden" name="_method" value="delete">
                  <input type="submit" value="Delete">    
                </input>  
              </td>
              <td><a href="/books/edit/${book.id}">Edit</a></td>
            </c:if>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>

    </div>
  </body>
</html>