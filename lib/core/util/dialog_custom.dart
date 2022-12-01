import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../value/app_color.dart';
import '../value/strings.dart';

class DialogCustom {
  void showDialogLoading(BuildContext context) {
    showDialog(
        barrierDismissible: false,
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
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Center(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.colorFFFFFF,
                ),
                constraints: BoxConstraints(
                    maxHeight: 200,
                    maxWidth: MediaQuery.of(context).size.width * 0.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            Strings.inputError,
                            style: GoogleFonts.aBeeZee(
                                color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          Strings.ok,
                          style: GoogleFonts.aBeeZee(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.w800),
                        ))
                  ],
                )),
          );
        });
  }
}
