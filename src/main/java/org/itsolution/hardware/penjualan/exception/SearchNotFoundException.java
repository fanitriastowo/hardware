package org.itsolution.hardware.penjualan.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND, reason = "Employee Not Found") // 404
public class SearchNotFoundException extends Exception {

	private static final long serialVersionUID = 1L;

	public SearchNotFoundException() {
		super();
	}

	public SearchNotFoundException(String namaProduk) {
		super(namaProduk);
	}

}
