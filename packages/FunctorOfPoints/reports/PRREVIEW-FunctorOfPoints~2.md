# Review of FunctorOfPoints (pull request #2465 at 2183518)

**Verdict:** needs changes

## R01 (P2) — §4.2's proof route does not reach the statement (previous R06, not repaired)

**Location:** `TauCetiRoadmap/FunctorOfPoints/README.md` lines 584–587: "The proof reduces to Mathlib's criterion through the existence of a dominating discrete valuation ring for a specialization of points of a Noetherian scheme (Stacks 00PH for the algebra)."
**Claim:** 00PH yields discrete valuation rings only, so lifts for arbitrary valuation rings (Mathlib's criterion) are not derived. The step the source uses, universal closedness tested on `𝔸ⁿ × X → 𝔸ⁿ × S`, is at no pin and not in `*Needs:*`.
**Witness:** Stacks05JY line 1955–1959: (1)⇔(2) is Lemma 32.14.2 (05JX, line 1663), then (4)⇒(2) by 00PH on `𝔸ⁿ × S`. Pinned `Morphisms/UniversallyClosed.lean` has no affine-space criterion.
**Repair:** State as a §4.2 target: "for quasi-compact `f`, universally closed iff `𝔸ⁿ_Y ×_Y X → 𝔸ⁿ_Y` is closed for all `n` (Stacks Lemma 32.14.2, 05JX)". Route: 05JX, then closedness by lifting specializations to discrete valuation rings (00PH; Mathlib `universallyClosed_eq_universallySpecializing`). Add both to `*Needs:*`.

## R02 (P2) — `isOpenSubfunctor_iff` fails on the affine site

**Location:** README lines 333–336, 339: "`G` is open iff its inclusion satisfies the presheaf form of `IsOpenImmersion` after every pullback along `yoneda.obj (op A) ⟶ F` (the pullback is `D(I)`)"; "*Needs:* … `MorphismProperty.presheaf`, `Functor.relativelyRepresentable`".
**Claim:** `MorphismProperty.presheaf` requires the pullback to be representable in the site. On `(CommAlgCat R)ᵒᵖ` the pullback `D(I)` is not representable in general, so open subfunctors do not satisfy the stated condition.
**Witness:** README §1.1 Check, line 320: "`D(I)` for `I = (2, x) ⊆ ℤ[x]` is not representable". Take `F = yoneda.obj (op ℤ[x])`, `G = D((2, x))`, pullback along the identity point.
**Repair:** "For a Zariski sheaf `F`, `G` is open iff the inclusion of the sheaves on `Scheme` attached to `G` and `F` (§0.3, as in §2.2) satisfies Mathlib's `IsOpenImmersion.presheaf`. On the affine site only the closed case is relatively representable (`V(I)` is represented by `A ⧸ I`)." Add §0.3 to `*Needs:*`.

## R03 (P2) — the two-fold square does not give the module axioms of §3.1

**Location:** README lines 488–491: "For a Zariski sheaf `F` that sends the square `A[ε₁, ε₂] = A[ε] ×_A A[ε]` … to a pullback (`IsInfinitesimallyLinear F`), define addition … prove these give an `A`-module".
**Claim:** Associativity of the addition is proved on the three-fold square `A[ε₁, ε₂, ε₃]`, which is not an instance of the hypothesis over any base.
**Witness:** Over `A' = A[ε₃]`, `A'[ε] ×_{A'} A'[ε]` has `ε₁ε₃ ≠ 0`; in `A[ε₁, ε₂, ε₃] = A ⊕ A³` all products `εᵢεⱼ` vanish. No `A'` gives the three-fold square.
**Repair:** Define `IsInfinitesimallyLinear F`: for every `A` and finite free `A`-modules `M`, `N`, `F` sends `A ⊕ (M × N) = (A ⊕ M) ×_A (A ⊕ N)` (Mathlib `TrivSqZeroExt`) to a pullback. The locally representable case follows from the same pushout argument. Add the Check "`M = A²`, `N = A` gives associativity".

## R04 (P3) — gate: residue (previous R13, not repaired)

**Location:** README line 755: "(the TODO in Mathlib's `ModuleCat/Descent.lean` docstring, here in the form needed on affine test objects)".
**Claim:** The gate's `residue` rule refuses the word.
**Witness:** Gate at 2183518: `residue=1`, line 755.
**Repair:** "(Mathlib's `ModuleCat/Descent.lean` proves comonadicity of extension of scalars and does not state the stack property; it is stated here on affine test objects)".

## R05 (P3) — gate: backticked names not declared in `Suggested.lean` (previous R14, not repaired)

**Location:** README lines 192, 232, 237, 334, 429–430: "`zariskiTopology_def`, `fpqcTopology_def`", "`pointsFunctor_obj_isSheaf`", "`pointsFunctor_preservesLimits`", "`isOpenSubfunctor_iff`", "`isLocallyRepresentable_of_isRepresentable`", "`IsLocallyRepresentable.affine_iff`".
**Claim:** The gate's `readme-ids-missing` rule lists these seven.
**Witness:** Gate at 2183518: `readme-ids-missing=7`.
**Repair:** State each fact in prose without the backticked name; add no declaration.

## R06 (P3) — padding and unused material in `Suggested.lean` (previous R15, not repaired)

**Location:** `TauCetiRoadmap/FunctorOfPoints/Suggested.lean` lines 5, 41–43, 127–137: "`theorem pointsFunctorUliftIso_exists … := by exact ⟨Iso.refl _⟩`"; "`theorem pointsFunctorAlgSpecIso_exists`"; "`public import TauCeti.AlgebraicGeometry.Modules.Quasicoherent.Basic`".
**Claim:** The first is a definitional equality; the second is the affine boundary case, pointwise Tau Ceti's `algSpecHomEquivAlgHom`; `fpqcTopology` and the second import are used by no statement. The gate's `statement-hygiene` refuses lines 129 and 135.
**Witness:** Probe copy: `(pointsFunctor R).obj X ⋙ uliftFunctor.{u + 1, u} = (TauCeti.CommAlgCat.pointsSheaf X).obj := rfl` elaborates; the file elaborates with the `Quasicoherent.Basic` import removed.
**Repair:** Delete both theorems, `fpqcTopology` and the unused import from `Suggested.lean` (the README keeps the statements).

## R07 (P3) — `Suggested.lean` form (previous R16, not repaired)

**Location:** `Suggested.lean` lines 8–13, 37–77, 91, 99, 108, 115, 121–125: "# The functor of points: suggested interfaces … These are suggested forms, not an exhaustive checklist."
**Claim:** The docstring is not "…: target signatures" stating the headline theorems against the pinned APIs; nine declarations have no docstring; no layer section comments; four Lean names are not in the README.
**Witness:** No docstring on `zariskiTopology`, `fpqcTopology`, `pointsFunctor`, `IsOpenSubfunctor`, `IsClosedSubfunctor`, `IsLocallyRepresentable`, `LocallyRepresentable`, `pointsFunctor_full`, `pointsFunctor_faithful`. README has `IsOpenImmersion.iff_pointsFunctor`, `Module.Grassmannian.isLocallyRepresentable`; Lean has `isOpenImmersion_iff_points`, `isClosedImmersion_iff_points`, `universallyClosed_iff_dvr`, `grassmannian_isLocallyRepresentable`.
**Repair:** Retitle and reword the module docstring (keep its list of unstatable targets); add a mathematical docstring to each declaration; add `/-! ## Layer k: … -/` comments; use one name per target in both files, and name the §4.2 theorem in the README.

## R08 (P3) — README shape and policy (previous R17, not repaired)

**Location:** README lines 138, 140, 154, 159, 670: "## Supplier interfaces and ownership"; "the Lean prototype"; "wherever these are not already in Tau Ceti"; "[the QuasicoherentSheavesOnPrestacks proposal](https://github.com/TauCetiProject/TauCetiRoadmap/pull/2450)"; "### 5.5 Hilbert and Quot functors **[not a target here]**".
**Claim:** The supplier section is not `## Exact supplier contracts` with per-supplier lists; a pull-request link, process words and a conditional supplier appear; §5.5 is a non-target section; no layer ends with `### Examples` and `### Dependencies`; §§2.3–2.5, 3.1, 5.1–5.4, 6.1–6.2, 6.4–6.6 have no `*Needs:*`.
**Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md` shows the shape on main; pinned Tau Ceti has no scheme-level `FormallySmooth` or `FormallyEtale`, so the "wherever" clause has one reading.
**Repair:** Rename and split the section into `### From Mathlib`, `### From Tau Ceti`, `### From TauCetiRoadmap.<X>`; write "the formal smoothness and formal étaleness of scheme morphisms are SchemeAndStackFoundations §4.1"; cite "QuasicoherentSheavesOnPrestacks (Scope and ownership)"; delete §5.5 (Scope line 86 defers it); add the two closing subsections per layer and the missing `*Needs:*` lines.

## R09 (P3) — Checks (previous R18, not repaired)

**Location:** README lines 275 (§0.3), 252–253 (§0.2) and §§2.1–2.2, 2.4, 2.5, 3.1b, 5.1, 5.2, 5.4, 6.1, 6.2, 6.3, 6.5: "The equivalence sends the terminal sheaf to the terminal sheaf."; "if `R` has no nontrivial idempotents, `X(R × R)` has four elements".
**Claim:** The first Check holds for every equivalence. The second fails for `R = 0`. The listed sections define objects with fewer than three Checks (most with none); §§0.3, 1.2, 1.3 have two.
**Witness:** Any equivalence preserves terminal objects. For `R = 0`: `R × R = 0` has one idempotent, and `R` has no nontrivial one.
**Repair:** §0.3: "the image of the Yoneda sheaf of `𝔸¹_R` has `A`-points `A`". §0.2: "if `R ≠ 0` has no nontrivial idempotents". Add three discriminating Checks per definition, e.g. §5.4: `Res_{ℂ/ℝ} 𝔾_m(ℝ) = ℂˣ`; `Res_{(R×R)/R} F = F × F`; `Res` of `D(t) ⊂ 𝔸¹` along `R → R[ε]` is `D(t₀)`.

## R10 (P3) — theorems without a locator at the claim

**Location:** README §§0.2, 0.3, 1.1, 1.3, 2.2, 3.1b, 3.2, 5.2, 5.3, 6.2, 6.4, 6.5, 6.6, e.g. lines 513–516: "Prove that for `X` over `Spec R`, `tangentFunctor (pointsFunctor X) ≅ pointsFunctor (T X)` over `pointsFunctor X`".
**Claim:** These sections state theorems and carry no source locator in the section; the tags that support four of them sit only in References.
**Witness:** `grep` of the section bodies: the only in-text locators are in §§0.1, 1.2, 2.1, 3.1, 4.1, 4.2, 5.4, 6.1, 6.3 (20 in all).
**Repair:** Move the References tags to the claims: §2.2 (Stacks Lemma 26.15.4, 01JJ), §3.2 (02H0, 02HG), §5.2 (Lemma 27.22.1, 089T, for `M` free with `0 < k < n`), §6.4 (Section 35.5, 023T). Give §§0.2, 0.3, 1.1, 1.3, 3.1b, 5.3, 6.2, 6.5, 6.6 a locator each.

## R11 (P3) — "full rank" over a local ring

**Location:** README lines 619–621: "the explicit description of `G(k, Aⁿ; A)` as `k × n` matrices of full rank modulo `GL_k(A)` acting on the left".
**Claim:** Over a local ring that is not a field, full rank does not imply surjectivity.
**Witness:** `A = ℤ_(p)`, `k = n = 1`: `G(1, A; A)` is one point; the `1 × 1` matrices `(pᵐ)`, `m ≥ 0`, all have rank one and are pairwise inequivalent under `Aˣ`.
**Repair:** "as `k × n` matrices with a unit `k × k` minor (equivalently, defining a surjection `Aⁿ → Aᵏ`), modulo `GL_k(A)` acting on the left". On the witness: only `m = 0` has a unit minor.

## R12 (P3) — constructions on the large site without the hypotheses Convention 4 promises

**Location:** README lines 708–709 and 790–791: "the presheaf of global sections `Γ(F, M) := lim_x M_x`"; "affine morphisms to `F` depend only on the fpqc sheafification of `F`".
**Claim:** Both use an operation over the large category of points of an arbitrary presheaf `F` (a limit, a sheafification) that `Type u` need not have; §6.4 states its theorem for a locally bijective `α` to avoid exactly this.
**Witness:** README lines 114–117: such constructions "are either avoided by explicit formulas … or stated with the cardinality hypotheses Mathlib requires"; neither passage does either.
**Repair:** §6.1: "for locally representable `F`, the `Γ(F, 𝒪)`-module of global sections, the limit over the affine opens of the representing scheme". §6.6: "for an fpqc-locally bijective `α : F ⟶ G` (§6.4), pullback along `α` is an equivalence between affine morphisms to `G` and to `F`".

## Verified sound

Previous review (head 1ba6596), finding by finding:

| Previous | Passage at 2183518 | Status |
|---|---|---|
| R01 | line 757: "Deduce `moduleCatExtendScalarsPseudofunctor_isStack` from SchemeAndStackFoundations §1.1's `qcoh_fpqc_descent`"; no `iff` target | repaired |
| R02 | lines 445–448: "`CommAlgCat.{u} (ULift.{u} ℤ) ≌ CommRingCat.{u}`", "`specULiftZIsTerminal`" | repaired |
| R03 | `Suggested.lean` lines 80–88: `pointsFunctor_isLocallyRepresentable`, `isLocallyRepresentable_iff` | repaired |
| R04 | `Suggested.lean` lines 99, 108, 115 and docstring lines 17–24 | repaired |
| R05 | lines 728, 792 cite the pinned names; the four absent names are gone | repaired |
| R06 | lines 584–587 unchanged | not repaired (R01) |
| R07 | lines 809–810: "SemiringSchemes …, and FlagVarieties and SchubertGeometry" | repaired |
| R08 | lines 86–88: "is owned by SemiringSchemes §4.1; this roadmap states the commutative-ring case only" | repaired |
| R09 | lines 579–584: three lemmas with their own hypotheses | repaired |
| R10 | line 499: "`X` any `k`-scheme and `x` a `k`-rational point" | repaired |
| R11 | lines 827–828, 835 | repaired |
| R12 | lines 680, 687, 720 | repaired |
| R13–R18 | unchanged | not repaired (R04–R09) |
| R19 | lines 268–270, 444, 744–747 | repaired (one clause left, R08) |
| R20 | lines 240–241: "its pointwise equivalence is Tau Ceti's existing `algSpecHomEquivAlgHom`" | repaired |
| R21 | lines 166–169 | repaired |

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 topologies, standard covers | `{ℤ→ℤ[1/p], ℤ→ℤ_(p)}`; zero algebra; `f = 0` | refinement needs `p ∣ fᵢ` or `fᵢ = 0`, span ≠ `⊤`; empty span is `⊤` iff `A = 0` | holds; 03O1 = Lemma 59.15.6, scheme form | none |
| 0.2 points functor | empty scheme; `Spec R ⊔ Spec R` at `R × R`; `R = 0` | `∅` for `A ≠ 0`, one point at `0`; 4 idempotents; 1 idempotent when `R = 0` | holds except Check at `R = 0` | R06, R09 |
| 0.3 sheaf equivalence | infinite disjoint union; terminal sheaf | limit is an infinite product; terminal preserved by any equivalence | holds; Check vacuous | R09 |
| 1.1 `V(I)`, `D(I)` | `B = 0`; `k[x,y]`, `(xy)`; `(2,x) ⊂ ℤ[x]`; `IJ ⊆ I ∩ J` | `V(⊤)(0)` one point; `V(I∩J) ⊆ V(IJ)`; `D(I) ⊆ D(J)` iff `I ⊆ rad J` via `A_f` | holds | none |
| 1.2 open and closed subfunctors | `B = 0`; `G = ⊥ ⊂ h_X`; `D((2,x))` on the affine site | `G(0) = F(0)` forced; `⊥` not open, bottom is `I = ⊥`; pullback not representable | definition holds; `iff` fails as stated | R02 |
| 1.3 dictionary; `isOpenImmersion_iff_points`, `isClosedImmersion_iff_points` | `∅ → X`; `Spec k → 𝔸¹`; `ℙ¹` at `k[x]`, `(x, 1−x)` | image `I = ⊥` open, `I = ⊤` closed; `V(t)` closed, not `D(I)`; point in no chart, in charts over `A_x`, `A_{1−x}` | holds | R07 (names) |
| 2.1 `IsLocallyRepresentable`, `JointlySurjectiveZariski` | empty index; affine opens of `X` | empty sieve covers iff `A = 0`: empty scheme; `X.affineOpens : Type u` | holds; 01JJ hypotheses (a)–(c) match | none |
| 2.2 front door; `isLocallyRepresentable_iff`, `pointsFunctor_full`, `_faithful` | idempotents functor; `infer_instance` | `Spec (R × R)`; instance not found | holds; not one-tactic | R10 |
| 2.4 absolute case | `u` arbitrary | `zariskiTopology (ULift.{u} ℤ)` type-checks at `CommAlgCat.{u}` | holds | none |
| 3.1 tangent spaces | `μ_p/𝔽_p`; cusp; three-fold square over `A[ε₃]` | `T = k`; `k²`; `ε₁ε₃ ≠ 0` versus `0` | comparisons hold (0B2E: `κ(x) = κ(s)` only); module axioms need more | R03 |
| 3.1b tangent bundle | `𝔸ⁿ` | `A[ε]ⁿ = A²ⁿ`, `Sym(Ω) = R[x, dx]` | holds; no locator | R10 |
| 3.2 infinitesimal lifting | origin in `𝔸¹_k`; `k[t]/(t²)`; `μ₂/𝔽₂`, `𝔽₂[u]/(u⁴)`, `I = (u²)` | image `c = 0`; `t ↦ 0, ε` collide; `(1+u+cu²+du³)² = 1+u² ≠ 1` | holds; scheme-level `FormallySmooth` absent at pins | R10 |
| 4.2 discrete valuation rings; `universallyClosed_iff_dvr` | Stacks 0207, 0208, 05JY, 05JX, 00PH; `simp` with `eq_valuativeCriterion` | locally finite type; finite type; finite type; quasi-compact; goal left open | statement holds; route incomplete | R01 |
| 5.2 Grassmannians; `grassmannian_isLocallyRepresentable` | `k = 0`; `M = 0`, `k ≥ 1`; `A = ℤ_(p)`, `k = n = 1` | one point; empty scheme (`rankAtStalk` vacuous at `A = 0`); `(pᵐ)` full rank, surjective only for `m = 0` | holds; local description misworded | R11 |
| 5.3 projective space | `n = 0`; `A = 0`; `ℤ[√−5]`, `(2, 1+√−5)` | `Spec R`; one point; non-free rank-one quotient of `A²` | holds; quotient convention agrees with §§1.3, 6.6 | R10 |
| 5.4 Weil restriction | `B = 0`; `V(I)`; `D(I)` | `F(0)`, a point for a sheaf; coefficient ideal; complement of a finite image | holds | R09 |
| 5.5 Hilbert and Quot | SchemeAndStackFoundations §4.14; AlgebraicModuliForArithmeticGeometry Layer 2 | both on main (lines 7025; 1078) | citation resolves | R08 |
| 6.3 modules and quasi-coherent sheaves | Strickland Proposition 3.3; affine `X` | Strickland1999 line 1260: equivalence for a scheme, absolute base; affine case is §6.2 | holds; `Module F` carrier absent at pins | none |
| 6.4 fpqc invariance | `ℝ → ℂ`; `ℤ → ℤ[1/2] × ℤ_(2)`; `ℤ → ℚ` | involution datum; `B ⊗ B` has factors `ℤ[1/2]`, `ℤ_(2)`, `ℚ`, `ℚ`; `ℤ/2 ⊗ ℚ = 0` | holds | R04, R10 |
| 6.6 affine morphisms | `Spec Sym(L)` over `ℙ¹` | points `A² ↠ L_x → A`: total space of `𝒪(−1)`, blow-up of `𝔸²` at the origin | holds | R12 |

- Source locators checked against the text this round: 11 (Strickland Definition 2.42, Proposition 3.3; Stacks 03O1, 0B2E, 0207, 0208, 05JY, 05JX, 0CM2, 00PH, 01JJ, 089R/089T).
- Library declarations opened at the pin: 34 (among them `Scheme.fpqcTopology` `Sites/Fpqc.lean:88`, `LocalRepresentability.isRepresentable` `Sites/Representability.lean:203`, `specULiftZIsTerminal` `Limits.lean:50`, `ValuativeCommSq` `ValuativeCriterion.lean:54`, `Module.Grassmannian` `RingTheory/Grassmannian.lean:66`, `isProper_toSpec` `Grassmannian/Proper.lean:230`, `CommMon.relativeSpec` `RelativeSpec/Basic.lean:417`).
- Cross-roadmap citations resolved: 16 (SchemeAndStackFoundations §§1.1, 1.3, 1.22, 2.9, 4.1, 4.6, 4.14 and four names; AlgebraicModuliForArithmeticGeometry §§1.1, 1.3, 3.4, Layer 2; ModularCurves 0F–0G; AlgebraicVectorBundles L0A–L1B; ReductiveGroups Layers 1, 2; SemiringSchemes §§4.1, 5.3).
- Gate at 2183518: FAIL (residue 1, statement-hygiene 2, readme-ids-missing 7; build 0, depcheck 0, set_option 0, sorry-data 0, outside-folder 0).
- Dependency check: `depcheck: 261 roadmaps, 2596 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates, `sorry` the only warning (9); the 18 elaborated types compared with the README, no section binder lost.
- One-tactic probe: `pointsFunctorUliftIso_exists` is `rfl`; `pointsFunctor_full`, `_faithful` do not close by `infer_instance`; `pointsFunctor_isLocallyRepresentable` not by `simp`; `universallyClosed_iff_dvr` not by `simp` with Mathlib's criterion.
- Pull request text read against the head: no sentence contradicted; the pull request changes no file outside the folder.

Overlap check: read SemiringSchemes, QuasicoherentSheavesOnPrestacks, SchemeAndStackFoundationsPartII (scope), SchemeAndStackFoundations, AlgebraicModuliForArithmeticGeometry, AlgebraicVectorBundles; the generic open-immersion layer is SemiringSchemes §4.1's, which consumes this roadmap's §§0.1, 1.2, 2.4 in one direction; scheme-level fpqc descent is SchemeAndStackFoundations §1.1's; Weil restriction of schemes is AlgebraicModuliForArithmeticGeometry §3.4's; nothing else shared.

Source independence: 10 passages compared with 2 sources (Stacks project, Strickland), none shared; largest share Stacks project, 10 of 20 in-text locators; contents compared with the Stacks project: independent (the tags lie in Chapters 10, 26, 27, 32, 33, 59). Demazure–Gabriel, Jantzen, Eisenbud–Harris, Bosch–Lütkebohmert–Raynaud and Milne could not be read.

Research link: Layers 0–2 are the commutative-ring case of the relative schemes of Toën–Vaquié (2009), which the SemiringSchemes roadmap consumes; Layer 6 is the functorial module theory of Strickland (1999), §§2.6 and 3. Rests on the README's Scope, Downstream consumers and References, and on Strickland's text.

## Not verifiable

- Demazure–Gabriel I.1.3.6, I.2.4.1, I.1.3.11 (§§1.2, 2.1): no legal copy found.
- Jantzen I.1.7, I.1.12 (§1.2): no legal copy found.
- Eisenbud–Harris Theorem VI-14 (§2.1): no legal copy found.
- Bosch–Lütkebohmert–Raynaud 7.6/4 (§5.4): paywalled; cited by locator, uncertified.
- EGA II, Théorème 7.3.8 (§4.2): not re-read this round; the previous review read it and the sentence it supports is the one that review proposed.
- Milne, Chapter 1 and Appendix A (References only): not read.

## Source issues

- none

## For the human reviewers

- Scope: the headline theorems are textbook results (Demazure–Gabriel 1970, EGA II 1961, Stacks project); the only research articles in `README.md` References are Toën–Vaquié 2009 (out-of-scope extension) and Strickland 1999.
- Licence: the pull request description says the folder was adapted from a "supplied draft" whose "original repository and source PR are preserved"; neither the repository nor its licence is named in the folder or the description.
- Not tested: Layers 1 and 2 cite Demazure–Gabriel Chapitre I most among the books; its table of contents could not be read, so their arrangement was not compared with it.
- Process: the description says previous findings R13–R18 are "intentionally unchanged, at the author's request" pending a discussion; they are raised again as R04–R09 and keep the gate failing.
