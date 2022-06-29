
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/services/theme_service.dart';

import '../models/user_model.dart';
import '../services/util_service.dart';

class SettingScreen extends StatefulWidget {

  static const id = '/setting_screen';
  final User? user;
   const SettingScreen({Key? key, this.user,}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  late User _user;

  @override
  initState(){
    super.initState();
    _getUser();
  }


  void _getUser(){
    _user = widget.user!;
  }

  // #backHome
  void _backHome(){
    Navigator.pop(context);
  }

  // #dialog
  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          title:  Text(
            "Sign out",
            style: ThemeService.textStyleHeader(color: ThemeService.colorBlack),
          ),
          content:  Text(
            "Are you sure you would like to sign out?",
            style: ThemeService.textStyleCaption(color: ThemeService.colorBlack.withOpacity(.38) ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff5946D2),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 15, bottom: 5),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                  backgroundColor:
                  MaterialStateProperty.all(const Color(0xffF85977)),
                ),
                onPressed: () {
                  setState(() {
                  });
                  Navigator.pop(context);
                },
                child: const Text('Sign Out'),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        leadingWidth: 70,
        leading: IconButton(
          splashRadius: 25,
          onPressed: _backHome,
          icon: const Icon(Icons.close, color: ThemeService.colorBlack,),
        ),
        title: Text('Settings', style: ThemeService.textStyleHeader(color: ThemeService.colorBlack),),
      ),
      body: Column(
        children: [

          // #Avatarka
          Container(
            padding: const EdgeInsets.only(right: 20),
            height: 60,
            width: double.infinity,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: ThemeService.colorMain,
              child: Text(
                Utils.getFirstLetters(_user.fullName),
                style: ThemeService.textStyleBody(
                    color: ThemeService.colorBackroundLight),
              ),
            ),
          ),
          const SizedBox(height: 12,),
          //#UserName
          Text(_user.fullName,style: ThemeService.textStyleHeader(),),
          //#UserEmail
          Text(_user.email,style: ThemeService.textStyleCaption(color: ThemeService.colorBlack.withOpacity(0.6)),),
          const SizedBox(height: 21,),
          // #Sign Out
          TextButton(onPressed: _showDialog,
              child: Text('Sign Out', style: ThemeService.textStyleCaption(color: ThemeService.colorPink ),),),
          const SizedBox(height: 21,),
          Divider(
            indent: 20,
           endIndent: 20,
           thickness: 1,
           color: ThemeService.colorBlack.withOpacity(.12),
          ),
          //#Setting Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('General', style: ThemeService.textStyleCaption(color: ThemeService.colorMain),),
                    const SizedBox(height: 21),
                    Text('Color palette', style: ThemeService.textStyleSearch(color: ThemeService.colorBlack),),
                    const SizedBox(height: 11),
                    // # Buttons one line
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 32,
                          width: 74,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ThemeService.colorSelectedButton,
                          ),
                          child: Text('Purple', style: ThemeService.textStyleCaption(color: ThemeService.colorBlackButtonText)),
                        ),
                        const SizedBox(width: 6,),
                        Container(
                          alignment: Alignment.center,
                          height: 35,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: ThemeService.colorBlack.withOpacity(0.4))
                          ),
                          child: Text('Blue', style: ThemeService.textStyleCaption(color: ThemeService.colorButtonText)),
                        ),
                        const SizedBox(width: 6,),
                        Container(
                          alignment: Alignment.center,
                          height: 35,
                          width: 77,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ThemeService.colorBlack.withOpacity(0.4))
                          ),
                          child: Text('Yellow', style: ThemeService.textStyleCaption(color: ThemeService.colorButtonText)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // #lenguages
                    Text('Language', style: ThemeService.textStyleSearch(color: ThemeService.colorBlack),),
                    const SizedBox(height: 11),
                    // # Buttons two line
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 32,
                          width: 79,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ThemeService.colorSelectedButton,
                          ),
                          child: Text('English', style: ThemeService.textStyleCaption(color: ThemeService.colorBlackButtonText)),
                        ),
                        const SizedBox(width: 6,),
                        Container(
                          alignment: Alignment.center,
                          height: 35,
                          width: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ThemeService.colorBlack.withOpacity(0.4))
                          ),
                          child: Text('French', style: ThemeService.textStyleCaption(color: ThemeService.colorButtonText)),
                        ),
                        const SizedBox(width: 6,),
                        Container(
                          alignment: Alignment.center,
                          height: 35,
                          width: 82,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ThemeService.colorBlack.withOpacity(0.4))
                          ),
                          child: Text('Spanish', style: ThemeService.textStyleCaption(color: ThemeService.colorButtonText)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text('Change will be applied at next app restart', style: ThemeService.textStyleSearch(color: ThemeService.colorBlack.withOpacity(.38)),),
                    const SizedBox(height: 20),
                    // #Theme
                    Text('Mode', style: ThemeService.textStyleSearch(color: ThemeService.colorBlack),),
                    const SizedBox(height: 11),
                    // # Buttons three line
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 32,
                          width: 82,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ThemeService.colorSelectedButton,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 6,),
                              const Icon(Icons.sunny, color: ThemeService.colorMain,size: 20,),
                              const SizedBox(width: 4,),
                              Text('Light', style: ThemeService.textStyleCaption(color: ThemeService.colorBlackButtonText)),
                            ],
                          )
                        ),
                        const SizedBox(width: 6,),
                        Container(
                          alignment: Alignment.center,
                          height: 35,
                          width: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ThemeService.colorBlack.withOpacity(0.4))
                          ),
                          child:Row(
                            children: [
                              const SizedBox(width: 6,),
                              const Icon(CupertinoIcons.moon_fill, color: ThemeService.colorMain,size: 20,),
                              const SizedBox(width: 4,),
                              Text('Dark', style: ThemeService.textStyleCaption(color: ThemeService.colorBlackButtonText)),
                            ],
                          )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12,),
          Divider(
            indent: 20,
            endIndent: 20,
            thickness: 1,
            color: ThemeService.colorBlack.withOpacity(.12),
          ),
          //#footer
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, top: 10),
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About', style: ThemeService.textStyleCaption(color: ThemeService.colorMain),),
                    const SizedBox(height: 12,),
                    Row(
                      children: [
                        Text('Version', style: ThemeService.textStyleBody(color: ThemeService.colorBlack),),
                        const SizedBox(width: 40,),
                        Text('1.0', style: ThemeService.textStyleBody(color: ThemeService.colorMain),),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}
