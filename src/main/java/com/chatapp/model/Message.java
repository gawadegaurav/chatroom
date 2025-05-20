package com.chatapp.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "messages")
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String sender;
    private String content;
    private String roomName;

    @Temporal(TemporalType.TIMESTAMP)
    private Date timestamp = new Date();

    // Getters and Setters
}
