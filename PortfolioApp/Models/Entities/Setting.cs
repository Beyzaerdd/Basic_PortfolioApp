using System;

namespace PortfolioApp.Models.Entities;

public class Setting : BaseEntity, IDatesEntity
{
    public string? SiteName { get; set; }
    public string? FooterText { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
}
