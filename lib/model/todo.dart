class ToDo {
  int _id = 0;
  String _content = "";

  ToDo.fromData(id, content) {
    _id = id;
    _content = content;
  }

  String get content => _content;
  set content(String value) {
    _content = value;
  }

  int get id => _id;
  set id(int value) {
    _id = value;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'content': _content,
    };
  }
}
