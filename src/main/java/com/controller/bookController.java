package com.controller;

import com.entity.Page;
import com.entity.book;
import com.service.bookServiceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class bookController {
    @Autowired
    private bookServiceDao bsd;
    @RequestMapping(value = "/selectall.do",method = RequestMethod.POST)
    public  String selectAll(
            @RequestParam(value="currPageNo",required = false)Integer currPageNo,
            @RequestParam(value="pageSize",required = false)Integer pageSize,
            HttpSession session, Model model ,
            HttpServletRequest request, HttpServletResponse response
    ) throws UnsupportedEncodingException {
        String author=(String)session.getAttribute("author");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        Integer cur=currPageNo==null?1:currPageNo;
        Integer ps=pageSize==null?2:pageSize;
        Page<book> pager=bsd.selectAllBool(cur,ps,author);


        if(pager!=null){

            model.addAttribute("pager", pager);
        }

      return  "select.jsp";
    }

    @RequestMapping(

            value = "/selectall.do",method = RequestMethod.GET)
    public String showInfo(
            Model model,
            @RequestParam(value = "author",required = false)String author,
            HttpSession session
    ){
        Page<book> pager=bsd.selectAllBool(1,2,author);
        session.setAttribute("author",author);
        model.addAttribute("pager",pager);
        return "select.jsp";
    }


    @RequestMapping(value="/addBook.do")
    public void addUser ( HttpSession session,Model model,book book,HttpServletResponse response,HttpServletRequest request) throws IOException, IOException {
        // 处理中文乱码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
        System.out.println(book.getName());
        boolean isOK=bsd.add(book);
        out.println("<script type=\"text/javascript\">");
        if(true==isOK){
            out.print("location.href=\""+basePath+"selectall.do\"");
        }else{
            out.println("alert(\"添加失败\");");
            out.println("location.href=\""+ basePath + "insert.jsp\";");
        }
        out.println("</script>");
        out.flush();
        out.close();
    }
    @RequestMapping(value="/modifly.do")
    public String modifly(HttpSession session,Model model,int id,HttpServletResponse response,HttpServletRequest request){
     book oneBook=bsd.modify(id);
     request.setAttribute("oneBook",oneBook);
     return "modify.jsp";
    }
    @RequestMapping(value="/update.do")
    public String update(HttpSession session,Model model,book book,HttpServletResponse response,HttpServletRequest request){
        boolean isOk=bsd.updateOne(book);
       if(true==isOk){
           return "selectall.do";
       }
          return "modify.jsp";
    }

    @RequestMapping(value="/del.do")
    public String del(HttpSession session,Model model,int id,HttpServletResponse response,HttpServletRequest request){
        boolean isOk=bsd.del(id);
        if(true==isOk){
            return "selectall.do";
        }
        return "selectall.do";
    }

}
