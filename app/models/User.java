package models;

import be.objectify.deadbolt.core.models.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
import play.data.validation.Constraints;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Anton Chernov on 12/26/2015.
 */

@Entity
@Table(name = "user")
public class User implements Subject {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long id;

    @ManyToOne
    public Company company;

    @OneToOne(cascade = CascadeType.ALL)
    public Address address;

    @Constraints.Required
    public String username;

    public String name;

    @Constraints.Required
    public String surname;

    @Constraints.Required
    public String password;

    public String patronymic;

    @Constraints.Required
    public String email;

    public String birthday;

    public Boolean deleted;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name="user_role",
    joinColumns =
            {@JoinColumn(name="user_id")},
    inverseJoinColumns =
            {@JoinColumn(name="role_id")})
   // @Constraints.Required
    public List<UserRole> userRoleList;

    @Override
    public List<UserRole> getRoles() {
        return userRoleList;
    }

    public void setRoles(List<UserRole> userRoleList) {
        this.userRoleList = userRoleList;
    }

    @JsonIgnore
    @Override
    public List<? extends Permission> getPermissions() {
        return null;
    }

    @JsonIgnore
    @Override
    public String getIdentifier() {
        return null;
    }


    @Override
    public String toString() {
        return username;
    }
}
