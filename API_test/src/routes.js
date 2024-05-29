const TaskHandler = require("../src/handler/taskHandler");
const UserHandler = require("../src/handler/userHandler");
const CatalogHandler = require("../src/handler/catalogHandler");
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
  // GET ALL TASK (NOT NECESSARY FOR THE FRONT END)
  {
    method: "GET",
    path: "/task",
    handler: TaskHandler.getAllTasks,
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
];

module.exports = routes;
