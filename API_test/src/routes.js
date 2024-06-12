const AuthHandler = require("../src/handler/authHandler");
const TaskHandler = require("../src/handler/taskHandler");
const CatalogHandler = require("../src/handler/catalogHandler");
const ProfileHandler = require("../src/handler/profileHandler");
const AssessmentHandler = require("../src/handler/assessmentHandler");
const { Task } = require("./model/taskModel");
const { verifyToken } = require("../src/utils/auth");
const { Auth } = require("firebase-admin/auth");

const routes = [
  // AUTH HANDLER
  {
    method: "POST",
    path: "/register",
    handler: AuthHandler.registerUser,
  },
  {
    method: "POST",
    path: "/login",
    handler: AuthHandler.loginUser,
  },
  {
    method: "POST",
    path: "/refresh-token",
    handler: AuthHandler.refreshToken,
  },
  {
    method: "POST",
    path: "/change-password",
    handler: AuthHandler.changePassword,
    options: {
      pre: [{ method: verifyToken }],
    },
  },
  {
    method: "POST",
    path: "/logout",
    handler: AuthHandler.logoutUserHandler,
    options: {
      pre: [{ method: verifyToken }],
    },
  },

  // TASK HANDLER
  // GET ALL UNCOMPLETED TASK, TOTAL COUNT, TOTAL UNCOMPLETED COUNT
  {
    method: "GET",
    path: "/task/user/{username}",
    handler: TaskHandler.getAllTaskByUsername,
    options: {
      pre: [{ method: verifyToken }],
    },
  },
  // GET TASK BASED ON ID
  {
    method: "GET",
    path: "/task/{id}",
    handler: TaskHandler.getTaskById,
    options: {
      pre: [{ method: verifyToken }],
    },
  },
  // GET COMPLETED TASK BY USERNAME
  {
    method: "GET",
    path: "/task/completed/{username}",
    handler: TaskHandler.getAllCompletedTask,
    options: {
      pre: [{ method: verifyToken }],
    },
  },
  // POST NEW TASK
  {
    method: "POST",
    path: "/task/{username}",
    handler: TaskHandler.postTask,
    options: {
      pre: [{ method: verifyToken }],
    },
  },
  // EDIT TASK BY ID
  {
    method: "PUT",
    path: "/task/{id}",
    handler: TaskHandler.editTask,
    options: {
      pre: [{ method: verifyToken }],
    },
  },
  {
    method: "PUT",
    path: "/task/complete/{id}",
    handler: TaskHandler.updateTaskToCompleteHandler,
    options: {
      pre: [{ method: verifyToken }],
    },
  },
  // DELETE TASK BY ID
  {
    method: "DELETE",
    path: "/task/{id}",
    handler: TaskHandler.deleteTask,
    options: {
      pre: [{ method: verifyToken }],
    },
  },

  //CATALOG HANDLER
  //GET RECOMENNDED, ALL MAJOR
  {
    method: "GET",
    path: "/major/{username}",
    handler: CatalogHandler.getAllMajor,
    options: {
      pre: [{ method: verifyToken }],
    },
  },
  {
    method: "GET",
    path: "/major/detail/{id}",
    handler: CatalogHandler.getMajorDetailByName,
    options: {
      pre: [{ method: verifyToken }],
    },
  },
  {
    method: "GET",
    path: "/major/search",
    handler: CatalogHandler.findMajorByName,
    options: {
      pre: [{ method: verifyToken }],
    },
  },

  //Profile Handler
  {
    method: "GET",
    path: "/profile/{username}",
    handler: ProfileHandler.getUserDataByUsername,
    options: {
      pre: [{ method: verifyToken }],
    },
  },
  {
    method: "PUT",
    path: "/profile/update/{username}",
    handler: ProfileHandler.updateUserByUsernameHandler,
    options: {
      pre: [{ method: verifyToken }],
    },
  },

  //assessment Handler
  {
    method: "GET",
    path: "/assessment/{category}",
    handler: AssessmentHandler.getQNAByCategoryHandler,
    options: {
      pre: [{ method: verifyToken }],
    },
  },
  {
    method: "POST",
    path: "/assessment/result/{username}",
    handler: AssessmentHandler.predictMajorHandler,
    options: {
      pre: [{ method: verifyToken }],
    },
  },
  {
    method: "GET",
    path: "/assessment/data/{username}",
    handler: AssessmentHandler.getAssessmentDataHandler,
    options: {
      pre: [{ method: verifyToken }],
    },
  },
];

module.exports = routes;
