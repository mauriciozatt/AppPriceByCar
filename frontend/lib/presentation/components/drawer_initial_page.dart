import 'package:flutter/material.dart';

class DrawerInitialPage extends StatelessWidget {
  const DrawerInitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue.shade400,
              image: const DecorationImage(
                alignment: Alignment.center,
                image: AssetImage('assets/img/img1.jpg'),
                opacity: 0.3,
                fit: BoxFit.cover,
              ),
            ),
            accountName: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'Moris Multimarcas',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            accountEmail: const Text(
              'Mauriciozatt@hotmail.com',
              style: TextStyle(color: Colors.white70),
            ),
            currentAccountPicture: ClipOval(
              child: Image.asset(
                'assets/img/avatar.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ExpansionTile(
                  title: const Text(
                    'Cadastros',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: const Icon(Icons.folder, color: Colors.blue),
                  children: [
                    ListTile(
                      title: const Text('Veículos'),
                      leading: const Icon(Icons.directions_car_filled),
                      onTap: () => Navigator.pushNamed(context, 'veiculos'),
                    ),
                    ListTile(
                      title: const Text('Marca'),
                      leading: const Icon(Icons.business),
                      onTap: () => Navigator.pushNamed(context, 'marca'),
                    ),
                    ListTile(
                      title: const Text('Modelo'),
                      leading: const Icon(Icons.my_library_books),
                      onTap: () => Navigator.pushNamed(context, 'modelo'),
                    ),
                    ListTile(
                      title: const Text('Potência'),
                      leading: const Icon(Icons.flash_on),
                      onTap: () => Navigator.pushNamed(context, 'potencia'),
                    ),
                  ],
                ),
                ListTile(
                  title: const Text(
                    'Gestão de Veículos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  leading: const Icon(Icons.manage_accounts, color: Colors.blue),
                  onTap: () => Navigator.pushNamed(context, 'gestao_veiculos'),
                ),
                ListTile(
                  title: const Text(
                    'Relatórios',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  leading: const Icon(Icons.print, color: Colors.blue),
                  onTap: () => Navigator.pushNamed(context, 'relatorios'),
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Sair',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            leading: const Icon(Icons.power_settings_new, color: Colors.red),
            onTap: () {
              Navigator.pop(context); 
            },
          ),
        ],
      ),
    );
  }
}
