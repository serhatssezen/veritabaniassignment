package com.example.service.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public abstract class BaseController<T, S extends VarlikBaseService> {

    @Autowired
    protected S baseManager;

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public Object create(@RequestBody T entity) {
        return baseManager.create(entity);
    }

    @RequestMapping(value = "/getById/{id}", method = RequestMethod.GET)
    public Object getById(@PathVariable(value = "id") Long id) {
        return baseManager.findOne(id);
    }

    @RequestMapping(value = "/update/", method = RequestMethod.PUT)
    public Object update(@RequestBody T entity) {
        return baseManager.update(entity);
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
    public void delete(@PathVariable(value = "id") Long id) {
        baseManager.delete(id);
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public Object getAll() {
        return baseManager.getAll();
    }

}
