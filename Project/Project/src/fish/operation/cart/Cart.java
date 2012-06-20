package fish.operation.cart;

import java.util.*;

public class Cart {
	private List<Item> cartlist ;
	
	public Cart()
	{
		cartlist = new LinkedList<Item>() ;
	}

	public List<Item> getCart() {
		return cartlist;
	}

	public void setCart(List<Item> cart) {
		this.cartlist = cart;
	}
	

}
