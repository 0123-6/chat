package util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;

public class MyUtil {
    public static int bugNum(){
        System.err.println("bug!");
        return -1;
    }

    public static <T> T bugNull(){
        System.err.println("bug!");
        return null;
    }

    public static String jsonToString(HttpServletRequest request) throws IOException {
        BufferedReader reader = request.getReader();
        String str;
        StringBuilder s = new StringBuilder();
        while ((str=reader.readLine())!=null){
            s.append(str);
        }
        reader.close();
        return s.toString();
    }

    public static Map<String,Object> jsonToMap(HttpServletRequest request) throws IOException {
        String s = jsonToString(request);
        ObjectMapper mapper = new ObjectMapper();
        Map<String,Object> map = mapper.readValue(s, new TypeReference<>() {
        });
        return map;
    }

    public static String toJson(Object object, HttpServletResponse resp) throws JsonProcessingException {
        resp.setContentType("application/json; charset=utf-8");
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(object);
    }
}
