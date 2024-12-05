using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для Istoriya.xaml
    /// </summary>
    public partial class Istoriya : Window
    {
        MasterFloor2Entities db = new MasterFloor2Entities();
        public Istoriya()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            MainWindow window = new MainWindow();
            window.Show();
            this.Close();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            var partnerProducts = db.partnerProducts.ToList();
            var partners = db.partners.ToList();
            var products = db.products.ToList();

            var partners_products = from pa in partnerProducts join pr in products on pa.id_products equals pr.id select new { idPartner = pa.id_partner, count = pa.count, date = pa.date, nameProduct = pr.name };
            var partnerProd = from pa in partners_products join pr in partners on pa.idPartner equals pr.id select new { partner = pr.name, count = pa.count, date = pa.date, product = pa.nameProduct };

            datagrid.ItemsSource = partnerProd.ToList();
        }
    }
}
