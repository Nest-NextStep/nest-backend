const uncompletedTaskList = `
      SELECT 
        t.task_id,
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
      ORDER BY 
        createdAt ASC
`;

// Count of completed tasks
const completedTaskCount = `
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

const totalTaskCount = `
      SELECT 
        COUNT(*) AS totalCount
      FROM 
        task t 
      JOIN 
        user_data u ON t.user_user_id = u.user_id
      WHERE 
        u.username = ?
`;

const taskDetail = `
      SELECT 
        t.task_id,
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

const postTaskQuery = `
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
        isCompleted,
        createdAt
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

const updateTask = `
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

const deleteTask = `
      DELETE FROM task
      WHERE task_id = ?
`;

const completedTaskList = `
      SELECT 
        t.task_id,
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
      ORDER BY 
        createdAt ASC
`;

const updateTaskToComplete = `
      UPDATE 
        task 
      SET 
        task.isCompleted = true 
      WHERE
        task.task_id = ? 
`;

const userQuery = `SELECT user_id FROM user_data WHERE username = ?`;

module.exports = {
  completedTaskCount,
  completedTaskList,
  deleteTask,
  updateTask,
  postTaskQuery,
  taskDetail,
  totalTaskCount,
  uncompletedTaskList,
  updateTaskToComplete,
  userQuery,
};
