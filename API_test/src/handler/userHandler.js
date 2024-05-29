"use strict";

const User = require("../model/userModel");
const { sequelize } = require("../utils/database");

const getAllUsers = async (request, h) => {
  const { username } = request.params;
  try {
    const [results, metadata] = await sequelize.query(
      "SELECT * FROM user_data"
    );
    return h.response(results).code(200);
  } catch (error) {
    console.error(error);
    return h.response("Failed to retrieve users").code(500);
  }
};

module.exports = {
  getAllUsers,
};
