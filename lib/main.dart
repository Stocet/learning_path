import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Define the Stock model
class Stock {
  final String symbol;
  final String name;
  final double price;
  final double changePercent;

  Stock({
    required this.symbol,
    required this.name,
    required this.price,
    required this.changePercent,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Stock Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
      ),
      home: const StockListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StockListScreen extends StatefulWidget {
  const StockListScreen({super.key});

  @override
  State<StockListScreen> createState() => _StockListScreenState();
}

enum SortOption { price, changePercent }

class _StockListScreenState extends State<StockListScreen> {
  // Mock stock data
  final List<Stock> _stocks = [
    Stock(
      symbol: 'AAPL',
      name: 'Apple Inc.',
      price: 175.20,
      changePercent: 1.25,
    ),
    Stock(
      symbol: 'GOOGL',
      name: 'Alphabet Inc.',
      price: 150.80,
      changePercent: -0.75,
    ),
    Stock(
      symbol: 'MSFT',
      name: 'Microsoft Corp.',
      price: 430.50,
      changePercent: 0.50,
    ),
    Stock(
      symbol: 'AMZN',
      name: 'Amazon.com Inc.',
      price: 185.10,
      changePercent: 2.10,
    ),
    Stock(
      symbol: 'TSLA',
      name: 'Tesla Inc.',
      price: 240.00,
      changePercent: -1.50,
    ),
    Stock(
      symbol: 'NVDA',
      name: 'NVIDIA Corp.',
      price: 920.00,
      changePercent: 3.50,
    ),
    Stock(
      symbol: 'META',
      name: 'Meta Platforms Inc.',
      price: 490.00,
      changePercent: -0.20,
    ),
    Stock(
      symbol: 'NFLX',
      name: 'Netflix Inc.',
      price: 650.00,
      changePercent: 1.80,
    ),
    Stock(
      symbol: 'ADBE',
      name: 'Adobe Inc.',
      price: 520.00,
      changePercent: -1.10,
    ),
    Stock(
      symbol: 'PYPL',
      name: 'PayPal Holdings Inc.',
      price: 60.00,
      changePercent: 0.90,
    ),
  ];

  SortOption _currentSortOption = SortOption.price;
  bool _isAscending = true; // For price sorting

  @override
  void initState() {
    super.initState();
    _sortStocks(); // Initial sort by price ascending
  }

  void _sortStocks() {
    setState(() {
      if (_currentSortOption == SortOption.price) {
        _stocks.sort(
          (a, b) =>
              _isAscending
                  ? a.price.compareTo(b.price)
                  : b.price.compareTo(a.price),
        );
      } else {
        // Sort by changePercent: highest positive to lowest negative
        _stocks.sort((a, b) => b.changePercent.compareTo(a.changePercent));
      }
    });
  }

  // Function to format change percentage with sign and color
  Text _formatChangePercent(double changePercent) {
    String sign = changePercent > 0 ? '+' : '';
    Color color =
        changePercent > 0
            ? Colors.green
            : (changePercent < 0 ? Colors.red : Colors.grey);
    return Text(
      '$sign${changePercent.toStringAsFixed(2)}%',
      style: TextStyle(color: color, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Stock Viewer'),
        actions: [
          // Sort by Price button
          TextButton.icon(
            onPressed: () {
              setState(() {
                if (_currentSortOption == SortOption.price) {
                  _isAscending =
                      !_isAscending; // Toggle sort order if already sorting by price
                } else {
                  _currentSortOption = SortOption.price;
                  _isAscending =
                      true; // Default to ascending when switching to price sort
                }
                _sortStocks();
              });
            },
            icon: Icon(
              Icons.sort,
              color:
                  _currentSortOption == SortOption.price
                      ? Colors.white
                      : Colors.white70,
            ),
            label: Text(
              'By Price ${_currentSortOption == SortOption.price ? (_isAscending ? '▲' : '▼') : ''}',
              style: TextStyle(
                color:
                    _currentSortOption == SortOption.price
                        ? Colors.white
                        : Colors.white70,
              ),
            ),
          ),
          // Sort by Change % button
          TextButton.icon(
            onPressed: () {
              setState(() {
                _currentSortOption = SortOption.changePercent;
                _sortStocks();
              });
            },
            icon: Icon(
              Icons.trending_up,
              color:
                  _currentSortOption == SortOption.changePercent
                      ? Colors.white
                      : Colors.white70,
            ),
            label: Text(
              'By Change %',
              style: TextStyle(
                color:
                    _currentSortOption == SortOption.changePercent
                        ? Colors.white
                        : Colors.white70,
              ),
            ),
          ),
        ],
      ),
      body:
          _stocks.isEmpty
              ? const Center(child: Text('No stocks to display.'))
              : ListView.builder(
                itemCount: _stocks.length,
                itemBuilder: (context, index) {
                  final stock = _stocks[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  stock.symbol,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  stock.name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$${stock.price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                _formatChangePercent(stock.changePercent),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
