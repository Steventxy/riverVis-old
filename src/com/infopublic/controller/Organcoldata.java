package com.infopublic.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;


import net.sf.json.JSONObject;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.infopublic.entity.Organapires;
import com.infopublic.entity.Pow;
import com.infopublic.entity.SensorData;
import com.infopublic.service.SensorDataManager;
import com.infopublic.service.impl.PowService;
import com.infopublic.util.PageData;

//终端采集数据api
@RestController
@RequestMapping(value="/api")

public class Organcoldata extends BaseController{
	@Resource(name="powService")
	private PowService powService;
	@Resource(name="SensorDataService")
	private SensorDataManager SensorDataService;
	
	@RequestMapping(value="/pow")
	public JSONObject dataview() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		Organapires res = new Organapires();
		
		List<Pow> list = powService.getPowlist(pd);
		Pow pow =powService.getnowPow(pd);
		res.put("IMEI", pd.getString("id"));
		res.put("pow1", pow.getPow1());
		res.put("grouppow", pow.getGrouppow());
		res.put("outv1", pow.getOutv1());
		res.put("outv2", pow.getOutv2());
		res.put("v24", pow.getV24());
		res.put("v28", pow.getV28());
		res.put("extendpow", pow.getExtendpow());
		res.put("solarpow", pow.getSolarpow());
		res.put("time", pow.getTime());
		res.put("data",list);
		return JSONObject.fromObject(res);
	}
	
	@RequestMapping(value="/newpow")
	public JSONObject powbyid() throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		
		Pow pow =powService.getnowPow(pd);

		return JSONObject.fromObject(pow);
	}
	
	@RequestMapping(value="/weather")
	public JSONObject weather() throws Exception{
		String host = "https://saweather.market.alicloudapi.com";
	    String path = "/area-to-weather";
	    String method = "GET";
	    String appcode = "a153a70c9d6c45248b42b87f8c37ab74";
	    Map<String, String> headers = new HashMap<String, String>();
	    //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
	    headers.put("Authorization", "APPCODE " + appcode);
	    Map<String, String> querys = new HashMap<String, String>();
	    querys.put("area", "长沙");
	    querys.put("areaid", "101250101");
	    querys.put("need3HourForcast", "0");
	    querys.put("needAlarm", "0");
	    querys.put("needHourData", "0");
	    querys.put("needIndex", "1");
	    querys.put("needMoreDay", "0");


	    
	    	/**
	    	* 重要提示如下:
	    	* HttpUtils请从
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
	    	* 下载
	    	*
	    	* 相应的依赖请参照
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
	    	*/
	    	HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
	    	
	    	//获取response的body
	    	return JSONObject.fromObject(EntityUtils.toString(response.getEntity()));
	    

		
	}

	
}
