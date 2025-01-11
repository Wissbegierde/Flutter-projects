import 'package:flutter/material.dart';
import 'package:prueba/components/custom_button.dart';
import 'package:prueba/components/drawer.dart';
import 'package:prueba/models/note.dart';
import 'package:prueba/models/note_database.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  
  //text controller to access the text field
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readNotes();
  }

  //create a note
  void createNote() {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: TextField(
        controller: textController,
        decoration: const InputDecoration(
          hintText: 'Enter your note here',
        ),
      ),
      actions: [
        // Botón "Create"
        CustomButton(
          text: 'Create',
          color: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            // Agregar nota a la base de datos
            context.read<NoteDatabase>().addNote(textController.text);

            // Limpiar el controlador
            textController.clear();

            // Cerrar el diálogo
            Navigator.pop(context);
          },
        ),
        // Botón "Cancel"
        CustomButton(
          text: 'Cancel',
          color: Theme.of(context).colorScheme.error,
          onPressed: () {
            // Limpiar el controlador
            textController.clear();

            // Cerrar el diálogo
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}



  //read a note
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  //update a note
  void updateNote(Note note){
    textController.text =note.text;
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text("Update Note"),
        content: TextField(
          controller: textController,
        ),
        actions: [
         CustomButton(
          text: 'Update', 
          color: Theme.of(context).colorScheme.secondary, 
          onPressed: (){

            //update note
            context.read<NoteDatabase>().updateNote(note.id,textController.text);
            
            //clear text field
            textController.clear();

            //pop dialog
            Navigator.pop(context);

          }
          ),
          
          CustomButton(
            text: 'Cancel', 
            color: Theme.of(context).colorScheme.error, 
            onPressed: (){

              //clear text field
              textController.clear();

              //pop dialog
              Navigator.pop(context);
            })

        ],

      )
    );
  }


  //delete a note
  void deleteNote(int id){
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    
    //note database
    final noteDatabase = context.watch<NoteDatabase>();

    //current notes
    List<Note> currentNotes = noteDatabase.currentNotes; 


    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      backgroundColor: Theme.of(context).colorScheme.surface,

      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),

      drawer: const MyDrawer(),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          //HEADING
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text('Notes',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            
            ),
          ),

          //LIST OF NOTES
          Expanded(
            child: ListView.builder(
              
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
            
                //get individual note
                final note = currentNotes[index];
            
                //list tile UI
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface, // Color de fondo del contenedor
                  borderRadius: BorderRadius.circular(12), // Bordes redondeados
                  border: Border.all(color: Theme.of(context).colorScheme.inversePrimary), // Borde con color y ancho
                ),
                    child: ListTile(
                      title: Text(note.text),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                        
                            //edit button
                            IconButton(
                            onPressed: ()=> updateNote(note),
                        
                            icon: Icon(Icons.edit),
                            ),
                        
                            //delete button
                            IconButton(
                            onPressed: ()=> deleteNote(note.id),
                        
                            icon: Icon(Icons.delete),
                            ),
                        ],
                        
                        ),
                      ),
                    ),
                  ),
                );
            
              },
            ),
          ),
        ],
      ),
    );
  }
}