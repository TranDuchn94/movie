package fa.training.movietheater_mockproject.service;

import fa.training.movietheater_mockproject.model.entity.RoomType;

import java.util.List;
import java.util.Optional;

public interface RoomTypeService {
    List<RoomType> getAllListRoomType();
    RoomType getRoomTypeById(Long id);
    List<RoomType> getAll();
    Optional<RoomType> findById(Long id);
}
