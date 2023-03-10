import 'package:formz/formz.dart';

import 'models.dart';

enum AnwserListFormzValidationError { invalid }

class AnwsersListFormz extends FormzInput<List<AnswerForm>, AnwserListFormzValidationError> {
  const AnwsersListFormz.dirty(super.value) : super.dirty();
  const AnwsersListFormz.pure(super.value) : super.pure();

  int get maxAnwsersLenght => 4;
  @override
  AnwserListFormzValidationError? validator(List<AnswerForm> value) {
    if (value.length > maxAnwsersLenght) {
      return AnwserListFormzValidationError.invalid;
    }
    return null;
  }

  List<AnswerForm> addElementToList(String text) {
    final elementsLenght = value.length;

    if (elementsLenght == 0) {
      return [AnswerForm(id: elementsLenght, text: text, isRight: true)];
    }
    return List.from(value)..add(AnswerForm(id: elementsLenght, text: text, isRight: false));
  }

  List<AnswerForm> removeElementFromListById(int id) {
    List<AnswerForm> removedList = List.from(value)..removeWhere((element) => element.id == id);

    if (removedList.isEmpty) {
      return [];
    }

    int index = 0;
    List<AnswerForm> cleanedList = removedList.map((e) {
      int indexCopy = index;
      index++;
      return e.copyWith(id: indexCopy);
    }).toList();

    final bool containsRightAnwser = cleanedList.any((element) => element.isRight);

    if (containsRightAnwser) {
      return cleanedList;
    } else {
      final firstElement = cleanedList.elementAt(0).copyWith(isRight: true);
      return cleanedList.map((e) {
        if (firstElement.id == e.id) {
          return firstElement;
        }
        return e;
      }).toList();
    }
  }

  List<AnswerForm> updateAnwserFromList(AnswerForm anwser) {
    return List.from(value)
      ..map(
        (e) {
          if (anwser.id == e.id) {
            return anwser;
          }

          return e;
        },
      );
  }

  List<AnswerForm> updateIsRight(AnswerForm anwser) {
    return List<AnswerForm>.from(value).map(
      (e) {
        if (anwser.id == e.id) {
          return anwser.copyWith(isRight: true);
        }

        return e.copyWith(isRight: false);
      },
    ).toList();
  }
}
