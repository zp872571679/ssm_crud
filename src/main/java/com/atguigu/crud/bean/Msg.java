package com.atguigu.crud.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
    /**
     * 消息通用类
     */
    //状态码 表示连接状态
    private int code;
    //提示信息
    private String msg;
    //用户要返回个浏览器的数据
    private Map<String,Object> exent=new HashMap<>();

    //返回成功的方法
    public static Msg success(){
        Msg result=new Msg();
        result.setCode(100);
        result.setMsg("处理成功");
        return result;
    }

    //返回失败的方法
    public static Msg fail(){
        Msg result=new Msg();
        result.setCode(200);
        result.setMsg("处理失败");
        return result;
    }
    //链式操作的方法
    public Msg add(String key,Object value){
        this.getExent().put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExent() {
        return exent;
    }

    public void setExent(Map<String, Object> exent) {
        this.exent = exent;
    }
}
