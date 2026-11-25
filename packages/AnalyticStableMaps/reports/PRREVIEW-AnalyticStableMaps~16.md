# Review of AnalyticStableMaps (pull request #2529 at dc68c95)

**Verdict:** accepted

**Summary.** An incremental re-review of 0 changed lines since `dc68c95`, whose subject is the pull request's title and description as they now stand. Accepted: every sentence of the description was read against the change from `main` and against this head, and none is contradicted; the clause on the three reworded "below" sentences, asked for in the previous round, is there and is exact. There are no findings, no small corrections and no format notes, and nothing is left for a human to decide.

## Previous findings

The previous review, of `dc68c95`, was an acceptance with no finding; its one small correction is accounted for.

- C01 (previous) — repaired: the description now ends that sentence "except that three sentences which said "below" of the layers (on the Čech groups, … on the Fredholm statements and the absence of relative classes, in the Mathlib contracts) now say "in this roadmap"". A word-by-word comparison of the three moved sections with `main` shows exactly these three rewordings beside the listed additions.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Description: main's §7.3 submersion "on all of `X_I^reg`" fails on §2.23's curves with `g = 1`, `dim_ℝ F = 2` | `Σ × {p}` in `Σ × F`, `m = 2`, `c₁(β) = 0`, `dim E_I = 2` | `v = 0`; real cokernel dimension 2; `dim X_I^reg = 0 + 2 = 2`; zero set of `s_I` contains the 2-dimensional family F, open in a 2-manifold | holds: `s_I` vanishes on an open set, so it is no submersion to `ℝ²` | none |
| Description: index `D(u) − 2Z(du)` and `c₁(T_u) = χ(Σ) + Z(du)` (§0.6–§0.7) | cuspidal cubic in `ℂP²`: `χ = 2`, `c₁ = 9`, `Z = 1` | `c₁(T_u) = 3`, `c₁(N_u) = 6`; `(m−1)χ + 2c₁(N_u) = 2 + 12 = 14`; `D(u) − 2Z = (−2 + 18) − 2 = 14` | holds | none |
| Description: pullback along branched covers (§0.8) | double cover of a line, `d = 2`, `R = 2`, `Z(dv) = 0` | `Z(du) = 2 + 0 = 2`; `d·ind D_v^N − (m−1)R = 8 − 2 = 6`; `D(u) − 2Z(du) = 10 − 4 = 6`; `h⁰(𝒪(2))` real dimension 6 | holds | none |
| Description: "u is regular exactly when `D_u^N` is onto" (§2.24) | double cover of a line; `Σ × {p}` with `g = 1` | cover: `D_u^N = ∂̄_{𝒪(2)}` onto, `dim ker L_u = 4 + 6 + 6 = 16 = dim ker D_u`; product: cokernel `H^{0,1}(Σ) ⊗ T_pF` of real dimension 2, nonregular | holds on both sides | none |

The rows for all other statements stand as in the previous review, of `dc68c95`: the folder is unchanged.

- Description against the change from `main`: 4 headings added (§0.6, §0.7, §0.8, §2.24), 0 removed or renumbered; `Suggested.lean` changes only item 5 of its module docstring (0 declarations added, removed or restated); the three moved sections compared word by word with the merge base (How to read the build identical; Scope and supplier contracts differ only by the listed additions and the three "below" → "in this roadmap"); the §2.9 conic Check and the §7.3 sentence read as the description says; the diff outside the roadmap folder is empty.
- Cross-roadmap citations of the description resolved on `main`: ComplexKahlerGeometry §4.1 and §4.2 (README lines 854, 910, Koszul–Malgrange at 917); HeegaardFloer F2.6e (line 3029, normal line through `TS² → u*TX → N` at 3141); CharacteristicClasses C2 item 3 (§2.3, line 1203: sum of local indices and `e(TM)[M] = χ(M)`); PseudoholomorphicCurveAnalysis PH6.2; ImplicitAtlases §1.1 (line 232); TaubesGromov TG1 and TG2 (its line 99 maps TGk to Layer k; Layer 1 §1.2 is the embedded normal operator and cites AnalyticStableMaps Layer 2). §9.1 of this README transports the §7.3 product projections to the atlas axiom, as the description says.
- Library declarations of the description opened at the pins: `IsSubbundleFrameOn` (TauCeti/Topology/VectorBundle/Subbundle.lean:134), `IsSubbundleFrameOn.contMDiffOn_coordChangeL` (TauCeti/Geometry/Manifold/VectorBundle/Subbundle.lean:82), `rangeQuotientMap` and `rangeQuotientHomeomorph` (TauCeti/Topology/VectorBundle/QuotientRange.lean:48, 122), the `IsSemisimpleRing` instance (Mathlib/RepresentationTheory/Maschke.lean:168), `isotypicComponent` (Mathlib/RingTheory/SimpleModule/Isotypic.lean:182).
- Source locators of the description checked against the texts: the cached texts are arXiv v4 of Wendl 2010 (wendl10 line 5) and v7 of Wendl 2023 (wendl23 line 5), as the description says; Lemma 3.8, Theorem 3, Corollaries 3.13 and 3.17, Lemmas 3.14–3.15 at wendl10 lines 1175, 1451, 1462, 1592, 1500–1501; Proposition 2.2, the definition of super-rigid and Example 3.9 at wendl23 lines 458, 462, 1189.
- Seeded sample: no changed passage, so none of the fifteen targets falls in one; no source locator is touched.
- Automatic checks at this head: all passed. Dependency check: `depcheck: 124 roadmaps, 1405 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- `lake env lean` on `TauCetiRoadmap/AnalyticStableMaps/Suggested.lean` exited 0 with three `sorry` warnings (lines 106, 129, 162) and nothing else.
- Overlap check: read HeegaardFloer, ComplexCurveModuli, GromovWittenTheory, ComplexKahlerGeometry, TaubesGromov; the embedded-sphere normal operator is owned by HeegaardFloer F2.6e and cited by §0.7, the embedded-curve and twisted torus operators by TaubesGromov Layers 1–2 (a consumer, named as such), Koszul–Malgrange by ComplexKahlerGeometry §4.2; nothing else shared. No open pull request changes this roadmap or drops an id it cites.
- Source independence: changed passages only; 0 passages changed in the folder, so 0 compared with 0 sources, none shared; largest share pardon13, 28 of about 63 named locators; the change adds, removes and reorders no layer, so the contents comparison stands: independent.
- Research link: §0.6–§0.8 and §2.24 are the normal operator and regularity criterion of Wendl (2010) and the super-rigidity setting of Wendl (2023); Layers 5–9 build Pardon's (2013) implicit atlas on stable maps; Layer 3 is the compactness theorem of Ivashkovich–Shevchishin (1999). Rests on the README's References and the texts read.

## Not verifiable

- Ivashkovich–Shevchishin, Invent. Math. 136 (1999): paywalled, settled as uncertified; cited by locator only, as the description says.
- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology*: not available from an open source; cited only in untouched text.

## Source issues

- none

## For the human reviewers

- none
