package fa.training.movietheater_mockproject.service;

import fa.training.movietheater_mockproject.model.entity.TypeSeat;

import java.util.List;
import java.util.Optional;

public interface TypeSeatService {
    TypeSeat getTypeSeatById(Long id);

    List<TypeSeat> getAll();

    Optional<TypeSeat> findById(Long id);
}
