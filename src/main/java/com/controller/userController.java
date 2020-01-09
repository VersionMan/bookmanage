package com.controller;

import com.entity.user;
import com.service.userServiceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

@Controller
public class userController {
    @Autowired
    private userServiceDao  us;

    @RequestMapping(value="/login.do")
    public void  login(String name, String password, Model model,
                       HttpServletResponse response, HttpServletRequest request ,
                       HttpSession session) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

        user logionUser=us.logion(name, password);
        PrintWriter out = response.getWriter();
        out.println("<script type=\"text/javascript\">");
        if(logionUser!=null){
            session.setAttribute("logionUser", logionUser);
            out.print("location.href=\""+basePath+"selectall.do\"");

        }else{
          String info ="用户名或者密码错误";
          session.setAttribute("info",info);
            out.println("location.href=\""+ basePath + "index.jsp\";");
        }
        out.println("</script>");
        out.flush();
        out.close();
    }
}
