package com.example.service.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "game_details")
@Data
@NoArgsConstructor
public class GameDetail {
    @Id
    private Long gameId;

    private String description;
    private String developer;
    private String publisher;
    private String genre;

    @OneToOne(fetch = FetchType.LAZY)
    @MapsId
    @JoinColumn(name = "game_id")
    private Game game;
}