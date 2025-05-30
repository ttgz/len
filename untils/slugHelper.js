const slugify = require('slugify');
const removeAccents = require('remove-accents');

function generateSlugAndSearchKey(name) {
    if (!name) return { slug: '', searchKey: '' };

    // Bỏ dấu và chuyển thường
    const nameNoAccent = removeAccents(name.toLowerCase().trim());

    // Slug: milk-cotton
    const slug = slugify(nameNoAccent, {
        lower: true,
        strict: true
    });

    // Xử lý rút gọn cho search_key
    const words = nameNoAccent.split(/\s+/); // ['milk', 'cotton']

    const initials = words.map(w => w[0]).join('');              // 'mc'
    const noSpace = words.join('');                              // 'milkcotton'
    const twoCharWord = words.map(w => w.slice(0, 2)).join(''); // 'mico'

    const search = [noSpace, initials, twoCharWord].join(',');

    return { slug, search };
}

module.exports = {
    generateSlugAndSearchKey
};