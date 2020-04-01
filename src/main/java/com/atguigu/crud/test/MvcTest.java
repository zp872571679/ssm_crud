package com.atguigu.crud.test;

import com.atguigu.crud.bean.Employee;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:dispatcher-servlet.xml"})
@WebAppConfiguration
public class MvcTest {
    /**
     * spring4的时候测试 需要servlet3.0的支持
     * 需要导入javax-servlet3.0的相关jar
     */
    @Autowired
    WebApplicationContext context;
    MockMvc mockMvc;

    @Before
    public void initMockMvc() {
        //获取一个请求对象
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        //模拟请求那返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();
        //获取到request对象 查看里面是否有这个参数
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码：" + pageInfo.getPageNum());
        System.out.println("总页码：" + pageInfo.getPages());
        System.out.println("总记录数：" + pageInfo.getTotal());
        System.out.println("在页面连续显示的页码");
        int[] nums = pageInfo.getNavigatepageNums();
        for (int i : nums) {
            System.out.println("   "+i);
        }
        //获取员工数据
        List<Employee> lists=pageInfo.getList();
        for(Employee employee:lists){
            System.out.println(employee);
        }
    }
}
