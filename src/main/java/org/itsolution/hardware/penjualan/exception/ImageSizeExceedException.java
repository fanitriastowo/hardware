package org.itsolution.hardware.penjualan.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@ControllerAdvice
public class ImageSizeExceedException {

   @ExceptionHandler(MaxUploadSizeExceededException.class)
   public String handleFileUpload(MaxUploadSizeExceededException e, RedirectAttributes redirectAttributes) {
      RedirectAttributes attribute = redirectAttributes.addFlashAttribute("imagesizeexceed",
              "Ooppsss...gambar yang anda upload lebih dari 1 MB");
      //return new ModelAndView("administrator/produk/administrator-tambah-produk", attribute.getFlashAttributes());
      return e.getMessage();
   }

}
