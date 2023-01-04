import 'package:formz/formz.dart';
import 'package:quiz_repository/quiz_repository.dart';

import 'models.dart';

enum AnwserListFormzValidationError { invalid }

class AnwsersListFormz extends FormzInput<List<AnwserForm>, AnwserListFormzValidationError> {
  const AnwsersListFormz.dirty(super.value) : super.dirty();
  const AnwsersListFormz.pure(super.value) : super.pure();

  int get maxAnwsersLenght => 4;
  @override
  AnwserListFormzValidationError? validator(List<AnwserForm> value) {
    if (value.length > maxAnwsersLenght) {
      return AnwserListFormzValidationError.invalid;
    }
    return null;
  }

  List<AnwserForm> addElementToList(String text) {
    final elementsLenght = value.length;

    if (elementsLenght == 0) {
      return [AnwserForm(id: elementsLenght, text: text, isRight: true)];
    }
    return List.from(value)..add(AnwserForm(id: elementsLenght, text: text, isRight: false));
  }

  List<AnwserForm> removeElementFromListById(int id) {
    List<AnwserForm> removedList = List.from(value)..removeWhere((element) => element.id == id);

    if (removedList.isEmpty) {
      return [];
    }

    int index = 0;
    List<AnwserForm> cleanedList = removedList.map((e) {
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

  List<AnwserForm> updateAnwserFromList(Anwser anwser) {
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

  List<AnwserForm> updateIsRight(AnwserForm anwser) {
    return List<AnwserForm>.from(value).map(
      (e) {
        if (anwser.id == e.id) {
          return anwser.copyWith(isRight: true);
        }

        return e.copyWith(isRight: false);
      },
    ).toList();
  }
}
