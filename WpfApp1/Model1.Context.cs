﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MasterFloor2Entities : DbContext
    {
        public MasterFloor2Entities()
            : base("name=MasterFloor2Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<adress> adress { get; set; }
        public virtual DbSet<cex> cex { get; set; }
        public virtual DbSet<family_status> family_status { get; set; }
        public virtual DbSet<history_changing_minimal_price> history_changing_minimal_price { get; set; }
        public virtual DbSet<history_provide_material> history_provide_material { get; set; }
        public virtual DbSet<history_sale_product> history_sale_product { get; set; }
        public virtual DbSet<material> material { get; set; }
        public virtual DbSet<materialType> materialType { get; set; }
        public virtual DbSet<measurement> measurement { get; set; }
        public virtual DbSet<packageSize> packageSize { get; set; }
        public virtual DbSet<partnerContact> partnerContact { get; set; }
        public virtual DbSet<partnerProducts> partnerProducts { get; set; }
        public virtual DbSet<partners> partners { get; set; }
        public virtual DbSet<partnerType> partnerType { get; set; }
        public virtual DbSet<passport> passport { get; set; }
        public virtual DbSet<products> products { get; set; }
        public virtual DbSet<productType> productType { get; set; }
        public virtual DbSet<provider> provider { get; set; }
        public virtual DbSet<requisites> requisites { get; set; }
        public virtual DbSet<salesPoints> salesPoints { get; set; }
        public virtual DbSet<typeProvider> typeProvider { get; set; }
    }
}
