<%@ page
   language="java"
   contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/front/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/template/front/css.jsp"%>
<link
   rel="stylesheet"
   href='<spring:url value="/assets/front/css/magnifier.css" />'>
<title><c:out value="${detailProduk.nama }" /></title>

</head>
<body>

   <%@ include file="/WEB-INF/template/front/navbar.jsp"%>

   <section>
      <div class="container">
         <div class="row">

            <div class="col-sm-6">

               <c:choose>
                  <c:when test="${detailProduk.image ne null}">

                     <a
                        class="magnifier-thumb-wrapper"
                        href="#"> 
                        <img
                           alt="Image"
                           id="thumb"
                           src='<spring:url value="/uploads/${detailProduk.image }" />'
                           class="img-rounded"
                           width="500px">
                     </a>
                     <br>
                     <br>
                     <div class="col-sm-offset-2">
                        <form:form
                           commandName="produkKeranjang"
                           cssClass="form-inline"
                           action="${pageContext.request.contextPath }/simpan_ke_keranjang/${detailProduk.id }">
                           <div class="form-group">
                              <div class="col-sm-4">
                                 <form:input
                                    path="jumlahBarang"
                                    cssClass="form-control" />
                              </div>
                              <input
                                 type="submit"
                                 value="Masuk ke keranjang"
                                 class="btn btn-primary" />
                           </div>
                        </form:form>
                     </div>
                  </c:when>
                  <c:otherwise>
                     <img
                        alt="Image"
                        src='<spring:url value="/assets/front/images/blank.jpg" />'
                        class="img-rounded"
                        width="500px">
                     <br>
                     <br>
                     <div class="col-sm-offset-2">
                        <form:form
                           commandName="produkKeranjang"
                           cssClass="form-inline"
                           action="${pageContext.request.contextPath }/simpan_ke_keranjang/${detailProduk.id }">
                           <div class="form-group">
                              <div class="col-sm-4">
                                 <form:input
                                    path="jumlahBarang"
                                    cssClass="form-control" />
                              </div>
                              <input
                                 type="submit"
                                 value="Masuk ke keranjang"
                                 class="btn btn-primary" />
                           </div>
                        </form:form>
                     </div>
                  </c:otherwise>
               </c:choose>

            </div>

            <div class="col-sm-6">

               <table class="table">
                  <thead>
                     <tr>
                        <th>Nama</th>
                        <th>Harga</th>
                        <th>Terjual</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td><c:out value="${detailProduk.nama }" /></td>
                        <td>Rp. <fmt:formatNumber
                              value="${detailProduk.harga }"
                              type="NUMBER" />
                        </td>
                        <td><c:out value="${detailProduk.jumlahTerbeli }" /></td>
                     </tr>
                  </tbody>
               </table>

               <hr>

               <div
                  class="panel-group"
                  id="accordion"
                  role="tablist"
                  aria-multiselectable="true">

                  <div class="panel panel-default">
                     <div
                        class="panel-heading"
                        role="tab"
                        id="deskripsi-produk">
                        <h4 class="panel-title">
                           <a
                              data-toggle="collapse"
                              data-parent="#accordion"
                              href="#deskripsi_produk"
                              aria-expanded="false"
                              aria-controls="deskripsi_produk">+ Deskripsi Produk</a>
                        </h4>
                     </div>
                     <div
                        id="deskripsi_produk"
                        class="panel-collapse collapse"
                        role="tabpanel"
                        aria-labelledby="deskripsi-produk">
                        <div class="panel-body">
                           <c:out value="${detailProduk.deskripsi}" />
                        </div>
                     </div>
                  </div>

                  <div class="panel panel-default">
                     <div
                        class="panel-heading"
                        role="tab"
                        id="detail-produk">
                        <h4 class="panel-title">
                           <a
                              data-toggle="collapse"
                              data-parent="#accordion"
                              href="#detail_produk"
                              aria-expanded="false"
                              aria-controls="detail_produk">+ Detail Produk</a>
                        </h4>
                     </div>
                     <div
                        id="detail_produk"
                        class="panel-collapse collapse"
                        role="tabpanel"
                        aria-labelledby="detail-produk">
                        <div class="panel-body">
                           <c:out value="${detailProduk.detailProduk}" />
                        </div>
                     </div>
                  </div>

                  <div class="panel panel-default">
                     <div
                        class="panel-heading"
                        role="tab"
                        id="spesifikasi-produk">
                        <h4 class="panel-title">
                           <a
                              data-toggle="collapse"
                              data-parent="#accordion"
                              href="#spesifikasi_produk"
                              aria-expanded="false"
                              aria-controls="spesifikasi_produk">+ Spesifikasi Produk</a>
                        </h4>
                     </div>
                     <div
                        id="spesifikasi_produk"
                        class="panel-collapse collapse"
                        role="tabpanel"
                        aria-labelledby="spesifikasi-produk">
                        <div class="panel-body">
                           <c:out value="${detailProduk.spesifikasi}" />
                        </div>
                     </div>
                  </div>
               </div>
            </div>

         </div>
      </div>
   </section>

   <%@ include file="/WEB-INF/template/front/footer.jsp"%>
   <%@ include file="/WEB-INF/template/front/js.jsp"%>
   <script
      type="text/javascript"
      src='<spring:url value="/assets/front/js/bootstrap.touchspin.js" />'></script>
   <script
      type="text/javascript"
      src='<spring:url value="/assets/front/js/Event.js" />'></script>
   <script
      type="text/javascript"
      src='<spring:url value="/assets/front/js/Magnifier.js" />'></script>

   <script type="text/javascript">
       $(document).ready(function() {
            $('#jumlahBarang').TouchSpin({
                min : 1,
                max : 5,
                stepinterval : 50
            });

            var evt = new Event(), 
            m = new Magnifier(evt);
            m.attach({
                thumb : '#thumb',
                large : $("#thumb").attr("src"),
                mode : 'inside',
                zoom : 2
            });
        });
   </script>
</body>
</html>