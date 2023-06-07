package com.example.service.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class CommentDto {
    private Long userId;
    private Long gameId;
    private String comment;
}
