class Task {
  int id;
  String title;
  bool isComplete;
  Task(this.title, this.isComplete);

  Task.fromMap(Map map) {
    this.title = map['title'];
    this.isComplete = map['isComplete'] == 1 ? true : false;
    this.id = map['id'];
  }
  toMap() {
    return {'title': this.title, 'isComplete': this.isComplete ? 1 : 0};
  }
}
