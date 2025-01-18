using System;

namespace PortfolioApp.Models.Entities;

public class Contact : BaseEntity, IDatesEntity
{
    public string? Address { get; set; }
    public string? PhoneNumber { get; set; }
    public string? Email { get; set; }
    public string? GoogleMap { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
}
