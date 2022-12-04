import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalityQuestion {
  final String id;
  final String question;
  int? scaleAnswers;

  PersonalityQuestion({
    required this.id,
    required this.question,
    this.scaleAnswers,
  });

  factory PersonalityQuestion.fromDocument(DocumentSnapshot doc) {
    return PersonalityQuestion(
      id: doc.id,
      question: doc['question'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'scaleAnswers': scaleAnswers,
    };
  }
}
