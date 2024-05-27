const TaskHandler = require("../src/handler/taskHandler");
const UserHandler = require("../src/handler/userHandler");

const routes = [
  //USER HANDLER
  {
    method: "GET",
    path: "/users",
    handler: UserHandler.getAllUsers,
  },

  // TASK HANDLER
  {
    method: "GET",
    path: "/task/user/{username}",
    handler: TaskHandler.getAllTaskByUsername,
  },
  {
    method: "GET",
    path: "/task",
    handler: TaskHandler.getAllTasks,
  },
  {
    method: "GET",
    path: "/task/{id}",
    handler: TaskHandler.getTaskById,
  },

  // {
  //   path: "/task",
  //   method: "GET",
  //   handler: GetTaskHandler,
  // },
  // {
  //   path: "/task/completed",
  //   method: "GET",
  //   handler: getCompletedTaskHandler,
  // },
  // {
  //   path: "/task",
  //   method: "POST",
  //   handler: postTaskHandler,
  // },

  // {
  //   path: "/task/{id}",
  //   method: "PUT",
  //   handler: editTaskByIdHandler,
  // },
  // {
  //   path: "/task/{id}",
  //   method: "DELETE",
  //   handler: deleteTaskByIdHandler,
  // },
];

module.exports = routes;
