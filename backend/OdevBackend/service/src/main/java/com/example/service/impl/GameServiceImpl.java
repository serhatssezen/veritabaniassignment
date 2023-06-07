package com.example.service.impl;


import com.example.service.base.VarlikBaseService;
import com.example.service.dao.GameServiceDAO;
import com.example.service.model.*;
import com.example.service.model.dto.BuyGameDto;
import com.example.service.model.dto.GameSearchDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GameServiceImpl extends VarlikBaseService {
    @Autowired
    GameServiceDAO gameServiceDAO;

    public List<Game> listAllGames(GameSearchDto gameSearchDto) {
        return  gameServiceDAO.listAllGames(gameSearchDto.getPlatforms(), gameSearchDto.getGenres(), gameSearchDto.getName());
    }

    public Game getGameById(Long gameId) {
        return  gameServiceDAO.getGameById(gameId);
    }

    public List<Comment> getComments(Long gameId) {
        return  gameServiceDAO.getCommentsByGameId(gameId);
    }

    public Long getUserWallet(Long userId) {
        return  gameServiceDAO.getUserWallet(userId);
    }

    public List<Game> getUserGames(Long userId) {
        return gameServiceDAO.getUserGames(userId);
    }

    public User getUserById(Long userId) {
        return gameServiceDAO.getUserById(userId);
    }

    public User createUser(User user) {
        return gameServiceDAO.createUser(user.getUsername(), user.getEmail(), user.getPassword());
    }

    public int buyGame(BuyGameDto buyGameDto) {
        return gameServiceDAO.buyGame(buyGameDto.getGameId(), buyGameDto.getUserId());
    }
}
