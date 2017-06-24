<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/template/administrator/administrator-taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

   <%@ include file="/WEB-INF/template/administrator/administrator-css.jsp" %>
   <title>Tambah Member | Hardware IT Solution</title>

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
         <li><a href="#">Member</a></li>
         <li class="active">Tambah Member</li>
      </ul> <!-- .breadcrumb -->

      <!-- content title -->
      <div class="page-title">
         <h2><span class="fa fa-arrow-circle-o-left"></span> Tambah Member</h2>
      </div> <!-- .page-title -->

      <!-- content -->
      <div class="page-content-wrap">
         <div class="row">
            <div class="col-md-12">

               <!-- form -->
               <form:form commandName="member"
                          action="${pageContext.request.contextPath }/administrator/member/tambah_post"
                          cssClass="form-horizontal">
                  <div class="panel panel-default">
                     <div class="panel-heading">
                        <h3 class="panel-title">Tambah Member</h3>
                     </div>
                     <div class="panel-body">

                        <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Nama Lengkap</label>
                           <div class="col-md-6 col-xs-12">
                              <div class="input-group">
                                 <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                 <form:input path="nama" cssClass="form-control"
                                             placeholder="Nama Lengkap"/>
                              </div>
                           </div>
                        </div>

                        <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Tanggal Lahir</label>
                           <div class="col-md-6 col-xs-12">

                              <div class="col-md-2">
                                 <form:select path="tanggal" cssClass="form-control select">
                                    <form:option value="1">1</form:option>
                                    <form:option value="2">2</form:option>
                                    <form:option value="3">3</form:option>
                                    <form:option value="4">4</form:option>
                                    <form:option value="5">5</form:option>
                                    <form:option value="6">6</form:option>
                                    <form:option value="7">7</form:option>
                                    <form:option value="8">8</form:option>
                                    <form:option value="9">9</form:option>
                                    <form:option value="10">10</form:option>
                                    <form:option value="11">11</form:option>
                                    <form:option value="12">12</form:option>
                                    <form:option value="13">13</form:option>
                                    <form:option value="14">14</form:option>
                                    <form:option value="15">15</form:option>
                                    <form:option value="16">16</form:option>
                                    <form:option value="17">17</form:option>
                                    <form:option value="18">18</form:option>
                                    <form:option value="19">19</form:option>
                                    <form:option value="20">20</form:option>
                                    <form:option value="21">21</form:option>
                                    <form:option value="22">22</form:option>
                                    <form:option value="23">23</form:option>
                                    <form:option value="24">24</form:option>
                                    <form:option value="25">25</form:option>
                                    <form:option value="26">26</form:option>
                                    <form:option value="27">27</form:option>
                                    <form:option value="28">28</form:option>
                                    <form:option value="29">29</form:option>
                                    <form:option value="30">30</form:option>
                                    <form:option value="31">31</form:option>
                                 </form:select>
                              </div>

                              <div class="col-md-4">
                                 <form:select path="bulan" cssClass="form-control select">
                                    <form:option value="1">Januari</form:option>
                                    <form:option value="2">Februari</form:option>
                                    <form:option value="3">Maret</form:option>
                                    <form:option value="4">April</form:option>
                                    <form:option value="5">Mei</form:option>
                                    <form:option value="6">Juni</form:option>
                                    <form:option value="7">Juli</form:option>
                                    <form:option value="8">Agustus</form:option>
                                    <form:option value="9">September</form:option>
                                    <form:option value="10">Oktober</form:option>
                                    <form:option value="11">November</form:option>
                                    <form:option value="12">Desember</form:option>
                                 </form:select>
                              </div>

                              <div class="col-md-2">
                                 <form:select path="tahun" cssClass="form-control select">
                                    <form:option value="2001">2001</form:option>
                                    <form:option value="2000">2000</form:option>
                                    <form:option value="1999">1999</form:option>
                                    <form:option value="1998">1998</form:option>
                                    <form:option value="1997">1997</form:option>
                                    <form:option value="1996">1996</form:option>
                                    <form:option value="1995">1995</form:option>
                                    <form:option value="1994">1994</form:option>
                                    <form:option value="1993">1993</form:option>
                                    <form:option value="1992">1992</form:option>
                                    <form:option value="1991">1991</form:option>
                                    <form:option value="1990">1990</form:option>
                                    <form:option value="1989">1989</form:option>
                                    <form:option value="1988">1988</form:option>
                                    <form:option value="1987">1987</form:option>
                                    <form:option value="1986">1986</form:option>
                                    <form:option value="1985">1985</form:option>
                                    <form:option value="1984">1984</form:option>
                                    <form:option value="1983">1983</form:option>
                                    <form:option value="1982">1982</form:option>
                                    <form:option value="1981">1981</form:option>
                                    <form:option value="1980">1980</form:option>
                                    <form:option value="1979">1979</form:option>
                                    <form:option value="1978">1978</form:option>
                                    <form:option value="1977">1977</form:option>
                                    <form:option value="1976">1976</form:option>
                                    <form:option value="1975">1975</form:option>
                                    <form:option value="1974">1974</form:option>
                                    <form:option value="1973">1973</form:option>
                                    <form:option value="1972">1972</form:option>
                                    <form:option value="1971">1971</form:option>
                                    <form:option value="1970">1970</form:option>
                                    <form:option value="1969">1969</form:option>
                                    <form:option value="1968">1968</form:option>
                                    <form:option value="1967">1967</form:option>
                                    <form:option value="1966">1966</form:option>
                                    <form:option value="1965">1965</form:option>
                                    <form:option value="1964">1964</form:option>
                                    <form:option value="1963">1963</form:option>
                                    <form:option value="1962">1962</form:option>
                                    <form:option value="1961">1961</form:option>
                                    <form:option value="1960">1960</form:option>
                                 </form:select>
                              </div>

                           </div>
                        </div>

                        <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Jenis Kelamin</label>
                           <div class="col-md-6 col-xs-12">
                              <div class="radio">
                                 <label>
                                    <form:radiobutton path="jenisKelamin" value="lakilaki"/>&nbsp;Laki-laki
                                 </label>
                              </div>
                              <div class="radio">
                                 <label>
                                    <form:radiobutton path="jenisKelamin" value="perempuan"/>&nbsp;Perempuan
                                 </label>
                              </div>
                           </div>
                        </div>

                        <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">No. Telepon</label>
                           <div class="col-md-6 col-xs-12">
                              <div class="input-group">
                                 <span class="input-group-addon"><span
                                         class="fa fa-phone"></span></span>
                                 <form:input path="phone" cssClass="form-control"
                                             placeholder="Nomor Telepon"/>
                              </div>
                           </div>
                        </div>

                        <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Email</label>
                           <div class="col-md-6 col-xs-12">
                              <div class="input-group">
                                 <span class="input-group-addon"><span
                                         class="fa fa-envelope"></span></span>
                                 <form:input path="username" type="email" cssClass="form-control"
                                             placeholder="Email"/>
                              </div>
                           </div>
                        </div>

                        <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Password</label>
                           <div class="col-md-6 col-xs-12">
                              <div class="input-group">
                                 <span class="input-group-addon"><span
                                         class="fa fa-lock"></span></span>
                                 <form:password path="password" cssClass="form-control"
                                                placeholder="Password"/>
                              </div>
                           </div>
                        </div>

                        <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Confirm Password</label>
                           <div class="col-md-6 col-xs-12">
                              <div class="input-group">
                                 <span class="input-group-addon"><span
                                         class="fa fa-lock"></span></span>
                                 <input type="password" class="form-control" id="confirm_password"
                                        name="confirm_password" placeholder="Confirm Password">
                              </div>
                           </div>
                        </div>

                     </div>
                     <div class="panel-footer">
                        <button class="btn btn-default">Clear Form</button>
                        <button type="submit" class="btn btn-primary pull-right">Simpan</button>
                     </div>
                  </div>
               </form:form>
            </div>
         </div>
      </div> <!-- .page-content-wrap -->

   </div> <!-- .page-content -->

</div> <!-- .page-container -->

<%@ include file="/WEB-INF/template/administrator/administrator-js.jsp" %>
<script type="text/javascript"
        src='<spring:url value="/assets/administrator/js/plugins/bootstrap/bootstrap-datepicker.js" />'></script>
<script type="text/javascript"
        src='<spring:url value="/assets/administrator/js/plugins/bootstrap/bootstrap-file-input.js" />'></script>
<script type="text/javascript"
        src='<spring:url value="/assets/administrator/js/plugins/bootstrap/bootstrap-select.js" />'></script>
<script type="text/javascript"
        src='<spring:url value="/assets/administrator/js/plugins/tagsinput/jquery.tagsinput.min.js" />'></script>

<script type="text/javascript">
   $(document).ready(function () {
      $('#sidebar-member').addClass('active');
      $('#sidebar-tambah-member').addClass('active');
   });
</script>
</body>
</html>