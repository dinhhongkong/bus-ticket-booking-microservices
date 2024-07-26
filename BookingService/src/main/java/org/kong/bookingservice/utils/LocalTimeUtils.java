package org.kong.bookingservice.utils;

import java.time.Duration;
import java.time.LocalTime;

public class LocalTimeUtils {
    public static LocalTime plusStringAndLocalTime(String timeString, LocalTime localTime) {
        String[] parts = timeString.split(":");
        int hours = Integer.parseInt(parts[0]);
        int minutes = Integer.parseInt(parts[1]);
        int seconds = Integer.parseInt(parts[2]);
        Duration duration = Duration.ofHours(hours).plusMinutes(minutes).plusSeconds(seconds);
        return localTime.plus(duration);
    }
    public static LocalTime minusLocalTimeAndString( LocalTime localTime, String timeString) {
        String[] parts = timeString.split(":");
        int hours = Integer.parseInt(parts[0]);
        int minutes = Integer.parseInt(parts[1]);
        int seconds = Integer.parseInt(parts[2]);
        Duration duration = Duration.ofHours(hours).plusMinutes(minutes).plusSeconds(seconds);
        return localTime.minus(duration);
    }

    public static LocalTime plusLocalTimes(LocalTime firstTime, LocalTime secondTime) {
        int hours = firstTime.getHour() + secondTime.getHour();
        int minutes = firstTime.getMinute() + secondTime.getMinute();
        int seconds = firstTime.getSecond() + secondTime.getSecond();
        return LocalTime.of(hours % 24, minutes % 60, seconds % 60);
    }

    public static LocalTime minusLocalTimes(LocalTime firstTime, LocalTime secondTime) {
        int hours = firstTime.getHour() - secondTime.getHour();
        int minutes = firstTime.getMinute() - secondTime.getMinute();
        int seconds = firstTime.getSecond() - secondTime.getSecond();

        if (seconds < 0) {
            seconds += 60;
            minutes -= 1;
        }
        if (minutes < 0) {
            minutes += 60;
            hours -= 1;
        }
        if (hours < 0) {
            hours += 24;
        }

        return LocalTime.of(hours, minutes, seconds);
    }
}
