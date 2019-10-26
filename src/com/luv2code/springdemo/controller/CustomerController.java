package com.luv2code.springdemo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.luv2code.springdemo.entity.Customer;
import com.luv2code.springdemo.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	// need to inject our customer service
	@Autowired
	private CustomerService customerService;

	@GetMapping("/list")
	public String listCustomers(Model theModel) {
		
		/* browser will make a GetRequest to http://localhost:8080/web-customer-tracker/customer/list when it's hit
		 * spring mvc will grab the data from DAO and inject into the html
		 * then it will send everything html and data into the body of the response to be loaded by the browser
		 */
		
		// get customer from the DAO
		List<Customer> theCustomers = customerService.getCustomers();
		
		// add the customer to the model
		theModel.addAttribute("customers", theCustomers);
		
		return "list-customers";
	}
	
	
	/*
	 * When we set Model theModel as a parameter, this means we're making a two way bind between view and the controller
	 * 
	 */
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		
		// create model attribute to bind form data
		Customer theCustomer = new Customer();
		
		theModel.addAttribute("customer", theCustomer);
		
		return "customer-form";
	}
	
	
	/*
	 * When we see the annotation @ModelAttribute as a parameter, this means that the view is sending the controller data.
	 * 
	 */
	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customer") Customer theCustomer) {
		
		// save the customer using our service
		customerService.saveCustomer(theCustomer);
		
		return "redirect:/customer/list";
	}
	
	/*
	 * @RequestParam means we are receiving data via the URL
	 * In this case when the user clicks the Update link, they are essentially hitting below end point
	 * http://localhost:8080/web-customer-tracker/customer/showFormForUpdate?customerId=3
	 * So this controller grabs the customerId = 3
	 * 
	 * Since we also have Model theModel as a second paratemer, this means that we are binding data to the view.
	 * So when the user clicks the update, the form will be pre-populated through the model we have created.
	 * 
	 */
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("customerId") int theId, Model theModel) {
		
		// get the customer from the service
		Customer theCustomer = customerService.getCustomer(theId);
		
		// set customer as a model attribute to pre-populate the form
		theModel.addAttribute("customer",theCustomer);
		
		// send over to our form
		return "customer-form";
	}
	
	@GetMapping("/delete")
	public String showFormForUpdate(@RequestParam("customerId") int theId) {
		
		// get the customer from the service
		Customer theCustomer = customerService.getCustomer(theId);
		
		customerService.delete(theCustomer);
		
		// send over to our form
		return "redirect:/customer/list";
	}

	
	
}
