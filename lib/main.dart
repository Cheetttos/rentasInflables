import 'package:flutter/material.dart';
import 'package:rentas/screens/agregar_renta_screen.dart';
import 'package:rentas/screens/eventos_screen.dart';
import 'package:rentas/screens/historial_rentas_screen.dart'; // Importar la pantalla HistorialRentasScreen
import 'package:rentas/screens/detalle_renta_screen.dart';
import 'package:rentas/screens/login_screen.dart';
import 'package:rentas/screens/navigation_bar.dart'; // Importar la pantalla DetalleRentaScreen
import 'package:intl/date_symbol_data_local.dart';
import 'package:rentas/screens/register_screen.dart';
import 'package:rentas/settings/notification_helper.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();
  initializeDateFormatting('es_ES', null).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}); // Elimina const aquí

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Renta de inflables',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      
      routes: {
        '/login': (context) => const LoginScreen(),
        '/dash': (context) => const NavigationBarApp(),
        '/eventos': (context) => const EventosScreen(),
        '/historial': (context) =>
            HistorialRentasScreen(), // Ruta para la pantalla de historial de rentas
        '/detalleR': (context) =>
            const DetalleRentaScreen(), // Ruta para la pantalla de detalle de renta
        '/agregarRenta': (context) => const AgregarRentaScreen(),
        '/register': (context) => const RegisterScreen()
      },
    );
  }
}
