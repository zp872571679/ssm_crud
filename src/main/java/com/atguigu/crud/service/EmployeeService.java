package com.atguigu.crud.service;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.EmployeeExample;
import com.atguigu.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("employeeService")
public class EmployeeService implements EmployeeMapper {
    @Autowired
    private EmployeeMapper employeeMapper;
    @Override
    public long countByExample(EmployeeExample example) {
        return employeeMapper.countByExample(example);
    }

    @Override
    public int deleteByExample(EmployeeExample example) {
        return employeeMapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(Integer empId) {
        return employeeMapper.deleteByPrimaryKey(empId);
    }

    @Override
    public int insert(Employee record) {
        return employeeMapper.insert(record);
    }

    @Override
    public int insertSelective(Employee record) {
        return employeeMapper.insertSelective(record);
    }

    @Override
    public List<Employee> selectByExample(EmployeeExample example) {
        return employeeMapper.selectByExample(example);
    }

    @Override
    public Employee selectByPrimaryKey(Integer empId) {
        return employeeMapper.selectByPrimaryKey(empId);
    }

    @Override
    public List<Employee> selectByExampleWithDept(EmployeeExample example) {
        return employeeMapper.selectByExampleWithDept(example);
    }

    @Override
    public Employee selectByPrimaryKeyWithDept(Integer empId) {
        return employeeMapper.selectByPrimaryKeyWithDept(empId);
    }

    @Override
    public int updateByExampleSelective(Employee record, EmployeeExample example) {
        return employeeMapper.updateByExampleSelective(record,example);
    }

    @Override
    public int updateByExample(Employee record, EmployeeExample example) {
        return employeeMapper.updateByExample(record,example);
    }

    @Override
    public int updateByPrimaryKeySelective(Employee record) {
        return employeeMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Employee record) {
        return employeeMapper.updateByPrimaryKey(record);
    }

    @Override
    public boolean checkUser(String empName) {
        EmployeeExample employeeExample=new EmployeeExample();
        EmployeeExample.Criteria criteria=employeeExample.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count=employeeMapper.countByExample(employeeExample);
        return count==0;
    }
    //单个和批量二合一方法
    public void deleteBatch(List<Integer> ids) {
        EmployeeExample employeeExample =new EmployeeExample();
        EmployeeExample.Criteria criteria =employeeExample.createCriteria();
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(employeeExample);
    }
}
