package com.atguigu.crud.service;

import com.atguigu.crud.bean.Department;
import com.atguigu.crud.bean.DepartmentExample;
import com.atguigu.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("departmentService")
public class DepartmentService implements DepartmentMapper {
    @Autowired
    private DepartmentMapper departmentMapper;
    @Override
    public long countByExample(DepartmentExample example) {
        return departmentMapper.countByExample(example);
    }

    @Override
    public int deleteByExample(DepartmentExample example) {
        return departmentMapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(Integer deptId) {
        return departmentMapper.deleteByPrimaryKey(deptId);
    }

    @Override
    public int insert(Department record) {
        return departmentMapper.insert(record);
    }

    @Override
    public int insertSelective(Department record) {
        return departmentMapper.insertSelective(record);
    }

    @Override
    public List<Department> selectByExample(DepartmentExample example) {
        return departmentMapper.selectByExample(example);
    }

    @Override
    public Department selectByPrimaryKey(Integer deptId) {
        return departmentMapper.selectByPrimaryKey(deptId);
    }

    @Override
    public int updateByExampleSelective(Department record, DepartmentExample example) {
        return departmentMapper.updateByExampleSelective(record,example);
    }

    @Override
    public int updateByExample(Department record, DepartmentExample example) {
        return departmentMapper.updateByExample(record,example);
    }

    @Override
    public int updateByPrimaryKeySelective(Department record) {
        return departmentMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Department record) {
        return departmentMapper.updateByPrimaryKey(record);
    }
}
