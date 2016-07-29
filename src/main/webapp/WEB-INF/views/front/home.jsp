<%@ page
   language="java"
   contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/template/front/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/template/front/css.jsp"%>

<title>Welcome | Hardware IT Solution</title>

</head>
<body>

   <%@ include file="/WEB-INF/template/front/navbar.jsp"%>

   <section
      id="portfolio"
      class="container">
      <p><strong>Promo:</strong></p>
      <ul class="portfolio-items col-4">
         <c:forEach
            items="${produks }"
            var="produk">

            <li class="portfolio-item">
               <div class="item-inner">

                  <c:choose>
                     <c:when test="${produk.image ne null}">
                        <img
                           alt="Image"
                           src='<spring:url value="/assets/images/produk/${produk.image }" />'
                           class="img-rounded">
                        <p class="text-center">
                           <strong><c:out value="${produk.nama}" /> </strong><br />
                           Rp. <fmt:formatNumber value="${produk.harga}" type="NUMBER" />
                        </p>
                        <div class="overlay">
                           <a
                              class="preview btn btn-danger"
                              href='<spring:url value="/${produk.id }" />'><i class="fa fa-eye"></i></a>
                        </div>
                     </c:when>
                     <c:otherwise>
                        <img
                           alt="Image"
                           src='<spring:url value="/assets/front/images/blank.jpg" />'
                           class="img-rounded">
                        <p class="text-center">
                           <c:out value="${produk.nama}" /> <br/>
                           Rp. <fmt:formatNumber value="${produk.harga}" type="NUMBER" />
                        </p>
                        <div class="overlay">
                           <a
                              class="preview btn btn-danger"
                              href='<spring:url value="/${produk.id }" />'><i class="fa fa-eye"></i></a>
                        </div>
                     </c:otherwise>
                  </c:choose>

               </div>
            </li>

         </c:forEach>

      </ul>
   </section>

   <%@ include file="/WEB-INF/template/front/footer.jsp"%>
   <%@ include file="/WEB-INF/template/front/js.jsp"%>
</body>
</html>