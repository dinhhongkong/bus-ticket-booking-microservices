package org.kong.managementservice.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Value;

import java.io.Serializable;

/**
 * DTO for {@link org.kong.managementservice.entity.Bus}
 */
@Value
public class BusDto implements Serializable {
    Integer id;
    @NotNull
    @Size(max = 20)
    String licensePlates;
    Byte status;
    Integer typeId;
    String typeName;
}