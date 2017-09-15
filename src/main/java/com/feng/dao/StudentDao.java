package com.feng.dao;

import com.feng.model.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentDao {

    int selectStudentCount();

    List<Student> listStudentByPage(@Param("offset") int offset, @Param("limit") int limit);

    Student selectStudentById(Integer id);

    void addStudent(Student student);

    void updateStudent(Student student);

    void deleteStudent(Integer id);

    List<Student> findStudentByParameter(Student student);

}
