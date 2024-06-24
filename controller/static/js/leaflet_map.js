// var map = L.map('map', {updateWhenIdle: false, keepbuffer:15}).setView([15.3692362745098, 75.12352941176471], 20);
// var map = L.map('map', {updateWhenIdle: false, keepbuffer:15}).setView([15.369236, 75.123529], 20);

// L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
//     maxZoom: 19,
//     detectretina: true,
//     updateWhenIdle: false,
//     nativezoom: 30,
//     subdomains: "abc",
//     maxAge: Infinity,
//     attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
// }).addTo(map);
var map;
document.addEventListener('DOMContentLoaded', function() {
    setTimeout(() => {
        map = L.map('map', {updateWhenIdle: false, keepbuffer:15}).setView([15.369236, 75.123529], 19);
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            detectretina: true,
            updateWhenIdle: false,
            nativezoom: 30,
            subdomains: "abc",
            maxAge: Infinity,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);
        var polygon = L.polygon([
            [15.369116666666667, 75.12301666666667],
            [15.369266666666666, 75.1231],
            [15.369366666666666, 75.12316666666666],
            [15.369466666666666, 75.12321666666666],
            [15.36945, 75.12341666666667],
            [15.369433333333333, 75.12358333333333],
            [15.369316666666666, 75.12356666666666],
            [15.369316666666666, 75.1237],
            [15.3692, 75.12368333333333],
            [15.369183333333334, 75.12381666666667],
            [15.369316666666666, 75.12381666666667],
            [15.369283333333334, 75.12408333333333],
            [15.369016666666667, 75.12406666666666],
            [15.369033333333334, 75.12383333333334],
            [15.369066666666667, 75.12353333333333],
            [15.369083333333334, 75.1233],
            [15.3691, 75.1231]
        ]).addTo(map); 
    }, 800); // Adjust the delay time as needed
});
// var marker = L.marker([15.3692, 75.1234]).addTo(map);



var popup = L.popup();

function onMapClick(e) {
    popup
        .setLatLng(e.latlng)
        .setContent("You clicked the map at " + e.latlng.toString())
        .openOn(map);
}

map.on('click', onMapClick);