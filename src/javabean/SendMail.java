package javabean;

import java.util.Date;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail
{
  public String topic = "标题";
  public String send = "邮箱";
  public String password = "密码";
  public String service = "smtp.qq.com";
  public String accept = "邮箱";
  public String content = "你好,邮件发送成功";

  public String MailTest(String topic,String send,String password,String service,String accept,String content)
  {
	  this.topic=topic;
	  this.send=send;
	  this.password=password;
	  this.service=service;
	  this.accept=accept;
	  this.content=content;
      return SendEmailTest();
  }
  public String MailTest(){
	  return SendEmailTest();
  }
  public String SendEmailTest()
  {
    Properties localProperties = new Properties();
    localProperties.put("mail.smtp.host", this.service);
    localProperties.put("mail.smtp.auth", "true");
    Session localSession = Session.getInstance(localProperties, null);
    try {
      Transport localTransport = localSession.getTransport("smtp");

      localTransport.connect(this.service, this.send, this.password);
      MimeMessage localMimeMessage = new MimeMessage(localSession);
      localMimeMessage.setHeader("Disposition-Notification-To", this.send);

      String str1 = this.topic;
      localMimeMessage.setSubject(str1);

      String str2 = this.send;
      str2 = new String(str2.getBytes(), "8859_1");
      localMimeMessage.setFrom(new InternetAddress(str2));
      Address[] arrayOfAddress1 = { new InternetAddress(this.send) };

      localMimeMessage.addFrom(arrayOfAddress1);

      Address[] arrayOfAddress2 = { new InternetAddress(this.accept) };
      localMimeMessage.setRecipients(Message.RecipientType.TO, arrayOfAddress2);

      localMimeMessage.setSentDate(new Date());

      String str3 = this.content;
      localMimeMessage.setText(str3);

      localMimeMessage.saveChanges();

      localTransport.sendMessage(localMimeMessage, localMimeMessage.getRecipients(Message.RecipientType.TO));

      localTransport.close();

      System.out.println("OK");
    } catch (Exception localException) {
    	localException.printStackTrace();
      return "发送失败";
    }
    return "发送成功";
  }
  public static void main(String args[]){
	  new SendMail().MailTest();
  }
}
