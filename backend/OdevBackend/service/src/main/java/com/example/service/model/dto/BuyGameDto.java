package com.example.service.model.dto;

import com.example.service.model.PaymentType;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class BuyGameDto {
    private Long userId;
    private List<Long> gameId;
    private double totalPrice;
    private PaymentType paymentType;
}
