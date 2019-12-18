package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Diary;

public class DiaryDao {
	
	//Singletone
	private static DiaryDao instance = new DiaryDao();
	private DiaryDao() {}
	public static DiaryDao getInstance() {
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
	
	public List<Diary> list(){
		return session.selectList("diaryNs.list");
	}
	
//	public int insert(Diary diary) {
//		return session.insert("diaryNs",diary);
//	}
}
