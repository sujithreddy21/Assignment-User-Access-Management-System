package org.example.useraccess.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "software")
public class Software {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String description;

    @Column(name = "access_levels")
    private String accessLevels;

    // Getters and Setters
}


