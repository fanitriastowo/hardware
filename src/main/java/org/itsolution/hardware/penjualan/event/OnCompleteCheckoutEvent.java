package org.itsolution.hardware.penjualan.event;

import org.itsolution.hardware.penjualan.entity.UserEntity;
import org.springframework.context.ApplicationEvent;

public class OnCompleteCheckoutEvent extends ApplicationEvent {

   private static final long serialVersionUID = 1L;

   private final UserEntity userEntity;

   public OnCompleteCheckoutEvent(UserEntity user) {
      super(user);
      this.userEntity = user;
   }

   public UserEntity getUserEntity() {
      return userEntity;
   }

}
