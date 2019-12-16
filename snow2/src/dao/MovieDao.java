package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Movie;

public class MovieDao {
	
	//Singletone
	private static MovieDao instance = new MovieDao();
	private MovieDao() {}
	public static MovieDao getInstance() {
		return instance;
	}
	
	//정적필드로 session 생성 및 초기화 
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("/configuration.xml");
			
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			System.out.println("1");
			session = ssf.openSession(true);
			System.out.println("2");
			reader.close();
			
		} catch(Exception e) {
			System.out.println(e);
		}
		
	}
	
	public List<Movie> list(){
		return session.selectList("movieNs.list");
	}
}
