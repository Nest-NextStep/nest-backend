// /src/handler/authHandler.js
const { firebase } = require("../utils/firebase");
const admin = require("firebase-admin");
const { getAuth, signInWithEmailAndPassword } = require("firebase/auth");
const { sequelize } = require("../utils/database");

const registerUser = async (request, h) => {
  try {
    const { email, password, displayName } = request.payload;

    // Create the user using Firebase Admin SDK
    const userRecord = await admin.auth().createUser({
      email,
      password,
    });

    // Update the user's display name (username in this case)
    const result = await admin.auth().updateUser(userRecord.uid, {
      displayName: displayName,
    });

    const userCredential = await signInWithEmailAndPassword(
      auth,
      email,
      password
    );

    const user = userCredential.user;
    const accessToken = await user.getIdToken();
    const replacements = [displayName];
    const username = displayName;

    if (result != null) {
      await sequelize.query("INSERT INTO user_data (username) VALUES (?)", {
        replacements,
      });
      return h
        .response({
          uid: userRecord.uid,
          accessToken: accessToken,
          username: username,
          message: "User registered successfully",
        })
        .code(201);
    }
  } catch (error) {
    console.error("Error registering user:", error);
    return h.response({ error: error.message }).code(500);
  }
};

const auth = getAuth();
const loginUser = async (request, h) => {
  try {
    const { email, password } = request.payload;

    // Using signInWithEmailAndPassword to authenticate user
    const userCredential = await signInWithEmailAndPassword(
      auth,
      email,
      password
    );

    // Retrieve user details
    const user = userCredential.user;
    const { uid, displayName } = user;
    const username = displayName;
    const replacements = [username];

    // Get ID token
    const accessToken = await user.getIdToken();

    // Return user information and token in the response
    if (userCredential != null) {
      const [result] = await sequelize.query(
        ` SELECT 
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
        u.username = ?`,
        {
          replacements,
        }
      );
      return h
        .response({
          uid,
          username,
          accessToken,
          recommendedMajor: result,
        })
        .code(200);
    }
  } catch (error) {
    console.error("Login error:", error);
    return h.response({ error: error.message }).code(401);
  }
};

module.exports = { registerUser, loginUser };
