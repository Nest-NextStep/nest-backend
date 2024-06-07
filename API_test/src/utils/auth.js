const { admin } = require("./firebase");

const verifyToken = async (request, h) => {
  const token = request.headers.authorization;
  try {
    const decodedToken = await admin.auth().verifyIdToken(token);
    request.auth = { uid: decodedToken.uid };
    return h.continue;
  } catch (error) {
    return h.response({ error: "Unauthorized" }).code(401).takeover();
  }
};

module.exports = { verifyToken };