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

package org.itsolution.hardware.penjualan.entity.base;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * <p> Class yang digunakan sebagai parent Class Entity. 
 * Class Entity adalah Class yang menjadi representasi table Basis dalam Database
 * </p>
 * @author Fani Triastowo
 */
@MappedSuperclass
public class BasisEntity {

	/**
	 * Primary key pada table dengan tipe Integer
	 */
  @Id
  @GeneratedValue
  private Integer id;

  /**
   * method untuk mengambil value dari property id
   * 
   * @return Integer id
   */
  public Integer getId() {
    return id;
  }

  /**
   * method untuk merubah value property id
   * 
   * @param id tipe integer dari id database
   */
  public void setId(Integer id) {
    this.id = id;
  }

}
