package kopo.service;

import java.util.ArrayList;
import java.util.List;

import kopo.dao.ExamRepo;
import kopo.domain.ExamRIO;
import kopo.dto.ExamSIO;

public class ExamServiceImpl implements ExamService {

	@Override
	public void createDB() {
		ExamRepo.createDB();	//ExamRepo클래스의 createDB메소드를 실행함(테이블 생성)
	}

	@Override
	public void dropDB() {
		ExamRepo.dropDB();		//ExamRepo클래스의 dropDB메소드를 실행함(테이블 삭제)
	}
	@Override
	public void allsetDB() {
		//ExamRepo클래스의 insert 메소드를 실행 한다.
		//매개변수는 ExamRIO형의 데이터로 DB에 들어갈 데이터들이다.
		ExamRepo.insert(new ExamRIO("학생1",209901,95,100,95));
		ExamRepo.insert(new ExamRIO("학생2",209902,90,90,100));
		ExamRepo.insert(new ExamRIO("학생3",209903,85,80,95));
		ExamRepo.insert(new ExamRIO("학생4",209904,75,100,85));
		ExamRepo.insert(new ExamRIO("학생5",209905,85,70,75));
		ExamRepo.insert(new ExamRIO("학생6",209906,95,80,95));
		ExamRepo.insert(new ExamRIO("학생7",209907,85,100,85));
		ExamRepo.insert(new ExamRIO("학생8",209908,75,90,65));
		ExamRepo.insert(new ExamRIO("학생9",209909,85,80,95));
	}
	@Override
	public ExamSIO selectOne(int studentid) {
		//학번을 매개변수로 나온 select 결과를 examRIO형으로 리턴해서 받고,
		ExamRIO exam = ExamRepo.getRecordById(studentid);
		//담은 데이터를 다시 ExamSIO에 담는다.
		return new ExamSIO(exam.getName(), exam.getStudentid(), exam.getKor(), exam.getEng(), exam.getMat());
	}
	@Override
	public List<ExamSIO> selectAll() {
		//ExamRepo클래스의 getAllrecords(전체 출력)메소드를 통해 list에 데이터가 전부 담긴다.
		List<ExamRIO> exams = ExamRepo.getAllrecords();
		//genelic이 ExamSIO인 list를 하나 선언한다 .
		List<ExamSIO> examScores = new ArrayList<ExamSIO>();
		//foreach문은 써서 list갯수 만큼 반복하면서 exams에 담겼던 모든 데이터들을 다시 ExamSIO객체를 생성해서 거기에 담아 examScores 리스트에 담는다.
		for(ExamRIO exam : exams) {
			examScores.add(new ExamSIO(exam.getName(),exam.getStudentid(),exam.getKor(),exam.getEng(),exam.getMat()));
		}
		//리스트를 리턴한다.
		return examScores;
	}
	@Override
	public int insert(ExamSIO examSIO) {
		//ExamSIO형의 데이터를 매개변수로 하여 데이터를 삽입한다.
		return ExamRepo.insert(new ExamRIO(examSIO.getName(),examSIO.getStudentid(),examSIO.getKor(),examSIO.getEng(),examSIO.getMat()));
	}
	@Override
	public List<ExamSIO> selectAllByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int update(int studentid, ExamSIO examSIO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(ExamSIO examSIO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int studentid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(ExamSIO examSIO) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
