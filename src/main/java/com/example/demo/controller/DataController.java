package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.demo.dao.GrpDAO;
import com.example.demo.service.GrpSVC;
import com.example.demo.vo.DataVO;
import com.example.demo.vo.UserVO;

@SessionAttributes("uid")
@Controller
public class DataController {
	
	@Autowired
	private GrpSVC gsvc;
//	
	@Autowired
	private GrpDAO dao;
	
//	@PostMapping("/date")
//	@ResponseBody
//	public String date(Model model,DataVO vo) {
//	
//		    model.addAttribute("list",gsvc.getList());
//		    
//			return model.addAttribute("data",gsvc.getData(vo.getDate()));
//		
//	}
	
	@RequestMapping("/location")
	@ResponseBody
	public List<DataVO> location(Model model, DataVO data) {
		
		model.addAttribute("data",data);
		return dao.location(data);
	}
}
