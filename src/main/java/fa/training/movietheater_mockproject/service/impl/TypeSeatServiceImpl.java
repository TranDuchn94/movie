package fa.training.movietheater_mockproject.service.impl;

import fa.training.movietheater_mockproject.model.entity.TypeSeat;
import fa.training.movietheater_mockproject.repository.TypeSeatRepository;
import fa.training.movietheater_mockproject.service.TypeSeatService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class TypeSeatServiceImpl implements TypeSeatService {
    private final TypeSeatRepository typeSeatRepository;
    @Override
    public List<TypeSeat> getAll() {
        return (List<TypeSeat>) typeSeatRepository.findAll();
    }

    @Override
    public Optional<TypeSeat> findById(Long id) {
        return typeSeatRepository.findById(id);
    }
    @Override
    public TypeSeat getTypeSeatById(Long id) {
        return typeSeatRepository.findById(id).get();
    }
}
