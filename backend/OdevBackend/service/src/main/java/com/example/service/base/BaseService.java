package com.example.service.base;

import java.util.List;

public interface BaseService<T> {

    T create(T entity) throws ServiceException;

    T update(T entity) throws ServiceException;

    T findOne(long id) throws ServiceException;

    void delete(long id) throws ServiceException;

    List<T> getAll() throws ServiceException;

    boolean entityControl(T entity) throws ServiceException;
}