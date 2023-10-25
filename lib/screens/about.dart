import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 55, 64, 78),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Anggota Kelompok 17',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 80,
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        "https://source.unsplash.com/720x720?rock-band", // URL gambar profil
                        width: 200,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Card(
                        child: ListTile(
                          title: Text('Aditya Akbar Subakti'),
                          subtitle: Text('21120121130041'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Fadlil Ferdiansyah'),
                          subtitle: Text('21120121130073'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Muhammad Fadlan Daris'),
                          subtitle: Text('21120121140146'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Muhammad Fathan Mubiina'),
                          subtitle: Text('21120121140164'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
