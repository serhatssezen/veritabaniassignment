package com.example.service.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class GameSearchDto {
    private Integer page;
    private String name;
    private List<Long> platforms;
    private List<Long> genres;
}
