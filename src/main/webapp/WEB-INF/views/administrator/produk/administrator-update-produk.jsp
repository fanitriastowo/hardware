<%@ page
        language="java"
        contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/template/administrator/administrator-taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

   <%@ include file="/WEB-INF/template/administrator/administrator-css.jsp" %>
   <title>Update Produk | Hardware IT Solution</title>

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
         <li><a href="#">Produk</a></li>
         <li class="active">Update Produk</li>
      </ul>
      <!-- .breadcrumb -->

      <!-- content title -->
      <div class="page-title">
         <h2>
            <span class="fa fa-arrow-circle-o-left"></span> Update Produk
         </h2>
      </div>
      <!-- .page-title -->

      <!-- content -->
      <div class="page-content-wrap">
         <div class="row">
            <div class="col-md-12">

               <c:if test="${success == false }">
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
                     <strong>Oppssss.. Gagal Mengupdate</strong>
                  </div>
               </c:if>

               <form:form
                       modelAttribute="produk"
                       action="${pageContext.request.contextPath }/administrator/produk/update_post"
                       cssClass="form-horizontal"
                       method="post"
                       enctype="multipart/form-data">

                  <div class="panel panel-default">
                     <div class="panel-heading">
                        <h3 class="panel-title">Update Produk</h3>
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
                           <label class="col-md-3 col-xs-12 control-label">Kategori</label>
                           <div class="col-md-6 col-xs-12">
                              <form:select
                                      path="kategori"
                                      cssClass="form-control select"
                                      data-live-search="true">
                                 <form:options
                                         items="${kategoriList }"
                                         itemValue="nama"
                                         itemLabel="nama"/>
                              </form:select>
                           </div>
                        </div>

                        <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Brands</label>
                           <div class="col-md-6 col-xs-12">
                              <form:select
                                      path="brand"
                                      cssClass="form-control select"
                                      data-live-search="true">
                                 <form:options
                                         items="${brandList }"
                                         itemValue="nama"
                                         itemLabel="nama"/>
                              </form:select>
                           </div>
                        </div>

                        <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Harga</label>
                           <div class="col-md-6 col-xs-12">
                              <div class="input-group">
                                 <span class="input-group-addon"><span
                                         class="fa fa-usd"></span></span>
                                 <form:input
                                         path="harga"
                                         cssClass="validate[required,custom[integer],min[1]] form-control"
                                         placeholder="Inputkan harga produk"/>
                              </div>
                           </div>
                        </div>

                        <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Detail Produk</label>
                           <div class="col-md-6 col-xs-12">
                              <form:textarea
                                      path="detailProduk"
                                      cssClass="form-control"
                                      cols="5"
                                      placeholder="Inputkan detail produk"/>
                           </div>
                        </div>

                        <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Deskripsi</label>
                           <div class="col-md-6 col-xs-12">
                              <form:textarea
                                      path="deskripsi"
                                      cssClass="form-control"
                                      cols="5"
                                      placeholder="Inputkan deskripsi lengkap produk"/>
                           </div>
                        </div>

                        <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Stok</label>
                           <div class="col-md-6 col-xs-12">
                              <div class="input-group">
                                 <span class="input-group-addon"><span
                                         class="fa fa-sort-numeric-asc"></span></span>
                                 <form:input
                                         path="stok"
                                         cssClass="validate[required,custom[integer],min[1]] form-control"
                                         placeholder="Inputkan stok produk"/>
                              </div>
                           </div>
                        </div>

                        <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Spesifikasi</label>
                           <div class="col-md-6 col-xs-12">
                              <form:textarea
                                      cols="5"
                                      path="spesifikasi"
                                      cssClass="form-control"
                                      placeholder="Inputkan spesifikasi lengkap produk"/>
                           </div>
                        </div>

                        <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Image</label>
                           <div class="col-md-6 col-xs-12">
                              <form:input
                                      type="file"
                                      path="filename"
                                      cssClass="fileinput btn-primary"
                                      title="Browse file"
                                      accept="image/x-png, image/gif, image/jpeg"/>
                           </div>
                        </div>

                     </div>
                     <div class="panel-footer">
                        <button class="btn btn-default">Clear Form</button>
                        <button
                                type="submit"
                                class="btn btn-primary pull-right">Update
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
        src='<spring:url value="/assets/administrator/js/plugins/bootstrap/bootstrap-datepicker.js" />'></script>
<script
        type="text/javascript"
        src='<spring:url value="/assets/administrator/js/plugins/bootstrap/bootstrap-file-input.js" />'></script>
<script
        type="text/javascript"
        src='<spring:url value="/assets/administrator/js/plugins/bootstrap/bootstrap-select.js" />'></script>
<script
        type="text/javascript"
        src='<spring:url value="/assets/administrator/js/plugins/tagsinput/jquery.tagsinput.min.js" />'></script>
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
      $('#sidebar-produk').addClass('active');
   });
</script>
</body>
</html>