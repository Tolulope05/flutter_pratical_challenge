What Is MVC As A Pattern
MVC is “Model View Controller”. It describes a very specific arrangement of the three:

![preview 1](http://4.bp.blogspot.com/-qViNoB3CaeU/VG9t9RXKAaI/AAAAAAAAPUE/tbdf5O-fR3E/s320/MVC%2B(1)

Each part is responsible for the following:

Model - Responsible for representing and persisting application data. If you’re building a blog for example, this set of objects would represent individual blog posts, and be able to save them to the database (as well as load them). It also issues events when it changes (via the Observer Pattern).
View - Responsible for rendering data from the Model to the user. So it pulls the data that it needs from the instance of the model. The other key point is that it then binds as an Observer to that model. So any future updates to it will automatically update the User Interface.

It’s important to note that the View is the thing doing the rendering itself. It is the final output.

Controller - Responsible for intercepting user interaction and converting it to Model and View instructions. So if the user edits the title of a blog post, the controller sees the interaction, and edits the title in the model.
The pattern is explicitly clear about the relationships of the objects. Controllers update Models, Models tell Views they has been updated, and then the Views pull the new data from the Models and present it.
This sounds easy!

What Is “MVC” As A Concept
“MVC” is a concept that centers around separation of concerns.

What does that mean?

Well, to put it simply, you want to separate parts of your application. Some parts are going to deal with presentation (displaying things to the user). Some parts are going to deal with persistence (storing data in a database). Other parts are going to deal with user interaction (figuring out what to do with the request the user sent). And finally, you have a whole bunch of other things that simply don’t fit into the above (such as sending email, logging, etc).

That sounds awfully similar to the description of the pattern, doesn’t it?

That’s part of the problem, they are quite different.

MVC as a pattern describes the specific interactions between each individual layer. Most of which aren’t useful for internet usages.

One example in server-side usage, is that the View cannot actually render anything. Since it’s on the server, all it can do is output instructions (HTML, or some other intermediary) which the client will then render. This is an extremely important difference because it means that the View cannot be stateful of its representation. Therefore, if the View wants to change something it has already rendered, it cannot. And as such, the entire premise of MVC falls flat.

This means that the Observer functionality, where the View watches the Model, is completely impractical for web requests. That’s because the HTTP, and the internet as a whole is stateless.

It’s All About State
MVC is a stateful pattern. It is designed to simplify the management of state across the lifetime of the program. By having events emitted and consumed between the layers, the program can be greatly simplified.

This is incredibly useful for desktop applications.

For web servers though, it’s extremely expensive. Because it means we need to either keep every users state alive on the server between requests (a lot of memory wasted, especially for visitors that only make 1 request) or we need to rebuild the state on every request (a lot of CPU wasted reconstructing the state).

So instead, every implementation of server-side “MVC” that I’ve ever seen removes the state from the equation. They have made “MVC” stateless. So by definition, they can’t be using the MVC pattern.

So what are they using?
Every framework that uses “MVC” that you look at, when you look at how it actually works, will be different.

Every implementation will have different details around exactly what goes where, and how it all relates together.

For example, some will be “controller push”, where the controller fetches data from the model and pushes it into the view. Some will be “view pull”, where the view gets the model, and fetches the data from it. Some will be “controller push, view pull”, where the controller pushes the model into the view, and the view pulls the data it needs. And that’s just talking about how data gets into the view. There are other massive differences as well. Just google “thin model vs thin controller” and see how much people disagree on it.

And this is why I say “don’t bother learning MVC”. There’s no “one thing” to learn. And there are far more useful things to spend your time learning…

The Underlying Lesson
There is a very useful lesson that MVC brings: Separation Of Concerns. Meaning that you should separate different responsibilities into different sections of your application.

This is a tenant that comes up in OOP over and over again. We talk about it with SOLID’s Single Responsibility Principle. Actually, all of the SOLID principles are directly related to separating concerns from one another (all 5 principles are really just different angles of the same concept).

> One example in server-side usage, is that the View cannot actually render anything. Since it’s on the server, all it can do is output instructions (HTML, or some other intermediary) which the client will then render. This is an extremely important difference because it means that the View cannot be stateful of its representation. Therefore, if the View wants to change something it has already rendered, it cannot. And as such, the entire premise of MVC falls flat.

Last week, I wrote A Beginner’s Guide To MVC For The Web. In it, I described some of the problems with both the MVC pattern and the conceptual “MVC” that frameworks use. But what I didn’t do is describe better ways. I didn’t describe any of the alternatives. So let’s do that. Let’s talk about some of the alternatives to MVC…

Problems With MVC
Let’s restate the fundamental problems we talked about that exist with MVC:

MVC Is Stateful

It only makes sense if the View, as well as the View-Model binding is stateful (so the Model can update the View when it changes)

MVC Has No Single Interpretation

Every framework uses their own nuanced version.

How Does Logging Fit In?

Where does application code that’s not clearly data-centric belong in the application?

Siblings To MVC
There are a whole bunch of siblings to MVC that take slight divergences and have narrow differences. Let’s briefly talk about a few of them:

HMVC - Hierarchical Model-View-Controller
This is quite similar to the MVC pattern, except that you can nest the triads together. So you can have one MVC structure for a page, one for navigation and a separate one for the content on the page. So the “top level” dispatches requests down to navigation and content MVC triads.

This makes structuring complex pages easier, since it allows you to create reusable widgets. But it brings all of the problems that MVC has, and solves none of them (it just adds complexity on top).

So HMVC doesn’t really solve our problems…

MVVM - Model-View-ViewModel
The difference between MVC and MVVM is a lot more subtle. The basic premise is that in normal MVC, it’s bad that the View is doing two jobs: presentation and presentation data logic. Meaning that there’s a difference between actual rendering, and dealing with the data that will be rendered. So MVVM splits the MVC View in half. The presentation (rendering) happens in the View. But the data component lives in the ViewModel.

The ViewModel can interact with the rest of the program, and the View is bound to the ViewModel. This means that there’s more of a separation between presentation and the application code that lives in the Model.

The controller isn’t mentioned, but it’s still in there somewhere.

Again, this solves some types of problems with MVC, but doesn’t address any of our issues.

MVP - Model View Presenter
MVP is a bit different from MVC in implementation. Instead of having the Controller intercept user interaction and the View render data, MVP structures itself a bit differently. The View is responsible for passive presentation. Meaning that it doesn’t bind to the Model, it just renders the data that it’s given. But it also receives user interaction events (like the MVC controller). Basically, the View is the only thing that’s exposed to the user.

The Presenter sits behind the View, and handles all of the functionality. When the View receives user interaction, it forwards it back to the Presenter. The Presenter then updates the Model, pulls data, and pushes data back into the View.

Like HMVC, it solves some of the problems with MVC. But also like HMVC, it doesn’t address any of the issues.

MVA - Model View Adapter
MVA replaces the Controller from MVC with an “Adapter”. Don’t be confused, this is not a Gang-Of-Four Adapter, but more of a Mediator.

This means that the Model and the View never really talk to each other. Instead, they talk through the “Adapter” (which is really just an event-driven Controller).

The reason this is advantageous is that the View no longer needs to know about the Model. So you can achieve better separation and hence decoupling.

It also mean that the connection between the View and the Model can be stateless! Yay! Finally!

Except not. While the connection between the View and the Model can be stateless, the instances themselves still need to be stateful. The only stateless component is the connection between them.

So we’re still stuck with the same fundamental problems as MVC…

PAC - Presentation Abstraction Control
I’m not going to give much here, as PAC is really just like HMVC applied to MVA. It’s basically HMVA. With all the same problems.

RMR - Resource-Method-Representation
In RMR architecture, you structure your application based on HTTP methods on resources which are then represented back to the user. So MVC Models become Resources (they map 1:1 to REST resources). The Controller becomes a “Method” object, and the View becomes the Representation.

This updates the MVC architecture for the HTTP web. It allows us to structure applications more like the requests that come in. And since we’re structuring the application more as actions-on-resources, we can simplify the interactions significantly.

This still doesn’t actually solve the stateful problem. Since Methods are actions on Resources, the Resources must be re-created for each request. Meaning that the entire triad system needs to be reconstructed for each request. Yay.

Not to mention that it doesn’t solve the other two issues at all.

Not to mention that it couples itself to HTTP so tightly that to try to map it to a CLI or GUI interface would be quite difficult.

ADR - Action-Domain-Responder
ADR is so close to RMR, that it’s really the same pattern with a few details tweaked. Action==Method, Resource==Domain and Representation==Responder. The only significant difference that I’ve seen is the amount of knowledge that the Responder (a Representation in RMR) has about the Domain (Resource).

It still has issues like “where does logging fit”, and having to rebuild state on each request. And it shares RMRs coupling to HTTP that it becomes difficult to make a non-HTTP interface.

What Is The Commonality?
There are a few points to notice about all of the patterns that I mentioned before. Let’s go through them one-by-one.

All Are Triads

Each one of the patterns that I talked about above is a triad. Meaning that there are three components to it.

It’s kind-of funny that > 90% of the predominant application patterns out there have 3 components. Really makes you wonder why…

I wonder if it’s because every one of the patterns is simply a different interpretation of the same underlying concept. The same way that SOLID really is just one concept that presents itself differently depending on how you look at it, perhaps MVC is one of those patterns. Everyone looks at it in a different way, and some realize that it’s different so they name it something else. But it’s the same underlying concept.

All The Triads Have The Same Conceptual Purpose

Each and every pattern has similar concepts:

Something To Do Rendering
Something To Do Interacting
Something To Represent Data / Business Rules
The difference between the patterns is how the relationships work and which component can talk to which other component.

Again, I ask, where does logging fit in? Where does charging a Credit-Card fit in? Where does the rest of the application fit?

Also, why are these three special? Is rendering always a single responsibility? Or are there times where it has multiple responsibilities that should be split up?

All Pretend To Be Application Architectures
And this is the point. The underlying problem with all of them. There’s more to an application than just interaction and presentation. In fact, many would say that interaction and presentation are the smallest parts of the application (at least for non-trivial apps).

So why are we focusing on the interaction step?

Why are we focusing on the smallest and simplest part of our application, and shoving everything else either into a catch-all bucket of a Model, or outside of the pattern?

And that’s the biggest reason all of these “patterns”, “architectures” and “concepts” are a bad joke. They solve the easy problem, and throw the hard problem over the fence.

So how do we solve the hard problem?
The first step to solving it, is recognizing that it exists.

We can’t have a discussion about something if we keep pretending that the problem isn’t there.

Some people have seen these problems, and they have invented things like AOP - Aspect-Oriented-Programming as a solution.

But I don’t think that’s the right way to handle it. If it’s not clear where something fits in your application, that’s a sign that your application architecture is flawed. Not that you need to introduce some magic in to get it to work.

So let’s admit that none of these are application architectures… And let’s admit that there is a problem we need to solve.

As far as the solution there…

Well, more on that next time.
