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
      C1,
      C2,
      C3,
      C5,
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

    let query = `SELECT * from user_data where username = ?`;

    const [results] = await sequelize.query(query, {
      replacements: [username],
    });

    let queryGetValue = `select option_value from profileOption where option_text = ?;`;

    const [result_education] = await sequelize.query(queryGetValue, {
      replacements: [results[0].user_education],
    });
    const [result_gender] = await sequelize.query(queryGetValue, {
      replacements: [results[0].user_gender],
    });
    const [result_engnat] = await sequelize.query(queryGetValue, {
      replacements: [results[0].user_engNat],
    });
    const [result_religion] = await sequelize.query(queryGetValue, {
      replacements: [results[0].user_religion],
    });
    const [result_voted] = await sequelize.query(queryGetValue, {
      replacements: [results[0].user_voted],
    });

    let education = result_education[0].option_value;
    let gender = result_gender[0].option_value;
    let engnat = result_engnat[0].option_value;
    let religion = result_religion[0].option_value;
    let voted = result_voted[0].option_value;

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
      C1,
      C2,
      C3,
      C5,
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
      education,
      gender,
      engnat,
      religion,
      voted,
    };

    const predictAPI = process.env.PREDICT_API_URL;
    const response = await axios.post(predictAPI, data);

    const predictedMajor = response.data.prediction[0];
    const capitalizedMajor =
      predictedMajor[0].toUpperCase() + predictedMajor.slice(1);
    const replacements = [capitalizedMajor, username];

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
