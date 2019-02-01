package security.core.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import security.core.model.User;
import security.core.repo.UserRepository;

@Service
public class MyUserDetailsService implements UserDetailsService {

	@Autowired
	private UserRepository userRepo;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {

		User user = userRepo.findByUserName(userName);
		if (user == null) {
			throw new UsernameNotFoundException(userName);
		}

		List<GrantedAuthority> listaDeAutoridades = new ArrayList<GrantedAuthority>();
		user.getRoles().forEach(autoridade -> {
			listaDeAutoridades.add(new SimpleGrantedAuthority("ROLE_" + autoridade));
		});

		return org.springframework.security.core.userdetails.User.builder().username(user.getUsername()).password(user.getPassword()).authorities(listaDeAutoridades).build();
	}

}
