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
      user_education,
      user_voted,
    } = request.payload;

    const replacements = [
      user_fullName,
      user_birthData,
      user_currentSchool,
      user_gender,
      user_engNat,
      user_religion,
      user_education,
      user_voted,
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
const getProfileOptionHandler = async (request, h) => {
  try {
    let query = `
      SELECT q.profile_id, q.profile_question, o.option_value, o.option_text
      FROM profileQuestion q
      JOIN profileOption o ON q.profile_id = o.profile_id
      ORDER BY q.profile_id, o.option_id;
    `;

    const [result] = await sequelize.query(query);

    // Process the result to map questions to their options
    const mappedResult = {};
    result.forEach((row) => {
      const { profile_id, profile_question, option_value, option_text } = row;
      if (!mappedResult[profile_id]) {
        mappedResult[profile_id] = {
          question_id: profile_id,
          profile_question: profile_question,
          options: [],
        };
      }
      mappedResult[profile_id].options.push({
        option_value: option_value,
        option_text: option_text,
      });
    });

    // Convert the mapped result to the desired format (e.g., an array of objects)
    const response = Object.values(mappedResult);

    return h.response(response).code(200); // Use 200 for successful response
  } catch (error) {
    console.error(error);
    return h.response({ error: "Internal Server Error" }).code(500);
  }
};

module.exports = {
  getUserDataByUsername,
  updateUserByUsernameHandler,
  getProfileOptionHandler,
};
