package org.itsolution.hardware.penjualan.entity;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.itsolution.hardware.penjualan.entity.base.BasisEntity;

@Entity
@Table(name = "verification_token")
public class VerificationToken extends BasisEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    private static final int EXPIRATION = 60 * 24;

    private String token;

    private Date expiryDate;

    @OneToOne(targetEntity = UserEntity.class, fetch = FetchType.EAGER)
    @JoinColumn(nullable = false, name = "user_id", foreignKey = @ForeignKey(name = "FK_VERIFY_USER"))
    private UserEntity userEntity;

    public VerificationToken() {
    }

    public VerificationToken(String token, UserEntity userEntity) {
        this.token = token;
        this.expiryDate = calculateExpiredDate(EXPIRATION);
        this.userEntity = userEntity;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Date getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Date expiryDate) {
        this.expiryDate = expiryDate;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    // ================================================
    private Date calculateExpiredDate(int expiration) {
        final Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(new Date().getTime());
        cal.add(Calendar.MINUTE, expiration);
        return new Date(cal.getTime().getTime());
    }

}
