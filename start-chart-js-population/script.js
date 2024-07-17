const myChart = document.getElementById("myChart").getContext("2d");

//   // Global options
//   Chart.defaults.global.defaultFontFamily = "Lato";
//   Chart.defaults.global.defaultFontSize = 18;
//   Chart.defaults.global.defaultFontColor = "#777";

const massPopChart = new Chart(myChart, {
  type: "bar", // bar, horizontalBar, pie, line, doghnut, radar, polarArea
  data: {
    labels: [
      "New Orleans",
      "Baton Rouge",
      "Shreveport",
      "Metairie",
      "Lafayette",
      "Lake Charles",
      "Kenner",
      "Bossier City",
      "Monroe",
      "Alexandria",
    ],
    datasets: [
      {
        label: "Population",
        data: [
          364136, 219573, 177959, 140046, 121467, 79633, 63333, 62738, 46616,
          43466,
        ],
        backgroundColor: "lightBlue",
        borderWidth: 2,
        borderColor: "#C0C0C0",
        hoverBorderWidth: 3,
        hoverBorderColor: "#808080",
      },
    ],
  },
  options: {
    scales: {
      x: {
        stacked: true,
      },
      y: {
        stacked: true,
      },
    },
    legend: {
      display: false,
      position: "right",
    },
  },
});
