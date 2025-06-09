package com.test.common;

import com.fasterxml.jackson.core.type.TypeReference;
import com.test.common.json.JsonUtils;
import lombok.Data;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.List;


public class JsonUtilsTest {

    @Test
    public void testToJsonString() {
        // 创建一个示例对象
        SampleObject obj = new SampleObject();
        obj.setId(1);
        obj.setName("John Doe");
        obj.setAge(30);

        // 将对象转换为JSON字符串
        String jsonString = JsonUtils.toJsonString(obj);

        // 验证JSON字符串是否正确
        String expectedJson = "{\"id\":1,\"name\":\"John Doe\",\"age\":30}";
        Assertions.assertEquals(expectedJson, jsonString);
    }

    @Test
    public void testToObject() {
        // 创建一个示例JSON字符串
        String jsonString = "{\"id\":1,\"name\":\"John Doe\",\"age\":30}";

        // 将JSON字符串转换为对象
//        SampleObject obj = JsonUtils.toObject(jsonString, SampleObject.class);
        SampleObject obj = JsonUtils.toObject(jsonString, new TypeReference<SampleObject>() {});
        // 验证对象字段的值是否正确
        Assertions.assertEquals(1, obj.getId());
        Assertions.assertEquals("John Doe", obj.getName());
        Assertions.assertEquals(30, obj.getAge());
    }

    @Test
    public void testToObjectArray() {
        // 创建一个示例JSON数组字符串
        String jsonArray = "[{\"id\":1,\"name\":\"John Doe\",\"age\":30}," +
                "{\"id\":2,\"name\":\"Jane Smith\",\"age\":25}]";

        // 将JSON数组字符串转换为对象列表
        List<SampleObject> objList = JsonUtils.toObjectArray(jsonArray, SampleObject.class);

        // 验证对象列表的大小和字段的值是否正确
        Assertions.assertEquals(2, objList.size());

        SampleObject obj1 = objList.get(0);
        Assertions.assertEquals(1, obj1.getId());
        Assertions.assertEquals("John Doe", obj1.getName());
        Assertions.assertEquals(30, obj1.getAge());

        SampleObject obj2 = objList.get(1);
        Assertions.assertEquals(2, obj2.getId());
        Assertions.assertEquals("Jane Smith", obj2.getName());
        Assertions.assertEquals(25, obj2.getAge());
    }

    // 示例对象类
    @Data
    public static class SampleObject {
        private int id;
        private String name;
        private int age;
    }
}