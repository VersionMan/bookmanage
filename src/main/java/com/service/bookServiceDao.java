package com.service;

import com.entity.Page;
import com.entity.book;

import java.util.List;

public interface bookServiceDao {
    public Page<book> selectAllBool(Integer currPageNo, Integer pageSize,String author);
    public boolean add(book book);
    public book modify(int id);
    public boolean updateOne(book book);
    public boolean del(int id);
}
