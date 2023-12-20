
const catalogue = [
	{ref:"X001", titre : "Linux", prix : 10},
	{ref:"X002", titre : "Angular", prix : 20},
	{ref:"X003", titre : "NodeJS", prix : 30},
	{ref:"X004", titre : "React", prix : 40},
	{ref:"X005", titre : "VueJS", prix : 50},
	{ref:"X006", titre : "MongoDB", prix : 60},
	{ref:"X007", titre : "ExpressJS", prix : 70},
	{ref:"X008", titre : "Javascript", prix : 80},
	{ref:"X009", titre : "Typescript", prix : 90},
	{ref:"X010", titre : "HTML5", prix : 100},
	{ref:"X011", titre : "CSS3", prix : 110},
	{ref:"X012", titre : "Bootstrap", prix : 120},
	{ref:"X013", titre : "Material Design", prix : 130},
	{ref:"X014", titre : "PHP", prix : 140},
	{ref:"X015", titre : "MySQL", prix : 150},
	{ref:"X016", titre : "PostgreSQL", prix : 160},
	{ref:"X017", titre : "Oracle", prix : 170},
	{ref:"X018", titre : "SQL Server", prix : 180},
	{ref:"X019", titre : "Java", prix : 190},
	{ref:"X020", titre : "C#", prix : 200},
	{ref:"X021", titre : "C++", prix : 210},
	{ref:"X022", titre : "C", prix : 220},
	{ref:"X023", titre : "Python", prix : 230},
	{ref:"X024", titre : "Ruby", prix : 240},
	{ref:"X025", titre : "Swift", prix : 250},
	{ref:"X026", titre : "Kotlin", prix : 260},
	{ref:"X027", titre : "Go", prix : 270},
	{ref:"X028", titre : "Rust", prix : 280},
	{ref:"X029", titre : "Scala", prix : 290},
	{ref:"X030", titre : "Perl", prix : 300},
	{ref:"X031", titre : "R", prix : 310},
	{ref:"X032", titre : "Haskell", prix : 320},
	];

exports.get = (req, res) => {
        

	
	res.setHeader('Content-Type', 'application/json');
      
    res.send(catalogue);
   };    

exports.search = (req, res) => {
	// call exports.get
	let searchString = req.query.searchString;
	res.send(catalogue.filter((item) => item.titre.toLowerCase().includes(searchString.toLowerCase())));
}