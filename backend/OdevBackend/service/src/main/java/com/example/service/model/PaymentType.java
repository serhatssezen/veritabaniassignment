package com.example.service.model;

public enum PaymentType {
    CREDIT_CARD("Credit Card"),
    PAYWallet("PayWallet");

    private final String displayName;

    PaymentType(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
}

