enum PaymentType {
  CREDIT_CARD,
  PayWallet,
}

extension PaymentTypeExtension on PaymentType {
  String get displayName {
    switch (this) {
      case PaymentType.CREDIT_CARD:
        return "Credit Card";
      case PaymentType.PayWallet:
        return "Pay Wallet";
      default:
        return '';
    }
  }
}