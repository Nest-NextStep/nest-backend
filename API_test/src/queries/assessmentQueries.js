const getQuestionQuery = `        
        select 
            q.question_id,
            q.question_text
        from 
            assessment_question q 
        JOIN 
            assessment_category c on c.category_id = q.assessment_category_category_id
        where 
            c.category_name = ?`;

const getOptionQuery = `
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

const getAssessmentDataQuery = `	select m.major_name, um.user_major_date from user_major um
    join user_data u on u.user_id = um.user_user_id
    join major m on m.major_id = um.major_major_id
    WHERE u.username = ?
    ORDER BY um.user_major_date ASC`;

const getAssessmentResultDataQuery = `select m.major_name, m.major_description from major m where m.major_name = ?`;

const postResultQuery = `INSERT IGNORE INTO user_major (major_major_id, user_user_id, user_major_date)
    SELECT m.major_id, u.user_id, CURDATE() as user_major_date
    FROM user_data u
    JOIN major m ON m.major_name = ? AND u.username = ?
    `;

module.exports = {
  getQuestionQuery,
  getOptionQuery,
  getAssessmentDataQuery,
  getAssessmentResultDataQuery,
  postResultQuery,
};
