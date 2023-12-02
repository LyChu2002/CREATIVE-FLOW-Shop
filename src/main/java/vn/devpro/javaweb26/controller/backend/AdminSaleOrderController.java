package vn.devpro.javaweb26.controller.backend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.javaweb26.controller.BaseController;
import vn.devpro.javaweb26.dto.Jw26Constants;
import vn.devpro.javaweb26.dto.SearchModel;
import vn.devpro.javaweb26.model.SaleOrder;
import vn.devpro.javaweb26.model.SaleOrderProduct;
import vn.devpro.javaweb26.model.User;
import vn.devpro.javaweb26.service.SaleOrderProductService;
import vn.devpro.javaweb26.service.SaleOrderService;
import vn.devpro.javaweb26.service.UserService;

@Controller
public class AdminSaleOrderController extends BaseController implements Jw26Constants{
	@Autowired
	private SaleOrderService saleOrderService;
	
	@Autowired
	private SaleOrderProductService saleOrderProductService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/admin/order-list", method = RequestMethod.GET)
	public String orderList(final Model model, 
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		
//		List<SaleOrder> saleOrders = saleOrderService.findAll();
//		model.addAttribute("saleOrders", saleOrders);
		SearchModel orderSearch = new SearchModel();
		//Status
		orderSearch.setStatus(2);
		if(!StringUtils.isEmpty(request.getParameter("status"))) {
			orderSearch.setStatus(Integer.parseInt(request.getParameter("status")));
		}
		
		String beginDate = null;
		String endDate = null;
		if(!StringUtils.isEmpty(request.getParameter("beginDate")) && !StringUtils.isEmpty(request.getParameter("endDate"))) {
			beginDate = request.getParameter("beginDate");
			endDate = request.getParameter("endDate");
		}
		orderSearch.setBeginDate(beginDate);
		orderSearch.setEndDate(endDate);
		
		List<SaleOrder> listSaleOrder = saleOrderService.searchOrder(orderSearch);
		List<SaleOrder> saleOrders = new ArrayList<SaleOrder>();
		
		if(!StringUtils.isEmpty(request.getParameter("page"))) {
			orderSearch.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}else {
			orderSearch.setCurrentPage(1);
		}
		
		int totalPages = listSaleOrder.size() / SIZE_OF_PAGE;
		if(listSaleOrder.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}
		if(totalPages < orderSearch.getCurrentPage()) {
			orderSearch.setCurrentPage(1);
		}
		
		int firstIndex = (orderSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while(index < listSaleOrder.size() && count < SIZE_OF_PAGE) {
			saleOrders.add(listSaleOrder.get(index));
			index++;
			count++;
		}
		orderSearch.setTotalItems(listSaleOrder.size());
		orderSearch.setSizeOfPage(SIZE_OF_PAGE);
		
		model.addAttribute("orderSearch", orderSearch);
		model.addAttribute("saleOrders", saleOrders);
		return "backend/order-list";
	}
	
	@RequestMapping(value = "/admin/sale-order-detail/{saleOrderId}", method = RequestMethod.GET)
	public String orderDetail(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("saleOrderId") int saleOrderId) throws IOException{
		
		SaleOrder saleOrder = saleOrderService.getById(saleOrderId);
		model.addAttribute("saleOrder", saleOrder);
		
		List<SaleOrderProduct> listProducts = saleOrderProductService.listProducts(saleOrderId);
		model.addAttribute("listProducts", listProducts);

		return "backend/sale-order-detail";
	}
	
	@RequestMapping(value = "/admin/sale-order-delete/{saleOrderId}", method = RequestMethod.GET)
	public String deleteSaleOrder(final Model model, @PathVariable("saleOrderId") int saleOrderId) throws IOException{
		
		saleOrderService.deleteSaleOrderById(saleOrderId);
		return "redirect:/admin/order-list";
	}
	
	@RequestMapping(value = "/admin/sale-order-edit/{saleOrderId}", method = RequestMethod.GET)
	public String orderEdit(final Model model, @PathVariable("saleOrderId") int saleOrderId) throws IOException{
		SaleOrder saleOrder = saleOrderService.getById(saleOrderId);
		model.addAttribute("saleOrder", saleOrder);
		
		List<User> users = userService.findAllActive();
		model.addAttribute("users", users);
		return "backend/sale-order-edit";
	}
	
	@RequestMapping(value = "/admin/sale-order-edit-save", method = RequestMethod.POST)
	public String orderEditSave(final Model model, @ModelAttribute("saleOrder") SaleOrder saleOrder) throws IOException{
		
		saleOrderService.saveOrUpdate(saleOrder);
		return "redirect:/admin/order-list";
	}
}
