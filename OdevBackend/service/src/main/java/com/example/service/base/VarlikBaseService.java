package com.example.service.base;


import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

@Aspect
public abstract class VarlikBaseService<T> implements BaseService<T> {

    @Autowired
    protected JpaRepository<T, Long> baseRepository;

    //  @Transactional(propagation = Propagation.REQUIRED, rollbackFor = ServiceException.class)
    @Override
    public T create(T entity) throws ServiceException {
        entity = baseRepository.save(entity);
        return entity;
    }

    //  @Transactional(propagation = Propagation.REQUIRED, rollbackFor = ServiceException.class)
    @Override
    public T update(T entity) throws ServiceException {
        entity = baseRepository.save(entity);
        return entity;
    }

    //  @Transactional(propagation = Propagation.REQUIRED, rollbackFor = ServiceException.class)
    @Override
    public T findOne(long id) throws ServiceException {
        Optional<T> o = baseRepository.findById(id);
        if (o.isPresent()) {
            return o.get();
        } else {
            return null;
        }
    }

    //  @Transactional(propagation = Propagation.REQUIRED, rollbackFor = ServiceException.class)
    @Override
    public void delete(long id) throws ServiceException {
        Optional<T> o = baseRepository.findById(id);
        if (o.isPresent()) {
            baseRepository.deleteById(id);
        } else {
            throw new ServiceException(id + " id değerinde veri bulunamadı");
        }
    }

    //  @Transactional(propagation = Propagation.REQUIRED, rollbackFor = ServiceException.class)
    @Override
    public List<T> getAll() throws ServiceException {
        List<T> source = baseRepository.findAll();
        return source;
    }


    @Override
    public boolean entityControl(T entity) throws ServiceException {
        return true;
    }

}

