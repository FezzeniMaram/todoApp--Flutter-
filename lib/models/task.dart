class Task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? starTime;
  String? endTime;
  int? remind;
  String? repeat;
  int? color;

  Task({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.date,
    this.starTime,
    this.endTime,
    this.remind,
    this.repeat,
    this.color,
  });

  Task.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    note = json["note"];
    isCompleted = json["isCompleted"];
    date = json["date"];
    starTime = json["starTime"];
    endTime = json["endTime"];
    remind = json["remind"];
    repeat = json["repeat"];
    color = json["color"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["note"] = note;
    data["isCompleted"] = isCompleted;
    data["date"] = date;
    data["starTime"] = starTime;
    data["endTime"] = endTime;
    data["remind"] = remind;
    data["repeat"] = repeat;
    data["color"] = color;
    return data;
  }
}
