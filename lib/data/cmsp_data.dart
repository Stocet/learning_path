// cmsp_data.dart
enum CMSPType {
  all,
  mnoLed, // Mobile Network Operator-led
  bankLed, // Bank-led
}

class CMSP {
  final String name;
  final CMSPType type;
  final String licensedDate;
  final String summary;
  final String background;
  final String goals;
  final String capital;

  CMSP({
    required this.name,
    required this.type,
    required this.licensedDate,
    required this.summary,
    required this.background,
    required this.goals,
    required this.capital,
  });
}

// Mock CMSP data for Ethiopia
final List<CMSP> mockCMSPs = [
  CMSP(
    name: 'Telebirr',
    type: CMSPType.mnoLed,
    licensedDate: 'April 23, 2021',
    summary:
        'A mobile money service provided by Ethio Telecom, offering a wide range of digital financial services.',
    background:
        'Launched by the state-owned telecom company, Ethio Telecom, to facilitate cashless transactions and boost financial inclusion. It was the first mobile network operator-led financial service in Ethiopia.',
    goals:
        'To provide a secure and convenient mobile money platform, expand financial services to unbanked populations, and enable digital payments for goods and services.',
    capital:
        'Backed by the significant capital and infrastructure of Ethio Telecom.',
  ),
  CMSP(
    name: 'CBE Birr',
    type: CMSPType.bankLed,
    licensedDate: 'N/A (as a mobile money service)',
    summary:
        'The mobile banking service from the Commercial Bank of Ethiopia (CBE), a major player in the financial sector.',
    background:
        'As the largest bank in Ethiopia, CBE introduced CBE Birr to leverage its vast customer base and agent network for mobile financial services. It is a key part of the bank\'s digital transformation strategy.',
    goals:
        'To extend banking services beyond physical branches, provide a simple and accessible platform for transactions, and promote digital payments among its millions of customers.',
    capital:
        'Supported by the substantial capital and financial backing of the Commercial Bank of Ethiopia.',
  ),
  CMSP(
    name: 'M-Pesa (Safaricom)',
    type: CMSPType.mnoLed,
    licensedDate: 'May 10, 2023',
    summary:
        'A mobile money platform from Safaricom Ethiopia, leveraging its famous brand from Kenya to enter the Ethiopian market.',
    background:
        'Following its successful launch in Kenya, Safaricom brought its widely-known M-Pesa platform to Ethiopia. It aims to replicate its success by providing a robust and inclusive mobile money ecosystem.',
    goals:
        'To become a leading mobile money provider in Ethiopia, offering essential services like person-to-person transfers, merchant payments, and international remittances.',
    capital:
        'Part of the substantial investment by Safaricom and its consortium in the Ethiopian telecommunications and financial sectors.',
  ),
  CMSP(
    name: 'Kacha Digital Financial Services',
    type: CMSPType.bankLed,
    licensedDate: 'June 16, 2022',
    summary:
        'A digital financial services provider, licensed by the National Bank of Ethiopia, offering a new alternative in the market.',
    background:
        'Kacha is a standalone digital financial services provider, backed by a consortium of banks, fintech companies, and other partners. It was the first to receive a Payment Instrument Issuer license from NBE.',
    goals:
        'To bridge the gap in digital financial services, focusing on innovative solutions and partnerships to serve a broader audience, including rural communities.',
    capital:
        'Backed by a significant initial investment from its consortium of founders.',
  ),
  CMSP(
    name: 'Yaya Payment Instrument Issuer',
    type: CMSPType.bankLed,
    licensedDate: 'October 13, 2023',
    summary:
        'Another key player in the digital payments space, offering a range of services to both individuals and businesses.',
    background:
        'Yaya is a payment instrument issuer that aims to be a comprehensive digital wallet, providing services that go beyond basic transfers to include e-commerce and bill payments.',
    goals:
        'To build a robust digital ecosystem for payments, fostering a cashless society and providing user-friendly financial tools.',
    capital:
        'Funded by a group of investors and partners to compete in the growing digital finance market.',
  ),
];
