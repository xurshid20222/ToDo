import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:todo_app/services/theme_service.dart';

import '../models/my_todo_model.dart';
class CompletedDetailView extends StatefulWidget {
  const CompletedDetailView({Key? key}) : super(key: key);

  @override
  State<CompletedDetailView> createState() => _CompletedDetailViewState();
}

class _CompletedDetailViewState extends State<CompletedDetailView> {

  bool avtoFocus = true;

  List<ToDo> items = [];
  bool isLoading = false;

  @override
  initState(){
    super.initState();
    _readToDo();

  }

  void _readToDo(){
    setState((){
      isLoading = true;
    });
    // TODO : u will write code read notes
    items = [
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
    ];
    setState((){
      isLoading = false;
    });
  }

  void _moveToDoCompleted(bool? tapped, ToDo todo){
    // TODO: this note moved to completed
    setState((){
      todo.isCompleted = tapped!;
    });
  }

  void _addOrRemoveToDoImportant(ToDo toDo){
    setState((){
      // TODO : fildini uzgartirib databaseni ham o'zgartirish kk
      toDo.isImportant = !toDo.isImportant;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index){
              ToDo todo = items[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Dismissible(
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width,
                    color: ThemeService.colorPink,
                    child: const Icon(Icons.delete_outline, color: ThemeService.colorBackroundLight,),
                  ),
                  key: ValueKey<int>(todo.hashCode),
                  onDismissed: (DismissDirection direction){
                    setState((){
                      items.removeAt(index);
                    });
                  },
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
                      todo.createdDate,
                      style: ThemeService.textStyleCaption(color: ThemeService.colorSubtitle),
                    ),
                    trailing: IconButton(
                        onPressed: () => _addOrRemoveToDoImportant(todo),
                        icon: todo.isImportant ? const Icon(CupertinoIcons.star_fill, color: ThemeService.colorPink,) : const Icon(CupertinoIcons.star)
                    ),
                  ),
                ),
              );
            },
          ),
          if(isLoading) const  Center(
              child: CircularProgressIndicator(),
          ),

        ],
      ),
    );
  }
}
