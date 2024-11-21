package org.example.useraccess.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "requests")
public class Request {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "software_id", nullable = false)
    private Software software;

    @Column(nullable = false)
    private String accessType;

    @Column(nullable = false)
    private String reason;

    @Column(nullable = false)
    private String status;

    // Getters and Setters
}


