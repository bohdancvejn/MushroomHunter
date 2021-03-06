<%@ tag pageEncoding="utf-8" dynamic-attributes="dynattrs" trimDirectiveWhitespaces="true" %>
<%@ attribute name="title" required="false" %>
<%@ attribute name="head" fragment="true" %>
<%@ attribute name="body" fragment="true" required="true" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="${pageContext.request.locale}">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><c:out value="${title}"/></title>
  <!-- bootstrap loaded from content delivery network -->
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/default/node_modules/bootstrap/dist/css/bootstrap-theme.min.css"
        crossorigin="anonymous">
  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/default/node_modules/bootstrap/dist/css/bootstrap.min.css"
        crossorigin="anonymous">
  <jsp:invoke fragment="head"/>
</head>
<body>
<!-- navigation bar -->
<nav class="navbar navbar-default navbar-static-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
              aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${pageContext.request.contextPath}"><f:message key="navigation.project"/></a>
    </div>
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li><my:a href="/"><f:message key="navigation.home"/></my:a></li>


        <c:if test="${not empty sessionScope.user}">
          <c:if test="${sessionScope.user.admin}">
            <li><my:a href="/hunters/"><f:message key="navigation.admin.hunters"/></my:a></li>
          </c:if>

          <li><my:a href="/forests/"><f:message key="navigation.admin.forests"/></my:a></li>
          <li><my:a href="/mushrooms/"><f:message key="navigation.admin.mushrooms"/></my:a></li>
          <li><my:a href="/visits/"><f:message key="navigation.admin.visits"/></my:a></li>

        </c:if>

      </ul>

      <ul class="nav navbar-nav navbar-right">
        <c:if test="${not empty sessionScope.user}">
        <li class="dropdown" style="float: right">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><c:out value="${sessionScope.user.userNickname}"/><b
              class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><my:a href="/auth/logout"><f:message key="navigation.user.logout"/></my:a></li>
            <li><my:a href="/users/edit/${sessionScope.user.id}"><f:message key="navigation.user.edit"/></my:a></li>
          </ul>
          </c:if>
        </li>

        <c:if test="${empty sessionScope.user}">
          <li><my:a href="/auth"><f:message key="navigation.auth.login"/></my:a></li>
          <li><my:a href="/auth/register"><f:message key="navigation.auth.register"/></my:a></li>
        </c:if>

      </ul>

    </div><!--/.nav-collapse -->


  </div>
</nav>

<div class="container">

  <!-- page title -->
  <c:if test="${not empty title}">
    <div class="page-header">
      <h1><c:out value="${title}"/></h1>
    </div>
  </c:if>

  <!-- alerts -->
  <c:if test="${not empty alert_danger}">
    <div class="alert alert-danger" role="alert">
      <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
      <c:out value="${alert_danger}"/></div>
  </c:if>
  <c:if test="${not empty alert_info}">
    <div class="alert alert-info" role="alert"><c:out value="${alert_info}"/></div>
  </c:if>
  <c:if test="${not empty alert_success}">
    <div class="alert alert-success" role="alert"><c:out value="${alert_success}"/></div>
  </c:if>
  <c:if test="${not empty alert_warning}">
    <div class="alert alert-warning" role="alert"><c:out value="${alert_warning}"/></div>
  </c:if>

  <!-- page body -->
  <jsp:invoke fragment="body"/>

  <!-- footer -->
  <footer class="footer" style="position:absolute; bottom:1px">
    <p>&copy;&nbsp;<%=java.time.Year.now().toString()%>&nbsp;Masaryk University</p>
  </footer>
  <script src="${pageContext.request.contextPath}/resources/default/node_modules/jquery/dist/jquery.min.js"></script>
  <script
      src="${pageContext.request.contextPath}/resources/default/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</div>
</body>
</html>