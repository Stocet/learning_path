import 'package:flutter/material.dart';
import 'package:stocet_learning_path/pages/bond_list_screen.dart';
import 'package:stocet_learning_path/pages/cmsp_list_screen.dart';
import 'package:stocet_learning_path/pages/stock_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ValueNotifier<ThemeMode> _themeNotifier = ValueNotifier(
    ThemeMode.light,
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeNotifier,
      builder: (_, mode, __) {
        return MaterialApp(
          title: 'CMSP Explorer',
          // Light theme
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            brightness: Brightness.light,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              elevation: 4,
            ),
            cardTheme: CardTheme(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            ),
          ),
          // Dark theme
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.indigo,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1A237E), // A dark blue
              foregroundColor: Colors.white,
              elevation: 4,
            ),
            cardColor: Colors.grey[850], // Darker background for cards
            cardTheme: CardTheme(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            ),
          ),
          themeMode: mode,
          home: MainScreen(themeNotifier: _themeNotifier),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const MainScreen({super.key, required this.themeNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Viewer'),
        actions: [
          // Theme toggle button
          IconButton(
            icon: Icon(
              themeNotifier.value == ThemeMode.dark
                  ? Icons.wb_sunny
                  : Icons.nightlight_round,
            ),
            onPressed: () {
              themeNotifier.value =
                  themeNotifier.value == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light;
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMarketCard(
            context,
            'CMSPs',
            'Browse digital financial services.',
            Icons.apps,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CMSPListScreen()),
            ),
          ),
          _buildMarketCard(
            context,
            'Stocks',
            'View the latest stock market trends.',
            Icons.trending_up,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StockListScreen()),
            ),
          ),
          _buildMarketCard(
            context,
            'Bonds',
            'Explore current bond market data.',
            Icons.money,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BondListScreen()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMarketCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
