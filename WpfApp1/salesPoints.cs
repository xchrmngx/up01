//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfApp1
{
    using System;
    using System.Collections.Generic;
    
    public partial class salesPoints
    {
        public int id { get; set; }
        public Nullable<int> id_adress { get; set; }
        public Nullable<int> id_partner { get; set; }
    
        public virtual adress adress { get; set; }
        public virtual partners partners { get; set; }
    }
}
