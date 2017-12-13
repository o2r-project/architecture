# User scenarios

## Andrea the author and reader

Andrea turned 29 this year. She is always up for a joke and a pot of coffee but is also quite impatient. Especially if she has to wait for others or if she hasn’t had any progress for a while. However, currently Andrea does his Ph.D in the field of geosciences. Two years ago she decided to go for a cumulative dissertation, meaning that she publishes scientific papers throughout his graduation and summarizes them at the end. She already published his first paper a few months ago which is good, actually. One of the reviewers was interested in the data and the source-code in order to reproduce the results.

After a few hours of searching (remember that she is not one of the most patient guys), she finally finds some files that include the dataset and also the source-code in R (a statistics program). Just a short try if it still working... weird, the results are different. Just a short look into the paper... The configuration is different than the one described in the method section. Well, just few manipulations and - still not working. 
Although she submitted the paper just a few months ago, she can’t remember the configuration that lead to the results in the paper. Fortunately, submitting data and code was not mandatory. But Andrea knows that she made a mistake.

More and more journals expect their authors to submit data and source-code that underlie the research findings. For this reason, she wants to change her working behavior and to keep data and code files better under control. She remembers her last research work which was quite unstructured, maybe already messy. Code and data was distributed over several folders and even computers. She had so search for them for quite a while. Moreover, some components do not work anymore.

This time, she wants to do it better and searches for a great tool that assists his working flow. She just heard about a new website supporting reproducible research. It allows to upload all necessary files and to create a so called "container" which is "executable" - whatever that means. It even verifies the results in the paper making it possible to detect errors immediately. Of course it also contains common features like sharing the publication with other authors. On top of that, Andrea can also benefit from other publications. As the website automatically generates a number of meta information, new search capabilities arise. It is not only possible to search for other publications by using keywords, but also by using spatial and temporal properties and constraints. It is even possible to constrain the search to hypotheses and research questions that contain a certain vocabulary thus simplifying search for related work. Andrea is quite impressed about that. She easily finds related papers that suit to his own work. She gets a good overview about existing research questions making it easier to identify a research gap he can focus on. Andrea doesn’t even have to implement all the code lines for his statistical analysis from scratch, but can build upon existing. While reading some of the related papers in the browser, he realizes a couple of user interface widgets besides the incorporated figures. He doesn’t know them from traditional, static papers which are typically published as .pdf-files. Andrea recognizes that the widgets allow to interact with the diagrams to which the widgets belong. They allow to change, for example, thresholds, input variables and constants. She is thus able to check the assumptions and conclusions underlying the paper. She is a bit overwhelmed by the number of new features that might assist his current research such as exchanging the dataset or the source-code underlying the paper. Andrea is quite happy about his new tool. It provides support for structured work, finding related publications, algorithms and datasets, identifying a research gap, and even tools for interacting with traditional, static papers. So, let’s go for the second paper.

## Arthur the administrator

Arthur works as a system administrator in a large university library in Germany. He's quite happy with his job. After working as freelance software developer for over 20 years, he now enjoys the challenge to make all the different servers and applications under his care work like a charm 24/7 while having a stable paycheck and reasonable working hours. He is particularly proud that, since he took over the job, he successfully migrated all services to a private cloud infrastructure and enabled https-only traffic on all, event the internal, APIs and websites. Since then, there has been minimal overtime for him and close to 0 minutes downtime for the services... and a raise!

Arthur is interested in this new reproducibility service that the head of the library is interested in, but he is sceptical about all new systems. There are going to be bugs, unforseen problems, and a lot of testing ""in production"", which he does not like. But he does now that scientists have been in touch with the library before about archiving data and software, so if this is a high priority for his customers, as he sees them, there is no ways around it.

At second look though, he realizes the project seems to have all the basics straight for a stable and scalable deployment: All components are published under open source licenses, and the project maintainers provide different ready-to-use Docker images. Arthur worries about security, so there is no better way to make sure things work well than source code access. The project is written in a language he has not used before himself, but he can actually build the project himself from source with the provided instructions. He also sees that, instead of reinventing the wheel, the developers seem to be competent enough to build upon established libraries.

The Dockerfiles are great to play around with, but also easy to integrate in his own server management solution. He also likes that all the HTTP APIs as well as setup and configuration seem to be very well documented. This should make it easy to integrate the new solution with some custom tools he developed, but also with some legacy infrastructure he has not yet been able to get rid off. He does worry a bit about the scheduling solution, since he is not very keen on Docker containers being started automatically on his servers. Good thing that the project contributors seem to operate a public chat, and professional support is also available at reasonable prices.

After some testing, he feels good to tell his colleagues: looks good to me, let's try this out!

## Olivia the operator

"Olivia is the chancellor of a mid-size state owned university in the US. She is proud to have been elected to this position a few years ago, and works very hard each day to improve both the university's reputation and the working and learning conditions of her employees and students. She had to make some unpleasant first hand experiences with aspects of todays academic life that sadly became almost normal, such as budget cuts, violence on campus, and plagiarism scandals. During all of these upsets, she is happy that the never wavered on the importance of personal integrity and credibility of each and every one of the scientists and researchers working on her campus.

To gain some ground in the competition with other universities, Olivia puts her best assistant on the job of finding the newest trends in academia. Soon enough she presents to her the idea of making all research conducted at the university reproducible. Olivia is first surprised by the fact, being an arts major herself, as she thought that is already the case. She starts reading the material provided to hear and realizes that science, and especially something called computational science, is very much different from the practical work she has encountered during her years as a researcher. It also becomes clear to her that it won't work to just put out a statement forcing every lab to spend enormous efforts on changing established research practices, or to re-do what has been done 5, 10 or 20 years ago. The huge variety of labs and workflows that exists and all the different kinds of people... getting out the stick simply won't work. But maybe the carrot will?

She discovers a novel website that promises to solve all the problems of reproducibility. The people behind it seem competent enough to her, but again she asks her assistant to consult with experts from the university library and computer science departments to see what they think. A lengthy discussion starts, and there seems to be no consensus after months of meetings and evaluations. The assistant doesn't know what to report back to Olivia. Eventually, Olivia is tired of waiting and joins a few of the meetings of the expert group as an observer. She realizes that nothing comes for free... she encourages the expert group to create a list of requirements on establishing a reproducibility website for the university. She quickly gets that, as the lecturers and staff in the group realize that this means they won't just get more work to do, they might get the proper time and money to do it!

Olivia makes the new website a matter for the boss. She successfully acquires the funds to start and maintain both the technical services and to hire support staff to maintain it. Beyond that, the supports staff is even equipped to provided consultancy services to all researchers at the university. These services quickly become popular across all disciplines working with data and code, and after just a few months, more and more fully reproducible papers appear on the public reproducibility website. Olivia is very glad to see that the changes she introduced did not have an impact on the scientific output of the university - the monthly statistics tell her that much. Is the quality or quantity of the output going to increase? It's too soon to tell, but Olivia is sure it will. Just last week, the head of the programme reported to her that now ten papers are available on the website for which researchers from different university departments collaborated, who never collaborated before - they discovered the overlap through the new system! More than 20 undergraduate courses teaching scientific methods incorporated material from the website into their course schedule, and 50% of the graduate theses from the computer science department are now using the university reproducibility tools. Those are good enough signs for Olivia. She decides to pitch an idea to the university board: let's include reproducibility of publications as an evaluation factor for the budget allocations next year. You got to use the stick from time to time to make people appreciate the carrot.

## Carl the curator

Carl works as a digital assets curator at a university library in Germany. He has been working as a librarian for about ten years and experienced the digital transformation of the field, which is why he specialized in the area of digital curation and archiving. He is qualified to manage and organize several collections of digital objects at a given time and recently selected objects for an exhibition of gold standard open access publications in the software category of his institutions catalog front page.

Carl’s expertise encompasses the management of accessibility levels as well as the preservation of file integrity and meta data curation. Since he discovered a growing interest in the preservation of software, he realized that reproducibility of research findings, including code and data increases the value and visibility of his university’s portfolio. As a result, Carl is working closely with the library’s team for Research Data Management, in order to facilitate integration of reproducible computational environments into the digital objects’ life cycle that underlies their current policies.

As he strongly believes that publicly funded research data are public goods, Carl values his profession as a vital point of intersection between researchers, librarians und the general public. Therefore, when planning a selection of digital assets or curating the library’s catalogs, Carl enjoys the interoperability that is provided by international metadata standards and linked open data vocabularies.

## Polly the publisher

Polly is the head of a large publishing firm for scientific journals. She grew up being part of a publisher family, the third of four kids. While her older brothers wrestled with the family legacy, she has always been close to her late grandfather, who started the publishing business as a young man. So it came as no surprise that she studied arts and library science and after a few well planned career steps around the globe, she joined the family business as assistant of her father and became CEO after a few years, a decision she rarely regrets.

Though there is one thing that makes her job challenging every day: technology's high development speed. For a large publishing business, it is hard to keep up with new and modern technology. She has to serve both old (in more than one way) customers and employers, who have had a long relationship and a work environment and processes that have developed and settled in over many years. On the other hand, she sees new ideas by entrepreneurs and startups almost every week, some crazy and some rightfully called revolutionary, who experiment with new ways to publish science without the baggage of a reputation and hundreds of journals and an order of magnitude more employees.

So what should Polly do? Scramble up some money to acquire a few startups and replace the existing review and authoring solution? Fire all staff members who are too slow adopting the new technologies? Close journals with an excellent reputation because editors and reviewers are not tech-savvy? 

Obviously, none of these were an option. Change had to come gradually and inclusively, not in a disruptive fashion. Polly turned to her CTO Charlotte. She joined the company recently and played out to be a very good hire, as she was able to revive the in-house development team with a positive attitude and a few key hires. Charlotte is aware of the challenges and agrees to compile an action plan from her perspective. A few weeks later, she presents the options to Polly and the other board members. She suggests to adopt an open service for interactive publications, which is an integrated solution for hosting and archiving data as well as code that is often part of publications these days. It is open source, but of course that does not come for free. Charlotte suggests a combined approach of experiments by her own staff and external consulting by the original developers of the software. And she quickly mitigates all concerns raised by the other CxOs: the website is customizable, so it will not look like the competitors versions, it is extensible, so the few "cool features" that have been developed over the last years will be easy to integrate, and it is compatible with the existing data repository (so no need to replace that beast of a software). This new website would be an option presented to all editors to adopt for their journals. Education of the company's staff would precede this offer to make sure the intended message is spread: don't be left behind, challenge reviewers and authors to improve the quality of the journals and subsequently raise the bar for high quality open science.

## Richard the reviewer

Richard is a successful researcher.
After getting tenure a few years back, he embraces the chance to support students and collaborate with other scientists instead of hunting for the next easy publication to get his name on.
A big part of his time is taken up by his membership in the editorial boards of two journals and his engagement with several more journals as a reviewer.

Richard is "senior" in some ways, and he as well as his colleagues know his value lies in experience, not in hunting the latest hot new things.
Therefore Richard never came around to catch up practically with the latest technologies, and while he has a good understanding of computer science and used to be a very capable programmer, this new stuff the kids are doing is beyond his means.

As the next paper review request lands in his inbox, he skims the abstract and soon thinks "I will never be able to thoroughly evaluate this work, the code must be too complex to run on my machine".
But the content is so interesting! What a shame.
He almost replies with a negative answer and then sees a new link at the bottom of the notification.
The publisher must have added a new feature.
The link's title is "Click here to examine and manipulate code and data".

Richard clicks the link.
He is taken to a website looking partially similar to the old review system he is used to.
One the one side there is the well-known article view where he can read, add highlights and make comments.
But on the other side, there is a new menu he enthusiastically explores.
It allows him to edit parameters and re-run analysis of the paper!
Without even downloading any data or code.
He immediately sees the benefits: What a relief for his work, and what a chance to dig deeper into the article and conduct a thorough review.

After some brief inspections of the article figures and manipulation of some parameters, Richard feels confident he can actually do the review properly.
He let's the editor know about his decision and wants to dive right back into the article, but then stops himself.
First, he writes an email to his fellow editors about this new review system for evaluating code and data - they need it for their journal, too.

## Rachel the reader

Rachel is a second year graduate student in geoinformatics.
She's eager to learn and has left all struggles with the technical side of research, and has become a trusted programmer in her group and is seen as an expert in more than one programming language.

When she starts one of her final courses in advanced geoinformatics, the lecturer sends out a long list of reading material.
_How is she supposed to get through all of it?_
Never faltering, she starts reading all the documents...

After the third article, she is annoyed and underwhelmed by the fancy descriptions and high-level diagrams.
Although they all make sense, she feels like there is more to see and understand than is presented in the article.

She shares her thoughts with her teacher Teresa during the next seminar.
Teresa can relate to Rachel's frustration and quickly points her to items 8 and 9 on the reading list.
"These are different", she says.

Rachel gets back to reading.
The next articles start out the same as the others, but she soon realizes something is different.
The website takes a bit longer to load, and the graphics do not seem like they are compressed images at all.
She needs some time to explore the relatively complex navigation, but then is excited to discover that she can read and even download all the code and data that was used to generate the figures.
Even more, she can interact with the present methods and play around with the algorithms.
Finally she can immediately test her own understanding, challenge her criticism, and resolve misunderstandings.

She plays around with the articles on the website for a little while and spends a lot longer on trying to understand the bits and pieces.
Eventually she sees a close relation of one aspect of the analysis with the research project she though about doing for her thesis.
Rachel is enthusiastic and directly downloads the whole article with its code to her own laptop to try the code out with her own dataset. 
