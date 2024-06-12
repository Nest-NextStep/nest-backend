const { sequelize } = require("../utils/database");
const ProfileQuery = require("../queries/profileQueries");

const getUserDataByUsername = async (request, h) => {
  try {
    const { username } = request.params;
    const replacements = [username];

    const [profileResults, majorResult] = await Promise.all([
      sequelize.query(ProfileQuery.getUserDataQuery, { replacements }),
      sequelize.query(ProfileQuery.getMajorQuery, { replacements }),
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

    const [result] = await sequelize.query(ProfileQuery.updateProfileQuery, {
      replacements,
    });

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
