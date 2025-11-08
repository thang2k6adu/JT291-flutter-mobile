import 'package:jt291_flutter_mobile/data/models/users/pagination_model.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/wallet_summary_model.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/recharge_package_model.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/monthly_card_model.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/transaction_model.dart';

final walletSummaryMock = WalletSummaryModel(
  totalDiamondBalance: 54292.79,
  vexBalance: 5000,
  monthlyCardStatus: "active",
);

final rechargePackagesMock = [
  RechargePackageModel(packageId: 1, diamonds: 435, price: 20),
  RechargePackageModel(packageId: 2, diamonds: 1230, price: 50),
  RechargePackageModel(packageId: 3, diamonds: 3210, price: 80),
  RechargePackageModel(packageId: 4, diamonds: 15380, price: 120),
  RechargePackageModel(packageId: 5, diamonds: 36920, price: 200),
  RechargePackageModel(packageId: 6, diamonds: 112300, price: 420),
];

final monthlyCardsMock = [
  MonthlyCardModel(cardId: 1, price: 99000, diamondsDaily: 50),
  MonthlyCardModel(cardId: 2, price: 199000, diamondsDaily: 120),
  MonthlyCardModel(cardId: 3, price: 299000, diamondsDaily: 200),
];

final mockTransactions = <TransactionModel>[
  // Deposit
  TransactionModel(
    id: 'tx_001',
    type: TransactionType.deposit,
    amount: 500,
    balanceAfter: 1500,
    timestamp: '2025-11-08T10:00:00Z',
    description: 'Deposit diamonds from app',
    status: TransactionStatus.completed,
  ),

  // Withdrawal
  TransactionModel(
    id: 'tx_002',
    type: TransactionType.withdrawal,
    amount: -200,
    balanceAfter: 1300,
    timestamp: '2025-11-07T14:30:00Z',
    description: 'Withdraw diamonds',
    status: TransactionStatus.pending,
  ),

  // Exchange
  TransactionModel(
    id: 'tx_003',
    type: TransactionType.exchange,
    amount: -100,
    balanceAfter: 1200,
    timestamp: '2025-11-06T12:15:00Z',
    description: 'Exchange VEX to Diamonds',
    exchange: ExchangeDetails(
      fromCurrency: CurrencyType.vex,
      fromAmount: 50,
      toCurrency: CurrencyType.diamonds,
      toAmount: 100,
      rate: 2,
    ),
    status: TransactionStatus.completed,
  ),

  // Gift Received
  TransactionModel(
    id: 'tx_004',
    type: TransactionType.giftReceived,
    amount: 300,
    balanceAfter: 1500,
    timestamp: '2025-11-05T18:45:00Z',
    description: 'Received gift from live',
    item: TransactionItem(
      name: 'Rose Bouquet',
      quantity: 3,
      icon: 'rose_bouquet', // key thay vì emoji
      value: 100,
    ),
    relatedUser: RelatedUser(
      id: 'user_123',
      username: 'live_star',
      displayName: 'Live Star',
      avatar: 'https://example.com/avatar1.png',
      isVerified: true,
    ),
    status: TransactionStatus.completed,
  ),

  // Gift Sent
  TransactionModel(
    id: 'tx_005',
    type: TransactionType.giftSent,
    amount: -150,
    balanceAfter: 1350,
    timestamp: '2025-11-05T19:00:00Z',
    description: 'Sent gift to friend',
    item: TransactionItem(
      name: 'Golden Crown',
      quantity: 1,
      icon: 'golden_crown', // key thay vì emoji
      value: 150,
    ),
    relatedUser: RelatedUser(
      id: 'user_456',
      username: 'friend_01',
      displayName: 'Friend One',
      avatar: 'https://example.com/avatar2.png',
      isVerified: false,
    ),
    status: TransactionStatus.completed,
  ),

  // Reward
  TransactionModel(
    id: 'tx_006',
    type: TransactionType.reward,
    amount: 50,
    balanceAfter: 1400,
    timestamp: '2025-11-04T09:30:00Z',
    description: 'Daily login reward',
    status: TransactionStatus.completed,
  ),

  // Refund
  TransactionModel(
    id: 'tx_007',
    type: TransactionType.refund,
    amount: 200,
    balanceAfter: 1600,
    timestamp: '2025-11-03T11:20:00Z',
    description: 'Refund for cancelled purchase',
    status: TransactionStatus.completed,
  ),

  // Failed Transaction
  TransactionModel(
    id: 'tx_008',
    type: TransactionType.withdrawal,
    amount: -500,
    balanceAfter: 1600,
    timestamp: '2025-11-02T15:45:00Z',
    description: 'Failed withdrawal',
    status: TransactionStatus.failed,
  ),

  // Cancelled Transaction
  TransactionModel(
    id: 'tx_009',
    type: TransactionType.deposit,
    amount: 300,
    balanceAfter: 1600,
    timestamp: '2025-11-01T12:00:00Z',
    description: 'Cancelled deposit',
    status: TransactionStatus.cancelled,
  ),
];

final mockPagination = PaginationModel(
  limit: 10,
  offset: 0,
  total: 9,
);

final mockTransactionHistoryResponse = TransactionHistoryResponse(
  data: mockTransactions,
  pagination: mockPagination,
);
