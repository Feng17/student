package com.feng.controller;

import com.feng.model.Student;
import com.feng.service.StudentService;
import com.feng.service.UpdateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
public class UpdateController {
    @Autowired
    UpdateService updateService;
    @Autowired
    StudentService studentService;


    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Model model, String name, String gender, Integer age, String number, String tel, MultipartFile file) throws IOException {
        if (file.getSize() > 3 * 1024 * 1024) {
            model.addAttribute("msg", "图片不能大于3M");
            return "error";
        }
        updateService.addStudent(name, gender, age, number, tel, file);
        return "redirect:/main";
    }

    @RequestMapping(value = "/updateStudentById", method = RequestMethod.POST)
    public String updateStudentById(Model model, Integer id) {
        model.addAttribute("id", id);
        return "redirect:/updateStudent/{id}";
    }

    @RequestMapping(value = "/updateStudent/{studentId}", method = RequestMethod.GET)
    public String updateStudent(Model model, @PathVariable("studentId") Integer studentId) {
        Map<String, Object> map = studentService.selectStudentById(studentId);
        if (map.containsKey("msg")) {
            model.addAttribute("msg", map.get("msg"));
            return "updatePage";
        }
        model.addAttribute("student", map.get("student"));
        return "updateStudent";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Model model, Integer id, String name, String gender, Integer age, String number, String tel, MultipartFile file) throws IOException {
        if (file.getSize() > 3 * 1024 * 1024) {
            model.addAttribute("msg", "图片不能大于3M");
            return "error";
        }
        updateService.updateStudent(id, name, gender, age, number, tel, file);
        return "redirect:/main";
    }

    @RequestMapping(value = "/deleteStudent", method = {RequestMethod.GET, RequestMethod.POST})
    public String deleteStudent(Model model, Integer id) {
        Map<String, Object> map = studentService.selectStudentById(id);
        if (map.containsKey("msg")) {
            model.addAttribute("msg", map.get("msg"));
            return "deletePage";
        }
        updateService.deleteStudent(id);
        return "redirect:/main";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(Model model, Student student) {   //接收Student对象作为参数，对象中的属性将会使用请求中同名的参数进行填充
        List<Student> searchList = updateService.findStudent(student);
        model.addAttribute("searchList", searchList);
        return "searchStudent";
    }
}
