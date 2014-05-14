package main.logon;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encryptor {
	public String encrypt(String password) {
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
}