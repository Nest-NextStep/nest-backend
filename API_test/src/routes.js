const {
  getLoginHandler,
  GetTaskHandler,
  editTaskByIdHandler,
  deleteTaskByIdHandler,
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
