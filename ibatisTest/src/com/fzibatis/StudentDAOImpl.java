package com.fzibatis;

import java.io.IOException;
import java.io.Reader;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

public class StudentDAOImpl implements StudentDAO {

	private static SqlMapClient sqlMapClient = null;
	
	static {
		try {
			Reader reader = com.ibatis.common.resources.Resources.getResourceAsReader("com/fzibatis/SqlMapConfig.xml");
			
			sqlMapClient = com.ibatis.sqlmap.client.SqlMapClientBuilder.buildSqlMapClient(reader);
			
			reader.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void addStudent(Student student) {
		try {
			sqlMapClient.insert("insertStudent", student);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void addStudentBySequence(Student student) {
		// TODO Auto-generated method stub

	}

	public void deleStudent(int id) {
		try {
			sqlMapClient.delete("deleStudent", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Student> queryForAllStudent() {
		List<Student> studentList = null;
		try {
			studentList = sqlMapClient.queryForList("selectAllStudent");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return studentList;
	}

	public Student queryStudent(int id) {
		Student student = null;
		try {
			student = (Student) sqlMapClient.queryForObject("selectStudent", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return student;
	}

	public List<Student> queryStudentByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateStudent(Student student) {
		// TODO Auto-generated method stub

	}

	public static void main(String[] args){
		
		StudentDAOImpl studentDAOImpl = new StudentDAOImpl();
		
		//删除指定id
//		studentDAOImpl.deleStudent(4);
		//增加一条数据
//		Student st = new Student();
//		st.setId(5);
//		st.setSname("xiaoC");
//		st.setAge(1);
//		st.setBirth(Date.valueOf("2010-11-17"));
//		studentDAOImpl.addStudent(st);
		//查询表中所有数据
//		List<Student> studentList = studentDAOImpl.queryForAllStudent();
//		for(int i=0; i<studentList.size(); i++){
//			Student s = studentList.get(i);
//			System.out.println("姓名："+s.getSname()+" 年龄："+s.getAge()+" 生日："+s.getBirth());
//		}
		//查询指定id的数据
//		System.out.println(studentDAOImpl.queryStudent(1).getSname());
		//更新指定id的数据
		
	}
}
