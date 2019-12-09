package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import Model.Emp;

public class EmpDao {
	
	//Singletone
	private static EmpDao instance = new EmpDao();
	private EmpDao() {}
	public static EmpDao getInstance() {
		return instance;
	}
	
	//정적필드로 session 생성 및 초기화 
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("/configuration.xml");
			
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			
			session = ssf.openSession(true);
			reader.close();
		} catch(Exception e) {
			System.out.println(e);
		}
		
	}
	
	public List<Emp> list(){
		return session.selectList("empns.list");
	}
}
