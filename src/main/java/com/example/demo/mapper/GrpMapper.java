package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.DataVO;
import com.example.demo.vo.GrpVO;

@Mapper
public interface GrpMapper {

	List<GrpVO> getList();

	List<DataVO> getData();

	List<DataVO> location(DataVO data);

}
