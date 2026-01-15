package org.zerock.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.mapper.DateMapper;

import lombok.Setter;

@Service
public class DateServiceImpl implements DateService {
	
	@Setter(onMethod_ = @Autowired)
	private DateMapper dateMapper;

	@Override
	public Date getNow() {
		return dateMapper.getNow();
	}

}
