package fa.training.movietheater_mockproject.model.dto;

import fa.training.movietheater_mockproject.model.entity.Movie;
import lombok.Data;

import java.util.List;

@Data
public class PagingMovieWithFormat {
    private Integer pageNumber;
    private Integer size;
    private Integer totalPage;
    private String Keyword;
    private String sort;
    private List<Movie> movieWithFormatDtos;
}
