package fa.training.movietheater_mockproject.service.impl;

import fa.training.movietheater_mockproject.model.entity.RoomType;
import fa.training.movietheater_mockproject.repository.RoomTypeRepository;
import fa.training.movietheater_mockproject.service.RoomTypeService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class RoomTypeServiceImpl implements RoomTypeService {
    private final RoomTypeRepository roomTypeRepository;
    @Override
    public List<RoomType> getAllListRoomType() {
        return (List<RoomType>) roomTypeRepository.findAll();
    }
    @Override
    public List<RoomType> getAll() {
        return (List<RoomType>) roomTypeRepository.findAll();
    }

    @Override
    public RoomType getRoomTypeById(Long id) {
        return roomTypeRepository.findById(id).get();
    }
    @Override
    public Optional<RoomType> findById(Long id) {
        return roomTypeRepository.findById(id);
    }
}
