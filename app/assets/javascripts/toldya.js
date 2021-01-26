$(document).ready(function () {
	console.log("it works");
	// $("body").css({ backgroundColor: "pink" });
	const mymap = L.map("mapid").setView([-33.8636785, 151.2036298], 13);

	L.tileLayer("https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}", {
		attribution:
			'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
		maxZoom: 18,
		id: "mapbox/streets-v11",
		tileSize: 512,
		zoomOffset: -1,
		accessToken: "pk.eyJ1IjoieDd6Yml0IiwiYSI6ImNra2FlaGdsMjBxY3oydm8yMGFvMjFubDMifQ.VPMdtzmHNFPnfsoCesLSUQ"
	}).addTo(mymap);

	const marker = L.marker([-33.8636785, 151.2036298]).addTo(mymap);
	marker.bindPopup("<b>Hello world!</b><br>I am a popup.").openPopup();
});
