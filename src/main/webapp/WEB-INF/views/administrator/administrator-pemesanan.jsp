<%@ page
   language="java"
   contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include 
   file="/WEB-INF/template/administrator/administrator-taglib.jsp"%>
<%@ taglib
   uri="http://java.sun.com/jsp/jstl/fmt"
   prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/template/administrator/administrator-css.jsp"%>
<title>Pemesanan | Hardware IT Solution</title>

</head>
<body>

   <div class="page-container">

      <!-- sidebar -->
      <%@ include file="/WEB-INF/template/administrator/administrator-sidebar.jsp"%>

      <div class="page-content">

         <!-- horizontal navigation -->
         <%@ include file="/WEB-INF/template/administrator/administrator-horizontal-nav.jsp"%>

         <!-- breadcrumb -->
         <ul class="breadcrumb">
            <li class="active">Pemesanan</li>
         </ul>
         <!-- .breadcrumb -->

         <!-- content title -->
         <div class="page-title">
            <h2>
               <span class="fa fa-arrow-circle-o-left"></span> Pemesanan
            </h2>
         </div>
         <!-- .page-title -->

         <!-- content -->
         <div class="page-content-wrap">
            <div class="row">
               <div class="col-md-12">
                  <div class="panel panel-default">
                     <div class="panel-heading">
                        <h3 class="panel-title">Pemesanan hari ini</h3>
                        <a href='<spring:url value="/administrator/pemesanan/cetak_analisa_pasar" />'
                           class="pull-right btn btn-info btn-sm">
                           <span class="fa fa-print"></span>Cetak Analisa Pasar
                        </a>
                     </div>
                     <div class="panel-body">
                        <table class="table table-hover">
                           <thead>
                              <tr>
                                 <th>#</th>
                                 <th>Tanggal</th>
                                 <th>ID</th>
                                 <th>Nama</th>
                                 <th>Kota</th>
                                 <th>Email</th>
                                 <th width="8%">Total Items</th>
                                 <th>Total Harga</th>
                                 <th>Transfer?</th>
                                 <th>Action</th>
                              </tr>
                           </thead>
                           <tbody>

                              <c:forEach
                                 items="${pemesanans }"
                                 var="pemesanan"
                                 varStatus="index">
                                 <tr>
                                    <td><c:out value="${index.count }" /></td>
                                    <td><c:out value="${pemesanan.tanggalPemesanan }" /></td>
                                    <td><c:out value="${pemesanan.pemesananId }" /></td>
                                    <td><c:out value="${pemesanan.namaPenerima }" /></td>
                                    <td><c:out value="${pemesanan.kabupaten }" /></td>
                                    <td><c:out value="${pemesanan.userEntity.username }" /></td>
                                    <td class="text-center"><c:out value="${pemesanan.jumlahItems }" /></td>
                                    <td>Rp. <fmt:formatNumber
                                             value="${pemesanan.totalHarga }"
                                             type="number" />
                                    </td>
                                    <td><c:choose>
                                          <c:when test="${pemesanan.transfer }">
                                             <label class="label label-success">Sudah</label>
                                          </c:when>
                                          <c:otherwise>
                                             <label class="label label-danger">Belum</label>
                                          </c:otherwise>
                                       </c:choose></td>
                                    <td>
                                       <a
                                          href='<spring:url value="/administrator/pemesanan/ubah_status_transfer/${pemesanan.id}" />'
                                          title="Ubah Status Pemesanan"
                                          class="btn btn-success btn-rounded btn-sm"><span class="fa fa-pencil"></span>
                                       </a>
                                       <a
                                          href='<spring:url value="/administrator/pemesanan/cetak/${pemesanan.id}" />'
                                          title="Lihat Detail Pemesanan"
                                          class="btn btn-info btn-rounded btn-sm"><span class="fa fa-search"></span>
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
      <!-- .page-content -->

   </div>
   <!-- .page-container -->

   <%@ include file="/WEB-INF/template/administrator/administrator-js.jsp"%>

   <script type="text/javascript">
       $(document).ready(function() {
           $('#sidebar-pemesanan').addClass('active');
       });
   </script>
</body>
</html>