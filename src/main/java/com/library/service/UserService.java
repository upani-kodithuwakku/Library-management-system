package com.library.service;

import com.library.model.User;

import java.io.IOException;
import java.nio.file.*;
import java.util.ArrayList;
import java.util.List;

public class UserService {

    private Path getUserFilePath() throws IOException {
        String dataDir = System.getProperty("app.data.dir");

        if (dataDir == null || dataDir.isBlank()) {
            dataDir = Paths.get(System.getProperty("user.dir"), "data").toString();
        }

        Path directory = Paths.get(dataDir);
        Files.createDirectories(directory);

        Path userFile = directory.resolve("users.txt");

        if (!Files.exists(userFile)) {
            Files.createFile(userFile);
        }

        System.out.println("User data file path: " + userFile.toAbsolutePath());

        return userFile;
    }

    public boolean registerUser(User user) {
        try {
            if (isEmailExists(user.getEmail())) {
                return false;
            }

            Path userFile = getUserFilePath();

            Files.writeString(
                    userFile,
                    user.toFileString() + System.lineSeparator(),
                    StandardOpenOption.APPEND
            );

            return true;

        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User loginUser(String email, String password) {
        List<User> users = getAllUsers();

        for (User user : users) {
            if (user.getEmail().equalsIgnoreCase(email)
                    && user.getPassword().equals(password)
                    && user.getStatus().equalsIgnoreCase("ACTIVE")) {
                return user;
            }
        }

        return null;
    }

    public boolean isEmailExists(String email) {
        List<User> users = getAllUsers();

        for (User user : users) {
            if (user.getEmail().equalsIgnoreCase(email)) {
                return true;
            }
        }

        return false;
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();

        try {
            Path userFile = getUserFilePath();
            List<String> lines = Files.readAllLines(userFile);

            for (String line : lines) {
                if (!line.isBlank()) {
                    User user = User.fromFileString(line);

                    if (user != null) {
                        users.add(user);
                    }
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return users;
    }

    public String generateUserId() {
        return "USR" + System.currentTimeMillis();
    }
}