package org.kong.paymentservice.controller;


import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.kong.paymentservice.config.VNPayConfig;
import org.kong.paymentservice.dto.request.PaymentTripRequest;
import org.kong.paymentservice.service.VNPayService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/payment")
@RequiredArgsConstructor
@CrossOrigin
public class VNPayController {
    private final VNPayService vnPayService;
    @GetMapping("/")
    public ResponseEntity<?> a(){

        return  ResponseEntity.ok(VNPayConfig.vnp_TmnCode + " " + VNPayConfig.vnp_HashSecret) ;
    }


    @PostMapping("/VNPay")
    public String submitOrder( @RequestBody PaymentTripRequest body){
        String portReact = "3000";
        String baseUrl = "http://localhost:3000";
//        String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
        return vnPayService.createOrder(baseUrl, body);
    }

    @GetMapping("/vnpay-payment")
    public ResponseEntity<String> getPaymentStatus(HttpServletRequest request){
        int paymentStatus = vnPayService.orderReturn(request);
        String orderInfo = request.getParameter("vnp_OrderInfo");
        String paymentTime = request.getParameter("vnp_PayDate");
        String transactionId = request.getParameter("vnp_TransactionNo");
        String totalPrice = request.getParameter("vnp_Amount");

        return ResponseEntity.ok(paymentTime) ;
    }
}
