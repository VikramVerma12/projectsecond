package com.advik.model;

import java.io.Serializable;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class Login implements Serializable {

	private static final long serialVersionUID = 1L;
	@NotEmpty
	@Size(min=6, max=20)
	private String username;
	@NotEmpty
	@Size(min=8,max=20)
	private String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}

