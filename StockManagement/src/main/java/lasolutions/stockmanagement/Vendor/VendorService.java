package lasolutions.stockmanagement.Vendor;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface VendorService {
    public List<VendorModel> getVendors();

    public VendorModel getVendorById(String vendor_id);

    public String getVendorId();
}

