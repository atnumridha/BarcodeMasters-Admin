package com.anup.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.anup.entity.Generic;

public interface GenericRepository extends JpaRepository<Generic, Long> {

	//List<Generic> findByContainerIdContainingIgnoreCase(String containerId);
	
	@Query(value = "SELECT * from xx_generic_labels c where UPPER(c.container_id) LIKE %?1% OR LOWER(c.container_id) LIKE %?1% ORDER BY 1 DESC", nativeQuery = true)
	List<Generic> findByContainerIdContainingIgnoreCase(String containerId);

	@Query(value = "SELECT c.container_id from xx_generic_labels c where c.container_id = ?1", nativeQuery = true)
	String isContainerIdExist(String containerId);

    //@Query(value = "select '10000' || RANDOM_CONTAINER_SEQ.nextval from dual", nativeQuery = true) 
	@Query(value = "SELECT nextval('my_sequence')", nativeQuery = true) 
	String randomContainer();

	@Query(value = "SELECT * from xx_generic_labels ORDER BY 1 DESC", nativeQuery = true)
	List<Generic> findAllByDesc();

	@Query(value = "SELECT * from xx_generic_labels_temp ORDER BY 1 DESC", nativeQuery = true)
	List<Generic> findAllGenericTempByDesc();
	
	@Transactional
	@Modifying
	@Query(value = "update xx_generic_labels set printed_flag = '1' where container_id = ?1", nativeQuery = true)
	void setPrintedFlag(String contId);
}
