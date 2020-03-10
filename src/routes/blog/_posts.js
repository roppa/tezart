// Ordinarily, you'd generate this data from markdown files in your
// repo, or fetch them from a database of some kind. But in order to
// avoid unnecessary dependencies in the starter template, and in the
// service of obviousness, we're just going to leave it here.

// This file is called `_posts.js` rather than `posts.js`, because
// we don't want to create an `/blog/posts` route — the leading
// underscore tells Sapper not to do that.

const posts = [{
	title: 'What is Tezart?',
	slug: 'what-is-tezart',
	html: `
			<p> George Bernard Shaw once said 'Without art, the crudeness of reality would make the world unbearable'. I agree. We have unfortunately fallen into a mechanistic view of existance, which usually focusses on the harshness aspect of reality. People are missing out; and missing the point. </p>
		`
}, ];

posts.forEach(post => {
	post.html = post.html.replace(/^\t{3}/gm, '');
});

export default posts;