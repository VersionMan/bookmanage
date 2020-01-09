package com.service;

import com.dao.bookDao;
import com.entity.Page;
import com.entity.book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class bookService implements bookServiceDao {
    @Autowired
    private bookDao bd;
    @Override
    public Page<book> selectAllBool(Integer currPageNo, Integer pageSize,String author) {

        //处理值
        Integer firstResult=(currPageNo-1)*pageSize;
        Integer maxResults=pageSize;
        Page<book> pager=new Page<book>();
        //给page的属性赋值
        pager.setCurrPageNo(currPageNo);
        pager.setPageSize(maxResults);
        pager.setTotalCount(this.bd.count(author));
        pager.setList(bd.selectAllbook(firstResult,maxResults,author));
        return pager;
    }

    @Override
    public boolean add(book book) {
        int count =this.bd.add(book);
        if(count==1){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public book modify(int id) {
        return this.bd.modify(id);
    }

    @Override
    public boolean updateOne(book book) {
        int count =this.bd.updateOne(book);
        if(count==1){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public boolean del(int id) {
        int count =this.bd.del(id);
        if(count==1){
            return true;
        }else{
            return false;
        }
    }
}
