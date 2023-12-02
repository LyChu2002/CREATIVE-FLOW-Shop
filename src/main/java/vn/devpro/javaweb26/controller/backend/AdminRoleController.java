package vn.devpro.javaweb26.controller.backend;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.javaweb26.controller.BaseController;
import vn.devpro.javaweb26.model.Role;
import vn.devpro.javaweb26.model.User;
import vn.devpro.javaweb26.service.RoleService;
import vn.devpro.javaweb26.service.UserService;

@Controller
public class AdminRoleController extends BaseController{
	@Autowired 
	private RoleService roleService;
	
	@Autowired
	private UserService userService;
	
//----------------list role--------------------
	@RequestMapping(value = "/admin/role-list", method = RequestMethod.GET)
	public String roleList(final Model model) throws IOException{
		List<Role> roles = roleService.findAllActive();
		model.addAttribute("roles", roles);
		
		return "backend/role-list";
	}
	
//--------------add new role-------------------
	@RequestMapping(value = "/admin/role-add", method = RequestMethod.GET)
	public String roleAdd(final Model model) throws IOException{
		List<User> users = userService.findAllActive();
		model.addAttribute("users", users);
		
		Role role = new Role();
		role.setCreateDate(new Date());
		role.setUpdateDate(new Date());
		model.addAttribute("role", role);
		
		return "backend/role-add";
	}
//---------------save new role-----------------------
	@RequestMapping(value = "/admin/role-add-save", method = RequestMethod.POST)
	public String roleAddSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("role") Role role )throws IOException{
		if(!StringUtils.isEmpty(request.getParameter("user"))) {
			int userId = Integer.parseInt(request.getParameter("user"));
			User user = userService.getById(userId);
			user.addRelationalUserRole(role);
			roleService.saveOrUpdate(role);
		}
		
		return "redirect:/admin/role-list";
	}
//---------------------edit role-------------------------
	@RequestMapping(value = "/admin/role-edit/{roleId}", method = RequestMethod.GET)
	public String roleEdit(final Model model,
			@PathVariable("roleId") int roleId) throws IOException{
		Role role = roleService.getById(roleId);
		model.addAttribute("role", role);
		
		List<User> users = userService.findAllActive();
		model.addAttribute("users", users);
		
		
		return "backend/role-edit";
	}
		
//------------------save edit role------------------------
//	@RequestMapping(value = "/admin/role-edit-save", method = RequestMethod.POST)
//	public String roleEditSave(final Model model,
//			final HttpServletRequest request,
//			@ModelAttribute("role") Role role) throws IOException{
//		roleService.saveOrUpdate(role);
//		return "redirect:/admin/role-list";
//	}
//	@RequestMapping(value = "/admin/role-delete/{roleId}", method = RequestMethod.GET)
//	public String roleDelete(final Model model,
//			@PathVariable("roleId") int roleId) throws IOException{
//		roleService.deleteRoleById(roleId);
//		return "redirect:/admin/role-list";
//	}
//------------------------delete role-----------------------
	@RequestMapping(value = "/admin/role-delete/{roleId}", method = RequestMethod.GET)
	public String roleDelete(final Model model,
			@PathVariable("roleId") int roleId) throws IOException{
		Role role = roleService.getById(roleId);
		role.setStatus(Boolean.FALSE);
		roleService.saveOrUpdate(role);
		return "redirect:/admin/role-list";
	}
}
