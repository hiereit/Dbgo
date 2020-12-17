package model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.dto.Diary;

public interface DiaryMapper {
	public int insertDiary(Diary diary);

	public List<Diary> findAllDiaries(String u_id);

	public Diary findDiary(String d_id);

	public int deleteDiary(String d_id);

	public List<Diary> findDiariesByDate(@Param("u_id") String u_id, @Param("d_date") String d_date);
}