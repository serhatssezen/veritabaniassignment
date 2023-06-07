package com.example.service.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "games")
@Data
@NoArgsConstructor
public class Game {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String slug;
    private String name;
    private LocalDate released;
    private String backgroundImage;
    private Double rating;
    private Integer ratingTop;

    @ManyToMany
    @JoinTable(name = "games_platforms",
            joinColumns = @JoinColumn(name = "game_id"),
            inverseJoinColumns = @JoinColumn(name = "platform_id"))
    private List<Platform> platforms;

    @ManyToMany
    @JoinTable(name = "games_genres",
            joinColumns = @JoinColumn(name = "game_id"),
            inverseJoinColumns = @JoinColumn(name = "genre_id"))
    private List<Genre> genres;

    @ManyToMany
    @JoinTable(name = "game_prices",
            joinColumns = @JoinColumn(name = "game_id"),
            inverseJoinColumns = @JoinColumn(name = "id"))
    private List<GamePrice> prices;

    @OneToMany()
    @JoinColumn(name = "game_id")
    private List<ShortScreenshot> shortScreenshots;

    @ManyToMany
    @JoinTable(name = "comments",
            joinColumns = @JoinColumn(name = "game_id"),
            inverseJoinColumns = @JoinColumn(name = "id"))
    private List<Comment> comments;
}