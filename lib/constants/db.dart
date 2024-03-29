import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:gmail_clone/models/mail.dart';
import 'package:random_date/random_date.dart';

List<Mail> mails = [
  Mail(
    title: lorem(paragraphs: 1, words: 6),
    content: lorem(paragraphs: 5, words: 120),
    sender: "Epic Games",
    sentAt: RandomDate.withStartYear(2020).random(),
    isOpend: true,
  ),
  Mail(
    title: lorem(paragraphs: 1, words: 6),
    content: lorem(paragraphs: 5, words: 120),
    sender: "Matan Avraham",
    sentAt: RandomDate.withStartYear(2020).random(),
  ),
  Mail(
    title: lorem(paragraphs: 1, words: 6),
    content: lorem(paragraphs: 5, words: 120),
    sender: "Dvir Twito",
    sentAt: RandomDate.withStartYear(2020).random(),
  ),
  Mail(
    title: lorem(paragraphs: 1, words: 6),
    content: lorem(paragraphs: 5, words: 120),
    sender: "Google",
    sentAt: RandomDate.withStartYear(2020).random(),
    isOpend: true,
    isStarred: true,
  ),
  Mail(
    title: lorem(paragraphs: 1, words: 6),
    content: lorem(paragraphs: 5, words: 120),
    sender: "Fortnite",
    sentAt: RandomDate.withStartYear(2020).random(),
    isStarred: true,
  ),
  Mail(
      title: lorem(paragraphs: 1, words: 6),
      content: lorem(paragraphs: 5, words: 120),
      sender: "Apple",
      sentAt: RandomDate.withStartYear(2020).random(),
      isStarred: true,
      isOpend: true),
  Mail(
      title: lorem(paragraphs: 1, words: 6),
      content: lorem(paragraphs: 5, words: 120),
      sender: "Sumsung",
      sentAt: RandomDate.withStartYear(2020).random(),
      isStarred: true,
      isOpend: true),
  Mail(
      title: lorem(paragraphs: 1, words: 6),
      content: lorem(paragraphs: 5, words: 120),
      sender: "Mikmak",
      sentAt: RandomDate.withStartYear(2020).random(),
      isStarred: true,
      isOpend: true),
  Mail(
    title: lorem(paragraphs: 1, words: 6),
    content: lorem(paragraphs: 5, words: 120),
    sender: "Mikmak",
    sentAt: RandomDate.withStartYear(2020).random(),
  ),
];
