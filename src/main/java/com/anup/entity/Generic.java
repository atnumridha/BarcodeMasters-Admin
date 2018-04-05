package com.anup.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;

@Entity(name = "xx_generic_labels")
@Getter
@Setter
public class Generic {

	@Id
	@Column(name = "PRINT_LABEL_GROUP_NBR")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long printGroupLabelNbr;

	@Column(name = "FACILITY_ID")
	@NotEmpty
	private String facilityId;

	@Column(name = "CONTAINER_ID")
	@NotEmpty(message="Container Id field cannot be null")
	@NotNull(message="Container Id cannot be null")
	private String containerId;
	
	@Column(name="Printed_Flag")
	private int printedFlag;

	public Generic() {

	}

	@Override
	public String toString() {
		return getContainerId();
	}

}
