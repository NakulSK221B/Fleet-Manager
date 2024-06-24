document.addEventListener("DOMContentLoaded", function() {
    const tabRadios = document.querySelectorAll(".tab-radio");
    const logoutRadio = document.querySelector(".logout-radio");
    const tabContents = document.querySelectorAll(".tab-content");

     // Function to force a repaint of the map container
     function forceRepaint() {
        const mapContainer = document.getElementById('map'); // Replace 'map' with the actual ID of your map container
        if (mapContainer) {
            // Hide and show the map container to force a repaint
            mapContainer.style.display = 'none';
            setTimeout(() => {
                mapContainer.style.display = 'block';
            }, 100); // Adjust the delay time as needed (e.g., 100 milliseconds)
        }
    }
    
    function showTabContent() {
        tabContents.forEach(content => {
            content.style.display = "none"; // Hide all tab contents by default
        });

        if (this.classList.contains("logout-radio")) {
            // Handle logout
            console.log("Logout button clicked. You can implement logout functionality here.");
        } else {
            // Handle tab navigation
            const selectedTabIndex = parseInt(this.id.replace("tab", "")) - 1;
            tabContents[selectedTabIndex].style.display = "block"; // Display the selected tab content
        }
    }

    tabRadios.forEach(radio => {
        radio.addEventListener("change", showTabContent);
    });
    logoutRadio.addEventListener("change", showTabContent);
    // Trigger change event on the initially checked tab (Home)
    const initiallyCheckedTab = document.querySelector(".tab-radio:checked");
    if (initiallyCheckedTab) {
        initiallyCheckedTab.dispatchEvent(new Event('change'));
    }
    
});