# Review of AlgebraicModuliForArithmeticGeometry (pull request #3027 at 3bddf73)

**Verdict:** accepted

**Summary.** An incremental re-review of the 110 lines changed since `644c332`. Every changed line is a `*Needs:*` line: 42 that replace "SchemeAndStackFoundations Layer N" by the sections used, and 13 that are new. All but two come with the merge of `main`; the pull request's own change is that §9.10 now takes the projection formula from SchemeAndStackFoundations §2.18, which is where it is stated. Every cited section, internal name and library declaration was resolved and none is missing. There are no findings; two small corrections and one format note, none blocking, and nothing is left for a human to decide.

## C01 — Three `*Needs:*` glosses name something the cited section does not state

A reader who follows the citation looks for a notion that is not there. In §9.10 the lines for `algebraicAdjointVanishing` (line 10135) and `uniformAdjointVeryAmpleness` (line 10150) cite "SchemeAndStackFoundations §5.3 (nef divisors through intersection numbers)" and "§5.3 (nef classes)". That section defines the first Chern class operation `c_1(L) ∩ −` and its degree on curves; the word "nef" occurs nowhere in SchemeAndStackFoundations, and this README uses nefness without defining it. In §5.1 (line 8357) the gloss of §§1.1, 1.14 and 1.15 reads "groupoids and their quotients", while §1.14 has groupoids and stabilizers and no quotient (quotient stacks are §1.21, which the same line already cites).

These three glosses are in the text of `main` that the merge brought in; the citations themselves are right. The smallest change: write "§5.3 (the degree of `c_1(L)` on curves, by which nefness is stated)" in both lines, with one clause in §9.10 saying that a divisor is nef when that degree is nonnegative on every integral curve, and "groupoids and their stabilizers" in line 8357.

## C02 — The description does not say that this roadmap gains §9.12

The description names this roadmap once, for the correction of a `*Needs:*` line in §9.10, and otherwise covers it only by "49 existing roadmaps receive 196 sections". Against `main` the folder gains a section with a new target, §9.12 (`globalDivisionByGenerators`, the Ein–Lazarsfeld global division theorem), two sentences that cite it, and three lines of the module docstring of `Suggested.lean`. A sentence such as "AlgebraicModuliForArithmeticGeometry gains §9.12 (Ein–Lazarsfeld global division, Proposition 1.2 (ii)); in its `Suggested.lean` only the module docstring changes" would state it.

## N01 — `AlgebraicGeometry.Scheme.Pullback` is a namespace, not a declaration

The `*Needs:*` line of §7.6a (line 9333) cites Mathlib `AlgebraicGeometry.Scheme.Pullback`; at the pin this is the namespace opened in `Mathlib/AlgebraicGeometry/PullbackCarrier.lean:37`. "Mathlib's fibre products of schemes (`Mathlib/AlgebraicGeometry/Pullbacks.lean`)" would say what is used.

## Previous findings

The previous review (of `644c332`) had no finding, no small correction and no format note. §9.12, its Checks and the docstring of `Suggested.lean` are unchanged since that head.

## Verified sound

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| §9.10 `logFrobeniusSplitting` proof, *Needs* (line 10102): projection formula from SSF §2.18 | SSF §2.18 API list (line 5058); SSF §2.6; whole-file search for "projection formula" | §2.18 declares `projectionFormula` beside `totalDirectImage`; §2.6 has none; other hits are Chow-level (§§5.3–5.7) | Repointing is correct; none |
| §9.10 `algebraicMultiplierIdeal`, *Needs* (line 10139) | SSF §2.6, §2.18, §2.20 | §2.6 `qcoh_higherDirectImages`; §2.18 `projectionFormula`; §2.20 `ω_{X/Y}`, `relativeDualizingModule_smooth` | Each used item is in its section; none |
| §9.10 `nefMixedIntersectionBound`, *Needs* (line 10154) | `n = 1`, `n = 2`; SSF §4.13, §5.3, §5.10 | `n = 1`: `H ≤ H`; `n = 2`, `p = 2`: `H² · L² ≤ (H·L)²` is `hodge_index` (§5.10, surfaces); §4.13 `bertini_smoothness` cuts down | Needs match the route; none |
| §9.10 nef glosses (lines 10135, 10150) | SSF searched for "nef"; §5.3 read | 0 occurrences of "nef"; §5.3 has `c_1(L) ∩ −`, `c1_degree_curve` | Citation right, gloss loose; C01 |
| §1.5 *Needs* (line 602), sampled | SSF §§5.1–5.3 | §5.1 cycles and `CH_k`; §5.2 `deg : CH_0(X) → ℤ` for proper `X`; §5.3 `c_1` | Agree; none |
| §3.5 *Needs* (line 1650), sampled | §3.1 of this README; SSF §§1.4, 1.8, 1.9 | `spaceFpqcQuasicoherentDescent` (line 1092), `finiteLocallyFreeDescent` (line 1062) in §3.1; `AlgSpace.ofScheme`; fppf-local `RepresentableProperty`; `IsProperSpace` | Agree; none |
| §7.6.1 rigidified objects, *Needs* (line 9296), sampled | SSF §1.8, §1.11 | `isAlgebraicSpace_pullback`; `QCoh.pullback`, `QCoh.invertible_aut` (`Γ(F, O)^×`) | Agree; none |
| §7.7 *Needs* (line 9354), sampled | SSF §§1.8–1.11, §2.1, §2.18; pins | `structureSheaf F` on `smallEtale F`; `QCoh.presentationEquiv`; `Sheaf.higherDirectImage`; `DQCoh`, `perfect_dual`, `derivedPullback`; `TauCeti.SheafOfModules.IsInvertible` at `Invertible/Basic.lean:70` | Agree; none |
| §9.4 *Needs* (line 9980), sampled | ResolutionOfSingularitiesCharacteristicZero §§5.1–5.5, §7.8; SSF §4.17 | Headings 5.1 Principalization … 5.5 Local-isomorphism resolution; 7.8 Field and affinoid specializations; §4.17 SNC data | Agree; none |
| §9.5 *Needs* (line 10009) | Resolution §§6.1–6.3; CrystallineCohomology §CR.5.1 | 6.1 Projective closure, 6.2 SNC compactification, 6.3 Cartier separation; CR.5.1 "Log differentials, residues and the Cartier isomorphism" | Agree; none |
| §7.10.2 *Needs* (line 9449) | AdicSpacesPartII R0.4, R0.5, R0.9, R0.13, R0.16–R0.18, R1.1, R1.3 | All nine headings exist with the glossed subjects (spectral seminorm, Banach modules, K-affinoid algebras, finite, étale, affinoid subdomains, analytification) | Agree; none |
| §7.8 *Needs* (line 9380) | Internal names; SSF §§4.1, 4.4, 4.10, 4.12; StableReduction Layer 2 | Names defined in §§2.3, 3.5, 6.1, 7.1 (lines 942, 1632, 8595, 8733–8768); `grothendieck_existence`, `chow_lemma`; §2.1 "Coherent cohomology in families" | Agree; none |
| §5.1 *Needs* (line 8357) | SSF §§1.1, 1.14, 1.15 | §1.1 `qcoh_fpqc_descent`; §1.14 groupoids, stabilizers, no quotient; §1.15 torsors | Gloss loose on §1.14; C01 |

The rows of the previous review for §9.12 and its Checks stand as in that review, of `644c332`: the diff changes no statement.

- **Changed passages.** 55 `*Needs:*` lines (42 rewritten, 13 new); no statement, Check, locator, heading or Lean declaration changed. Against `main` only lines 10102 and 10139 differ from the merged text.
- **Seeded sample.** Five targets lie in changed lines (§1.5, §3.5, §7.6.1, §7.7, §9.4) and are rows above; the other ten (§§1.1, 3.3a, 4.5, 4.11, 4.14, 4.16, 4.18, 7.6.3, 9.1, 9.6) are in untouched text and were not re-read. No source locator was added or changed, so none was re-opened.
- **Cross-roadmap citations resolved:** SchemeAndStackFoundations, the 48 distinct sections the changed lines name in Layers 0, 1, 2, 4 and 5, each heading read on `main` (the pull request does not change that roadmap); AdicSpacesPartII 9; ResolutionOfSingularitiesCharacteristicZero 9; CrystallineCohomology 1; StableReduction 1; ModularCurves §0E (its label table maps Layer 0E to Layer 0.5). All five further suppliers are on `main` and unchanged by the pull request.
- **Library declarations opened at the pins:** 8 — `TauCeti.AlgebraicGeometry.LineBundleClass` (`LineBundle/Class.lean:50`), `TauCeti.SheafOfModules.IsInvertible` (`Invertible/Basic.lean:70`), Mathlib `CategoryTheory.presheafToSheaf` (`Sites/Sheafification.lean:74`), `DerivedCategory` (`DerivedCategory/Basic.lean:87`), `SheafOfModules` (`ModuleCat/Sheaf.lean:31`), `WittVector` (`WittVector/Defs.lean:52`), `ValuationRing` (`Valuation/ValuationRing.lean:64`), namespace `AlgebraicGeometry.Scheme.Pullback` (`PullbackCarrier.lean:37`).
- **Record.** Against the merge base: 0 headings removed, 1 added (§9.12); 9 layers kept under their ids; no Lean declaration added, removed or restated.
- **Automatic checks.** The worker's run passed every check. Dependency check: `depcheck: 130 roadmaps, 1453 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- **Elaboration of `Suggested.lean`.** Five `sorry` warnings (lines 50, 75, 89, 121, 133), nothing else; the file is unchanged since `644c332`, so the signatures and the one-tactic probe stand as before.
- **Pull request text.** "AlgebraicModuliForArithmeticGeometry §9.10 (the projection formula is SchemeAndStackFoundations §2.18)" holds at this head. The addition of §9.12 is unstated (C02). No file outside the pull request's own folders is changed.

Overlap check: read FunctionFieldArithmeticPartII, SchemeAndStackFoundations, FunctorOfPoints, ResolutionOfSingularitiesCharacteristicZero, StableReductionPartII (scopes as in the previous review; the change adds no object); nothing newly shared. Nefness of classes is defined in AlgebraicModuliForArithmeticGeometryPartII §1.5, a consumer of this roadmap, so it cannot be cited from here (C01).

Source independence: changed passages only; 0 passages compared with 0 sources, since the change consists of `*Needs:*` lines naming roadmap sections and library declarations and carries no source wording or locator. Arrangement not compared: no layer added, removed or reordered.

Research link: §9.12 is Ein and Lazarsfeld's global division theorem (1999, Proposition 1.2), the algebraic form of Skoda's theorem behind their geometric effective Nullstellensatz; Ein–Lazarsfeld–Smith (2001) use the same multiplier ideals for symbolic powers. Rests on the README and the two sources read.

## Not verifiable

- Lazarsfeld 2004, *Positivity in Algebraic Geometry II*, §9.6 (secondary locator of §9.12): a paywalled book, recorded as uncertified; not read.
- The numbering of the published Inventiones version of Ein–Lazarsfeld 1999: the arXiv v3 was read, which the reference line names.

## Source issues

- none

## For the human reviewers

- none
