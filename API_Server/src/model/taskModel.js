"use strict";

const { DataTypes } = require("sequelize");
const { sequelize } = require("../utils/database");

const Task = sequelize.define(
  "Task",
  {
    task_id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    task_name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    task_date: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    task_startTime: {
      type: DataTypes.TIME,
      allowNull: false,
    },
    task_endTime: {
      type: DataTypes.TIME,
      allowNull: false,
    },
    task_duration: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    task_focusTime: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    task_breakTime: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    task_priority: {
      type: DataTypes.STRING(7),
      allowNull: false,
    },
    task_repeat: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
    },
    task_user_user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    isCompleted: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
    },
  },
  {
    timestamps: true,
    underscored: true, // This will map camelCase fields to snake_case columns
    tableName: "task", // Explicitly specify the table name
  }
);

module.exports = { Task };
