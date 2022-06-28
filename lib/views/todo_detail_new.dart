import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/my_todo_model.dart';
import '../services/theme_service.dart';

class ToDoDetailView extends StatefulWidget {
  const ToDoDetailView({Key? key}) : super(key: key);

  @override
  State<ToDoDetailView> createState() => _ToDoDetailViewState();
}

class _ToDoDetailViewState extends State<ToDoDetailView> {
  Future<void> _showSimpleDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // <-- SEE HERE
            title:  Text('Are you sure?', style: ThemeService.textStyle4(),),
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            content:    Text('List will be permanently deleted',style: ThemeService.textStyleCaption(color: Colors.grey,),),
            actions: [
              TextButton(
                onPressed: () {},
                child:  Text(
                  'Cancel',style: ThemeService.textStyle2(),
                ),
              ),
              Container(
                height: 40,
                width: 89,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ThemeService.colorPink,
                ),
                child: TextButton(
                  onPressed: () {},
                  child:  Text(
                    'Delete', style: ThemeService.textStyle3(),
                  ),
                ),
              ),
            ],
          );
        },);
  }

  List<ToDo> items = [];
  bool isLoading = false;

  @override
  initState() {
    super.initState();
    _readToDo();
  }

  void _readToDo() {
    setState(() {
      isLoading = true;
    });
    // TODO : u will write code read notes
    items = [
      ToDo(
          taskName: 'To do chayxana app',
          taskContent: 'I write code notification',
          category: 'FolderName',
          isImportant: true,
          isCompleted: false,
          craetedDate: DateTime.now().toString()),
      ToDo(
          taskName: 'To do chayxana app',
          taskContent: 'I write code notification',
          category: 'FolderName',
          isImportant: true,
          isCompleted: false,
          craetedDate: DateTime.now().toString()),
      ToDo(
          taskName: 'To do chayxana app',
          taskContent: 'I write code notification',
          category: 'FolderName',
          isImportant: true,
          isCompleted: false,
          craetedDate: DateTime.now().toString()),
      ToDo(
          taskName: 'To do chayxana app',
          taskContent: 'I write code notification',
          category: 'FolderName',
          isImportant: true,
          isCompleted: false,
          craetedDate: DateTime.now().toString()),
      ToDo(
          taskName: 'To do chayxana app',
          taskContent: 'I write code notification',
          category: 'FolderName',
          isImportant: true,
          isCompleted: false,
          craetedDate: DateTime.now().toString()),
      ToDo(
          taskName: 'To do chayxana app',
          taskContent: 'I write code notification',
          category: 'FolderName',
          isImportant: true,
          isCompleted: false,
          craetedDate: DateTime.now().toString()),
      ToDo(
          taskName: 'To do chayxana app',
          taskContent: 'I write code notification',
          category: 'FolderName',
          isImportant: true,
          isCompleted: false,
          craetedDate: DateTime.now().toString()),
      ToDo(
          taskName: 'To do chayxana app',
          taskContent: 'I write code notification',
          category: 'FolderName',
          isImportant: true,
          isCompleted: false,
          craetedDate: DateTime.now().toString()),
      ToDo(
          taskName: 'To do chayxana app',
          taskContent: 'I write code notification',
          category: 'FolderName',
          isImportant: true,
          isCompleted: false,
          craetedDate: DateTime.now().toString()),
      ToDo(
          taskName: 'To do chayxana app',
          taskContent: 'I write code notification',
          category: 'FolderName',
          isImportant: true,
          isCompleted: false,
          craetedDate: DateTime.now().toString()),
      ToDo(
          taskName: 'To do chayxana app',
          taskContent: 'I write code notification',
          category: 'FolderName',
          isImportant: true,
          isCompleted: false,
          craetedDate: DateTime.now().toString()),
      ToDo(
          taskName: 'To do chayxana app',
          taskContent: 'I write code notification',
          category: 'FolderName',
          isImportant: true,
          isCompleted: false,
          craetedDate: DateTime.now().toString()),
      ToDo(
          taskName: 'To do chayxana app',
          taskContent: 'I write code notification',
          category: 'FolderName',
          isImportant: true,
          isCompleted: false,
          craetedDate: DateTime.now().toString()),
      ToDo(
          taskName: 'To do chayxana app',
          taskContent: 'I write code notification',
          category: 'FolderName',
          isImportant: true,
          isCompleted: false,
          craetedDate: DateTime.now().toString()),
      ToDo(
          taskName: 'To do chayxana app',
          taskContent: 'I write code notification',
          category: 'FolderName',
          isImportant: true,
          isCompleted: false,
          craetedDate: DateTime.now().toString()),
    ];
    setState(() {
      isLoading = false;
    });
  }

  void _moveToDoCompleted(bool? tapped, ToDo todo) {
    // TODO: this note moved to completed
    setState(() {
      todo.isCompleted = tapped!;
    });
  }

  void _addOrRemoveToDoImportant(ToDo toDo) {
    setState(() {
      // TODO : fildini uzgartirib databaseni ham o'zgartirish kk
      toDo.isImportant = !toDo.isImportant;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            ToDo todo = items[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Slidable(
                key: ValueKey(todo.hashCode),
                endActionPane: ActionPane(
                  extentRatio: 0.2,
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        _showSimpleDialog();
                      },
                      backgroundColor: ThemeService.colorPink,
                      foregroundColor: Colors.white,
                      icon: Icons.delete_outline,
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (tapped) => _moveToDoCompleted(tapped, todo),
                  ),
                  title: Text(
                    todo.taskName,
                    style: ThemeService.textStyleBody(),
                  ),
                  subtitle: Text(
                    todo.craetedDate,
                    style: ThemeService.textStyleCaption(
                        color: ThemeService.colorSubtitle),
                  ),
                  trailing: IconButton(
                      onPressed: () => _addOrRemoveToDoImportant(todo),
                      icon: todo.isImportant
                          ? const Icon(
                              CupertinoIcons.star_fill,
                              color: ThemeService.colorPink,
                            )
                          : const Icon(CupertinoIcons.star)),
                ),
              ),
            );
          },
        ),
        if (isLoading)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
