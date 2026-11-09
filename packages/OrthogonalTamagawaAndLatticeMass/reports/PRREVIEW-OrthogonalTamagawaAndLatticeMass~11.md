# Review of OrthogonalTamagawaAndLatticeMass (pull request #1222 at 215caed)

**Verdict:** needs changes

This is an incremental re-review of the 58 lines changed since `9f4cf30`. Previous findings R01, R03 and R04 are repaired. The branch-pin finding (previous R02) is unchanged and is carried as R01. The repair adds two P3 findings.

## R01 (P2) — The branch pins a Tau Ceti that lacks the cited files, including the ones the new §1.1 adds

Carried from R02 of the previous review. No repair report marks it as not actionable.

**Location.** `lake-manifest.json` pins Tau Ceti `a91d3aa`. README line 28 (new) reads: "§1.1 uses the integral compact-open family `TauCeti.QuadraticMap.OrthogonalCompactOpens.integral` of a basis (in `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/Integral/CompactOpen.lean`)".

**Claim.** The README's Tau Ceti citations exist at the pinned Tau Ceti.

**Witness.**
- At `a91d3aa`, 18 of the 28 Tau Ceti files the README cites are absent, and so are 38 cited declarations.
- They include this head's three additions:
  - `OrthogonalGroup/Integral/CompactOpen.lean`;
  - `OrthogonalGroup/DoubleCoset/Basic.lean` (the pin has no `DoubleCoset/` directory);
  - `OrthogonalGroup/FullAdelic.lean`.
- All 28 files and all 38 names exist at main's pin `2fd255d`: for example `integral` at `Integral/CompactOpen.lean` line 71, `finiteAdelicSpecialOrthogonalDoubleCoset` at `DoubleCoset/Basic.lean` line 70, and `fullAdelicSpecialOrthogonal` at `FullAdelic.lean` line 78.

**Repair.** Merge `origin/main` into the branch. `README.md` and `Suggested.lean` need no edit.

Tested:
- `git merge-tree --write-tree HEAD origin/main` exits 0.
- The four Tau Ceti modules that `Suggested.lean` imports exist at both pins.
- This head changes `Suggested.lean` only in its module docstring.

Rewriting the citations against `a91d3aa` would not work: that pin has no carrier for §1.1's native proper double-coset set.

## R02 (P3) — §1.1's Belolipetsky–Gan locator leaves out the page with the double-coset indexing

**Location.** README line 221: "(Belolipetsky–Gan v2, §2, p.3, for the indexing of a genus by these double cosets and the mass as a quotient volume in the totally definite case)".

**Claim.** Page 3 holds the indexing of a genus by the double cosets.

**Witness.**
- The indexing by `G(F)\G(A_f)/K_L` and the lattice `L_α = V ∩ αL̂` are on printed p.2 (BelolipetskyGan lines 75–80). The p.3 header is at line 82.
- Page 3 has `Γ_α` and the two mass formulas (lines 83–99).
- The text before this repair read "§2, pp.2–3".

**Repair.** In line 221, replace "§2, p.3" with "§2, pp.2–3". Checked against BelolipetskyGan lines 64–99.

Belolipetsky–Gan assume dimension at least three (lines 68–70). Line 221's "No rank is excluded" rests on GeometryOfNumbersAndQuadraticArithmetic §3.3.4, not on this citation, so nothing else changes.

## R03 (P3) — The From Tau Ceti contract says §1.1 uses `fullAdelicSpecialOrthogonal`, but §1.1 does not

**Location.** README line 28: "and the full adelic group `TauCeti.QuadraticMap.OrthogonalCompactOpens.fullAdelicSpecialOrthogonal` with its unrestricted real factor (in `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/FullAdelic.lean`)", in the sentence that begins "§1.1 uses".

**Claim.** §1.1 consumes the native full adelic SO.

**Witness.**
- The name occurs only in line 28.
- §1.1's bijection is between finite-adelic double cosets (line 211).
- The quotient in its display carries AdelicAlgebraicGroups AA.2's measure (line 217).
- Its *Needs:* line (223) lists only `integral` and `finiteAdelicSpecialOrthogonalDoubleCoset` from Tau Ceti.

**Repair.** In line 28, delete ", and the full adelic group `TauCeti.QuadraticMap.OrthogonalCompactOpens.fullAdelicSpecialOrthogonal` with its unrestricted real factor (in `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/FullAdelic.lean`)". Use the other fix only if §1.1 is meant to compare the `SO(V)(𝔸)` of its display with the native full adelic group through §0.2:
- say so in line 217;
- add the name to the *Needs:* line, line 223.

After either fix, every Tau Ceti name in the contract sentence is named in §1.1.

## Previous findings

- R01 — repaired: line 209, "are GeometryOfNumbersAndQuadraticArithmetic §3.3.4, the proper mass identity, which includes K = ℚ. This section transports that identity at K = ℚ to the native lattice classes". The `Γ_i` construction and the general branch are deleted. Lines 9, 62 and 223 name §3.3.4.
- R02 — not repaired: `lake-manifest.json` still pins Tau Ceti `a91d3aafa8cd…`. Carried as R01, with the three files this head adds.
- R03 — repaired: line 275, "[1] and [9], although 9 is the square of the unit 3 of every ℤ_p with p ≠ 3, ℤ₂ included, and a square in ℚ: only p = 3 separates them".
- R04 — repaired: line 283, "`genusMass G` is the full mass of the genus of `nativeLattice G` in the sense of IntegralLattices §7A." The forward reference to §3.1 is gone, and §3.1 keeps the statement.

## Verified sound

### Gate, dependency check and Lean

- **Gate.** The worker's gate at `215caed` printed `OK`, with every counter 0 and `build=0`. My re-run on this head also printed `OK` with every counter 0; its line had no `build` field.
- **Folder contents.** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- **Dependency check** with `--movable`:

  ```text
  depcheck: 238 roadmaps, 2321 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or moved line. The open suppliers are all earlier in the merge order: AdelicAlgebraicGroups 52, GeometryOfNumbersAndQuadraticArithmetic 55, ArithmeticStatisticsPartV 56, EndoscopicTransferAndUnitaryTraceComparison 148. This roadmap is 149.
- **Elaboration.** `lake env lean` of `Suggested.lean` at the branch pins printed exactly six `declaration uses 'sorry'` warnings, at lines 130, 160, 167, 171, 175 and 179. Each is one line below its `9f4cf30` position, because the docstring gained a line.
- **Binder audit.** The diff touches only docstring lines 21–25, so the 21 declarations are unchanged. `signatures.md` shows no dropped binder, and the previous review's `#check @` audit stands.
- **Docstring claim:** "no Haar or Tamagawa measure is put on an adelic orthogonal group or its rational quotient".
  - At both pins, no file under `TauCeti/NumberTheory/QuadraticForm` or `TauCeti/Topology/Algebra/RestrictedProduct` mentions `Measure`.
  - At `2fd255d` the only measure-bearing file that mentions an orthogonal group is `TauCeti/Geometry/Euclidean/Volume/OrthogonalGroup.lean`, which concerns the real compact `O(n)`. That file is absent at `a91d3aa`.
  - "Section 1.1 … has no headline of its own" is accurate: its bijection is IntegralLattices §4B's target, and its display needs a measure.

### Tau Ceti declarations opened (main's pin `2fd255d`; absent at the branch pin, R01)

- `OrthogonalCompactOpens.integral` (`OrthogonalGroup/Integral/CompactOpen.lean` line 71). At each p it takes the isometries that are integral in the base-changed basis in both directions (`integralOrthogonalSubgroup`, `Integral/Basic.lean` line 52), which is K_p(L). It needs `Q.Nondegenerate`, which a positive-definite B gives.
- `OrthogonalCompactOpens.specialOrthogonal` (`CompactOpen.lean` line 133) is the comap to SO, which is K_p⁺(L).
- `finiteAdelicSpecialOrthogonalDoubleCoset` (`DoubleCoset/Basic.lean` line 70) is the quotient by the range of the rational diagonal on the left and by `integralSubgroup` on the right, as line 28 says.
- `fullAdelicSpecialOrthogonal` (`FullAdelic.lean` line 78) is `RestrictedProductGroupWithFactor` with an unrestricted real factor, as line 28 says.
- `IntegralLattice` (`TauCeti/LinearAlgebra/IntegralLattice/Basic.lean` line 63, identical at both pins) has a carrier `Submodule ℤ V` with `IsLattice ℚ`. That is the input GeometryOfNumbersAndQuadraticArithmetic 2.2.1 asks of `ofCarrier`.

### Cross-roadmap citations resolved this round

| Citation | Where | Result |
| --- | --- | --- |
| GeometryOfNumbersAndQuadraticArithmetic 2.2.1 `IntegralQuadraticLattice.ofCarrier` | head `3b084ef`, README line 511 | Present: a lattice over a Dedekind domain with q(L) ⊆ R. Integrality holds for q = B(x,x), not for Q = B/2 (line 230's Check). The resolver lead in `citations.md` is a supplier README name, not a missing one |
| the same, 2.3.1 (polar convention) | line 567 | It pairs an integral quadratic q with the native form polar(q); here polar(q) = 2B. Isometry groups, double cosets, stabilizers and masses are unchanged by the rescaling |
| the same, 2.4.6 | line 619 | DVR with fraction field of characteristic ≠ 2, positive rank, nondegenerate; the reflection in a least-valuation vector is integral with determinant −1. It agrees with lines 9, 62 and 241 |
| the same, §3.3.4 | line 1088 | Totally real field (ℚ included), G = SO(q), convergent vol(K_f), proper mass = quotient volume ratio, no rank excluded, numerator not replaced by 2. It agrees with lines 62, 209 and 217–221 |
| the same, `orthogonalMassGaugeScale`, `compactOrthogonalGaugeVolume` | lines 1140–1142 | The scale is 2^(−⌊n/2⌋) for odd n and 1 for even n, the gauge is the scale times the §7E measure, and the volume is 1/γ. It agrees with lines 62 and 235 |
| IntegralLattices §4B | main README line 1537 | Proper classes in gen L ≃ SO(V)(ℚ)\SO(V)(𝔸_f)/K_f⁺(L), used by line 215 |
| IntegralLattices owner table, 7B | main line 83 | Assigned to this roadmap's §1.1, as line 209 says |
| IntegralLattices §7C, index and unramified values | main lines 2410, 2418–2419 | "[K_p : K_p⁺] = 2 exactly when K_p contains a determinant −1 element", so line 241 is correct. The values and ε = ((−1)^m det \| p) are those of line 261 |

- **Ownership.** `roadmaps grep -i 'proper mass identity|finiteAdelicSpecialOrthogonalDoubleCoset'` over main and the 468 heads finds only GeometryOfNumbersAndQuadraticArithmetic (the owner) and this roadmap.
- **`overlaps.md`.**
  - No other pull request changes this roadmap, and no cited id is dropped.
  - Its 50 "only an open revision defines" IntegralLattices lines are false positives: §§4B, 7A, 7C and 7G are on main at the lines above.

### Sources: the seeded sample, where the diff touches it

- **1.1.** BelolipetskyGan lines 64–99 give the genus, its double-coset indexing (p.2), `Γ_α = G(F) ∩ αK_Lα⁻¹` as the stabilizer of `L_α` (line 84), and the mass as Σ1/#Γ_α and as ∫µ_L (p.3). This agrees with bullet 2 of §1.1; the page is R02.
- **1.2.** BelolipetskyGan lines 103–126 (p.3) give µ_cpt versus µ_sp and γ_G. My computation shows that s_n·V_n equals γ_G for n = 3 to 8 (table). The citation of GeometryOfNumbersAndQuadraticArithmetic 2.4.6 is resolved above.
- **1.3.** The unramified factors follow IntegralLattices §7C, and the brute-force counts are in the table.
- **Carried.** The other sample targets (0.0, 0.1, 0.2, 0.3, 1.4, 2.1, 2.2, 2.3, 3.1, 3.2, 4.1, 4.2) are untouched by the diff. The previous report verified them: Milne §24i, Cho Theorems 3.7, 4.12 and 5.2, Belolipetsky–Gan Theorem 3.1 and Corollary 5.3, Fomin–Reading Figure 2.8, Chenevier–Lannes Corollaire 3.6 and Théorèmes 3.16–3.17, and BorcherdsTables.

### Adversarial table

Rows 1–13 were computed this round; values were counted in exact rational arithmetic. Rows 14–17 are carried from the previous report (`9f4cf30`) for statements this head leaves untouched.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §1.1 Check, A₂ | B = [[2,−1],[−1,2]] | h(−3) = 1, with an improper automorphism, so 1 proper class. \|SO\| = 6, so m⁺ = 1/6; \|O\| = 12, so m = 1/12, and m⁺ = 2m. An O-stabilizer gives 1/12 | True | none |
| 2 | §1.1 Check, −23 genus | [[4,±1],[±1,6]], [[2,1],[1,12]] | proper classes 3 (h(−23) = 3), each with \|SO\| = 2, so m⁺ = 3/2; full classes 2, with \|O\| = 2 and 4, so m = 3/4; O-double cosets: 2 points | True | none |
| 3 | §1.1 stabilizer bullet | the class of [[2,1],[1,12]] | G(ℚ) ∩ gK_f⁺g⁻¹ = SO(M) = {±1}, weight 1/2. An O-stabilizer of order 4 would give 1/4 | True | none |
| 4 | §1.1 Check, I₃ rotation at 3 | k = [[3/5,−4/5],[4/5,3/5]] ⊕ 1 | det = 9/25 + 16/25 = 1, v₃(5) = 0, so k ∈ K_3⁺. γ = k forces γ_p = 1 at p ≠ 3, so γ = 1 ≠ k_3: the classes are distinct. Since k ∈ K_f⁺, the double cosets are equal | True | none |
| 5 | §1.1 Check, Q versus q | ℤ³ | Q(e₁) = 1/2 ∉ ℤ, q(e₁) = 1; polar(q) = 2B, and 2B has the same isometries as B | True | none |
| 6 | §1.1 rank 0 and rank 1 | the empty lattice, ⟨1⟩ | rank 0: m⁺ = m = 1. Rank 1: SO trivial, m⁺ = 1, m = 1/2 (IntegralLattices §7G), so m⁺ = 2m only in positive rank | True | none |
| 7 | §1.1 display against §1.3 | I₃ | \|SO(ℤ³)\| = 24, so m⁺ = 1/24 = 2·(1/48), and 1/48 is `genusMass` of I₃ (README line 289) | Consistent | none |
| 8 | §1.2, index 2 at p = 2 through 2.4.6 for q = B(x,x) | U, ⟨1⟩, [[2,1],[1,2]], A₂, [[4,1],[1,6]], [[2,1,0],[1,2,1],[0,1,4]], I₃, diag(2,6), [[4,2],[2,4]] | least-valuation v with q(v) = 2, 1, 14, 6, 26, 34, 9, 14, 28. Each reflection is 2-integral, MᵀBM = B, det = −1. For U: [[0,−1],[−1,0]], line 249's Check. Rank 0 has index 1 (excluded) | True | none |
| 9 | §1.2 gauge | n = 3 to 8 | s_nV_n = 39.4784 (4π²), 1558.545 (16π⁴), 10254.82 (32π⁶/3), 1.27185·10⁶, 5.25806·10⁶ and 1.36582·10⁹; Belolipetsky–Gan γ_G (lines 113–120) gives the same, ratio 1.000. V₃/π² = 8, V₄/π⁴ = 16 | True | none |
| 10 | §1.3 unramified β_p | ⟨1,1⟩ at 3 and 5; A₂ at 5 and 7; I₃ at 3 and 5; [[4,1],[1,6]] at 3 and 5; D₄ and I₄ at 3 | level-1 counts 8, 8, 12, 12, 48, 240, 4, 12, 1152 and 1152, so β = 4/3, 4/5, 6/5, 6/7, 8/9, 24/25, 2/3, 6/5, 64/81 and 64/81. The formula of line 261 gives the same in every case, ε included (ε = −1 for A₂ at 5) | True | none |
| 11 | §1.3 convergence for n ≥ 3 | n = 3; n = 4 | β_p = 1 − p⁻²; and (1 ∓ p⁻²)(1 − p⁻²). In both cases \|β_p⁻¹ − 1\| = O(p⁻²), so the product converges absolutely | True | none |
| 12 | §1.3 `SameGenus` Check | [1] and [9] | x² ≡ 9 has a unit solution modulo p⁶ at p = 2 and modulo p³ at 5, 7, 11 and 13; none modulo 3⁶ | True | none |
| 13 | `Suggested.lean` docstring | both pins | no `Measure` under `NumberTheory/QuadraticForm` or `Topology/Algebra/RestrictedProduct` | True | none |
| 14 | `genusMass_eq` (carried) | I₃; diag(1,1,2); A₃; E₈; n = 1, 2 | 1/48 = 1/48; 1/16 = 1/16; α₂ = 192 is needed for 1/48; 1/696729600; n = 1 gives 1 against 1/2 | True; `3 ≤ n` needed | none |
| 15 | `evenUnimodularMass_eq` and `rank16_classNumber` (carried) | n = 8, 16; n = 0, 4 | M₈ = 1/696729600, M₁₆ = 691/277667181515243520000 = the sum of the two reciprocal orders; n = 0 gives 1 against 0, n = 4 gives 0 against 1/576 | True; hypotheses needed | none |
| 16 | `rank24_classNumber` and the rank-32/40 bounds (carried) | 23 rows + Leech; 2M₃₂, 2M₄₀ | the sum equals M₂₄ exactly; 80618465.87; 8.786·10⁵¹ | True | none |
| 17 | §§0.0–0.2, 1.4, 3.2, 4.1, 4.2 Checks (carried) | as in the previous report | as there: Weyl orders 192, 51840, 2903040 and 696729600; B₃₈; the walls A₅ and D₆; D₄⁶ factor 2160 | True | none |

### Headline inventory (unchanged since `9f4cf30`)

- **Stated:** `genusMass_eq`, `evenUnimodularMass_eq`, `rank16_classNumber`, `rank24_classNumber` and the rank-32 and rank-40 lower bounds.
- **Named as not statable:** the 0.1 Spin structure theorems, the 1.2–1.3 measure identities, 0.1a, Cho's model (2.1–2.2), 0.3 and 1.4.
- **Not repeated this round:** the previous review's padding probe of all six theorems, since the declarations are unchanged. It found no padding.

### Remark on untouched text (no change requested)

At main's pin, Tau Ceti has `TauCeti.specialOrthogonalGroupVolume` (`TauCeti/Geometry/Euclidean/Volume/OrthogonalGroup.lean` line 426). This is §1.2's Vₙ = ∏_(j=2..n) 2π^(j/2)/Γ(j/2), which §1.2 takes from IntegralLattices §7E. The same file has `two_mul_pi_rpow_mul_prod_Gamma_eq_two_pow_div_orthogonalGroupVolume` (line 516), the identity 2Rₙ = 2^(n+1)/vol(O(n)). Neither exists at `a91d3aa`. After the merge of R01, they can be named in the From Tau Ceti contract.

## Not verifiable

- **Conway–Sloane, *Low-dimensional lattices IV*, equations (2), (3) and (6).** These are cited in §§1.2–1.3. The cached copy is an image-only scan, and this worker has no OCR. The formulas were checked numerically instead (rows 9–11, 14–16).
- **O'Meara 104:4–5.** Uncertified and settled in the manifest.
- **Elaboration at main's pins.** The Lean commands of this review use the branch pins. The three new Tau Ceti names were checked by reading their source at `2fd255d`.

## Source issues

- none
