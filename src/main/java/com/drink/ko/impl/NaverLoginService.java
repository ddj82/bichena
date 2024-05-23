package com.drink.ko.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;


import com.drink.ko.vo.UsersVO;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class NaverLoginService {

	public String requestNaverLoginAcceccToken(Map<String, String> resValue, String grant_type, HttpSession session) {
		String accessToken = "";
		String apikey = (String) session.getAttribute("apikey");
		if (apikey == null || apikey == "") {
			try {
				URL url = new URL("https://nid.naver.com/oauth2.0/token");
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				// 반드시 기술!
				conn.setRequestMethod("POST");
				conn.setDoOutput(true);
				conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
				// 데이터를 출력하기 위한 스트림
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

				StringBuilder sb = new StringBuilder();

				// 필수 쿼리 파라미터 세팅
				sb.append("grant_type=").append(grant_type);
				sb.append("&client_id=zxmdaRxHzFpwT89DdNZe");
				sb.append("&client_secret=IUbKoCIc8W");
				sb.append("&code=").append(resValue.get("code"));
				sb.append("&state=").append(resValue.get("state"));

				bw.write(sb.toString());
				bw.flush();
				System.out.println("flush 성공");

				int responseCode = conn.getResponseCode();
				BufferedReader br;
				if (responseCode >= 200 && responseCode <= 300) {
					br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				} else {
					br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				}

				String line = "";
				StringBuilder responseSb = new StringBuilder();
				while ((line = br.readLine()) != null) {
					responseSb.append(line);
				}

				String result = responseSb.toString();
				System.out.println("result = " + result);
				if (result.contains("error")) {
					return null;
				}

				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(result);
				JsonObject jsonObject = element.getAsJsonObject();

				accessToken = jsonObject.get("access_token").getAsString();
				String refreshToken = jsonObject.get("refresh_token").getAsString();
				session.setAttribute("apikey", accessToken);

				br.close();
				bw.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return accessToken;
		} else {
			return apikey;
		}

	}

	public UsersVO apiExamMemberProfile(String token1) {

		UsersVO vo = new UsersVO();

		String token = token1; // 네이버 로그인 접근 토큰;
		String header = "Bearer " + token; // Bearer 다음에 공백 추가

		String apiURL = "https://openapi.naver.com/v1/nid/me";

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("Authorization", header);
		String[] responseBody = new String[2];
		responseBody[0] = get(apiURL, requestHeaders);

		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(responseBody[0]);
		System.out.println("naver정보 : " + element);
		JsonObject response = element.getAsJsonObject().get("response").getAsJsonObject();
		String NaverID = response.getAsJsonObject().get("id").getAsString();
		vo.setU_id(NaverID);
//	     양예진 수정  - 원래 있던 name 지우기
		String name = response.getAsJsonObject().get("name").getAsString();
		vo.setU_name(name);
//	     양예진 수정 끝
		String nickname = response.getAsJsonObject().get("nickname").getAsString();
		vo.setU_nick(nickname);
		String gender = response.getAsJsonObject().get("gender").getAsString();
		if (gender.equals("M")) {
			gender = "남자";
		} else if (gender.equals("F")) {
			gender = "여자";
		}
		vo.setU_gen(gender);
		String email = response.getAsJsonObject().get("email").getAsString();
		vo.setU_email(email);
		String mobile = response.getAsJsonObject().get("mobile").getAsString().replaceAll("-", "");
		vo.setU_tel(mobile);
		String birthday = (response.getAsJsonObject().get("birthyear").getAsString())
				+ (response.getAsJsonObject().get("birthday").getAsString());
		vo.setU_birth(birthday.replaceAll("-", ""));

		apiURL = "https://openapi.naver.com/v1/nid/payaddress";
		requestHeaders = new HashMap<>();
		requestHeaders.put("Authorization", header);
		responseBody[1] = get(apiURL, requestHeaders);
		element = parser.parse(responseBody[1]);
		JsonObject data = element.getAsJsonObject().get("data").getAsJsonObject();
		String addr1 = data.getAsJsonObject().get("baseAddress").getAsString();
		vo.setAddr1(addr1);
		String addr2 = data.getAsJsonObject().get("detailAddress").getAsString();
		vo.setAddr2(addr2);
		String addr3 = data.getAsJsonObject().get("zipCode").getAsString();
		vo.setAddr3(addr3);
		return vo;
	}

	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}

	public void naverLogout(String token) {

		try {
			URL url = new URL("https://nid.naver.com/oauth2.0/token?");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

			StringBuilder sb = new StringBuilder();

			sb.append("grant_type=delete");
			sb.append("&client_id=zxmdaRxHzFpwT89DdNZe");
			sb.append("&client_secret=IUbKoCIc8W");
			sb.append("&access_token=").append(token.replaceAll("'", ""));
			sb.append("&service_provider=NAVER");

			bw.write(sb.toString());
			bw.flush();

			int responseCode = conn.getResponseCode();

			BufferedReader br;
			if (responseCode >= 200 && responseCode <= 300) {
				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}

			String line = "";
			StringBuilder responseSb = new StringBuilder();
			while ((line = br.readLine()) != null) {
				responseSb.append(line);
			}
			String result = responseSb.toString();
			System.out.println("result : " + result);

			br.close();
			bw.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
