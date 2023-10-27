<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow.Builder"%>
<%@page import="com.google.api.client.googleapis.notifications.NotificationUtils"%>
<%@page import="com.google.firebase.projectmanagement.AndroidAppMetadata"%>
<%@page import="com.google.firebase.projectmanagement.AndroidApp"%>
<%@page import="javax.management.NotificationListener"%>
<%@page import="com.google.firebase.messaging.Notification"%>
<%@page import="com.google.firebase.messaging.BatchResponse"%>
<%@page import="java.util.List"%>
<%@page import="com.google.common.net.MediaType"%>
<%@page import="com.google.api.client.http.HttpHeaders"%>
<%@page import="com.google.firebase.messaging.SendResponse"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.google.firebase.messaging.MulticastMessage"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.google.firebase.messaging.FirebaseMessaging"%>
<%@page import="com.google.firebase.messaging.AndroidNotification"%>
<%@page import="com.google.firebase.messaging.AndroidConfig.Priority"%>
<%@page import="com.google.firebase.messaging.AndroidConfig"%>
<%@page import="com.google.firebase.messaging.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.firebase.FirebaseApp"%>
<%@page import="com.google.auth.oauth2.GoogleCredentials"%>
<%@page import="com.google.firebase.FirebaseOptions"%>
<%@page import="java.io.FileInputStream"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%!
	public class FcmUtil{
		public void send_FCM(List<String> tokenList, String title, String content, String send){
			try{
				/*
				//API 키 : AIzaSyBSc19ZVa3nwDWAJ-RpKDxRkE-k0yMw_1E
				
				final String apiKey = "AIzaSyBSc19ZVa3nwDWAJ-RpKDxRkE-k0yMw_1E";
			
//				URL url = new URL("https://samplepush-fe215.firebaseio.com"); 

				URL url = new URL("https://fcm.googleapis.com/fcm/send");
				
				
				HttpURLConnection conn = (HttpURLConnection)url.openConnection();
				conn.setDoOutput(true);
				conn.setRequestMethod("POST");
				
				conn.setRequestProperty("Content-Type", "application/json");
				conn.setRequestProperty("Authorization", "key="+apiKey);
				
				conn.setDoOutput(true);
				
				String input = "{\"notification\" : {\"title\" : \" "+title+" \", \"body\" : \""+content+"\"}, \"to\":\" "+tokenList+"  \"}";

				OutputStream os = conn.getOutputStream();
				
				os.write(input.getBytes("UTF-8"));
				os.flush();
				os.close();
				
				int responseCode = conn.getResponseCode();
                System.out.println("\nSending 'POST' request to URL : " + url);
                System.out.println("Post parameters : " + input);
                System.out.println("Response Code : " + responseCode);

				BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String inputLine;
				StringBuffer response = new StringBuffer();
				
				while((inputLine = in.readLine()) != null){
					response.append(inputLine);
				}
				in.close();
				
				System.out.println(response.toString());
				*/
				
				
				
				//D:/work/sunil/WebContent/resources/json/samplepush-fe215-firebase-adminsdk-wzoiu-f84083f7b3.json
				//resources/js/billboard3.js
				FileInputStream refreshToken = new FileInputStream("D:/work/sunil/WebContent/resources/json/samplepush-fe215-firebase-adminsdk-wzoiu-f84083f7b3.json");

//				FileInputStream refreshToken = new FileInputStream("D:/study/spring/sunil/WebContent/resources/json/samplepush-fe215-firebase-adminsdk-wzoiu-f84083f7b3.json");				
				
				//D:\study\spring\sunil\WebContent\resources\json\samplepush-fe215-firebase-adminsdk-wzoiu-f84083f7b3.json
				
				
				
				
				FirebaseOptions options = new FirebaseOptions.Builder()
											.setCredentials(GoogleCredentials.fromStream(refreshToken))
											.setDatabaseUrl("https://samplepush-fe215.firebaseio.com")
											.build();
				
				if(FirebaseApp.getApps().isEmpty()){
					FirebaseApp.initializeApp(options);
				}
				
				
				
				
				MulticastMessage message = MulticastMessage.builder()
						.setAndroidConfig(AndroidConfig.builder()
						.setTtl(3600 * 1000)
						.setPriority(AndroidConfig.Priority.HIGH)
						
							.setNotification(AndroidNotification.builder()
								.setTag(send)
								.setTitle(send)
								.setBody(title+" : "+content)
								.setClickAction("")								
								.setSound("default")
								.build())		
							/* default, siren, heartbeat */
						
						.build())
						.putData("title",title)
						.putData("body",content)
						.putData("hogi",send)
						.addAllTokens(tokenList)
						.build();
				
				
				
				BatchResponse response = FirebaseMessaging.getInstance().sendMulticast(message);
				
				
				
				
//				System.out.println(response.getSuccessCount() + " messages were sent successfully");
										
				
				
				
				//메세지를 FirebaseMessaging에 보내기
//				String response = FirebaseMessaging.getInstance();
				//결과 출력
//				System.out.println("Successfully sent message : "+response);				
			
				/*
				//안드로이드 토큰 입력
				String registrationToken = tokenId;
				
				//message 작성
				Message msg = Message.builder()
								.setAndroidConfig(AndroidConfig.builder()
								.setTtl(3600 * 1000)
								.setPriority(AndroidConfig.Priority.NORMAL)
								
								
//								.setNotification(AndroidNotification.builder()
//									.setTitle(title)
//									.setBody(content)
//									.setIcon("stock_ticker_update")
//									.setColor("#f45342")
//									.build())
							
								.build())
								.putData("title",title)
								.putData("body", content)
								.setToken(registrationToken)
								.build();
				
				//메세지를 FirebaseMessaging에 보내기
				String response = FirebaseMessaging.getInstance().send(msg);
				//결과 출력
				System.out.println("Successfully sent message : "+response);
				*/
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	}

%>