package com.example.service.dao;

import com.example.service.model.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Repository
public interface GameServiceDAO extends JpaRepository<Comment, Long> {

    @Query("SELECT DISTINCT g FROM Game g " +
            "JOIN g.platforms p " +
            "JOIN g.genres ge " +
            "WHERE (coalesce(:pplatform) is null  OR p.id IN (:pplatform)) " +
            "AND (coalesce(:pgenres) IS NULL OR ge.id IN (:pgenres)) " +
            "AND (coalesce(:pname) IS NULL OR g.name LIKE %:pname% OR g.slug LIKE %:pname%)")
    List<Game> listAllGames(@Param("pplatform") List<Long> pplatform,  @Param("pgenres") List<Long> pgenres, @Param("pname") String name);

    @Query("SELECT t FROM Game t " +
            "WHERE t.id = :pgameId")
    Game getGameById(@Param("pgameId") Long gameId);

    @Query("SELECT c FROM Comment c WHERE c.game.id = :gameId")
    List<Comment> getCommentsByGameId(@Param("gameId") Long gameId);

    @Query("SELECT ug.game FROM UserGame ug WHERE ug.user.id = :userId")
    List<Game> getUserGames(@Param("userId") Long userId);

    @Query("SELECT g.balance FROM Wallet g WHERE g.user.id = :userId")
    Long getUserWallet(@Param("userId") Long userId);

    @Query("SELECT g FROM User g WHERE g.id = :userId")
    User getUserById(@Param("userId") Long userId);

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO users (username, email, password) VALUES (:username, :email, :password)", nativeQuery = true)
    User createUser(@Param("username") String username, @Param("email") String email, @Param("password") String password);

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO user_games (game_id, user_id, purchase_date) VALUES (:gameId, :userId, :date)", nativeQuery = true)
    int buyGame(@Param("gameId") Long gameId, @Param("userId") Long userId, @Param("date") LocalDateTime purchaseDate);

    @Modifying
    @Transactional
    @Query(value = "UPDATE wallets SET balance = :netBalance WHERE user_id = :userId", nativeQuery = true)
    int updateBalance(@Param("userId") Long userId, @Param("netBalance") double netBalance);

}
