package com.example.demo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.mapper.GrpMapper;
import com.example.demo.vo.DataVO;
import com.example.demo.vo.GrpVO;

@Repository
public class GrpDAO {
	
	@Autowired
	private GrpMapper gmapper;
	
	public List<GrpVO> getList() {
		return gmapper.getList();
	}

	public List<DataVO> getData() {
		return gmapper.getData();
	}
	public List<DataVO> location(DataVO data) {
		return gmapper.location(data);
	}

}
