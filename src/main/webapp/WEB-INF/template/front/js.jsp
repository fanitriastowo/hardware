<style>
	#search_form {position: absolute;}
	.autocomplete-suggestions { border: 1px solid #999; background: #222; overflow: auto; }
	.autocomplete-suggestion { padding: 2px 5px; white-space: nowrap; overflow: hidden; }
	.autocomplete-selected { background: #999; }
	.autocomplete-suggestions strong { font-weight: normal; color: #3399FF; }
	.autocomplete-group { padding: 2px 5px; }
	.autocomplete-group strong { display: block; border-bottom: 1px solid #000; }
</style>

<script type="text/javascript" src='<spring:url value="/assets/front/js/jquery.min.js" />'></script>
<script type="text/javascript" src='<spring:url value="/assets/front/js/jquery.autocomplete.min.js" />'></script>
<script type="text/javascript" src='<spring:url value="/assets/front/js/bootstrap.min.js" />'></script>
<script type="text/javascript" src='<spring:url value="/assets/front/js/main.js" />'></script>

<script>
   (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
   (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
   m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
   })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
   
   ga('create', 'UA-81118879-1', 'auto');
   ga('send', 'pageview');

</script>

<script type="text/javascript">
	$(document).ready(function() {

		/* hitung jumlah keranjang */
		var url = '<spring:url value="/count_keranjang" />';
		$.getJSON(url, function(data) {
			$('#product_total').html(data);
		});
		// =======================================================

		/* Search bar autocomplete */
		$("#search-bar").autocomplete({
			serviceUrl : '<spring:url value="/search_autocomplete" />', // path to the get products method
			paramName : "term",
			transformResult : function(response) {
				return {
					suggestions : $.map($.parseJSON(response), function(item) {
						return {
							value : item.nama,
							data : item.id
						};
					})
				};
			},
			appendTo : "#search_form",
		});

	});
</script>