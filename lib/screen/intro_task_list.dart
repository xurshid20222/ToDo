

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/services/theme_service.dart';

class IntroTaskList extends StatefulWidget {
  static const id = '/intro_task_list';
  const IntroTaskList({Key? key}) : super(key: key);

  @override
  State<IntroTaskList> createState() => _IntroTaskListState();
}

class _IntroTaskListState extends State<IntroTaskList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 150,
        leadingWidth: 80,
        leading: const Icon(Icons.arrow_back_sharp, color: Colors.black,size: 26,),
        title: Text('Task List', style: ThemeService.textStyle4(),),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '   Task Name',
                    hintStyle: ThemeService.textStyle4(),
                    prefixIcon: const Icon(Icons.check_box_outline_blank_outlined, color: Colors.grey,),
                    suffixIcon: const Icon(CupertinoIcons.star, color: Colors.grey,),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '   Add Due Date',
                    hintStyle: ThemeService.textStyleBody(),
                    prefixIcon: const Icon(CupertinoIcons.calendar_badge_plus, color: Colors.grey,),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
