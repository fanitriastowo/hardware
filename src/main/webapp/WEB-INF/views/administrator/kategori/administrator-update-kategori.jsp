<%@ page
        language="java"
        contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/template/administrator/administrator-taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

   <%@ include file="/WEB-INF/template/administrator/administrator-css.jsp" %>
   <title>Update Kategori | Hardware IT Solution</title>

</head>
<body>

<div class="page-container">

   <!-- sidebar -->
   <%@ include file="/WEB-INF/template/administrator/administrator-sidebar.jsp" %>

   <div class="page-content">

      <!-- horizontal navigation -->
      <%@ include file="/WEB-INF/template/administrator/administrator-horizontal-nav.jsp" %>

      <!-- breadcrumb -->
      <ul class="breadcrumb">
         <li><a href="#">Kategori</a></li>
         <li class="active">Update Kategori</li>
      </ul>
      <!-- .breadcrumb -->

      <!-- content title -->
      <div class="page-title">
         <h2>
            <span class="fa fa-arrow-circle-o-left"></span> Update Kategori
         </h2>
      </div>
      <!-- .page-title -->

      <!-- content -->
      <div class="page-content-wrap">
         <div class="row">
            <div class="col-md-12">

               <!-- form -->
               <form:form
                       commandName="kategori"
                       action="${pageContext.request.contextPath }/administrator/kategori/update"
                       cssClass="form-horizontal"
                       method="post">
                  <form:hidden path="id"/>
                  <div class="panel panel-default">
                     <div class="panel-heading">
                        <h3 class="panel-title">Update Kategori</h3>
                     </div>
                     <div class="panel-body">

                        <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Nama</label>
                           <div class="col-md-6 col-xs-12">
                              <div class="input-group">
                                 <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                 <form:input
                                         path="nama"
                                         cssClass="validate[required,minlength[3]] form-control"
                                         placeholder="Inputkan nama produk"/>
                              </div>
                           </div>
                        </div>

                        <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Deskripsi</label>
                           <div class="col-md-6 col-xs-12">
                              <form:textarea
                                      path="deskripsi"
                                      cssClass="form-control"
                                      rows="5"
                                      placeholder="Inputkan deskripsi kategori"/>
                           </div>
                        </div>

                     </div>
                     <div class="panel-footer">
                        <button class="btn btn-default">Clear Form</button>
                        <button
                                type="submit"
                                class="btn btn-primary pull-right">Simpan
                        </button>
                     </div>
                  </div>
               </form:form>
            </div>
         </div>
      </div>
      <!-- .page-content-wrap -->

   </div>
   <!-- .page-content -->

</div>
<!-- .page-container -->

<%@ include file="/WEB-INF/template/administrator/administrator-js.jsp" %>
<script
        type="text/javascript"
        src='<spring:url value="/assets/administrator/js/plugins/validationengine/languages/jquery.validationEngine-id.js" />'></script>
<script
        type="text/javascript"
        src='<spring:url value="/assets/administrator/js/plugins/validationengine/jquery.validationEngine.js" />'></script>
<script
        type="text/javascript"
        src='<spring:url value="/assets/administrator/js/plugins/jquery-validation/jquery.validate.js" />'></script>
<script
        type="text/javascript"
        src='<spring:url value="/assets/administrator/js/plugins/maskedinput/jquery.maskedinput.min.js" />'></script>

<script type="text/javascript">
   $(document).ready(function () {
      $('#sidebar-kategori').addClass('active');
   });
</script>
</body>
</html>