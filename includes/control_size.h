#ifndef CONTROL_SIZE_H
#define CONTROL_SIZE_H

// Qt
#include <QObject>

namespace presentation
{
    class ControlSize
    {
        Q_GADGET

        Q_PROPERTY(int baseSize READ baseSize WRITE setBaseSize)
        Q_PROPERTY(int inputControlHeight READ inputControlHeight WRITE setInputControlHeight)
        Q_PROPERTY(int fontSize READ fontSize WRITE setFontSize)
        Q_PROPERTY(int secondaryFontSize READ secondaryFontSize WRITE setSecondaryFontSize)
        Q_PROPERTY(int spacing READ spacing WRITE setSpacing)
        Q_PROPERTY(int margins READ margins WRITE setMargins)
        Q_PROPERTY(int padding READ padding WRITE setPadding)
        Q_PROPERTY(int rounding READ rounding WRITE setRounding)
        Q_PROPERTY(int underline READ underline WRITE setUnderline)
        Q_PROPERTY(int shadowSize READ shadowSize WRITE setShadowSize)

    public:
        int baseSize() const;
        void setBaseSize(int baseSize);

        int inputControlHeight() const;
        void setInputControlHeight(int inputControlHeight);

        int fontSize() const;
        void setFontSize(int fontSize);

        int secondaryFontSize() const;
        void setSecondaryFontSize(int secondaryFontSize);

        int spacing() const;
        void setSpacing(int spacing);

        int margins() const;
        void setMargins(int margins);

        int padding() const;
        void setPadding(int padding);

        int rounding() const;
        void setRounding(int rounding);

        int underline() const;
        void setUnderline(int underline);

        int shadowSize() const;
        void setShadowSize(int shadowSize);

    private:
        int m_baseSize;
        int m_inputControlHeight;
        int m_fontSize;
        int m_secondaryFontSize;
        int m_spacing;
        int m_margins;
        int m_padding;
        int m_rounding;
        int m_underline;
        int m_shadowSize;
    };
}

#endif // CONTROL_SIZE_H
