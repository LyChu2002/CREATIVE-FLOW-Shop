package vn.devpro.javaweb26.controller.backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.javaweb26.controller.BaseController;
import vn.devpro.javaweb26.dto.Jw26Constants;

@Controller
public class AdminHomeController extends BaseController implements Jw26Constants{
	@RequestMapping(value = "/admin/home", method = RequestMethod.GET)
	public String homeAdmin() {
		return "backend/home";
	}
}
