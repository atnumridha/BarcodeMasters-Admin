package com.anup.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.anup.entity.GenericTemp;

public interface GenericTempRepository extends JpaRepository<GenericTemp, Long> {
	
	@Transactional
	@Modifying
	@Query(value = "update xx_generic_labels_temp set printed_flag = '1' where container_id = ?1", nativeQuery = true)
	void setPrintedFlag(String contId);

}
