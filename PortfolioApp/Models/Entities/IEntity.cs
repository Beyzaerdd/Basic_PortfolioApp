using System;

namespace PortfolioApp.Models.Entities;

public interface IEntity// IsDeleted vb özellikleri implemente etmek için kullanacağız
{
    public bool IsDeleted { get; set; }
}
