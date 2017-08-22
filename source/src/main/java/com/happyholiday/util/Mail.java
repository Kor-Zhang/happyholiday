package com.happyholiday.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class Mail {
	private static MimeMessage mime = null;
	private static Session session = null;
	private static Properties props = null;
	// 主机
	private static String mailHost = null;

	private static String mailSmtpAuth = null;
	// 发件人账户
	private static String username = null;
	// 发件人密码
	private static String password = null;
	// 发件人
	private static String from = null;
	// 收件人
	private static String to = null;
	// 设置抄送
	private static String cc = null;
	// 设置暗送
	private static String bcc = null;
	private static String fileName = "mail.properties";
	static {
		try {
			props = PubTools.loadProperties(fileName);
			mailHost = props.getProperty("mail.host");
			mailSmtpAuth = props.getProperty("mail.smtp.auth");
			username = props.getProperty("username");
			password = props.getProperty("password");
			from = props.getProperty("from");
			to = props.getProperty("to");
			cc = props.getProperty("cc");
			bcc = props.getProperty("bcc");

			props.setProperty("mail.host", mailHost);
			props.setProperty("mail.smtp.auth", mailSmtpAuth);
			Authenticator auth = new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {

					return new PasswordAuthentication(username, password);
				}
			};
			session = Session.getInstance(props, auth);
			System.out.println("链接邮箱" + from + "成功！");
			mime = new MimeMessage(session);
			mime.setFrom(new InternetAddress(from));
			if (to != null && !to.toString().trim().isEmpty()) {
				mime.setRecipients(RecipientType.TO, to);// 设置收件人
			}
			if (cc != null && !cc.toString().trim().isEmpty()) {
				mime.setRecipients(RecipientType.CC, cc);// 设置抄送
			}
			if (bcc != null && !bcc.toString().trim().isEmpty()) {
				mime.setRecipients(RecipientType.BCC, bcc);// 设置暗送
			}

		} catch (Exception e) {
			System.out.println("Mail#loadProperties方法错误");
			e.printStackTrace();
		}

	}

	public static void setContent(String content) {
		if (content != null && !content.toString().trim().isEmpty()) {
			try {
				mime.setContent(content, "text/html;charset=utf-8");
			} catch (MessagingException e) {
				e.printStackTrace();
			} // 设置内容
		}

	}

	public static void setSubject(String subject) {
		if (subject != null && !subject.toString().trim().isEmpty()) {
			try {
				mime.setSubject(subject);
			} catch (MessagingException e) {
				e.printStackTrace();
			} // 设置标题
		}
	}

	public static void setTo(String to) {
		if (to != null && !to.toString().trim().isEmpty()) {
			try {
				Mail.to = to;
				mime.setRecipients(RecipientType.TO, to);// 设置收件人
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
	}

	public static String getTo() {
		return to;
	}

	/**
	 * 开启线程发送，并且设置内容和标题
	 * 
	 * @param Subject
	 * @param Content
	 * @throws MessagingException
	 */
	public static void sendMessage(String subject, String content) throws MessagingException {

		setContent(content);
		setSubject(subject);
		new Thread(new Runnable() {
			
			@Override
			public void run() {
				try {
					Transport.send(mime);
					System.out.println("信息已发送到邮箱" + to + "！");
				} catch (MessagingException e) {
					System.out.println("信息发送到邮箱" + to + "失败！");
					e.printStackTrace();
				}
			}
		});
		

	}

	/**
	 * 开启线程发送，并且制定收件人，内容和标题
	 * 
	 * @param Subject
	 * @param Content
	 * @throws MessagingException 
	 */
	public void sendMessage(String to, String subject, String content) throws MessagingException {
		setTo(to);
		sendMessage(subject, content);

	}

	public static Properties getProps() {
		return props;
	}

	public static void setProps(Properties props) {
		Mail.props = props;
	}
	public static void main(String[] args) {
		try {
			Mail.setTo("jhon1138829222@QQ.COM");
			Mail.sendMessage("A", "A");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
