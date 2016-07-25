package org.itsolution.hardware.penjualan.event;

import java.util.Locale;

import org.itsolution.hardware.penjualan.entity.UserEntity;
import org.springframework.context.ApplicationEvent;

public class OnCompleteRegistrationEvent extends ApplicationEvent {

    private static final long serialVersionUID = 1L;

    private final String appUrl;
    private final Locale locale;
    private final UserEntity userEntity;

    public OnCompleteRegistrationEvent(String appUrl, Locale locale, UserEntity userEntity) {
        super(userEntity);
        this.appUrl = appUrl;
        this.locale = locale;
        this.userEntity = userEntity;
    }

    public String getAppUrl() {
        return appUrl;
    }

    public Locale getLocale() {
        return locale;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }

}
