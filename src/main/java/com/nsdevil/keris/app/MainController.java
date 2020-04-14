package com.nsdevil.keris.app;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {
    @RequestMapping(value = {"", "/", "/exam"}, method = RequestMethod.GET)
    public String loginView(HttpServletRequest request) {
        return "login";
    }

    @RequestMapping(value = {"student_home"}, method = RequestMethod.GET)
    public String student_home(HttpServletRequest request) {
        return "student/student_home";
    }
    @RequestMapping(value = {"teacher_home"}, method = RequestMethod.GET)
    public String teacher_home(HttpServletRequest request) {
        return "teacher/teacher_home";
    }

    @RequestMapping(value = {"teacher/exam_check"}, method = RequestMethod.GET)
    public String teacher_exam_check(HttpServletRequest request) {
        return "teacher/exam_check";
    }

    @RequestMapping(value = {"teacher/students_total_score"}, method = RequestMethod.GET)
    public String teacher_students_total_score(HttpServletRequest request) {
        return "teacher/students_total_score";
    }
    @RequestMapping(value = {"teacher/exam_result_see"}, method = RequestMethod.GET)
    public String teacher_exam_result_see(HttpServletRequest request) {
        return "teacher/exam_result_see";
    }
    @RequestMapping(value = {"student/drawing_exam"}, method = RequestMethod.GET)
    public String student_drawing_exam(HttpServletRequest request) {
        return "student/drawing_exam";
    }
    @RequestMapping(value = {"student/exam_review"}, method = RequestMethod.GET)
    public String student_exam_review(HttpServletRequest request) {
        return "student/exam_review";
    }
    @RequestMapping(value = {"student/result_see"}, method = RequestMethod.GET)
    public String student_result_see(HttpServletRequest request) {
        return "student/result_see";
    }
    @RequestMapping(value = {"student/student_take_exam"}, method = RequestMethod.GET)
    public String student_student_take_exam(HttpServletRequest request) {
        return "student/student_take_exam";
    }
    @RequestMapping(value = {"teacher/student_total_score"}, method = RequestMethod.GET)
    public String teacher_student_total_score(HttpServletRequest request) {
        return "teacher/student_total_score";
    }

    @RequestMapping(value = {"test"}, method = RequestMethod.GET)
    public String test(HttpServletRequest request) {
        return "student/test";
    }

    @RequestMapping(value = {"student/secondexam"}, method = RequestMethod.GET)
    public String student_secondexam(HttpServletRequest request) {
        return "student/secondexam";
    }

}
