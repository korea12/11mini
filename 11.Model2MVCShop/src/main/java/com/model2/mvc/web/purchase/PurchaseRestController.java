package com.model2.mvc.web.purchase;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

@RestController
@RequestMapping("purchase/*")
public class PurchaseRestController {
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public PurchaseRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="json/addPurchase/{prodNo}", method=RequestMethod.GET)
	public Product addPurchase(@PathVariable int prodNo)throws Exception{
		System.out.println("/purchse/addPurchase: GET");
		
		return productService.getProduct(prodNo);
		
	}
	
	@RequestMapping(value="json/addPurchase", method=RequestMethod.POST)
	public Purchase addPurchase(@RequestBody Purchase purchase)throws Exception{
		/*User buyer = userService.getUser(userId);
		Product purchaseProd= productService.getProduct(prodNo);*/
		System.out.println("/purchse/addPurchase: POST");
		
		
		purchaseService.addPurchase(purchase);
		System.out.println("addPurchase:::"+purchase );
		return purchase;
		
	}
	
	@RequestMapping(value="json/listPurchase")
	public Map<String, Object> listProduct(@RequestBody(required=false) Search search)throws Exception{
		System.out.println("/product/json/listPurchase");
		System.out.println(search);
		if(search==null) {
			System.out.println("avd");
			search = new Search();
			search.setCurrentPage(1);
			
		}
		System.out.println(search);
		search.setPageSize(pageSize);
		System.out.println(purchaseService.getPurchaseList(search, "jya1993"));
		
		return purchaseService.getPurchaseList(search, "jya1993");
	}
	
	@RequestMapping(value="json/getPurchase/{tranNo}", method=RequestMethod.GET)
	public Purchase getPurchase(@PathVariable int tranNo)throws Exception{
		System.out.println("/purchase/getPurchase: GET");
		
		return purchaseService.getPurchase(tranNo);
	}
	
	@RequestMapping(value="json/updatePurchase/{tranNo}", method=RequestMethod.GET)
	public Purchase updatePurchase(@PathVariable int tranNo)throws Exception{
		System.out.println("/purchase/updatePurchase:GET");
		
		return purchaseService.getPurchase(tranNo);
	}
	
	@RequestMapping(value="json/updatePurchase", method=RequestMethod.POST)
	public Purchase updatePurchase(@RequestBody Purchase purchase)throws Exception{
			
		purchaseService.getPurchase(purchase.getTranNo());
		
		System.out.println("/purchase/updatePurchase:POST");
		purchaseService.updatePurchase(purchase);
		
		return purchase;
	}
	
	@RequestMapping(value="json/updateTranCode/{tranNo}/{tranCode}", method=RequestMethod.GET)
	public Purchase updateTranCode(@PathVariable String tranCode, @PathVariable int tranNo)throws Exception{
		Purchase purchase =purchaseService.getPurchase(tranNo);
		purchase.setTranCode(tranCode);
		purchaseService.updateTranCode(purchase);
		
		return purchase;
	}
	
	@RequestMapping(value="json/updateTranCodeByProd/{prodNo}/{tranCode}", method=RequestMethod.GET)
	public Purchase updateTranCodeByProd(@PathVariable String tranCode, @PathVariable int prodNo)throws Exception{
		Purchase purchase = purchaseService.getPurchase2(prodNo);
		purchase.setTranCode(tranCode);
		
		purchaseService.updateTranCode(purchase);
		
		return purchase;
	}
}
