package as2.dialog 
{
	import as2.flixel.MaskComponent;
	import org.component.Component;
	import org.component.dialog.DialogMessage;
	import org.component.flixel.AnimatedFlxSpriteComponent;
	import org.component.Message;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Marek Kapolka
	 */
	public class DialogPortraitComponent extends Component 
	{
		public static const SET_MASK_TYPE : String = "dialog_portrait_set_mask";
		
		public function DialogPortraitComponent() 
		{
			super();
			
			addRequisiteComponent(AnimatedFlxSpriteComponent);
		}
		
		public function get sprite():FlxSprite
		{
			var afsc : AnimatedFlxSpriteComponent = (AnimatedFlxSpriteComponent)(getSiblingComponent(AnimatedFlxSpriteComponent));
			
			if (afsc != null)
			{
				return afsc.sprite;
			} else {
				return null;
			}
		}
		
		public function setSpriteIndex(index : uint):void
		{
			sprite.visible = true;
			sprite.frame = index;
		}
		
		override public function receiveMessage(message : Message):void
		{
			super.receiveMessage(message);
			
			if (message is DialogMessage)
			{
				var dm : DialogMessage = (DialogMessage)(message);
				
				switch (dm.type)
				{
					case DialogMessage.OPEN_DIALOG:
					case DialogMessage.UPDATE_PARTNER:
						if (dm.partner is AS2DialogPartner)
						{
							setSpriteIndex((AS2DialogPartner)(dm.partner).portraitID);
						} else {
							sprite.visible = false;
						}
					break;
				}
			}
		}
		
	}

}