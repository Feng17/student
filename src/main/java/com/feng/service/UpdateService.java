package com.feng.service;

import com.feng.dao.StudentDao;
import com.feng.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.HtmlUtils;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class UpdateService {
    @Autowired
    StudentDao studentDao;

    private String saveImage(MultipartFile file) throws IOException {
        String fileName = file.getOriginalFilename();
        //获取扩展名
        String extName = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
        if (!isImageFile(extName)) {
            return null;
        }
        String path = "E:/image";
        File tempFile = new File(path);
        if (!tempFile.exists()) {
            tempFile.mkdirs();
        }
        //重命名图片
        String newFileName = UUID.randomUUID().toString().replaceAll("-", "").concat("." + extName);
        //将文件保存到另一目标文件
        file.transferTo(new File(path + File.separator + newFileName));
        return newFileName;
    }

    //判断文件类型是否为图片
    private boolean isImageFile(String extName) {
        String imageExt[] = new String[]{"jpg", "jpeg", "png", "gif"};
        for (String ext : imageExt) {
            if (ext.equals(extName)) {
                return true;
            }
        }
        return false;
    }

    public void addStudent(String name, String gender, Integer age, String number, String tel, MultipartFile file) throws IOException {
        String image = saveImage(file);
        Student student = new Student();
        student.setName(HtmlUtils.htmlEscape(name));
        student.setGender(HtmlUtils.htmlEscape(gender));
        student.setAge(age);
        student.setNumber(HtmlUtils.htmlEscape(number));
        student.setTel(HtmlUtils.htmlEscape(tel));
        student.setImage(image);
        studentDao.addStudent(student);
    }

    public void deleteStudent(Integer id) {
        studentDao.deleteStudent(id);
    }

    public void updateStudent(Integer id, String name, String gender, Integer age, String number, String tel, MultipartFile file) throws IOException {
        String image = saveImage(file);
        Student student = new Student();
        student.setId(id);
        student.setName(HtmlUtils.htmlEscape(name));
        student.setGender(HtmlUtils.htmlEscape(gender));
        student.setAge(age);
        student.setNumber(HtmlUtils.htmlEscape(number));
        student.setTel(HtmlUtils.htmlEscape(tel));
        student.setImage(image);
        studentDao.updateStudent(student);

    }

    public List<Student> findStudent(Student student) {
        return studentDao.findStudentByParameter(student);
    }
}
