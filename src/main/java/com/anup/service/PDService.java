package com.anup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.anup.entity.IPAddress;
import com.anup.entity.PickDirective;
import com.anup.repository.FacilityRepository;
import com.anup.repository.IPAddressRepository;
import com.anup.repository.PDRepository;

import fr.w3blog.zpl.model.ZebraUtils;
import lombok.Getter;
import lombok.Setter;

@Service
@Getter
@Setter
public class PDService {

	@Autowired
	private PDRepository repository;
	
	@Autowired
	private IPAddressRepository ipr;

	@Autowired
	private GenericTempService genericTempService;

	@Autowired
	private BarcodeService service;

	@Autowired
	private FacilityRepository facilityRepo;

	private List<IPAddress> addresses;

	private List<PickDirective> myList;

	public String username;

	public int port;

	@Autowired
	private GenericTempService gts;

	private String address;

	public List<PickDirective> getAllPicks() {

		return repository.findAllByDesc();

	}

	//@PostConstruct
	@Scheduled(initialDelay =1200000, fixedDelay = 1200000)
	@Transactional
	public void init() {

		address = gts.getAllDefIp();

		port = gts.getAllDefPort();

		System.out.println("The IP address and user is :" + address + "----" + ipr.defaultUser());

		String zpl = service.getLabelType("Picking",ipr.defaultUser());

		myList = getAllPicks();

		// List<String> containers = repository.findAllCont();

		System.out.println("Size of PickList is : " + myList.size());

		for (PickDirective p : myList) {

			zpl = zpl.replace("$$CONT", p.getPICK_TO_CONTAINER_ID());

			zpl = zpl.replace("$$Wave", p.getWAVE_NBR());

			zpl = zpl.replace("$$Distro", p.getDISTRO_NBR());

			zpl = zpl.replace("$$Location", p.getPICK_FROM_CONTAINER_ID());

			zpl = zpl.replace("$$PT", p.getPICK_TYPE());

			zpl = zpl.replace("$$DEST", p.getDEST_ID());

			zpl = zpl.replace("$$ZONE", p.getZONE());

			System.out.println("The Zpl File is:");
			System.out.println(zpl);

			// updating pick directive
			repository.setPickDirectiveByContainer(p.getPICK_TO_CONTAINER_ID());

			System.out.println("List of values are: " + p.getITEM_ID() + "--" + p.getPICK_TO_CONTAINER_ID());

			try {
				ZebraUtils.printZpl(zpl, address, port);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
