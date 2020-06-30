require("dotenv").config();

// Initialize npm packages
var mysql = require("mysql");
var inquirer = require("inquirer");
var Table = require("cli-table");

// Initializes connection to sync with MySQL database
var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,

  // SQL login
  user: "root",
  password: process.env.Password,
  database: "Bamazon"
});

// Creates connection with server and callback to display product inventory
connection.connect(function(err) {
  if (err) {
    console.error("error connecting: " + err.stack);
  }
  makeTable();
});

// This function pulls inventory from database and displays results in a table on console
var makeTable = function() {

// Selects all product data from database
  connection.query("SELECT * FROM products", function(err, res) {
    if (err) throw err;

// Prints table of inventory to console
    var displayTable = new Table({
      head: ["Item ID", "Product Name", "Category", "Price", "Quantity"],
      colWidths: [10, 25, 25, 10, 14]
  });
  for (var i = 0; i < res.length; i++) {
      displayTable.push(
          [res[i].item_id, res[i].product_name, res[i].department_name, res[i].price, res[i].stock_quantity]
      );
  }
  console.log(displayTable.toString());

// Runs function for customer prompts to purchase inventory
    promptCustomer(res);
  });
};

// Function that holds customer prompts
var promptCustomer = function(res) {

// Prompts user to choose item to purchase
  inquirer.prompt([{
    type: "input",
    name: "purchitem",
    message: "What would you like to purchase? [X to Quit]"
  }]).then(function(val) {

// Sets var qualifier to false - this forces user to enter correct product name
    var qualifier = false;

// Loops through table to make sure product exists
    for (var i = 0; i < res.length; i++) {

// If loop finds product, pulls product data into local variables
      if (res[i].product_name === val.purchitem) {
        qualifier = true;
        var product = val.purchitem;
        var id = i;

// Prompts user for amount of items to purchase
        inquirer.prompt([{
          type: "input",
          name: "amount",
          message: "How many would you like to buy?"
        }]).then(function(val) {

// Check database to see if the requested amount is available
          if ((res[id].stock_quantity - val.amount) > 0) {

// Subtracts requested amount from database
            connection.query(
              "UPDATE products SET stock_quantity='" + (res[id].stock_quantity - val.amount) +
              "' WHERE product_name='" + product + "'",
              function(err, res2) {
                if (err) {
                  throw err;
                }

// Message confirms purchase and gives total amount
                console.log("\n  " + val.amount + " of " + product + " bought for " + (res[id].price * val.amount) + "\n");

// Pushes updated product inventory to table and starts purchase process again
                makeTable();
              });
          }

// If amount requested is greater than available amount, gives insufficient quantity message and resends purchase prompt
          else {
            console.log("\n  WE DON'T HAVE THAT QUANTITY. ONLY " + res[id].stock_quantity + " CURRENTLY AVAILABLE.\n  PLEASE TRY AGAIN.\n");
            promptCustomer(res);
          }
        });
      }
// Gives user a way to exit node process
      if (val.purchitem === "X" || val.purchitem === "x") {
        process.exit();
      }
    }

// If requested item does not exist, displays message and resends purchase prompt
    if (i === res.length && qualifier === false) {
      console.log("NOT A VALID SELECTION");
      promptCustomer(res);
    }
  });
};
