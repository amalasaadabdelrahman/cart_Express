class Questions {
  int? id;
  String? status;
  String? createdAt;
  String? question;
  String? answer;
  bool? isExpanded;
  Questions(
      {this.id,
      this.status,
      this.createdAt,
      this.question,
      this.answer,
      this.isExpanded = true});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    question = json['question'];
    answer = json['answer'];
    isExpanded = true;
  }
}
