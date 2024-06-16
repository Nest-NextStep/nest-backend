const getAllMajorQuery = `
      SELECT 
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
        u.username = ?
`;

//GET MAJOR IMAGE, MAJOR NAME, MAJOR DESCRIPTION
const query_majorDetail = " SELECT * FROM major m WHERE m.major_id = ?";

// GET UNI LIST
const query_uni = `
     SELECT 
        u.university_image,
        u.university_id,
        u.university_name,
        u.university_location,
        u.university_acreditation,
        u.university_link 
    FROM 
        major m
    JOIN 
        university u on m.major_id = u.major_major_id
    WHERE 
        m.major_id = ?
`;

//GET POTENTIAL JOBS
const query_job = ` 
    SELECT 
        p.jobs_id,
        p.jobs_name,
        p.jobs_salary, 
        p.jobs_description 
    FROM 
        major m
    JOIN 
        potential_jobs p on m.major_id = p.major_major_id
    WHERE 
        m.major_id = ? 
`;

//GET ALUMNI OPINIONS
const query_opinion = `
     SELECT 
        a.opinion_id,
        a.opinion_name, 
        a.opinions_content 
    FROM 
        major m
    JOIN 
        alumni_opinions a on m.major_id = a.major_major_id
    WHERE 
    m.major_id = ?
`;

const query_findMajor = `
  SELECT 
    m.major_id,
    m.major_name,
    m.major_description
  FROM 
    major m
  WHERE 
    m.major_name LIKE ?
`;

module.exports = {
  getAllMajorQuery,
  query_uni,
  query_job,
  query_opinion,
  query_majorDetail,
  query_findMajor,
};
