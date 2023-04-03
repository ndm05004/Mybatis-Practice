package kr.or.ddit.basic;

import java.io.IOException;
import java.io.Reader;
import java.util.Scanner;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class JdbcToMybatis {

/*
  LPROD테이블에 새로운 데이터 추가하기
  	
  lprod_gu와 lprod_nm은 직접 입력 받아서 처리하고,
  lprod_id와 현재의 lprod_id중에서 제일 큰 값보다 1 크게 한다.
  	
  입력받은 lprod_gu가 이미 등록되어 있으면 다시 입력 받아서 처리한다.

  JDBC예제 중 jdbcTest05.java를 myBatis용으로 변경하시오...
  mpper파일명은 'jdbc-mapper.xml'로 한다.
*/
	
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		String gu = null;
		Reader rd = null;
		SqlSessionFactory sqlSessionFactory = null;
		
		try {
			rd = Resources.getResourceAsReader("kr/or/ddit/mybatis/config/mybatis-comfig.xml");
			
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(rd);
		} catch (Exception e) {
			System.out.println("mybatis 초기화 실패");
			e.printStackTrace();
		}finally {
			if(rd!=null) try {rd.close();} catch(IOException e) {}
		}
		
		SqlSession session = null;
		session = sqlSessionFactory.openSession();
		
		
		
		
		
		
		
		
		while(true) {
			LprodVO lprodVO = new LprodVO();
			
			System.out.println("정보 추가하기");
			
			System.out.println("lprod_gu 입력 >>");
			gu = sc.next();
			
			int test = session.selectOne("lprod.selectLprod",gu);
			
			System.out.println(lprodVO);
			
			if(test == 0) {
				System.out.println("없는 id입니다.");
				break;
			}else {
				System.out.println("중복된 gu입니다.");
			}
		}
		
		
		
		
		
		
		System.out.println("lprod_nm 입력 >>");
		String nm = sc.next();
		
		LprodVO lprodVO2 = new LprodVO();
		
		lprodVO2.setLprod_gu(gu);
		lprodVO2.setLprod_nm(nm);
		System.out.println(lprodVO2);
		
		try {
			session = sqlSessionFactory.openSession();
			
			int insertCnt = session.insert("lprod.insertLprod", lprodVO2);
			
			if(insertCnt > 0) {
				System.out.println("insert 작업 성공");
			}else {
				System.out.println("insert 작업 실패");
			}
			
		}finally {
			session.commit();
			
			session.close();
		}
		

	}

}
