package model.dao;

import java.util.List;

import model.dto.Diary;

public interface DiaryMapper {
	public int insertDiary(Diary diary);

	public List<Diary> findAllDiaries(String u_id);

	public Diary findDiary(String d_id);

	public int deleteDiary(String d_id);
}