using System;

namespace PortfolioApp.Models.Entities;

public class HomeBanner : BaseEntity, IDatesEntity
{
    public string? HomeBannerTitle { get; set; }
    public string? HomeBannerSubTitle { get; set; }
    public string? HomeBannerText { get; set; }
    public string? HomeBannerImageUrl { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
}
