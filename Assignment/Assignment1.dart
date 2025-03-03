class Task {
  String title;
  String description;
  bool isComplete;

  Task(this.title, this.description, this.isComplete);

  void toggleTask() {
    isComplete = !isComplete;
  }
  
  String printTask() {
    return 'Title: $title\nDescription: $description\nCompleted: ${isComplete ? 'Yes' : 'No'}';
  }

}

class TaskManager{
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
  }

  void removeTask(Task task) {
    tasks.remove(task);
  } 

  void updateTask(Task task, String title, String description) {
    task.title = title;
    task.description = description;
  }
 
  void getTasks() {
    for (var task in tasks) {
      print(task.printTask());
    }
  }

  void getCompleteTasks(){
    for (var task in tasks) {
      if (task.isComplete) {
        print(task.printTask());
      }
    }
  }

  void getIncompleteTasks(){
    for (var task in tasks) {
      if (!task.isComplete) {
        print(task.printTask());
      }
    }
  }

}
