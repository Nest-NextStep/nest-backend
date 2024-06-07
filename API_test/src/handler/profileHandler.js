const { sequelize } = require("../utils/database");

const getUserDataByUsername = async (request, h) => {
  try {
    // BELOM ADA DATA PROFILE URL, PASSWORD, email
    const { username } = request.params;
    var query = ` SELECT *, TIMESTAMPDIFF(YEAR, user_birthDate, CURDATE()) AS age from user_data u where u.username = ?`;

    const queryMajor = `SELECT m.major_name from major m 
      JOIN user_major um on um.major_major_id = m.major_id
      JOIN user_data u on u.user_id = um.user_user_id
      where u.username = ?`;
    const replacements = [username];

    const [profileResults, majorResult] = await Promise.all([
      sequelize.query(query, { replacements }),
      sequelize.query(queryMajor, { replacements }),
    ]);

    profileData = profileResults[0][0];
    majorData = majorResult[0];

    const responseObject = {
      profileData,
      majorData,
    };

    return h.response(responseObject).code(200);
  } catch (error) {
    console.error(error);
    return h.response("Failed to retrieve user data").code(500);
  }
};

const updateUserByUsernameHandler = async (request, h) => {
  try {
    const { username } = request.params;
    const {
      user_fullName,
      user_birthData,
      user_currentSchool,
      user_gender,
      user_engNat,
      user_religion,
    } = request.payload;

    const replacements = [
      user_fullName,
      user_birthData,
      user_currentSchool,
      user_gender,
      user_engNat,
      user_religion,
      username,
    ];

    let query = `UPDATE user_data
    SET user_fullName = ?,
    user_birthDate = ?,
    user_school = ?,
    user_gender = ?,
    user_engNat = ?,
    user_religion = ?
    WHERE username = ?;`;

    const [result] = await sequelize.query(query, { replacements });
    console.log(result);
    return h
      .response({
        status: "success",
        message: "User data updated successfully",
      })
      .code(200);
  } catch (error) {
    console.error(error);
    return h.response("Failed to retrieve user data").code(500);
  }
};

module.exports = { getUserDataByUsername, updateUserByUsernameHandler };
