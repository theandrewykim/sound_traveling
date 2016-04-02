jQuery(document).ready(function($) {
	$("#jquery_jplayer_audio_1").jPlayer({
		ready: function(event) {
			$(this).jPlayer("setMedia", {
				title: "Bus in india",
				mp3: "http://s3.amazonaws.com/demotracks/recordings/sounds/000/000/039/original/bus-india.mp3?1459612624",
				oga: "http://jplayer.org/audio/ogg/Miaow-02-Hidden.ogg"
			});
		},
		play: function() { // Avoid multiple jPlayers playing together.
			$(this).jPlayer("pauseOthers");
		},
		timeFormat: {
			padMin: false
		},
		swfPath: "js",
		supplied: "mp3",
		cssSelectorAncestor: "#jp_container_audio_1",
		useStateClassSkin: true,
		autoBlur: false,
		smoothPlayBar: true,
		remainingDuration: true,
		keyEnabled: true,
		keyBindings: {
			// Disable some of the default key controls
			loop: null,
			muted: null,
			volumeUp: null,
			volumeDown: null
		},
		wmode: "window"
	});
});
