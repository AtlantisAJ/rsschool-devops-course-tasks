const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

test('index.html contains expected title', () => {
    const filePath = path.resolve(__dirname, '../app/index.html');
    const html = fs.readFileSync(filePath, 'utf8');
    const dom = new JSDOM(html);
    const title = dom.window.document.querySelector('h1').textContent;
    expect(title).toBe('Hello from Task 6!');
});
