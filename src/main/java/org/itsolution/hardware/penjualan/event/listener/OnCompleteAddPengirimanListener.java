package org.itsolution.hardware.penjualan.event.listener;

import org.itsolution.hardware.penjualan.entity.PengirimanEntity;
import org.itsolution.hardware.penjualan.event.OnCompleteAddPengirimanEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class OnCompleteAddPengirimanListener implements ApplicationListener<OnCompleteAddPengirimanEvent> {

   private final String MESSAGE = "Terima Kasih telah mentransfer. "
           + "Pengiriman barang pesanan Anda sedang dilakukan proses packaging, "
           + "barang akan sampai 3 sampai 4 hari mendatang.";

   @Autowired
   private JavaMailSender mailSender;

   @Override
   public void onApplicationEvent(OnCompleteAddPengirimanEvent event) {
      this.greeting(event);
   }

   private void greeting(OnCompleteAddPengirimanEvent event) {
      final PengirimanEntity entity = event.getPengirimanEntity();

      final SimpleMailMessage email = constructEmailMessage(entity);
      mailSender.send(email);
   }

   private final SimpleMailMessage constructEmailMessage(final PengirimanEntity entity) {

      final String recipientAddress = entity.getUserEntity().getUsername();
      final String subject = "Terima Kasih Telah Transfer";
      final String message = MESSAGE;
      final SimpleMailMessage email = new SimpleMailMessage();

      email.setTo(recipientAddress);
      email.setSubject(subject);
      email.setText(message);
      email.setFrom("fani.triastowo@gmail.com");
      return email;
   }

}
