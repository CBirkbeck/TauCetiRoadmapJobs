# Review of LatticePackingsAndPerfectForms (pull request #1723 at 75708d3)

**Verdict:** needs changes

This is a full review of a head the previous review also read (`changes.md`: 0 changed lines). The previous review's only finding, R01, is not repaired, and I raise it again here. At the README's declared Tau Ceti revision it now carries a third duplicate: 0.2's positivity statement. There are two new P3 findings: a scope line credits GoN with a citation it does not make, and one worked-example LMFDB label contradicts its own row.

## R01 (P2) — The branch pins Tau Ceti `358314d4`; the README declares `2fd255d9`. At the declared revision one statable headline is missing and two targets restate Tau Ceti

Re-raised: R01 of the previous review, itself H01/H02 of the earlier repair reports (answered "not actionable inside the roadmap folder").

**Location.**
- `lake-manifest.json` (unchanged by the pull request): Tau Ceti `358314d4`, Mathlib `f6090c70`. `origin/main` pins `2fd255d9` and `1b1ccf4b`.
- `TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:285–288`: "The pins are Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`. Every Tau Ceti and Mathlib declaration … is cited as it is at those revisions."
- `TauCetiRoadmap/LatticePackingsAndPerfectForms/Suggested.lean:33–38`: "… exists at the Tau Ceti revision `2fd255d9…` that README.md cites and is absent from the earlier revision this file is elaborated against."
- Also: `Suggested.lean:459–497` (`gramForm` and its 35-line positivity proof), `Suggested.lean:713–735` (`discriminantQuadraticHom`) and `README.md:440–447` (0.2).

**Claim.**
- The folder is written against two library revisions. Twenty-two library names the README cites are absent at the branch pin and present at `2fd255d9`. The module docstring describes the branch, not the mathematics, and becomes false at merge.
- At the declared revision three things are wrong:
  - the Leech covering radius `μ(Λ₂₄) = √2` is statable and is not stated;
  - 7.4's `O(L) →* O(q_L)` restates Tau Ceti's `discriminantOrthogonalHom`;
  - 0.2's claim that the real Gram matrix of a positive definite lattice is positive definite, in both directions, restates `TauCeti.IntegralLattice.isPosDef_iff_posDef_map_gramMatrix`. Previous reviews did not note this one.

**Witness.** At `2fd255d9`, Tau Ceti has:
- `leechLattice` (`Rank24/Leech/Basic.lean:236`) and `isPosDef_leechLattice` (`:299`);
- `Isometry.discriminantOrthogonalHom` (`Discriminant/OrthogonalGroup.lean:249`);
- `isPosDef_iff_posDef_map_gramMatrix` (`PosDef/Gram.lean:105`): `L.IsPosDef ↔ ((L.gramMatrix b).map Int.cast).PosDef` over ℝ.

None of the three files exists at `358314d4`.

**Why the settled reason fails.** The reason holds for a repair confined to the folder's two files. This finding is addressed to the pull request, whose owner can merge `origin/main`. `git merge-tree --write-tree origin/main HEAD` is clean. After the merge the diff against main is still only the folder, because the manifest is then main's.

**Repair.**
1. Merge `origin/main` into the branch. README 285–288 then become true as written.
2. State the Leech covering radius. In `Suggested.lean`, add `import TauCeti.LinearAlgebra.IntegralLattice.Rank24.Leech.Basic` and, after `kissingNumber_eq_kissingNumber`:
   ```lean
   /-- **3.4.** The Leech lattice has covering radius `√2` in the real model of the Gram matrix of
   any `ℤ`-basis (Conway–Parker–Sloane; Conway–Sloane, Ch. 23). -/
   theorem coveringRadius_gramForm_leechLattice (b : Basis (Fin 24) ℤ TauCeti.leechLattice) :
       (gramForm TauCeti.isPosDef_leechLattice b).coveringRadius = Real.sqrt 2 := sorry
   ```
   Delete the docstring text from "The Leech covering radius" to "indexed by `Fin 24`.", and list the theorem in README 3.4 under "API and acceptance statements".
3. Use Tau Ceti's `O(L) →* O(q_L)`. Add `import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.OrthogonalGroup` and delete `discriminantQuadraticHom`. Define the even branch of `fvIndex` as `(TauCeti.IntegralLattice.Isometry.discriminantOrthogonalHom L he).range.index`. Its codomain `FiniteQuadraticModule.orthogonalGroup` is the abbreviation of `QuadraticMap.orthogonalGroup A.quadratic` (`FiniteBilinearModule/OrthogonalGroup.lean:49–50`), the group 7.4 already names. In README 7.4, the 7.4 and 7.5 *Needs:* lines and the *From Tau Ceti* table, cite `discriminantOrthogonalHom` where they now say "as the homomorphism `discriminantQuadraticHom`".
4. Use Tau Ceti's positivity theorem in 0.2.
   - Add `import TauCeti.LinearAlgebra.IntegralLattice.PosDef.Gram`.
   - Replace the proof term of `gramForm` with `⟨(L.gramMatrix b).map (Int.cast : ℤ → ℝ), (L.isPosDef_iff_posDef_map_gramMatrix b).mp hL⟩`.
   - In README 0.2, replace "prove that `L.gramMatrix b`, cast to `ℝ`, is in `PosDefForm n`" and the parenthetical about the reverse direction of `isPosDef_ofGramMatrix_iff` with a citation of `TauCeti.IntegralLattice.isPosDef_iff_posDef_map_gramMatrix`, which gives both directions for any basis.
   - Add the name, with `TauCeti/LinearAlgebra/IntegralLattice/PosDef/Gram.lean`, to the 0.2 row of *From Tau Ceti* and to 0.2's *Needs:* line.

Steps 2–4 cannot be elaborated in this job: the only Lean commands it may run use this worktree's pins, where the three modules are missing. Steps 2 and 3 were elaborated at main's pins in an earlier round (exit 0, 53 `sorry` warnings). Step 4 I checked only by reading the statement and its typeclass context (`[Field K] [LinearOrder K] [StarRing K] [TrivialStar K] [StarOrderedRing K]`, which ℝ satisfies) at `2fd255d9`.

## R02 (P3) — The scope line credits GoN 5.1 with citing `hex-lll`; GoN does not

**Location.** `TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:172`: "LLL**: GoN. The LLL *algorithm* is `hex-lll`, cited by GoN 5.1."

**Claim.** The sentence attributes a citation to a supplier section that does not contain it.

**Witness.**
- GeometryOfNumbersAndQuadraticArithmetic at its open head (#851): Layer 5 (README 1945–2001) never names `hex-lll`, and line 2001 says the reduction algorithm "is not a target of this roadmap".
- The only roadmap that cites `hex-lll` is EffectiveDiophantineMethods §5.1 (#1046, README 454).

**Repair.** Delete the sentence "The LLL *algorithm* is `hex-lll`, cited by GoN 5.1." The clause before it ("LLL: GoN") already defers LLL-reduced bases to GoN, and the algorithm is a target of neither roadmap.

## R03 (P3) — The worked example labels `A₃` as `3.1.9.1.2`, a label whose determinant and level fields do not fit `A₃`

**Location.** `TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:2035`: "`A₃ = D₃` (`3.1.9.1.2`) | `3, 4, 2, 12, 48`".

**Claim.** README 181 says the label prefix is `dim.det.level.class_number`. Read that way, `3.1.9…` claims determinant 1 and level 9, but the same row gives determinant 4. The table's header says these labels "identify their intended records", so this acceptance criterion points at the wrong record.

**Witness.**
- `det A₃ = 4`.
- `8·A₃⁻¹ = [[6,4,2],[4,8,4],[2,4,6]]` is even, while `4·A₃⁻¹` has odd diagonal entries `3, 4, 3`, so the level is 8. The only rank-3 lattice of determinant 1 is `ℤ³`, which has level 2.
- Every other prefix fits its row: `1.2.4`, `2.1.2`, `2.3.3`, `3.1.2`, `3.128.8`, `4.4.2`, `8.1.1`, `24.1.1`, `2.3.6`.

**Repair.** Replace `3.1.9.1.2` with the label of the LMFDB record of `A₃`, whose prefix is `3.4.8`, or drop the label from that row. The record itself could not be opened from this worker; see *Not verifiable*.

## Previous findings

- **R01 — not repaired.** The head is unchanged (`changes.md`: 0 lines). The manifest still pins `358314d4`. README 285–288 and `Suggested.lean` 33–38 are as quoted above. Raised again as R01, with step 4 added.

## Verified sound

**Gate, build and order.**
- The brief's gate command, which uses the configured default merge order, reports one failure, `depcheck: NOT IN ORDER: LatticePackingsAndPerfectForms (insert it after its last supplier)`. Every other check is 0. This is a false positive: the default order does not list the roadmap, while the merge-order candidate lists it at line 148, after its last supplier.
- The same gate with `--order` set to the candidate, `--movable` and `--build` passes: every check 0, `build=0`, OK. The worker's gate (`gate.md`) agrees.
- The dependency check gives `depcheck: 233 roadmaps, 2259 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Candidate lines: GoN 55, PMNT 62, WeightsInEtaleCohomology 147, this roadmap 148.
- No file changes outside the folder: the diff stat over `':!TauCetiRoadmap/LatticePackingsAndPerfectForms'` is empty.

**Elaboration, signatures, padding.**
- `lake env lean` on `Suggested.lean` exits 0 with 52 messages, all `declaration uses sorry`.
- A scratch copy with `#check @name` for all 111 declarations elaborates cleanly. Each elaborated type equals its `signatures.md` entry after normalising whitespace (111 of 111).
- The one dropped-binder lead, `polynomialsOfDegreeLE`, declares its own `E` with `[NormedAddCommGroup E] [InnerProductSpace ℝ E]`. Its body, a span of powers `⟪a, ·⟫^k`, needs none of the dropped instances.
- One-tactic padding probe: each of the 52 `sorry`s was replaced with `first | rfl | (simp; done) | infer_instance | (norm_num; done) | trivial | (simp_all; done) | (exact le_rfl) | sorry`. All 52 declarations still warn, so none closes in one tactic.
- Form: no `set_option`, no `lemma`, one `import Mathlib` plus ten `TauCeti.*` modules, all present at the branch pin. `minimalVectorsFinset` uses the sorried `finite_minimalVectors` only as a proof argument, so no data is sorried.

**Library declarations opened.**
- I scanned the README's 234 backticked identifiers at both revisions. All library names resolve at `2fd255d9` / `1b1ccf4b`. Twenty-two are absent at `358314d4` (R01):
  - the nine Leech names;
  - the six `IsMinkowskiReduced` names;
  - `IsPosDef.minimum_le_mul_determinant_rpow`, `kissingNumber_typeE₈RootLattice` and `ofGramMatrix_singleton_eq_rankOne`;
  - the three `HeckeRing.GL2.Newform` bad-prime lemmas;
  - `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`.
- At `2fd255d9`:
  - `discriminantOrthogonalHom` (`:249`) is `(discriminantGroupHom L).codRestrict`, where `discriminantGroupHom : Isometry L L →* (A_L ≃ₗ[ℤ] A_L)` (`:76`).
  - `FiniteQuadraticModule.orthogonalGroup` (`OrthogonalGroup.lean:49`).
  - No group structure on `FiniteBilinearModule.Isometry D D` exists, so `bilinearIsometryGroup` and `discriminantHom` have no library counterpart at either pin.
  - No bundled `IntegralLattice` tensor product exists at either pin, so the docstring's "not statable" note for 7.1–7.3 holds.
  - No Leech covering-radius theorem exists, so 3.4 duplicates nothing.
- Mathlib `CartanMatrix.E 8` (`LinearAlgebra/Matrix/Cartan/Basic.lean:55`) is in Bourbaki order. Its inverse diagonal is `4, 8, 14, 30, 20, 12, 6, 2`, so 5.4's "inverse diagonal entries at 0 and 7 are 4 and 2" holds.
- Mathlib at both pins has only `DeloneSet` packing and covering bounds (`Analysis/AperiodicOrder/Delone/Basic.lean`). There is no Hermite constant, perfect form, design, Voronoi cell or sphere-packing density, so nothing here is duplicated.

**Cross-roadmap citations resolved** (main `4ee3e19` and open heads).
- IL on main: 0F, 1C, 1D, 1G, 2C, 4A (`:1507`), 6C (`:2054`), 6D (`:2076`), 9B (`:2657`). Completed IL Layers 3 and 5.
- TS on main: Layer 1 (`:423`), 2A (`:489`), 2D (`:515`), 2G (`:545`), Layer 5 (`:673`), 7C (`:879`), 7D (`:886`), 8B (`:949`), 8D (`:966`).
- SM on main: 0.1.2 `hermitian_gram_hadamard` (`:188`), 1.1 with junk value `sInf ∅ = 0` at indices `≥ d` for the natural-index minima, 1.5 `exists_successiveMin_witnesses` (`:488`), 2.1.4 `minkowski_second_lower` (`:658`).
- GoN at #851: §4.3 has all four names (`:1534–1550`), with the formula `(−i)^ℓ t^(−ℓ−n/2) P(ξ) exp(−π‖ξ‖²/t)`. 4.4.1 `latticePackingRadius` is at `:1718`, and 4.4.2 `latticeCoveringRadius` (`:1729`) is `[0,∞]`-valued through `Metric.infEDist`.
- PMNT at #1421: §4.9b (`:6420`) proves `mahler_relativelyCompact_iff` (`:6456`) for every n, with the first minimum taken in the max norm, as README 136–140 and 2.2 read it.
- WeightsInEtaleCohomology at #1001: §6.1 (`:695`), the Ramanujan bound.
- ModularForms §0.1 (`:353`, `M_k = S_k ⊕ E_k` at `:376`); GQF 4.4 (`:443`) and 6.1 (`:694`); Rank24LatticeConstructions Layer 6 (`:312`); RepresentationTheory/RootSystems exists.
- At open heads: EffectiveDiophantineMethods §1.8 (#1046, `:1344`); OrthogonalTamagawa Layer 4 (#1222, `:537`); QuaternionArithmetic Layer 2 (#1722, `:1031`); SiegelModularForms Layer 5 (#1714, `:1422`); HalfIntegralWeightModularForms Layer 2 (#1721, `:804`).
- `overlaps.md`: no open pull request changes this roadmap or drops an id it cites. SiegelModularForms (#1714, `:461`) consumes this roadmap's 5.6, which is unchanged.

**Ownership.** I searched main and all open roadmap heads for spherical designs, Venkov, the Hermite constant, perfect and eutactic forms, Kitaoka, Cohn–Elkies, Festi–Veniani, the 15 and 290 theorems, Voronoi cells, harmonic theta series, covering radius and kissing number.
- Only this roadmap owns the first group of objects. SiegelModularForms (`:138`) defers degree-one harmonic theta series and designs here.
- PointProcesses' Voronoi cells (#417, `:1723`) are those of point configurations, a different object.
- NumberFieldEnumeration (#1718, `:76`) only assumes a Hermite-type bound.
- Covering and packing radii of Euclidean lattices are GoN's and are cited from there.

**Seeded sample (15 targets).**
- 0.2: `gramMatrix`, `ofGramMatrix`, `isPosDef_ofGramMatrix_iff`, `Isometry.ofGramMatrixEq` and `IsPosDef` exist at both pins. At `2fd255d9` positivity is a Tau Ceti theorem (R01).
- 0.4: TS 2D and 2G resolve. At `2fd255d9`, `ZLattice.ncard_vectorsOfNorm_ratModel` (`ZLattice/ModelShell.lean:65`) is a Tau Ceti theorem; citing TS 2G for it remains correct.
- 1.1 and 1.5: no external locator. Definitions and values are in the table.
- 3.1 and 3.4: Conway–Sloane is not verifiable. The values were recomputed (table).
- 4.1, 4.2, 4.5: dsv2007 lines 60–62 (p.2) define perfection by unique solution, lines 65–68 eutaxy, line 69 extremality, and lines 70–71 state Voronoi's theorem.
- 4.10: dsv2007 lines 87–95 (Table 1, p.3) give 2, 3, 7, 33, 10916, maximised by D₄, D₅, E₆, E₇, E₈; line 107 is Theorem 1.1.
- 5.6: venkov2001 lines 8251–8259 (Theorem 16.1, printed p.59, page header at line 8177): Θ_{Λ,P} is modular of weight n/2 + deg P, and cuspidal when deg P > 0.
- 5.7: venkov2001 lines 8394–8400 (Theorem 16.4, p.61) state the design property for the minimal vectors. The proof (lines 8584–8592, p.62) gives every shell for deg P ≤ t, and the README cites "and its proof". Remark 16.5 is at line 8401 (p.61) and (16.6) at line 8552 (p.62).
- 4.4: venkov2001 lines 2427–2439 (Definition 6.1, p.20, and the irreducibility remark, p.21).
- 6.2: Bhargava is not verifiable. The values were recomputed (table).
- 7.1: coulangeonnebe2012 lines 79–83 (§2, p.2) define the tensor pairing. 7.2's lines 103–113 (Corollary 2.3 and Remark 2.4(1), p.3) also checked.
- 7.4: no external locator. The values were recomputed. festiveniani lines 109–120 (§2.1, p.3) and 401–403 (Theorem 2.8, p.9) support 7.5's split between the quadratic and bilinear cases.
- 4.11 (not sampled): ckmrv2017 line 531 (`f(0) = f̂(0) = 1`), line 553 (`f(r) ≤ 0` for `r ≥ 2`) and lines 638–639 support `exists_leech_auxiliary`.

**Adversarial pass.** Every value was computed this round, by hand or by a short script (`Fraction` arithmetic, brute-force enumeration).

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| 0.1 `actGL` order | U = [[1,1],[0,1]], V = Uᵀ | U then V: [[5,3],[3,2]]; reverse: [[2,3],[3,5]] | Pass |
| 0.2 `gramForm`, `gramForm_eq_actGL` | I₂ with shear; [0]; rank 0 | Uᵀ I U = [[1,1],[1,2]], det 1 = 1; [0] is not PD; the empty Gram matrix is PD | Pass; R01 step 4 |
| 0.4 shells | [1], t = −1, 0; [2], t = 2 | shells ∅, {0}, {±1} (sizes 0, 1, 2); `sphere 0 √(−1) = {0}`, so `t ≥ 0` is needed | Pass |
| 0.5 contragredient | I₂, U as above | `(U•A)⁻¹` = [[2,−1],[−1,1]] = `U⁻ᵀ•A⁻¹`; acting by U⁻¹ gives [[1,−1],[−1,2]] | Pass |
| 1.1 `min`, `minimalVectors` | diag(1,4); I₂; [1]; rank 0 | min 1, S = {±e₁}, kiss 2; kiss 4; sublevels C = −1, 0, 1 give ∅, {0}, {0,±1}; `sInf ∅ = 0` | Pass |
| 1.5 γ, δ, Δ, γ′ | diag(1,4); [4]; diag(1,1,4); A₂ | 1/2, 1/8, π/8 = 0.39270, (γ/4)¹ = 1/8; 1, 1/2; 0.62996 · 0.39685 → γ′ = 0.5; γ(A₂) = γ(A₂⁻¹) = 1.15470 | Pass |
| 1.7 `hermite_le_minkowski` | n = 1, 2, 3, 4, 8, 24; [4] | bound 1, 1.27324, 1.53934, 1.80063, 2.81814, 6.73398 ≥ γₙ = 1, 1.15470, 1.25992, 1.41421, 2, 4; [4]: 4 = 4 | Pass |
| 1.8 `hermite_le_pow` | same n; A₂ | bound 1, 1.15470, 1.33333, 1.53960, 2.73707, 27.33981 ≥ γₙ; A₂ attains equality | Pass |
| 1.9 coordinate bound | A₂ | (A⁻¹)₁₁ = 2/3, x₁² ≤ 2·2/3 = 4/3; ∏Aⱼⱼ/det = 4/3; C₂ = 4/π = 1.27324 ≥ 1 | Pass |
| 2.1 `hermiteConstant_pow_le` | n = 2, …, 8 | 1 ≤ 1; 1.25992 ≤ 1.33333; 2 ≤ 2; 3.48220 ≤ 4; 7.69200 ≤ 8; 19.50422 ≤ 21.33333; 64 ≤ 64 | Pass |
| 2.2 `exists_hermite_eq_hermiteConstant` | n = 1; n = 0 | [1] gives 1 = γ₁; at n = 0, `hermite = 0 ≠ 1 = hermiteConstant 0`, so `0 < n` is needed and present | Pass |
| 2.3, 4.10, 4.11 constants | A₂, A₃, D₄, D₅, E₆, E₇, E₈, Λ₂₄ | 4/3; 8/4 = 2; 16/4 = 4; 32/4 = 8; 64/3; 128/2 = 64; 256; Leech 4/1^{1/24} = 4 | Pass |
| 3.1 cell, relevance | [4]; I₂; A₂ | metric length 2 = √4; area 1; coset e₁ + 2ℤ²: only ±e₁ (relevant); (1,1) + 2ℤ²: four vectors of norm 2 (not relevant); coset of e₁−e₂ in A₂: ±(e₁−e₂) norm 2, ±(e₁+e₂) norm 6 | Pass |
| 3.2 μ, deep holes, Θ ≥ 1 | [4]; I₂; rank 0 | μ = ρ = 1; μ = 0.70711 > ρ = 0.5 with deep hole (½,½) a vertex; Θ = π/2; rank 0: μ = 0 and cell = {0} = its extreme points | Pass |
| 3.3 Jarník (index i − 1) | I₂; diag(1,4) | 0.5 ≤ 0.70711 ≤ 1 ≤ 1; 1 ≤ 1.11803 ≤ 1.5 ≤ 2 | Pass |
| 3.4 covering values | ℤⁿ, A₂, A₃, D₄, E₈, Λ₂₄; I₃; rank 1 | μ² = n/4, 2/3, 1, 1, 1, 2; Θ(A₂) = 1.20920, Θ(I₃) = 2.72070, Θ(Λ₂₄) = 2¹²π¹²/12! = 7.9035; rank 1: 2(√a/2)/√a = 1 | Pass; Leech statement R01 |
| 4.1 `IsPerfect` and its three theorems | I₂; A₂; D₄; E₈; rank 0 | span rank 2 of 3, 3 of 3; kiss 6 ≥ 6, 24 ≥ 20, 240 ≥ 72; rank 0: 0 = 0 | Pass |
| 4.2 eutaxy | I₂; A₂; [[2,1],[1,3]] | ∑xxᵀ = 2I, c = 1/2 = 2/(4·1); Q = [[4,−2],[−2,4]] = 6A⁻¹, c = 1/6 = 2/(6·2); (A⁻¹)₂₂ = 2/5 against 0 | Pass |
| 4.4 QA scalar | A₂, U = [[−1,−1],[0,1]] | UᵀAU = A; UQ = [[−2,−2],[−2,4]] ≠ QU = [[−4,−6],[2,6]]; QA = 6I | Pass |
| 4.5 `isExtreme_iff` | A₂; I₂; [[2,1],[1,3]]; ranks 0, 1 | T ↔ T∧T; F ↔ F∧T; F ↔ F∧F; rank 0: T ↔ T∧T; rank 1: γ ≡ 1, span 1 = 1, `[1/a] = c·(2[1])` with c = 1/(2a) | Pass |
| 4.6, 4.7 finiteness | ranks 1, 2 | perfect classes 1 ([1]) and 1 (A₂); I₂ is eutactic but not perfect | Pass |
| 4.9 `voronoiNeighbour` | A₂, N = [[0,−1],[−1,0]]; P = N = [1] | `P + tN` is PD for −1 < t < 3; min = 2 iff 0 ≤ t ≤ 2, so ρ = 2 and the neighbour is [[2,−1],[−1,2]], min 2; rank 1: set {0}, ρ = 0, neighbour [1] | Pass |
| 4.10 `perfectForms_complete` | rank 2, s = {A₂} | the neighbour [[2,−1],[−1,2]] = diag(1,−1)ᵀA₂diag(1,−1) is similar to A₂, so s is closed and meets the only class | Pass |
| 4.11 Cohn–Elkies | r = 2, f(0)/f̂(0) = 1; f ↦ 3f | δ ≤ 1; Leech δ = (√4/2)²⁴/√1 = 1; ratio 3/3 = 1 | Pass |
| 5.2 moments | {±1}; four unit vectors of I₂ | j = 0, 1: each side 2; I₂: j = 1 gives 2 = 4/2, j = 2 gives 2 against 1.5, so a 3-design and not a 5-design | Pass |
| 5.3 2-design ↔ strongly eutactic; 4-design ⇒ perfect | I₂; [[2,1],[1,3]]; A₃ (D₃ model) | I₂: both true (c = 1/2, moment 2 = 4·1/2); [[2,1],[1,3]]: both false; A₃ fourth moment 8 against 48/5 = 9.6 | Pass |
| 5.4 Gram Laplacian | diag(1,4); E₈ (Mathlib order) | X₀²−X₁²: 2 − 2/4 = 3/2; X₀²−4X₁²: 0; E₈: (A⁻¹)₀₀ = 4, (A⁻¹)₇₇ = 2; X₀²−X₇²: 4 and shell sum 60·4 − 60·2 = 120; X₀²−2X₇²: 0 and 240 − 240 = 0 | Pass |
| 5.5 Hecke–Bochner | τ = i, d = 1, 2; d = 0 | (i/i)^{−n/2} = 1; i^{−1} = −i, i^{−2} = −1; (τ/i)^{−d}(−i)^d = τ^{−d}; d = 0 recovers `(τ/i)^{−n/2}` | Pass |
| 5.6 `exists_cuspForm_harmonicTheta` | E₈, d odd; d even | Θ(−1/τ) = (−1)^d τ^{k+d} Θ(τ); d odd gives Θ ≡ 0, a cusp form; P = 2: coefficients 2 and 480 | Pass |
| 5.7 Venkov | n = 8, 16, 24 | t = 11 − 4r = 7, 3, 11; n = 24: S₁₄…S₂₂ have dimensions 0, 1, 1, 1, 1 < 2; dim S₂₄ = 2; n = 16, d = 4: dim S₁₂ = 1, not < 1 | Pass |
| 6.1 representation | ℤ³; ℤ⁴; A₂; 2I₄; [2] | ℤ³ misses 7, 15, 23, 28, 31, 39, 47, 55, 60, 63; 7 = 4+1+1+1; A₂ half-norms 1, 3, 4, 7 (2 missed); [2] half-norms are k² | Pass |
| 6.2 escalation | [1]; 2ℤ⁴ | truant 2; escalations `[[1,a],[a,2]]` with \|a\| ≤ 1 have det 2 or 1, giving Esc₁ = {diag(1,2), I₂}; 2ℤ⁴: min 4, truant 1, index 2 after adjoining e₁ | Pass |
| 6.3 15 theorem | ⟨1,2,5,5⟩; ⟨1,2,5,10⟩; ⟨1,1,2⟩ | misses below 2000: {15}; below 300: none; truant 14 | Pass |
| 6.4 290 theorem | 2I₄; [2]; list | all 29 represented; misses 2; README 1744–1745 and the Lean `Finset` both have 29 entries | Pass |
| 7.1 Kronecker Gram | A₂⊗A₂; A₂⊗D₄ | [[4,2,2,1],[2,4,1,2],[2,1,4,2],[1,2,2,4]], det 81 = 3²·3²; 3⁴·4² = 1296 | Pass |
| 7.2 `min_tensor_kitaoka` | A₂⊗A₂; [√2]⊗[3]; C = [1] for A = B = [2]; n = 0 | min 4 = 2·2 with 18 minimal vectors and #Aut 144 (enumerated); 3√2 = √2·3; hC rules out C = [1]; 0 = 0·min B | Pass |
| 7.3 determinant criterion | diag(1,1,2,3); diag(1,1,1,1,1,12); ℤ⁴ | 6 is not a square d₁²d₂²; the exponent of 3 in d₁³d₂² is never 1; det 1 decides nothing | Pass |
| 7.4 `O(D_L)`, composition order | [8]; [12]; 2I₃ with f = (12), g = (23) | u² ≡ 1 mod 8: {1,3,5,7}; mod 16: {1,7}; mod 24: {1,5,7,11}; (f·g)(e₁/2) = e₂/2, (g·f)(e₁/2) = e₃/2 | Pass |
| 7.5 `fvIndex_rankOne` | m = 3, …, 24 | formula = brute-force group order / 2 for every m: m = 5, 6, 8 give 1; m = 12, 15, 20, 21, 24 give 2 | Pass |
| Worked examples | bcc; [[2,1],[1,3]]; E₈⊕E₈ | Uᵀ(8A₃⁻¹)U is the displayed Gram, det U = −1, det 128, min 6; δ = 3√3/32, μ = √10/2, Θ = 5√5π/24; [[2,1],[1,3]]: #Aut 4 (±I, ±[[1,1],[0,−1]]); E₈⊕E₈: δ = 1/256, block-diagonal span, so not perfect | Pass |
| R01 | the 3 Tau Ceti files | present at `2fd255d9`, absent at `358314d4`; merge clean | R01 |
| R02 | GoN Layer 5 | no `hex-lll`; line 2001 excludes the algorithm | R02 |
| R03 | A₃ label | det 4 and level 8 against the label fields 1 and 9 | R03 |

## Not verifiable

- Conway–Sloane, *SPLAG*, Ch. 21 §3, Ch. 23, Ch. 25 (3.1, 3.4) and Gruber–Lekkerkerker, Ch. 2 §13 (3.3): paywalled, and no legal open copy was found. The values were recomputed instead.
- Ash 1977, §4, Corollary and Theorem 3, p.1052 (4.5, 4.7): the sources service found only the Cambridge Core landing page, which is in no licence class. Voronoi's theorem is corroborated by dsv2007 lines 70–71.
- Bhargava 2000, §2 p.28, §3 p.28, §6 p.31 (6.2, 6.3): the service found only the AMS e-book landing page (Contemp. Math. 272), and a web search found no author or institutional copy.
- The LMFDB record of `A₃` (R03): `lmfdb.org/Lattice` redirects to `beta.lmfdb.org`, whose pages render empty here. R03 rests on the README's own label scheme.
- R01 steps 2–4 cannot be elaborated at this worktree's pins. Steps 2 and 3 were elaborated at main's pins in an earlier round.

## Source issues

- **Misprint** in ckmrv2017 at Theorem 1.2, printed p.1018 (line 60): the source says the auxiliary Schwartz function maps ℝⁿ to ℝⁿ; it should map ℝⁿ to ℝ, since its hypotheses compare f(x) and f̂(y) with 0; affects nothing.
