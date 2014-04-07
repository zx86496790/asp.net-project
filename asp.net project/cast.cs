using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq.Mapping;

namespace asp.net_project
{
    [Table]
    public class cast
    {
        [Column]
        public int id { get; set; }

        [Column]
        public string castname { get; set; }

        [Column]
        public string castrole { get; set; }

    }

}