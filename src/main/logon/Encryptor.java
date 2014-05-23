package main.logon;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

public class Encryptor {
	public static String encryptSHA(String password) {
		MessageDigest md = null;
		String salt = "<^오^>";
		try {
			md = MessageDigest.getInstance("SHA-1");

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] bytes = (password + salt).getBytes();
		md.update(bytes);
		byte[] digest = md.digest();
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < digest.length; i++) {
			buffer.append(Integer.toHexString(0xFF & digest[i]));
		}
		return buffer.toString();
	}

	public static String encryptMD5() {
		MessageDigest md = null;
		Random random = new Random(System.currentTimeMillis());
		byte[] word = new byte[20];
		random.nextBytes(word);

		try {
			md = MessageDigest.getInstance("MD5");

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		md.update(word);
		byte[] digest = md.digest();
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < digest.length; i++) {
			buffer.append(Integer.toHexString(0xFF & digest[i]));
		}
		return buffer.toString();
	}
}