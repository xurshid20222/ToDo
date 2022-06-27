import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/services/lang_service.dart';
import 'package:todo_app/services/theme_service.dart';

import '../models/my_todo_model.dart';
class TodotwoPage extends StatefulWidget {
  const TodotwoPage({Key? key}) : super(key: key);

  @override
  State<TodotwoPage> createState() => _TodotwoPageState();
}

class _TodotwoPageState extends State<TodotwoPage> {

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
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, craetedDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, craetedDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, craetedDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, craetedDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, craetedDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, craetedDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, craetedDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, craetedDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, craetedDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, craetedDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, craetedDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, craetedDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, craetedDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, craetedDate: DateTime.now().toString()),
      ToDo(taskName: 'To do chayxana app', taskContent: 'I write code notification', category: 'FolderName', isImportant: true, isCompleted: false, craetedDate: DateTime.now().toString()),
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
                      todo.craetedDate,
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          avtoFocus ?
          Container (
            height: 40,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 20, right: 20,),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.7),
              borderRadius: BorderRadius.circular(50),

            ),
            child:  TextField(
              autofocus: avtoFocus,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Add a task',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.add, color: Colors.white,)
              ),
            ),
          ):
          Container(
            height: 70,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 20, right: 20,),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),

            ),
            child:  TextField(
              autofocus: avtoFocus,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Add a task',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.add, color: Colors.white,)
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
