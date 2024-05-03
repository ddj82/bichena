package com.drink.ko.impl;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class CertificationService {
	public static void certifiedPhoneNumber(String phoneNumber, String cerNum) {
		String api_key = "NCSSJLFZTZTJK0RN";
//	        String api_key = "NCSR6GIJNFP1D5PI";
		String api_secret = "7RQKYWEXLLSLY69NTYBSBSFBVOKDFYWW";
//	        String api_secret = "VLOM9V8YC5OHNRW6J8DON73QMYUNZTB4";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber); // 수신전화번호
		params.put("from", "01049026818"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "인증번호는" + "[" + cerNum + "]" + "입니다.");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

	}
}
