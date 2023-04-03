package kr.or.ddit.basic;

import java.io.IOException;
import java.io.Reader;
import java.util.Scanner;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.or.ddit.util.MybatisSqlSessionFactory;

public class JdbcToMybatisSolution {

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
		Reader rd = null;
		SqlSessionFactory sqlSessionFactory = null;
//		
//		try {
//			rd = Resources.getResourceAsReader("kr/or/ddit/mybatis/config/mybatis-comfig.xml");
//			
//			sqlSessionFactory = new SqlSessionFactoryBuilder().build(rd);
//		} catch (Exception e) {
//			System.out.println("mybatis 초기화 실패");
//			e.printStackTrace();
//		}finally {
//			if(rd!=null) try {rd.close();} catch(IOException e) {}
//		}
//		//-------------------------------------------------------------------
		SqlSession session = null;
		
		try {
//			session = sqlSessionFactory.openSession();
			session = MybatisSqlSessionFactory.getSqlSession();
			
			// 제일 큰 값보다 1 큰값 구하기
			int nextId = session.selectOne("jdbc.getNextId");
			
			// LPROD_GU값을 입력 받아 중복되면 다시 입력 받기
			String gu; 
			int count = 0;
			
			do {
				System.out.println("상품 분류 코드(LPROD_GU)입력");
				gu = sc.next();
				
				count = session.selectOne("jdbc.getLprodCount", gu);
				
				if(count> 0) {
					System.out.println("입력한 상품 분류 코드 "+ gu +"은(는) 이미 등록된 코드 입니다.");
					System.out.println("다른 상품 분류 코드를 다시 입력하세요...");
					System.out.println();
				}else {
				}
				
			} while (count>0);
			
			System.out.println("상품 분류명(lprod_nm) 입력 >>");
			String nm = sc.next();
			
			LprodVO lprodVO = new LprodVO();
			
			lprodVO.setLprod_id(nextId);
			lprodVO.setLprod_gu(gu);
			lprodVO.setLprod_nm(nm);
			
			int insertCnt = session.insert("jdbc.insertLprod", lprodVO);
			
			if(insertCnt > 0) {
				System.out.println("insert 작업 성공");
			}else {
				System.out.println("insert 작업 실패");
			}
			
		} finally {
			session.commit();
			
			session.close();		
		}
	}

}
