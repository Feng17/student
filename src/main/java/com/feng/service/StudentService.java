package com.feng.service;

import com.feng.dao.StudentDao;
import com.feng.model.PageBean;
import com.feng.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class StudentService {
    @Autowired
    StudentDao studentDao;


    public Map<String, Object> selectStudentById(Integer id) {
        Map<String, Object> map = new HashMap<String, Object>();
        Student student = studentDao.selectStudentById(id);
        if (student == null) {
            map.put("msg", "该学生不存在");
            return map;
        } else {
            map.put("student", student);
            return map;
        }
    }

    public PageBean<Student> listStudentByPage(int curPage) {
        int limit = 8;
        int offset = (curPage - 1) * limit;
        int allCount = studentDao.selectStudentCount();
        int allPage = 0;
        if (allCount <= limit) {
            allPage = 1;
        } else if (allCount % limit == 0) {
            allPage = allCount / limit;
        } else {
            allPage = allCount / limit + 1;
        }
        List<Student> studentList = studentDao.listStudentByPage(offset, limit);
        PageBean<Student> pageBean = new PageBean<Student>(allPage, curPage);
        pageBean.setList(studentList);
        return pageBean;
    }


}
