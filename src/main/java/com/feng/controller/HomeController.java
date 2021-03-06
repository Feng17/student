package com.feng.controller;

import com.feng.model.PageBean;
import com.feng.model.Student;
import com.feng.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;


@Controller
public class HomeController {
    @Autowired
    StudentService studentService;

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String main(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        PageBean<Student> pageBean = studentService.listStudentByPage(page);
        model.addAttribute("pageBean", pageBean);
        return "main";
    }

    @RequestMapping(value = "/student/{studentId}", method = RequestMethod.GET)
    public String studentDetail(Model model, @PathVariable("studentId") Integer studentId) {
        Map<String, Object> map = studentService.selectStudentById(studentId);
        if (map.containsKey("msg")) {
            model.addAttribute("msg", map.get("msg"));
            return "error";
        }
        model.addAttribute("student", map.get("student"));
        return "studentDetail";
    }

    @RequestMapping(value = "/image", method = RequestMethod.GET)   //展示图片
    public void getImage(@RequestParam("name") String imageName, HttpServletResponse response) throws IOException {
        String path = "E:/image/";
        response.setContentType("image/jpeg");
        response.setCharacterEncoding("UTF-8");
        FileInputStream in = new FileInputStream(path + imageName);
        int i = in.available();
        byte[] data = new byte[i];
        in.read(data);
        in.close();

        OutputStream out = response.getOutputStream();
        out.write(data);
        out.flush();
        out.close();
    }

    @RequestMapping(value = "/addStudent", method = RequestMethod.GET)
    public String addStudent() {
        return "addStudent";
    }


    @RequestMapping(value = "/searchStudent", method = RequestMethod.GET)
    public String searchStudent() {
        return "searchStudent";
    }
}
