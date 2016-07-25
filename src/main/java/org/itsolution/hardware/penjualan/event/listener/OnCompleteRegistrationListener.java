package org.itsolution.hardware.penjualan.event.listener;

import java.util.UUID;

import org.itsolution.hardware.penjualan.entity.UserEntity;
import org.itsolution.hardware.penjualan.event.OnCompleteRegistrationEvent;
import org.itsolution.hardware.penjualan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class OnCompleteRegistrationListener implements ApplicationListener<OnCompleteRegistrationEvent> {

    private final String MESSAGE = "You registered successfully. We will send you a confirmation message to your email account.";

    @Autowired
    private UserService userService;

    @Autowired
    private JavaMailSender mailSender;

    @Override
    public void onApplicationEvent(OnCompleteRegistrationEvent event) {
        this.confirmRegistration(event);
    }

    private void confirmRegistration(OnCompleteRegistrationEvent event) {
        final UserEntity userEntity = event.getUserEntity();
        final String token = UUID.randomUUID().toString();

        userService.saveVerificationToken(userEntity, token);
        final SimpleMailMessage email = constructEmailMessage(event, userEntity, token);
        mailSender.send(email);
    }

    private final SimpleMailMessage constructEmailMessage(final OnCompleteRegistrationEvent event,
            final UserEntity user, final String token) {

        final String recipientAddress = user.getUsername();
        final String subject = "Registration Confirmation";
        final String confirmationUrl = event.getAppUrl() + "/registration_confirm?token=" + token;
        final String message = MESSAGE + event.getLocale();
        final SimpleMailMessage email = new SimpleMailMessage();

        email.setTo(recipientAddress);
        email.setSubject(subject);
        email.setText(message + " \r\n" + confirmationUrl);
        email.setFrom("itsolution@gmail.com");
        return email;
    }

}
