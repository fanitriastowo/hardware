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

package org.itsolution.hardware.penjualan.util;

import java.util.concurrent.ThreadLocalRandom;

/**
 * <p> Class yang digunakan untuk meng-generate angka acak
 * sebagai tambahan nama file pada upload gambar produk
 * </p>
 * @author Fani Triastowo
 */
public class IDGenerator {
	
	/**
	 * generate ID Pemesanan
	 * 
	 * @return random bilangan integer
	 */
	public static Integer generatePemesananID() {
		return ThreadLocalRandom.current().nextInt(100_000, 999_999 + 1);
	}

	/**
	 * generate random angka untuk tambahan pada nama file
	 * image produk yang diupload
	 * 
	 * @return random bilangan integer
	 */
	public static Integer generateImageName() {
		return ThreadLocalRandom.current().nextInt(100_000, 999_999 + 1);	
	}

}
