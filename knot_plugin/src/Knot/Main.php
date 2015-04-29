<?php

namespace Knot\Main;

use pocketmine\command\Command;
use pocketmine\command\CommandSender;
use pocketmine\event\TranslationContainer;
use pocketmine\level\Level;
use pocketmine\network\Network;
use pocketmine\Player;
use pocketmine\plugin\PluginBase;
use pocketmine\utils\TextFormat;

class FastTransfer extends PluginBase{

	private $lookup = [];

	/**
	 * Will transfer a connected player to another server.
	 * This will trigger PlayerTransferEvent
	 *
	 * Player transfer might not be instant if you use a DNS address instead of an IP address
	 *
	 * @param Player $player
	 * @param string $address
	 * @param int    $port
	 * @param string $message If null, ignore message
	 *
	 * @return bool
	 */
	public function transferPlayer(Player $player, $address, $port = 19132, $message = ""){
		$ev = new PlayerTransferEvent($player, $address, $port, $message);
		$this->getServer()->getPluginManager()->callEvent($ev);
		if($ev->isCancelled()){
			return false;
		}

		$ip = $this->lookupAddress($ev->getAddress());

		if($ip === null){
			return false;
		}

		$this->cleanupMemory($player);

		$packet = new StrangePacket();
		$packet->address = $ip;
		$packet->port = $ev->getPort();
		$player->dataPacket($packet->setChannel(Network::CHANNEL_ENTITY_SPAWNING));

		return true;
	}

	/**
	 * Clear the DNS lookup cache.
	 */
	public function cleanLookupCache(){
		$this->lookup = [];
	}


	public function onCommand(CommandSender $sender, Command $command, $label, array $args){
		if($label === "server"){
			if(count($args) < 2 or count($args) > 3 or (count($args) === 2 and !($sender instanceof Player))){
				$sender->sendMessage(new TranslationContainer("commands.generic.usage", [$command->getUsage()]));

				return true;
			}

			/** @var Player $target */
			$target = $sender;

			if(count($args) === 3){
				$target = $sender->getServer()->getPlayer($args[0]);
				$address = $args[1];
				$port = (int) $args[2];
			}else{
				$address = $args[0];
				$port = (int) $args[1];
			}

			if($target === null){
				$sender->sendMessage(new TranslationContainer(TextFormat::RED . "%commands.generic.player.notFound"));
				return true;
			}

			$sender->sendMessage("[Knot] Working...\n[Knot] Done!");
			if(!$this->transferPlayer($target, $address, $port)){
				$sender->sendMessage("[Knot] Working...\n[Knot] ERR: Unknown");
			}

			return true;
		}

		return false;
	}

	/**
	 * @param $address
	 *
	 * @return null|string
	 */
	private function lookupAddress($address){
		//IP address
		if(preg_match("/^[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}$/", $address) > 0){
			return $address;
		}

		$address = strtolower($address);

		if(isset($this->lookup[$address])){
			return $this->lookup[$address];
		}

		$host = gethostbyname($address);
		if($host === $address){
			return null;
		}

		$this->lookup[$address] = $host;
		return $host;
	}

	private function cleanupMemory(Player $player){
		foreach($player->usedChunks as $index => $c){
			Level::getXZ($index, $chunkX, $chunkZ);
			foreach($player->getLevel()->getChunkEntities($chunkX, $chunkZ) as $entity){
				if($entity !== $this){
					$entity->despawnFrom($player);
				}
			}
		}
	}

}