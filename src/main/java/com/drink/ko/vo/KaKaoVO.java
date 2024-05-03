package com.drink.ko.vo;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;



public class KaKaoVO {

//    @Value("${kakao.api_key}")
    private String kakaoApiKey = "f8801431aadfbf2a0016165e1408e997";
    
//    @Value("${kakao.redirect_uri}")
    private String kakaoRedirectUri = "http://localhost:8090/ko/kakao.ko";

    public String getAccessToken(String code) {
        String accessToken = "";
        String refreshToken = "";
        String reqUrl = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //필수 헤더 세팅
            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
            conn.setDoOutput(true); //OutputStream으로 POST 데이터를 넘겨주겠다는 옵션.

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();

            //필수 쿼리 파라미터 세팅
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=").append(kakaoApiKey);
            sb.append("&redirect_uri=").append(kakaoRedirectUri);
            sb.append("&code=").append(code);

            bw.write(sb.toString());
            bw.flush();

            int responseCode = conn.getResponseCode();
            System.out.println("[KakaoApi.getAccessToken] responseCode = " + responseCode);

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
            System.out.println("responseBody = " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            JsonObject jsonObject = element.getAsJsonObject();
            accessToken = jsonObject.get("access_token").getAsString();
            refreshToken = jsonObject.get("refresh_token").getAsString();

            br.close();
            bw.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return accessToken;
    }

    
    
    public HashMap<String, Object> getUserInfo(String accessToken) {
        HashMap<String, Object> userInfo = new HashMap<>();
        String reqUrl = "https://kapi.kakao.com/v2/user/me";
        try{
            URL url = new URL(reqUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

            int responseCode = conn.getResponseCode();

            BufferedReader br;
            if (responseCode >= 200 && responseCode <= 300) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            String line = "";
            StringBuilder responseSb = new StringBuilder();
            while((line = br.readLine()) != null){
                responseSb.append(line);
            }
            String result = responseSb.toString();

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            System.out.println("element : "+element);
            JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            String kakaoID =element.getAsJsonObject().get("id").toString();
            String email = kakaoAccount.getAsJsonObject().get("email").getAsString();
            String name = kakaoAccount.getAsJsonObject().get("name").getAsString();
            String birthday1 = kakaoAccount.getAsJsonObject().get("birthyear").getAsString();
            String birthday2 = kakaoAccount.getAsJsonObject().get("birthday").getAsString();
            String birthday = birthday1 + birthday2;
            String nickName = properties.getAsJsonObject().get("nickname").getAsString();
            System.out.println("nickName : "+nickName);
            String gen = kakaoAccount.getAsJsonObject().get("has_gender").getAsString();
            if(gen.equals("true")) {
               userInfo.put("gen",kakaoAccount.getAsJsonObject().get("gender").getAsString());
            }else if(gen.equals("false")) {
               userInfo.put("gen", "-");
            }
            userInfo.put("birthday", birthday);
            userInfo.put("kakaoID", kakaoID);
            userInfo.put("email", email);
            userInfo.put("name", name);
            userInfo.put("nickName",nickName);
            
            //주소 받아오기
            reqUrl = "https://kapi.kakao.com/v1/user/shipping_address";
            url = new URL(reqUrl);
            conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
            
            responseCode = conn.getResponseCode();
            
            if (responseCode >= 200 && responseCode <= 300) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            line = "";
            responseSb = new StringBuilder();
            while((line = br.readLine()) != null){
                responseSb.append(line);
            }
            result = responseSb.toString();
            parser = new JsonParser();
            element = parser.parse(result);
            
            Gson gson = new Gson();

            // JSON 데이터 파싱
            JsonObject jsonObject = gson.fromJson(element, JsonObject.class);
            System.out.println("jsonObject : "+jsonObject);
            // "shipping_addresses" 키에 해당하는 값을 가져옴
            JsonArray shippingAddresses = jsonObject.getAsJsonArray("shipping_addresses");
            System.out.println("shippingAddresses : "+shippingAddresses);
            // 가져온 값을 출력
            for (int i = 0; i < shippingAddresses.size(); i++) {
                JsonObject addressObject = shippingAddresses.get(i).getAsJsonObject();
                String baseAddress = addressObject.get("base_address").getAsString();
                String detail_address = addressObject.get("detail_address").getAsString();
                String zone_number = addressObject.get("zone_number").getAsString();
                String phone_number1 = addressObject.get("receiver_phone_number1").getAsString();
                phone_number1 = phone_number1.replaceAll("-","");
                // 필요한 속성들을 가져와서 사용
                System.out.println("Base Address: " + baseAddress);
                System.out.println("detail_address: " + detail_address);
                System.out.println("zone_number: " + zone_number);
                // 나머지 속성들도 필요한대로 가져와서 사용
                
                userInfo.put("baseAddress",baseAddress);
                userInfo.put("detail_address",detail_address);
                userInfo.put("zone_number",zone_number);
                userInfo.put("phone_number1", phone_number1);
            }
            
            
            br.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return userInfo;
    }
    
    //로그아웃
    public void kakaoLogout(String accessToken) {
        String reqUrl = "https://kapi.kakao.com/v1/user/logout";
        System.out.println("kakaoLogout 진행 중....");
        try{
            URL url = new URL(reqUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);

            int responseCode = conn.getResponseCode();

            BufferedReader br;
            if (responseCode >= 200 && responseCode <= 300) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            String line = "";
            StringBuilder responseSb = new StringBuilder();
            while((line = br.readLine()) != null){
                responseSb.append(line);
            }
            String result = responseSb.toString();
            System.out.println("result : "+result);

        }catch (Exception e){
            e.printStackTrace();
        }
    }
    
}