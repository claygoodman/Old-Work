DECLARE @OrdNum INT = 487200

SELECT DISTINCT OH.ord_hdrnumber, s.stp_type, OFR.fgt_number,FC.fbc_tank_nbr, FC.fbc_id
 FROM orderheader OH 
INNER JOIN stops S ON OH.ord_hdrnumber = s.ord_hdrnumber
INNER JOIN OilFieldReadings OFR 
INNER JOIN freightdetail F ON OFR.fgt_number = F.fgt_number
INNER JOIN company_tankdetail C ON OFR.inv_tankID = C.cmp_tank_id AND OFR.cmp_id = C.cmp_id
INNER JOIN freight_by_compartment FC ON F.fgt_number = FC.fgt_number
ON OH.ord_hdrnumber = OFR.ord_hdrnumber
WHERE OH.ord_hdrnumber = @OrdNum

--DELETE freight_by_compartment WHERE fbc_id = 3805211