const { sequelize } = require("../utils/database");
const { Task } = require("../model/taskModel");
const TaskQuery = require("../queries/taskQueries");
const { messaging } = require("firebase-admin");

//Get All Task Available
const getAllTasks = async (request, h) => {
  try {
    const [results] = await sequelize.query("SELECT * FROM task");
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
    const replacements = [username];

    const [tasksResult, [completedCountResult], [totalCountResult]] =
      await Promise.all([
        sequelize.query(TaskQuery.uncompletedTaskList, { replacements }),
        sequelize.query(TaskQuery.completedTaskCount, { replacements }),
        sequelize.query(TaskQuery.totalTaskCount, { replacements }),
      ]);

    const tasks = tasksResult[0];
    const completedCount = completedCountResult[0].completedCount;
    const totalCount = totalCountResult[0].totalCount;

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

    const replacements = [id_parsed];
    const [results, metadata] = await sequelize.query(TaskQuery.taskDetail, {
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
    const { username } = request.params;
    const date = new Date();

    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");
    const hours = String(date.getHours()).padStart(2, "0");
    const minutes = String(date.getMinutes()).padStart(2, "0");
    const seconds = String(date.getSeconds()).padStart(2, "0");

    const formattedDateTime = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;

    const {
      taskName,
      taskDate,
      taskStartTime,
      taskEndTime,
      taskDuration,
      taskFocusTime,
      taskBreakTime,
      taskPriority,
      taskRepeat,
      isCompleted,
    } = request.payload;

    const [userRecord] = await sequelize.query(TaskQuery.userQuery, {
      replacements: [username],
      type: sequelize.QueryTypes.SELECT,
    });

    if (!userRecord || !userRecord.user_id) {
      return h.response("User not found").code(404);
    }

    const { user_id } = userRecord;

    const replacements = [
      taskName,
      taskDate,
      taskStartTime,
      taskEndTime,
      taskDuration,
      taskFocusTime,
      taskBreakTime,
      taskPriority,
      taskRepeat,
      user_id,
      isCompleted,
      formattedDateTime,
    ];

    await sequelize.query(TaskQuery.postTaskQuery, { replacements });

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
      taskName,
      taskDate,
      taskStartTime,
      taskEndTime,
      taskDuration,
      taskFocusTime,
      taskBreakTime,
      taskPriority,
      taskRepeat,
      isCompleted,
    } = request.payload;

    const replacements = [
      taskName,
      taskDate,
      taskStartTime,
      taskEndTime,
      taskDuration,
      taskFocusTime,
      taskBreakTime,
      taskPriority,
      taskRepeat,
      isCompleted,
      id,
    ];

    const [result] = await sequelize.query(TaskQuery.updateTask, {
      replacements,
    });

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

    const replacements = [id];

    const [result] = await sequelize.query(TaskQuery.deleteTask, {
      replacements,
    });

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

    const replacements = [username];

    const [tasksResult] = await Promise.all([
      sequelize.query(TaskQuery.completedTaskList, { replacements }),
    ]);

    const tasks = tasksResult[0];

    return h.response(tasks).code(200);
  } catch (error) {
    console.error(error);
    return h.response("Failed to retrieve tasks").code(500);
  }
};

// UPDATE TASK TO COMPLETED
const updateTaskToCompleteHandler = async (request, h) => {
  try {
    const { id } = request.params;
    id_parsed = parseInt(id);
    const replacements = [id_parsed];

    let query = `select isCompleted from task where task_id = ?`;
    const [result_isCompleted] = await sequelize.query(query, {
      replacements,
    });

    let isCompleted = result_isCompleted[0].isCompleted;
    let messages;
    if (isCompleted == 1) {
      const [result] = await sequelize.query(
        TaskQuery.updateTaskToNotComplete,
        {
          replacements,
        }
      );
      messages = "update to not complete success";
    } else {
      const [result] = await sequelize.query(TaskQuery.updateTaskToComplete, {
        replacements,
      });
      messages = "update to complete success";
    }
    return h.response({ status: "success", message: messages }).code(200);
  } catch (error) {
    console.log(error);
    return h.response("Failed to update task").code(500);
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
  updateTaskToCompleteHandler,
};
