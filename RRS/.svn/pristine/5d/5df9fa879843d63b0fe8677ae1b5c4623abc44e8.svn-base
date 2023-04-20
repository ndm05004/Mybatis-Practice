package rrs.member.controller;

import java.util.Random;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

/**
 *  핸드폰 번호 인증 할때 쓰이는 sms api 
 * @author PC-09
 *
 */
public class MessageTemplate {
      
      final DefaultMessageService messageService;
      public String phoneNumber;
      
      public void setPhoneNumber(String phoneNumber) {
         this.phoneNumber = phoneNumber;
      }
      
      public MessageTemplate() {
         this.messageService = NurigoApp.INSTANCE.initialize("NCS3CDJQNKS6YNXZ", "AO8BIRTEPZLKY2CMRBZ8VCY0RDPT4ASM", "https://api.solapi.com");
      }
      
      public SingleMessageSentResponse sendOne(String content) {
          Message message = new Message();
          // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 한다.
          message.setFrom("01084819926");
          // --------------- 여기 바로 위에 번호는 건들지 말아주세요
          
          // 밑에 번호가 수신자 번호
          message.setTo("01053981821");
          
          // 컨텐트로 문자 내용 보내는 매소드
          message.setText(content);
          
          SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
//          System.out.println(response);
          System.out.println("메시지 전송완료");

          return response;
      }
     public static void main(String[] args) {
    	Random random = new Random();
    	
    	int i = random.nextInt(9);
    	int i1 = random.nextInt(9);
    	int i2 = random.nextInt(9);
    	int i3 = random.nextInt(9);
    	
    	String randomNum = i+""+i1+""+i2+""+i3;
		new MessageTemplate().sendOne("[Tabel Mate]\n"+"인증번호 : "+randomNum);
	}

   }