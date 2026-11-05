# Review of ScatteringDiagrams (pull request #1134 at 1ac71c8)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ScatteringDiagrams/README.md` (2491 lines) and `TauCetiRoadmap/ScatteringDiagrams/Suggested.lean` (2330 lines, 256 declarations) at head 1ac71c83. The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD` outside it: empty). No P1 or P2 finding survived: the mathematics checked in the seeded sample and in the adversarial pass is sound, the supplier contracts now resolve at the pins, and the build is clean. The verdict is "needs changes" only because the push gate still fails (`tex=6`, R01) and because the Lean file and the README still carry the catalogue shape the previous review asked to cut (R02, R03); the remaining findings are locators and names.

## Status of the previous review's findings (r3 at 7a93e00)

| r3 finding | Status at 1ac71c8 | Evidence |
|---|---|---|
| R01 (P1) Hopf structure on `U_R(g)` unowned | **Repaired, and the r3 witness was wrong.** | `TauCeti/Algebra/Lie/UniversalEnveloping/HopfAlgebra.lean` line 162 at Tau Ceti 358314d4 declares `instHopfAlgebra : HopfAlgebra R U` for any `[CommRing R] [LieRing L] [LieAlgebra R L]`; `TauCeti/Algebra/HopfAlgebra/HopfIdeal/Augmentation.lean` line 61 declares `augmentation`. The README's supplier table (lines 88–89) and §0.4 (lines 270–271, 291) now cite them; `Suggested.lean` lines 2–3 import both modules and line 136 uses `(augmentation ℚ …).carrier`. |
| R02 (P2) no headline stated | **Partly.** | Lines 136–176 state `comap_freeAugmentation_pow_ι`, `exists_bch_exp_mul_exp`, `exists_pbwSymmetrizationEquiv`; line 2297 states `FocusFocus.modelTheta_mul`; the docstring (lines 20–26) names the unstatable headlines with the missing carrier. The catalogue around them remains (R02 below). |
| R03 (P2) sorry'd data | **Repaired.** | Gate `sorry-data=0`; all 39 `sorry` occurrences are in `theorem`s (list of the 38 sorried declarations checked by hand; `fiberwiseLimit`, `truncatedLie_nilpotent`, `ObjectSection.pullback`, `weightZeroUnitAut` are gone). |
| R04 (P3) imports | **Repaired.** | Lines 1–6: `import Mathlib` plus five `TauCeti.*` modules, all present at 358314d4. |
| R05 (P3) LaTeX display | **Partly.** | The `\[ … \]` display is gone (README line 2238 is now a fenced block), but the gate's `tex` rule still fires on it six times (R01 below). |
| R06 (P3) padding | **Partly.** | Every item named in r3 is deleted; proved API lemmas and unused scaffolding remain (R02 below). |
| R07 (P3) `letI` warnings, docstring | **Repaired / partly.** | `lake env lean` reports 38 `sorry` warnings and nothing else; the docstring still reads "suggested forms … not exhaustive" (R03 below). |
| R08 (P3) README shape | **Partly.** | `## Exact supplier contracts`, `## How to read the build`, `## Downstream consumers` added; Convention 4, the italic `*Targets.*` convention and the absence of `### Examples`/`### Dependencies` remain (R03 below). |
| R09 (P3) `PointedCone.FG.finite_face` | **Repaired.** | Line 588 makes finiteness of faces a target; lines 622–625 cite ZIE Chapter 1 and SCH §8.3 (not legally readable here, see Not verifiable). |
| R10 (P3) MAN Theorem 2.6 finite input | **Repaired in substance, locators wrong.** | Lines 1157–1163 add `outgoingCompletion_of_stages` and say MAN 2.6 is the finite case; the GHKK/KS locators attached are wrong (R05 below). |
| R11 (P3) BCH ownership split | **Repaired.** | Lines 37–42 name LieGroups Layer 3 and own `bchElement` here; LieGroups on main (929496d, lines 300–323) owns the analytic identity. See R07 for the open revision pull request. |

## R01 (P3) — Gate `tex` failure: the recursion (R) at README line 2238

**Location.** `README.md` lines 2236–2240: the display `Σ_{s=0}^{p} π_{d₂−q,s}(P₁)·C₊(p−s,q) = Σ_{s=0}^{q} …` inside a fence indented by two spaces under the `*Cplus*, *Cminus*` bullet.

**Claim.** The README passes the push gate.

**Witness.** My gate run at 1ac71c8: `tex=6 … FAIL`, six lines `tex: line 2238: Σ_{s=0}^{p} …`; every other scanner is 0 (`set_option=0 blob=0 latex=0 prnum=0 sorry-data=0 … readme-ids-missing=0 depcheck=0 stray-files=0 dirty=0 outside-folder=0`). The fence is inside a list item, which the scanner does not treat as a code block; the `_{` and `^{` are what it flags. Whether or not that is a scanner limitation, no acceptance while the gate fails.

**Repair.** Write the recursion as an inline code span in the bullet text (`` `Σ_{s=0}^{p} π_{d₂−q,s}(P₁)·C₊(p−s,q) = Σ_{s=0}^{q} π_{d₁−p,s}(P₂)·C₋(p,q−s)` `` labelled (R)), or as a four-space indented block at the top level outside the list; re-run the gate.

## R02 (P3) — `Suggested.lean` is still an API catalogue; padding around the four headlines

**Location.** `Suggested.lean` lines 9–14 ("suggested forms", "not exhaustive … suggest Lean forms for representative carriers and milestones, so that contributors and reviewers converge on names and signatures") and the 252 declarations that no stated headline uses.

**Claim.** The file states the headline theorems with only the definitions they need.

**Witness.** The four headlines use only `FreeLieTwo`, `freeAugmentation` (lines 130–139) and `FocusFocus.Coordinate … modelTheta` (lines 2103–2160, 2270–2295). Everything else is scaffolding: `PositiveDegrees … PositiveDegreeMap` (33–80), the graded-Lie and filtration sections (82–333), the §0.7 category block `DiagramComparison`/`ObjectSection`/`VerticalLabel`/`ActionIntertwiner` (337–435), `GradedCorrespondence` and friends (439–560), the polyhedra and cochain sections (564–1033), `FiniteWallDiagram`, `DirectedWallSpaces`, `DirectedWall`, `OrderFiltration`, `DirectedDiagram`, `ChamberTrivialization` (1037–1410), the §4 and §5 carriers, the probe block (1829–2056), `CoefficientTransitions` (2060–2090) and the §7 subsemirings (2300–2328). Among them are proved API lemmas of the kind the brief excludes: `RationalAffinePolyhedron.isConvexPolyhedron` (line 616, follows from `isConvexPolyhedron_setOf_forall`), `ExceptionalArrangement.generic_dense` (656, Baire in `FiniteDimensional`), `someVector_mem_conormalForms` (948), `CentralKernel.ι_log` (1313, `choose_spec`), `probeDegree_apply` (1878, `simp; ring`), `StationarySource.theta` (1822, a constant function), `DiagramComparison.fromNatTrans/restriction/id/comp` (373–406), `GradedCorrespondence.graph`/`symm` (507, 1612), `OrderFiltration.proj/step`. The one-tactic probe on a scratch copy (three sorried theorems: `coboundaryFree_transverse`, `weightZeroUnitMap_on_piece`, `overlap_w_mul_wInv`) found none that closes in one tactic, so the padding is by content (API lemmas, carriers without a theorem), not by triviality. The docstring also says theta transport is not statable "the module probe" being a target, while lines 1829–2056 define the module probe (`probeGroup`, `ProbeDiagram`, `IsProbeCompletion`, `IsProbeLabelRep`, `probeLabel`, `thetaSum`, `SatisfiesTransitionRecursion`) and then state no theorem about it.

**Repair.** Cut the file to the four headline statements and the definitions they need (`FreeLieTwo`, `freeAugmentation`, the `FocusFocus` model algebra and `modelTheta`); the README keeps every other statement as a target or Check. If the author prefers to keep the probe identity, state it (`probeLabel … = thetaSum …` componentwise on the generic locus, with the graded-action and annihilation hypotheses of §5.1 as classes) rather than leaving its carriers without a theorem; otherwise delete the probe block.

## R03 (P3) — README shape: prototype wording, italic targets, missing layer subsections, headline Lean names absent

**Location.** `README.md` lines 76–78 (Convention 4: "Italicized names are suggested Lean declaration names. The Lean prototype illustrates selected interfaces"), lines 128–134 ("The file is not exhaustive: a target absent from it is still a target, and its italicized name here is a suggested name"), every `*Targets.*` block; no `### Examples` or `### Dependencies` closes any layer.

**Witness.** `grep -o '\*[A-Za-z][A-Za-z_.]*\*' README.md | sort -u | wc -l` gives 246 italic names; the four Lean headline names `comap_freeAugmentation_pow_ι`, `exists_bch_exp_mul_exp`, `exists_pbwSymmetrizationEquiv`, `FocusFocus.modelTheta_mul` occur nowhere in the README (grep: 0 hits), so "every Lean name appears in the README" fails for exactly the statements that matter. Compare `TauCetiRoadmap/HeegaardFloer/README.md` on main (prose targets, backticked names only for declared ones, `### Examples`/`### Dependencies` per layer).

**Repair.** Delete Convention 4 and the "not exhaustive" sentence; name the four headline declarations in backticks at §0.4 (*bchElement* and *pbwSymmetrizationEquiv* targets) and §6.3 (*focusFocusTheta_mul*); keep the other names in plain prose; add `### Examples` and `### Dependencies` to each layer (the Checks and the *Needs* lines already carry the content).

## R04 (P3) — §0.2 *Needs* cites three Mathlib names that do not exist at the pin

**Location.** `README.md` line 223: "`LieIdeal`, `LieIdeal.mkQ`, `LieIdeal.liftQ`, `LieIdeal.lieHom_qext`"; line 123 promises "The other names under *Needs* are Mathlib declarations used with their existing meanings."

**Witness.** At Mathlib f6090c70, `grep -rn "mkQ\|liftQ\|lieHom_qext" Mathlib/Algebra/Lie/` finds no declaration with these names (the only hit is `N.toSubmodule.mkQ` inside `Quotient.lean` line 173). The quotient API there is `LieSubmodule.Quotient.mk'` (line 172), `LieSubmodule.Quotient.lieQuotientLieAlgebra` (line 160) and `LieSubmodule.Quotient.lieModuleHom_ext` (line 202).

**Repair.** Replace the three names by `LieSubmodule.Quotient.mk'`, `LieSubmodule.Quotient.lieQuotientLieAlgebra` and `LieSubmodule.Quotient.lieModuleHom_ext` (with `LieHom.ext` for Lie-algebra maps out of the quotient), or drop them and keep `LieIdeal` and the quotient construction in prose.

## R05 (P3) — §3.3 locators: GHKK Theorem 1.21 is not proved in Appendix C.3, and KS Theorem 2.1.6 is reconstruction, not initial data

**Location.** `README.md` lines 1157–1159 ("GHKK Theorem 1.21, proved in Appendix C.3; KS Theorem 2.1.6") and 1205–1207.

**Witness.** GHKK (cache 141730d2): Theorem 1.21 at line 1012, its item (3) at 1023–1025 (unique outgoing completion of `D_in`), "Proof of Theorem 1.21" at line 1039 from Theorem 1.17 and Proposition 1.20; Appendix C opens (line 4724) "proofs of Theorems 1.28 and 1.13", C.1 (line 4730) is "Construction C.1 … the diagram `D ⊃ D_in` of Theorem 1.21", C.3 (line 5169) is "The proof of Theorem 1.13" (positivity). KS (cache 9c4d34dd): Theorem 2.1.6 (line 511) says "The above three maps are bijections", the `S₁ → S₂ → S₃` bijection between `G` and wall-crossing structures (the §2.3 reconstruction); the initial-data statement is Proposition 3.3.2 (line 1035, "ψ is a bijection of sets") with the uniqueness remark at line 1026 (Remark 3.2.7).

**Repair.** Cite "GHKK Theorem 1.21(3), proved in §1.2 (after Proposition 1.20), with the order-by-order Construction C.1" and "KS Proposition 3.3.2 (Remark 3.2.7 for uniqueness)"; keep MAN Theorem 2.6 for the finite affine case and the new *outgoingCompletion_of_stages* for the order-finite assembly. Appendix C.3 belongs to §7.2 (where it is already cited) only.

## R06 (P3) — Curry is cited without a locator

**Location.** `README.md` line 1752 ("Sources: Curry for *facetDescent*") and the reference at line 2490 (no section, theorem or page).

**Witness.** Every other source citation in the README carries a theorem, section or page. The cached text (56ee23a5, fetched for this review from arXiv 1607.06942v1) has "4. Cellular Sheaves and Cosheaves" at line 412; the statement *facetDescent* needs (locally constant sections over the top strata of a locally finite polyhedral stratification glue uniquely when they agree across facets) is not located in it by this citation.

**Repair.** Give the theorem or definition number of Curry used (the equivalence between sheaves constructible for a cell structure and cellular diagrams, §4), or cite a textbook statement; a target without a locator is a policy defect.

## R07 (P3) — Two open pull requests build the universal formal BCH series

**Location.** `README.md` lines 37–41 (Scope: "The formal BCH series itself is owned here, as §0.4's *bchElement*").

**Witness.** The open revision of LieGroups (pull request #1051, `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` line 459) reads "Baker-Campbell-Hausdorff. Define the formal series `B(X,Y)` by the degreewise Dynkin Lie series in the completed free Lie algebra", and its `Suggested.lean` line 31 lists "Layer 3, the global Baker–Campbell–Hausdorff series". A revision pull request is never a dependency, and LieGroups on main (929496d, line 312) pins its `bch` only analytically, so the Scope sentence is acceptable today; but when #1051 lands there will be two builders of the same object.

**Repair.** None required now. Record in Scope that §0.4 owns the algebraic identification `exp(X)exp(Y) = exp(ι_c b)` in `U(𝔣)/(U⁺)^{c+1}` and the truncations in `𝔣/lowerCentralSeries c`, and that if LieGroups Layer 3 comes to define the series in the completed free Lie algebra, §0.4 consumes it and keeps only that identification.

## Verified sound

**Gate and tooling.** Gate at 1ac71c8 (my run): every scanner 0 except `tex=6` (R01); the worker's record adds `build=1` for the Lake "consider adding `module`" advisory, which is not an error. Dependency check: `depcheck: 205 roadmaps, 1652 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line (the merge order lists ScatteringDiagrams last, line 374). `lake env lean TauCetiRoadmap/ScatteringDiagrams/Suggested.lean`: exit 0 in 19.5 s, 38 warnings, all `declaration uses sorry`, no `letI` or other linter output. Signature transcript: all 24 "dropped binder" leads are instance binders that the elaborated types do carry or do not need (`[DecidableEq N]` on `IsPositiveGrading`, `[Category …]` on the category block, `[NormedSpace ℝ V]` on `edgeVectors`, whose type uses only the additive group). One-tactic probe on a scratch copy: `coboundaryFree_transverse` (type mismatch), `weightZeroUnitMap_on_piece` (unsolved `DFinsupp.sum` goal), `overlap_w_mul_wInv` (unsolved) all fail, so no sorried theorem is one-tactic padding.

**Pinned declarations opened.** Tau Ceti 358314d4: `UniversalEnvelopingAlgebra.instHopfAlgebra` (`Algebra/Lie/UniversalEnveloping/HopfAlgebra.lean` 162, hypotheses `[CommRing R] [LieRing L] [LieAlgebra R L]`), `HopfIdeal.augmentation` (`Algebra/HopfAlgebra/HopfIdeal/Augmentation.lean` 61, needs `[HopfAlgebra R H]`), `pbwAssociatedGradedEquiv` (`PBW/Injective.lean`), `expAd`, `expAd_apply_eq_exp_mul_exp_neg` (`InnerAutomorphism.lean`), `heisenberg` (`Heisenberg.lean`), `IsPrimitive`, `exists_eq_zsmul_isPrimitive` (`Module/Primitive.lean`), `IsIntegralLattice` (`Geometry/Toric/Algebraic/Lattice.lean` 90), `.extend` (184), `.realCharacter` (213), `realCharacter_comp`, `IsLatticeRational`, `IsLatticeRational.fg_dualSemigroup`, `Toric.Fan`, `Fan.IsSubdivision`, `IsConvexPolyhedron`, `isConvexPolyhedron_setOf_forall`. Mathlib f6090c70: `GradedLieAlgebra`, `GradedLieModule` (`Algebra/Lie/Graded.lean`), `lowerCentralSeries`, `LieRing.IsNilpotent` (`Nilpotent.lean`), `FreeLieAlgebra`, `SymmetricAlgebra.ι`, `IsGroupLikeElem` (`RingTheory/Coalgebra/GroupLike.lean` 37), `Bialgebra.IsPrimitiveElem` (`Bialgebra/Primitive.lean` 46), `IsNilpotent.exp`, `Module.End.exp_mul_of_derivation` (`Nilpotent/Exp.lean` 230), `IsFiltration`, `IsRingFiltration`, `IsModuleFiltration`, `GrpCat.sectionsSubgroup`, `GrpCat.limitCone` (`Grp/Limits.lean` 111), `LieAlgebra.SemiDirectSum`, `LieDerivation`, `PointedCone.DualFG`, `PointedCone.IsFaceOf.trans` (`Cone/Face/Basic.lean` 145), `IsExposed`, `intrinsicInterior`/`intrinsicFrontier`, `DyckWord`, `MvPolynomial.idealOfVars`, `truncTotal`, `AddSubmonoid.NSMulSaturated`, `DirectSum.Decomposition.baseChange`, `DirectSum.sum_support_decompose`, `LieAlgebra.ExtendScalars`, `Comma.initial_snd`, `Functor.Initial.limitIso` (`Limits/Final.lean` 706 in `namespace Initial`), `TopCat.PrelocalPredicate.sheafify`, `subsheafToTypes`, `PowerSeries.rescale`, `SemimoduleCat`, `AlgCat`, `Finset.noncommProd`, `Subgroup.normalClosure`, `Pregroupoid`, `StructureGroupoid`, `Localization.Away`, `LieAlgebra.center`. Absent: `LieIdeal.mkQ`, `LieIdeal.liftQ`, `LieIdeal.lieHom_qext` (R04).

**Cross-roadmap citations.** AnalyticToricGeometry is `Completed/AnalyticToricGeometry` on main (929496d). RepresentationTheory/LieGroups on main: Layer 3 heading at line 300, the BCH bullet at 312–323 (analytic pin). RepresentationTheory/LieHighestWeight on main: PBW consumption at lines 407–454 (native ordered PBW basis, "Do not rebuild a second PBW theorem"), consistent with Scope. No other roadmap is cited. Ownership greps over main and the 440 open pull requests (index of 2026-11-03): "scattering diagram", "broken line", "tropical vertex", "Minkowski–Weyl" occur only in this roadmap; "polyhedral complex" once in TropicalAndBerkovichArithmetic (fundamental polyhedral theorem for skeleta, a different object); "focus-focus" in IntegrableSystems (main and #1651: symplectic singularity types, not the affine slab); "theta function" elsewhere means classical theta functions; "Birkhoff–Witt" in OrthogonalSpinGroups (Clifford), PCurvature #1747 (out of scope there), LieHighestWeight; "Baker–Campbell" in LieGroups #1051 (R07), FormalConnectionsOpers (consumes a BCH group law), AnabelianGeometry (a Lie-algebra computation). Ownership against open pull requests whose files the brief does not give was not checked.

**Sources, seeded sample (cache line numbers).** MAN a42f6730: Definition 2.2 lines 250–261 (support a codimension-one affine cone parallel to `m_d⊥`, `g_d ∈ g‖n_d,m_d`, incoming = closed under addition by `n_d`, direction `−n_d`: §3.2), Remark 2.3 line 271, (8) line 300 (`θ_d = exp(g_d)^{sgn⟨−γ′,m_d⟩}`: Convention 3), Definition 2.4 line 303, Theorem 2.6 lines 319–322 (finite `D_in`, full affine hyperplanes: §3.3's "finite input"), Definition 2.10 lines 466–481 (`γ′ = −v_i`, `a_{i+1}` a homogeneous term of `g_i·a_i`, `g_i = ∏ exp(g_d)^{sgn⟨v_i,m_d⟩}`: §§5.1–5.2), Proposition 2.13 line 548, Theorem 2.14 line 555. BRI 3035608f: §2.1 line 317, §2.2 line 329, Definition 2.1 line 385, §2.7 line 394, §2.8 lines 402–407 (`ε_i` = negative of the sign of `d/dt γ(t)(n)`), Definition 2.2 line 408, §2.9 lines 414–429, §2.10 line 430, Definition 2.3 line 434, §2.11 line 446 (abelian rays), Lemma 3.1 line 491, Lemma 3.2 line 526, Propositions 3.3–3.4 lines 537–550. LMY 88943628: Definition 1.2 lines 229–233 (`h_{m,0}=0`, `h_{m,kn}=h_{m,n}`, bracket normal `⟨m₂,n₁⟩n₂ − ⟨m₁,n₂⟩n₁`, condition (3) `h_{m₁,n}·A_{m₂}=0` if `⟨m₂,n⟩=0`: §3.1 and §5.1's annihilation condition with `(m,n)` for our `(n,m)`), Definition 1.3 lines 245–251 (incoming `P + tm ⊆ P` for `t > 0`, as §3.4 notes). GHKK 141730d2: Definition 1.11 lines 794–800, Theorem 1.12 lines 810–814, Theorem 1.13 lines 816–818, Theorem 1.21 lines 1012–1025, proof at 1039, Construction C.1 line 4730, Definition-Lemma C.2 lines 4744–4752, C.3 line 5169, Proposition 3.4 line 1521. GS cd80dea1: §2.2 lines 353–398 (monodromy `(1 0; 1 1)`, charts II/III `(x,y) ↦ (x,x+y)` for `x>0`), §2.3 lines 399–429 (`x = z^{(−1,0)}`, `y = z^{(1,0)}`, `w = z^{(0,1)}`, `xy − t` versus `xy − wt`: §6.3's `f = 1+w`, `f′ = 1+w⁻¹`). GHS a55459c0: Definition 3.1 line 1444, Definition 3.3 lines 1506–1520 (proper `β:(−∞,0]→B₀`, `β′ = −m_i`, transport across walls and slabs), Proposition 3.5 line 1549, Remark 3.6 lines 1562–1578 (degenerate broken lines, codimension-two non-transverse set), Lemma 3.7 lines 1581–1592 (needs Noetherian `A` so that `I₀^k ⊆ I`: §5.3's `J^r = 0` hypothesis), Proposition 3.16 line 1768, Theorem 3.19 line 1879. CPS 5a3b26d3: Proposition 3.2 line 467, Proposition 4.4 lines 615–622, Remark 4.5 lines 629–640, Definition 4.6 line 644, Lemma 4.7 line 657, Lemma 4.9 line 750. N23 6a898364: Definition 7.1 line 4425, Definition 7.2 lines 4484–4488 (general position: §5.3's generic endpoints), Definition 7.3 line 4490, Proposition 7.6 lines 4574–4577 (`ϑ_{Q′} = p_{γ,D}(ϑ_Q)`), Lemma 7.7 line 4581, Lemma 7.8 line 4638, Theorem 5.2 line 2609, Proposition 5.4 line 2638. BLM db3c9ae1: §8.1 line 2186, Definitions 8.1–8.2 lines 2198–2212 (the data of §7.1's *BLMPolynomialInput*: saturated `N_uf`, finite-index `N°` with both integrality conditions, `gcd(d_i)=1`, `w_i = ω(−,d_ie_i)/ℓ_i` primitive, free generators `p_{i,j}`), injectivity assumption lines 2213–2216, Theorem 8.11 line 2330, Theorem 9.5 line 2844, Corollary 9.8 lines 2919–2931, Theorem 9.9 line 2960, §9.2 Step 3 lines 3030–3060 (the change-of-monoid trick behind *finiteAlphabetLift*), Lemma 9.14 line 3125. PET 2c422a0e (OCR): §8 setting lines 700–727, Theorem 8.1 line 756, Corollary 8.1(ii) line 791 (`n! β(a₁⋯aₙ) = Σ_σ …`, "If K contains ℚ, β is the usual explicit formula" line 792), Theorem 8.2 line 832, abstract lines 10–14. KS 9c4d34dd: Theorem 2.1.6 line 511, Proposition 3.3.2 line 1035, Remark 3.2.7 reference line 1026.

**Adversarial table.** One row per statement; values computed on each side.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 injective `T` has a modulus | `λ(k) = max{δ(n) : n∈P, δ′(Tn) ≤ k}` | finitely many `Tn` with `δ′ ≤ k` (finite cutoff in `P′`), injectivity gives finitely many `n`; `T(0)=0` and injectivity give `T(N⁺) ⊆ N′⁺` | finite, monotone | none |
| §0.1 f.g. monoid with positive functional | generators `g_i`, `δ(g_i) ≥ 1` | `δ(Σc_ig_i) ≥ Σc_i`, so `δ ≤ k` forces `Σc_i ≤ k` | finite cutoffs | none |
| §0.1 salient | rational cone with a line | the lineality space is rational, contains a lattice `±v`, `δ(v), δ(−v) > 0` | contradiction, salient | none |
| §0.1 cutoff-modulus Check | `P={0}∪{a≥b≥1}`, `δ=a`, `T(a,b)=b` | `δ′(T(j,1)) = 1` for all `j`, `δ(j,1) = j` | no modulus | none |
| §0.2 central kernel | `[g, F^{k+1}]` | degree `≥ k+1+1` since `δ ≥ 1` on `N⁺` | `⊆ F^{k+2}`, central | none |
| §0.3 modulus of `f(I^{ck}) ⊆ J^k` | `λ(k) = c(k+1)−1` | `I^{λ(k)+1} = I^{c(k+1)} ⊆ J^{k+1}` | correct | none |
| §0.4 `ι⁻¹((U⁺)^{c+1}) = lcs c` | `U(𝔣) = ℚ⟨X,Y⟩` graded by length | `(U⁺)^{c+1}` = degree `≥ c+1`; `𝔣 ∩` it `= ⊕_{d≥c+1} 𝔣_d = lcs c` (Mathlib 0-based) | true; Lean statement line 140 matches | none |
| §0.4 `exists_bch_exp_mul_exp` junk check | `IsNilpotent.exp` on `U_c` | `mk(ι X)`, `mk(ι Y)`, `mk(ι b)` all in `U⁺`, nilpotent of index `≤ c+1` | no junk value | none |
| §0.4 Heisenberg Check | `[X,Y]=Z` central | `log(e^Xe^Y) = X+Y+Z/2`, `log(e^Ye^X) = X+Y−Z/2` | as claimed | none |
| §0.4 `e^xe^y = e^ye^ze^x`, `z` central | degree 2 | both sides `exp(x+y+z/2)` | true | none |
| §0.4 PBW symmetrization generality | `R` a ℚ-algebra, `g` arbitrary (torsion allowed) | PET Cor 8.1(ii) line 791 with "K contains ℚ" line 792; Lean line 170 has `[Algebra ℚ R]`, no freeness | README = Lean generality | none |
| §0.5 `[F^aĜ,F^bĜ] ⊆ F^{a+b}Ĝ` | logs of degree `≥a`, `≥b` | BCH commutator log has degree `≥ a+b` | true | none |
| §0.5 change-of-degree Check | `P={b≤a≤b²}`, `δ=a`, `δ′=b` | `P` closed (`a+a′ ≤ b²+b′² ≤ (b+b′)²`); `max{a : b≤k} = k²`, `max{b : a≤k} = k` | moduli `k²`, `k` | none |
| §0.7 non-initial `H` Check | `J=J″=*`, `J′` two objects, `F′=(Unit,Empty)` | `lim F = *`, `lim F′ = ∅` | no map | none |
| §0.7 conjugation Check | `ℚ[ε]/(ε²)`, label `1+ε` | `(1+ε)a(1+ε)⁻¹ = a` | not detected | none |
| §0.8 graph Check | `θ(a)=2a` | `B^{0,0}(1) = 2`, `B^{0,η}(1) = 0` | true | none |
| §1.1 homogenization Checks | `0 ≤ −1`; `x≤0 ∧ −x≤−1` in ℝ | cones `{t=0}=ℝ×{0}` and `{x=t=0}`; homogenization of `∅` is `{0}` | true, and only nonempty `Q` has cone = homogenization | none |
| §1.1 Check complexes | `{H}`, `{L}`, `{r,{v}}`, `v=(√2,0)` | faces of a line: itself (lineality `ℝ`); faces of the ray: ray and `{v}` | complexes | none |
| §1.4 coboundary Check | half-plane `{y≥0}`, `k=0` | outward conormal of `{y=0}` is `−dy`, times `(−1)^{0+1}`: `+dy`; pairing with `(0,1−2t)`: edge `(0,−2)`, `sign(dy(0,−2)) = −` | `−c`; Lean `IsInducedOrientation` (`β(u)=t>0`, `u=(0,1)` inward) gives `+dy` | none |
| §2.1 square-loop Check | labels `a` (`dy`), `b` (`dx`) | velocities `(−2,0),(0,−2),(2,0),(0,2)`; factors `b, a, b⁻¹, a⁻¹`; first rightmost | `a⁻¹b⁻¹ab` | none |
| §2.3 `±δ` in the chambers | `δ(n) > 0` on `N⁺` | `δ ∉ n⊥` for every `n ∈ N⁺` | off every wall | none |
| §2.4 Heisenberg quotient Check | `g/center` | `e^Xe^Y = e^{X+Y} = e^Ye^X`; originals differ by `e^Z ≠ 1` iff `R ≠ 0`; ray algebra `⊕_{a≥1} g_a = g` nonabelian | as claimed | none |
| §3.1 proportional normals | `m′=cm`, `m(ρn)=m′(ρn′)=0` | `μ = c·m(ρn′)m − c·m(ρn)m = 0` | bracket in `h_{·,0} = 0` | none |
| §3.1 *zeroDirectionLieWord* | `[w₁,w₂]`, normals `μ₁,μ₂ ∈ Ann W`, `ρ(n₁+n₂) ∈ W` | `μ₁(ρn₂) = μ₁(ρ(n₁+n₂)) − μ₁(ρn₁) = 0−0`, likewise `μ₂(ρn₁)=0`, so `μ = 0` | word in `h_{n,0} = 0`; induction on words | none |
| §3.2 Incoming Checks | `𝔡=ℝ_{≥0}e₁`, `𝔡+2e₁`, `ρ=id`, `w=e₁`, `m=e₂*` | `m(ρw)=0`; `𝔡+ℝ_{≥0}e₁ ⊆ 𝔡` both; point support with `ρ(0,1)=0`: `x+t·0=x` | incoming; Lean `Incoming` line 1102 is the same formula | none |
| §3.3 two-wall Check | `n=e₁,m=e₂*,n′=e₂,m′=e₁*` | `μ = e₂*(e₂)e₁* − e₁*(e₁)e₂* = e₁*−e₂*`; joint `{0}`, swept by `−(1,1)` | `−ℝ_{≥0}(1,1)`; MAN Lemma 2.9 | none |
| §3.3 Lean `signedFactor`/`segmentProduct` | `⟨ν,v⟩<0`, time-sorted list reversed | `θ^{+1}` for `⟨ν,v⟩<0`, `θ⁻¹` for `>0`; first crossing rightmost | Convention 3 | none |
| §4.1 bracket | on `z^q` | `m′(ρq)m(ρ(n′+q)) − m(ρq)m′(ρ(n+q)) = [m(ρn′)m′ − m′(ρn)m](ρq)` | README formula; Lean `wallBracketNormal` line 1046 | none |
| §4.1 Checks | `[z^{e₁}∂_{e₃*},z^{e₂}∂_{e₁*}]`; `T(a,b)=(2a,b)` | `e₃*(e₂)e₁* − e₁*(e₁)e₃* = −e₃*`; `S(e₁*) = e₁*∘T⁻¹ = ½e₁*` | as claimed | none |
| §4.2 datum Check | `N°=ℤe₁⊕2ℤe₂`, `{e₁,e₂}=1` | `κ(e₁)=1`, `κ(e₂)=2`; `{e₁,2e₂}=2`, `{e₂,e₁}=−1` integral | as claimed | none |
| §4.2 `κ(tn)` | `tn ∈ N` | `ℕ_{>0}κ(n)n = ℕ_{>0}(κ(n)/t)(tn)` | `κ(n)/t` | none |
| §4.3 Checks | `β(e₁,e₂)=1`; `Ψ_q`, `r=1,2` | `z^{e₁}z^{e₂}=qz^{e₁+e₂}`, reverse `q⁻¹`; `Ψ_q(q²T)/Ψ_q(T)=1+qT` gives `q^{−1}·q=1`; `r=2`: `(1+q³T)(1+qT)`, components `q^{−2}(q+q³)=q+q⁻¹`, `q^{−4}q⁴=1` | `z^p+z^{p+n}`; `z^{2p}+(q+q⁻¹)z^{2p+n}+z^{2p+2n}` | none |
| §4.3 `Ad` formula | `z^nz^p = q^{2r}z^pz^n` | `G(z^n)z^p = z^pG(q^{2r}z^n)`; `z^pz^{jn} = q^{−jr}z^{p+jn}` | README components | none |
| §4.4 slab Check | `X^aw^b`, `q=t(1+w)` | `λ_v(X)^a = t^a(1+w)^a y^{−a}` | `t^ay^{−a}Σbinom(a,j)w^{b+j}` | none |
| §5.2 one-wall Check | `A=ℚ[x^±,t]/(t²)`, `θ(x)=x(1+t)` | crossing velocity `−1`, `⟨ν,γ′⟩<0`, factor `θ^{+1}`; components `x` (deg `(1,0)`), `tx` (deg `(1,1)`), `ρ=1` both | `x`, `tx`, velocity `−1` | none |
| §5.3 discriminant Check | `p=(−1,−1)`, `Q=(q,q)`, `q>0` | `β(t) = Q + t(1,1)`, `t ≤ 0`, hits `0` at `t=−q` | joint incidence | none |
| §5.3 Lean `singleFaceBrokenLines` | `hν : ν(μ_uγ) < 0`, `c < νQ` | `T = (νQ−c)/ν(μ_vη) < 0`, `ν(Q − Tμ_vη) = c` | crossing at time `T<0` on the face | none |
| §5.5 one-wall theta Check | `f=1−z^n`, `m(ρp)=1`, `m(ρn)=0` | `Q_x>0`: tail at `x→+∞`, no crossing; `Q_x<0`: `⟨m,γ′⟩=−1`, `θ^{+1}(z^p) = z^p(1−z^n)` | `z^p`; `z^p−z^{p+n}` | none |
| §5.5 `δ_ext` | `(n+cp,c)` | `δ(n)+cδ(p)+(1−δ(p))c = δ(n)+c` | positive, finite cutoffs (Lean lines 1878–1915 proved) | none |
| §6.3 model relation | `X=(x₁,fx₂)`, `Y=(fy₁,y₂)` | `XY = (ft, ft) = t(1+W)` | holds | none |
| §6.3 Check | `K=ℤ`, `k=2`; `Q=(1,1)` | `ϑ_{−1,0}ϑ_{1,0} = XY = tϑ_{0,0}+tϑ_{0,1}` (`r=1`); `d=1`: weights `1,1`, heights `1,2`; `d=2`: `1,2,1`, heights `1,1.5,2` | as claimed | none |
| §6.3 `modelTheta_mul` | `n<0<m`, `|n|≥m`; same signs; `n+m=0` | `X^{|n|}Y^m = X^{|n|−m}t^m(1+W)^m`, `r=m`; `r=0`; `r=|n|`: `t^{|n|}(1+W)^{|n|}`; `|n|+|m|−|n+m|` even, no ℕ-subtraction junk | formula holds; `modelTheta 0 b = W^b` (`y^0`) | none |
| §7.1 ray-factor Check | `log(1+A+B)` | cross term `−(2AB)/2 = −AB` | `[u]f_u = −1` | none |
| §7.2 pentagon Check | `{e₁,e₂}=1`, `[X_n,X_{n′}]={n′,n}X_{n+n′}` | LHS degree `(1,1)`: `½{e₁,e₂}X₁₂ = ½X₁₂`; RHS: `X₁₂ + ½[X₁,X₂] = X₁₂ − ½X₁₂` | equal; LHS antiordered (`{e₂,e₁}=−1`), RHS ordered | none |
| §7.3 diagonal function, `b=d=0` | `(1+ax)(1+cy)` | diagonal `1+ac·u` | formula gives `1+ac·u` | none |
| §7.3 diagonal function, `a=c=0` | `1+bx²`, `1+dy²` in `M₀=2ℤ×2ℤ` | normals double: `((1+bX)²,(1+dY)²)` over `M₀`, diagonal `(1−bdXY)^{−4}` (GPS), `g_M² = g_{M₀}`, so `g_M = (1−bdu²)^{−2} = 1+2bdu²+…` | formula gives `2bd·u²` | none |
| §7.3 diagonal function, `a=c=2,b=d=1` | `(1+x)²,(1+y)²` | `(1−u)^{−4} = 1+4u+10u²+20u³`; formula: `ac=4`, `2bd+bc²+a²d=10`, `5abcd=20` | agree (GPS Example 1.6) | none |
| §7.3 `[u³]f²` | from `f` | `2·5abcd + 2ac(2bd+bc²+a²d) = 14abcd+2abc³+2a³cd` | README value | none |
| §7.3 (R),(V) at `(p,q)=(1,0)` | `C_±(0,0)=1` | (V): `C_+(1,0)=0`; (R): `C_−(1,0) = π_{d₂,1}(P₁) = d₂p_{1,1}`; `B_−(1,0)`: one bend on the `x`-axis with exponent `d₂`, weight `binom(d₂,1)p_{1,1}` | consistent | none |
| §7.4 lattice-change Check | `m₁=(1,0)`, `m₂=(1,2)`, `m°=(2,2)` | `ℓ=|det|=2`; `(p,q)=(1,1)`, `r=2`, `m=(1,1)`; `N₀=ℤ×½ℤ`; `m°⊥∩N₀ = ℤ(1,−1) = m°⊥∩N`, `ind=1`; `ℓ = r·ind` | as claimed | none |
| §7.6 Checks | `Σa^jt^j`; `T=id`, `S(e₂*)=−e₂*`, `P=ℕe₁` | `t`-adic image `Σt^j`; `a`-adic: `Σ1` diverges; `e₂*(e₁)=0` so the pairing holds and the action is zero; label `exp(−log(1+x)∂_{e₂*})` has function `(1+x)⁻¹` | as claimed | none |
| Headlines | BCH comap, BCH existence, PBW symmetrization, model product | stated at lines 140, 152, 170, 2297 with pinned carriers; unstatable ones named in the docstring | present | R02 (catalogue) |

**Lean signatures against the README.** `exists_pbwSymmetrizationEquiv` (`[CommRing R] [Algebra ℚ R] [LieRing g] [LieAlgebra R g]`, symmetrization formula with `(d!)⁻¹`) = §0.4; `comap_freeAugmentation_pow_ι` and `exists_bch_exp_mul_exp` over `FreeLieAlgebra ℚ (Fin 2)` = §0.4's `bchElement` statement; `FocusFocus.modelTheta_mul` on `K[t,w,w⁻¹,x,y]/(ww⁻¹−1, t^{k+1}, xy−t(1+w))` = §6.3's *focusFocusTheta_mul* read through `e`; `DirectedWall` (normal in `Λ →+ ℤ`, `m(ρw)=0`, rational nonempty support with direction `ker m_ℝ`, label in `wallGroup w m`), `Incoming`, `IsOutgoingCompletion`, `probeDegrees` (`P_ext`, `δ_ext`) and `probeWallGroup` agree with §§3.2–3.3 and 5.5.

## Not verifiable

- ZIE (Ziegler, *Lectures on Polytopes*, Chapter 1) and SCH (Schrijver, *Theory of Linear and Integer Programming*, §8.3), cited at README lines 622–625 for Minkowski–Weyl, Fourier–Motzkin and faces of polyhedra: the sources service finds no legal copy of either book (`zie: failed: no legal source found`, `sch: failed: no legal source found`). The statements cited are standard textbook facts; the locators were not checked against the text.
- PET Hypothesis 8.1 (cache 2c422a0e line 733): the OCR line is mirrored garbage, so the exact hypothesis of Theorem 8.1 could not be read; the abstract, Theorem 8.1, Corollary 8.1(ii) and the sentence "If K contains ℚ, β is the usual explicit formula" support the README's statement.
- Curry (R06): no locator is given, so nothing was checked beyond the existence of §4 in the cached text.
- §7.3 Check on the rectangle `(5,3)` (tight-grading sum `16abcd+2abc³+2a³cd` and the `(6,4)` lattice test): not recomputed in this review; the diagonal wall function and `[u³]f²` were checked by the three specialisations in the table.
- GHS Proposition 3.16 and Theorem 3.19, CPS Lemma 4.9, N23 Lemmas 7.7–7.8 (§§5.4–5.6): located at the lines above, not read line by line.
- Ownership against open pull requests whose files the brief does not provide was not checked.

## Source issues

- none
