const { admin } = require("./firebase");

const verifyToken = async (request, h) => {
  const authorizationHeader = request.headers.authorization;

  if (!authorizationHeader) {
    return h
      .response({ error: "Missing authorization header" })
      .code(401)
      .takeover();
  }

  const token = authorizationHeader.split(" ")[1];

  if (!token) {
    return h
      .response({ error: "Invalid authorization format" })
      .code(401)
      .takeover();
  }

  try {
    const decodedToken = await admin.auth().verifyIdToken(token);
    request.auth = { uid: decodedToken.uid };
    return h.continue;
  } catch (error) {
    if (error.code === 'auth/id-token-expired') {
      return h.response({ error: "Token expired", reauthenticate: true }).code(401).takeover();
    }
    console.error("Token verification error:", error);
    return h.response({ error: "Unauthorized" }).code(401).takeover();
  }
};

module.exports = { verifyToken };
