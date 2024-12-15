package org.kong.chatbotservice.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Immutable;

/**
 * Mapping for DB view
 */
@Getter
@Setter
@Entity
@Immutable
@Table(name = "embedding_data_v2")
public class Journey {
    @Id
    @Column(name = "journey_id", nullable = false)
    private Integer journeyId;

    @Lob
    @Column(name = "schedule")
    private String schedule;

    @Lob
    @Column(name = "details_address")
    private String detailsAddress;

}