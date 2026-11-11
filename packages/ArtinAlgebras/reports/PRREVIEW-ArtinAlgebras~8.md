# Review of ArtinAlgebras (pull request #2190 at beb9482)
Folder: `TauCetiRoadmap/RepresentationTheory/ArtinAlgebras/`
**Verdict:** needs changes

## R01 (P3) — §4.1 restates the transpose results that Tau Ceti pins for every ring

**Location:** `README.md:866–871`: “Both are finitely generated and independent of the presentation up to isomorphism; `τ M = 0` exactly when `M` is projective; for indecomposable non-projective `M`, `τ M` is indecomposable and not injective”; 870–871 credit Tau Ceti with “the field case” only.

**Claim:** the `Tr` half of each of these statements is pinned over an arbitrary ring. §4.1 cites none of it, and “From Tau Ceti” lists only the carrier `TauCeti.AuslanderReitenTranspose`. What is left to prove is the passage through `D_R`.

**Witness:** `TauCeti.IsMinimalProjectivePresentation.subsingleton_auslanderReitenTranspose_iff_projective` (`TauCeti/Algebra/Module/AuslanderReiten/Transpose.lean:557`, any `[Ring A]`); `TauCeti.FiniteProjectivePresentation.isIndecomposableModule_auslanderReitenTranspose_iff` (`…/AuslanderReiten/Indecomposable.lean:111`, finite-length `M`).

**Repair:** replace “Both are finitely generated … ([ARS, Prop. IV.1.10(f), p. 107]).” with:

> Over every ring Tau Ceti supplies the transpose half: `Tr M` does not depend on the minimal presentation (`TauCeti.IsMinimalProjectivePresentation.nonempty_linearEquiv_auslanderReitenTranspose`), vanishes exactly when `M` is projective (`TauCeti.IsMinimalProjectivePresentation.subsingleton_auslanderReitenTranspose_iff_projective`), is projective only when it is zero (`TauCeti.IsSuperfluous.projective_auslanderReitenTranspose_iff_subsingleton`), and is indecomposable when `M` is indecomposable of finite length and not projective (`TauCeti.FiniteProjectivePresentation.isIndecomposableModule_auslanderReitenTranspose_iff`). The target is the passage through `D_R` (2.2, 2.3): `τ M` is finitely generated and independent of the presentation, `τ M = 0` exactly when `M` is projective, for indecomposable non-projective `M` it is indecomposable and not injective, and `τ⁻ (τ M) ≅ M` ([ARS, Prop. IV.1.10(f), p. 107]).

Add the four names to “From Tau Ceti” (modules `TauCeti.Algebra.Module.AuslanderReiten.Transpose`, `TauCeti.Algebra.Module.AuslanderReiten.ProjectiveSummand`, `TauCeti.Algebra.Module.AuslanderReiten.Indecomposable`) and to the §4.1 *Needs:*.

## R02 (P3) — §§3.3, 4.3 and 5.3 restate or leave uncited pinned almost-split results

**Location:** `README.md:766–768`: “In a Krull-Schmidt exact category its end terms are indecomposable, and an almost-split conflation ending at a given `Z` is unique up to isomorphism of conflations”; 937 “unique up to isomorphism”; 946–947 (irreducibility criterion); 1026–1028 (multiplicities).

**Claim:** indecomposability and locality of the end terms hold in every preadditive category with binary biproducts and are pinned, so the Krull-Schmidt hypothesis is superfluous. Uniqueness is pinned for balanced categories, which covers the abelian `mod A` of 4.3. The 4.3 criterion is pinned for non-projective `M`, and 5.3 rests on pinned isomorphisms. None is cited.

**Witness:** `TauCeti.IsRightAlmostSplit.indecomposable` (`TauCeti/CategoryTheory/AlmostSplit/Basic.lean:480`, `[HasZeroMorphisms C] [HasBinaryBiproducts C]`); `CategoryTheory.ShortComplex.IsAlmostSplit.nonempty_iso` (`…/Uniqueness.lean:138`, `[Balanced C]`); `…isIrreducibleMorphism_iff_exists_isSplitMono` (`…/Components.lean:68`); `…rightRadicalQuotientEquiv` (`…/RadicalQuotient.lean:119`).

**Repair:**
- §3.3: replace the quoted sentence with “Its end terms have local endomorphism rings and are indecomposable in any preadditive category with binary biproducts (Tau Ceti `TauCeti.IsLeftAlmostSplit.isLocalRing_end`, `TauCeti.IsRightAlmostSplit.isLocalRing_end`, `TauCeti.IsLeftAlmostSplit.indecomposable`, `TauCeti.IsRightAlmostSplit.indecomposable`). In a balanced category an almost-split sequence is determined by its right-hand end (`CategoryTheory.ShortComplex.IsAlmostSplit.nonempty_iso`); the target is the same uniqueness, at either end, for conflations of an exact category, which need not be balanced.”
- §4.3: after “unique up to isomorphism” insert “(`CategoryTheory.ShortComplex.IsAlmostSplit.nonempty_iso`, `mod A` being abelian)”. After the irreducibility criterion add “For non-projective `M` it is equivalent to `CategoryTheory.ShortComplex.IsAlmostSplit.isIrreducibleMorphism_iff_exists_isSplitMono`, applied to the almost-split sequence ending at `M`.”
- §5.3 *Needs:* add `CategoryTheory.ShortComplex.IsAlmostSplit.rightRadicalQuotientEquiv` and `CategoryTheory.ShortComplex.IsAlmostSplit.leftRadicalQuotientEquiv` (`Hom(W, Y) / rad(W, Y) ≅ Irr(W, Z)` and its dual), from which the multiplicities are read off.
- Add these names to “From Tau Ceti”, modules `TauCeti.CategoryTheory.AlmostSplit.Basic`, `.Uniqueness`, `.Components` and `.RadicalQuotient`.

## R03 (P3) — The two remaining roadmap suppliers provide nothing that a target uses and the pin lacks

**Location:** `README.md:273–279`: “DerivedModuleAlgebra §1.M.2: … Layer 2 uses it for local Artinian rings” and “PurityOfBranchLocus §0.3: `TauCetiRoadmap.PurityOfBranchLocus.globalDimension` … and the localization bounds”; uses at 639, 651, 712, 1169–1171, 1196, 1328, 1400.

**Claim:** over a local Artinian ring Layer 2 needs only the hull and the finite-length duality, which it already cites from Tau Ceti. No Layer 7 target involves a commutative ring or a localization. Both supply edges are unused.

**Witness:** DerivedModuleAlgebra (main) `README.md:21–23`: §1.M.2's hulls and finite-length biduality are formalised at the pinned Tau Ceti, as `TauCeti.IsInjectiveEnvelope.bijective_applyₗ` (cited here, README:227). The 7.2 targets are [Au55, Cor. 5 and Cor. 11(b)], for noncommutative rings.

**Repair:**
- README:271–279: replace both bullets with “None.”
- 639: delete “(for a Noetherian local ring, DerivedModuleAlgebra §1.M.2)”. 651: delete “DerivedModuleAlgebra §1.M.2;”. 712: “Tau Ceti's local Matlis duality, injective hulls and projective covers.” 1400: “supplied through Tau Ceti's `TauCeti.IsInjectiveEnvelope.bijective_applyₗ`.”
- 1169–1171: end the sentence after “`TauCetiRoadmap.PurityOfBranchLocus.globalDimension`” and delete “and the localization bounds of §0.3 are imported, not proved again”. 1196 and 1328: delete “PurityOfBranchLocus §0.3”.
- Scope, 66: “Layer 2 here consumes the parts of it that Tau Ceti pins (see "From Tau Ceti") for the local factors …”. 81–82: replace “the commutative results are imported from §0.3, not proved again” with “no result of §0.3 is used here”.

## R04 (P3) — The family index still says this roadmap builds on QuiverRepresentations

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:103–106`: “The Artin-algebra roadmap states the Auslander-Reiten theory of the quiver roadmap's Layer 6 over a commutative Artinian base ring … ; it builds on the quiver roadmap's Krull-Schmidt theorem and radical.”

**Claim:** at this head the roadmap takes its Krull-Schmidt theorem and radical from Tau Ceti, and QuiverRepresentations is neither its supplier nor its consumer. The family index, which this pull request owns, still states the supply edge that the head removes.

**Witness:** `README.md:193–207` (`TauCeti.jacobsonRadical`, `TauCeti.exists_equiv_iso_of_iso_biproduct`); 271–279 (no QuiverRepresentations); 55–58 (QuiverRepresentations Layer 6 consumes Tau Ceti's field case).

**Repair:** replace lines 103–106 with: “- **Artin algebras generalize quiver representations' Auslander-Reiten theory.** The quiver roadmap's Layer 6 reads Tau Ceti's Auslander-Reiten theory of finite-dimensional algebras on quiver examples; the Artin-algebra roadmap states that theory over a commutative Artinian base ring and in Krull-Schmidt exact categories, with the field case as its case `R = k`. Both consume Tau Ceti's Krull-Schmidt theorem and radical.”

## R05 (P3) — Five sampled targets have neither a locator nor a “not located” marker

**Location:** `README.md:371–378` (0.4 summand decomposition); 508–515 (1.1 closure of `mod C`); 718–727 (3.1 `Ext¹` and its long exact sequences, only the unread “(Yoneda)”); 943–947 (4.3 source and sink maps, irreducibility criterion); 971–981 (5.1 valuation).

**Claim:** README:145–146 requires a locator for every claim, or the statement that none was read. These theorems have neither.

**Witness:** readable locators exist: inp line 406 (Example 1.14, p. 7) and lines 485–520 (Fact 1.20(1)–(3), p. 8) for 3.1; inp lines 1152–1155 (Def. 3.11(2), p. 18) for 5.1; kr line 405 (Prop. 4.1(2), p. 8) for 0.4.

**Repair:**
- 0.4, after “no idempotent completeness is needed.”: “For a semiperfect ring this is [Kr, Prop. 4.1(2), p. 8]; that the Artin `R`-algebra `End X` is semiperfect is not located in a read source.”
- 1.1, at the end of the paragraph: “The definition of `mod C` is recalled in [INP, p. 20]; the closure properties are not located in a read source.”
- 3.1, at the end of the long-exact-sequence paragraph: “An exact category is extriangulated, with `Ext¹` as its bifunctor ([INP, Example 1.14, p. 7]), and these sequences are [INP, Fact 1.20(1)–(3), p. 8].”
- 4.3, at the end of the source-and-sink paragraph: “These statements are not located in a read source.” (The non-projective case of the criterion is pinned: R02.)
- 5.1, after the definition of the valuation: “([INP, Def. 3.11(2), p. 18], whose `(d_{MN}, d'_{MN})` is `(b_{MN}, a_{MN})` here.)”
- Add Example 1.14, Fact 1.20 and Def. 3.11 to the [INP] entry and Prop. 4.1(2) to the [Kr] entry of “Sources and locators”.

## R06 (P3) — `Suggested.lean` docstring title and the Layer 4 section title

**Location:** `Suggested.lean:12`: “# Krull-Schmidt categories and Auslander-Reiten theory of Artin algebras: suggested forms”; `Suggested.lean:160`: “/-! ## Layer 4: almost-split sequences for Artin algebras -/”.

**Claim:** the module docstring is titled “<title>: target signatures”, and section comments carry the README's layer titles.

**Witness:** `README.md:859`: “## Layer 4: Auslander-Reiten theory of Artin algebras”. The other section comments of `Suggested.lean` match their README layer titles.

**Repair:** line 12: “# Krull-Schmidt categories and Auslander-Reiten theory of Artin algebras: target signatures”. Line 160: “/-! ## Layer 4: Auslander-Reiten theory of Artin algebras -/”.

## R07 (P3) — The description contradicts the head on locators and omits the supplier and consumer changes

**Location:** pull-request description, second-commit paragraph: “the remaining unlocated statements say so.”; third-commit paragraph: “… cited from Tau Ceti instead of other roadmaps”.

**Claim:** the five passages of R05 are unlocated and unmarked. The text names neither the suppliers the change drops nor the replaced downstream consumer.

**Witness:** main's “From other roadmaps” lists six roadmaps and the head's lists two (README:271–279). Main's “Downstream consumers” lists QuiverRepresentations Layer 6; the head lists ZigzagPreprojective §4.2 (README:1332).

**Repair:** keep the sentence once R05 is repaired. Append to the third-commit paragraph: “GrothendieckEulerForms, StablePeriodicCurved Layer 0, GeometricRepresentationCategories §R5.2 and QuiverRepresentations Layer 6 are no longer suppliers; ‘Downstream consumers’ lists ZigzagPreprojective §4.2 in place of QuiverRepresentations.” After R03, add DerivedModuleAlgebra §1.M.2 and PurityOfBranchLocus §0.3 to that list. After R04, add “the family index sentence on quiver representations is updated”.

## Previous findings

Ids refer to `packages/ArtinAlgebras/reports/PRREVIEW-ArtinAlgebras~7.md`.

- R01 — repaired: `Suggested.lean:216–230` states `forall_mem_and_isRepresentationFinite_of_length_le` as proposed, importing `TauCeti.CategoryTheory.IrreducibleMorphism`. Docstring lines 38–43 list it, and 56–63 no longer call it unstatable. README:1089–1092 adds the sentence on unions of components.
- R02 — repaired: both supremum identities are gone from `Suggested.lean`. README:80–82 says Layer 7 owns “only the comparison of left and right global dimension, and the formula for semiprimary rings”. README:1174–1178 cite `TauCeti.globalDimension_le_tfae` and `ModuleCat.hasProjectiveDimensionLE_of_quotients`, which is listed at 268–269.
- R03 — repaired: README:211–222 list the exact-category and Baer-sum declarations. They are cited at 85–88, 722–723, 736–737 and 931, and named in Convention 5 (124–128).
- R04 — repaired: the QuiverRepresentations supplier bullet is gone. README:247–253 list the pinned quiver, its translation and the mesh count, 1032–1034 cite `TauCeti.IrreducibleMorphismQuiver.card_arrows`, and 55–63 are rewritten. “Downstream consumers” names ZigzagPreprojective §4.2 rather than “None”, which main confirms (its README:33–34, 744, 761 cite §§2.3 and 4.1). The family index was not updated: R04 here.
- R05 — repaired: README:485–487.
- R06 — repaired: README:564–565.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 Fitting and converse, pinned (`Preadditive/Indecomposable.lean:279, 287`) | `ℤ`; free `k×k`-modules; `k[ε]/(ε²)` | `End ℤ = ℤ` not local, `ℤ` not Artinian; `k×k` indecomposable among free modules, `End = k×k` not local; `End = k[ε]/(ε²)` local | README hypotheses equal the pin's | none |
| §0.2 `IsKrullSchmidt`, `indecomposable_iff_isLocalRing_end`, `isIdempotentComplete_of_isKrullSchmidt` | one-morphism category; `mod ℤ/4`; f.g. abelian groups; `X = 0`; `Mat_ C₁` | `n = 0`; `End ℤ/2 = 𝔽₂`, `End ℤ/4 = ℤ/4` local; `End ℤ = ℤ`; `Indecomposable 0` false, `End 0` not local; `(1,0)` unsplit | true; [Kr, Cor. 4.4, p. 9, proof p. 10] | none |
| `exists_equiv_iso_of_iso_biproduct` | `ι = κ = ∅`; `ι = ∅ ≠ κ`; `ℤ[√−5]`, `I = (2, 1+√−5)` | unique `σ`; no iso, `Y j ≠ 0`; `I ⊕ I ≅ R²`, `End I = R` not local | true; [Kr, Thm. 4.2, p. 9] | none |
| §0.4 summand decomposition | `X = 0`; `ℤ/2 ⊞ ℤ/4`; one-object `k×k` | empty family, `𝟙 0 = 0`; the two projections; corners `k`, no splitting | true; no locator | R05 |
| §0.4 `isKrullSchmidt_of_module_finite` | `R = 0`; `Karoubi (Mat_ C₁)`; free `k×k`-modules | all Homs `0`, `n = 0`; indecomposables `(1,0)`, `(0,1)`; not idempotent complete, not KS | true; [En, §3.2, p. 14], complete local case | none |
| §1.1 `IsFinitelyPresentedFunctor` | `(−,Y)`; `0`; `(−,K)`, `dim K = ∞` | `X = 0`, `p = 𝟙`; `X = Y = 0`; images in `(−,K')`, not f.g. | true; additivity forced by epi `p`; no locator | R05 |
| §1.2 `hasWeakKernels_iff_isFinitelyPresentedFunctor_kernel` | `proj ℤ`; `k[x,y₁,y₂,…]/(xyᵢ)` | kernels exist; `Ann x = (y₁,y₂,…)` not f.g., no weak kernel | true; [INP, p. 20] (inp lines 1229–1232) | none |
| §2.1 `exists_isInjectiveEnvelope_quotient_jacobson` | `R = 0`; `ℤ/p²`; `k×k`; `k[x,y]/(x,y)²` | `E = 0`; `E = R`, length 2; `E = R`; length 3, socle dimension 1 | true; local hull pinned | R03 |
| §2.2 `bijective_applyₗ_of_isInjectiveEnvelope` | `ℤ/p²`, `M = ℤ/p`; `k[x,y]/(x,y)²`; infinite-dimensional space over `k` | `D M = ℤ/p`, bijective; `D R = E ≇ R`; not reflexive, so the hypothesis is needed | true | none |
| §3.1 `Ext¹`, long exact sequences | split structure; finite abelian groups; `ℤ/4` | `Ext¹ = 0`; 2 classes, split and `ℤ/4`; `Ext¹_{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2` | true; no read locator | R05 |
| §3.2 Ext-trivial ideals | split; `mod A`; finite abelian groups | every map trivial; maps through projectives; `Ext¹(ℤ/p, ℤ/p) ≠ 0`, `id ∉ 𝒫` | [INP, Def. 1.21, p. 8, Rem. 1.22, p. 9], [En, §A.2, p. 24] agree | none |
| §3.3 end terms, uniqueness | `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0`; split sequence | ends `ℤ/2`, `End = 𝔽₂` local; class `0`, not almost split | true; pinned without KS | R02 |
| §4.1 `τ` | `ℤ/p²`, `M = ℤ/p`; `M = A`; `T₂(k)` | `Tr = ℤ/p`, `τ = ℤ/p`; `Tr = 0`; `τ S₂ = S₁` | true; `Tr` half pinned for every ring | R01 |
| §4.2 defect formula | `T₂(k)`, `δ : S₁ → P₂ → S₂`; `X = S₂`, `S₁`; swapped form at `S₁` | `k`, `k`; `0`, `0`; `k` against `0` | true; kr16 Cor. 1.3 (lines 81–89) has the `k`-algebra generality | none |
| §4.3 `exists_isAlmostSplit`, sink maps | `ℤ/p²`; `A = 0`; `T₂(k)`; projective `ℤ/p²` | `ℤ/p → ℤ/p² → ℤ/p`; vacuous; middle term `P₂`; sink `pℤ/p² → ℤ/p²` | true; uniqueness pinned; sink maps unlocated | R02, R05 |
| §5.1 valuation | `ℤ/p²`; `ℝ`–`ℂ` triangular, `P₁ → P₂` | `rad² = 0`, `(1,1)`; `Irr = ℂ`: dimension 1 over `F_{P₂} = ℂ`, 2 over `F_{P₁} = ℝ`, so `(1,2)` | true; INP orders the pair `(2,1)` | R05 |
| §5.3 multiplicities | same algebra, `0 → P₁ → P₂ → I₁ → 0` | `b_{P₂I₁} = 1 = a_{P₁P₂}`; lengths `1 + 3 = 4`; [INP, Prop. 3.12] gives `d_{WX}` = `b_{WX}` here | true | R02 |
| §6.1 `chainComp_eq_zero_of_length_le` | `b = 0, 1, 2`; `B = k[ε]/(ε²)` | vacuous, `2⁰ − 1 = 0`; Schur; `B → k → B` is `ε ≠ 0`, every 3-chain `0` | true over any ring | none |
| §6.2 `forall_mem_and_isRepresentationFinite_of_length_le` | `A = 0`; `k`; `k×k`; Kronecker | `hne` fails; `S = {[k]}`; `hA` fails at `(1,0)`; preprojectives unbounded | true; ARS locator unread | none |
| `isRepresentationFinite_of_length_le`, `…_iff_forall_mem_jacobsonRadicalIdeal_pow` | `A = 0`; `B`; Kronecker | empty skeleton; `rad³ = 0`, 2 classes; `rad^∞ ≠ 0`, infinitely many classes | true; forward direction pinned | none |
| §7.2 `globalDimension_mulOpposite`, `globalDimension_eq_projectiveDimension_quotient` | zero ring; `k`; `ℤ`; `B` | `⊥ = ⊥`; `0 = pd k`; `ℤᵐᵒᵖ = ℤ`, `pd ℤ/2 = 1` both sides; `∞ = pd k` | [Au55, Thm. 1, p. 68; Thm. 4, Cor. 5, p. 70; Cors. 9, 11(b), p. 73] | R03 |
| §7.3 `HasProjectiveInjectiveCopresentation` | `T₂(k)`; `B`; `End_B(B ⊕ k)`; zero ring | `I¹ = S₂` not projective, dom.dim 1; `∞`; 2; `I₀ = I₁ = 0` | true | none |
| §7.4 Morita-Tachikawa, three theorems | `(k,k)`, `(k,k²)`, `(Mat₂ k, k²)`; `R = k×k` acting on `k` by projections | End dimensions 1, 4, 1; Morita sends `k ↦ k²`; ring iso, no `R`-algebra iso | true; [Mü] unread | none |
| §7.5 `hasProjectiveDimensionLE_two`, `exists_isAdditiveGenerator_algEquiv_end` | `B ⊕ k`; `A = M = 0`; nonzero semisimple `A` | dimension 5, gl.dim 2, dom.dim 2; `pd 0 = ⊥ ≤ 2`; gl.dim 0 | true | none |
| Family index, `RepresentationTheory/README.md:103–106` | head supplier list | DerivedModuleAlgebra and PurityOfBranchLocus only; KS and radical from Tau Ceti | stale sentence | R04 |
| `Suggested.lean` form | title; seven section comments | “suggested forms”; Layer 4 title differs, six match | style | R06 |

- Source locators checked against the text: 30 (kr 10: Prop. 2.3, Rem. 2.4, Cor. 3.5, Prop. 3.10 and its proof, Prop. 4.1, Thm. 4.2, Cors. 4.3–4.4, proof of Cor. 4.4; en 6; inp 8; au55 5; kr16 1).
- Library at the pin: the 14 Tau Ceti names newly cited by this head resolve in their stated modules. A further 30 declarations were opened, with file and line in R01–R02 and the table.
- `#check @` of all 25 declarations on a scratch copy: no section binder is lost, and each type matches its README statement; nothing changed. The 7 leads of `signatures.md` are category instances present in the types.
- One-tactic probe (`first | rfl | infer_instance | (simp; done) | exact?`) on all 19 theorems: 0 closed.
- Gate rerun at beb9482: every text check passes. `lake env lean Suggested.lean`: 19 `sorry` warnings, nothing else. Dependency check: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Cross-roadmap citations resolved on main: DerivedModuleAlgebra §1.M.2 (its README:2757), PurityOfBranchLocus §0.3 (README:162; `Suggested.lean:132, 137`), ZigzagPreprojective §4.2 (README:737), QuiverRepresentations Layer 6, StablePeriodicCurved Layer 0 (README:154), GrothendieckEulerForms, EnhancedDerivedSheaves.
- Ownership against open pull requests: `roadmaps grep` for nine object terms (Krull-Schmidt categories, Harada-Sai, dominant dimension, Morita-Tachikawa, defect formula, Brauer-Thrall, weak kernels, almost-split conflations, Auslander algebras). The only hits are the family-index entries of #1047, #1220 and #1775, and unrelated “defect formulas”.
- Overlap check: read QuiverRepresentations, RepresentationTheory (main, #1220, #1146), GrothendieckEulerForms, GeneralAlgebraicKTheory; nothing shared. GrothendieckEulerForms Layer 5 uses only abelian `Ext`, so §3.1 here owns exact-category `Ext¹`. CohomologyComparisonsPartII's `exact-yoneda` contract asks GrothendieckEulerForms for it: a defect of that pull request, not this one.

## Not verifiable

- ars: printed book with no legal copy. The locators of §§2.2, 2.3, 4.1–4.3, 5.2, 5.3, 6.1, 6.2, 7.1, 7.3 and 7.5 are unchecked.
- ass: printed book with no legal copy (§§3.4, 4.2, 6.1).
- kr03: Elsevier, whose DOIs the sources service treats as paywalled. The generality of the formula was checked in kr16, Cor. 1.3, instead.
- au78: no legal copy; the README takes its locator from kr03.
- lz: the sources service's arXiv search timed out this round. §§3.2 and 3.5 also cite inp and en, which were checked.
- mu: the README marks Thm. 2 as unread; Cambridge Core is not an open host in the service's lists.
- ch, hs: outside this round's sample; not re-read.
- Auslander (*Coherent functors*, *RTAA II*, *Representation dimension*), Freyd, Hoshino, Tachikawa, Yoneda, Roiter, Matlis: marked “not read” in the README.

## Source issues

- **Misprint** in kr at Thm. 4.2, p. 9: the source repeats the word “and” in its conclusion (kr line 454); it should be a single “and”; affects nothing.
