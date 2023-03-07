CREATE OR REPLACE FUNCTION add_item_trigger()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS $$
BEGIN
	UPDATE product.products
	SET quantity=quantity+1
	WHERE product_id=NEW.product_id;
	RETURN NEW;
END;
$$;

CREATE TRIGGER add_item
  AFTER INSERT
  ON product.items
  FOR EACH ROW
  EXECUTE PROCEDURE add_item_trigger();
  
DROP FUNCTION IF EXISTS add_order_details_trigger CASCADE ;
CREATE OR REPLACE FUNCTION add_order_details_trigger()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS $$
BEGIN
	--update item
	UPDATE product.items
	SET availability= FALSE
	WHERE serial_code=NEW.serial_code;

	
	--update order
	UPDATE sales.orders
	SET  total_amount=total_amount+(SELECT (p.list_price +c.extra_charge-o.discount)
								   FROM product.products p 
								   JOIN product.items i ON p.product_id=i.product_id
								   JOIN product.config c ON c.config_id=i.config_id 
								   JOIN sales.order_details o ON o.serial_code=i.serial_code
								   WHERE i.serial_code= NEW.serial_code) 
	WHERE order_id=NEW.order_id;
	
	
	RETURN NEW;
END;
$$;


CREATE TRIGGER add_order_details
  AFTER INSERT
  ON sales.order_details
  FOR EACH ROW
  EXECUTE PROCEDURE add_order_details_trigger();  
  
  
DROP FUNCTION IF EXISTS delete_order_details_trigger CASCADE ;
CREATE OR REPLACE FUNCTION delete_order_details_trigger()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS $$
BEGIN
	--update item
	UPDATE product.items
	SET availability= TRUE
	WHERE serial_code=OLD.serial_code;
	
	--update order
	UPDATE sales.orders
	SET  total_amount=total_amount-(SELECT (p.list_price +c.extra_charge-o.discount)
								   FROM product.products p 
								   JOIN product.items i ON p.product_id=i.product_id
								   JOIN product.config c ON c.config_id=i.config_id 
								   JOIN sales.order_details o ON o.serial_code=i.serial_code
								   WHERE i.serial_code= OLD.serial_code) 
	WHERE order_id=OLD.order_id;
	
	RETURN OLD;
	
	
END;
$$;

CREATE TRIGGER delete_order_details
  AFTER DELETE
  ON sales.order_details
  FOR EACH ROW
  EXECUTE PROCEDURE delete_order_details_trigger(); 
  
CREATE OR REPLACE FUNCTION delete_order_trigger()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS $$
BEGIN
	DELETE 
	FROM sales.order_details
	WHERE order_id=OLD.order_id;
	RETURN OLD;
	
	
END;
$$;

CREATE TRIGGER delete_order
  BEFORE DELETE
  ON sales.orders
  FOR EACH ROW
  EXECUTE PROCEDURE delete_order_trigger(); 
  
