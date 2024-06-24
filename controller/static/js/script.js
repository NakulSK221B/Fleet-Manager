
//Tab 1
// function updateemployeelog(){
//     $.ajax({
//         url: '/fetch_employee_log',
//         type: 'GET',
//         success: function(response) {
//             if (response.length > 0) {
//                 var tableHtml = '<table><thead><tr><th>Event Description</th><th>Time Stamp</th></tr></thead><tbody>';
//                 if (divClass.includes('minimised_operator_log')) {
//                     response = response.slice(0, 5);  // Display only the first 5 logs
//                 }
//                 response.forEach(function(log){
//                     tableHtml += '<tr><td>' + log[0] + '</td><td>' + log[1] + '</td></tr>';
//                 });
//                 tableHtml += '</tbody></table>';
//                 $('.operator_log').html(tableHtml);
//                 $('.minimised_operator_log').html(tableHtml);
//             } else {
//                 $('.operator_log').html('No logs found');
//             }
//         },
//         error: function(xhr, status, error) {
//             console.error('Error fetching logs:', error);
//             $('.operator_log').html('Error fetching logs');
//         }
//     });
// }
function updateformRobotCount() {
    $.ajax({
        url: '/fetch_robot_count',
        type: 'GET',
        data: { timestamp: new Date().getTime() }, // Cache buster
        success: function (data) {
            const robotSelect = document.getElementById('robotSelect');
            const existingOptions = Array.from(robotSelect.options).map(option => option.value);
            if (!existingOptions.includes('Auto-Assign')){
                const option = document.createElement('option');
                option.value = 'Auto-Assign';
                option.textContent = 'Auto-Assign';
                robotSelect.appendChild(option);
            }
            data.forEach(function(item) {
                if (!existingOptions.includes(item)) {
                    const option = document.createElement('option');
                    option.value = item;
                    option.textContent = item;
                    robotSelect.appendChild(option);
                }
            });
        },
        error: function (error) {
            console.error('Error fetching robot count:', error);
        }
    });
}

function updateRobotStatus() {
    $.ajax({
        url: '/fetch_robot_count',
        type: 'GET',
        data: { timestamp: new Date().getTime() }, // Cache buster
        success: function (data) {
            data.forEach(function(item) 
            {
                updateRobotData(item)
            });
        },
        error: function (error) {
            console.error('Error fetching robot count:', error);
        }
    });
}
function updateRobotData(robotId) {
    $.ajax({
        url: '/fetch_robot_info/' + robotId,
        type: 'GET',
        data: { timestamp: new Date().getTime() }, // Cache buster
        success: function (data) {
            $('#' + robotId + 'Latitude').text(data[1]);
            $('#' + robotId + 'Longitude').text(data[2]);
            $('#' + robotId + 'ElectronicsBatteryCharge').text(data[3]);
            $('#' + robotId + 'MotorBatteryCharge').text(data[4]);
            updateRobotMarker(data[0], data[1], data[2]);
            updatebatterystatus(robotId,data[3], data[4]);
        },
        error: function (error) {
            console.error('Error fetching robot status:', error);
        }
    });
}
function updatebatterystatus(robotId,ElectronicsBatteryCharge,MotorBatteryCharge){
    const electronicsBatteryPercentage = parseFloat(ElectronicsBatteryCharge); // Assuming data[4] contains the motor battery percentage as a number
    const electronicsBatteryFill = document.getElementById(robotId + 'electronicsbatteryfill');
    const electronicsBatteryPercentageElement = document.getElementById(robotId + 'electronicsbatterypercentage');

    electronicsBatteryFill.style.width = electronicsBatteryPercentage + '%';
    electronicsBatteryPercentageElement.textContent = electronicsBatteryPercentage + '%';
    if (electronicsBatteryPercentage >= 70) {
        electronicsBatteryFill.style.backgroundColor = 'chartreuse';
    } else if (electronicsBatteryPercentage >= 25) {
        electronicsBatteryFill.style.backgroundColor = 'yellow';
    } else {
        electronicsBatteryFill.style.backgroundColor = 'red';
    }
    
    const motorBatteryPercentage = parseFloat(MotorBatteryCharge); // Assuming data[4] contains the motor battery percentage as a number
    const motorBatteryFill = document.getElementById(robotId + 'motorbatteryfill');
    const motorBatteryPercentageElement = document.getElementById(robotId + 'motorbatterypercentage');
    
    motorBatteryFill.style.width = motorBatteryPercentage + '%';
    motorBatteryPercentageElement.textContent = motorBatteryPercentage + '%';
    if (motorBatteryPercentage >= 70) {
        motorBatteryFill.style.backgroundColor = 'chartreuse';
    } else if (motorBatteryPercentage >= 25) {
        motorBatteryFill.style.backgroundColor = 'yellow';
    } else {
        motorBatteryFill.style.backgroundColor = 'red';
    }
}

function updateRobotMarker(robotId, latitude, longitude) {
    if (!L || !L.marker) {
        console.error('Leaflet or L.marker is not properly initialized.');
        return;
    }

    if (!latitude || !longitude) {
        console.error('Invalid latitude or longitude values:', latitude, longitude);
        return;
    }
    if (window['marker_' + robotId]) {
        window['marker_' + robotId].setLatLng([latitude, longitude]);
    } else {
        try {
            window['marker_' + robotId] = L.marker([latitude, longitude]).addTo(map);
            var iconColor;
            switch (robotId) {
                case 'Robot1':
                    iconColor = 'red';
                    break;
                case 'Robot2':
                    iconColor = 'blue';
                    break;
                case 'Robot3':
                    iconColor = 'green';
                    break;
                default:
                    iconColor = 'white'; // Default to red if the robotId is not recognized
            }
    
            var icon = L.AwesomeMarkers.icon({
                "extraClasses": "fa-rotate-0",
                "icon": "car",
                "iconColor": iconColor,
                "markerColor": "white",
                "prefix": "fa"
            });
    
            window['marker_' + robotId].setIcon(icon);
            var popup = L.popup({"maxWidth": "100%"});
            var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinates: [" + latitude + "," + longitude + "] </div>")[0];
            popup.setContent(html);
            window['marker_' + robotId].bindPopup(popup);
            window['marker_' + robotId].bindTooltip(`<div>${robotId}</div>`, {"sticky": true});  
        } catch (error) {
            console.error('Error adding marker to map:', error);
        }
        
    }
}

function updateformLandmarkCount() {
    $.ajax({
        url: '/fetch_landmarks',
        type: 'GET',
        data: { timestamp: new Date().getTime() }, // Cache buster
        success: function (data) {
            const landmarkSelect = document.getElementById('landmarkSelect');
            const existingOptions = Array.from(landmarkSelect.options).map(option => option.value);
            data.forEach(function (item) {
                if (!existingOptions.includes(item)) {
                    const option = document.createElement('option');
                    option.value = item;
                    option.textContent = item;
                    landmarkSelect.appendChild(option); 
                }
            });
        },
        error: function (error) {
            console.error('Error fetching landmarks :', error);
        }
    });
}

function updateLandmarkStatus()
{
    $.ajax({
        url: '/fetch_landmarks',
        type: 'GET',
        data: { timestamp: new Date().getTime() }, // Cache buster
        success: function (data) {
            data.forEach(function (item) {
                updateLandmarkData(item)
            });
        },
        error: function (error) {
            console.error('Error fetching landmarks :', error);
        }
    });
}

function updateLandmarkData(landmark_id) {
    $.ajax({
        url: '/fetch_landmark_coordinates/' + landmark_id,
        type: 'GET',
        data: { timestamp: new Date().getTime() }, // Cache buster
        success: function (data) {
            updateLandmarkMarker(data[0], data[1], data[2], data[3]);
            // console.log(data[0], data[1], data[2], data[3]);
        },
        error: function (error) {
            console.error('Error fetching landmark status:', error);
        }
    });
}

function updateLandmarkMarker(ID, robot_id, latitude, longitude) {
    // Check if the marker already exists
    if (window['marker_' + ID]) {
        // Update the existing marker
        var iconColor;
        switch (robot_id) {
            case 'Robot1':
                iconColor = 'red';
                break;
            case 'Robot2':
                iconColor = 'blue';
                break;
            case 'Robot3':
                iconColor = 'green';
                break;
            default:
                iconColor = 'white'; // Default to red if the robotId is not recognized
        }
        // new icon changes
        var icon = L.AwesomeMarkers.icon({
            "extraClasses": "fa-rotate-0",
            "icon": "landmark",
            "iconColor": iconColor,
            "markerColor": "white",
            "prefix": "fa"
        });
        //apply icon to marker by searching it
        window['marker_' + ID].setIcon(icon);
        window['marker_' + ID].bindTooltip(`<div>${ID} <br>Assigned to: ${robot_id}</div>`, {"sticky": true});
    } else 
    {
        // Create a new marker
        window['marker_' + ID] = L.marker([latitude, longitude]).addTo(map);
        // Customize the marker appearance
        var iconColor;
        switch (robot_id) {
            case 'Robot1':
                iconColor = 'red';
                break;
            case 'Robot2':
                iconColor = 'blue';
                break;
            case 'Robot3':
                iconColor = 'green';
                break;
            default:
                iconColor = 'white'; // Default to white if the robotId is not recognized
        }
        var icon = L.AwesomeMarkers.icon({
            "extraClasses": "fa-rotate-0",
            "icon": "landmark",
            "iconColor": iconColor,
            "markerColor": "white",
            "prefix": "fa"
        });
        window['marker_' + ID].setIcon(icon);
        var popup = L.popup({"maxWidth": "100%"});
        var html = $("<div id='html' style='width: 100.0%; height: 100.0%;'>Coordinates: [" + latitude + "," + longitude + "] </div>")[0];
        popup.setContent(html);
        window['marker_' + ID].bindPopup(popup);
        window['marker_' + ID].bindTooltip(`<div>${ID} <br>Assigned to: ${robot_id}</div>`, {"sticky": true});
    }
}
function updateBasecoordinates() {
    $.ajax({
        url: '/fetch_base_coordinates',
        type: 'GET',
        data: { timestamp: new Date().getTime() }, // Cache buster
        success: function (data) {
            updateBaseMarker(data.latitude, data.longitude)
        },
        error: function (error) {
            console.error('Error fetching base station status:', error);
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
            "iconColor": "brown",
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

// Tab 2 
// Function to fetch and populate the dropdown menus
document.getElementById("submitBtn").addEventListener("click", function(event) {
    event.preventDefault(); // Prevent the default form submission behavior
    // Get form data
    var formData = new FormData(document.getElementById("robotForm"));
    // Send form data to the server
    fetch('/submit-task', {method: 'POST',body: formData})
    .then(response => {
        if (!response.ok) 
        {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        // Handle successful response
        // console.log(data);
    })
    .catch(error => {
        // Handle error
        console.error('There was a problem with the fetch operation:', error);
    });
});

// TAB 1- bottom table 
function fetchCurrentTasks() {
    $.ajax({
        url: '/fetch_current_tasks',
        type: 'GET',
        data: { timestamp: new Date().getTime() }, // Cache buster
        success: function (data) {
            data.forEach(function (item) {
                updatecurrenttasks(item[0], item[1], item[2], item[3], item[4], item[5], item[6], item[7]);
            });
        },
        error: function (error) {
            console.error('Error fetching current tasks:', error);
        }
    });
}
function updatecurrenttasks(EmployeeID, robotId, electronics_charge, motor_charge, latitude, longitude,Destination,Description,Timestamp) {
    // Update the content of the Robot Status tab
    $('#' + robotId + '_employeeid').text(EmployeeID);
    $('#' + robotId + '_charge_electronics_battery').text(electronics_charge); // Index 2 for charge_electronics_battery
    $('#' + robotId + '_charge_motor_battery').text(motor_charge); // Index 3 for charge_motor_battery
    $('#' + robotId + '_current_latitude').text(latitude); // Index 4 for current_latitude
    $('#' + robotId + '_current_longitude').text(longitude); // Index 5 for current_longitude
    $('#' + robotId + '_destination').text(Destination); // Index 6 for destination
    $('#' + robotId + '_additional_description').text(Description); // Index 7 for additional_description
    $('#' + robotId + '_time_stamp').text(Timestamp); // Index 8 for time_stamp

}


// System Log Tab*******************************************
// code to fetch and populate the option fields accordingly
function updatelogselect() {
    console.log("Entered the updatelogselect function.....")
    const select1 = document.getElementById('systemlog-select1');
    const select2 = document.getElementById('systemlog-select2');

    // Get the selected value of systemlog-select1
    // console.log('1')
    const selectedValue = select1.value;
    let optionsempty=false;
    console.log(selectedValue)

    // Check if desired options are already present
    console.log('2')
    const employeeOptionsPresent = select2.querySelector("option[value='101']");
    const robotOptionsPresent = select2.querySelector('option[value="Robot1"]');
    console.log("employee",employeeOptionsPresent)
    console.log("robot",robotOptionsPresent)

    // Clear existing options in systemlog-select2 if necessary
    console.log('3')
    if ((select2.options.length === 0) ||
        (selectedValue === 'employee_log' && !employeeOptionsPresent) ||
        (selectedValue !== 'employee_log' && !robotOptionsPresent)) {
        select2.innerHTML = '';
        optionsempty=true;

    }
    // Clear existing options in systemlog-select2
    // select2.innerHTML = '';

    // Define a function to add options to systemlog-select2
    function addOption(value, text) {
        const option = document.createElement('option');
        option.value = value;
        option.textContent = text;
        select2.appendChild(option);
        console.log("Value:",value);
    }

    // Check the selectedValue and populate systemlog-select2 accordingly
    
    if (selectedValue === 'employee_log' && optionsempty==true) {
        // Perform the AJAX request to fetch Employee IDs and populate systemlog-select2
        console.log('if employeelog')
        $.ajax({
            url: '/fetch_employee_ids',
            type: 'GET',
            data: { timestamp: new Date().getTime() }, // Cache buster
            success: function (data) {
                // console.log('Data received:', data);
                // Extract and add Employee IDs fetched from the AJAX response
                data.forEach(function (idArray) {
                    const employeeID = idArray[0];
                    addOption(employeeID, `Employee ID: ${employeeID}`);
                });
            },
            error: function (error) {
                console.error('Error fetching employee IDs:', error);
            }
        });
    } else if (optionsempty) {
        // Perform the AJAX request to fetch Robot IDs and populate systemlog-select2
        // console.log('not employeelog')
        $.ajax({
            url: '/fetch_robot_count',
            type: 'GET',
            data: { timestamp: new Date().getTime() }, // Cache buster
            success: function (data) {
                // console.log('Data received:', data);
                const existingOptions = new Set(Array.from(select2.options).map(option => option.value));

                // Add Robot IDs fetched from the AJAX response
                data.forEach(function (item) {
                    if (!existingOptions.has(item)) {
                        addOption(item, item);
                    }
                });
            },
            error: function (error) {
                console.error('Error fetching robot count:', error);
            }
        });
    }
    
}
document.getElementById("systemlog-btn").addEventListener("click", function(event) {
    event.preventDefault(); // Prevent the default form submission behavior
    var select1Value = document.getElementById("systemlog-select1").value;
    var select2Value = document.getElementById("systemlog-select2").value;
    
    var formData = new FormData();
    formData.append("systemlog-select1", select1Value);
    formData.append("systemlog-select2", select2Value);

    // Send form data to the server
    fetch('/GetSystemlogs', {
        method: 'POST',
        body: formData
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        // Handle successful response
        console.log(data);
        // Update the UI with the received data (if needed)

        // Example: Populate a table with the data
        displayResults(data.column_names, data.results);
    })
    .catch(error => {
        // Handle error
        console.error('There was a problem with the fetch operation:', error);
    });
});

function displayResults(columnNames, results) {
    var table = document.getElementById('systemlog-table');
    table.innerHTML = ''; // Clear previous content
    
    // Add table headers
    var headerRow = table.insertRow();
    columnNames.forEach(function (colName) {
        var headerCell = headerRow.insertCell();
        headerCell.textContent = colName;
    });

    // Sort results by timestamp in decreasing order
    results.sort(function (a, b) {
        var timestampColIndex = columnNames.indexOf('time_stamp'); // Assuming 'last_updated' is the timestamp column name
        return new Date(b[timestampColIndex]) - new Date(a[timestampColIndex]);
    });

    // Add table rows
    results.forEach(function (row) {
        var dataRow = table.insertRow();
        row.forEach(function (val, index) {
            var cell = dataRow.insertCell();
            if (typeof val === 'number' && columnNames[index].includes('uptime')) {
                // Format seconds as HH:MM:SS
                var formattedVal = formatSeconds(val);
                cell.textContent = formattedVal;
            } else {
                cell.textContent = val;
            }
        });
    });
}

function formatSeconds(totalSeconds) {
    var hours = Math.floor(totalSeconds / 3600);
    var minutes = Math.floor((totalSeconds % 3600) / 60);
    var seconds = totalSeconds % 60;
    return padZero(hours) + ':' + padZero(minutes) + ':' + padZero(seconds);
}

function padZero(num) {
    return (num < 10 ? '0' : '') + num;
}
// Key Shortcuts
// document.addEventListener('keydown', function(event) {
//     const key = event.key;

//     if (event.key === 'Escape') {
//         // Trigger the form submission for logout
//         document.getElementById('logoutForm').submit();
//     }
//     const numericValue = parseInt(event.key);

//     if (!isNaN(numericValue) && numericValue >= 1 && numericValue <= 3) {
//         const tabId = 'tab' + numericValue;

//         const tabRadioButton = document.getElementById(tabId);
//         if (tabRadioButton) {
//             tabRadioButton.click();
//         }
//     }

// });
// document.addEventListener('keydown', function(event) {  
// });
// function cycleOptions(selectId, direction) {
//     const selectElement = document.getElementById(selectId);
//     const options = selectElement.options;
//     let selectedIndex = selectElement.selectedIndex + direction;

//     if (selectedIndex < 0) {
//         selectedIndex = options.length - 1;
//     } else if (selectedIndex >= options.length) {
//         selectedIndex = 0;
//     }

//     // Update the selected option
//     selectElement.selectedIndex = selectedIndex;
// }

$(document).ready(function() {
    // Call fetchCurrentTasks() on page load and every 2 seconds
    updateformRobotCount();
    updateformLandmarkCount();
    // updateemployeelog();
    // // wait for 2 seconds  before starting to fetch tasks in case user is still loading the page
    // updateRobotStatus();
    // updateLandmarkStatus();
    updateBasecoordinates();
    updatelogselect();
    // fetchCurrentTasks();
    setInterval(updateRobotStatus, 5000);
    setInterval(updateLandmarkStatus, 5000);
    setInterval(fetchCurrentTasks, 2000);
    // setInterval(updateemployeelog, 2000);
    setInterval(updatelogselect, 500);
    setInterval(updateformRobotCount, 20000);
    setInterval(updateformLandmarkCount, 20000);
    
});