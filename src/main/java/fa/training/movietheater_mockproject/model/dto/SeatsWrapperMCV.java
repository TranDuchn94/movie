package fa.training.movietheater_mockproject.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class SeatsWrapperMCV {
    private List<SeatDtoMCV> seatDtoMCVList;
    private Integer row;
    private Integer column;

    public SeatsWrapperMCV(List<SeatDtoMCV> seatDtoMCVList, Integer row, Integer column) {
        this.seatDtoMCVList = seatDtoMCVList;
        this.row = row;
        this.column = column;
    }
}
