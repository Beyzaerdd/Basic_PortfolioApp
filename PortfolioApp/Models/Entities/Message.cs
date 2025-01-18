using System;

namespace PortfolioApp.Models.Entities;

public class Message : BaseEntity, IEntity
{
    public string? Name { get; set; }
    public string? Email { get; set; }
    public string? Subject { get; set; }
    public string? Content { get; set; }
    public bool IsDeleted { get; set; }
    public bool IsRead { get; set; }
    public DateTime SendingDate { get; set; }
    public DateTime ReadingDate { get; set; }
}
