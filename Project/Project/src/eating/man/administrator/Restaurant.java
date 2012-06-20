package eating.man.administrator;

public class Restaurant {
	private int restaurantId;
	private String restaurantName;
	Restaurant(int restaurantId,String restaurantName)
	{
		this.restaurantId = restaurantId;
		this.restaurantName = restaurantName;
	
	}
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	

}
