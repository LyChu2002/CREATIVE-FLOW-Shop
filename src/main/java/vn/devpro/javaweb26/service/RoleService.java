package vn.devpro.javaweb26.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import vn.devpro.javaweb26.model.Role;

@Service
public class RoleService extends BaseService<Role>{
	@Override
	public Class<Role> clazz() {
		
		return Role.class;
	}
	
	public List<Role> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_role WHERE status = 1");
	}
	
	@Transactional
	public void deleteRoleById(int id) {
		super.deleteById(id);
	}
	
	public Role getRoleByName(String name) {
		String sql = "SELECT * FROM tbl_role WHERE name = '" + name + "'";
		List<Role> roles = super.executeNativeSql(sql);
		if(roles.size() >0 ) {
			return roles.get(0);
		}else {
			return new Role();
		}
	}
}
