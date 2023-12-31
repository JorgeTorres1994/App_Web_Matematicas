/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nueva_app_web_matematicas/ESTUDIANTES/CuestionarioPreguntasPropuestas/CuestionarioPreguntasPropuestas.dart';
import 'package:nueva_app_web_matematicas/ESTUDIANTES/CuestionarioPreguntasResueltos/CuestionarioPreguntasResueltos.dart';

class CuestionarioEstudianteScreen extends StatefulWidget {
  final String temaId;

  CuestionarioEstudianteScreen({required this.temaId});
  @override
  _CuestionarioEstudianteScreenState createState() =>
      _CuestionarioEstudianteScreenState();
}

class _CuestionarioEstudianteScreenState
    extends State<CuestionarioEstudianteScreen> {
  String selectedThemeId = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<Map<String, dynamic>> cuestionarios = [];
  List<DropdownMenuItem<String>> items = [];
  int selectedQuizIndex = -1;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadCuestionariosFromFirestore();
  }

  Future<void> _loadCuestionariosFromFirestore() async {
    try {
      // Utiliza widget.temaId para cargar examenes específicos para ese tema.
      QuerySnapshot cuestionariosSnapshot = await firestore
          .collection('Cuestionario')
          .where('temaId', isEqualTo: widget.temaId) // Filtra por temaId
          .get();

      setState(() {
        cuestionarios = cuestionariosSnapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return {
            'id': doc.id, // Agrega el ID del documento al mapa
            ...data, // Agrega el resto de los datos del documento al mapa
          };
        }).toList();
      });
    } catch (e) {
      print('Error al cargar cuestionarios desde Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuestionario"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: cuestionarios.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> examen = cuestionarios[index];
                  return Card(
                    child: ListTile(
                      title: Text('Nombre: ${examen['nombre'] ?? ''}'),
                      subtitle: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBuilder<DocumentSnapshot>(
                                  future: firestore
                                      .collection('temas')
                                      .doc(examen['temaId'])
                                      .get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text('Tema: Cargando...');
                                    }
                                    if (!snapshot.hasData) {
                                      return Text('Tema: Desconocido');
                                    }
                                    String themeName =
                                        snapshot.data!['name'] as String;
                                    return Text('Tema: $themeName');
                                  },
                                ),
                                Text(
                                    'Descripción: ${examen['descripcion'] ?? ''}'),
                              ],
                            ),
                          ),
                          if (examen['imageUrl'] != null)
                            Container(
                              width: 100,
                              height: 100,
                              child: Image.network(
                                examen['imageUrl'],
                                fit: BoxFit.cover,
                              ),
                            ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.book_online),
                            onPressed: () {
                              debugPrint(
                                  'Cuestionario seleccionado: ${examen.toString()}');
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    CuestionarioPreguntasResueltos(
                                  selectedCuestionarioResuelto:
                                      examen, // Asegúrate de que este mapa contenga el campo idExamen
                                ),
                              ));
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.question_answer),
                            onPressed: () {
                              debugPrint(
                                  'Cuestionario seleccionado: ${examen.toString()}');
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    CuestionarioPreguntasPropuestas(
                                  selectedCuestionario:
                                      examen, // Asegúrate de que este mapa contenga el campo idExamen
                                ),
                              ));
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nueva_app_web_matematicas/ESTUDIANTES/CuestionarioPreguntasPropuestas/CuestionarioPreguntasPropuestas.dart';
import 'package:nueva_app_web_matematicas/ESTUDIANTES/CuestionarioPreguntasResueltos/CuestionarioPreguntasResueltos.dart';

class CuestionarioEstudianteScreen extends StatefulWidget {
  final String temaId;

  CuestionarioEstudianteScreen({required this.temaId});
  @override
  _CuestionarioEstudianteScreenState createState() =>
      _CuestionarioEstudianteScreenState();
}

class _CuestionarioEstudianteScreenState
    extends State<CuestionarioEstudianteScreen> {
  String selectedThemeId = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<Map<String, dynamic>> cuestionarios = [];
  List<DropdownMenuItem<String>> items = [];
  int selectedQuizIndex = -1;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadCuestionariosFromFirestore();
  }

  Future<void> _loadCuestionariosFromFirestore() async {
    try {
      // Utiliza widget.temaId para cargar examenes específicos para ese tema.
      QuerySnapshot cuestionariosSnapshot = await firestore
          .collection('Cuestionario')
          .where('temaId', isEqualTo: widget.temaId) // Filtra por temaId
          .get();

      setState(() {
        cuestionarios = cuestionariosSnapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return {
            'id': doc.id, // Agrega el ID del documento al mapa
            ...data, // Agrega el resto de los datos del documento al mapa
          };
        }).toList();
      });
    } catch (e) {
      print('Error al cargar cuestionarios desde Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuestionario"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: cuestionarios.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> examen = cuestionarios[index];
                  return Card(
                    child: ListTile(
                      title: Text('Nombre: ${examen['nombre'] ?? ''}'),
                      subtitle: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBuilder<DocumentSnapshot>(
                                  future: firestore
                                      .collection('temas')
                                      .doc(examen['temaId'])
                                      .get(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text('Tema: Cargando...');
                                    }
                                    if (!snapshot.hasData) {
                                      return Text('Tema: Desconocido');
                                    }
                                    String themeName =
                                        snapshot.data!['name'] as String;
                                    return Text('Tema: $themeName');
                                  },
                                ),
                                Text(
                                    'Descripción: ${examen['descripcion'] ?? ''}'),
                              ],
                            ),
                          ),
                          if (examen['imageUrl'] != null)
                            Container(
                              width: 100,
                              height: 100,
                              child: Image.network(
                                examen['imageUrl'],
                                fit: BoxFit.cover,
                              ),
                            ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.book_online),
                            onPressed: () {
                              debugPrint(
                                  'Cuestionario seleccionado: ${examen.toString()}');
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    CuestionarioPreguntasResueltos(
                                  selectedCuestionarioResuelto:
                                      examen, // Asegúrate de que este mapa contenga el campo idExamen
                                ),
                              ));
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.question_answer),
                            onPressed: () {
                              debugPrint(
                                  'Cuestionario seleccionado: ${examen.toString()}');
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    CuestionarioPreguntasPropuestas(
                                  selectedCuestionario:
                                      examen, // Asegúrate de que este mapa contenga el campo idExamen
                                ),
                              ));
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
