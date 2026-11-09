# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at e35529e)

**Verdict:** needs changes

This is a full review of `e35529e`. The previous review read the same head, so nothing in the folder changed. Three findings, two of them blocking:

- **R01** holds the stale-pin finding of the last rounds (re-raised).
- **R02** is new: the rank-two mass formula is statable with this file's own definitions, but it is neither stated nor named as not statable.
- **R03** is new: two docstring locators need a normalization step.

R02 and R03 are repairable inside the folder at the branch pins; the R02 statement below elaborates there.

## R01 (P2) — The branch pins a Tau Ceti that lacks 17 of the 27 cited Tau Ceti files

Re-raised: H01

**Location.** `lake-manifest.json` pins Tau Ceti `a91d3aa`. `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md` line 28 cites "`TauCeti.QuadraticMap.OrthogonalCompactOpens.integral` of a basis (in `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/Integral/CompactOpen.lean`)". Line 30 cites "`TauCeti.RootfulNiemeierType` …".

**Claim.** The README's Tau Ceti citations exist at the pinned Tau Ceti.

**Witness.** Of the 27 cited `TauCeti/…lean` files, `git cat-file -e` finds 10 at `a91d3aa` and all 27 at main's `2fd255d`. Absent at `a91d3aa`: `Integral/CompactOpen.lean`, `DoubleCoset/Basic.lean`, the five `Rank24/` files, `Weyl/TypeA/Basic.lean`.

**Detail.** Also absent at `a91d3aa`:
- `Weyl/CartanType.lean`, `Weyl/BaseChange.lean` and `GroupTheory/Coxeter/Restriction.lean` (§4.1);
- `NumberField/Units/Regulator/Basic.lean` (§1.4c; at `a91d3aa` the declaration sits in `Units/Regulator.lean` line 68).

About 30 backticked names exist only at `2fd255d`, for example `leechLattice`, `RootfulNiemeierType`, `finiteAdelicSpecialOrthogonalDoubleCoset` and `RootPairing.card_weylGroup_of_hasCartanType_A`.

**Why the repair report's reason does not settle it.** The report's H01 answer says the fix is a merge of `origin/main`, which only the worker can make. That correctly assigns the step, but the defect stands: at the pins this review must use, §§1.1, 4.1 and 4.2 consume declarations that do not exist.

**Repair.** Merge `origin/main` into the branch, which moves the pins to Tau Ceti `2fd255d` and Mathlib `1b1ccf4b`. No edit to `README.md` or `Suggested.lean` is requested for this finding: the four `TauCeti.*` modules that `Suggested.lean` imports exist at both pins. Rewriting the citations against `a91d3aa` is not an option, because that pin has no carrier for §1.1's proper double-coset set or for the rank-24 lattices.

## R02 (P2) — The rank-two mass formula is statable but neither stated nor named

**Location.**
- README line 263: "Positive rank two uses the independent binary ideal-class/norm-torus comparison of §1.4; the same numerical density expression then holds with R₂=1/π and the increasing-prime convention".
- README line 536 gives the same formula as §2.3's n = 2 case.
- `Suggested.lean` states `genusMass_eq` only under `3 ≤ n`. Its docstring bullet for 1.4 (lines 33–36) names only the order/character/genus comparison as not statable.

**Claim.** The positive-definite rank-two mass formula, the end result of §1.4 and the n = 2 case of §2.3, cannot be stated at the pins.

**Witness.** `genusMass` and `localDensity` suffice, and Conway–Sloane equation (2), p.263, holds for n ≥ 2. The statement below elaborates at the branch pins. For A₂ its partial product is 0.083337 at N = 2·10⁶, against 1/12.

**Detail.** §12, p.281, converts Conway–Sloane's p-masses into α_p. Three more genera converge to their full mass: rows R2b–R2d of the table.

**Repair.** Add the following to `Suggested.lean` after `genusMass_eq`. It was tested by `lake env lean` at `a91d3aa`/`6b7abb3c`:

```lean
/-- Siegel's mass formula in rank two (1.3, 1.4, 2.3; Conway–Sloane, equation (2),
p.263, and §12, p.281): for a positive definite integral Gram matrix `G` of rank two,
the partial products of `(2/π) · (det G)^(3/2) · ∏_{p ≤ N} (α_p(G)/2)⁻¹` over the
primes `p ≤ N` converge, as `N → ∞`, to the full mass of the genus of `G`. -/
theorem tendsto_genusMass_two (G : PositiveGram 2) :
    Filter.Tendsto (fun N : ℕ =>
      2 / Real.pi * (G.1.det : ℝ) ^ ((3 : ℝ) / 2) *
        ∏ p ∈ (Finset.range (N + 1)).filter Nat.Prime, (localDensity G.1 p / 2)⁻¹)
      Filter.atTop (nhds (genusMass G : ℝ)) := by
  sorry
```

Then:
- name `tendsto_genusMass_two` in the README at line 263 (§1.3) and line 536 (§2.3);
- add it to the module docstring's list of stated headlines;
- in the 1.4 bullet, say that only the lattice-to-order, character and genus comparison is not statable.

## R03 (P3) — Two docstring locators need a normalization step to match the statement

**Location.** `Suggested.lean`:
- lines 158–159: "(Belolipetsky–Gan, Theorem 3.1, p.4, with the dyadic correction `λ₂ = 1` of §5, Corollary 5.3, p.7; …)", cited for the full O-mass in `evenUnimodularMass_eq`;
- line 129: "(Conway–Sloane, equations (2), (3), (6))", cited for the density form in `genusMass_eq`.

**Claim.** These locators support the statements as written.

**Witness.** Belolipetsky–Gan's Mass(L) sums 1/#Γ_α with Γ_α ⊂ SO(V,q) (BelolipetskyGan lines 68, 84–92). Theorem 3.1 at d = 8 gives 2/696729600, twice `bernoulliFullMass 4`. Conway–Sloane (2) uses p-masses; α_p enters at §12, p.281.

**Detail.** The d = 8 value is 2·4320·ζ(2)ζ(4)²ζ(6)/(2π)¹⁶ with λ = 1. Conway–Sloane §12 gives m_p = p^(s(n+1)/2)/α_p.

**Repair.**
- Lines 158–159: write "(Belolipetsky–Gan, Theorem 3.1, p.4, with `λ₂ = 1` of §5, Corollary 5.3, p.7, gives twice this value as the proper mass; IntegralLattices §7A halves it; Conway–Sloane, §9(iv), p.274)".
- Line 129 and README line 261: write "(Conway–Sloane, equations (2), (3), (6), and §12, p.281)".

README lines 574–576 already make the factor-2 comparison, so they need no change.

## Previous findings

- **R01 of the previous review (pin): not repaired.** The head is unchanged. `lake-manifest.json` still pins `a91d3aafa8cd…`, and line 28 still cites `Integral/CompactOpen.lean` and `DoubleCoset/Basic.lean`, both absent there. Held as R01 above, re-raised against the repair report's H01.
- **Earlier remark: not acted on, deliberately.** The previous report's remark about `TauCeti.specialOrthogonalGroupVolume` (`Geometry/Euclidean/Volume/OrthogonalGroup.lean` line 426 at `2fd255d`) is not asked for here. The file does not exist at `a91d3aa`, so the edit belongs to the round after R01's merge.

## Verified sound

### Gate, dependency check, Lean

- **Worker's gate** (`gate.md`): `OK`, every counter 0, `build=0` included.
- **My rerun of the gate on `e35529e`:** `OK`, every counter 0, including `outside-folder=0`, `stray-files=0` and `depcheck=0`. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`; `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check with `--movable`:**

  ```text
  depcheck: 235 roadmaps, 2266 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or `moved:` line.
- **Supplier positions.** In the merge order: AdelicAlgebraicGroups 52, GeometryOfNumbersAndQuadraticArithmetic 55, ArithmeticStatisticsPartV 56, this roadmap 149. On main: IntegralLattices, ReductiveGroups, RootSystems, Rank24LatticeConstructions, CFSGBasicProperties, SporadicOrders, ReflectionInvariantTheory, TauberianBoundaryConvergence and ImaginaryQuadraticClassNumber; OrthogonalSpinGroups, GlobalNumberFields and AlgebraicCodingTheory under `Completed/`.
- **Elaboration.** `lake env lean` of `Suggested.lean` at the branch pins took 14 s and printed exactly six warnings, `declaration uses 'sorry'`, at lines 130, 160, 167, 171, 175 and 179.
- **Binder audit.** One probe file ran `#check @` on all 21 declarations. Each elaborated type matches its README statement. The file has no `variable` block, so no binder can drop; nothing changed.
- **Padding probe.** Each of the six theorems was replaced by `first | rfl | decide | norm_num | simp | infer_instance | positivity`. All six fail with unsolved goals, so there is no padding.

### Sources: the seeded sample

- **Conway–Sloane (`ConwaySloaneMass`).** Read this round by rendering the cached author-hosted scan with `gs`:
  - equation (2), p.263: the mass formula for n ≥ 2 in p-masses;
  - equation (3), p.263: the p-mass from a Jordan decomposition;
  - equation (6), p.266: the standard p-mass, matching §1.3's unramified β_p in both parities, with ε = ((−1)^s d / p). The same page says the leading 2 becomes 1 in dimensions 0 and 1, which matches §1.3's rank-one Check;
  - §9(iv), p.274: (2) at d = 1 yields the unimodular masses;
  - §12, p.281: α_p = N(p^r)/p^(rn(n−1)/2), which is `localDensity`, and m_p = p^(s(n+1)/2)/α_p.

  Hence 2m_p = p^(s(n+1)/2)/β_p, and (2) becomes `genusMass_eq`'s right side exactly.
- **Cho v3 (`Cho`).** The form convention ⟨x,y⟩_q = ½(q(x+y) − q(x) − q(y)) (line 94) gives q(x) = B(x,x), as §2.2 says. The cited locators:

  | Item | Line | Page |
  | --- | --- | --- |
  | Definition 2.1(c), zero lattice of type II | 117 | p.3 |
  | §2.3 | 208 | p.5 |
  | Remark 2.6 and the I^e₁/I^e₂ assignment | 240–256 | p.6 |
  | Remark 2.8 | 264 | p.6, with A_i at line 271 on p.7 |
  | Theorem 3.7 | 744 | p.15 |
  | §4.1 | 753 | p.16 |
  | Lemma 4.2 (α, β definitions) | 883–886 | p.18 |
  | Remark 4.3 | 889 | p.18 |
  | Theorem 4.12 | 1191 | p.24 |
  | Lemma 5.1 | 1223 | p.24 |
  | Theorem 5.2 (β_L = (1/[O:SO]) f^(N − dim O) #𝒢̃(κ)) | 1249 | p.25 |
  | Remark 5.3(i) | 1253 | p.25 |

- **Belolipetsky–Gan v2 (`BelolipetskyGan`).**
  - §2 begins at line 38 (p.2); the dimension-at-least-three assumption is at lines 68–70; the double-coset indexing at lines 71–80;
  - the mass as a quotient volume, lines 88–99 (p.3); γ_G, lines 113–120 (p.3);
  - Theorem 3.1, line 163 (p.4);
  - Corollary 5.3 (λ_L = 1 for even unimodular), line 288 (p.7); λ_Leven = 1 is restated at line 451 (p.11).
- **Chenevier–Lannes v2 (`ChenevierLannes`).** Corollaire 3.6, line 1589, printed p.41. Théorèmes 3.16–3.17, lines 1886–1893, printed p.48. Both are in Chapter II, since Chapter III starts on the next page.
- **Fomin–Reading v3 (`FominReading`).** Figure 2.8, lines 913–925, p.24: 2ⁿ⁻¹n!, 2⁷3⁴5 and 2¹⁰3⁴5·7.
- **Borcherds (`BorcherdsTables`).** The factors are |O(L)/W(R(L))|: Leech /8315553613086720000 (line 6), A₁²⁴ /244823040 (line 9), A₂¹² /190080 (line 11), D₄⁶ /2160 (line 19).
- **Milne (`MilneAG`).** §24i "The spin groups" starts at line 22080 (printed p.535). GSpin, the spinor norm and Spin as its kernel, and the two-fold simply connected cover are at lines 22102–22135 (p.536). §24j continues on p.537.
- **O'Meara 104:4–5.** Uncertified and settled; see Not verifiable.

### Library declarations opened at the branch pins

- **Tau Ceti `a91d3aa`:**
  - `IntegralLattice` (structure via `#print`: carrier, form, isLattice, isSymm, le_dual);
  - `IntegralLattice.Isometry` (a form isometry equivalence carrying carrier onto carrier);
  - `IsEven` (`Even (integralNorm x)`) and `IsUnimodular` (`carrier = dualCarrier`);
  - `ofGramMatrix`;
  - `IsPosDef.finite_isometry` (`PosDef/Finite.lean` line 140);
  - `ConstantForm.mem_definingPointsSubgroup_iff` (`ConstantForm/Basic.lean` line 445, points M with M·C·Mᵀ = C);
  - `SpecialOrthogonal.definingHopfIdeal` (`SpecialOrthogonal/Basic.lean` line 81);
  - `SpecialOrthogonal.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra` (`Reductive.lean` line 149);
  - `IsCentralIsogeny.baseChange` (`Isogeny/BaseChange.lean` line 84);
  - `isCentralIsogeny_baseChangeMap_iff` (`Isogeny/Descent.lean` line 80);
  - `semisimpleCommHopfAlgProperty` (`Semisimple/Basic.lean` line 70);
  - `simplyConnectedSemisimpleCommHopfAlgProperty` (`SimplyConnected/Basic.lean` line 67);
  - `Multiquadratic.fundamentalDiscriminantChar` (`Multiquadratic/Cyclotomic/QuadraticCharacter.lean` line 59).
- **Mathlib `6b7abb3c`:**
  - `sum_bernoulli` (`NumberTheory/Bernoulli.lean` line 223: Σ_(k<n) C(n,k)B_k = [n = 1]), `bernoulli_one` (line 204) and `bernoulliPowerSeries_mul_exp_sub_one` (line 268);
  - `riemannZeta_two_mul_nat` (`LSeries/HurwitzZetaValues.lean` line 206) and `riemannZeta_residue_one` (`LSeries/RiemannZeta.lean` line 241);
  - `Real.Gamma_one_half_eq` (`Gaussian/GaussianIntegral.lean` line 307) and `Real.Gamma_add_one` (`Gamma/Basic.lean` line 410);
  - `differentiable_LFunction` (`DirichletContinuation.lean` line 97), `LFunction_changeLevel` (line 149) and `LFunction_ne_zero_of_one_le_re` (`Nonvanishing.lean` line 397);
  - `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` (`DedekindZeta.lean` line 77);
  - `IsCompact.exists_isMinOn` (`Topology/Order/Compact.lean` line 228) and `exists_rat_btwn` (`Archimedean/Basic.lean` line 369);
  - `RootPairing.instFlipIsReduced` (`RootSystem/Reduced.lean` line 202);
  - `lipschitzGroup` and `spinGroup` (`CliffordAlgebra/SpinGroup.lean` lines 61 and 292).

### Cross-roadmap citations resolved

- **IntegralLattices, on main.** 2G, 3C, 3E, 3F, 3I, 4A, 4B, 4C, 4E, N0, N1, 5A, 6C, 6D, 6E, 6G, 7A, 7C, 7E, 7G, B1–B8 and 9B are headings, and 0A–0G and 2C are its Tau Ceti labels. Its owner table (lines 82–88) assigns 4D, 7B, 7D, 7F, 7H and 7I to this roadmap.
- **GeometryOfNumbersAndQuadraticArithmetic, at its head.** §2.2 `IntegralQuadraticLattice.ofCarrier` (line 512), 2.4.6 (line 620), §3.3.3 (line 1076), §3.3.4 (line 1089), `orthogonalTamagawa_two` (line 1124), `orthogonalMassGaugeScale` and `compactOrthogonalGaugeVolume` (lines 1141–1143), `orthogonalPinnedGaugeJacobian` (line 1145), `orthogonalIntegralRealGaugeCompatibility` (line 1147) and §3.3.7 `finiteOrthogonalOrder` (line 1211). Its line 42 assigns the arbitrary-genus formula to this roadmap.
- **AdelicAlgebraicGroups, at its head.** AA.1.3 has the squaring-map example (lines 1301–1304). AA.2.4 is at line 2011. AA.4.2 has strong approximation for semisimple simply connected groups through Res_(E/F) factors.
- **Other open heads.** ArithmeticStatisticsPartV, "Siegel count of indefinite binary quadratic forms" (line 575). EndoscopicTransferAndUnitaryTraceComparison §6.5 (line 2167).
- **On main.** OrthogonalSpinGroups 2B, 3A–3D and its consumer contract; ReductiveGroups Layers 0, 3, 5, 6, 7a and 8; RootSystems §3.2, §§5.1–5.3 and §6.1; ReflectionInvariantTheory §§3–4; Rank24LatticeConstructions Layers 3–6; CFSGBasicProperties P1 and P2-L; SporadicOrders O1; AlgebraicCodingTheory Layer 5; TauberianBoundaryConvergence N2–N3; ImaginaryQuadraticClassNumber H1.4 and H2.2; GlobalNumberFields Layers 9 and 11.

### Ownership and overlaps

- **Overlaps tool.** `overlaps.md` lists no pull request that changes this roadmap and no dropped id.
- **Search of all 458 open heads** (`roadmaps grep`) for mass-formula, class-count and D/E Weyl-order ownership found no second owner:
  - LatticePackingsAndPerfectForms (lines 152–156) defers masses, class numbers and automorphism orders here;
  - IntegralLattices and ThetaSeries disclaim them;
  - no roadmap states |W(Dₙ)|, |W(E₆)| or |W(E₇)| as a target. ReflectionInvariantTheory §4 lists degrees only as acceptance examples.
- **Name clashes.** `genusMass` is distinct from GeometryOfNumbersAndQuadraticArithmetic §3.3.3's by namespace.

### Adversarial table

All values were computed this round.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | 0.0 congruence Checks | G = diag(1,2), A = [[1,1],[0,1]] | AᵀGA = [[1,1],[1,3]]; diag(2,1) has det 2; units of ℤ square to 1 ≠ 2 | True | none |
| 2 | 0.0 order Checks | diag(1,2); empty | O: 4 sign matrices, SO: 2; empty: order 1 | True | none |
| 3 | 0.1 Checks | V = 0; x²+y²; x²+y²+z² | ±1 vs `spinGroup` = {1}; N((3+4i)/5) = 1; spinor norm 1·2 = 2, not a square | True | none |
| 4 | 0.1a orders | 𝔽₂, 𝔽₄; r = 0 | xy: 2 = 2(2−1); x²+xy+y²: 6 = 2(2+1); f = 4: 6 and 10; z²+xy: 6 = 2(2²−1); r = 0 split formula 0 vs 1 | True | none |
| 5 | 0.2 transpose Check | C = diag(1,4), M = [[0,1/2],[2,0]] | MCMᵀ = diag(1,4); MᵀCM = diag(16,1/4); M² = I, A = Mᵀ, AᵀCA = C; pinned points use M·C·Mᵀ = C | True | none |
| 6 | 0.3 factor hypothesis | split ranks 3 and 4; definite rank 3 | SL₂ noncompact at ∞; two SL₂ factors; compact Spin(ℝ) fails at S = {∞} | Consistent with AA.4.2 | none |
| 7 | 1.1 A₂ and −23 Checks | [[2,−1],[−1,2]]; [[4,1],[1,6]], [[2,1],[1,12]] | \|O\| = 12, \|SO\| = 6, m⁺ = 1/6 = 2·(1/12); proper classes 3 × 1/2 = 3/2, full 1/4 + 1/2 = 3/4 | True | none |
| 8 | 1.2 gauge sₙVₙ = BG γ_G | n = 3, 4, 5, 7 | (1/2)·8π² = 4π² = (2π)²; 16π⁴ = (2π)⁴; (1/4)·128π⁶/3 = 32π⁶/3 = (2π)⁶/3!; (1/8)·2048π¹²/45 = 256π¹²/45 = (2π)¹²/(3!5!) | True | none |
| 9 | 1.2 scaling and U reflection | tB; U at 2 | D^((n+1)/2) gains t^(n(n+1)/2), ∏β⁻¹ loses it; reflection in (1,1) is [[0,−1],[−1,0]], det −1 | True | none |
| 10 | 1.3 / 2.3 local densities (brute force) | ⟨1⟩, ⟨2⟩, U at 2; I₃ at 2, 3; A₂ at 2, 3; [[4,1],[1,6]] at 2 | 4, 8, 4; I₃: 6144/2⁹ = 49152/2¹² = 12, 48/27 = 1296/729 = 16/9; A₂: 12, 12; 4 | Match every Check | none |
| 11 | `genusMass_eq`, I₃ and E₈ | n = 3, 8 | I₃: (1/π²)(1/6)(π²/8) = 1/48; E₈: (135/(8π¹⁶))·2⁻⁸ζ(2)ζ(4)²ζ(6) = 1.43527704e−9 = 1/696729600 | True | none |
| 12 | `genusMass_eq` rank hypothesis | ⟨1⟩ | expression 2·(1/2) = 1, full mass 1/2; Conway–Sloane p.266: leading 2 becomes 1 in dimensions 0 and 1 | `3 ≤ n` needed (n = 2: R02) | none |
| 13 | 1.4 content and discriminant | A₂; diag(1,1); [[4,1],[1,6]]; 2B | g = 2, g_half = 1, Δ = −3 both ways; (1,0,1), Δ = −4; (2,1,3), Δ = −23; content 4, Δ = −23 | True | none |
| 14 | 1.4c unit and narrow Checks | D = −3 with f = 2; D = 5, 12 | h(−12) = 1·2·(3/2)/3 = 1; D = 5: h⁺R⁺ = 2R; D = 12: h⁺ = 2, R⁺ = R | True | none |
| 15 | 2.1 points Check | ⟨1⟩ over ℤ₂ | #𝒢̃(𝔽₂) = 2; naive x² = 1 over 𝔽₂ has 1 point | True | none |
| 16 | 2.2 Cho formula α₂ = f^(N − dim O)·#𝒢̃ | ⟨1⟩, ⟨2⟩, U, A₂, [[1,1],[1,2]] | 2¹·2 = 4; 2²·2 = 8; 2¹·2 = 4; 2¹·6 = 12; 2⁰·(2·4) = 8. Brute force gives 4, 8, 4, 12, and 8 = α₂(I₂) | True | none |
| 17 | 2.2 auxiliary lattices | ⟨1⟩⊕⟨2⟩, [[1,1],[1,2]], [[1,1],[1,0]], U | X₀ = B₀ = Y₀ = 2Re₁⊕Re₂, W₀ = L, Z₀ = 2L; e = e₂, dim B₀/Z₀ = 1 (I^e₁); 0 (I^e₂); zero set 3 vs radical 1 | True | none |
| 18 | `evenUnimodularMass_eq` | n = 8, 16 | M₈ = 1/696729600; M₁₆ = 691/277667181515243520000; BG Theorem 3.1 at d = 8 gives 2/696729600 (proper mass) | True; docstring R03 | R03 |
| 19 | `bernoulliFullMass` Checks | m = 0, 4 | 0 by division by zero; (1/240)(1/24)(1/240)(1/504) | True | none |
| 20 | 3.2 B₃₈ and recurrence | k = 1; B₃₈ | B₀ + 2B₁ = 0; B₃₈ = 2929993913841559/6; `sum_bernoulli` at n = k+1 | True | none |
| 21 | `rank16_classNumber` | two classes | 1/970864271032320000 + 1/685597979049984000 = M₁₆ exactly | True | none |
| 22 | 4.1 Weyl orders | D₄, D₅, D₆, E₆, E₇ | 192, 1920, 23040; 72·720 = 51840 = ∏dᵢ; 126·23040 = 2903040 = ∏dᵢ; wrong walls 138240, 6531840 | True | none |
| 23 | `rank24_classNumber` mass sum | 23 rows + Leech | Σ 1/(\|W(R)\|·factor) + 1/\|Co₀\| = 1027637932586061520960267/129477933340026851560636148613120000000 = M₂₄ exactly | True | none |
| 24 | 4.2 Checks | A₁²⁴; D/E rows | 2²⁴·244823040 = 4107449023856640, 3.067% of M₂₄; 15 rows with D or E | True | none |
| 25 | `rank32/40` bounds | M₃₂, M₄₀ | 2M₃₂ = 80618465.871; 2M₄₀ = 8.786·10⁵¹ | True | none |
| 26 | 4.3 rank zero | n = 0 | 2M ≤ h would read 2 ≤ 1 | Positive rank needed | none |
| R2a | Rank-two formula (R02) | A₂ | partial product 0.083514 (N = 10³), 0.083337 (2·10⁶); mass 1/12 | Converges | R02 |
| R2b | Rank-two formula | [[4,1],[1,6]]; I₂ | 0.750062 vs 3/4; 0.125007 vs 1/8 | Converges | R02 |
| R2c | Rank-two formula | [[2,1],[1,3]], Δ = −20 | α₂ = 8, α₅ = 20, \|O\| = 4; limit 0.250013 vs 1/4 | Converges | R02 |
| R2d | Rank-two formula, closed form | diag(1,3); diag(1,4) | α₂ = 4, α₃ = 12, giving 1/(2·2) = 1/4 = 1/\|O\|; α₂ = 32, giving 4/16 = 1/4 = 1/\|O\| | True | R02 |
| P | Pin (R01) | 27 cited files | 10 at `a91d3aa`, 27 at `2fd255d` | Defect | R01 |

### Headline inventory

- **Stated:** `genusMass_eq`, `evenUnimodularMass_eq`, `rank16_classNumber`, `rank24_classNumber`, and the rank-32 and rank-40 lower bounds.
- **Named as not statable**, each checked at both pins:
  - 0.1 (no Spin scheme for an arbitrary form);
  - 1.2–1.3 measure identities (no adelic orthogonal measure);
  - 0.1a;
  - 2.1–2.2;
  - 0.3 (no lattice genus or spinor-genus carrier in Tau Ceti at either pin);
  - 1.4's comparisons.
- **Statable but absent:** the rank-two mass formula (R02).

## Not verifiable

- O'Meara, *Introduction to Quadratic Forms*, 104:4–5 (§0.3): the manifest records it as uncertified and settled, so it is cited by its locator only.
- Elaboration at main's pins: this review's Lean commands use the branch pins. The names valid only at `2fd255d` were checked with `git cat-file` and `git grep` at that commit.

## Source issues

- none
