package as2.dialog 
{
	import flash.display.InteractiveObject;
	import org.component.dialog.DialogMessage;
	import org.component.dialog.DialogOptionComponent;
	import org.component.dialog.DialogPartner;
	import org.component.Message;
	
	/**
	 * ...
	 * @author Marek Kapolka
	 */
	public class GoodbyeOptionComponent extends DialogOptionComponent 
	{
		public static const CLOSE_TEXT_GOODBYE : String = "close_text_goodbye";
		public static const CLOSE_TEXT_EXIT : String = "close_text_exit";
		public static const CLOSE_TEXT_LEAVE : String = "close_text_leave";
		
		public static const SHOW_CLOSE_TEXT : String = "show_close_text";
		public static const HIDE_CLOSE_TEXT : String  = "hide_close_text";
		
		private var _currentPartner : DialogPartner;
		
		public function GoodbyeOptionComponent() 
		{
			super();
		}
		
		override public function initialize():void
		{
			super.initialize();
			
			super.setText("Goodbye");
			_trigger = "up";
		}
		
		override public function setText(s : String):void
		{
			//Don't do shit
		}
		
		override public function receiveMessage(message : Message):void
		{
			if (message.type != DialogMessage.SHOW_RESPONSE && message.type != DialogMessage.OPEN_DIALOG)
			{
				super.receiveMessage(message);
			}
			
			if (message.type == SHOW_CLOSE_TEXT)
			{
				setHidden(false);
				text.active = true;
			}
			
			if (message.type == HIDE_CLOSE_TEXT)
			{
				setHidden(true);
				text.active = false;
			}
			
			if (message is DialogMessage)
			{
				var dm : DialogMessage = message as DialogMessage;
				
				if (dm.type == DialogMessage.OPEN_DIALOG)
				{
					_currentPartner = dm.partner;
					
					if (_currentPartner is CharacterDialogPartner)
					{
						setHidden(false);
						super.setText("Goodbye");
						text.active = true;
					} else if (_currentPartner is SmartphoneDialogPartner) {
						super.setText("Exit");
						setHidden(false);
						text.active = true;
					} else {
						setHidden(true);
						super.setText("Goodbye");
						text.active = true;
					}
				}
			}
		}
		
	}

}