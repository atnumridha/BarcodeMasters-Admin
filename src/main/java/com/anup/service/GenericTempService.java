package com.anup.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anup.entity.Generic;
import com.anup.entity.GenericTemp;
import com.anup.entity.IPAddress;
import com.anup.repository.GenericRepository;
import com.anup.repository.GenericTempRepository;
import com.anup.repository.IPAddressRepository;

@Service
public class GenericTempService {

	@Autowired
	private GenericTempRepository genericTempRepository;

	@Autowired
	private GenericRepository genericRepository;

	@Autowired
	private IPAddressRepository addressRepository;

	public List<String> getAllAddress() {
		return addressRepository.allIP();
	}

	public String getAllDefIp() {
		return addressRepository.myBaseIp();
	}
	
	public int getAllDefPort() {
		return addressRepository.defaultPort();
	}

	public List<Generic> findAllByGenericTemp() {
		return genericRepository.findAllGenericTempByDesc();

	}

	public void deleteAll() {
		genericTempRepository.deleteAllInBatch();
	}

	public String getRandomContainer() {
		return genericRepository.randomContainer();
	}

	@Transactional
	public void save(GenericTemp g) {
		genericTempRepository.save(g);
	}

	@Transactional
	public void setPrinterByUser(String user,String bType, String ip) {
		addressRepository.setPrinterByUser(user, bType, ip);
	}

	public String findIPByUser(String user) {
		return addressRepository.ipByUser(user);
	}

	public int findPortByUser(String user, String ip) {
		return addressRepository.portByUser(user, ip);
	}

	@Transactional
	public void savePrinter(IPAddress address) {
		addressRepository.save(address);
	}

	@Transactional
	public void updateUserForPrinter(String user) {
		addressRepository.setPrinterBeforeUse(user);
	}

	public void deletePrinter(String ip) {
		int id = addressRepository.myId(ip);
		addressRepository.delete(id);
	}
}
