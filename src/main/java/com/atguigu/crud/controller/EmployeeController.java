package com.atguigu.crud.controller;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    /**
     * 分页信息的使用pagehelper
     *    <plugin>
     *                     <groupId>org.mybatis.generator</groupId>
     *                     <artifactId>mybatis-generator-maven-plugin</artifactId>
     *                     <version>1.3.7</version>
     *                     <dependencies>
     *                         <dependency>
     *                             <groupId>org.mybatis.generator</groupId>
     *                             <artifactId>mybatis-generator-core</artifactId>
     *                             <version>1.3.7</version>
     *                         </dependency>
     *                         <dependency>
     *                             <groupId>mysql</groupId>
     *                             <artifactId>mysql-connector-java</artifactId>
     *                             <version>8.0.15</version>
     *                         </dependency>
     *                     </dependencies>
     *                     <executions>
     *                         <execution>
     *                             <id>mybatis generator</id>
     *                             <phase>package</phase>
     *                             <goals>
     *                                 <goal>generate</goal>
     *                             </goals>
     *                         </execution>
     *                     </executions>
     *                     <configuration>
     *                         <!--允许移动生成的文件-->
     *                         <verbose>true</verbose>
     *                         <!--允许自动覆盖的文件-->
     *                         <overwrite>true</overwrite>
     *                         <configurationFile>
     *                             src/main/resources/generatorConfig.xml
     *                         </configurationFile>
     *                     </configuration>
     *                 </plugin>
     *                 生成mybatis的所需要文件
     * @param pn
     * @return
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        /*查询员数据 分页查询*/
        //引入PageHelper插件
        PageHelper.startPage(pn,5);
        //分页查询的结果
        List<Employee> lists=employeeService.selectByExampleWithDept(null);
        //分页信息 交给前台页面  连续显示的页数
        PageInfo pageInfo=new PageInfo(lists,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    //@RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        /*查询员数据 分页查询*/
        //引入PageHelper插件
        PageHelper.startPage(pn,5);
        //分页查询的结果
        List<Employee> lists=employeeService.selectByExampleWithDept(null);
        //分页信息 交给前台页面  连续显示的页数
        PageInfo pageInfo=new PageInfo(lists,5);
        model.addAttribute("pageInfo",pageInfo);

        return "list";
    }

    /**
     * 使用JSR303实现后台校验
     * 导入Hibernate-Validator
     * @param employee
     * @return
     * 保存员工信息
     */
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        Map<String,Object> map=new HashMap<>();
        if (result.hasErrors()) {
            List<FieldError> errorList = result.getFieldErrors();
            for (FieldError error : errorList) {
                map.put(error.getField(), error.getDefaultMessage());
            }

            return Msg.fail().add("errorField",map);
        }else {
            employeeService.insertSelective(employee);
            return Msg.success();
        }

    }

    //校验用户名的方法
    @ResponseBody
    @RequestMapping("/checkuse")
    public Msg checkuse(@RequestParam("empName") String empName){
        //判断用户名是是否合法
        String regName="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if(!empName.matches(regName)){
            return Msg.fail().add("va_msg","用户名不合法");
        }
        boolean isEmpName=employeeService.checkUser(empName);
        if(isEmpName){
            return Msg.success();
        }else {
          return Msg.fail().add("va_msg","用户名不可用");
        }
    }
    //根据id查询员工信息
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee employee=employeeService.selectByPrimaryKey(id);
        return Msg.success().add("emp",employee);
    }

    //保存修改后的对象 员工更新方法
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg saveEmp(Employee employee){
        employeeService.updateByPrimaryKeySelective(employee);
        return Msg.success();
    }

    //根据员工id删除 单个和批量
    @ResponseBody
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    public Msg deleteEmp(@PathVariable("ids") String ids){
        if(ids.contains("-")){
            String[] str_ids=ids.split("-");
            List<Integer> del_ids=new ArrayList<>();
            for(String str:str_ids){
                del_ids.add(Integer.parseInt(str));
            }
            employeeService.deleteBatch(del_ids);
        }else {
            Integer id=Integer.parseInt(ids);
            employeeService.deleteByPrimaryKey(id);
        }
        return Msg.success();
    }
}
