"use strict";

const { Sequelize } = require("sequelize");
require("dotenv").config();

const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  {
    host: process.env.DB_HOST,
    // port: process.env.DB_PORT,
    dialect: "mysql",
  }
);

// const sequelize = new Sequelize("nest_capstone", "root", null, {
//   host: "localhost",
//   port: 3306,
//   dialect: "mysql",
// });

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
