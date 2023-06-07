package com.example.service.controller;

import com.example.service.base.BaseController;
import com.example.service.impl.GameServiceImpl;
import com.example.service.model.*;
import com.example.service.model.dto.BuyGameDto;
import com.example.service.model.dto.CommentDto;
import com.example.service.model.dto.GameSearchDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/game")
public class GameController extends BaseController<Comment, GameServiceImpl> {

    @Autowired
    public GameServiceImpl gameServiceImpl;

    @RequestMapping(value = "/getSearchGame", method = RequestMethod.POST)
    public List<Game> getSearchGame(@RequestBody GameSearchDto gameSearchDto) {
        return gameServiceImpl.listAllGames(gameSearchDto);
    }

    @RequestMapping(value = "/{gameId}/comments", method = RequestMethod.GET)
    public List<Comment> getComments(@PathVariable Long gameId) {
        return gameServiceImpl.getComments(gameId);
    }

    @RequestMapping(value = "/{gameId}", method = RequestMethod.GET)
    public Game getGameById(@PathVariable Long gameId) {
        return gameServiceImpl.getGameById(gameId);
    }

    @RequestMapping(value = "/usergames/{userId}", method = RequestMethod.GET)
    public List<Game> getUserGames(@PathVariable Long userId) {
        return gameServiceImpl.getUserGames(userId);
    }

    @RequestMapping(value = "/wallet/{userId}", method = RequestMethod.GET)
    public Long getUserWallet(@PathVariable Long userId) {
        return gameServiceImpl.getUserWallet(userId);
    }

    @RequestMapping(value = "/save/comment", method = RequestMethod.POST)
    public Comment saveComment(@RequestBody CommentDto comment) {
        Comment commt = new Comment();
        commt.setUser(gameServiceImpl.getUserById(comment.getUserId()));
        commt.setGame(gameServiceImpl.getGameById(comment.getGameId()));
        commt.setComment(comment.getComment());
        return (Comment) gameServiceImpl.create(commt);
    }

    @RequestMapping(value = "/save/user", method = RequestMethod.POST)
    public User saveUser(@RequestBody User user) {
        return gameServiceImpl.createUser(user);
    }

    @RequestMapping(value = "/buy", method = RequestMethod.POST)
    public int buyGame(@RequestBody BuyGameDto buyGameDto) {
        return gameServiceImpl.buyGame(buyGameDto);
    }
}
