package com.atguigu.crud.test;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class MybatisTest {
    /**
     * 入门小案例
     *
     * @param
     */
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;
    /**
     * 查询所有用户
     *
     * @throws Exception
     */
    @Test
    public void test() {
        //使用代理对象执行方法
        //EmployeeExample employeeExample=new EmployeeExample();
        //List<Employee> list =mapper.selectByExampleWithDept(employeeExample);
        //for(Employee employee:list){
        //  System.out.println(employee+"\n");
        //}
    }

    @Test
    public void select() {
        //Employee employee=mapper.selectByPrimaryKeyWithDept(1);
        //System.out.println(employee);
    }

    @Test
    public void insert() {
       // System.out.println(departmentMapper);
        //departmentMapper.insertSelective(new Department(null, "测试部"));
        EmployeeMapper mapper=sqlSession.getMapper(EmployeeMapper.class);
        String uuid;
        for(int i=0;i<=1000;i++){
            uuid=UUID.randomUUID().toString().replaceAll("-","").substring(0,5);
            mapper.insertSelective(new Employee(null,uuid,"M","@itheima.com",1));
        }
    }

}
