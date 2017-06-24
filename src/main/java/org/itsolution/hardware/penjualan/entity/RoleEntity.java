package org.itsolution.hardware.penjualan.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.itsolution.hardware.penjualan.entity.base.BasisEntity;

@Entity
@Table(name = "master_role")
public class RoleEntity extends BasisEntity implements Serializable {

  private static final long serialVersionUID = 1L;

	private String name;

	@OneToMany(mappedBy = "role")
	private List<UserEntity> users;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<UserEntity> getUsers() {
		return users;
	}

	public void setUsers(List<UserEntity> users) {
		this.users = users;
	}

}
