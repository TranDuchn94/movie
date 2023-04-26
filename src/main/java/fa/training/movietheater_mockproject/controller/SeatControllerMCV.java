package fa.training.movietheater_mockproject.controller;

import fa.training.movietheater_mockproject.exception.ResourceNotFound;
import fa.training.movietheater_mockproject.model.dto.SeatDtoMCV;
import fa.training.movietheater_mockproject.model.dto.SeatsWrapperMCV;
import fa.training.movietheater_mockproject.model.entity.*;
import fa.training.movietheater_mockproject.service.*;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@AllArgsConstructor
@RequestMapping("/admin/seat")
public class SeatControllerMCV {
    private final TypeSeatService typeSeatService;
    private final RoomTypeService roomTypeService;
    private final RoomService roomService;
    private final SeatService seatService;
    private final CityService cityService;
    private final CinemaService cinemaService;
    @ModelAttribute
    void ListCityAndCinema(Model model){
        model.addAttribute("cities",cityService.getAll());
    }
    @GetMapping
    String listSeat(@RequestParam(name = "cityId",required = false) Long cityId,
                    @RequestParam(name = "cinemaId",required = false) Long cinemaId,
                    Model model){
        if(cityId != null){
            Optional<City> city = cityService.findById(cityId);
            if (city.isEmpty()) throw new ResourceNotFound("Have not city id: "+ city);
            model.addAttribute("cinemas", cinemaService.getCinemaByCity(city.get()));
            model.addAttribute("cityId",cityId);
        }
        if(cinemaId != null){
            Cinema cinema = cinemaService.getCinemaById(cinemaId);
            if (cinema == null) throw new ResourceNotFound("Have not cinema id: "+ cinemaId);
            model.addAttribute("rooms", roomService.findByCinema(cinema));
            model.addAttribute("cinemaId",cinemaId);
        }

        return "seats/seat-list";
    }
    @GetMapping("/add/{roomId}")
    public String seatForm(Model model,
                           @PathVariable(name = "roomId") Long roomId){
        Optional<Room> room = roomService.getRoomById(roomId);
        if(room.isEmpty()){
            throw new ResourceNotFound("can not find room with id: "+ roomId );
        }
        if(room.get().getSeatQuantity() != null){
            return "redirect:/admin/seat/update/"+ roomId;
        }
        RoomType roomType = roomTypeService.findById(room.get().getRoomType().getRoomTypeId()).get();
        List<SeatDtoMCV> seatDtoMCVLists = new ArrayList<>();
        for(int i = 0; i < roomType.getNumberHorizontalColumnSeats() * roomType.getNumberHorizontalRowSeats(); i++){
            SeatDtoMCV seatDtoMCV = new SeatDtoMCV();
            seatDtoMCV.setRoomId(roomId);
            seatDtoMCV.setTypeSeatId(1L);
            seatDtoMCVLists.add(seatDtoMCV);
        }
        System.out.println(roomType.getNumberHorizontalColumnSeats() * roomType.getNumberHorizontalRowSeats());
        model.addAttribute("seatWrapper",
                                        new SeatsWrapperMCV(seatDtoMCVLists,
                                                        roomType.getNumberHorizontalRowSeats(),
                                                        roomType.getNumberHorizontalColumnSeats()));
        return "seats/seat-form";
    }
    @PostMapping("/add/{roomId}")
    public String addSeat(@PathVariable(name = "roomId") Long id,
                          SeatsWrapperMCV seatsWrapperMCV){

        Optional<Room> roomOptional = roomService.getRoomById(id);
        if(roomOptional.isEmpty()) throw new ResourceNotFound("can not find room with: "+ id);
        for(SeatDtoMCV seatDtoMCV : seatsWrapperMCV.getSeatDtoMCVList()){
            Seat seat = new Seat();
            BeanUtils.copyProperties(seatDtoMCV,seat);
            Optional<TypeSeat> typeSeat = typeSeatService.findById(seatDtoMCV.getTypeSeatId());
            if(typeSeat.isEmpty()) throw new ResourceNotFound("can not find type seat with id: "+ seatDtoMCV.getTypeSeatId());
            seat.setRoom(roomOptional.get());
            seat.setTypeSeat(typeSeat.get());
            seatService.save(seat);
        }
        Room room = roomOptional.get();
        room.setSeatQuantity(seatsWrapperMCV.getSeatDtoMCVList().size());
        roomService.saveRoom(room);
        return "seats/seat-list";
    }
    @GetMapping("/update/{roomId}")
    public String updateFormSeat(@PathVariable(name = "roomId") Long id,
                                 Model model){

        Optional<Room> roomOptional = roomService.getRoomById(id);
        if(roomOptional.isEmpty()) throw new ResourceNotFound("can not find room with: "+ id);
        if(roomOptional.get().getSeatQuantity() == null){
            return "redirect:/admin/seat/add/" + id;
        }
        RoomType roomType = roomTypeService.findById(roomOptional.get().getRoomType().getRoomTypeId()).get();

        List<SeatDtoMCV> seatDtoMCVLists = new ArrayList<>();
        List<Seat> seats = seatService.getAll(roomOptional.get());

        for(Seat seat : seats){
            int i = 0;
            SeatDtoMCV seatDtoMCV = new SeatDtoMCV();
            BeanUtils.copyProperties(seat, seatDtoMCV);
            seatDtoMCV.setTypeSeatId(seat.getTypeSeat().getTypeSeatId());
            seatDtoMCV.setRoomId(roomOptional.get().getRoomId());
            seatDtoMCVLists.add(seatDtoMCV);
        }
        model.addAttribute("seatWrapper",
                new SeatsWrapperMCV(seatDtoMCVLists,
                        roomType.getNumberHorizontalRowSeats(),
                        roomType.getNumberHorizontalColumnSeats()));
        model.addAttribute("update","update");
        return "seats/seat-form";
    }
    @PostMapping("/update/{roomId}")
    public String updateSeat(@PathVariable(name = "roomId") Long id,
                             SeatsWrapperMCV seatsWrapperMCV,
                             RedirectAttributes redirectAttributes){
        Optional<Room> roomOptional = roomService.getRoomById(id);
        if(roomOptional.isEmpty()) throw new ResourceNotFound("can not find room with: "+ id);

        for(SeatDtoMCV seatDtoMCV : seatsWrapperMCV.getSeatDtoMCVList()){
            Seat seat = new Seat();
            BeanUtils.copyProperties(seatDtoMCV,seat);

            Optional<TypeSeat> typeSeat = typeSeatService.findById(seatDtoMCV.getTypeSeatId());
            if(typeSeat.isEmpty()) throw new ResourceNotFound("can not find type seat with id: "+ seatDtoMCV.getTypeSeatId());

            seat.setRoom(roomOptional.get());
            seat.setTypeSeat(typeSeat.get());

            seatService.save(seat);
        }
        redirectAttributes.addFlashAttribute("result","update seats success");
        return "redirect:/admin/seat";
    }
}
