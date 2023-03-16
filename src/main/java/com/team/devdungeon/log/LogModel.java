package com.team.devdungeon.log;

import javax.persistence.*;

import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Table(name = "logs")
public class LogModel {

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    private String method;

	    private String path;
	    
	    private String ip;
	    
	    private String params;

	    private Integer statusCode;

	    @Column(columnDefinition = "TIMESTAMP")
	    private LocalDateTime createdAt;

	    public LogModel() {
	        this.createdAt = LocalDateTime.now();
	    }

	    public Long getId() {
	        return id;
	    }

	    public void setId(Long id) {
	        this.id = id;
	    }

	    public String getMethod() {
	        return method;
	    }

	    public void setMethod(String method) {
	        this.method = method;
	    }

	    public String getPath() {
	        return path;
	    }

	    public void setPath(String path) {
	        this.path = path;
	    }
	    //
	    public String getIp() {
	        return ip;
	    }

	    public void setIp(String ip) {
	        this.ip = ip;
	    }
	    //
	    public String getParams() {
	        return params;
	    }

	    public void setParams(String params) {
	        this. params =  params;
	    }
	    
	    //
	    

	    public Integer getStatusCode() {
	        return statusCode;
	    }

	    public void setStatusCode(Integer statusCode) {
	        this.statusCode = statusCode;
	    }

	    public LocalDateTime getCreatedAt() {
	        return createdAt;
	    }

	    public void setCreatedAt(LocalDateTime createdAt) {
	        this.createdAt = createdAt;
	    }
}

