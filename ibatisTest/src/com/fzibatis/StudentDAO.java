package com.fzibatis;

import java.util.List;

public interface StudentDAO {
	public void addStudent(Student student);
	public void addStudentBySequence(Student student);
	public void deleStudent(int id);
	public void updateStudent(Student student);
	public List<Student> queryForAllStudent();
	public List<Student> queryStudentByName(String name);
	public Student queryStudent(int id);
}
