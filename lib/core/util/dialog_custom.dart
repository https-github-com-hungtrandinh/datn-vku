import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../value/app_color.dart';

class DialogCustom {
  void showDialogLoading(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.colorFFFFFF,
            ),
          );
        });
  }

  void showDialogWithContent(BuildContext context, String contentDialog) {
    showDialog(
        context: context,
        builder: (_) {
          return Center(
            child: Container(
              color: AppColors.colorFFFFFF,
              constraints: BoxConstraints(
                  maxHeight: 200,
                  maxWidth: MediaQuery.of(context).size.width * 0.8),
              child: Center(
                child: Text(
                  contentDialog,
                  style: GoogleFonts.actor(
                      color: AppColors.color0A1F44, fontSize: 16),
                ),
              ),
            ),
          );
        });
  }
}
