using System;
using System.Collections.Generic;

namespace NoticiasWeb.Models
{
    public partial class Rol
    {
        public Rol()
        {
            Editors = new HashSet<Editor>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; } = null!;

        public virtual ICollection<Editor> Editors { get; set; }
    }
}
