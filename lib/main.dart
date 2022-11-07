import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'reto 1 equipo 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'equipo 1 2286'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final txtOrigen = TextEditingController();
final txtDestino = TextEditingController();

String Opt1 = "COP";
String Opt2 = "USD";

class Calculador {
  final Titulo;
  final Color;
  final Icon;

  Calculador(this.Titulo, this.Color, this.Icon);
}

List<DropdownMenuItem<String>> dd = <DropdownMenuItem<String>>[
  DropdownMenuItem(value: "USD", child: Text("USD")),
  DropdownMenuItem(value: "EUR", child: Text("EUR")),
  DropdownMenuItem(value: "COP", child: Text("COP")),
];

List<Calculador> cal = <Calculador>[
  Calculador("9", Color.fromARGB(255, 183, 216, 146), Icon(Icons.abc)),
  Calculador("8", Color.fromARGB(255, 183, 216, 146), Icon(Icons.abc)),
  Calculador("7", Color.fromARGB(255, 183, 216, 146), Icon(Icons.abc)),
  Calculador("6", Color.fromARGB(255, 183, 216, 146), Icon(Icons.abc)),
  Calculador("5", Color.fromARGB(255, 183, 216, 146), Icon(Icons.abc)),
  Calculador("4", Color.fromARGB(255, 183, 216, 146), Icon(Icons.abc)),
  Calculador("3", Color.fromARGB(255, 183, 216, 146), Icon(Icons.abc)),
  Calculador("2", Color.fromARGB(255, 183, 216, 146), Icon(Icons.abc)),
  Calculador("1", Color.fromARGB(255, 183, 216, 146), Icon(Icons.abc)),
  Calculador("0", Color.fromARGB(255, 183, 216, 146), Icon(Icons.abc)),
  Calculador("Limpiar", Color.fromARGB(255, 183, 216, 146),
      Icon(Icons.cleaning_services)),
  Calculador(
      "Calcular", Color.fromARGB(255, 183, 216, 146), Icon(Icons.calculate)),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Origen: "),
                    DropdownButton(
                        value: Opt1,
                        items: dd,
                        onChanged: (String? x) {
                          setState(() {
                            Opt1 = x.toString();
                          });
                        }),
                    VerticalDivider(),
                    VerticalDivider(),
                    VerticalDivider(),
                    VerticalDivider(),
                    VerticalDivider(),
                    Text("Destino: "),
                    DropdownButton(
                        value: Opt2,
                        items: dd,
                        onChanged: (String? x) {
                          setState(() {
                            Opt2 = x.toString();
                          });
                        }),
                  ],
                ),
                TextField(
                  controller: txtOrigen,
                  decoration:
                      InputDecoration(labelText: "Moneda", hintText: "0"),
                ),
                TextField(
                  controller: txtDestino,
                  decoration:
                      InputDecoration(labelText: "Moneda", hintText: "0"),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: cal.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: cal[index].Color,
                        child: ListTile(
                          title: Center(
                            child: index == 10
                                ? cal[index].Icon
                                : Text(cal[index].Titulo),
                          ),
                          onTap: () {
                            if (index < 10) {
                              txtOrigen.text =
                                  txtOrigen.text + cal[index].Titulo;
                            } else if (index == 10) {
                              txtOrigen.text = "";
                              txtDestino.text = "";
                            } else {
                              if (Opt1 == "USD" && Opt2 == "COP") {
                                txtDestino.text =
                                    (double.parse(txtOrigen.text) * 4974)
                                        .toString();
                              } else if (Opt1 == "COP" && Opt2 == "USD") {
                                txtDestino.text =
                                    (double.parse(txtOrigen.text) / 4974)
                                        .toString();
                              } else if (Opt1 == "EUR" && Opt2 == "COP") {
                                txtDestino.text =
                                    (double.parse(txtOrigen.text) * 4955)
                                        .toString();
                              } else if (Opt1 == "COP" && Opt2 == "EUR") {
                                txtDestino.text =
                                    (double.parse(txtOrigen.text) / 4955)
                                        .toString();
                              } else if (Opt1 == "EUR" && Opt2 == "USD") {
                                txtDestino.text =
                                    (double.parse(txtOrigen.text) * 1.00)
                                        .toString();
                              } else if (Opt1 == "USD" && Opt2 == "EUR") {
                                txtDestino.text =
                                    (double.parse(txtOrigen.text) / 1.00)
                                        .toString();
                              } else {
                                txtDestino.text = txtOrigen.text;
                              }
                            }
                            print(cal[index].Titulo);
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            )));
  }
}
