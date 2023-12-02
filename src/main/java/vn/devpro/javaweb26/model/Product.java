package vn.devpro.javaweb26.model;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_product")
public class Product extends BaseModel{
	@Column(name = "code", length = 100, nullable = true)
	private String code;
	
	@Column(name = "name", length = 300, nullable = false)
	private String name;
	
	@Column(name = "avatar", length = 300, nullable = true)
	private String avatar;
	
	@Column(name = "price", nullable = true)
	private BigDecimal price;
	
	@Column(name = "short_description", length = 500, nullable = true)
	private String shortDescription;
	
	@Column(name = "detail_description", nullable = true)
	private String detailDescription;
	
	@Column(name = "warehouse_quantity", nullable = true)
	private Integer warehouseQuantity;
	
	@Column(name = "is_new", nullable = true)
	private Boolean isNew = Boolean.FALSE;
	
	@Column(name = "old_price", nullable = true)
	private BigDecimal oldPrice;
	
	//------------------Mapping many-to-one: product-to-category----------------------------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Category category;

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
//---------------------------------------------------------------------------------------
//---------------Mapping one-to-many: tbl_product-to-tbl_produtc_image---------------------
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
	private Set<ProductImage> productImages = new HashSet<ProductImage>();
	
	public void addRelationalProductImage(ProductImage productImage) {
		productImages.add(productImage);
		productImage.setProduct(this);
	}
	
	public void removeRelationalProductImage(ProductImage productImage) {
		productImages.remove(productImage);
		productImage.setProduct(null);
	}
//----------------------------------------------------------------------------------------------
//----------------Mapping many-to-one: tbl_product-to-tbl_user (user create product)-----------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "create_by")
	private User userCreateProduct;
	
//---------------Mapping many-to-one: tbl_product-to-tbl_user (user update product)----------
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "update_by")
	private User userUpdateProduct;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getDetailDescription() {
		return detailDescription;
	}

	public void setDetailDescription(String detailDescription) {
		this.detailDescription = detailDescription;
	}

	public Integer getWarehouseQuantity() {
		return warehouseQuantity;
	}

	public void setWarehouseQuantity(Integer warehouseQuantity) {
		this.warehouseQuantity = warehouseQuantity;
	}

	public Boolean getIsNew() {
		return isNew;
	}

	public void setIsNew(Boolean isNew) {
		this.isNew = isNew;
	}

	public Set<ProductImage> getProductImages() {
		return productImages;
	}

	public void setProductImages(Set<ProductImage> productImages) {
		this.productImages = productImages;
	}

	public User getUserCreateProduct() {
		return userCreateProduct;
	}

	public void setUserCreateProduct(User userCreateProduct) {
		this.userCreateProduct = userCreateProduct;
	}

	public User getUserUpdateProduct() {
		return userUpdateProduct;
	}

	public void setUserUpdateProduct(User userUpdateProduct) {
		this.userUpdateProduct = userUpdateProduct;
	}

	public BigDecimal getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(BigDecimal oldPrice) {
		this.oldPrice = oldPrice;
	}
	
	
}
