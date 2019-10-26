package com.luv2code.springdemo.dao;

import java.util.List;

import com.luv2code.springdemo.entity.Customer;

public interface CustomerDAO {
	
	public List<Customer> getCustomers();

	public void save(Customer theCustomer);

	public Customer getCustomer(int theId);

	public void delete(Customer theCustomer);

}
