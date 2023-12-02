package vn.devpro.javaweb26.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import vn.devpro.javaweb26.dto.SearchModel;
import vn.devpro.javaweb26.model.SaleOrder;

@Service
public class SaleOrderService extends BaseService<SaleOrder>{
	@Override
	public Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return SaleOrder.class;
	}
	
	@Transactional
	public void deleteSaleOrderById(int saleOrderId) {
		super.deleteById(saleOrderId);
	}
	
	public List<SaleOrder> searchOrder(SearchModel searchModel){
		String sql = "SELECT * FROM tbl_sale_order s WHERE 1 = 1";
		if(searchModel.getStatus() != 2) {
			sql += " AND s.status = " + searchModel.getStatus();
		}
		
		if(searchModel.getBeginDate() != null && searchModel.getEndDate() != null) {
			sql += " AND s.create_date BETWEEN '" + searchModel.getBeginDate() + "' AND '" + searchModel.getEndDate() + "'";
 		}
		
		sql += " ORDER BY s.create_date DESC";
		return super.executeNativeSql(sql);
	}
	
}
