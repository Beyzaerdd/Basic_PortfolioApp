using System;

namespace PortfolioApp.Models.Entities;

public class ServiceInfo:BaseEntity, IDatesEntity
{
    public string? Title { get; set; }
    public string? SubTitle { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }

}
