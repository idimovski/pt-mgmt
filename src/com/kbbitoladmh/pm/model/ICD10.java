package com.kbbitoladmh.pm.model;

public class ICD10 {
	
	
	String code;
	String subCode;
	String desc;
	
	
	
	
	
	
	public ICD10(String code, String subCode, String desc) {
		super();
		this.code = code;
		this.subCode = subCode;
		this.desc = desc;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getSubCode() {
		return subCode;
	}
	public void setSubCode(String subCode) {
		this.subCode = subCode;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	

}
