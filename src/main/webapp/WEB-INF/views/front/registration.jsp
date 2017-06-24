<%@ page
        language="java"
        contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/template/front/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

   <%@ include file="/WEB-INF/template/front/css.jsp" %>
   <title>Registration | Hardware IT Solution</title>
   <link
           rel="stylesheet"
           href='<spring:url value="/assets/front/css/registration.css" />'>
</head>
<body>

<%@ include file="/WEB-INF/template/front/navbar.jsp" %>
<section id="registration">
   <div class="container">
      <div class="row">
         <h3 class="text-center">
            <strong>DAFTAR GRATIS DI IT-SOLUTION</strong>
         </h3>
         <p class="text-center">
            Sudah punya akun? Masuk <a href='<spring:url value="/login" />'>disini</a>
         </p>

         <div class="registration-panel">

            <div class="col-sm-offset-1 col-sm-4">
               <form:form
                       commandName="user"
                       cssClass="form-horizontal form-registrasi"
                       action="${pageContext.request.contextPath }/registration"
                       method="post">
                  <div class="form-group">
                     <label
                             class="sr-only"
                             for="name">Nama Lengkap</label>
                     <div class="input-group">
                        <div class="input-group-addon">
                           <i class="fa fa-user"></i>
                        </div>
                        <form:input
                                path="nama"
                                cssClass="form-control"
                                placeholder="Nama Lengkap"/>
                     </div>
                  </div>
                  <div class="form-group">
                     <label
                             class="sr-only"
                             for="phone">Nomor Telepon</label>
                     <div class="input-group">
                        <div class="input-group-addon">
                           <i class="fa fa-phone"></i>
                        </div>
                        <form:input
                                path="phone"
                                cssClass="form-control"
                                placeholder="Nomor Telepon"/>
                     </div>
                  </div>
                  <div class="form-group">
                     <label
                             class="sr-only"
                             for="email">Alamat Email</label>
                     <div class="input-group">
                        <div class="input-group-addon">
                           <i class="fa fa-envelope"></i>
                        </div>
                        <form:input
                                path="username"
                                type="email"
                                cssClass="form-control"
                                placeholder="Email"/>
                     </div>
                  </div>
                  <div class="form-group">
                     <label
                             class="sr-only"
                             for="password">Password</label>
                     <div class="input-group">
                        <div class="input-group-addon">
                           <i class="fa fa-lock"></i>
                        </div>
                        <form:input
                                path="password"
                                type="password"
                                cssClass="form-control"
                                placeholder="Password"/>
                     </div>
                  </div>
                  <div class="form-group">
                     <label
                             class="sr-only"
                             for="confirm_password">Confirm Password</label>
                     <div class="input-group">
                        <div class="input-group-addon">
                           <i class="fa fa-lock"></i>
                        </div>
                        <input
                                type="password"
                                class="form-control"
                                id="confirm_password"
                                name="confirm_password"
                                placeholder="Confirm Password">
                     </div>
                  </div>
                  <div class="form-group">
                     <label
                             class="text-muted"
                             for="tanggal_lahir">Tanggal Lahir</label>
                     <div class="form-inline">
                        <form:select
                                path="tanggal"
                                cssClass="form-control">
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
                        <form:select
                                path="bulan"
                                cssClass="form-control">
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
                        <form:select
                                path="tahun"
                                cssClass="form-control">
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
                  <div class="form-group">
                     <label
                             class="text-muted"
                             for="jenis_kelamin">Jenis Kelamin</label>
                     <div class="form-inline">
                        <label class="radio-inline"> <form:radiobutton
                                path="jenisKelamin"
                                value="lakilaki"/>&nbsp;Laki-laki
                        </label> <label class="radio-inline"> <form:radiobutton
                             path="jenisKelamin"
                             value="perempuan"/>&nbsp;Perempuan
                     </label>
                     </div>
                  </div>
                  <div class="form-group text-muted agree-statement">
                     <p>Dengan menekan Registrasi, saya mengkonfirmasi telah menyetujui Syarat dan
                        Ketentuan, serta Kebijakan Privasi IT
                        Solution.</p>
                  </div>
                  <div class="form-group">
                     <button
                             type="submit"
                             class="btn btn-primary btn-block">Register
                     </button>
                  </div>
               </form:form>
            </div>
            <!-- .col-sm-4 -->
            <div class="col-sm-2">
               <span class="line"></span>
            </div>
            <div class="col-sm-5">
               <strong>Syarat dan Ketentuan</strong>
               <hr>
               <p>Syarat &amp; ketentuan yang ditetapkan di bawah ini mengatur pemakaian jasa yang
                  ditawarkan oleh CV. IT Solution terkait
                  penggunaan situs www.hardware.itsolution.com. Pengguna disarankan membaca dengan
                  seksama karena dapat berdampak kepada hak dan
                  kewajiban Pengguna di bawah hukum.</p>
               <p>Dengan mendaftar dan/atau menggunakan situs www.hardware.itsolution.com, maka
                  pengguna dianggap telah membaca, mengerti,
                  memahami dan menyutujui semua isi dalam Syarat &amp; ketentuan. Syarat &amp;
                  ketentuan ini merupakan bentuk kesepakatan yang
                  dituangkan dalam sebuah perjanjian yang sah antara Pengguna dengan CV. IT
                  Solution. Jika pengguna tidak menyetujui salah satu,
                  sebagian, atau seluruh isi Syarat &amp; ketentuan, maka pengguna tidak
                  diperkenankan menggunakan layanan di
                  www.hardware.itsolution.com.</p>
            </div>
            <!-- .col-sm-5 -->
         </div>
         <!-- .registration-panel -->
      </div>
      <!-- .row -->
   </div>
   <!-- .container -->
</section>

<%@ include file="/WEB-INF/template/front/footer.jsp" %>
<%@ include file="/WEB-INF/template/front/js.jsp" %>
<script
        type="text/javascript"
        src='<spring:url value="/assets/front/js/jquery.validate.min.js" />'></script>

<script type="text/javascript">
   $(document).ready(function () {
      $('#member').addClass('active');

      $('.form-registrasi').validate({
         rules: {
            nama: {
               required: true,
               minlength: 3
            },
            phone: {
               required: true,
               min: 3,
               number: true
            },
            username: {
               required: true,
               email: true,
               remote: {
                  url: "<spring:url value='/registration/available' />",
                  type: "get",
                  data: {
                     username: function () {
                        return $("#username").val();
                     }
                  }
               }
            },
            password: {
               required: true,
               minlength: 3
            },
            confirm_password: {
               required: true,
               minlength: 3,
               equalTo: "#password"
            }
         },
         messages: {
            nama: {
               required: "Inputkan nama lengkap Anda",
               minlength: "Minimal 3 karakter"
            },
            phone: {
               required: "Inputkan nomor telepon Anda",
               min: "Minimal 10 karakter",
               number: "Input harus berupa nomor"
            },
            username: {
               required: "Username harus diisi",
               email: "Format username tidak valid, inputkan email dengan valid",
               remote: "Username tersebut sudah tersedia!"
            },
            password: {
               required: "Password harus diisi",
               minlength: "Minimal 3 karakter"
            },
            confirm_password: {
               required: "Confirm Password harus diisi",
               minlength: "Minimal 3 karakter",
               equalTo: "Confirm Password tidak sama dengan password"
            }
         },
         errorPlacement: function (error, element) {
            var spot = $(element).closest('.form-group');
            error.insertBefore(spot);
         },
         highlight: function (element) {
            $(element).closest('.form-group').addClass('has-error');
         },
         unhighlight: function (element) {
            $(element).closest('.form-group').removeClass('has-error');
         },
      });
   });
</script>
</body>
</html>