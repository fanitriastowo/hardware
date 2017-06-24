package org.itsolution.hardware.penjualan.event.listener;

import org.itsolution.hardware.penjualan.entity.UserEntity;
import org.itsolution.hardware.penjualan.event.OnCompleteCheckoutEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class OnCompleteCheckoutListener implements ApplicationListener<OnCompleteCheckoutEvent> {

   private final String MESSAGE = "Terima kasih telah belanja di IT Solution. Barang akan segera kami kirimkan "
           + "setelah Anda transfer. "
           + "Kami kabarkan tiap update barang kiriman.";

   @Autowired
   private JavaMailSender mailSender;

   @Override
   public void onApplicationEvent(OnCompleteCheckoutEvent event) {
      this.greeting(event);
   }

   private void greeting(OnCompleteCheckoutEvent event) {
      final UserEntity userEntity = event.getUserEntity();

      final SimpleMailMessage email = constructEmailMessage(userEntity);
      mailSender.send(email);
   }

   private final SimpleMailMessage constructEmailMessage(final UserEntity user) {

      final String recipientAddress = user.getUsername();
      final String subject = "Terima Kasih";
      final String message = MESSAGE;
      final SimpleMailMessage email = new SimpleMailMessage();

      email.setTo(recipientAddress);
      email.setSubject(subject);
      email.setText(message);
      email.setFrom("itsollution01@gmail.com");
      return email;
   }

}
