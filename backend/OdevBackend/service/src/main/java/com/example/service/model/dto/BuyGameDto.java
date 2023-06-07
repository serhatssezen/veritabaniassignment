package com.example.service.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BuyGameDto {
    private Long userId;
    private Long gameId;
}
