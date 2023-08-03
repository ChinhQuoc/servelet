package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "productManagement", urlPatterns = { "/product-manage" })
public class ProductManagement extends HttpServlet {
	List<Product> list = new ArrayList<Product>();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("productmanagement.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");

		try {
			String name = (String) req.getParameter("productName");
			int quantity = Integer.parseInt(req.getParameter("quantity"));
			double price = Double.parseDouble(req.getParameter("price"));

			Product product = new Product(name, quantity, price);
			list.add(product);
			req.setAttribute("listProduct", list);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}

		req.getRequestDispatcher("productmanagement.jsp").forward(req, resp);
	}
}
