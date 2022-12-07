import { ref } from "vue";

export const globalData = ref<string>("")

const files = ["https://data.monarchinitiative.org/monarch-kg-dev/latest/qc_report.yaml"];
      
// fetch(file).then(data => data.text()).then(text=> {
//     console.log(text)

//     // let data = yamlparse(text);
//     // data = { kgversion: 1 }
//     // data.genes = data.genes.map(gene=> gene.id + "!")

//     globalData.value = text;
// })

async function fetchData(url = "") {
    const response = await fetch(url);
    const text = await response.text();
    return text;
}


export async function fetchAllData() {
    const arrayofpromises = files.map(fetchData);
    const allresults = await Promise.all(arrayofpromises);
    globalData.value = allresults[0];
}