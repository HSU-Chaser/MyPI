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
			// Create Message
			msg.setFrom(new InternetAddress(from));
			msg.setSubject(subject);
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			msg.setContent(content, "text/html");

			msg.setHeader("content-type", "text/html;charset=utf-8");
			msg.setSentDate(new Date());

			// Message Transport
			SMTPTransport transport = (SMTPTransport) session
					.getTransport("smtp");
			transport.connect("mw-002.cafe24.com", "noreply@mypi.co.kr",
					"chaser/14");
			transport.sendMessage(msg, msg.getAllRecipients());
			transport.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
