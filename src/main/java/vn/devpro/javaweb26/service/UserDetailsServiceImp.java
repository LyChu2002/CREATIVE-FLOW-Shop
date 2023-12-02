package vn.devpro.javaweb26.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import vn.devpro.javaweb26.model.User;

@Service
public class UserDetailsServiceImp extends BaseService<User> implements UserDetailsService{
	@Override
	public Class<User> clazz() {
		// TODO Auto-generated method stub
		return User.class;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM tbl_user u WHERE u.username = '" + username + "' AND u.status = 1";
		User user = this.getEntityByNativeSQL(sql);
		if(user != null) {
			return user;
		}
		else return new User();
	}
}
