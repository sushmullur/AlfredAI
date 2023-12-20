struct MockData {
    static let sampleQueries: [Query] = [
        Query(id: "1", time: "10:00 AM", request: "What's the weather today?", response: "It's sunny and 75 degrees."),
        Query(id: "2", time: "10:30 AM", request: "Set a timer for 30 minutes.", response: "Timer set for 30 minutes."),
        Query(id: "3", time: "11:00 AM", request: "Remind me to call John at 2 PM.", response: "Reminder set to call John at 2 PM."),
        Query(id: "4", time: "11:15 AM", request: "Find a recipe for spaghetti.", response: "Here's a recipe for spaghetti."),
        Query(id: "5", time: "11:45 AM", request: "Play some jazz music.", response: "Playing jazz music."),
        Query(id: "6", time: "12:00 PM", request: "How's the traffic to downtown?", response: "Traffic is light."),
        Query(id: "7", time: "12:30 PM", request: "Send an email to Alex.", response: "Email sent to Alex."),
        Query(id: "8", time: "1:00 PM", request: "Find nearby pizza places.", response: "Here are some pizza places nearby."),
        Query(id: "9", time: "1:30 PM", request: "Translate 'hello' to Spanish.", response: "In Spanish, 'hello' is 'hola'."),
        Query(id: "10", time: "2:00 PM", request: "Set a reminder for my meeting tomorrow.", response: "Reminder set for your meeting."),
        Query(id: "11", time: "2:30 PM", request: "What movies are playing tonight?", response: "Here are some movies playing tonight."),
        Query(id: "12", time: "3:00 PM", request: "Turn on the living room lights.", response: "Turning on the lights."),
        Query(id: "13", time: "3:30 PM", request: "Order more coffee beans online.", response: "Coffee beans ordered."),
        Query(id: "14", time: "4:00 PM", request: "Schedule a haircut for next week.", response: "Haircut scheduled for next week."),
        Query(id: "15", time: "4:30 PM", request: "Show my photos from last weekend.", response: "Displaying your photos."),
    ].reversed()  // Reverse the array
    .map { $0 }   // Convert the ReversedCollection back into an Array
}
