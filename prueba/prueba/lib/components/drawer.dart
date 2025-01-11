import 'package:flutter/material.dart';
import 'package:prueba/components/drawer_tile.dart';
import 'package:prueba/pages/settings.dart';

class MyDrawer extends StatelessWidget {

  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(

        children: [
          //header
          const DrawerHeader(child: Icon(Icons.note),

          ),


          //notes tile
          DrawerTile(
            title: 'Notes', 
            leading: Icon(Icons.home), 
            onTap: ()=> Navigator.pop(context)),

          //settings tile
          DrawerTile(
            title: 'Settings', 
            leading: Icon(Icons.settings), 
            onTap: (){
            //pop drawer
            Navigator.pop(context);

            Navigator.push(context,
            MaterialPageRoute(
            builder: (context) => Settings(),
                )
              );
            }
          ),
        ],
      ),
    );
  }
}