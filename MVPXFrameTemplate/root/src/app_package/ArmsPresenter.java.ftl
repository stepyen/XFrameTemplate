package ${presenterPackageName};

import android.app.Application;

import com.stepyen.xframe.integration.AppManager;
<#if needActivity && needFragment>
import com.stepyen.xframe.di.scope.ActivityScope;
<#elseif needActivity>
import com.stepyen.xframe.di.scope.ActivityScope;
<#elseif needFragment>
import com.stepyen.xframe.di.scope.FragmentScope;
</#if>
import com.stepyen.xframe.mvp.BasePresenter;
import com.stepyen.xframe.http.imageloader.ImageLoader;
import me.jessyan.rxerrorhandler.core.RxErrorHandler;
import javax.inject.Inject;

import ${contractPackageName}.${pageName}Contract;

<#import "root://activities/MVPXFrameTemplate/globals.xml.ftl" as gb>

<@gb.fileHeader />
<#if needActivity && needFragment>
@ActivityScope
<#elseif needActivity>
@ActivityScope
<#elseif needFragment>
@FragmentScope
</#if>
public class ${pageName}Presenter extends BasePresenter<${pageName}Contract.Model, ${pageName}Contract.View> {
    @Inject
    RxErrorHandler mErrorHandler;
    @Inject
    Application mApplication;
    @Inject
    ImageLoader mImageLoader;
    @Inject
    AppManager mAppManager;

    @Inject
    public ${pageName}Presenter (${pageName}Contract.Model model, ${pageName}Contract.View rootView) {
        super(model, rootView);
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        this.mErrorHandler = null;
        this.mAppManager = null;
        this.mImageLoader = null;
        this.mApplication = null;
    }
}
