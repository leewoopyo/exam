package kopo.service;

import java.util.List;

import kopo.dto.ExamSIO;

public interface ExamService {
	
	void createDB();	//테이블 생성
	void dropDB();		//테이블 삭제
	
	void allsetDB();	//데이터 삽입
	
	//read
	ExamSIO selectOne(int studentid);		//해당 학번 하나 출력
	List<ExamSIO> selectAll(); 		//전체 출력
	List<ExamSIO> selectAllByName(String name);//이름 기반 출력
	
	//update
	int insert (ExamSIO examSIO);	//DB정보를 토대로 데이터 삽입
	int update (int studentid, ExamSIO examSIO);	//해당 매개변수 해당 데이터 업데이트
	int update (ExamSIO examSIO);	//전체 업데이트 
	
	//delete
	int delete(int studentid);	//학번 기반 데이터 삭제 
	int delete(ExamSIO examSIO);	//매개변수 기반 데이터 삭제
}
