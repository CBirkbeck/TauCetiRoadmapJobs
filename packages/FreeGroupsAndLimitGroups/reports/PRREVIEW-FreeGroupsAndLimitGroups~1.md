# Review of FreeGroupsAndLimitGroups (pull request #2205 at a3cae50)

**Verdict:** needs changes

## R01 (P1) — §11.3: the basic automorphisms do not fix the §6.5 standard word when m, n ≥ 1

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:2612,2617`: "Define each `γ_i` on the generators `X` by the explicit formulas of IFT §7.1" and "`GroupAlgGeom.Lift.basicSeq_fix`: `γ_i(S) = S`."

**Claim:** §11.3 takes `S` in §6.5 standard form, with the commutators first (`∏[x_i,y_i]∏z_j⁻¹c_jz_j d`). The formulas of IFT §7.1 fix the coefficient-first word of IFT (71), so `basicSeq_fix` is false whenever m ≥ 1 and n ≥ 1.

**Witness:** Take m=n=1, `A=z⁻¹czx⁻¹` and IFT γ₁: `z↦zA`, `x↦A⁻¹xA`, `y↦A⁻¹y` (IFT line 3177). It fixes `z⁻¹cz·[x,y]` but sends `[x,y]·z⁻¹cz` to `x z⁻¹c⁻¹z x⁻¹ z⁻¹cz x⁻¹y⁻¹xy x z⁻¹cz x⁻¹`, checked by free reduction.

**Repair:** After the first sentence of §11.3, insert: "Write `C=∏[x_i,y_i]` and `Z=∏z_j⁻¹c_jz_j`, so that the §6.5 word is `CZd`. The basic automorphisms `γ_i` of IFT §7.1 are defined on, and fix, the word `ZCd` (IFT (71), with its constant renamed). Let `θ` be the coefficient-fixing automorphism `x_i↦d x_i d⁻¹`, `y_i↦d y_i d⁻¹`. Then `θ(ZCd)=C⁻¹(CZd)C`, so `θγ_iθ⁻¹` fixes a conjugate of the §6.5 word and induces a `G`-automorphism of `G_{R(S)}`. When m=0 or n=0 the two words agree and no transport is applied." Replace `basicSeq_fix` with "`γ_i(ZCd)=ZCd`, and `θγ_iθ⁻¹` preserves `ncl(S)`". The §11.4 Check (m=0) is unchanged. I verified this transport on the witness above.

## R02 (P2) — Fourteen definitions in `Suggested.lean` have `sorry` in their bodies

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/Suggested.lean:159,180,445,452,458,465,516,801,807,932,957,974,985,997`, e.g. `def ofSimpleGraph … rev_rev := by sorry`.

**Claim:** The gate fails `sorry-data`. Three of these definitions, `disc`, `torus` and `projectivePlane`, carry unproved claims (`connected`, `surface_links`) inside data.

**Witness:** gate `sorry-data (14)`. `SurfaceModel.disc`, lines 981–982: `connected := by sorry`, `surface_links := by sorry`.

**Repair:** Delete the fourteen definitions, since no headline theorem uses them (README §§2.1–2.2, 2.9 and 6.0a keep them as targets), together with the declarations that mention them (R07). Any definition that is kept gets real proofs, for example `rev_rev := fun e => e.symm_symm` and `rev_ne := fun e => e.symm_ne` in `ofSimpleGraph`.

## R03 (P2) — `Suggested.lean` states its headlines on private stand-ins for carriers the pinned Tau Ceti defines, and restates theorems the pin proves

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/Suggested.lean:48,64,110,676–698,1106,1153`: `def IsProperPower`, `def IsCSA`, `isCSA_freeGroup`, `GX`…`CoordGroup`, `IsFullyResiduallyFree`, `isLimitGroup_iff`.

**Claim:** The acceptance test does not test the library. The pinned Tau Ceti already defines these carriers and proves several of the stated targets.

**Witness:** At Tau Ceti `2fd255d`: `Group.IsProperPower` (GroupTheory/ProperPower.lean:31, the same body), `Group.IsCSA` (CSA.lean:41), `IsFreeGroup.isCSA` (FreeGroup/CSA.lean:160), `TauCeti.LimitGroup.isLimitGroup_iff_isFullyResiduallyFree` (LimitGroup/Characterization.lean:171) and `TauCeti.GroupAlgGeom.rad_sq` (GroupAlgGeom/AlgebraicSet.lean:755).

**Repair:** Import the Tau Ceti modules that define these carriers. Delete the stand-ins `IsProperPower`, `IsCSA`, `IsCommTransitive`, `GX`, `algSet`, `radical`, `CoordGroup`, `IsSeparatedBy`, `IsDiscriminatedBy`, `IsGDomain`, `IsEquationallyNoetherian`, `IsResiduallyFree`, `IsFullyResiduallyFree`, `IsLimitGroup`, `IsBP`, `CentralizerExt`, `SerreGraph` and `EqIneqSystem`. Also delete the targets the pin proves: `isConj_iff_isRotated`, `exists_maximalRoot`, `commute_iff_exists_zpow`, `centralizer_eq_zpowers`, `zpowers_malnormal`, `isCSA_freeGroup`, `isClosed_iff_algebraic`, `closure_eq_V_I`, `isEquationallyNoetherian_freeGroup`, `isIrreducible_iff_discriminated`, `exists_injective_freeGroup_SL`, `rad_sq` and `isLimitGroup_iff`. Restate the remaining headlines on the Tau Ceti carriers, and list them under "From Tau Ceti" with file names.

## R04 (P2) — The §7.7 headline can be stated at the pins but is absent

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:5`: "the recursive decidability of satisfiability of systems of equations and inequations over a free group of finite rank (Layer 7)". `Suggested.lean` states nothing for it and does not call it unstatable.

**Claim:** This is a headline theorem that can be stated at the pins, and it is missing from `Suggested.lean`.

**Witness:** The repair below elaborates with `import Mathlib` alone (a scratch probe run with `lake env lean`; the only warning is `sorry`).

**Repair:** Add to Layer 7 of `Suggested.lean`, and cite it in §7.7 in place of `FreeGroup.satisfiability_recursive`:
```lean
/-- Satisfiability of finite equation–inequation systems over `F(Fin n)` is recursive,
uniformly in the number of variables `x_i`, `i : ℕ` (§7.7). -/
theorem satisfiability_recursive (n : ℕ) :
    ComputablePred (fun s : List (List ((ℕ ⊕ Fin n) × Bool)) ×
        List (List ((ℕ ⊕ Fin n) × Bool)) =>
      ∃ v : ℕ → FreeGroup (Fin n),
        (∀ w ∈ s.1, FreeGroup.lift (Sum.elim v FreeGroup.of) (FreeGroup.mk w) = 1) ∧
        ∀ w ∈ s.2, FreeGroup.lift (Sum.elim v FreeGroup.of) (FreeGroup.mk w) ≠ 1) := by
  sorry
```

## R05 (P2) — The §11.5 implicit function theorem is stated only for one equation, and only as an ordinary lift

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/Suggested.lean:1392`: `theorem hasLift_genusTwo … (hT : IsCompatible {genusTwoEquation} T) : HasLift {genusTwoEquation} T`.

**Claim:** The headline asserts a complete `S`-lift for every regular standard quadratic `S` over `F`. The file states it only as a genus-two instance with an ordinary lift, which is a weakened substitute for a theorem that can be stated at the pins.

**Witness:** README §11.5 (line 2720) quantifies over every regular standard quadratic `S`. The file already declares `IsCompatible`, `HasCompleteLift`, `GX` and `comm`. Only the standard words and IFT Definition 6 are missing.

**Repair:** Define, with real bodies, `orientableQuadraticWord (n m : ℕ) (c : Fin m → F) (d : F) : GX F ((Fin n ⊕ Fin n) ⊕ Fin m)` as `∏[x_i,y_i]∏z_j⁻¹c_jz_j d`, its non-orientable analogue, and `IsRegularQuadratic` as in README §6.7. State `theorem hasCompleteLift_of_isRegular (hS : IsRegularQuadratic S) (hT : T.Finite) (hc : IsCompatible {S} T) : HasCompleteLift {S} T`, and delete `hasLift_genusTwo` and `genusTwoEquation`.

## R06 (P2) — The ClassifyingSpaces supplier citation is dropped by open revisions, and the pinned Tau Ceti already has the object

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:29,40,2414`: "[ClassifyingSpaces, Stage 2 item 7](../ClassifyingSpaces/README.md#stage-2-the-cellular-model) supplies presentation complexes and their fundamental-group comparison to §10.1a".

**Claim:** At the heads of open pull requests #1807 and #1808, ClassifyingSpaces has no Stage 2 heading, so this anchor breaks when either merges. The comparison already exists at the pin. In addition, line 40 cites "AlgebraicTopology Stage 1 … Stage 4", but on main those are Layers 1 and 4.

**Witness:** At Tau Ceti `2fd255d`: `TauCeti.PresentationComplex` and `TauCeti.PresentationComplex.fundamentalGroupMulEquiv` (AlgebraicTopology/ClassifyingSpace/PresentationComplex.lean:117,238). ClassifyingSpaces at #1807, line 128: "Stage 2, the cellular model, items 7–10: pinned, From Tau Ceti".

**Repair:** Delete the ClassifyingSpaces sentence at line 29 and the table row at line 40. Add under "From Tau Ceti": "`TauCeti.PresentationComplex R` and `TauCeti.PresentationComplex.fundamentalGroupMulEquiv` (TauCeti/AlgebraicTopology/ClassifyingSpace/PresentationComplex.lean): the CW presentation complex of `⟨S | R⟩`, with `π₁ ≃* PresentedGroup R`. Used in §10.1a." In the §10.1a *Needs:* line (line 2414), cite this declaration instead.

## R07 (P3) — `Suggested.lean` is an API catalogue: padding, and a docstring that names no unstatable headline

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/Suggested.lean:4–11`: "representative target signatures … this file is not exhaustive … the examples record proved boundary cases". There are proved `example`s at lines 170, 269–334, 351–373, 471, 630, 636 and 1403.

**Claim:** The file contains boundary-case theorems that mirror README Checks, thirteen proved examples, and Layer 2, 3 and 6 definitions that no headline uses. Its docstring does not name the headlines that cannot be stated at the pins.

**Witness:** `rad_sq` (line 773) is a README §5.2 Check. README line 140 calls `trivial_coefficients_closure_boundary`, `centralizerExt_proper_power` and `compatible_no_lift` "boundary targets". Under `simp [algSet, evalAt]`, `conjugate_coeff_algSet_eq_empty` reduces to `simpa using hc`.

**Repair:** Delete every `example`. Delete `rad_sq`, `trivial_coefficients_closure_boundary`, `centralizerExt_proper_power`, `radical_conjugacy_eq`, `compatible_no_lift`, `quadratic_specialization_radical_gap`, `quadratic_specialization_reducible`, `boundedTwist_family_solvable`, `boundedTwist_no_lift` (with their definitions), `conjugate_coeff_algSet_eq_empty` and `dehnTwistHNN_eq_refl_iff`. Delete the Layer 2, 3 and 6 definitions and API theorems that no headline uses; the README keeps all of these as targets and Checks. Delete README lines 140–142. Make the docstring: "FreeGroupsAndLimitGroups: target signatures. The roadmap is README.md; this file is not the roadmap. It states the headline theorems against the pinned Mathlib and Tau Ceti. Not statable at the pins: §7.8 (no `Primcodable` structure on formulas); §§10.2 and 10.7 (no graph-of-groups, JSJ or Hom-diagram carrier); §11.6 (no NTQ-system carrier)."

## R08 (P3) — Six theorems conclude `Nonempty (A ≃* B)`

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/Suggested.lean:215,229,838,842,943,949`, e.g. `graphPresentation_free … : Nonempty (Γ.GraphPresentation T ≃* FreeGroup {e : E // e ∈ O ∧ e ∉ T.edges})`.

**Claim:** These fail the gate's `statement-hygiene` rule: a theorem with a `Nonempty` isomorphism conclusion must be named `nonempty_*`.

**Witness:** gate `statement-hygiene (6)`, lines 215, 229, 838, 842, 943 and 949.

**Repair:** Delete the four §6.0b–6.0c theorems (lines 838, 842, 943 and 949) together with R07. Rename the other two `nonempty_graphPresentation_mulEquiv_freeGroup` and `nonempty_graphPresentation_abelianization_addEquiv`.

## R09 (P3) — A pull-request number in the README

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:26`: "[Mathlib PR #42677](https://github.com/leanprover-community/mathlib4/pull/42677), commit `b38ce379d898d1284bae5582be27de1d2af39f67`, proposes `FreeGroup/Center.lean`".

**Claim:** This fails the gate's `prnum` rule.

**Witness:** gate `prnum (1)`, line 26.

**Repair:** Replace the opening of the line with "A proposed Mathlib file `Mathlib/GroupTheory/FreeGroup/Center.lean` (Mathlib commit `b38ce379d898d1284bae5582be27de1d2af39f67`) states". Remove the pull-request link.

## R10 (P3) — The supplier pins stated in the README are not the manifest's pins

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:56,127,2780`: "From Mathlib (commit 6b7abb3)", "From Tau Ceti (commit a91d3aa)", and the [LEAN] reference at commit `6b7abb3c…`.

**Claim:** The supplier contracts name commits that the repository does not pin.

**Witness:** `lake-manifest.json` pins mathlib at `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and TauCeti at `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Every listed Mathlib name resolves at `1b1ccf4`.

**Repair:** Write "(commit 1b1ccf4)" and "(commit 2fd255d)", and point the [LEAN] reference at `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`.

## R11 (P3) — §6.2 cites GL-JSJ for a statement it does not make, and plans a theorem the pin already proves

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:1519`: "[GL-JSJ] §5.1, p. 42: Compact surfaces with nonempty boundary have free fundamental group; …(Proposition 5.4 and the remark after Corollary 5.6)". Line 1515: "finitely generated residually finite groups are Hopfian (Malcev's argument …)".

**Claim:** GL-JSJ §5.1 states no freeness result, and Proposition 5.4 and the remark are on p. 43. The Hopf property that the proof route plans is already proved at the Tau Ceti pin.

**Witness:** GL-JSJ lines 1935–2125 (pp. 41–44) contain no freeness statement. Proposition 5.4 is at line 2042 and the remark at line 2062, both on p. 43. The pin has `Group.ResiduallyFinite.injective_of_surjective` (TauCeti/GroupTheory/ResiduallyFinite.lean:42).

**Repair:** Change line 1519 to: "[GL-JSJ] §5.1.2, Proposition 5.4 and the remark after Corollary 5.6, p. 43: closed hyperbolic surface groups are one-ended (an alternative route to (2)); (1) is the Tietze elimination of `p_m`". In line 1515, cite "Tau Ceti `Group.ResiduallyFinite.injective_of_surjective` (Malcev)", and add it to "From Tau Ceti".

## R12 (P3) — §8.1 gives the wrong section for LIMITS Definition 2.5

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:1932`: "Use [LIMITS] §2.3, Definition 2.5, p. 12".

**Claim:** Definition 2.5 is in §2.5, "Limit groups: first approach". §2.3 is "Changing the marker".

**Witness:** LIMITS line 466 (the §2.5 heading, p. 12) and line 477 (Definition 2.5).

**Repair:** "Use [LIMITS] §2.5, Definition 2.5, p. 12".

## R13 (P3) — §6.1a cites the wrong Gallier–Xu result for normal forms

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:1506`: "Chapter 6, Definitions 6.1 and 6.5 and Theorem 6.1 (polygonal models, boundary normal forms and moves)".

**Claim:** The reduction to normal form by moves is Lemma 6.1. Theorem 6.1 is the homeomorphism classification, which §6.1a does not use.

**Witness:** SURFACES line 3564: Lemma 6.1, printed p. 92, says every cell complex is equivalent to a canonical one. Line 3719: Theorem 6.1, p. 96, is the classification of surfaces up to homeomorphism.

**Repair:** "Chapter 6, Definition 6.1, p. 80, Definition 6.5, p. 88, and Lemma 6.1, p. 92 (polygonal models, boundary normal forms and moves)".

## R14 (P3) — §2.10 credits the intersection at arbitrary vertices to the wrong KM02 result

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:605`: "conversely two closed paths with the same reduced label combine (KM02 Proposition 9.4)". The locator list at line 610 omits Lemma 9.3.

**Claim:** The statement's claim at an arbitrary vertex pair `(v,w)` is KM02 Lemma 9.3. Proposition 9.4 concerns only the core at the base vertices.

**Witness:** KM02 lines 1150–1152 (Lemma 9.3, p. 25): `L(Γ×∆,(v,u)) = L(Γ,v) ∩ L(∆,u)` for any vertices. Lines 1157–1160 (Proposition 9.4): the core at `1_H×1_K` is `Γ(H∩K)`.

**Repair:** At line 605 write "(KM02 Lemma 9.3)". At line 610, after "Lemma 9.2, p. 25," insert "Lemma 9.3, p. 25,".

## R15 (P3) — Checks name Lean counterparts, and API bullets name declarations no file declares

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:185`: "- `FreeGroup.isProperPower_of_sq`: `of a ^ 2` is a proper power in `FreeGroup α`." The same pattern runs through every layer.

**Claim:** Checks must be prose with no Lean name. A backticked name of this roadmap's own must be declared in `Suggested.lean`. About 270 names resolve nowhere.

**Witness:** `citations.md`, "Lean names found nowhere", e.g. README line 699 `FirstOrder.Language.group.Term.ofWord_toWord_ne` and line 1775 `FreeGroup.GenEq.Transformation.solution_forward`.

**Repair:** Rewrite each Check without its Lean name; line 185 becomes "- `of a ^ 2` is a proper power in `FreeGroup α`.". In API bullets, keep backticked names only for declarations of `Suggested.lean` or of the pinned libraries, and state the rest in prose.

## R16 (P3) — Stray backtick artefacts in headings, prose and references

**Location:** `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:1403`: "### 6.`0b` Polygonal moves, normal forms and boundary transport". The same artefact appears at lines 1419, 1436, 2080, 2678 and 2695, as "i.`e`." at line 305, and as "`J`. Algebra" at line 2785.

**Claim:** A code-span pass broke six headings, which are also anchors, as well as fifteen reference entries and several sentences.

**Witness:** Other examples: line 40 "Stage 2.`7 →` §10.1a `→`"; line 29 "`AlgebraicTopology's`"; line 2797 "`arXiv:0907`.2356v2"; line 2790 "`G`. `S`. Makanin"; line 158 "Lemma 3.`8(2)`".

**Repair:** Write "### 6.0b", "### 6.0c", "### 6.0d", "### 8.6b", "### 11.4b", "### 11.4c", "i.e.", "J. Algebra", "arXiv:0907.2356v2", "G. S. Makanin", "Lemma 3.8(2)", "IFT Corollary 1(1)" and "AlgebraicTopology's".

## R17 (P3) — The description says no target is weakened

**Location:** Pull-request description, first paragraph: "Only the sentences that are wrong or ambiguous are changed. No target is added, removed or weakened".

**Claim:** At the head, the converse of §7.5 is graphical for ET1 and ET3 only under reducedness, ET3 gains a hypothesis, and §7.7 becomes uniform in the number of variables.

**Witness:** README line 1794: "for ET2 it is graphical, and for ET1, ET3 and the remaining cases it is graphical under the reducedness conditions". §7.4: "ET3 applies to a pair with `α(μ)=α(Δ(μ))` and `β(μ)=β(Δ(μ))`".

**Repair:** "No target is added or removed. The backward-graphical clause of §§7.4–7.5 is weakened for ET1 and ET3, where it was false; ET3 gains the hypothesis `β(μ)=β(Δ(μ))`; §7.7 is strengthened to be uniform in the number of variables."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.6 centralizer is ⟨maximal root⟩ | `a²ba²b`; `x=1`; `b⁻¹a⁶b` | `C=⟨a²b⟩` (k=2); `C(1)=F`, not cyclic; root `b⁻¹ab`, k=6 | holds; `x≠1` needed | none |
| §2.7 Stallings correspondence | `⟨ab⟩` vs `⟨ba⟩`; `⟨a,bab⁻¹⟩`; `H=1` | based graphs differ, Type graphs equal; the second vertex lacks an outgoing `b`, so infinite index; one vertex kept (KM02 Def. 7.3) | holds | none |
| §2.10 Howson | `⟨a²⟩∩⟨a³⟩`; `⟨a,bab⁻¹⟩∩⟨b⟩` | 6-cycle core gives `⟨a⁶⟩`; `b`-exponent sum 0 versus n, so `⊥` | holds | R14 |
| §3.2 term–word | `mul(inv a,mul(x,a))`; `mul(t,inv t)` | `a⁻¹xa`; word 1 but term ≠ `one`, so `ofWord∘toWord≠id` on syntax | holds | none |
| §4.3 normal form | `⟨a,t∣ta²t⁻¹=a⟩`: `tat⁻¹`, `ta²t⁻¹`; segment with `C=A=B` | `a∉⟨a²⟩`, no pinch, `tat⁻¹∉⟨a⟩`; `ta²t⁻¹=a`; every return path pinches | holds | none |
| §6.1a model comparison | disc, torus, ℝP², pants | trivial; `⟨a,b∣[a,b]⟩`, χ=0; `⟨c∣c²⟩`, χ=1; `F(p₁,p₂)` with 3 peripheral classes | holds | R13 |
| §6.2 free / not free | `S⁺(0,3)`, `S⁺(1,1)`, `S⁺(1,0)`, `S⁻(1,0)`, `S⁺(0,0)` | rank 2 = 1−χ for both; ℤ² not free; ℤ/2 has χ=1, trivial group χ=2, both excluded | holds | R11 |
| §6.5 standard forms | genus 3 `(a,b,b,a²,a,a⁻¹ba)`; `∏zᵢ⁻¹cᵢzᵢ(aba)⁻¹` | `[a,b][b,a²]=a⁻¹b⁻¹a⁻¹ba²=[a⁻¹ba,a]`; adjacent atoms do not commute; κ=4, χ=−2 | holds | none |
| §6.6 normalization | `z⁻¹az`; `xyxy⁻¹`; `1` | coefficient branch, `V=∅`; `(xy,y⁻¹)` gives `x′²y′²`; every assignment solves | holds (corrects IFT Lemma 1) | none |
| §6.7 regularity | `[x₁,y₁][x₂,y₂]`; `x²y²z²`; `[x,y]=a` | κ=4, only commutative solutions; κ=3, Lyndon; `a∉[F,F]`, so inconsistent | holds (IFT Def. 6) | none |
| §8.1 RF/FRF | `F₂×ℤ`; `ℤ/2`; `S⁻(3,0)`; trivial group | RF; not FRF ((1,1) central forces `[a,b]↦1`); torsion; Lyndon kills `[x,y]`; vacuous | holds | R12 |
| §8.4 Checks | `⟨a²,b⟩≤F(a,b)`; set `⟨a⟩∪⟨b⟩` | an `F`-map would need a root of `a²` in `F`, and it is `a∉F`; `[x,a],[x,b]` commute, conjugates by `a` do not: not CT | holds | none |
| §9.1 Lyndon length | `l≡0`; `ℤ/2` with `l=1`; lexicographic `ℤ²` | free only on the trivial group; (L3) holds, `l(t²)=0<1` fails (L5); `c=min` or 0 in Λ, regular | holds | none |
| §9.3 Chiswell | `F(a,b)` on its Cayley tree; KMS-ACTIONS Thm. 23 | `l_x` is word length, free; Thm. 23 needs (L4) for the tree, (L5) gives freeness | holds | none |
| §9.6 U-folded graphs | `⟨ab,ac⟩`; empty family | 2 vertices, 3 edge pairs, folded; one vertex, accepts `⊥` | holds | none |
| §11.4a solution trees | `y=x`; `[y,x]=1` at `x=1`; `u^x u⁻¹=1` at `u=1` | `y↦x`; `y` arbitrary and retained; `x` arbitrary (IFT Thm. 5, pp. 59–60) | holds | none |
| §11.5 IFT, quadratic | `S=[x₁,y₁][x₂,y₂]`, `T=([z,x₁]=1∧z≠1)` | compatible (`z=a₁`, or any `z≠1` when `a₁=1`); lift `z=x₁≠1` in `S⁺(2,0)=F_{R(S)}` | holds | R05 |
| §11.3 `basicSeq_fix` | m=n=1, IFT γ₁ with `A=z⁻¹czx⁻¹` | fixes `z⁻¹cz[x,y]`; image of `[x,y]z⁻¹cz` begins `x z⁻¹c⁻¹z`; transported `θγθ⁻¹` fixes `θ(ZCd)` | false as written | R01 |
| §7.4 ET1/ET3 (this PR) | ET3 `μ=Δμ=[1,3]`, `U=(a,a⁻¹)`; ET1 `(2,λ,4)`, `U=(a,a⁻¹,a,a⁻¹)`; bases `[1,2]`, `[1,3]` | successor solved, source side `aa⁻¹` not reduced; Def. 10 has no β clause; `h₁=h₁h₂` forces `h₂=1` | corrections hold | none |
| §11.3 order of `φ_{K,p}` (this PR) | IFT Notation 42, Lemma 44(1) | `z_i^{φ_K}=z_i^{φ_i}` needs `γ_K,…,γ_{i+1}` applied first, since they fix `z_i` | correction holds | none |
| §10.9 leaves (this PR) | JSJ §11.1, pp. 191–192 | leaves `H∗H_{v,i}∗F_v`; λ identity on `H`, embeddings on `H_{v,i}`; edge maps are `H`-homomorphisms | correction holds | none |
| §6.8 `radical_conjugacy_eq` | `c=a²`, `d=a⁻²`, `b=1` over `F(a,b)` | `V=⟨a⟩`; `[z,a]∈R(S)`, not in `ncl([z,a²])` (length-4 normal form) | README right, IFT Thm. 2(3) wrong | R07 |
| Headline §7.7 | ranks 0, 1; scratch probe | rank 0: every inequation fails; `ComputablePred` on list codes elaborates | statable, absent | R04 |
| Headline §7.10 `merzljakov` | `∀x∃y y=xa`; `∀x∃y [x,y]=1`; k=0 | `q=xa`; `q=x`; empty tuple | Lean matches README | none |
| Headline §7.11 | `∀x∃y y²=x` | false at `x=a`; no formal `q`, since `q²=x` has no solution in `F(A∪{x})` | holds | none |
| Headline §8.4 `isLimitGroup_iff` | ℤ², `F₂×ℤ`, trivial group | FRF yes / no / yes; proved at the pin | true; restated | R03 |
| Headlines §§10.2, 10.7 (JSJ, MR diagrams) | carriers at the pins | no graph-of-groups or Hom-diagram carrier at the pins | not statable; docstring silent | R07 |
| Headline §11.5 | as in the §11.5 row | only the genus-two `HasLift` is stated | stand-in | R05 |
| Headline §11.6 (NTQ systems) | carriers at the pins | no NTQ-system carrier at the pins | not statable; docstring silent | R07 |

- Source locators checked against the text: 67, in 13 sources (IFT, KM02, SUBGROUPS, LENGTH, KMS-ACTIONS, MRS-REGULAR, FOLD, GL-JSJ, LIFT, JSJ, LIMITS, Gallier–Xu, Hatcher). All 15 sampled targets were read; 11 verify cleanly, 4 have locator defects (R11–R14).
- Library declarations opened at the pins: 18 in Mathlib `1b1ccf4` (e.g. `FreeGroup.injective_lift_of_ping_pong` at CoprodI.lean:972; `realize_toPrenex` at ModelTheory/Complexity.lean:262) and 36 in Tau Ceti `2fd255d` (the 6 supplier contracts and the 30 counterparts cited in R03, R06 and R11).
- Cross-roadmap citations resolved on main: GraphConnectivityAndFlows §1.1 (anchor; `Graph.componentCount` at line 253), RepresentationTheory/CharacterTheory Layer 8 (line 1210), ClassifyingSpaces Stage 2 item 7 (line 158; dropped at #1807 and #1808, R06), AlgebraicTopology Layers 1 and 4. `citations.md` lists 0 unresolved cross-roadmap citations.
- Gate: FAIL (prnum 1, sorry-data 14, statement-hygiene 6; every other check 0). Depcheck output: `depcheck: 206 roadmaps, 1898 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 86 `sorry` warnings and no other diagnostic. I compared the elaborated signatures of the headline declarations against the README: no binder is lost (`rank_coprod`'s `[Nontrivial]` binders are unused but harmless).
- One-tactic probe on a scratch copy: 6 declarations tried with `simp`, `aesop`, `infer_instance` and `exact`; none closed. Padding (R07) is judged by category.
- Ownership against the open pull requests: no other roadmap owns free groups, Stallings graphs, Bass–Serre theory or limit groups. SurfaceTopology consumes §§2.2, 2.2a and 6.0a–6.0d by section; no other open pull request changes this roadmap.

## Not verifiable

- [TREES] Serre, *Trees*, Ch. I §5.2, Thm. 11 (§4.3): Springer paywall, no legal open copy found. FOLD Prop. 2.4 was checked instead.
- [CHISWELL] *Introduction to Λ-trees*, §2.4 (§9.3): World Scientific book, paywalled. Its content was checked only through KMS-ACTIONS Thm. 23 (line 1572).
- [INFINITE-WORDS] (§9.6, proofs of SUBGROUPS Props. 2–5): IJAC, paywalled; the statements were checked in SUBGROUPS lines 420–433.

## Source issues

- **Misprint** in KM02 at Proposition 4.3, p. 10: the source says the free group has finite basis H; it should be finite basis X; affects nothing.
- **Misprint** in KM02 at proof of Theorem 5.1, p. 11: the source calls the cosets Hf left cosets and writes the target vertex as fxH; it should be right cosets Hf and the vertex Hfx; affects nothing.
- **Misprint** in KM02 at Lemma 7.6, p. 17: the source defines the result as the core of Γ′ at u′; it should be the core of ∆′ at u′; affects nothing.
- **Error** in IFT at §2.7, Lemma 1, p. 8: the source says every strictly quadratic word is G-automorphic to a standard word; it should be a dichotomy that allows a coefficient-only outcome, since z⁻¹cz is conjugate only to the coefficient c; affects a stated result.
- **Error** in IFT at §2.7, remarks after Definition 6, p. 9: the source says regularity is equivalent to κ≥4 with a non-commutative solution, or [x,y]d=1; it should be that list plus [x₁,y₁][x₂,y₂]=1, which has κ=4 and only commutative solutions; affects a stated result.
- **Error** in IFT at §2.7, Theorem 2(3), p. 9: the source says the radical of c^z d is ncl([zb⁻¹,c]); it should be the normal closure of [zb⁻¹,h] for all h∈C_G(c); the stated form fails for c=a²; affects a stated result.
- **Error** in IFT at §5.1, ET2, p. 28: the source says the transferred base spans γ₁ to γ₂; it should be the base from γ₂ to γ₁, with orientation −ε(θ), when ε(μ)=−ε(Δ(μ)); affects a stated result.
- **Error** in IFT at §5.1, ET3, p. 28: the source says formal consistency gives β(μ)=β(Δ(μ)) for matched bases; it should be an added hypothesis, since Definition 10 constrains only α(μ); affects a stated result.
- **Error** in IFT at §5.1, Remark after ET3, p. 28: the source says Ω and Ω′ have the same solutions for ET1–ET3; it should be the equality of group solutions and of coordinate groups only, since graphical solutions differ for ET1 and ET3; affects a stated result.
