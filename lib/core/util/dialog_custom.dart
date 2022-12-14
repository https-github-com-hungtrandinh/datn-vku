import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../presentation/widgets/avatar_lable_user.dart';
import '../value/app_color.dart';
import '../value/image.dart';
import '../value/strings.dart';
import 'glow_button.dart';

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
                            contentDialog,
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

  Future<void> showAnimatedDialogMatch(
      BuildContext context,
      {required String urlAvatarMyUser, required String urlAvatarOwenUser, required VoidCallback onClick}) {
    return showAnimatedDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  ImageSrc.matchIcon,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  Strings.itMatch,
                  style: GoogleFonts.abrilFatface(
                      decorationColor: Colors.transparent,
                      fontSize: 32,
                      color: Colors.black54),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 10),
                    UserImage.small(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      height: 70,
                      width: 70,
                      url: urlAvatarMyUser,
                    ),
                    UserImage.small(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      height: 70,
                      width: 70,
                      url: urlAvatarOwenUser,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: GlowButtonWidget(
                    height: 44,
                    backgroundColor: AppColors.colorF78361,
                    glowColor: AppColors.colorF78361,
                    glowOffset: const Offset(0, 6),
                    borderRadius: 22,
                    blurRadius: 22,
                    onPressed: onClick,
                    child: const Center(
                      child: Text(
                        Strings.seenMessage,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      animationType: DialogTransitionType.slideFromBottom,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }
}
