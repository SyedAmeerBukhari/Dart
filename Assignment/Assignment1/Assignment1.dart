import 'dart:io';
import 'dart:convert';

class Task {
  String title;
  String description;
  bool isComplete;

  Task(this.title, this.description, this.isComplete);

  void toggleTask() {
    isComplete = !isComplete;
  }

  String toString() {
    return 'Title: $title\nDescription: $description\nCompleted: ${isComplete ? 'Yes' : 'No'}';
  }
}

class TaskManager {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks.removeAt(index);
    } else {
      throw Exception('Invalid index');
    }
  }

  void updateTask(int index, String title, String description) {
    if (index >= 0 && index < tasks.length) {
      tasks[index].title = title;
      tasks[index].description = description;
    } else {
      throw Exception('Invalid index');
    }
  }

  List<Task> getTasks() {
    return tasks;
  }

  List<Task> getCompleteTasks() {
    return tasks.where((task) => task.isComplete).toList();
  }

  List<Task> getIncompleteTasks() {
    return tasks.where((task) => !task.isComplete).toList();
  }

  void toggleTaskStatus(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks[index].toggleTask();
    } else {
      throw Exception('Invalid index');
    }
  }

  void saveTasks(String filePath) {
    final tasksJson = tasks.map((task) => {
      'title': task.title,
      'description': task.description,
      'isComplete': task.isComplete,
    }).toList();

    final file = File(filePath);
    file.writeAsStringSync(jsonEncode(tasksJson));
  }

  void loadTasks(String filePath) {
    final file = File(filePath);
    if (file.existsSync()) {
      final tasksJson = jsonDecode(file.readAsStringSync()) as List;
      tasks = tasksJson.map((taskJson) => Task(
        taskJson['title'],
        taskJson['description'],
        taskJson['isComplete'],
      )).toList();
    }
  }

List<Task> searchTasks(String keyword) {
  return tasks.where((task) => task.title.toLowerCase().contains(keyword.toLowerCase())).toList();
}

}

void main() {
  final taskManager = TaskManager();
  bool running = true;

  while (running) {
    print('\nTask Management System');
    print('1. Add Task');
    print('2. Update Task');
    print('3. Delete Task');
    print('4. List All Tasks');
    print('5. List Completed Tasks');
    print('6. List Incomplete Tasks');
    print('7. Toggle Task Status');
    print('8. Save Tasks');
    print('9. Load Tasks');
    print('10. Search Tasks'); // New option for searching tasks
    print('11. Exit');
    stdout.write('Choose an option: ');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter title: ');
        final title = stdin.readLineSync();
        stdout.write('Enter description: ');
        final description = stdin.readLineSync();
        taskManager.addTask(Task(title!, description!, false));
        break;

      case '2':
        stdout.write('Enter task index: ');
        final index = int.parse(stdin.readLineSync()!);
        stdout.write('Enter new title: ');
        final title = stdin.readLineSync();
        stdout.write('Enter new description: ');
        final description = stdin.readLineSync();
        taskManager.updateTask(index, title!, description!);
        break;

      case '3':
        stdout.write('Enter task index: ');
        final index = int.parse(stdin.readLineSync()!);
        taskManager.removeTask(index);
        break;

      case '4':
        print('\nAll Tasks:');
        taskManager.getTasks().forEach((task) => print(task));
        break;

      case '5':
        print('\nCompleted Tasks:');
        taskManager.getCompleteTasks().forEach((task) => print(task));
        break;

      case '6':
        print('\nIncomplete Tasks:');
        taskManager.getIncompleteTasks().forEach((task) => print(task));
        break;

      case '7':
        stdout.write('Enter task index: ');
        final index = int.parse(stdin.readLineSync()!);
        taskManager.toggleTaskStatus(index);
        break;

      case '8':
        taskManager.saveTasks('tasks.json');
        print('Tasks saved to tasks.json');
        break;

      case '9':
        taskManager.loadTasks('tasks.json');
        print('Tasks loaded from tasks.json');
        break;

      case '10':
        stdout.write('Enter search keyword: ');
        final keyword = stdin.readLineSync();
        final results = taskManager.searchTasks(keyword!);
        if (results.isNotEmpty) {
          print('\nSearch Results:');
          results.forEach((task) => print(task));
        } else {
          print('No tasks found with the keyword: $keyword');
        }
        break;

      case '11':
        running = false;
        break;

      default:
        print('Invalid option. Please try again.');
    }
  }
}