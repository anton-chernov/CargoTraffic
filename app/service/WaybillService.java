package service;


import models.ProductInWaybill;
import models.User;
import models.Vehicle;
import models.Waybill;
import play.Logger;
import play.db.jpa.JPA;
import play.mvc.Http;
import repository.UserRepository;
import repository.VehicleRepository;
import repository.WaybillRepository;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by Maxim on 2/16/2016.
 */
public class WaybillService {
    private static final Logger.ALogger LOGGER = Logger.of(WaybillService.class);

    @Inject
    private WaybillRepository waybillRepository;
    @Inject
    private VehicleRepository vehicleRepository;
    @Inject
    private UserRepository userRepository;

    public Waybill getWaybill(long id) throws ServiceException {
        LOGGER.debug("API get waybill: {}", id);
        try {
            return JPA.withTransaction(() -> {
                User user = (User) Http.Context.current().args.get("user");
                return WaybillRepository.getWaybill(id, user.company.id);
            });
        } catch (Throwable throwable) {
            LOGGER.error("Get packingList error: {}", throwable);
            throw new ServiceException(throwable.getMessage(), throwable);
        }
    }

    public List<Vehicle> getVehicles() throws ServiceException {

        try {
            return JPA.withTransaction(() -> {
                User user = (User) Http.Context.current().args.get("user");
                LOGGER.debug("API get list of vehicles for: {}", user.company.id);
                return vehicleRepository.getVehicles(1, Integer.MAX_VALUE, true, user.company.id);
            });
        } catch (Throwable throwable) {
            LOGGER.error("Get packingList error: {}", throwable);
            throw new ServiceException(throwable.getMessage(), throwable);
        }
    }

    public List<User> getDrivers(long companyId) throws ServiceException {
        try {
            LOGGER.error("Get drivers for company {}",companyId);
            return JPA.withTransaction(() -> userRepository.getDrivers(companyId));
        } catch (Throwable throwable) {
            LOGGER.error("Get drivers in WaybillService error = {}", throwable);
            throw new ServiceException(throwable.getMessage(), throwable);
        }
    }

    public void addWaybill(Waybill waybill) throws ServiceException {
        try {
            JPA.withTransaction(() -> waybillRepository.saveWaybill(waybill));
        } catch (Throwable throwable) {
            LOGGER.error("Add packing list with id = {}", waybill.id);
            throw new ServiceException(throwable.getMessage(), throwable);
        }
    }

    public List<ProductInWaybill> getProducts() throws ServiceException {
        LOGGER.debug("Get products of waybill");
        User user = (User) Http.Context.current().args.get("user");
        try {
            return JPA.withTransaction(() -> {
                System.out.println("::"+user);
                Waybill waybill = waybillRepository.getWaybillByDriver(user);
                System.out.println("::"+waybill);
                return waybillRepository.getWaybillProducts(waybill);
            });
        } catch (Throwable throwable) {
            LOGGER.error("Get products of waybill error: {}", throwable);
            throw new ServiceException(throwable.getMessage(), throwable);
        }
    }

}
