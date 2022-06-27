
import 'package:flutter/material.dart';
import 'package:todo_app/models/my_todo_model.dart';
import 'package:todo_app/views/todo_two_page.dart';
import 'package:todo_app/services/theme_service.dart';

import '../views/todo_detail_new.dart';

class DetailScreen extends StatefulWidget {
  static const id = '/detail_screen';
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with SingleTickerProviderStateMixin
{

   late TabController _tabController;
  void _goBack(){
    Navigator.pop(context);
  }

  @override
  void initState(){
     super.initState();
     _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Filder name', style: ThemeService.textStyleBody(),),
        backgroundColor: ThemeService.colorBackroundLight,
        leading: IconButton(
          onPressed: _goBack,
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
        ),
        actions: [
          IconButton(onPressed: (){},
              icon: const Icon(Icons.mode_edit, color: Colors.black,)),
          IconButton(onPressed: (){},
              icon: const Icon(Icons.delete_outline, color: Colors.black,))
        ],
        bottom:  TabBar(
          controller: _tabController,
          labelColor: ThemeService.colorBlack,
          tabs: const [
            Tab(
              text: 'To Do',
            ),
            Tab(
              text: 'Completed',
            ),
          ],
        ),
      ),
             body:  TabBarView(
               controller: _tabController,
               children: const [
                 TodotwoPage(),
                 ToDoDetailView(),
               ],
             ),
    );
  }
}
