using System;

namespace PortfolioApp.Models.Entities;

public class About : BaseEntity, IDatesEntity
{
    public string? AboutTitle { get; set; }
    public string? AboutText { get; set; }
    public string? AboutCvUrl { get; set; }
    public string? AboutImageUrl { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
}
