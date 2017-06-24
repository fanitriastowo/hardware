/*
 * Copyright Fani Triastowo.
 * Event Standart Kompetensi Keahlian Nasional Indonesia (SKKNI) 
 * Programmer 18 - 20 Mei 2017 -> Hotel 
 * 
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse Public License v1.0 and Eclipse Distribution License v. 1.0
 * which accompanies this distribution.  The Eclipse Public License is available
 * at http://www.eclipse.org/legal/epl-v10.html and the Eclipse Distribution License
 * is available at http://www.eclipse.org/org/documents/edl-v10.php.
 */

package org.itsolution.hardware.penjualan.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * <p> Custom Class Exception untuk pencarian produk yang tidak ditemukan.
 * Class extends ke {@link Exception}
 * </p>
 * 
 * @author Fani Triastowo
 */
@ResponseStatus(value = HttpStatus.NOT_FOUND, reason = "Produk Tidak Ditemukan") // 404
public class SearchNotFoundException extends Exception {

	private static final long serialVersionUID = 1L;

	public SearchNotFoundException() {
		super();
	}

	public SearchNotFoundException(String namaProduk) {
		super(namaProduk);
	}

}
