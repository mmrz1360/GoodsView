CREATE view [dbo].[GoodsView]
as
SELECT
IFMV.ItemID,
IFMV.Name,
IFMV.Barcode,
IFMV.StatusID,
IFMV.DepartmentID,
IFMV.UnitOfMeasureID,
IFMV.TaxGroupID,
IFMV.SupplierID,
ICT.BoxCount,
ISSV.AllowRecieve
FROM
ItemForMobileView IFMV
LEFT JOIN ItemCustomField ICT
ON IFMV.ItemID = ICT.ItemID
LEFT JOIN ItemStockStateView ISSV
ON IFMV.ItemID = ISSV.ItemID
WHERE LanguageID = '315'
AND ISSV.StockID = '2796753F-E584-4D51-BF21-4F38CFC155FD'
AND ISSV.AllowRecieve = '1'
AND IFMV.SupplierID IS NOT NULL
AND ICT.BoxCount IS NOT NULL
AND ISNUMERIC(Barcode)=1
GO