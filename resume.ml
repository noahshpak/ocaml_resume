open Format

type job = {
	title: string;
	topics: string;
	location: string;
	time: string;
	about: string;
	coding_languages: string;
}

type project = {
	title: string;
	topics: string;
	time: string;
	about: string;
	coding_languages: string;
}

type college = {
	institute: string;
	major: string;
	minor: string;
	grad: string;
}

type honor = {
	title: string;
	award: string;
	time: string;
}

type item = 
	| Job of job * item
	| College of college * item
	| Honor of honor * item
	| Project of project * item
	| End

let name = "Noah Shpak"
let school_email = "noashpak@seas.upenn.edu"

let upenn : college = {
	institute="University of Pennsylvania";
	major="BSE Computer Science";
	minor="English";
	grad="2017";
}

let zinkerz : job = {
	title="Intern: Zinkerz Inc.";
	topics="Data Analysis, Web Dev.";
	location="Cambridge, MA";
	time="Summer 2015";
	coding_languages="Ruby on Rails, Python";
	about="Designed a dashboard that analyzes and displays application data from GoogleAnalytics and Firebase for teams in Tel Aviv and Cambridge.  It is hosted on Heroku.";
}

let hiQ : job = {
	title="Intern: HiQ Labs";
	topics="Data Mining";
	location="San Francisco, CA";
	time="Summer 2014";
	coding_languages="Java, Python, R";
	about="Mined thousands of LinkedIn profiles using JSoup API in Java.";
}

let lbnl : job = {
	title="Intern:  Lawrence Berkeley Ntl. Lab";
	topics="Mechanical Design";
	location="Berkeley, CA";
	time="Summer 2013";
	coding_languages="AutoCAD";
	about="Designed the shell for a radio frequency module still used in the on-site cyclotron. "
}
let cmea : honor = {
	title="CMEA Competition: Classical Guitar";
	award="Command Performance";
	time="2010 11 12 13";
}

let frat_life : honor = {
	title="Member, Philanthropy Chair";
	award="Phi Gamma Delta";
	time="2014 15";
}

let chevron_design : honor = {
	title="Chevron Design Challenge";
	award="Winner";
	time="2012";
}

let exploravision : honor = {
	title="ExploraVision Science Competition";
	award="Honorable Mention";
	time="2012";
}

let scrabble : honor = {
	title="National Scrabble Tournament: Reno, NV";
	award="Winner";
	time="2008";
}

let abe : project = {
	title="Abe";
	topics="Game Theory, Crowdsourcing";
	time="2015...";
	coding_languages="MeteorJS";
	about="Political trivia, polling game, fact checking crowdsourced";
}

let aquinas : project = {
	title="Aquinas";
	topics="Databases, Search";
	time="2015";
	coding_languages="MeteorJS";
	about=" Freelance for Dr. David Whidden, manages citations for theology research ";
}

let pretweet : project = {
	title="PReTweet";
	topics="Crowdsourcing and Human Computation";
	time="2015";
	coding_languages="Ruby on Rails, Python";
	about="Tool for Tweet prescreening & quality evaluation";
}

let gun_violence : project = {
	title="Gun Violence Article Analysis";
	topics="Machine Learning, Crowdsourcing, Nat. Lang. Processing";
	time="2014";
	coding_languages="Python";
	about="Text classifier for gun violence articles";
}

let resume = College (upenn, 
				Job (zinkerz, 
				Job (hiQ, 
				Job (lbnl, 
				Honor (cmea, 
				Honor (frat_life, 
				Honor (chevron_design, 
				Honor (exploravision, 
				Honor (scrabble, 
				Project (abe, 
				Project (aquinas, 
				Project (pretweet, 
				Project (gun_violence, End)))))))))))))

let rec print_res (i: item) = 
	begin match i with
	| College (info, next) -> printf "\n%s\n%s\n%s(%s)\n" info.institute info.major info.minor info.grad;
		print_res(next)
	| Job (info, next) ->  printf "\n%s\t%s\t%s\t%s\n%s\n%s" info.title info.topics info.location info.time info.coding_languages info.about;
		print_res(next)
	| Project (info, next) -> printf "\n%s\t%s\t%s\n%s\n%s" info.title info.topics info.time info.coding_languages info.about;
		print_res(next)
	| Honor (info, next) -> printf "\n%s\t%s\t%s"info.title info.award info.time;
		print_res(next)
	| End -> ()
	end
;; printf "\n%s\n%s\n\n" name school_email
;; print_res	 resume