enum PaymentType {
  CREDIT_CARD,
  PAYWallet,
}

extension PaymentTypeExtension on PaymentType {
  String get displayName {
    switch (this) {
      case PaymentType.CREDIT_CARD:
        return "Credit Card";
      case PaymentType.PAYWallet:
        return "Pay Wallet";
      default:
        return '';
    }
  }
}