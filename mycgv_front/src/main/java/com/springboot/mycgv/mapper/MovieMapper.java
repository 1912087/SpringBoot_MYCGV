package com.springboot.mycgv.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.mycgv.dto.MovieDto;
import com.springboot.mycgv.dto.PageDto;

@Mapper
public interface MovieMapper {
	List<MovieDto> getMovieList(PageDto pageDto);
	MovieDto getMovieContent(String mid);
	int getMovieWrite(MovieDto movieDto);
	int getMovieFileWrite(MovieDto movieDto);
	int getMovieUpdate(MovieDto movieDto);
	int getMovieFileUpdate(MovieDto movieDto);
	int getMovieDelete(String mid);
	List<MovieDto> getIndexList();
}
