package lasolutions.stockmanagement.Vendor;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface VendorRepository extends JpaRepository<VendorModel, String> {

    String getVendors = "SELECT vendor_id, vendor_type, company_name, company_name_khmer, title, first_name, last_name, contact, phone, email, website, address_detail, remark, inactive FROM tbl_vendors";

    @Query(value = getVendors, nativeQuery = true)
    List<VendorModel> getVendors();

    String getVendorById = "SELECT vendor_id, vendor_type, company_name, company_name_khmer, title, first_name, last_name, contact, phone, email, website, address_detail, remark, inactive FROM tbl_vendors WHERE vendor_id= :vendor_id";

    @Query(value = getVendorById, nativeQuery = true)
    VendorModel getVendorById(@Param("vendor_id") String vendor_id);

    String getVendorId = "SELECT CONCAT('V-' , LPAD(RIGHT(MAX(vendor_id),3) + 1,3,0)) as vendor_id FROM tbl_vendors";

    @Query(value = getVendorId, nativeQuery = true)
    String getVendorId();
}
