
var map = L.map("map",
{
    center: [15.3692362745098, 75.12352941176471],
    crs: L.CRS.EPSG3857,
    zoom: 20,
    zoomControl: true,
    preferCanvas: true,
});

var tile_layer = L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    "attribution": "Data by &copy; <a target=\"_blank\" href=\"http://openstreetmap.org\">OpenStreetMap</a>, under <a target=\"_blank\" href=\"http://www.openstreetmap.org/copyright\">ODbL</a>.",
    "detectRetina": true,
    "maxNativeZoom": 25,
    "maxZoom": 50,
    "minZoom": 0,
    "noWrap": false,
    "opacity": 1,
    "subdomains": "abc",
    "tms": false
}).addTo(map);


                    var marker1 = L.marker([15.369116666666667, 75.12301666666667]).addTo(map);

                    var icon = L.AwesomeMarkers.icon(
                    {"extraClasses": "fa-rotate-0", "icon": "road-barrier", "iconColor": "green", "markerColor": "white", "prefix": "fa"}
                    );

                    marker1.setIcon(icon);

                    var popup = L.popup({"maxWidth": "100%"});

                    var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinate: [15.369116666666667, 75.12301666666667]</div>")[0];
                    popup.setContent(html);

                    marker1.bindPopup(popup);

                    marker1.bindTooltip(`<div>Perimeter</div>`, {"sticky": true});
                

                    var marker2 = L.marker([15.369266666666666, 75.1231]).addTo(map);

                    var icon = L.AwesomeMarkers.icon(
                    {"extraClasses": "fa-rotate-0", "icon": "road-barrier", "iconColor": "green", "markerColor": "white", "prefix": "fa"}
                    );

                    marker2.setIcon(icon);

                    var popup = L.popup({"maxWidth": "100%"});

                    var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinate: [15.369266666666666, 75.1231]</div>")[0];
                    popup.setContent(html);

                    marker2.bindPopup(popup);

                    marker2.bindTooltip(`<div>Perimeter</div>`, {"sticky": true});
                

                    var marker3 = L.marker([15.369366666666666, 75.12316666666666]).addTo(map);

                    var icon = L.AwesomeMarkers.icon(
                    {"extraClasses": "fa-rotate-0", "icon": "road-barrier", "iconColor": "green", "markerColor": "white", "prefix": "fa"}
                    );

                    marker3.setIcon(icon);

                    var popup = L.popup({"maxWidth": "100%"});

                    var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinate: [15.369366666666666, 75.12316666666666]</div>")[0];
                    popup.setContent(html);

                    marker3.bindPopup(popup);

                    marker3.bindTooltip(`<div>Perimeter</div>`, {"sticky": true});
                

                    var marker4 = L.marker([15.369466666666666, 75.12321666666666]).addTo(map);

                    var icon = L.AwesomeMarkers.icon(
                    {"extraClasses": "fa-rotate-0", "icon": "road-barrier", "iconColor": "green", "markerColor": "white", "prefix": "fa"}
                    );

                    marker4.setIcon(icon);

                    var popup = L.popup({"maxWidth": "100%"});

                    var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinate: [15.369466666666666, 75.12321666666666]</div>")[0];
                    popup.setContent(html);

                    marker4.bindPopup(popup);

                    marker4.bindTooltip(`<div>Perimeter</div>`, {"sticky": true});
                

                    var marker5 = L.marker([15.36945, 75.12341666666667]).addTo(map);

                    var icon = L.AwesomeMarkers.icon(
                    {"extraClasses": "fa-rotate-0", "icon": "road-barrier", "iconColor": "green", "markerColor": "white", "prefix": "fa"}
                    );

                    marker5.setIcon(icon);

                    var popup = L.popup({"maxWidth": "100%"});

                    var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinate: [15.36945, 75.12341666666667]</div>")[0];
                    popup.setContent(html);

                    marker5.bindPopup(popup);

                    marker5.bindTooltip(`<div>Perimeter</div>`, {"sticky": true});
                

                    var marker6 = L.marker([15.369433333333333, 75.12358333333333]).addTo(map);

                    var icon = L.AwesomeMarkers.icon(
                    {"extraClasses": "fa-rotate-0", "icon": "road-barrier", "iconColor": "green", "markerColor": "white", "prefix": "fa"}
                    );

                    marker6.setIcon(icon);

                    var popup = L.popup({"maxWidth": "100%"});

                    var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinate: [15.369433333333333, 75.12358333333333]</div>")[0];
                    popup.setContent(html);

                    marker6.bindPopup(popup);

                    marker6.bindTooltip(`<div>Perimeter</div>`, {"sticky": true});
                

                    var marker7 = L.marker([15.369316666666666, 75.12356666666666]).addTo(map);

                    var icon = L.AwesomeMarkers.icon(
                    {"extraClasses": "fa-rotate-0", "icon": "road-barrier", "iconColor": "green", "markerColor": "white", "prefix": "fa"}
                    );

                    marker7.setIcon(icon);

                    var popup = L.popup({"maxWidth": "100%"});

                    var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinate: [15.369316666666666, 75.12356666666666]</div>")[0];
                    popup.setContent(html);

                    marker7.bindPopup(popup);

                    marker7.bindTooltip(`<div>Perimeter</div>`, {"sticky": true});
                

                    var marker8 = L.marker([15.369316666666666, 75.1237]).addTo(map);

                    var icon = L.AwesomeMarkers.icon(
                    {"extraClasses": "fa-rotate-0", "icon": "road-barrier", "iconColor": "green", "markerColor": "white", "prefix": "fa"}
                    );

                    marker8.setIcon(icon);

                    var popup = L.popup({"maxWidth": "100%"});

                    var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinate: [15.369316666666666, 75.1237]</div>")[0];
                    popup.setContent(html);

                    marker8.bindPopup(popup);

                    marker8.bindTooltip(`<div>Perimeter</div>`, {"sticky": true});
                

                    var marker9 = L.marker([15.3692, 75.12368333333333]).addTo(map);

                    var icon = L.AwesomeMarkers.icon(
                    {"extraClasses": "fa-rotate-0", "icon": "road-barrier", "iconColor": "green", "markerColor": "white", "prefix": "fa"}
                    );

                    marker9.setIcon(icon);

                    var popup = L.popup({"maxWidth": "100%"});

                    var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinate: [15.3692, 75.12368333333333]</div>")[0];
                    popup.setContent(html);

                    marker9.bindPopup(popup);

                    marker9.bindTooltip(`<div>Perimeter</div>`, {"sticky": true});
                

                    var marker10 = L.marker([15.369183333333334, 75.12381666666667]).addTo(map);

                    var icon = L.AwesomeMarkers.icon(
                    {"extraClasses": "fa-rotate-0", "icon": "road-barrier", "iconColor": "green", "markerColor": "white", "prefix": "fa"}
                    );

                    marker10.setIcon(icon);

                    var popup = L.popup({"maxWidth": "100%"});

                    var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinate: [15.369183333333334, 75.12381666666667]</div>")[0];
                    popup.setContent(html);

                    marker10.bindPopup(popup);

                    marker10.bindTooltip(`<div>Perimeter</div>`, {"sticky": true});
                

                    var marker11 = L.marker([15.369316666666666, 75.12381666666667]).addTo(map);

                    var icon = L.AwesomeMarkers.icon(
                    {"extraClasses": "fa-rotate-0", "icon": "road-barrier", "iconColor": "green", "markerColor": "white", "prefix": "fa"}
                    );

                    marker11.setIcon(icon);

                    var popup = L.popup({"maxWidth": "100%"});

                    var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinate: [15.369316666666666, 75.12381666666667]</div>")[0];
                    popup.setContent(html);

                    marker11.bindPopup(popup);

                    marker11.bindTooltip(`<div>Perimeter</div>`, {"sticky": true});
                

                    var marker12 = L.marker([15.369283333333334, 75.12408333333333]).addTo(map);

                    var icon = L.AwesomeMarkers.icon(
                    {"extraClasses": "fa-rotate-0", "icon": "road-barrier", "iconColor": "green", "markerColor": "white", "prefix": "fa"}
                    );

                    marker12.setIcon(icon);

                    var popup = L.popup({"maxWidth": "100%"});

                    var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinate: [15.369283333333334, 75.12408333333333]</div>")[0];
                    popup.setContent(html);

                    marker12.bindPopup(popup);

                    marker12.bindTooltip(`<div>Perimeter</div>`, {"sticky": true});
                

                    var marker13 = L.marker([15.369016666666667, 75.12406666666666]).addTo(map);

                    var icon = L.AwesomeMarkers.icon(
                    {"extraClasses": "fa-rotate-0", "icon": "road-barrier", "iconColor": "green", "markerColor": "white", "prefix": "fa"}
                    );

                    marker13.setIcon(icon);

                    var popup = L.popup({"maxWidth": "100%"});

                    var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinate: [15.369016666666667, 75.12406666666666]</div>")[0];
                    popup.setContent(html);

                    marker13.bindPopup(popup);

                    marker13.bindTooltip(`<div>Perimeter</div>`, {"sticky": true});
                

                    var marker14 = L.marker([15.369033333333334, 75.12383333333334]).addTo(map);

                    var icon = L.AwesomeMarkers.icon(
                    {"extraClasses": "fa-rotate-0", "icon": "road-barrier", "iconColor": "green", "markerColor": "white", "prefix": "fa"}
                    );

                    marker14.setIcon(icon);

                    var popup = L.popup({"maxWidth": "100%"});

                    var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinate: [15.369033333333334, 75.12383333333334]</div>")[0];
                    popup.setContent(html);

                    marker14.bindPopup(popup);

                    marker14.bindTooltip(`<div>Perimeter</div>`, {"sticky": true});
                

                    var marker15 = L.marker([15.369066666666667, 75.12353333333333]).addTo(map);

                    var icon = L.AwesomeMarkers.icon(
                    {"extraClasses": "fa-rotate-0", "icon": "road-barrier", "iconColor": "green", "markerColor": "white", "prefix": "fa"}
                    );

                    marker15.setIcon(icon);

                    var popup = L.popup({"maxWidth": "100%"});

                    var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinate: [15.369066666666667, 75.12353333333333]</div>")[0];
                    popup.setContent(html);

                    marker15.bindPopup(popup);

                    marker15.bindTooltip(`<div>Perimeter</div>`, {"sticky": true});
                

                    var marker16 = L.marker([15.369083333333334, 75.1233]).addTo(map);

                    var icon = L.AwesomeMarkers.icon(
                    {"extraClasses": "fa-rotate-0", "icon": "road-barrier", "iconColor": "green", "markerColor": "white", "prefix": "fa"}
                    );

                    marker16.setIcon(icon);

                    var popup = L.popup({"maxWidth": "100%"});

                    var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinate: [15.369083333333334, 75.1233]</div>")[0];
                    popup.setContent(html);

                    marker16.bindPopup(popup);

                    marker16.bindTooltip(`<div>Perimeter</div>`, {"sticky": true});
                

                    var marker17 = L.marker([15.3691, 75.1231]).addTo(map);

                    var icon = L.AwesomeMarkers.icon(
                    {"extraClasses": "fa-rotate-0", "icon": "road-barrier", "iconColor": "green", "markerColor": "white", "prefix": "fa"}
                    );

                    marker17.setIcon(icon);

                    var popup = L.popup({"maxWidth": "100%"});

                    var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinate: [15.3691, 75.1231]</div>")[0];
                    popup.setContent(html);

                    marker17.bindPopup(popup);

                    marker17.bindTooltip(`<div>Perimeter</div>`, {"sticky": true});
                
            