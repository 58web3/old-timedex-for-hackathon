const TeamService = require("../services/team");

const create = async function (req, res) {
  try {
    // get parameter
    const userId = req.user_id;
    const teamData = {
      team_name: req.body.team_name,
      team_description: req.body.team_description,
      team_members: req.body.team_members
    }
    // return response
    const team = await TeamService.create(teamData, userId);
    res.status(200).json({
      message: 'Success',
      ...team
    });
  } catch (error) {
    logger.error(error);
    res.status(500).json({
      message: 'Service Unavailable',
    });
  }
};

const getByKey = async function (req, res) {
  // get parameter
  const teamId = req.params.team_id;

  const team = await TeamService.getByKey(teamId);
  if (!team) {
    return res.status(404).json({
      message: 'Not found',
    });
  }

  res.status(200).json(team);
}

const getTeams = async function (req, res) {
  try {
    // get parameter
    const userId = req.user_id;
  
    const teams = await TeamService.getTeams(userId);
  
    res.status(200).json({
      message: 'Success',
      user_teams: teams
    });
  } catch (error) {
    logger.error(error);
    res.status(500).json({
      message: 'Service Unavailable',
    });
  }
}

const update = async function (req, res) {
  try {
    //get parameter
    const teamId = req.params.team_id;
    const userId = req.user_id;
    const teamData = {
      team_id: teamId,
      team_name: req.body.team_name,
      team_description: req.body.team_description,
      team_members: req.body.team_members
    }
  
    const result = await TeamService.update(teamData, userId, res);
  
    if (result.statusCode >= 400) {
      return result;
    }
  
    res.status(200).json({
      message: "Success",
      team_id: result.team_id
    });
  } catch (error) {
    logger.error(error);
    res.status(500).json({
      message: 'Service Unavailable',
    });
  }
}
module.exports = {
  create,
  getTeams,
  getByKey,
  update
};
