<%@ page
        language="java"
        contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/template/front/taglib.jsp" %>
<%@ taglib
        uri="http://java.sun.com/jsp/jstl/fmt"
        prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

   <%@ include file="/WEB-INF/template/front/css.jsp" %>

   <title>Keranjang | Hardware IT Solution</title>

</head>
<body>

<%@ include file="/WEB-INF/template/front/navbar.jsp" %>

<section>
   <div class="container">
      <div class="row">

         <table
                 class="table table-hovered table-striped table-condensed"
                 style="font-size: 0.9em">
            <thead>
            <tr>
               <th width="3%">#</th>
               <th>Nama</th>
               <th>Harga Satuan</th>
               <th width="27%">Jumlah Barang</th>
               <th>Total Harga Per Item</th>
               <th width="5%">Aksi</th>
            </tr>
            </thead>
            <tbody>

            <c:set
                    var="jumlahBarangTerbeli"
                    value="0"/>
            <c:set
                    var="totalHargaDibayar"
                    value="0"/>
            <c:forEach
                    items="${produk_keranjang }"
                    var="produkKeranjang"
                    varStatus="index">
               <tr>
                  <td><c:out value="${index.count }"/></td>
                  <td><c:out value="${produkKeranjang.value.nama }"/></td>
                  <td>Rp. <fmt:formatNumber
                          value="${produkKeranjang.value.harga }"
                          type="number"/></td>
                  <td>
                     <form:form
                             commandName="produkKeranjang"
                             cssClass="form-inline"
                             role="form"
                             action="${pageContext.request.contextPath }/ubah_jumlah_barang/${produkKeranjang.key }">
                        <div class="form-group">
                           <div class="col-sm-5">
                              <form:input
                                      path="jumlahBarang"
                                      cssClass="form-control spinner"
                                      value="${produkKeranjang.value.jumlahBarang }"/>
                           </div>
                           <div class="col-sm-1">
                              <input
                                      type="submit"
                                      value="Ok"
                                      class="btn btn-success"/>
                           </div>
                        </div>
                     </form:form>
                  </td>
                  <td>Rp. <fmt:formatNumber
                          value="${produkKeranjang.value.totalHarga }"
                          type="number"/>
                  </td>
                  <td>
                     <a
                             class="btn btn-danger btn-xs"
                             href='<spring:url value="/hapus_item_keranjang/${produkKeranjang.key}" />'
                             title="Hapus Produk di dalam keranjang"> <span
                             class="fa fa-times"></span>
                     </a>
                  </td>
               </tr>
               <c:set
                       var="jumlahBarangTerbeli"
                       value="${jumlahBarangTerbeli + produkKeranjang.value.jumlahBarang }"/>
               <c:set
                       var="totalHargaDibayar"
                       value="${totalHargaDibayar + produkKeranjang.value.totalHarga }"/>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr class="info">
               <th width="3%"></th>
               <th></th>
               <th></th>
               <th>Total: <c:out value="${jumlahBarangTerbeli }"/> Items</th>
               <th>Rp. <fmt:formatNumber
                       value="${totalHargaDibayar }"
                       type="number"/></th>
               <th width="5%">
                  <button
                          class="btn btn-xs btn-primary"
                          data-toggle="modal"
                          data-target="#checkout_modal">Checkout
                  </button>
               </th>
            </tr>
            </tfoot>
         </table>

      </div>
   </div>
</section>

<!-- Modal Checkout -->
<form:form
        action="${pageContext.request.contextPath }/checkout"
        commandName="pemesanan"
        method="post"
        cssClass="form-horizontal">
   <div
           class="modal fade"
           id="checkout_modal"
           tabindex="-1"
           role="dialog"
           aria-labelledby="myModalLabel">
      <div
              class="modal-dialog"
              role="document">
         <div class="modal-content">
            <div class="modal-header">
               <button
                       type="button"
                       class="close"
                       data-dismiss="modal"
                       aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
               <h4
                       class="modal-title"
                       id="myModalLabel">Inputkan Data Pengiriman</h4>
            </div>
            <div class="modal-body">
               <div class="form-group">
                  <div class="col-sm-12">
                     <form:input
                             path="nama"
                             cssClass="form-control"
                             placeholder="Nama Penerima"/>
                  </div>
               </div>
               <div class="form-group">
                  <div class="col-sm-12">
                     <form:input
                             path="phone"
                             cssClass="form-control"
                             placeholder="Telephone Penerima"/>
                  </div>
               </div>
               <div class="form-group">
                  <div class="col-sm-12">
                     <form:textarea
                             path="alamat"
                             cssClass="form-control"
                             placeholder="Alamat Penerima"
                             rows="2"
                             style="resize: none;"/>
                  </div>
               </div>
               <div class="form-group">
                  <div class="col-sm-12">
                     <form:select
                             path="kabupaten"
                             cssClass="form-control"
                             data-live-search="true">
                        <form:option value="banyumas">Banyumas</form:option>
                        <form:option value="purbalingga">Purbalingga</form:option>
                        <form:option value="banjarnegara">Banjarnegara</form:option>
                        <form:option value="purbalingga">Pemalang</form:option>
                        <form:option value="banyumas">Tegal</form:option>
                        <form:option value="banjarnegara">Bumiayu</form:option>
                        <form:option value="banjarnegara">Brebes</form:option>
                        <form:option value="banjarnegara">Kebumen</form:option>
                        <form:option value="banyumas">Cilacap</form:option>
                        <form:option value="purbalingga">Pekalongan</form:option>
                     </form:select>
                  </div>
               </div>
            </div>
            <div class="modal-footer">
               <button
                       type="button"
                       class="btn btn-default"
                       data-dismiss="modal">Close
               </button>
               <button
                       type="submit"
                       class="btn btn-primary">Checkout
               </button>
            </div>
         </div>
      </div>
   </div>
</form:form>

<%@ include file="/WEB-INF/template/front/footer.jsp" %>
<%@ include file="/WEB-INF/template/front/js.jsp" %>
<script
        type="text/javascript"
        src='<spring:url value="/assets/front/js/bootstrap.touchspin.js" />'></script>

<script type="text/javascript">
   $(document).ready(function () {
      $(".spinner").TouchSpin({
         min: 1,
         max: 5,
         stepinterval: 50
      });

   });
</script>
</body>
</html>