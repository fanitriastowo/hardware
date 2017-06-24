package org.itsolution.hardware.penjualan.event;

import org.itsolution.hardware.penjualan.entity.PengirimanEntity;
import org.springframework.context.ApplicationEvent;

public class OnCompleteAddPengirimanEvent extends ApplicationEvent {

   private static final long serialVersionUID = 1L;

   private final PengirimanEntity pengirimanEntity;

   public OnCompleteAddPengirimanEvent(PengirimanEntity entity) {
      super(entity);
      this.pengirimanEntity = entity;
   }

   public PengirimanEntity getPengirimanEntity() {
      return pengirimanEntity;
   }

}
