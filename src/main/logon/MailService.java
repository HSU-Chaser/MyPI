package main.logon;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.smtp.SMTPTransport;

public class MailService {
	public void send(String from, String to, String subject, String content) {
		// JavaMail Session
		Properties props = System.getProperties();
		props.put("mail.smtp.host", "mypi.co.kr");
		props.put("mail.smtp.user", "admin");
		props.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(props, null);
		Message msg = new MimeMessage(session);
		try {
			// 보내는 이
			msg.setFrom(new InternetAddress(from));
			// 제목
			msg.setSubject(subject);
			// 받는 이
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			// 내용
			msg.setContent(content, "text/html");
			// 헤더
			msg.setHeader("content-type", "text/html;charset=utf-8");
			// 보낸 날짜
			msg.setSentDate(new Date());

			// Message Transport
			SMTPTransport transport = (SMTPTransport) session
					.getTransport("smtp");
			transport.connect("mw-002.cafe24.com", "admin@mypi.co.kr",
					"chaser/14");
			transport.sendMessage(msg, msg.getAllRecipients());
			transport.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
