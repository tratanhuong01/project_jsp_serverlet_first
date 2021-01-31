package model;

public class Ads {
    private String idAds;
    private String imgAds;
    private String nameAds;
    private String linkWebAds;
    private String datetimeCreate;

    public Ads(String idAds, String imgAds, String nameAds, String linkWebAds, String datetimeCreate) {
        this.idAds = idAds;
        this.imgAds = imgAds;
        this.nameAds = nameAds;
        this.linkWebAds = linkWebAds;
        this.datetimeCreate = datetimeCreate;
    }

    public String getIdAds() {
        return idAds;
    }

    public void setIdAds(String idAds) {
        this.idAds = idAds;
    }

    public String getImgAds() {
        return imgAds;
    }

    public void setImgAds(String imgAds) {
        this.imgAds = imgAds;
    }

    public String getNameAds() {
        return nameAds;
    }

    public void setNameAds(String nameAds) {
        this.nameAds = nameAds;
    }

    public String getLinkWebAds() {
        return linkWebAds;
    }

    public void setLinkWebAds(String linkWebAds) {
        this.linkWebAds = linkWebAds;
    }

    public String getDatetimeCreate() {
        return datetimeCreate;
    }

    public void setDatetimeCreate(String datetimeCreate) {
        this.datetimeCreate = datetimeCreate;
    }
    
}
