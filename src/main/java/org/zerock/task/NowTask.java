package org.zerock.task;

import java.time.LocalDateTime;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class NowTask {
	
	@Scheduled(cron = "0/10 * * * * *")
	public void showNow() {
		System.out.println("***************************@Scheduled:"+ LocalDateTime.now());
	}

}
