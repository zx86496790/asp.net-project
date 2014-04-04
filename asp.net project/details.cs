using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq.Mapping;

namespace asp.net_project
{
    [Table]
    public class details
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = false)]
        public int id { get; set; }

        [Column]
        public int TitleID { get; set; }

        [Column]
        public string filmedin { get; set; }

        [Column]
        public string soundmix { get; set; }

        [Column]
        public string summary { get; set; }

        [Column]
        public string summaryauthor { get; set; }

        [Column]
        public string reviews { get; set; }

        [Column]
        public string producers { get; set; }

        [Column]
        public string writers { get; set; }

        [Column]
        public string composer { get; set; }

        [Column]
        public string cinematographer { get; set; }

        [Column]
        public string productiondesigner { get; set; }

        [Column]
        public string costumedesigner { get; set; }

        [Column]
        public string miscellaneous { get; set; }


    }
}