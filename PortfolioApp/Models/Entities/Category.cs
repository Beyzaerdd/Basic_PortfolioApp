using System;

namespace PortfolioApp.Models.Entities;

public class Category : BaseEntity, IDatesEntity, IEntity
{
    public string? Name { get; set; }
    public string? Description { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
    public bool IsDeleted { get; set; }

}