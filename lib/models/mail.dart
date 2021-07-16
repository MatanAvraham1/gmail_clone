import 'dart:convert';

import 'package:flutter/material.dart';

class Mail with ChangeNotifier {
  String sender;
  String title;
  String content;

  DateTime sentAt;

  bool isStarred;
  bool isOpend;
  bool isArchived;
  bool isDeleted;
  Mail({
    required this.sender,
    required this.title,
    required this.content,
    required this.sentAt,
    this.isStarred = false,
    this.isOpend = false,
    this.isArchived = false,
    this.isDeleted = false,
  });

  Mail copyWith({
    String? sender,
    String? title,
    String? content,
    DateTime? sentAt,
    bool? isStarred,
    bool? isOpend,
    bool? isArchived,
    bool? isDeleted,
  }) {
    return Mail(
      sender: sender ?? this.sender,
      title: title ?? this.title,
      content: content ?? this.content,
      sentAt: sentAt ?? this.sentAt,
      isStarred: isStarred ?? this.isStarred,
      isOpend: isOpend ?? this.isOpend,
      isArchived: isArchived ?? this.isArchived,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sender': sender,
      'title': title,
      'content': content,
      'sentAt': sentAt.millisecondsSinceEpoch,
      'isStarred': isStarred,
      'isOpend': isOpend,
      'isArchived': isArchived,
      'isDeleted': isDeleted,
    };
  }

  factory Mail.fromMap(Map<String, dynamic> map) {
    return Mail(
      sender: map['sender'],
      title: map['title'],
      content: map['content'],
      sentAt: DateTime.fromMillisecondsSinceEpoch(map['sentAt']),
      isStarred: map['isStarred'],
      isOpend: map['isOpend'],
      isArchived: map['isArchived'],
      isDeleted: map['isDeleted'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Mail.fromJson(String source) => Mail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Mail(sender: $sender, title: $title, content: $content, sentAt: $sentAt, isStarred: $isStarred, isOpend: $isOpend, isArchived: $isArchived, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Mail &&
        other.sender == sender &&
        other.title == title &&
        other.content == content &&
        other.sentAt == sentAt &&
        other.isStarred == isStarred &&
        other.isOpend == isOpend &&
        other.isArchived == isArchived &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return sender.hashCode ^
        title.hashCode ^
        content.hashCode ^
        sentAt.hashCode ^
        isStarred.hashCode ^
        isOpend.hashCode ^
        isArchived.hashCode ^
        isDeleted.hashCode;
  }

  void newValue(Mail mail) {
    this.sender = mail.sender;
    this.title = mail.title;
    this.content = mail.content;
    this.sentAt = mail.sentAt;
    this.isStarred = mail.isStarred;
    this.isOpend = mail.isOpend;
    this.isArchived = mail.isArchived;
    this.isDeleted = mail.isDeleted;

    notifyListeners();
  }
}
