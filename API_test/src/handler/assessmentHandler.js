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

    // Create a mapping of category options
    const optionsMapping = optionData.reduce((acc, option) => {
      if (!acc[option.category_id]) {
        acc[option.category_id] = [];
      }
      acc[option.category_id].push({
        option_code: option.option_code,
        option_text: option.option_text,
      });
      return acc;
    }, {});

    // Add relevant options to each question
    const enrichedQuestionsData = questionsData.map((question) => {
      return {
        ...question,
        options: optionsMapping[question.category_id] || [],
      };
    });

    const responseObject = {
      questionsData: enrichedQuestionsData,
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
