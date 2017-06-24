<%@ page
        language="java"
        contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/template/administrator/administrator-taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

   <%@ include file="/WEB-INF/template/administrator/administrator-css.jsp" %>
   <title>Daftar Kategori | Hardware IT Solution</title>

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
         <li class="active">Daftar Kategori</li>
      </ul>
      <!-- .breadcrumb -->

      <!-- content title -->
      <div class="page-title">
         <h2>
            <span class="fa fa-arrow-circle-o-left"></span> Daftar Kategori
         </h2>
      </div>
      <!-- .page-title -->

      <!-- content -->
      <div class="page-content-wrap">
         <div class="row">
            <div class="col-md-12">

               <div class="panel panel-default">
                  <div class="panel-heading">
                     <h3 class="panel-title">Daftar Kategori</h3>
                  </div>
                  <div class="panel-body">
                     <table class="table table-hover">
                        <thead>
                        <tr>
                           <th width="3%">#</th>
                           <th width="10%">Nama</th>
                           <th width="77%">Deskripsi</th>
                           <th width="10%">Action</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach
                                items="${kategoriList }"
                                var="kategori"
                                varStatus="index">
                           <tr>
                              <td>${index.count }.</td>
                              <td>${kategori.nama }</td>
                              <td>${kategori.deskripsi }</td>
                              <td>

                                 <a
                                         class="btn btn-default btn-rounded btn-sm"
                                         href='<spring:url value="/administrator/kategori/prepare_update/${kategori.id }" />'>
                                    <span class="fa fa-pencil"></span>
                                 </a>

                                 <a
                                         class="btn btn-danger btn-rounded btn-sm triggerDelete"
                                         href='<spring:url value="/administrator/kategori/delete/${kategori.id }" />'>
                                    <span class="fa fa-times"></span>
                                 </a>

                              </td>
                           </tr>
                        </c:forEach>

                        </tbody>
                     </table>
                  </div>

               </div>
            </div>
         </div>
      </div>
      <!-- .page-content-wrap -->
   </div>

</div>

<!-- Modal Remove -->
<div class="modal fade" id="modalRemove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
               <span aria-hidden="true">&times;</span><span class="sr-only">Tutup</span>
            </button>
            <h4 class="modal-title" id="myModalLabel">Hapus Data</h4>
         </div>
         <div class="modal-body">
            <strong>Apakah Anda yakin akan menghapus? </strong>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">
               <span class="glyphicon glyphicon-remove-circle"></span> Batal
            </button>
            <a href="" class="btn btn-danger btnRemove">
               <span class="glyphicon glyphicon-ok-circle"></span> Delete</a>
         </div>
      </div>
   </div>
</div>

<%@ include file="/WEB-INF/template/administrator/administrator-js.jsp" %>

<script type="text/javascript">
   $(document).ready(function () {
      $('#sidebar-kategori').addClass('active');
      $('#sidebar-daftar-kategori').addClass('active');

      // tampilkan notifikasi sebelum menghapus
      $('.triggerDelete').click(function (e) {
         e.preventDefault();
         $('#modalRemove .btnRemove').attr("href", $(this).attr("href"));
         $('#modalRemove').modal();
      });
   });
</script>
</body>
</html>