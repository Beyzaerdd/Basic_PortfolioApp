using System;

namespace PortfolioApp.Models.Entities;

public class SocialMediaAccount : BaseEntity, IDatesEntity, IEntity
{
    public string? Title { get; set; }
    public string? AccountUrl { get; set; }
    public string? Icon { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
}
