package com.feng.util;


import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

public class MailUtil implements Runnable {
    private String code;
    private String email;
    private JavaMailSender javaMailSender;

    public MailUtil(String code, String email, JavaMailSender javaMailSender) {
        this.code = code;
        this.email = email;
        this.javaMailSender = javaMailSender;
    }

    @Override
    public void run() {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
            helper.setFrom(Constant.MAIL_FROM);
            helper.setTo(email);
            helper.setSubject("激活邮件");
            helper.setText("<html>\n" +
                    "<body>\n" +
                    "<a href=" + Constant.DOMAIN_NAME + "activate?code=" + code + ">点击注册激活</a>\n" +
                    "</body>\n" +
                    "</html>", true);
            javaMailSender.send(mimeMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
