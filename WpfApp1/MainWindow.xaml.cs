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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        MasterFloor2Entities db = new MasterFloor2Entities();
        public MainWindow()
        {
            InitializeComponent();
            {
                
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            PartnerAdd window = new PartnerAdd();
            window.Show();
            this.Close();

        }

        private void button2_Click(object sender, RoutedEventArgs e)
        {
            Istoriya window = new Istoriya();
            window.Show();
            this.Close();
        }

        private void button3_Click(object sender, RoutedEventArgs e)
        {
            if(partnersList.SelectedValue == null)
            {
                MessageBox.Show("Выберите партнера для его редактирования!");
            }
            else
            {
                Edit window = new Edit();
                window.Show();
                this.Close();
            }
                  
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            double skidka;
            var partnerCounts = db.partnerProducts.GroupBy(p => p.id_partner).Select(g => new { id_partner = g.Key, total_count = g.Sum(p => p.count) }).ToList();
            try
            {
                var partnerCountsWithDiscount = new List<PartnerDiscount>();            // расчет скидки партнера
                for (int i = 0; i < partnerCounts.Count; i++)
                {
                    if (partnerCounts[i].total_count > 300000)
                    {
                        skidka = 0.15;
                    }
                    else if (partnerCounts[i].total_count > 50000 && partnerCounts[i].total_count <= 300000)
                    {
                        skidka = 0.1;
                    }
                    else if (partnerCounts[i].total_count > 10000 && partnerCounts[i].total_count < 50000)
                    {
                        skidka = 0.05;
                    }
                    else
                    {
                        skidka = 0;
                    }
                    var partnerDiscount = new PartnerDiscount
                    {
                        id_partner = Convert.ToInt32(partnerCounts[i].id_partner),
                        total_count = Convert.ToInt32(partnerCounts[i].total_count),
                        discount = skidka
                    };

                    partnerCountsWithDiscount.Add(partnerDiscount);
                }
                var partners = db.partners.ToList();
                var contacts = db.partnerContact.ToList();
                var type = db.partnerType.ToList();
                var partnersType = from p in partners join t in type on p.id_partnerType equals t.id select new { id = p.id, name = p.name, rating = p.rating, id_contact = p.id_contact, type = t.name };
                var partnersContacts = from p in partnersType join c in contacts on p.id_contact equals c.id select new { id = p.id, name = p.name, rating = p.rating, type = p.type, director = c.lastname + " " + c.name + " " + c.fathername, telephone = c.telephone };
                var partnersContactsWithDiscount = from p in partnersContacts join d in partnerCountsWithDiscount on p.id equals d.id_partner select new { id = p.id, name = p.name, rating = p.rating, type = p.type, director = p.director, telephone = p.telephone, discount = d.discount };

                partnersList.ItemsSource = partnersContactsWithDiscount.ToList(); // вывод данных из разных таблиц в бд
            }
            catch (Exception ex) 
            {
                MessageBox.Show(ex.Message);
            }
            
        }

        private void partnersList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                var partner = db.partners.FirstOrDefault(x => x.id == (int)partnersList.SelectedValue);
                partnerid.id = partner.id;
            }
            catch (Exception ex) 
            {
                MessageBox.Show(ex.Message);
            }
            
        }
    }
}
