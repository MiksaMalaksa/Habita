import 'package:flutter/widgets.dart';
import 'package:habita/generated/l10n.dart';

const oldPasswordIncorrectMsg = 'Confirm old password before submitting!';
const serverFailMsg = 'Something went wrong!';
const internetIsuesMsg = 'Check your internet connection!';

class ErrorsConventer {
  final List<String> _msgs = [
    oldPasswordIncorrectMsg,
    serverFailMsg,
    internetIsuesMsg
  ];

 String convertedMsg(BuildContext context, {required String msg}) {
  final index = _msgs.indexOf(msg);
  if (index < 0) {
    return S.of(context).somethingWrong;
  }

  switch (index) {
    case 0:
      return S.of(context).checkOldPassword;
    case 1:
      return S.of(context).somethingWrong;
    case 2:
      return S.of(context).noConnection;
    default:
      return S.of(context).somethingWrong;
  }
}
}
