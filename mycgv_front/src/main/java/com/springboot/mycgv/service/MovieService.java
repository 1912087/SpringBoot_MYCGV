package com.springboot.mycgv.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.mycgv.dto.MovieDto;
import com.springboot.mycgv.dto.PageDto;
import com.springboot.mycgv.mapper.MovieMapper;

@Service
public class MovieService {

	@Autowired
	private MovieMapper movieDao;
	
	public List<MovieDto> getMovieList(PageDto pageDto){
		return movieDao.getMovieList(pageDto);
	}
	
	public MovieDto getMovieContent(String mid) {
		return movieDao.getMovieContent(mid);
	}
	
	public int getMovieWrite(MovieDto movieDto) {
		return movieDao.getMovieWrite(movieDto);
	}
	
	public int getMovieFileWrite(MovieDto movieDto) {
		return movieDao.getMovieFileWrite(movieDto);
	}
	
	public int getMovieUpdate(MovieDto movieDto) {
		return movieDao.getMovieUpdate(movieDto);
	}
	
	public int getMovieFileUpdate(MovieDto movieDto) {
		return movieDao.getMovieFileUpdate(movieDto);
	}
	
	public int getMovieDelete(String mid) {
		return movieDao.getMovieDelete(mid);
	}
	
	//INDEX PAGE
	public List<MovieDto> getIndexList() {
		return movieDao.getIndexList();
	}
}
