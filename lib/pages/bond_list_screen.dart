import 'package:flutter/material.dart';

class Bond {
  final String name;
  final double coupon;
  final int maturityYear;
  final double price;

  Bond({
    required this.name,
    required this.coupon,
    required this.maturityYear,
    required this.price,
  });
}

class BondListScreen extends StatefulWidget {
  const BondListScreen({super.key});

  @override
  State<BondListScreen> createState() => _BondListScreenState();
}

class _BondListScreenState extends State<BondListScreen> {
  final List<Bond> _allBonds = [
    Bond(
      name: 'US Treasury Bond 2030',
      coupon: 2.5,
      maturityYear: 2030,
      price: 98.50,
    ),
    Bond(
      name: 'Corporate Bond ABC 2028',
      coupon: 4.0,
      maturityYear: 2028,
      price: 102.10,
    ),
    Bond(
      name: 'Municipal Bond XYZ 2035',
      coupon: 1.8,
      maturityYear: 2035,
      price: 95.00,
    ),
    Bond(
      name: 'High-Yield Bond QWE 2026',
      coupon: 6.5,
      maturityYear: 2026,
      price: 88.75,
    ),
    Bond(
      name: 'Euro Bond DEF 2032',
      coupon: 3.2,
      maturityYear: 2032,
      price: 100.00,
    ),
    Bond(
      name: 'Asia Bond GHI 2029',
      coupon: 5.1,
      maturityYear: 2029,
      price: 105.50,
    ),
    Bond(
      name: 'Green Bond JKL 2040',
      coupon: 2.0,
      maturityYear: 2040,
      price: 92.30,
    ),
    Bond(
      name: 'Emerging Market Bond MNO 2027',
      coupon: 7.0,
      maturityYear: 2027,
      price: 90.00,
    ),
    Bond(
      name: 'Inflation-Linked Bond PQR 2033',
      coupon: 1.5,
      maturityYear: 2033,
      price: 99.20,
    ),
    Bond(
      name: 'Convertible Bond STU 2031',
      coupon: 3.8,
      maturityYear: 2031,
      price: 101.80,
    ),
  ];

  List<Bond> _filteredBonds = [];

  RangeValues _couponRange = const RangeValues(0.0, 10.0);
  RangeValues _maturityYearRange = const RangeValues(2025, 2040);

  @override
  void initState() {
    super.initState();
    _filteredBonds = List.from(_allBonds);
    _applyFilters();
  }

  void _applyFilters() {
    setState(() {
      _filteredBonds =
          _allBonds.where((bond) {
            final bool couponMatches =
                bond.coupon >= _couponRange.start &&
                bond.coupon <= _couponRange.end;
            final bool maturityMatches =
                bond.maturityYear >= _maturityYearRange.start &&
                bond.maturityYear <= _maturityYearRange.end;
            return couponMatches && maturityMatches;
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Bond Viewer')),
      body: Column(
        children: [
          ExpansionTile(
            title: const Text('Filters'),
            leading: const Icon(Icons.filter_list),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Coupon Range: ${_couponRange.start.toStringAsFixed(1)}% - ${_couponRange.end.toStringAsFixed(1)}%',
                    ),
                    RangeSlider(
                      values: _couponRange,
                      min: 0.0,
                      max: 10.0,
                      divisions: 20,
                      labels: RangeLabels(
                        _couponRange.start.toStringAsFixed(1),
                        _couponRange.end.toStringAsFixed(1),
                      ),
                      onChanged: (RangeValues newValues) {
                        setState(() {
                          _couponRange = newValues;
                          _applyFilters();
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Maturity Year: ${_maturityYearRange.start.toInt()} - ${_maturityYearRange.end.toInt()}',
                    ),
                    RangeSlider(
                      values: _maturityYearRange,
                      min: 2025,
                      max: 2040,
                      divisions: 15,
                      labels: RangeLabels(
                        _maturityYearRange.start.toInt().toString(),
                        _maturityYearRange.end.toInt().toString(),
                      ),
                      onChanged: (RangeValues newValues) {
                        setState(() {
                          _maturityYearRange = newValues;
                          _applyFilters();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child:
                _filteredBonds.isEmpty
                    ? const Center(child: Text('No bonds match your filters.'))
                    : ListView.builder(
                      itemCount: _filteredBonds.length,
                      itemBuilder: (context, index) {
                        final bond = _filteredBonds[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bond.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.percent,
                                              size: 16,
                                              color: Colors.blueGrey,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Coupon: ${bond.coupon.toStringAsFixed(2)}%',
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.calendar_today,
                                              size: 16,
                                              color: Colors.blueGrey,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Maturity: ${bond.maturityYear}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Price: \$${bond.price.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
