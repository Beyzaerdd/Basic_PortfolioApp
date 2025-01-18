using System;

namespace PortfolioApp.Models.Entities;

public interface IDatesEntity//Date alanlarını eklemek istediğimiz entitylere implemente edilecek.
{
    public DateTime CreatedAt { get; set; }
    public DateTime? UpdatedAt { get; set; }
}
