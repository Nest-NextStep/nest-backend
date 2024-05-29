const { sequelize } = require("../utils/database");
const { Task } = require("../model/taskModel");

//Get All Task Available
const getAllTasks = async (request, h) => {
  try {
    const [results, metadata] = await sequelize.query("SELECT * FROM task");
    return h.response(results).code(200);
  } catch (error) {
    console.error(error);
    return h.response("Failed to retrieve users").code(500);
  }
};

// Get All Task Based on UserName
const getAllTaskByUsername = async (request, h) => {
  try {
    let { username } = request.params;
    let query = `
      SELECT 
        t.task_name,
        t.task_date,
        t.task_startTime,
        t.task_endTime,
        t.task_duration,
        t.task_focusTime,
        t.task_breakTime,
        t.task_priority,
        t.task_repeat,
        t.isCompleted
      FROM 
        task t 
      JOIN 
        user_data u ON t.user_user_id = u.user_id
      WHERE 
        u.username = ? AND
        t.isCompleted = FALSE
    `;

    // Count of completed tasks
    const queryCompletedCount = `
      SELECT 
        COUNT(*) AS completedCount
      FROM 
        task t 
      JOIN 
        user_data u ON t.user_user_id = u.user_id
      WHERE 
        u.username = ? AND 
        t.isCompleted = true
    `;

    // Total tasks count
    const queryTotalCount = `
      SELECT 
        COUNT(*) AS totalCount
      FROM 
        task t 
      JOIN 
        user_data u ON t.user_user_id = u.user_id
      WHERE 
        u.username = ?
    `;

    const replacements = [username];

    // Execute all queries concurrently
    const [tasksResult, [completedCountResult], [totalCountResult]] =
      await Promise.all([
        sequelize.query(query, { replacements }),
        sequelize.query(queryCompletedCount, { replacements }),
        sequelize.query(queryTotalCount, { replacements }),
      ]);

    // Extract data from results
    const tasks = tasksResult[0];
    const completedCount = completedCountResult[0].completedCount;
    const totalCount = totalCountResult[0].totalCount;

    // Construct response object
    const responseObject = {
      tasks,
      completedCount,
      totalCount,
    };

    return h.response(responseObject).code(200);
  } catch (error) {
    console.error(error);
    return h.response("Failed to retrieve tasks").code(500);
  }
};

//GET TASK BY ID
const getTaskById = async (request, h) => {
  try {
    let { id } = request.params;

    id_parsed = parseInt(id);

    let query = `
      SELECT 
        t.task_name,
        t.task_date,
        t.task_startTime,
        t.task_endTime,
        t.task_duration,
        t.task_focusTime,
        t.task_breakTime,
        t.task_priority,
        t.task_repeat
      FROM 
        task t 
    `;

    const replacements = [];

    // Check if id is provided and add WHERE clause
    if (id) {
      query += " WHERE t.task_id = ?";
      replacements.push(id_parsed);
    }

    const [results, metadata] = await sequelize.query(query, {
      replacements,
    });

    console.log(id);

    return h.response(results).code(200);
  } catch (error) {
    console.error(error);
    return h.response("Failed to retrieve tasks").code(500);
  }
};

// POST TASK
const postTask = async (request, h) => {
  try {
    const {
      task_name,
      task_date,
      task_startTime,
      task_endTime,
      task_duration,
      task_focusTime,
      task_breakTime,
      task_priority,
      task_repeat,
      user_user_id,
      isCompleted,
    } = request.payload;

    // Create a new task using the Task model
    const query = `
      INSERT INTO task (
        task_name,
        task_date,
        task_startTime,
        task_endTime,
        task_duration,
        task_focusTime,
        task_breakTime,
        task_priority,
        task_repeat,
        user_user_id,
        isCompleted
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    const replacements = [
      task_name,
      task_date,
      task_startTime,
      task_endTime,
      task_duration,
      task_focusTime,
      task_breakTime,
      task_priority,
      task_repeat,
      user_user_id,
      false, // Newly created tasks are not completed by default
    ];

    await sequelize.query(query, { replacements });

    return h.response({ status: "success", message: "Task created successfully" }).code(201);
  } catch (error) {
    console.error(error);
    return h.response("Failed to create task").code(500);
  }
};

// EDIT TASK
const editTask = async (request, h) => {
  try {
    const { id } = request.params;
    const {
      task_name,
      task_date,
      task_startTime,
      task_endTime,
      task_duration,
      task_focusTime,
      task_breakTime,
      task_priority,
      task_repeat,
      isCompleted,
    } = request.payload;

    // Update the task in the database
    const query = `
      UPDATE task
      SET
        task_name = ?,
        task_date = ?,
        task_startTime = ?,
        task_endTime = ?,
        task_duration = ?,
        task_focusTime = ?,
        task_breakTime = ?,
        task_priority = ?,
        task_repeat = ?,
        isCompleted = ?
      WHERE
        task_id = ?
    `;

    const replacements = [
      task_name,
      task_date,
      task_startTime,
      task_endTime,
      task_duration,
      task_focusTime,
      task_breakTime,
      task_priority,
      task_repeat,
      isCompleted,
      id,
    ];

    const [result] = await sequelize.query(query, { replacements });

    // Check if any rows were affected (task was found and updated)
    if (result.affectedRows === 0) {
      return h.response({ status: "fail", message: "Task not found" }).code(404);
    }

    return h.response({ status: "success", message: "Task updated successfully" }).code(200);
  } catch (error) {
    console.error(error);
    return h.response("Failed to update task").code(500);
  }
};

// DELETE TASK

const deleteTask = async (request, h) => {
  try {
    const { id } = request.params;

    // Delete the task from the database
    const query = `
      DELETE FROM task
      WHERE task_id = ?
    `;

    const replacements = [id];

    const [result] = await sequelize.query(query, { replacements });

    // Check if any rows were affected (task was found and deleted)
    if (result.affectedRows === 0) {
      return h.response({ status: "fail", message: "Task not found" }).code(404);
    }

    return h.response({ status: "success", message: "Task deleted successfully" }).code(200);
  } catch (error) {
    console.error(error);
    return h.response("Failed to delete task").code(500);
  }
};

module.exports = {
  getAllTaskByUsername,
  getAllTasks,
  getTaskById,
  postTask,
  editTask,
  deleteTask,
};



// LIST APIs
// 10. Get Task Handler
// 11. Get Completed Task Handler
// Get Task Item By ID
// 12. Post Task Handler
// 13. Edit Task Handler
// 14. Delete Task Handler

// Get Task Count
// Get All Task Handler
// const GetTaskHandler = (request, h) => {
//   let completed = tasks.filter((task) => task.completed).length;
//   let taskCount = tasks.length;
//   const filteredTasks = tasks.filter((task) => task.completed == false);
//   const data = {
//     completed: completed,
//     taskCount: taskCount,
//     filteredTasks,
//   };

//   const response = h.response({
//     status: "success",
//     message: "Data",
//     content: data,
//   });
//   response.code(401);
//   return response;
// };

// // Get Completed Task Handler
// const getCompletedTaskHandler = (request, h) => {
//   const completedTasks = tasks.filter((task) => task.completed);
//   const response = h.response({
//     status: "success",
//     data: completedTasks,
//   });
//   response.code(200);
//   return response;
// };

// // Post Task Item Handler
// const postTaskHandler = (request, h) => {
//   const {
//     date,
//     title,
//     startTime,
//     endTime,
//     duration,
//     focusTime,
//     breakTime,
//     priority,
//     repeat,
//   } = request.payload;

//   const newTask = {
//     id: tasks.length + 1,
//     date,
//     title,
//     startTime,
//     endTime,
//     duration,
//     focusTime,
//     breakTime,
//     priority,
//     repeat,
//     completed: false,
//   };

//   tasks.push(newTask);

//   const response = h.response({
//     status: "success",
//     message: "Task created successfully",
//     data: newTask,
//   });
//   response.code(201);
//   return response;
// };

// // Update Task Item Handler
// const editTaskByIdHandler = (request, h) => {
//   const { id } = request.params;
//   const {
//     date,
//     title,
//     startTime,
//     endTime,
//     duration,
//     focusTime,
//     breakTime,
//     priority,
//     repeat,
//   } = request.payload;

//   const index = tasks.findIndex((task) => task.id === parseInt(id));

//   if (index !== -1) {
//     tasks[index] = {
//       date,
//       title,
//       startTime,
//       endTime,
//       duration,
//       focusTime,
//       breakTime,
//       priority,
//       repeat,
//     };
//     const response = h.response({
//       status: "success",
//       message: "task berhasil diperbarui",
//       data: tasks[index],
//     });
//     response.code(200);
//     return response;
//   }

//   const response = h.response({
//     status: "fail",
//     message: "Gagal memperbarui catatan. Id tidak ditemukan",
//   });
//   response.code(404);
//   return response;
// };

// // Delete Task Item Handler
// const deleteTaskByIdHandler = (request, h) => {
//   const { id } = request.params;
//   const index = tasks.findIndex((task) => task.id === parseInt(id));
//   if (index !== 1) {
//     tasks.splice(index, 1);
//     const response = h.response({
//       status: "success",
//       message: "Catatan berhasil dihapus",
//       content: tasks,
//     });
//     response.code(200);
//     return response;
//   }
//   const response = h.response({
//     status: "fail",
//     message: "Catatan gagal dihapus. Id tidak ditemukan",
//   });
//   response.code(404);
//   return response;
// };

// module.exports = {
//   GetTaskHandler,
//   editTaskByIdHandler,
//   deleteTaskByIdHandler,
//   postTaskHandler,
//   getCompletedTaskHandler,
// };
