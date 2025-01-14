/*
 * Copyright 2017 Google Inc.
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */


#ifndef SkJpegPriv_DEFINED
#define SkJpegPriv_DEFINED

#include "include/codec/SkEncodedOrigin.h"
#include "include/core/SkStream.h"
#include "include/private/base/SkTArray.h"

#include <setjmp.h>
// stdio is needed for jpeglib
#include <stdio.h>

extern "C" {
    #include "jpeglib.h"
    #include "jerror.h"
}

/*
 * Error handling struct
 */
struct skjpeg_error_mgr : jpeg_error_mgr {
    class AutoPushJmpBuf {
    public:
        AutoPushJmpBuf(skjpeg_error_mgr* mgr) : fMgr(mgr) {
            fMgr->fJmpBufStack.push_back(&fJmpBuf);
        }
        ~AutoPushJmpBuf() {
            SkASSERT(fMgr->fJmpBufStack.back() == &fJmpBuf);
            fMgr->fJmpBufStack.pop_back();
        }
        operator jmp_buf&() { return fJmpBuf; }

    private:
        skjpeg_error_mgr* const fMgr;
        jmp_buf fJmpBuf;
    };

    skia_private::STArray<4, jmp_buf*> fJmpBufStack;
};

namespace SkJpegPriv {
SkEncodedOrigin get_exif_orientation(jpeg_decompress_struct* dinfo);
}

#endif
