const fs = require('fs');

const uploadToIPFS = async function (file) {
  const ipfsClient = await import('ipfs-http-client');
  const projectId = process.env.IPFS_PROJECT_ID;
  const projectSecret = process.env.IPFS_PROJECT_SECRET;
  const auth =
    'Basic ' + Buffer.from(projectId + ':' + projectSecret).toString('base64');

  const client = ipfsClient.create({
    host: process.env.IPFS_HOST,
    port: 5001,
    protocol: 'https',
    headers: {
      authorization: auth,
    },
  });

  const result = await client.add(file);

  console.log(result)
  return result.path;
}

async function readFileFromIpfs(cid) {
  const ipfsClient = await import('ipfs-http-client');
  const projectId = process.env.IPFS_PROJECT_ID;
  const projectSecret = process.env.IPFS_PROJECT_SECRET;
  const auth =
    'Basic ' + Buffer.from(projectId + ':' + projectSecret).toString('base64');

  const client = ipfsClient.create({
    host: process.env.IPFS_HOST,
    port: 5001,
    protocol: 'https',
    headers: {
      authorization: auth,
    },
  });

  const contentStream = client.cat(cid)

  let content = ''
  for await (const chunk of contentStream) {
    content += chunk.toString()
  }

  /**
   * return value
    BEGIN:VCALENDAR
    VERSION:2.0
    PRODID:-//TimeDex//ENBEGIN:VEVENT
    UID:mYwUw_gFHL5Z3qhXtUuCR
    SUMMARY:Bolder Boulder
    DTSTAMP:20230310T092103Z
    DTSTART:20180529T233000Z
    DESCRIPTION
   */
  return content;
}

module.exports = {
  uploadToIPFS,
  readFileFromIpfs
};
