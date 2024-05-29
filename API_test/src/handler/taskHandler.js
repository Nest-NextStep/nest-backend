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

// Get All Task Based on Username
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

    return h
      .response({ status: "success", message: "Task created successfully" })
      .code(201);
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
      return h
        .response({ status: "fail", message: "Task not found" })
        .code(404);
    }

    return h
      .response({ status: "success", message: "Task updated successfully" })
      .code(200);
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
      return h
        .response({ status: "fail", message: "Task not found" })
        .code(404);
    }

    return h
      .response({ status: "success", message: "Task deleted successfully" })
      .code(200);
  } catch (error) {
    console.error(error);
    return h.response("Failed to delete task").code(500);
  }
};

// GET ALL COMPLETED TASK
const getAllCompletedTask = async (request, h) => {
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
        t.isCompleted = TRUE
    `;

    const replacements = [username];

    // Execute all queries concurrently
    const [tasksResult] = await Promise.all([
      sequelize.query(query, { replacements }),
    ]);

    // Extract data from results
    const tasks = tasksResult[0];

    return h.response(tasks).code(200);
  } catch (error) {
    console.error(error);
    return h.response("Failed to retrieve tasks").code(500);
  }
};

module.exports = {
  getAllTaskByUsername,
  getAllCompletedTask,
  getAllTasks,
  getTaskById,
  postTask,
  editTask,
  deleteTask,
};
