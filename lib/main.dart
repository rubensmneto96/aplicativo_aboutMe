import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF212121)),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final sobreMim =
      'Meu nome é Rubens Mreis Neto. Sou estudante de Sistemas para Internet, graduado em Segurança da Informação. Sou ex-militar da Marinha do Brasil e atualmente desenvolvedor Web e analista de Segurança da Informação. Procuro sempre me manter atualizado sobre as novas tecnologias do mercado, e sempre procuro estudar e aprender sobre novas linguagens de programação voltadas para o back-end e para segurança de dados.';
  final urlImagem =
      'https://rubensmneto96.github.io/portfolio/img/foto_perfil.jpg';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sobre mim'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Pessoal'),
              Tab(text: 'Profissional'),
            ],
          ),
        ),
        drawer: SafeArea(
          child: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(urlImagem),
                  ),
                  accountName: const Text('Rubens Mreis Neto'),
                  accountEmail: const Text('rubensmn96@gmail.com'),
                )
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          _buildPersonalContent(),
          _buildProfessionalContent(),
        ]),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              final Uri url = Uri.parse('https://github.com/rubensmneto96');

              launchUrl(url);
            },
            label: const Text('Follow Me'),
            icon: const Icon(Icons.favorite)),
      ),
    );
  }

  _buildPersonalContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(),
        const Padding(padding: EdgeInsets.only(top: 40)),
        ClipRRect(
          borderRadius: BorderRadius.circular(80.0),
          child: Image.network(
            urlImagem,
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            'Rubens Mreis Neto',
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FlutterLogo(),
            Text(
              'Flutter Developer',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: 5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/4997/4997543.png',
              width: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 4),
            ),
            Text(
              'Fullstack Developer',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        const Divider(
          indent: 32,
          endIndent: 32,
          height: 24,
          thickness: 3,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            sobreMim,
            style: const TextStyle(height: 1.5, color: Colors.white),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }

  _buildProfessionalContent() {
    const projetos_desc =
        'Seguem aqui alguns de meus projetos. Os mesmos estão disponíveis no meu portfólio.';
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            'Meus Projetos',
            style: GoogleFonts.oswald(
                fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(projetos_desc,
              style: GoogleFonts.ubuntu(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.justify),
        ),
        Padding(padding: const EdgeInsets.only(top: 10)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(maxWidth: 10),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                    ),
                    onPressed: () {
                      _abrePortfolio();
                    },
                    child: const Text('Acesse meu portfólio')),
              ],
            ),
          ),
        ]),
        const Divider(
            color: Color.fromARGB(255, 41, 109, 245),
            indent: 32,
            endIndent: 32,
            thickness: 3),
        Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Relógio Simples em JS',
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 10)),
            GestureDetector(
              onTap: () {
                final Uri url = Uri.parse(
                    'https://rubensmneto96.github.io/relogio-simples2/');

                launchUrl(url);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://rubensmneto96.github.io/portfolio/img/relogio-simples.png',
                  width: 350,
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 40)),
            Container(
              child: Text(
                'Cadastro de clientes Django',
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 10)),
            GestureDetector(
              onTap: () {
                final Uri url = Uri.parse(
                    'https://cadastro-mostrar-clientes.herokuapp.com/');

                launchUrl(url);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://rubensmneto96.github.io/portfolio/img/cadastro-clientes.png',
                  width: 350,
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 40)),
            Container(
              child: Text(
                'Reserva de Sala Ruby on Rails',
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 10)),
            GestureDetector(
              onTap: () {
                final Uri url =
                    Uri.parse('https://reserva-sala-rails.herokuapp.com/');

                launchUrl(url);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://rubensmneto96.github.io/portfolio/img/reserva-sala.png',
                  width: 350,
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 40)),
            Container(
              child: Text(
                'Landing Zone',
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 10)),
            GestureDetector(
              onTap: () {
                final Uri url =
                    Uri.parse('https://rubensmneto96.github.io/landing-page/');

                launchUrl(url);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://rubensmneto96.github.io/portfolio/img/landing-page.png',
                  width: 350,
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 40)),
          ],
        ),
        Padding(padding: const EdgeInsets.only(bottom: 10)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            'Minhas Redes',
            style: GoogleFonts.oswald(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(FontAwesomeIcons.github, color: Colors.white),
          title: Text(
            'Github',
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            'https://github.com/rubensmneto96',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const ListTile(
          leading: Icon(FontAwesomeIcons.linkedin, color: Color(0xFF2E92D8)),
          title: Text(
            'LinkedIn',
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            'https://www.linkedin.com/in/rubens-mreis-neto/',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const ListTile(
          leading: Icon(
            FontAwesomeIcons.facebook,
            color: Color(0xFF2D6AD6),
          ),
          title: Text(
            'Facebook',
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            'https://www.facebook.com/rubens.neto.3726',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  _abrePortfolio() {
    final Uri url = Uri.parse('https://rubensmneto96.github.io/portfolio/');

    launchUrl(url);
  }
}
