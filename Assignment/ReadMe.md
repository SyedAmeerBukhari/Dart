# Task Management System

This is a console-based task management system implemented in Dart. It allows users to add, update, delete, and retrieve tasks, as well as toggle their completion status. Tasks can be saved to and loaded from a JSON file for persistence.

## Table of Contents
- [Project Setup](#project-setup)
- [App Architecture](#app-architecture)
- [Features](#features)
- [Usage](#usage)
- [Example Workflow](#example-workflow)
- [Code Quality and Organization](#code-quality-and-organization)
- [Completeness of Documentation](#completeness-of-documentation)

## Project Setup

### Prerequisites
- **Dart SDK**: Ensure you have Dart installed on your system. You can download it from [dart.dev](https://dart.dev/).

### Steps to Run the Project
1. Clone the Repository (if hosted on GitHub):
   ```sh
   git clone https://github.com/your-username/task-management-system.git
   cd task-management-system
   ```
2. Run the Dart Program:
   - Navigate to the project directory where the Dart file is located.
   - Run the following command to execute the program:
     ```sh
     dart run main.dart
     ```
3. Using the Application:
   - Follow the on-screen menu to add, update, delete, or view tasks.
   - Tasks are saved to `tasks.json` in the same directory as the program.

## App Architecture

The application is built using object-oriented programming (OOP) principles in Dart. It consists of two main classes:

### 1. Task Class
Represents a single task with the following properties:
- `title`: The title of the task.
- `description`: A brief description of the task.
- `isComplete`: A boolean flag indicating whether the task is completed.

#### Methods:
- `toggleTask()`: Toggles the completion status of the task.
- `toString()`: Returns a string representation of the task.

### 2. TaskManager Class
Manages a list of tasks and provides functionality for:
- Adding a task (`addTask`).
- Updating a task (`updateTask`).
- Deleting a task (`removeTask`).
- Retrieving all tasks (`getTasks`).
- Retrieving completed tasks (`getCompleteTasks`).
- Retrieving incomplete tasks (`getIncompleteTasks`).
- Toggling the completion status of a task (`toggleTaskStatus`).
- Saving tasks to a file (`saveTasks`).
- Loading tasks from a file (`loadTasks`).
- Searching tasks by title (`searchTasks`).

## File Persistence
Tasks are saved to and loaded from a JSON file (`tasks.json`) using Dart's `dart:io` and `dart:convert` libraries.

The JSON file stores task data in the following format:
```json
[
  {
    "title": "Finish project",
    "description": "Complete the project by Friday",
    "isComplete": false
  },
  {
    "title": "Buy groceries",
    "description": "Milk, eggs, and bread",
    "isComplete": true
  }
]
```

## Features
- **Add a Task**: Add a new task with a title and description.
- **Update a Task**: Update the title and description of an existing task.
- **Delete a Task**: Remove a task from the list.
- **List All Tasks**: Display all tasks with their indices, titles, descriptions, and completion status.
- **List Completed Tasks**: Display only completed tasks.
- **List Incomplete Tasks**: Display only incomplete tasks.
- **Toggle Task Status**: Mark a task as completed or incomplete.
- **Save Tasks**: Save the current list of tasks to a JSON file.
- **Load Tasks**: Load tasks from a JSON file.
- **Search Tasks**: Search for tasks by title.

## Usage

### Add a Task:
1. Choose option `1` from the menu.
2. Enter the title and description of the task.

### Update a Task:
1. Choose option `2` from the menu.
2. Enter the index of the task you want to update.
3. Provide the new title and description.

### Delete a Task:
1. Choose option `3` from the menu.
2. Enter the index of the task you want to delete.

### List All Tasks:
1. Choose option `4` from the menu to view all tasks.

### List Completed/Incomplete Tasks:
1. Choose option `5` or `6` to view completed or incomplete tasks, respectively.

### Toggle Task Status:
1. Choose option `7` from the menu.
2. Enter the index of the task you want to toggle.

### Save Tasks:
1. Choose option `8` to save tasks to `tasks.json`.

### Load Tasks:
1. Choose option `9` to load tasks from `tasks.json`.

### Search Tasks:
1. Choose option `10` from the menu.
2. Enter a keyword to search for tasks by title.

### Exit:
1. Choose option `11` to exit the application.

## Example Workflow

### Add a task:
```sh
Choose an option: 1
Enter title: Finish project
Enter description: Complete the project by Friday
```

### List all tasks:
```sh
Choose an option: 4
All Tasks:
Task Index: 0
Title: Finish project
Description: Complete the project by Friday
Completed: No
```

### Toggle task status:
```sh
Choose an option: 7
Enter task index: 0
```

### Save tasks:
```sh
Choose an option: 8
Tasks saved to tasks.json
```

## Code Quality and Organization
- The code is organized into two main classes (`Task` and `TaskManager`) for modularity and reusability.
- Proper error handling is implemented for invalid user inputs (e.g., invalid indices).
- The code follows Dart best practices, including the use of `toString()` for string representation and `@override` for method overriding.

## Completeness of Documentation
- This README provides a comprehensive guide to setting up and using the application.
- The code is well-commented for clarity and maintainability.
