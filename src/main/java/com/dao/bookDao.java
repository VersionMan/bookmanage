package com.dao;

import com.entity.book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface bookDao {
    public List<book> selectAllbook(@Param("firstResult")Integer firstResult, @Param("maxResults") Integer maxResults,@Param("author")String author);
    public int add(book book);
    public book modify(int id);
    public  int updateOne(book book);
    public  int del(int id );
    public int count(@Param("author")String author);
}
