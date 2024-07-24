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
}
