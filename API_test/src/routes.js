const TaskHandler = require("../src/handler/taskHandler");
const UserHandler = require("../src/handler/userHandler");
const CatalogHandler = require("../src/handler/catalogHandler");
const ProfileHandler = require("../src/handler/profileHandler");
const AssessmentHandler = require("../src/handler/assessmentHandler");
const { Task } = require("./model/taskModel");

const routes = [
  //USER HANDLER
  {
    method: "GET",
    path: "/users",
    handler: UserHandler.getAllUsers,
  },

  // TASK HANDLER
  // GET ALL UNCOMPLETED TASK, TOTAL COUNT, TOTAL UNCOMPLETED COUNT
  {
    method: "GET",
    path: "/task/user/{username}",
    handler: TaskHandler.getAllTaskByUsername,
  },
  // GET TASK BASED ON ID
  {
    method: "GET",
    path: "/task/{id}",
    handler: TaskHandler.getTaskById,
  },
  // GET COMPLETED TASK BY USERNAME
  {
    method: "GET",
    path: "/task/completed/{username}",
    handler: TaskHandler.getAllCompletedTask,
  },
  // POST NEW TASK
  {
    method: "POST",
    path: "/task",
    handler: TaskHandler.postTask,
  },
  // EDIT TASK BY ID
  {
    method: "PUT",
    path: "/task/{id}",
    handler: TaskHandler.editTask,
  },
  {
    method: "PUT",
    path: "/task/complete/{id}",
    handler: TaskHandler.updateTaskToCompleteHandler,
  },
  // DELETE TASK BY ID
  {
    method: "DELETE",
    path: "/task/{id}",
    handler: TaskHandler.deleteTask,
  },

  //CATALOG HANDLER
  //GET RECOMENNDED, ALL MAJOR
  {
    method: "GET",
    path: "/major/{username}",
    handler: CatalogHandler.getAllMajor,
  },
  {
    method: "GET",
    path: "/major/detail/{id}",
    handler: CatalogHandler.getMajorDetailByName,
  },
  {
    method: "GET",
    path: "/major/search",
    handler: CatalogHandler.findMajorByName,
  },

  //Profile Handler
  {
    method: "GET",
    path: "/profile/{username}",
    handler: ProfileHandler.getUserDataByUsername,
  },
  {
    method: "PUT",
    path: "/profile/update/{username}",
    handler: ProfileHandler.updateUserByUsernameHandler,
  },

  //assessment Handler
  {
    method: "GET",
    path: "/assessment/{category}",
    handler: AssessmentHandler.getQNAByCategoryHandler,
  },
];

module.exports = routes;
