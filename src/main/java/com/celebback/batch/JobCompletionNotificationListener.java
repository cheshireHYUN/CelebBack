package com.celebback.batch;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.batch.core.BatchStatus;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.listener.JobExecutionListenerSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class JobCompletionNotificationListener extends JobExecutionListenerSupport{
	private static Logger logger = LoggerFactory.getLogger(JobCompletionNotificationListener.class);
	
	@Override
	public void afterJob(JobExecution jobExecution) {
		if(!BatchStatus.COMPLETED.equals(jobExecution.getStatus())) return;
		logger.info("작업 종료");
	}
}













