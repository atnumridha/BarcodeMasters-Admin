package com.anup.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.anup.entity.ASN;

public interface AsnRepository extends JpaRepository<ASN, String> {

	@Query(value = "select distinct container_id from asn_view a Where UPPER(a.asn_nbr) LIKE %?1% ", nativeQuery = true)
	List<String> findByASN(String asn);

	@Query(value = "select distinct * from asn_view a Where UPPER(a.asn_nbr) = %?1% OR LOWER(a.asn_nbr) LIKE %?1% ORDER BY CONTAINER_ID ASC", nativeQuery = true)
	List<ASN> findAllAsn(String asn);
	
	@Query(value = "select distinct * from asn_view a", nativeQuery = true)
	List<ASN> allASN();
	
	@Query(value = "select distinct a.asn_nbr from asn_view a Where UPPER(a.asn_nbr) LIKE %?1% OR LOWER(a.asn_nbr) LIKE %?1% ORDER BY ASN_NBR ASC", nativeQuery = true)
	List<String> allDistinctASN(String asn);
}
