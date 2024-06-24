
        function updateBaseStatus() {
            $.ajax({
                url: '/base_coordinates',
                type: 'GET',
                data: { timestamp: new Date().getTime() }, // Cache buster
                success: function (data) {
                    updateBaseMarker(data.latitude, data.longitude)
                },
                error: function (error) {
                    console.error('Error fetching robot status:', error);
                }
            });
        }
    
    
        function updateBaseMarker(latitude, longitude) {
            // Check if the marker already exists
            if (window['base_marker']) {
                // Update the existing marker
                window['base_marker'].setLatLng([latitude, longitude]);
            } else {
                // Create a new marker
                window['base_marker'] = L.marker([latitude, longitude]).addTo(map);
                // Customize the marker appearance
    
                var icon = L.AwesomeMarkers.icon({
                    "extraClasses": "fa-rotate-0",
                    "icon": "house",
                    "iconColor": "blue",
                    "markerColor": "white",
                    "prefix": "fa"
                });
    
                window['base_marker'].setIcon(icon);
    
                var popup = L.popup({"maxWidth": "100%"});
                var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinates: [" + latitude + "," + longitude + "] </div>")[0];
                popup.setContent(html);
                window['base_marker'].bindPopup(popup);
    
                window['base_marker'].bindTooltip(`<div>Base Station </div>`, {"sticky": true});
            }
        }
    
        // Fetch updated values every 2 seconds
        setInterval(updateBaseStatus, 1000);
