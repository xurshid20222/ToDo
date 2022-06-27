import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:todo_app/screen/detail_screen.dart';
import 'package:todo_app/services/lang_service.dart';

import '../models/user_model.dart';
import '../services/theme_service.dart';
import '../services/util_service.dart';
import '../views/home_item.dart';
import '../views/search_view.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  static const id = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User _user;

  List<FileSystemEntity> listDirectory = [];
  final TextEditingController _controller = TextEditingController();
  late Directory mainDirectory;

  @override
  initState() {
    super.initState();
    _getUser();
    _readFolder();
  }

  void _getUser() {
    //TODO: concrete update => read user from database
    _user = User('Antonio Bonilla', 'antonio.bonilla@horus.com.uy');
  }

  void _goSettingScreen() {
    // TODO: navigate setting page
  }

  void _showSearch() {
    showSearchCustom(
      context: context,
      delegate: SearchScreen(),
    );
  }

  Future<void> _readFolder() async {
    if (Platform.isIOS) {
      mainDirectory = await getApplicationDocumentsDirectory();
      listDirectory = mainDirectory.listSync();

      FileSystemEntity? trash;
      for (var element in listDirectory) {
        if (element.path.contains('/Trash')) {
          trash = element;
        }
      }
      listDirectory.remove(trash);
      setState(() {});
    } else {
      String pathAndroid = "storage/emulated/0/TodoApp";
      if (await Permission.manageExternalStorage.request().isGranted && await Permission.storage.request().isGranted) {
        mainDirectory = Directory(pathAndroid);
        bool isExist = await mainDirectory.exists();
        if (!isExist) {
          mainDirectory.create();
        }
        listDirectory = mainDirectory.listSync();
        setState(() {});
      }
    }
  }

  void _openDetailPage(String path){

    // TODO :concrete update => provid path of DetailScreen
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const  DetailScreen()));
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
            title: Text('new_list'.tr),
            content: Container(
              color: ThemeService.colorTextFieldBack,
              child: TextField(
                controller: _controller,
                autocorrect: true,
                decoration: InputDecoration(
                  hintText: 'enter_list_title'.tr,
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: _cancel,
                child: Text('cancel'.tr),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(const StadiumBorder())),
                onPressed: _submit,
                label: Text('create'.tr),
                icon: const Icon(Icons.add),
              )
            ],
          );
        });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() async {
    String folderName = _controller.text.trim().toString();
    _controller.clear();

    String fullPath = '${mainDirectory.path}/$folderName';
    Directory directory = Directory(fullPath);
    bool isExist = await directory.exists();
    if (isExist) {
      Utils.fireSnackBar("This folder already exist!", context);
      Navigator.pop(context);
    } else {
      await directory.create();
      Utils.fireSnackBar("Folder Successfully created!", context);
      _readFolder();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeService.colorBackroundLight,
      appBar: AppBar(
        backgroundColor: ThemeService.colorBackroundLight,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: _goSettingScreen,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: ThemeService.colorMain,
              child: Text(
                Utils.getFirstLetters(_user.fullName),
                style: ThemeService.textStyleBody(
                    color: ThemeService.colorBackroundLight),
              ),
            ),
          ),
        ),
        centerTitle: false,
        title: Text(
          _user.fullName,
          style: ThemeService.textStyleBody(),
        ),
        actions: [
          IconButton(
            splashRadius: 25,
            onPressed: _showSearch,
            icon: const Icon(
              Icons.search,
              color: ThemeService.colorMain,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            HomeItem(
                iconColor: ThemeService.colorPink,
                icon: Icons.star_outlined,
                title: "important".tr,
                onPressed: () {}),
            HomeItem(
                iconColor: ThemeService.colorMain,
                imageIcon: "assets/icons/ic_home.png",
                title: "tasks".tr,
                onPressed: () {}),
            Divider(
              height: 4,
              thickness: 2,
              endIndent: MediaQuery.of(context).size.width * 0.04,
              indent: MediaQuery.of(context).size.width * 0.04,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: listDirectory.length,
              itemBuilder: (context, index) {
                String currentPath = listDirectory[index].path;
                String title =
                    currentPath.substring(currentPath.lastIndexOf('/')+1);
                return  HomeItem(
                    iconColor: ThemeService.colorMainTask,
                    icon: Icons.list,
                    title: title,
                    onPressed: ()=> _openDetailPage(currentPath),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: TextButton.icon(
        onPressed: _showDialog,
        icon: const Icon(
          Icons.add,
          color: ThemeService.colorMain,
        ),
        label: Text(
          "new_list".tr,
          style: ThemeService.textStyle2(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
