// from data.js
var tableData = data;

console.log(tableData);

// YOUR CODE HERE!
// Get a reference to the table body
var tbody = d3.select("tbody");

tableData.forEach(function(ufoReport) {
    console.log(ufoReport);
    var row = tbody.append("tr");
    Object.entries(ufoReport).forEach(function([key, value]) {
        console.log(key, value);
        // Append a cell to the row for each value
        // in the UFO report object
    var cell = tbody.append("td");
    cell.text(value);
    });
}); 
 /* ********************************************************************************
                            DATE INPUT FORM
  ***********************************************************************************/

// Select the submit button
var submit = d3.select("#filter-btn");

submit.on("click", function() {
    
   // Prevent the page from refreshing
   d3.event.preventDefault();
   var tbody = d3.select("tbody");
   tbody.html("");
   // Select the input element and get the raw HTML node
    var inputElement = d3.select("#datetime");

   // Get the value property of the input element
    var inputValue = inputElement.property("value");

    console.log(inputValue);
    console.log(tableData);

    var filteredData = tableData.filter(siting => siting.datetime = inputValue);

    console.log(filteredData);

  
    /* ********************************************************************************
                CREATE DATA TABLE
    ***********************************************************************************/
  // Get a reference to the table body
   var tbody = d3.select("tbody");

  // Console.log the weather data from data.js
   console.log(data);

   filteredData.forEach(function(ufoReport) {
    console.log(ufoReport);
    var row = tbody.append("tr");
    Object.entries(ufoReport).forEach(function([key, value]) {
        console.log(key, value);
        // Append a cell to the row for each value
        // in the UFO report object
    var cell = tbody.append("td");
    cell.text(value);
    }); 
  });
  
});


