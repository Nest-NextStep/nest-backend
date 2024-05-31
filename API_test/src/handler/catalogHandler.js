// 4. Get Find Major Handler
const { sequelize } = require("../utils/database");
const CatalogQuery = require("../queries/catalogQueries");

const getAllMajor = async (request, h) => {
  try {
    const { username } = request.params;
    const replacements = [username];

    const [majorAllResult, majorRecommendedData] = await Promise.all([
      sequelize.query("SELECT * FROM major"),
      sequelize.query(CatalogQuery.getAllMajorQuery, { replacements }),
    ]);

    const majorsAll = majorAllResult[0];
    const majorRecommended = majorRecommendedData[0];

    const responseObject = {
      majorRecommended,
      majorsAll,
    };

    return h.response(responseObject).code(200);
  } catch (error) {
    console.error(error);
    return h.response("Failed to retrieve data").code(500);
  }
};

const getMajorDetailByName = async (request, h) => {
  try {
    const { id } = request.params;
    id_parsed = parseInt(id);

    const replacements = [id_parsed];
    const [
      majorDetail,
      majorUniversityDetail,
      majorJobDetail,
      majorOpinionDetail,
    ] = await Promise.all([
      sequelize.query(CatalogQuery.query_majorDetail, { replacements }),
      sequelize.query(CatalogQuery.query_uni, { replacements }),
      sequelize.query(CatalogQuery.query_job, { replacements }),
      sequelize.query(CatalogQuery.query_opinion, { replacements }),
    ]);

    const major = majorDetail[0];
    const majorUniversity = majorUniversityDetail[0];
    const majorJob = majorJobDetail[0];
    const majorOpinion = majorOpinionDetail[0];

    const responseObject = {
      major,
      majorUniversity,
      majorJob,
      majorOpinion,
    };
    return h.response(responseObject).code(200);
  } catch (error) {
    console.error(error);
    return h.response("Failed to retrieve detail").code(500);
  }
};

const findMajorByName = async (request, h) => {
  try {
    const { major_name } = request.query;
    
    if (!major_name) {
      return h.response({ status: "fail", message: "Major name is required" }).code(400);
    }

    const replacements = [`%${major_name}%`];
    const [results] = await sequelize.query(CatalogQuery.query_findMajor, { replacements });

    return h.response({ status: "success", data: results }).code(200);
  } catch (error) {
    console.error(error);
    return h.response("Failed to find majors").code(500);
  }
};

module.exports = { getAllMajor, getMajorDetailByName, findMajorByName };
