package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public PurchaseController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	//@RequestMapping("/addPurchaseView.do")
	@RequestMapping(value="/addPurchase", method=RequestMethod.GET)
	public ModelAndView addPurchase(@RequestParam("prodNo") int prodNo) throws Exception{
		
		System.out.println("/product/addPurchase : GET");
		
		Product product = productService.getProduct(prodNo);
		System.out.println("product"+product);
		
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("product", product);
		modelAndView.setViewName("/purchase/addPurchase.jsp");
		
		return modelAndView;
	}
	
	//@RequestMapping("/addPurchase.do")
		@RequestMapping(value="addPurchase", method=RequestMethod.POST)
		public ModelAndView addPurchase(@RequestParam("buyerId") String buyerId, @RequestParam("prodNo") int prodNo, @ModelAttribute("purchase") Purchase purchase) throws Exception{
			
			
			User buyer = userService.getUser(buyerId);
			Product purchaseProd = productService.getProduct(prodNo);
			System.out.println("/purchase/addPurchase : POST");
			purchase.setBuyer(buyer);
			purchase.setPurchaseProd(purchaseProd);
			purchase.setTranCode("1");
			
			purchaseService.addPurchase(purchase);
			
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("purchase", purchase);
			modelAndView.setViewName("/purchase/addCheck.jsp");
			
			return modelAndView;
		}
	
	//@RequestMapping("/listPurchase.do")
	@RequestMapping(value="listPurchase")
	public ModelAndView listPurchase(@ModelAttribute("search") Search search, @ModelAttribute("user") User user, HttpServletRequest request, HttpSession session)throws Exception{
		System.out.println("/listPurchase: GET/POST");
		
		String buyerId=((User)session.getAttribute("user")).getUserId();
		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ผ๖วเ
		Map<String , Object> map=purchaseService.getPurchaseList(search, buyerId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("/purchase/listPurchase.jsp");
		
		return modelAndView;
	}
	//@RequestMapping("/getPurchase.do")
	@RequestMapping(value="getPurchase", method=RequestMethod.GET)
	public ModelAndView getPurchase(@RequestParam("tranNo") int tranNo)throws Exception{
		System.out.println("/purchase/getPurchase : GET");
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase", purchase);
		modelAndView.setViewName("/purchase/getPurchase.jsp");
		
		return modelAndView;
	}
	
	//@RequestMapping("/updatePurchaseView.do")
	@RequestMapping(value="updatePurchase", method=RequestMethod.GET)
	public ModelAndView updatePurchase(@RequestParam("tranNo")int tranNo)throws Exception {
		System.out.println("/purchase/updatePurchase : GET");
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase", purchase);
		modelAndView.setViewName("/purchase/updatePurchaseView.jsp");
		
		
		return modelAndView;
	}
	
	//@RequestMapping("/updatePurchase.do")
	@RequestMapping(value="updatePurchase", method=RequestMethod.POST)
	public ModelAndView updatePurchase(@ModelAttribute("purchase") Purchase purchase)throws Exception{
		System.out.println("/purchase/updatePurchase : POST");
		purchaseService.updatePurchase(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase", purchase);
		modelAndView.setViewName("redirect:/purchase/getPurchase?tranNo="+purchase.getTranNo());
		
		return modelAndView;
	}
	//@RequestMapping("/updateTranCode.do")
	@RequestMapping(value="updateTranCode", method=RequestMethod.GET)
	public ModelAndView updateTranCode(@RequestParam("tranCode") String tranCode, @RequestParam("tranNo") int tranNo)throws Exception{
		
		Purchase purchase = purchaseService.getPurchase(tranNo);
		purchase.setTranCode(tranCode);
		
		purchaseService.updateTranCode(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase", purchase);
		modelAndView.setViewName("redirect:/purchase/listPurchase");
		
		return modelAndView;
	}
	//@RequestMapping("/updateTranCodeByProd.do")
	@RequestMapping(value="updateTranCodeByProd", method=RequestMethod.GET)
	public ModelAndView updateTranCodeByProd(@RequestParam("prodNo") int prodNo, @RequestParam("tranCode") String tranCode)throws Exception{
		
		Purchase purchase = purchaseService.getPurchase2(prodNo);
		purchase.setTranCode(tranCode);
		
		purchaseService.updateTranCode(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase", purchase);
		modelAndView.setViewName("redirect:/product/listProduct?menu=manage");
		
		return modelAndView;
	}
} 
