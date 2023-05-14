CREATE PROCEDURE summary_order_status
(@StatusID int) AS
BEGIN
	SELECT
		salesOr.OrderID,
		cust.CustomerName,
		prod.ProductName,
		salesOr.Quantity,
		statOr.StatusOrder
	FROM FactSalesOrder salesOr
	JOIN DimCustomer cust ON (salesOr.CustomerID = cust.CustomerID)
	JOIN DimProduct prod ON (salesOr.ProductID = prod.ProductID)
	JOIN DimStatusOrder statOr ON (salesOr.StatusID = statOr.StatusID)
	WHERE statOr.StatusID = @StatusID
END

--exec summary_order_status @StatusID = 1



