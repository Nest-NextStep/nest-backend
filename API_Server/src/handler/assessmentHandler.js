const { sequelize } = require("../utils/database");

const getQNAByCategoryHandler = async (request, h) => {
  try {
    const { category } = request.params;
    let query = `
        select 
            q.question_id,
            q.question_text
        from 
            assessment_question q 
        JOIN 
            assessment_category c on c.category_id = q.assessment_category_category_id
        where 
            c.category_name = ?
        `;

    let query_options = `
        select 
            o.option_code, 
            o.option_text 
        from 
            assessment_option o
        join 
            category_option co on co.option_id = o.option_id
        join 
            assessment_category c on c.category_id = co.category_id
        where 
            c.category_name = ?`;

    const replacements = [category];
    const [questionResult, optionResult] = await Promise.all([
      sequelize.query(query, { replacements }),
      sequelize.query(query_options, { replacements }),
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
    let query = `	select m.major_name, um.user_major_date from user_major um
    join user_data u on u.user_id = um.user_user_id
    join major m on m.major_id = um.major_major_id
    WHERE u.username = ?
    ORDER BY um.user_major_date ASC`;

    const replacements = [username];
    const [result] = await sequelize.query(query, { replacements });
    return h.response(result).code(200);
  } catch (error) {
    return error;
  }
};

const getAssessmentResultHandler = async (request, h) => {
  try {
    const { username } = request.params;
    let query = `select m.major_name, m.major_description from user_major um
    join user_data u on u.user_id = um.user_user_id
    join major m on m.major_id = um.major_major_id
    WHERE u.username = ?`;

    const replacements = [username];
    const [result] = await sequelize.query(query, { replacements });
    console.log(result);
    return h.response(result[0]).code(200);
  } catch (error) {
    return error;
  }
};

module.exports = {
  getQNAByCategoryHandler,
  getAssessmentResultHandler,
  getAssessmentDataHandler,
};
