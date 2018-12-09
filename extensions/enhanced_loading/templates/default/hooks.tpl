{*if !isset($using) || $using!="enhanced_html_head header.tpl"}
	{capture name=hook_head_end}

	<!-- hook_head_end -->
	<link rel="stylesheet" type="text/css" href="extensions/enhanced_loading/templates/default/css/style.css" />
	<!-- /hook_head_end -->

	{/capture}

	{capture name=hook_body_start}

	<!-- hook_body_start -->
	<script type="text/javascript">
		/*$('html').removeClass('no-js');*/
		window.onbeforeunload = function(e) { $("#loadingDiv").show(); };
		/*window.onbeforeunload = function(e) { $("#loadingDiv").show(); e.returnValue = true; };*/
		/*$window = $(window);
		$window.on("beforeunload", function(e) { $("#loadingDiv").show(); e.returnValue = true; });*/
		$('document').ready(function() {
			for (var i=0; i<document.forms.length; i++) {
				document.forms[i].setAttribute("autoComplete","off");
		/*		var elements = document.forms[i].elements;
				for (var j=0, element; element = elements[j++];) {
					if (element.tagName === "INPUT" && element.type != "hidden") {
						element.setAttribute("autoComplete","off");
						element.setAttribute("readonly","readonly");
						element.onfocus=function() {
							this.removeAttribute('readonly');
						};
					}
				}*/
			}
		});
	</script>
	<div style="display: none;" id="loadingDiv"><div class="loader">Loading...</div></div>
	<!-- /hook_body_start -->

	{/capture}
{/if*}
