const getMajorQuery = `SELECT m.major_name from major m 
      JOIN user_major um on um.major_major_id = m.major_id
      JOIN user_data u on u.user_id = um.user_user_id
      where u.username = ?
      LIMIT 2;
`;

const updateProfileQuery = `UPDATE user_data
    SET user_fullName = ?,
    user_birthDate = ?,
    user_school = ?,
    user_gender = ?,
    user_engNat = ?,
    user_religion = ?
    WHERE username = ?;
`;

const getUserDataQuery = ` SELECT *, TIMESTAMPDIFF(YEAR, user_birthDate, CURDATE()) AS age from user_data u where u.username = ?`;

module.exports = { getMajorQuery, updateProfileQuery, getUserDataQuery };
