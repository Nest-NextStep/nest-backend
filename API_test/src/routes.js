const {
  getLoginHandler,
  GetTaskHandler,
  editTaskByIdHandler,
  deleteTaskByIdHandler,
  postTaskHandler,
  getCompletedTaskHandler
} = require("../src/handler");

const routes = [
  {
    path: "/login",
    method: "POST",
    handler: getLoginHandler,
  },
  {
    path: "/task",
    method: "GET",
    handler: GetTaskHandler,
  },
  {
    path: "/task/completed",
    method: "GET",
    handler: getCompletedTaskHandler,
  },
  {
    path: "/task",
    method: "POST",
    handler: postTaskHandler,
  },

  {
    path: "/task/{id}",
    method: "PUT",
    handler: editTaskByIdHandler,
  },
  {
    path: "/task/{id}",
    method: "DELETE",
    handler: deleteTaskByIdHandler,
  },
];

module.exports = routes;
