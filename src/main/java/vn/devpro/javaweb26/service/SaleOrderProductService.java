package vn.devpro.javaweb26.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.devpro.javaweb26.model.SaleOrderProduct;

@Service
public class SaleOrderProductService extends BaseService<SaleOrderProduct>{
	@Override
	public Class<SaleOrderProduct> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProduct.class;
	}
	
	public List<SaleOrderProduct> listProducts(int saleOrderId){
		return super.executeNativeSql("SELECT * FROM tbl_sale_order_product WHERE sale_order_id = " + saleOrderId);
	}
}
