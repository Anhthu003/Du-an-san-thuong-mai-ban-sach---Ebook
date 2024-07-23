package com.foti_java.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.foti_java.model.Commune;

public class ApiUtil {
	public static List<Object[]> postApi(String url, JSONObject json, Object... params)
			throws ClientProtocolException, IOException {
		CloseableHttpClient httpClient = HttpClients.createDefault();
		StringEntity entity = new StringEntity(json.toString(), ContentType.APPLICATION_JSON);
		HttpPost httpPost = new HttpPost(url);
		httpPost.setEntity(entity);
		httpPost.setHeader("Token", "87b48598-2325-11ef-a951-76299e96dead");
		httpPost.setHeader("Content-type", "application/json");
		ObjectMapper objectMapper = new ObjectMapper();

		CloseableHttpResponse response = httpClient.execute(httpPost);
		List<Object[]> list = new ArrayList<>();
		JsonNode jsonNode = objectMapper.readTree(EntityUtils.toString(response.getEntity()));
		JsonNode data = jsonNode.get("data");
		for (int i = 0; i < data.size(); i++) {
			Object[] object = new Object[params.length];
			for (int j = 0; j < params.length; j++) {
				object[j] = data.get(i).get(params[j].toString());
			}
			list.add(object);
		}
		return list;

	}

	public static void main(String[] args) throws ClientProtocolException, IOException {
//		JSONObject jsonObject = new JSONObject();
//		StringEntity entity = new StringEntity(jsonObject.toString(), ContentType.APPLICATION_JSON);
//		HttpPost post = new HttpPost("https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province");
//		post.setEntity(entity);
//		post.setHeader("Token", "87b48598-2325-11ef-a951-76299e96dead");
//		post.setHeader("Content-type", "application/json");
//		List<Object[]> list = postApi("https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province",jsonObject, "ProvinceName");
//		for (Object[] objects : list) {
//			System.out.println(objects[0]);
//		}

		JSONObject warJson = new JSONObject();
		warJson.put("district_id", 1566);

		List<Object[]> wars = ApiUtil.postApi(
				"https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward", warJson, "WardCode",
				"WardName");

		for (Object[] wa : wars) {
			System.out.println(wa[0]);
		}
	}
}
