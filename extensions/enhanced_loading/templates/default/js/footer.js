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