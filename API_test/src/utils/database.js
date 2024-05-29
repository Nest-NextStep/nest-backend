"use strict";

const { Sequelize } = require("sequelize");
require("dotenv").config();

const sequelize = new Sequelize("nest_capstone", "root", null, {
  host: "localhost",
  port: 3306 || 3310, // Specify the port
  dialect: "mysql",
});

const connect = async () => {
  try {
    await sequelize.authenticate();
    console.log("Connection has been established successfully.");
  } catch (error) {
    console.error("Unable to connect to the database:", error);
  }
};

module.exports = {
  sequelize,
  connect,
};
