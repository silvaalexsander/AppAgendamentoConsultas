import 'package:agendamentohospitalar/components/confirm_modal_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/modal_button.dart';

class Modal {
  static mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ModalButton();
      },
    );
  }

  static confirmBottomSheet(
      BuildContext context,
      int idSpecialty,
      int idProfissional,
      int idHospital,
      String hospital,
      String specialty,
      String professional,
      DateTime date,
      String time) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ConfirmModalButton(idSpecialty, idProfissional, idHospital,
            hospital, specialty, professional, date, time);
      },
    );
  }
}
