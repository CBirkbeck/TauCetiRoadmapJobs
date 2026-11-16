# Review of CMRankZeroConverse (pull request #1744 at 121e457)

**Verdict:** accepted

No findings. Incremental re-review of 0 changed lines since 121e457: this round reads the pull request's title and description against the head. Acceptance is subject to the thirteen declared supplier gaps and means ready for a human's final approval.

## Previous findings

- none: the review of 121e457 raised no finding (its two bullets recorded the repairs of the review before it, which stand at this unchanged head).

## Verified sound

| Statement (as the description cites it) | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| `ellipticLNonvanishingAtOne`: “central nonvanishing for Mathlib's `WeierstrassCurve.LSeries` via its unique continuation” | Candidates F, 0, 2F; `congruentTwist` at n=0, 1, 5 | Limits along the real axis 1, 0, 2, so only F agrees on Re(s)>3/2. Δ=0, 64, 10⁶; n mod 8 = 1 and 5 give signs +1, −1. | Description matches `Suggested.lean` lines 45–48; no change. |
| “corank and analytic order both double … rank-zero p-converse at every prime” (§§4.3–4.5) | r=0, 1, 2; F=(s−1)^r·u with u(1)=2 | Orders of F² are 0, 2, 4, leading values 4. 2r=0 only for r=0; at r=1 corank over K is 2 and §4.2 says nothing. | Description claims rank zero only, as the head does; no change. |
| “exact half-density … in two orderings” (§§5.3–5.4) | Squarefree n≤10⁵; fundamental d, 0<\|d\|≤10⁵ | Residues 1,2,3,5,6,7: 10126, 10132, 10131, 10134, 10135, 10136; even classes 30389 of 60794. Discriminants: 30371 of 60787. | Ratios 0.49987 and 0.49963, consistent with limit 1/2; no change. |
| “at least half … when three is split or ramified in K” (§6.1) | ℚ(√−2), ℚ(i), ℚ(ζ₃) | Mod 3: T²+2=(T−1)(T+1); T²+1 irreducible; T²+T+1=(T−1)². `(3)` non-prime, prime, non-prime. | The Lean hypothesis `¬ IsPrime` is exactly “split or ramified”; no change. |

The rows of the other statements stand as in the previous review, of `121e457`.

- Title and description against the head: the three paragraphs of the summary block and the five prose paragraphs were read sentence by sentence against the README (Summary, Scope, §§0.1, 2.3–3.3, 4.2–4.5, 5.2–5.4, 6.1–6.6, Downstream consumers) and `Suggested.lean`; no sentence is contradicted, and the text presents the change as a new folder (858 insertions, 0 deletions, nothing outside it).
- Suppliers: the 17 `From TauCetiRoadmap.*` subsections are 5 roadmaps on main (ModularForms, EllipticCurves, AlgebraicCurves, PadicMeasuresIwasawaAlgebras, ImaginaryQuadraticClassNumber) and 12 open ones, the same 12 as the `depends-on` block.
- Validation sentence: 7 `sorry` warnings and nothing else from `lake env lean` on `Suggested.lean`; 4 definitions with real bodies; no `set_option`; outside-folder diff empty.
- Gate, run afresh: `set_option=0 … statement-hygiene=0 … readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate also reports `build=0`.
- Dependency check: `depcheck: 234 roadmaps, 2233 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Cross-roadmap citations resolved this round: 1 (ModularIwasawaMainConjecturesPartII §§CZ.4–CZ.6: its open README, line 35, maps the former CZ numbering to Layers 6–8, so the citation stays valid); the resolver lists no citation found nowhere. Library declarations opened: 1 (`WeierstrassCurve.LSeries`, `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` line 84: a raw Dirichlet series, no continuation).
- Remark: “everything else named in the README is a consumer” is loose for RankOneConverse, NonordinaryCMSpecialValues and InertAnticyclotomicCMMainConjecture, which the Scope names for contrast; none is a prerequisite, which is what the sentence is for.
- Overlap check: read RankZeroOneBSDPartII, RankOneConverse, ModularIwasawaMainConjecturesPartII, KatoEulerSystems, ArithmeticStatisticsPartI (open) and ModularForms (main). The rank-r p-converse proposition: owner CMRankZeroConverse §0.1, cited by RankZeroOneBSDPartII lines 292, 305. The squareclass height: owner ArithmeticStatisticsPartI §0.5; the local `squareclassHeight` is a declared restatement in another namespace. The CM Kato equality: owner ModularIwasawaMainConjecturesPartII. Nothing else shared.
- Source independence: changed passages only: 0 passages compared, since no text of the folder changed; largest share BT, 35 of 55 line locators; the layers are unchanged, so the contents were not compared again.

## Not verifiable

- The sections of KatoEulerSystems and of the other eleven open suppliers were not reread this round (untouched citations); the resolver reports none missing at their open heads.
- “4 independent review rounds and 2 red-team rounds” agrees with the reports in `packages/CMRankZeroConverse/reports`; the model named in that sentence cannot be checked from the files.

## Source issues

- **Error** in BT at proof of Theorem 1.1, arXiv v2 p. 6 (BT line 256): the source says the dual Selmer module tensored with the CM field equals untwisted modular finite Selmer spaces; it should be a rational Tate-module comparison over p-adic splitting coefficients, with central twists and conjugate summands; affects the proof.

## For the human reviewers

- **Scope/conditionality.** The headline theorems rest on thirteen declared supplier gaps (README, `## Exact supplier contracts`), among them the unconditional Smith law and the CM three-Selmer proportion asked of ArithmeticStatisticsPartVII; acceptance does not certify that those suppliers will state them.
- **Licence.** BT was read as arXiv:2506.03465v2; the README's References give a journal publication (Annals of Mathematics 203, 2026) that this review did not check against the journal, and all BT locators are the arXiv version's.
- **Licence.** BKLOS was read from an author's page (`sources.toml`, `licence_class = "author-page"`); its locators are those of the 25-page author version, not the journal's pagination.
