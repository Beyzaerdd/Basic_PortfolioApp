using System;

namespace PortfolioApp.Models.Entities;

public class Service : BaseEntity, IDatesEntity, IEntity
{
    public string? Icon { get; set; }
    public string? Title { get; set; }
    public string? SubTitle { get; set; }
    public string? Description { get; set; }
    public bool IsDeleted { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
}
