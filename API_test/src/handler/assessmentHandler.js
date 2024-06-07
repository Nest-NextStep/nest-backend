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

module.exports = {
  getQNAByCategoryHandler,
};
