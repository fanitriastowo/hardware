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

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

/**
 * <p> Class yang digunakan untuk menentukan redirect halaman setelah user login.
 * jika user login memiliki role Admin, maka user akan di redirect ke administrator
 * jika user login memiliki role Member, maka user akan di redirect ke user
 * 
 * </p>
 * @author Fani Triastowo
 */
public class MySuccessLoginHandler implements AuthenticationSuccessHandler {

	/**
	 * meng-override method dari interface {@link AuthenticationSuccessHandler}
	 * sehingga user yang sudah sukses login bisa di custom akan di redirect kemana 
	 * 
	 * @param request {@link HttpServletRequest} dari user
	 * @param response {@link HttpServletResponse} dari user
	 * @param authentication {@link Authentication} dari user
	 */
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
										Authentication authentication) throws IOException, ServletException {
		
		// mengambil semua Role model yang terdapat pada spring security
		Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
		
				// lakukan pengecekan apabila roles terdapat ROLE_ADMIN
        if (roles.contains("ROLE_ADMIN")){
        	
        		// redirect ke administrator
            response.sendRedirect(request.getContextPath() + "/administrator/pemesanan");   
            return;
        }
        
        // redirect ke member
        response.sendRedirect(request.getContextPath() + "/");
	}

}
