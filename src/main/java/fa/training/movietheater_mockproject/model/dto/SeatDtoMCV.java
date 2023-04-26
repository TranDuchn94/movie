package fa.training.movietheater_mockproject.model.dto;

import lombok.Data;

@Data
public class SeatDtoMCV {
    private Long seatId;
    private String seatName;
    private Long roomId;
    private Long typeSeatId;
}
