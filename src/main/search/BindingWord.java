package main.search;

import main.extending.form.Storage;

public class BindingWord {

	String memberEmail = "";
	Storage storage = new Storage(memberEmail);

	public BindingWord(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getSearchWord() {

		String memberId = memberEmail.split("@")[0];
		String nickNameOR = "";
		
		String searchWord = null;

		storage.execute(); // start the extending algorithm

		for (int i = 0; i < storage.nickNameList.size(); i++) {
			if (i == storage.nickNameList.size() - 1) {
				nickNameOR = nickNameOR + storage.nickNameList.get(i);
				break;
			}
			nickNameOR = nickNameOR + storage.nickNameList.get(i) + "+|+";
		}

		// for google_ search word
		searchWord = "\"" + memberId + "\"" /* + "+OR+" + nickNameOR */;
		/*
		 * if (!storage.realBirthday.equals("null")) { searchWord = searchWord +
		 * "+OR+" + storage.realBirthday; } if
		 * (!storage.realEmail.equals("null")) { searchWord = searchWord +
		 * "+OR+" + storage.realEmail; } if (!storage.realName.equals("null")) {
		 * searchWord = searchWord + "+OR+" + storage.realName; }
		 */

		return searchWord;
	}

}
