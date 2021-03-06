--
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND  `SourceGroup`=1 AND `SourceEntry`=49947;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 49947, 0, 0, 31, 0, 3, 19871, 0, 0, 0, 0, '', 'Laser - only targets Bunny');

-- Scavenge-bot 004-A8 SAI
SET @ENTRY := 25752;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id` >=3;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,3,0,1,0,100,0,5000,5000,15000,20000,11,49947,0,0,0,0,0,19,19871,25,0,0,0,0,0,"Scavenge-bot 004-A8 - Out of Combat - Cast 'Cutting Laser'"),
(@ENTRY,0,4,0,1,0,100,0,20000,25000,35000,40000,5,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scavenge-bot 004-A8 - Out of Combat - Play Emote 35");
