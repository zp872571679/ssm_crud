package com.atguigu.crud.utils;

import org.springframework.core.convert.converter.Converter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 自定义类型转换器
 * 把字符串转换成日期
 */
public class StringToDateConverter implements Converter<String, Date> {

    @Override
    public Date convert(String s) {
        if(s==null){
            throw new RuntimeException("请输入参数");
        }
        try {
            DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
            return df.parse(s);
        } catch (Exception e) {
            throw new RuntimeException("数据转换错误");
        }
    }
}
