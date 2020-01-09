package com.dao;

import com.entity.user;
import org.springframework.stereotype.Repository;

import java.util.Map;
public interface  userdao {
    public user userlogin(Map<String, Object> map);
}
