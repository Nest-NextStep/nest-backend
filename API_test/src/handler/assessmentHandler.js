const { sequelize } = require("../utils/database");
const AssessmentQuery = require("../queries/assessmentQueries");
const axios = require("axios");
require("dotenv").config();

const getQNAByCategoryHandler = async (request, h) => {
  try {
    const { category } = request.params;
    const replacements = [category];

    const [questionResult, optionResult] = await Promise.all([
      sequelize.query(AssessmentQuery.getQuestionQuery, { replacements }),
      sequelize.query(AssessmentQuery.getOptionQuery, { replacements }),
    ]);

    questionsData = questionResult[0];
    optionData = optionResult[0];

    const responseObject = {
      questionsData,
      optionData,
    };

    return h.response(responseObject).code(200);
  } catch (error) {
    console.log(error);
    return h.response("Failed to get question").code(500);
  }
};

const getAssessmentDataHandler = async (request, h) => {
  try {
    const { username } = request.params;
    const replacements = [username];

    const [result] = await sequelize.query(
      AssessmentQuery.getAssessmentDataQuery,
      { replacements }
    );
    return h.response(result).code(200);
  } catch (error) {
    return error;
  }
};

const predictMajorHandler = async (request, h) => {
  try {
    const { username } = request.params;
    const {
      R1,
      R2,
      R4,
      R6,
      R7,
      R8,
      I1,
      I2,
      I4,
      I5,
      I7,
      I8,
      A2,
      A3,
      A4,
      A5,
      A6,
      A8,
      S1,
      S3,
      S5,
      S6,
      S7,
      S8,
      E1,
      E3,
      E4,
      E5,
      E7,
      E8,
      C2,
      C3,
      C5,
      C6,
      C7,
      C8,
      TIPI1,
      TIPI2,
      TIPI3,
      TIPI4,
      TIPI5,
      TIPI6,
      TIPI7,
      TIPI8,
      TIPI9,
      TIPI10,
      VCL1,
      VCL2,
      VCL3,
      VCL4,
      VCL5,
      VCL6,
      VCL10,
      VCL11,
      VCL12,
      VCL13,
      VCL14,
      VCL15,
    } = request.payload;

    const data = {
      R1,
      R2,
      R4,
      R6,
      R7,
      R8,
      I1,
      I2,
      I4,
      I5,
      I7,
      I8,
      A2,
      A3,
      A4,
      A5,
      A6,
      A8,
      S1,
      S3,
      S5,
      S6,
      S7,
      S8,
      E1,
      E3,
      E4,
      E5,
      E7,
      E8,
      C2,
      C3,
      C5,
      C6,
      C7,
      C8,
      TIPI1,
      TIPI2,
      TIPI3,
      TIPI4,
      TIPI5,
      TIPI6,
      TIPI7,
      TIPI8,
      TIPI9,
      TIPI10,
      VCL1,
      VCL2,
      VCL3,
      VCL4,
      VCL5,
      VCL6,
      VCL10,
      VCL11,
      VCL12,
      VCL13,
      VCL14,
      VCL15,
    };

    const predictAPI = process.env.PREDICT_API_URL;
    const response = await axios.post(predictAPI, data);
    const predictedMajor = response.data.data.prediction;
    console.log(predictedMajor);
    const replacements = [predictedMajor, username];

    let query_checker = `select count(major_id) as checker from major 
    join user_major on major_major_id = major_id
    join user_data on user_id = user_user_id
    where username = ? && major_name = ? `;

    let query_update = `UPDATE user_major AS um
    JOIN major AS m ON um.major_major_id = m.major_id
    JOIN user_data AS ud ON um.user_user_id = ud.user_id
    SET um.user_major_date = CURDATE()
    WHERE ud.username = ? AND m.major_name = ?;`;

    const [result_check] = await sequelize.query(query_checker, {
      replacements: [username, predictedMajor],
    });

    if ((result_check[0].checker = 0)) {
      await sequelize.query(AssessmentQuery.postResultQuery, {
        replacements,
      });
    } else {
      await sequelize.query(query_update, {
        replacements: [username, predictedMajor],
      });
    }

    const [result] = await sequelize.query(
      AssessmentQuery.getAssessmentResultDataQuery,
      { replacements }
    );

    await sequelize.query(AssessmentQuery.postResultQuery, { replacements });

    return h.response(result[0]).code(200);
  } catch (error) {
    return h.response(error.message).code(500);
  }
};

module.exports = {
  getQNAByCategoryHandler,
  getAssessmentDataHandler,
  predictMajorHandler,
};
