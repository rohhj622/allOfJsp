package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Music;

public class MusicDao {
	
	//Singletone
	private static MusicDao instance = new MusicDao();
	private MusicDao() {}
	public static MusicDao getInstance() {
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
	
	public List<Music> list(){
		return session.selectList("musicNs.list");
	}
}
