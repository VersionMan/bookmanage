package com.service;

import com.dao.userdao;
import com.entity.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class userService implements  userServiceDao {
    @Autowired
   private  userdao us;


    @Override
    public user logion(String name, String password) {
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("name", name);
        map.put("password", password);
        System.out.println(map.get("name"));
            return this.us.userlogin(map);
    }
}
