const getMajorQuery = ` SELECT 
        m.major_id,
        m.major_name,
        m.major_description
      FROM 
        major m 
      JOIN 
        user_major um on m.major_id = um.major_major_id
      JOIN
        user_data u on um.user_user_id = u.user_id
      WHERE 
        u.username = ?`;

const postUsernameQuery = "INSERT INTO user_data (username) VALUES (?)";
module.exports = { getMajorQuery, postUsernameQuery };
