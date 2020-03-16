package kopo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kopo.domain.ExamRIO;

public class ExamRepo {
	
	//PreparedStatement pstmt = null;
	//ResultSet rset = null;
	
	/**
	 * DB연결하는 메소드(따로 연결하는 메소드를 만들어서 연결시마다 해당 메소드를 불러오게 한다. 
	 * return : 커넥션 객체
	 */
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");			
		}catch(Exception e) {
			e.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection("jdbc:mysql://192.168.56.1/kopo", "kopo15", "Qwer1234!!");	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
	/**
	 * DB연결 끊는 메소드
	 */
	/*
	 * public void connectionClose() { try { if(rset != null) {rset.close();}
	 * if(stmt != null) {stmt.close();} if(conn != null) {conn.close();}
	 * }catch(Exception e) { e.printStackTrace(); } }
	 */
	
	
	/**
	 * DB데이블을 생성하는 메소드
	 * @return int형인 status를 반환한다.
	 */
	public static int createDB() {
		String sql = null;
		int status = 0;
		try {
			//sql구문을 담고
			sql = "create table examtable(" +
					"name varchar(20)," +
					"studentid int not null primary key," +
					"kor int," + "eng int," +
					"mat int)" +
					"DEFAULT CHARSET=utf8;";
			//커넥션 객체 생성
			Connection conn = getConnection();
			//statement객체를 만들고
			Statement stmt = conn.createStatement();
			//위 sql문을 statement에 담는다.
			stmt.executeUpdate(sql);
			
			//작업이 완료되면 열었던 객체를 닫는다.
			stmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	/**
	 * DB데이블을 삭제하는 메소드
	 * @return int형인 status를 반환한다.
	 */
	public static int dropDB() {
		String sql = null;
		int status = 0;
		try {
			//sql구문을 담고
			sql = "drop table examtable";
			//커넥션 객체 생성
			Connection conn = getConnection();
			//statement객체를 만들고
			Statement stmt = conn.createStatement();
			//statement에 sql문은 담는다.
			stmt.executeUpdate(sql);
			
			//작업이 완료되면 열었던 객체를 닫는다.
			stmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	/**
	 * 데이터를 insert하는 메소드
	 * @param u : ExanRIO형의 데이터(DB에 삽입된 데이터) 
	 * @return int형인 status를 반환한다.
	 */
	public static int insert(ExamRIO u) {
		String sql = null;
		int status = 0;
		try {
			//sql구문을 담고
			sql = "insert into examtable(name,studentid,kor,eng,mat) values (?,?,?,?,?);";
			//커넥션 객체 생성
			Connection conn = getConnection();
			//해당 sql문을 statement에 담고
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			//sql문에 적용할 값들을 받은 매개변수로 변경한다.
			//ExamRIO 형의 데이터를 가져오기 때문에 개별 데이터를 가져오기 위해서는 get...로 개별 데이터를 가져온다.
			pstmt.setString(1,u.getName());			
			pstmt.setInt(2,u.getStudentid());			
			pstmt.setInt(3,u.getKor());			
			pstmt.setInt(4,u.getEng());			
			pstmt.setInt(5,u.getMat());			
			
			//statement를 실행한다. 그 값을 status에 넣는다.
			status = pstmt.executeUpdate();
			//작업이 완료되면 열었던 객체를 닫는다.
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	/**
	 * 데이터를 update 하는 메소드
	 * @param u : ExanRIO형의 데이터(DB에 삽입된 데이터) 
	 * @return int형인 status를 반환한다.
	 */
	public static int update(ExamRIO u) {
		String sql = null;
		int status = 0;
		try {
			//sql구문을 담고
			sql = "update examtable set name = ?,studentid = ?, kor = ?, eng = ?, mat = ? where studentid = ?;";
			//커넥션 객체 생성
			Connection conn = getConnection();
			//해당 sql문을 statement에 담고
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			//sql문에 적용할 값들을 받은 매개변수로 변경한다.
			//ExamRIO 형의 데이터를 가져오기 때문에 개별 데이터를 가져오기 위해서는 get...로 개별 데이터를 가져온다.
			pstmt.setString(1,u.getName());			
			pstmt.setInt(2,u.getStudentid());			
			pstmt.setInt(3,u.getKor());			
			pstmt.setInt(4,u.getEng());			
			pstmt.setInt(5,u.getMat());			
			pstmt.setInt(6,u.getStudentid());
			
			//statement를 실행한다. 그 값을 status에 넣는다.
			status = pstmt.executeUpdate();
			//작업이 완료되면 열었던 객체를 닫는다.
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	/**
	 * 데이터를 delete 하는 메소드
	 * @param u : ExanRIO형의 데이터(DB에 삽입된 데이터) 
	 * @return int형인 status를 반환한다.
	 */
	public static int delete(ExamRIO u) {
		String sql = null;
		int status = 0;
		try {
			//sql구문을 담고
			sql = "dalete from examtable where studentid = ?;";
			//커넥션 객체 생성
			Connection conn = getConnection();
			//해당 sql문을 statement에 담고
			PreparedStatement pstmt = conn.prepareStatement(sql);
		
			//sql문에 적용할 값들을 받은 매개변수로 변경한다.
			//ExamRIO 형의 데이터를 가져오기 때문에 개별 데이터를 가져오기 위해서는 get...로 개별 데이터를 가져온다.
			pstmt.setInt(1,u.getStudentid());			
			//statement를 실행한다.
			status = pstmt.executeUpdate();
			//작업이 완료되면 열었던 객체를 닫는다.
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	/**
	 * 전체 데이터를 출력하는 메소드 
	 * @return 전체 데이터가 담김 메소드를 리턴한다.
	 */
	public static List<ExamRIO> getAllrecords() {
		List<ExamRIO> list = new ArrayList<ExamRIO>();
		String sql = null;
		try {
			//sql구문을 담고
			sql = "select * from examtable;";
			//커넥션 객체 생성
			Connection conn = getConnection();
			//해당 sql문을 statement에 담고
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//resultset(여러개의 레코드를 담을 수 있음) 객체 선언해서 statement 결과를 담는다 
			ResultSet rset = pstmt.executeQuery();
			
			//반목문으로 하나씩 출력
			while(rset.next()) {
				ExamRIO u  = new ExamRIO(); //ExamRIO 객체 생성
				u.setName(rset.getString("name"));   //해당 name값을  ExamRIO에 넣는다.
				u.setStudentid(rset.getInt("studentid"));   //해당 studentid값을  ExamRIO에 넣는다.
				u.setKor(rset.getInt("kor"));//해당 kor값을  ExamRIO에 넣는다.
				u.setEng(rset.getInt("eng"));//해당 eng값을  ExamRIO에 넣는다.
				u.setMat(rset.getInt("mat"));//해당 mat값을  ExamRIO에 넣는다.
				list.add(u);		//list에 추가 한다.
			}
			
			//작업이 완료되면 열었던 객체를 닫는다.
			rset.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	/**
	 * 해당 학번을 가진 학생만 출력한다.
	 * @param id : 학번(studentid)
	 * @return ExamRIO 형의 데이터
	 */
	public static ExamRIO getRecordById(int studentid) {
		ExamRIO u = new ExamRIO();
		String sql = null;
		try {
			//sql구문을 담고
			sql = "select * from examtable where studentid = ?;";
			//커넥션 객체 생성
			Connection conn = getConnection();
			//해당 sql문을 statement에 담고
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//해당 sql문에 적용할 데이터를 세팅한다.
			pstmt.setInt(1, studentid);
			//resultset(여러개의 레코드를 담을 수 있음) 객체 선언해서 statement 결과를 담는다 
			ResultSet rset = pstmt.executeQuery();
			//반목문으로 하나씩 출력
			while(rset.next()) {
				u.setName(rset.getString("name"));
				u.setStudentid(rset.getInt("studentid"));
				u.setKor(rset.getInt("kor"));
				u.setEng(rset.getInt("eng"));
				u.setMat(rset.getInt("mat"));
			}
			//작업이 완료되면 열었던 객체를 닫는다.
			rset.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			System.out.println(e);
		}
		return u;
	}
	
}
