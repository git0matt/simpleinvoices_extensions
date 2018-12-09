/*$(document).ready(function() {*/
	if (jQuery.cluetip) {
		$('a.cluetip2').cluetip({
/*			local: true,
			hideLocal: true,
			attribute: 'rel',*/
			activaction: 'click',
			splitTitle: '|',
			sticky: true,
			cluetipClass: 'notice',
			fx: {
				open: 'fadeIn',
				openSpeed: '70'
			},
			arrows: true,
			closePosition: 'title',
			closeText: '<img src="images/common/cross.png" alt="cross"/>'
		});
	}
/*});*/