import 'package:flutter/material.dart';
import 'package:stocet_learning_path/data/cmsp_data.dart';
import 'package:stocet_learning_path/pages/cmsp_detail_screen.dart';

class CMSPListScreen extends StatefulWidget {
  const CMSPListScreen({super.key});

  @override
  State<CMSPListScreen> createState() => _CMSPListScreenState();
}

class _CMSPListScreenState extends State<CMSPListScreen> {
  final List<CMSP> _allCMSPs = mockCMSPs;
  late List<CMSP> _filteredCMSPs;

  @override
  void initState() {
    super.initState();
    _filteredCMSPs = _allCMSPs;
  }

  void _filterCMSPs(CMSPType type) {
    setState(() {
      if (type == CMSPType.all) {
        _filteredCMSPs = _allCMSPs;
      } else {
        _filteredCMSPs = _allCMSPs.where((cmsp) => cmsp.type == type).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CMSPs')),
      body: DefaultTabController(
        length: 3, // All, MNO-led, Bank-led
        child: Column(
          children: [
            TabBar(
              labelColor: Theme.of(context).colorScheme.primary,
              unselectedLabelColor:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[400]
                      : Colors.grey,
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'MNO-led'),
                Tab(text: 'Bank-led'),
              ],
              onTap: (index) {
                if (index == 0) {
                  _filterCMSPs(CMSPType.all);
                } else if (index == 1) {
                  _filterCMSPs(CMSPType.mnoLed);
                } else {
                  _filterCMSPs(CMSPType.bankLed);
                }
              },
            ),
            Expanded(
              child:
                  _filteredCMSPs.isEmpty
                      ? const Center(child: Text('No CMSPs to display.'))
                      : ListView.builder(
                        itemCount: _filteredCMSPs.length,
                        itemBuilder: (context, index) {
                          final cmsp = _filteredCMSPs[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => CMSPDetailScreen(cmsp: cmsp),
                                ),
                              );
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cmsp.name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Type: ${cmsp.type.toString().split('.').last}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Licensed: ${cmsp.licensedDate}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      cmsp.summary,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
