package model;

public class Users {
    private String idUser;
    private String firstName;
    private String lastName;
    private String numberPhone;
    private String email;
    private String password;
    private String education;
    private String work;
    private String address;
    private String gender;
    private String dateOfBirth;
    private int follow;
    private String linkImage;
    private String timeCreated;
    private String state;
    private String linkimagebia;

    public Users(String idUser, String firstName, String lastName, String numberPhone, String email, String password, String education, String work, String address, String gender, String dateOfBirth, int follow, String linkImage, String timeCreated, String state, String linkimagebia) {
        this.idUser = idUser;
        this.firstName = firstName;
        this.lastName = lastName;
        this.numberPhone = numberPhone;
        this.email = email;
        this.password = password;
        this.education = education;
        this.work = work;
        this.address = address;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.follow = follow;
        this.linkImage = linkImage;
        this.timeCreated = timeCreated;
        this.state = state;
        this.linkimagebia = linkimagebia;
    }

    public Users() {
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public int getFollow() {
        return follow;
    }

    public void setFollow(int follow) {
        this.follow = follow;
    }

    public String getLinkImage() {
        return linkImage;
    }

    public void setLinkImage(String linkImage) {
        this.linkImage = linkImage;
    }

    public String getTimeCreated() {
        return timeCreated;
    }

    public void setTimeCreated(String timeCreated) {
        this.timeCreated = timeCreated;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getLinkimagebia() {
        return linkimagebia;
    }

    public void setLinkimagebia(String linkimagebia) {
        this.linkimagebia = linkimagebia;
    }
    
}
