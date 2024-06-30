import 'package:madang/constant/state.dart';
import 'package:madang/core/core.dart';

import '../../../../constant/app_colors.dart';
import '../../../../constant/url_assets.dart';
import '../../../../widgets/button/default_button.dart';

class SignInGoogleWidget extends StatelessWidget {
  const SignInGoogleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CredentialBloc, CredentialState>(
      builder: (context, state) {
        if (state.status == GlobalStateStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return DefaultButton(
          title: 'Login by Google',
          iconUrl: UrlAssets.googleLogo,
          elevation: 0,
          onTap: () {
            context.read<CredentialBloc>().add(OnGoogleSignIn());
          },
          backgroundColor: AppColors.white,
          color: AppColors.primaryMain,
        );
      },
      listener: (context, state) {
        if (state.status == GlobalStateStatus.error) {
          print('errr');
        }
      },
    );
  }
}
