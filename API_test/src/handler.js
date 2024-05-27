const crypto = require("crypto");
const tasks = require("../data/tasks");
const { formatDate } = require("../function/function");

const exampledata = {
  username: "johndoe@gmail.com",
  password: "johndoe123",
};

// LIST APIs
// 1. Login Handler
// 2. Registration Handler
// 3. Get Username Handler
// 4. Get Find Major Handler
// 5. Get Recommended Major Handler
// 6. Get All Major Handler
// 7. Get Major Data Handler
// 8. Get Assesment Result Handler
// 9. Post Assesment Result Handler
// 10. Get Task Handler
// 11. Get Completed Task Handler
// 12. Post Task Handler
// 13. Edit Task Handler
// 14. Delete Task Handler
// 15. Get Profile Handler
// 16. Edit Profile Handler

// Login Handler
const getLoginHandler = (request, h) => {
  const { username, password } = request.payload;

  // TODO: authentication with firebase

  if (username) {
    if (username === exampledata.username && password == exampledata.password) {
      const response = h.response({
        status: "success",
        message: "welcome!",
      });
      response.code(200);
      return response;
    } else {
      const response = h.response({
        status: "failed",
        message: "please ensure that you have inputted the correct data",
      });
      response.code(401);
      return response;
    }
  }
};

// Get Task Count
// Get All Task Handler
const GetTaskHandler = (request, h) => {
  let completed = tasks.filter((task) => task.completed).length;
  let taskCount = tasks.length;
  const filteredTasks = tasks.filter((task) => task.completed == false);
  const task = filteredTasks.map((task) => ({
    title: task.title,
    date: formatDate(task.date),
    priority: task.priority,
    time: `${task.startTime} - ${task.endTime} PM`,
  }));
  const data = {
    completed: completed,
    taskCount: taskCount,
    task,
  };

  const response = h.response({
    status: "success",
    message: "Data",
    content: data,
  });
  response.code(401);
  return response;
};

// Update Task Item Handler
const editTaskByIdHandler = (request, h) => {
  const { id } = request.params;
  const {
    date,
    title,
    startTime,
    endTime,
    duration,
    focusTime,
    breakTime,
    priority,
    repeat,
  } = request.payload;

  const index = tasks.findIndex((task) => task.id === parseInt(id));

  if (index !== -1) {
    tasks[index] = {
      date,
      title,
      startTime,
      endTime,
      duration,
      focusTime,
      breakTime,
      priority,
      repeat,
    };
    const response = h.response({
      status: "success",
      message: "task berhasil diperbarui",
      data: tasks[index],
    });
    response.code(200);
    return response;
  }

  const response = h.response({
    status: "fail",
    message: "Gagal memperbarui catatan. Id tidak ditemukan",
  });
  response.code(404);
  return response;
};

// Delete Task Item Handler
const deleteTaskByIdHandler = (request, h) => {
  const { id } = request.params;
  const index = tasks.findIndex((task) => task.id === parseInt(id));
  if (index !== 1) {
    tasks.splice(index, 1);
    const response = h.response({
      status: "success",
      message: "Catatan berhasil dihapus",
      content: tasks,
    });
    response.code(200);
    return response;
  }
  const response = h.response({
    status: "fail",
    message: "Catatan gagal dihapus. Id tidak ditemukan",
  });
  response.code(404);
  return response;
};

module.exports = {
  getLoginHandler,
  GetTaskHandler,
  editTaskByIdHandler,
  deleteTaskByIdHandler,
};
