package dao;

import java.util.List;

import model.Item;
import model.Order;
import model.OrderDTO;

public interface OrderDAO {
	
    // OrderDTO
    List<OrderDTO> getAllOrders();
    List<OrderDTO> getOrdersByUserId(int id); // lấy nhiều order
    // Order details
    int addOrder(Order order);
    List<Item> getOrderByOrderId(int id); // lấy nhiều item của 1 order
    int countOrders(); // dem so luong order cua he thong
    boolean updateOrderStatus(int id, int status); // cap nhat trang thai thanh toan

}
