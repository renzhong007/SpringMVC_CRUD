package com.superz.crud.handler;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.superz.crud.dao.DeptDao;
import com.superz.crud.dao.EmpDao;
import com.superz.crud.entity.Department;
import com.superz.crud.entity.Employee;

@Controller
public class EmpHandler {
	@Autowired
	private DeptDao deptDao;
	@Autowired
	private EmpDao empDao;
	
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.DELETE)
	public String delEmp(@PathVariable("empId") String empId){
		System.out.println(empId);
		empDao.removeEmp(empId);
		return "redirect:/emp/list";
	}
	
	@RequestMapping(value="/emp",method=RequestMethod.PUT)
	public String updateEmp(Employee emp){
		//System.out.println(emp);
		empDao.updateEmp(emp);
		return "redirect:/emp/list";
	}
	
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.GET)
	public String toEdit(@PathVariable("empId") String empId,Map<String, Object> map){
		List<Department> deptList = deptDao.getDeptList();
		map.put("deptList", deptList);
		Employee emp = empDao.getEmpById(empId);
		map.put("emp", emp);
		return "editEmp";
	}
	
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	public String saveEmp(Employee emp){
		empDao.saveEmp(emp);
		return "redirect:/emp/list";
	}
	
	@RequestMapping("/emp/toAdd")
	public String toAddEmp(Map<String, Object> map){
		List<Department> deptList = deptDao.getDeptList();
		map.put("depList", deptList);
		map.put("employee", new Employee());
		return "addEmp";
	}

	@RequestMapping("/emp/list")
	public String toListAllEmp(Map<String, Object> map) {
		List<Employee> empList = empDao.getEmpList();
		map.put("empList", empList);
		return "showList";
	}
}
