package fa.training.movietheater_mockproject.model.dto;

import fa.training.movietheater_mockproject.model.entity.Category;
import fa.training.movietheater_mockproject.model.entity.Movie;
import fa.training.movietheater_mockproject.model.entity.MovieFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import org.w3c.dom.stylesheets.LinkStyle;

import java.time.LocalTime;
import java.util.List;
import java.util.Objects;

@Data
public class ScheduleDto implements Comparable<ScheduleDto> {
    private Long scheduleId;
    private Long movieId;
    private Movie movie;
    private Long movieFormatId;
    @DateTimeFormat(pattern = "HH:mm")
    private LocalTime startAt;
    @DateTimeFormat(pattern = "HH:mm")
    private LocalTime endAt;
    private String statusEdit = "AVAILABLE EDIT";

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ScheduleDto that = (ScheduleDto) o;
        return scheduleId.equals(that.scheduleId) && movieId.equals(that.movieId) && movie.equals(that.movie) && movieFormatId.equals(that.movieFormatId) && startAt.equals(that.startAt) && endAt.equals(that.endAt) && statusEdit.equals(that.statusEdit);
    }

    @Override
    public int hashCode() {
        return Objects.hash(scheduleId, movieId, movie, movieFormatId, startAt, endAt, statusEdit);
    }

    @Override
    public int compareTo(ScheduleDto o) {
        return this.startAt.compareTo(o.startAt);
    }
}
