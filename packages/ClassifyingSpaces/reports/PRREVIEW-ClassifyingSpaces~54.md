# Review of ClassifyingSpaces (pull request #1854 at 0905eb1)

**Verdict:** needs changes

This is a full review. The folder changed by 1246 lines since df0367f. The pins are unchanged: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`. Of r49's twelve findings, this head repairs ten and leaves two unrepaired (R09 and R10 below). It also has ten new findings: one P2 and nine P3.

## R01 (P2) — Layer 2 has a second owner: AlgebraicTopology Stage 8.8b at #1652 (and on main)

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 34–38: "The specialization of the algebraic-topology roadmap's normalised comparison map `c_G` to Milnor's model … (2.1); the agreement of the three (co)homology comparisons under it (2.2); and the agreement of the three resolution comparisons (2.3)." Layer 2 is at lines 397–537.

**Claim.** #1652 is an open revision of AlgebraicTopology by another author. Its Stage 8.8b assigns the same three objects to AlgebraicTopology, and so does AlgebraicTopology on main (README lines 93–101 and 1829–1846). This pull request moves them to ClassifyingSpaces in its own copy of AlgebraicTopology, so two open pull requests settle the ownership in opposite directions. The description names neither #1652 nor an order.

**Witness.** In `TauCetiRoadmap/AlgebraicTopology/README.md` at #1652:
- line 3647: "8.8b owns only its normalization" of `c_G : Bπ ≃ classifyingSpace π`;
- line 3670: the bar resolution "compared with `TauCeti.universalGSpaceResolution`";
- lines 3673–3678: Tau Ceti's identifications "are proved to agree with it", "transported along `c_G`".

StableHomotopyKTheory (#1227) README line 466 consumes this comparison as "AlgebraicTopology 8.8's pointed comparison".

**Repair.** Settle one owner. Either option leaves no cycle, because both models are pinned.
- **(a) Keep Layer 2 here.** Add #1652 to the description's merge-order paragraph and record that its 8.8b drops lines 3647–3651 and 3666–3680 in favour of a citation of ClassifyingSpaces 2.1–2.3.
- **(b) Delete Layer 2.** Cite AlgebraicTopology Stage 8 item 8b for `c_G^M`, the transported comparisons and the resolution comparison, and restore 8.8b's ownership in this pull request's AlgebraicTopology. 8.8b can consume Tau Ceti directly, as #1652 shows. Option (b) is the smaller change and matches main.

## R02 (P3) — The cohomology headline of 1.2 is narrower than the pinned comparison it transports

**Location.** `Suggested.lean` lines 77–85 and README lines 307–309 fix the values to `k`: "`TopCat.singularCohomology` and `groupCohomology (Rep.trivial k G k) n`".

**Witness.**
- The pinned `TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology k G M n` (`ClassifyingSpace/Cohomology.lean` line 89) takes any `k`-module `M`. 1.2's route (homotopy equivalence, homotopy invariance, pinned comparison) works for every `M`.
- My probe with `(M : Type u) [AddCommGroup M] [Module k M]` elaborates. Its Milnor instance closes by that pinned term.

**Repair.**
- Add `(M : Type u) [AddCommGroup M] [Module k M]` and state `Nonempty ((TopCat.of X).singularCohomology (ModuleCat.of k k) k (ModuleCat.of k M) n ≅ groupCohomology (Rep.trivial k G M) n)`.
- In the README, write "with values in a `k`-module `M`".
- The `ℤ/2` Checks remain, as the case `M = k`. I elaborated this form in scratch.

## R03 (P3) — 2.2's `ℤ²` Check credits the 2.2 comparison with another pinned isomorphism's degree-one formula

**Location.** README lines 486–487: "On Milnor's side the class of a loop representing `g` goes to the class of the `1`-chain `g` (`TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology`), which fixes the identity."

**Claim.** In 2.2, Milnor's side is `TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology` (`ClassifyingSpace/Homology.lean` line 69, built from Mathlib's `groupHomologyIso`). No pinned theorem relates it to `FirstHomology.lean`'s isomorphism, and in degree one the two differ by inversion.

**Witness.**
- The lift of `γ` runs from `⟨0, 1⟩` to `m(γ) • ⟨0, 1⟩`.
- Every equivariant, augmentation-preserving comparison sends it to `(1, m(γ))` up to a boundary.
- `Rep.diagonalSuccIsoFree` (`Mathlib/RepresentationTheory/Rep/Iso.lean` lines 46–49) sends that to `[m(γ)] = [κ_M(γ)⁻¹]`. `FirstHomology.lean` (line 189) gives `[κ_M(γ)]`.

**Repair.**
- Replace the sentence with: "Under `TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology` the class of a loop `γ` goes to the class of the `1`-chain `κ_M(γ)⁻¹`, the label at the end of its lift. `TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology` gives `κ_M(γ)`. For `ℤ`, the loop whose lift ends at `⟨0, 1⟩` gives `+1` and `−1` respectively."
- Recomputed on `G = ℤ`: `m = 1` and `κ_M = −1`.
- In the Example at line 528, name the "three isomorphisms `H₁ = ℤ`".

## R04 (P3) — 2.3 names the non-equivariant pinned map and rebuilds a complex Mathlib already has

**Location.**
- README lines 494–496: "the quotient of `Rep.standardComplex k G` by the subcomplex spanned by the tuples with two equal consecutive entries".
- Lines 503–504: "chain homotopic to the pinned `TauCeti.universalGSpaceToStandardComplex` followed by the quotient map".
- The same name at line 205.

**Witness.**
- `universalGSpaceToStandardComplex` (`ClassifyingSpace/StandardComplex.lean` line 133) lands in `Rep.standardComplex.forget₂ToModuleCat`, so it is only `k`-linear. The equivariant map is `TauCeti.universalGSpaceChainComplexToStandardComplex` (`StandardResolution.lean` line 94).
- `Rep.standardComplex` is an `alternatingFaceMapComplex` (Mathlib `Homological/Resolution.lean` line 168). Its normalisation is `normalizedMooreComplex`, with `homotopyEquivNormalizedMooreComplexAlternatingFaceMapComplex` (`DoldKan/HomotopyEquivalence.lean` line 81).

**Repair.**
- At lines 205 and 504, use `TauCeti.universalGSpaceChainComplexToStandardComplex`.
- Take the normalised standard complex to be `(AlgebraicTopology.normalizedMooreComplex (Rep k G)).obj (classifyingSpaceUniversalCover G ⋙ linearization k G)`. Alternatively use `SimplicialObject.Splitting.nondegComplex` (`DoldKan/SplitSimplicialObject.lean` line 164), whose terms are the nondegenerate simplices.
- Cite both under `From Mathlib`, and identify the quotient with them instead of introducing it as a new object.

## R05 (P3) — A malformed heading and a duplicated copy of the id-mapping list

**Location.** README line 100 is the heading "## Conventions`." (with a stray backtick). Lines 101–126 repeat, in another format, the mapping for Stage 1 item 6 through Stage 4 item 19 that lines 71–98 already give. The real `## Conventions` is at line 128.

**Witness.** `git diff df0367f HEAD` adds both "## Conventions`." and "## Conventions". The second copy differs only in format: plain bullets, and colons where the first copy has arrows.

**Repair.** Delete lines 100–127, so that line 128's heading follows the mapping directly.

## R06 (P3) — Layer 2 statements lack a locator or name their pinned input only loosely

**Location.**
- 2.1, third statement (lines 422–427: "a lift of a pointed map between the bases intertwines the deck transformations"): no locator.
- 2.3's identification of the lifted cellular chains with the normalised complex (lines 494–498): no locator.
- 2.2, line 455: "and its cohomological counterpart".

**Witness.**
- `hatcher-at` covers the lifts and deck transformations: line 2723 (Proposition 1.33, p. 61), line 2758 (1.34, p. 62) and line 3123 (1.39, p. 71).
- The counterpart is pinned as `IsQuotientCoveringMap.singularCohomologyMap_comp_singularCohomologyIsoGroupCohomology_hom` (`Cohomology/GroupCohomology.lean` line 357). The contracts do not list it.

**Repair.**
- Append "(Hatcher, Propositions 1.33, 1.34 and 1.39, pp. 61–71)" to 2.1's third statement.
- Give 2.3's chain-level identification a locator. Hatcher's Proposition A.19 (p. 537) gives only the cells.
- Name the cohomology lemma at line 455, in 2.2's *Needs:* line and under `## Exact supplier contracts`.

## R07 (P3) — Downstream consumers misstate what StableHomotopyKTheory and ArithmeticKTheory use

**Location.** README lines 549–550: "StableHomotopyKTheory and ArithmeticKTheory use the comparison of the nerve model with Milnor's model and the identification of its homology with group homology, 2.1 and 2.2."

**Witness.**
- ArithmeticKTheory (#1418), README lines 535–540, consumes "Stage 3, items 12–13" and "Stage 4, item 16". These are pinned uniqueness, cell lifting and lifted cellular chains, not 2.1 or 2.2.
- StableHomotopyKTheory (#1227), line 466, takes the nerve–Milnor comparison from AlgebraicTopology 8.8.

**Repair.**
- Write: "ArithmeticKTheory uses the pinned uniqueness, the CW structures along coverings and the lifted cellular resolutions (former Stage 3 items 12–13 and Stage 4 item 16)."
- State StableHomotopyKTheory's use according to R01's choice of owner.

## R08 (P3) — A heading anchor that main cites is dropped without a mapping the overlap check reads

**Location.** The former heading `## Stage 2: the cellular model` is gone. Lines 72–77 map "Stage 2 item 7" to "Stage 2 item 10" in a list that the overlap check does not read as a renumbering.

**Witness.** FreeGroupsAndLimitGroups on main (README line 29) links `../ClassifyingSpaces/README.md#stage-2-the-cellular-model`. The overlap facts at this head still list `#stage-2-the-cellular-model` as dropped.

**Repair.** Write the Stage 2 lines in a form the check reads. Either:
- use the sentence "Stage 2 (the cellular model), items 7 to 10, is now the pinned `TauCeti.PresentationComplex`, `TauCeti.killHomotopyGroups` and `TauCeti.cellularClassifyingSpace`"; or
- use a table whose header names the former numbering, one row per former id.

## R09 (P3) — Two other open pull requests change this folder, and the description gives no order for them (r49 R11, not repaired)

**Location.** The description's merge-order paragraph: "#1808 is independent of this pull request."

**Witness.**
- The overlap facts show that #1808 conflicts in this folder's `README.md` and `Suggested.lean`, and #1187 in `Suggested.lean`.
- #1807 and #1808 still own Proposition 1B.9 as ClassifyingSpaces Layer 1: their README line 531 and line 516 respectively.

**Repair.** In the description:
1. State the order against #1808 and #1187.
2. Say that this head supersedes #1807's and #1808's copies of this folder.
3. Say that those copies drop their 1B.9 layer.

## R10 (P3) — Two files outside the named folders are edited, and the gate fails (r49 R10, not repaired)

**Location.**
- `Completed/ArithmeticDirichletSeries/README.md`, line 331.
- `TauCetiRoadmap/SymplecticGeometry/README.md`, lines 76–78.

**Witness.** The worker's gate at 0905eb1 reads `outside-folder=2 … FAIL`. `git diff --stat origin/main...HEAD`, outside the 17 named folders, lists exactly these two files (4 insertions, 4 deletions).

**Repair.** Move both edits to a pull request of their own, or name both folders as this pull request's own.

## Previous findings (r49, at df0367f)

- **R01** (false rank Check in item 13): repaired by deletion. The only rank statement left, 2.3's `G = 1` Check, gives `ℤ^(ℕ)` in degree 0 (line 514).
- **R02** (Stages 1–4 planned what the pin proves): repaired.
  - Lines 42–52 consume the pinned directory by file.
  - Lines 64–99 map every former Stage/item id to its pinned file. The Stage 2 anchor is R08.
- **R03** (two owners of 1B.9 and `c_G`): repaired within this pull request.
  - Line 54 and lines 243–250 cite AlgebraicTopology 8.8b.
  - `Suggested.lean` lines 27–29: 1B.9 "is not restated either".
  - The new conflict is with #1652's AlgebraicTopology (R01).
- **R04** (local-coefficient headlines statable): repaired. `Suggested.lean` lines 93–115 state both.
- **R05** (one-term headlines): repaired. They are deleted, and the docstring at lines 20–26 names the pinned theorems.
- **R06** (base point and route): repaired. 1.1's route (lines 269–277) takes the pointed map from 8.8b, which reduces a base point inside a cell (AlgebraicTopology README lines 2531–2546).
- **R07** (Segal §2 → §3): repaired. Line 564 reads "Section 3, p. 107". `segal-1968` line 95 opens §3 on p. 107.
- **R08** (locators, Checks, shape): repaired.
  - Every target has a locator.
  - Every target and the Conventions have at least three Checks.
  - The house headings are present.
  - New shape defects: R05 and R06.
- **R09** (`Rep R G` vs `Rep ℤ G`): repaired. Line 460 reads "for `B : Rep ℤ G`", and Conventions lines 144–147 explain why.
- **R10** (outside-folder edits): not repaired; carried as R10.
- **R11** (open pull requests and the description): not repaired; carried as R09.
- **R12** (killing tower cited from 8.8c): repaired. Line 59 cites the pinned `TauCeti.killHomotopyGroups`, and lines 196–202 list the six declarations.

## Verified sound

**Gate.**
- The worker's gate at 0905eb1 has every content counter at 0, including `build=0`, except `outside-folder=2` (R10).
- My own run of `gate … ClassifyingSpaces --base origin/main` also has every content counter at 0. It reports `outside-folder=38` because it also counts the other 16 named folders. Outside them it finds only R10's two files.

**Dependency check**, verbatim: `depcheck: 236 roadmaps, 2264 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The suppliers, AlgebraicTopology and Tau Ceti, are on main or pinned.

**Elaboration.**
- `lake env lean …/Suggested.lean` exits 0 with exactly five `declaration uses sorry` warnings, at lines 59, 70, 80, 93 and 107.
- `#check @` on all five declarations matches `scratch/signatures.md` and the README:
  - 1.1 is cross-universe (`u_1`, `u_2`) and has both `T2Space`, both `CWComplex` and both `IsAspherical`;
  - 1.2 has `IsEilenbergMacLaneSpaceOne G X x`, with `k`, `G` and `X` in one universe;
  - 1.3 has `PathConnectedSpace X`, `IsAspherical X x`, `Ψ` and `A : Rep k G`.

  No binder is lost.
- One module had to be built first: `lake build TauCeti.AlgebraicTopology.SimplicialComplex.Realization.CWComplex.OrderedChainComplex`.

**Padding probe.** I replaced every `sorry` by `first | simp | rfl | infer_instance | aesop | exact ⟨Iso.refl _⟩`. All five fail. There is no padding. A headline is absent only for Layer 2, and the docstring (lines 31–36) correctly names κ_bar (AlgebraicTopology 8.8a) as the missing carrier.

**Pinned declarations.** One scratch file `#check`s all 73 dotted declaration names the README cites, plus `classifyingSpaceUniversalCover`. It exits 0. I also resolved the 20 file names by `ls` at the pin. Opened and read at the pin (Tau Ceti `TauCeti/AlgebraicTopology/` unless noted):
- `ClassifyingSpace/`:
  - `Basic.lean` 86;
  - `EilenbergMacLane.lean` 67, 77 and 104;
  - `Homology.lean` 69;
  - `Cohomology.lean` 89 and 149;
  - `LocalCoefficients.lean` 126, 136 and 150;
  - `FirstHomology.lean` 167 and 189;
  - `Comparison.lean` 211, 220 and 230;
  - `Cellular.lean` 125 and 133;
  - `PresentationComplex.lean` 254 and 329;
  - `Uniqueness.lean` 73, 94 and 109;
  - `StandardComplex.lean` 133;
  - `StandardResolution.lean` 94 and 201;
  - `Action.lean` 16 and 85.
- `EilenbergMacLane/Basic.lean` 59 and 123; `EilenbergMacLane/WeakHomotopyEquivalence.lean` 49.
- `Homotopy/Whitehead.lean` 243 and 263.
- `Singular/ModuleChains/GroupHomology.lean` 242 and 324.
- `Singular/ModuleChains/Resolution.lean` 73 and 257.
- `Cohomology/GroupCohomology.lean` 248 and 357.
- `LocalCoefficient/Representation.lean` 80, 111 and 122.
- Mathlib:
  - `RepresentationTheory/Rep/Iso.lean` 46–49;
  - `RepresentationTheory/Homological/GroupHomology/Basic.lean` 181 and 254;
  - `RepresentationTheory/Homological/Resolution.lean` 168;
  - `AlgebraicTopology/DoldKan/HomotopyEquivalence.lean` 81.

**Cross-roadmap citations.**
- `roadmaps resolve` reports none unresolved.
- AlgebraicTopology at this head:
  - lines 94–115 (ownership);
  - lines 2465–2575 (8.8a; 8.8b with `c_G`, the classification and the local-coefficient identification over `ℤ`, "for every `A : Rep ℤ π`");
  - Stage 4 item 7 (line 1102: one cell per nondegenerate simplex);
  - `Suggested.lean` 609–650 (`exists_mapOfEq_eq_of_isAspherical_cwComplex`, cross-universe, `PathConnectedSpace X`).
- FreeGroupsAndLimitGroups (main lines 29, 40, 2413, 2554 and 2771) is covered by the mapping, except for the anchor (R08).
- ArithmeticLocallySymmetricSpaces (#871) and TangentialBordism (#942) cite former Stage 3/4 ids, which the mapping covers.

**Overlap facts**, each checked:
- #1187, #1807 and #1808 change this folder (R09).
- No id cited here is dropped by an open pull request.
- No id cited here is defined only by an open revision.
- This pull request drops `#stage-2-the-cellular-model` (R08).
- Closest in vocabulary: #1807, #1808 and #1797 (AlgebraicTopology) agree with this pull request's ownership. #1652 does not (R01). #1227 (StableHomotopyKTheory) cites AlgebraicTopology 8.8 (R01, R07).

**Ownership.** `namespace TauCetiRoadmap.ClassifyingSpaces` occurs only in copies of this folder. No fully qualified name is shared.
- Layer 1 (pointed uniqueness; the comparisons for every CW `K(G, 1)`) has no other owner. This pull request's AlgebraicTopology (lines 102–106) and #1652 (line 133) both leave it to ClassifyingSpaces or Tau Ceti.
- Layer 2 is R01.

**Seeded sample** (the theorem number, the page, the hypotheses, and whether the source supports the statement).
- **1.1.** `hatcher-at` line 3897 (Theorem 1B.8, p. 90) and lines 3905–3911 (Proposition 1B.9 and the deduction by pointed maps inducing inverse isomorphisms).
  - This supports a pointed equivalence realizing `e` for CW complexes.
  - The arbitrary base point comes from 8.8b's reduction, not from Hatcher's proof (Source issues).
- **1.2.** `hatcher-at` line 6471 ("Homology of Groups", p. 148).
  - Hatcher defines `Hₙ(G)` as `Hₙ(K(G, 1))`.
  - The algebraic identification rests on Brown §II.4, which is settled as uncertified.
  - The pair of citations supports the statement.
- **1.3.** `hatcher-at` lines 14499–14519 (Proposition 3H.4, p. 331): for a path-connected space with a universal cover, local-coefficient homology is `C(X̃) ⊗_π G`. With the contractible `X̃` of an aspherical CW complex this gives 1.3. The cohomology half relies on Brown §III.1 (uncertified).
- **2.1.** Proposition 1B.9, p. 90 (lines 3905–3907), for the two uniqueness statements. The third statement has no locator (R06).
- **2.2.** Brown §III.1 (uncertified).
- **2.3.** Brown §I.7 (uncertified).
- **References.** `segal-1968` line 95 (§3 on p. 107) and lines 115–119 (Milnor's `(G*G*…)/G`; `BG` from it by collapsing degenerate simplices) support line 564.

**Adversarial table.**

| Statement | Instances tried | Values computed (README side / other side) | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: direction of `κ_M` | `S₃`, `s = (1 2)`, `t = (2 3)` | `m(ℓ_s ℓ_t) = ts = (1 3 2)`; `γ ↦ m(γ)⁻¹` gives `(ts)⁻¹ = st = (1 2 3) = κ(ℓ_s)κ(ℓ_t)`; `γ ↦ m(γ)` gives `ts ≠ st` | true; discriminating | none |
| Conventions: sign | `ℤ`; lift ends at `⟨0, 1⟩` | `m = 1`, `κ_M = −1`; pinned `_apply_eq_iff`: `g` ↔ end at `⟨0, g⁻¹⟩`, so `g = −1` | agrees with the pin | none |
| Conventions: `G = 1` | trivial group | the realization of the infinite simplex on `⟨i, 1⟩` is contractible | true | none |
| Cellular convention | `⟨S \| R⟩` | pinned `fundamentalGroupMulEquiv_mapOfEq_expLoop`: the loop of `s` goes to `PresentedGroup.of s` | agrees | none |
| 1.1 headline | point; `S¹` with 0-cells `±1`, `x = i`, `e = id`; `e = −1`; point vs Warsaw circle | identity; `z ↦ −iz` sends `i ↦ 1`, degree 1; `z ↦ conj(−iz)` sends `i ↦ 1`, degree −1; no equivalence point ≃ Warsaw | true; CW needed | none |
| 1.1 universes | `X : Type u`, `Y : Type v` | 8.8b `(u, v)`; Whitehead `(u_1, u_2)`; `isWeakHomotopyEquivalence_iff` `(u_1, u_2)`; pinned `exists_homotopyEquiv` is one-universe | route types across universes | none |
| 1.2 homology | `S¹`, `ℤ`; `ℝP^∞`, `ℤ/2`, `k = ℤ`, `𝔽₂`; `S²` | `H₁ = k`, `H₂ = 0` on both sides; `H₁ = ℤ/2`, `H₂ = 0`; `𝔽₂` in every degree; `H₂(S²) = k` vs `H₂(1) = 0` | true; hypothesis needed | none |
| 1.2 cohomology | `ℝP^∞`, `ℤ`; values `M` | `H¹ = 0`, `H² = ℤ/2` on both sides; the pin allows any `M`, the headline only `M = k` | true but narrow | R02 |
| 1.2 degenerate | `k` the zero ring; `n = 0`; `G = 1`, `X` a point | `0 = 0`; `k = k`; `k` in degree 0 on both sides | true | none |
| 1.3 homology | `S¹`, `A` = sign; constant `ℤ`; `A = k[G]`; `S² ∨ S¹` | `H₀ = ℤ/2`, `H₁ = 0` on both sides (constant: `ℤ`, `ℤ`); `k`, `0`; `H₂ = ℤ` vs `0` | true; asphericity needed | none |
| 1.3 cohomology | `S¹`, sign, `N = ℤ`; `k[G]`, `N = k`; point | `Hom(A, ℤ)` is the sign representation; `H⁰ = 0`, `H¹ = ℤ/2`; coinduced: `k`, `0`; `Homₖ(A, N)` on both sides | true | none |
| 1.3 route monodromy | `classifyingSpaceLocalSystem` at the base point | fibre `(A ⊗ k[G])_G ≅ A` via `[a ⊗ e_h] ↦ h⁻¹a`; transport `b ↦ m(γ)⁻¹ b = κ_M(γ) b` | `A ∘ κ_M`, a homomorphism | none |
| 2.1 (i) | cellular vs Milnor | `κ_bar∘π₁(c^M∘h) = κ_M∘π₁(h) = e∘κ_C = κ_bar∘π₁(c^C)`; both pointed (pinned `_toFun_basepoint`) | 8.8b uniqueness applies | none |
| 2.1 (ii) | `φ : G →* H` | both sides give `φ ∘ κ_M^G` (pinned `_mapOfEq`, naturality of `κ_bar`) | true | none |
| 2.1 (iii) | nerve labels | `f ≫ g = g * f` in `SingleObj` forces the label `g₁⁻¹g₀`; edge `g` lifts `(1) → (g⁻¹)`, so deck = `L_{κ_bar⁻¹}`; Milnor deck = `L_{κ_M⁻¹}` | equivariant | R06 (locator) |
| 2.1 Checks | `ℤ`; `S₃` | edge `−1` vs `1`; `ĉ(st·v) = (st)·ĉ(v)` vs `(ts)·ĉ(v)` | discriminating | none |
| 2.2 (i) | pinned naturality with `φ = id`, `f = ĉ` | `H(c) ≫ iso_bar = iso_M ≫ map id id = iso_M` | true | none |
| 2.2 `ℤ` Check | `G = ℤ`, `n = 1` | composite `+1`; with an inversion-normalized `c`: `−1` | true | none |
| 2.2 `ℤ²` Check, last sentence | loop with `κ_M(γ) = g` | `Homology.lean` iso: `[g⁻¹]`; `FirstHomology.lean`: `[g]` | misattributed | R03 |
| 2.2 (iii) sign, degree 1 | `B = ℤ`, `N = ℤ` | AlgebraicTopology `ψ(g) = φ(g⁻¹)` inverts; Milnor's resolution iso also inverts (dual of `[m(γ)]`) | composite `+1`, consistent | none |
| 2.3 Checks | `G = 1`, degrees 0 and 1; `(g, g)` | `ℤ^(ℕ)` vs `ℤ`; normalised degree 1 = 0; degenerate class 0 under the pinned map ∘ quotient | true | R04 (names) |
| 2.3 cells | simplices of `EG` | nondegenerate ⇔ `gᵢ ≠ gᵢ₊₁` | true | none |

## Not verifiable

- Brown, *Cohomology of Groups* (1982), §§I.7, II.4 and III.1: settled as uncertified, so cited by locator only (1.2, 1.3, 2.2, 2.3).
- Milnor (1956): settled as uncertified. I read `segal-1968` lines 115–127 instead.
- tom Dieck, *Transformation Groups*, §II.1: settled as uncertified.
- Schwamberger–Vogt (2009), §2 (the Warsaw circle, 1.1's negative control): settled as uncertified.
- Ownership against open pull requests was checked against the sibling checkouts and `roadmaps grep`/`show`, not exhaustively against all 458 heads.

## Source issues

- **Gap** in hatcher-at at Proposition 1B.9, printed pp. 90–91: the statement allows any base point of the connected CW complex, but the proof treats only a base point that is a 0-cell; it should require a 0-cell base point or invoke the homotopy extension property of the base point; affects the proof.
