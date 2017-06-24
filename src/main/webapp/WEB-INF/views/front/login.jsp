<%@ page
        language="java"
        contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/template/front/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

   <%@ include file="/WEB-INF/template/front/css.jsp" %>
   <link
           rel="stylesheet"
           href='<spring:url value="/assets/front/css/login.css" />'>
   <title>Login | Hardware IT Solution</title>

</head>
<body>
<section id="login">
   <div class="container">
      <div class="row">
         <div class="col-sm-6 col-md-4 col-md-offset-4">
            <a href='<spring:url value="/" />'> <img
                    class="img-rounded center-block"
                    src='<spring:url value="/assets/front/images/logo.png" />'
                    alt="Logo"
                    style="background: #34495e;">
            </a>
            <h1 class="text-center login-title">Login to continue Shopping</h1>
            <div class="account-wall">
               <img
                       class="profile-img"
                       src='<spring:url value="/assets/front/images/user-blank.jpg" />'
                       alt="User Avatar">

               <form
                       class="form-signin"
                       action='<spring:url value="/j_spring_security_check"/>'
                       method="post">

                  <input
                          type="email"
                          name="j_username"
                          class="form-control"
                          placeholder="Email"
                          required
                          autofocus>

                  <input
                          type="password"
                          name="j_password"
                          class="form-control"
                          placeholder="Password"
                          required>

                  <input
                          type="hidden"
                          name="${_csrf.parameterName}"
                          value="${_csrf.token}"/>

                  <button
                          class="btn btn-lg btn-primary btn-block"
                          type="submit">Sign in
                  </button>
                  <a
                          href='<spring:url value="/guide" />'
                          class="pull-right need-help">Need help?
                  </a><span class="clearfix"></span>
               </form>

            </div>
            <a
                    href='<spring:url value="/registration" />'
                    class="text-center new-account">Create an account </a><br>

            <c:if test="${fail == true }">
               <div
                       class="alert alert-danger alert-dismissible"
                       role="alert">
                  <button
                          type="button"
                          class="close"
                          data-dismiss="alert"
                          aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
                  <strong>Kombinasi tidak sesuai.</strong>
               </div>
            </c:if>

            <c:if test="${login == false }">
               <div
                       class="alert alert-danger alert-dismissible"
                       role="alert">
                  <button
                          type="button"
                          class="close"
                          data-dismiss="alert"
                          aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
                  <strong>Silahkan login terlebih dahulu.</strong>
               </div>
            </c:if>
            <c:if test="${confirm == false }">
               <div
                       class="alert alert-warning alert-dismissible"
                       role="alert">
                  <button
                          type="button"
                          class="close"
                          data-dismiss="alert"
                          aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
                  <strong>Silahkan click link pada Email yang telah kami kirimkan untuk
                     konfirmasi.</strong>
               </div>
            </c:if>

         </div>
      </div>
   </div>
</section>

<%@ include file="/WEB-INF/template/front/js.jsp" %>
<script type="text/javascript">
   $(document).ready(function () {
      $('#member').addClass('active');
   });
</script>
</body>
</html>