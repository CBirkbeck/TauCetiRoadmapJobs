# Review of IntegralLattices (pull request #1411 at 5d0d7c6)

**Verdict:** needs changes

This is a full review. The folder changed by 206 lines since `5bfdf39`; `Suggested.lean` changed only in its module docstring, where the 3D bullet was added. The pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`. `README.md` and `Suggested.lean` mean the files in `TauCetiRoadmap/IntegralLattices/`, and `TauCeti/…` paths are in the pinned Tau Ceti. There are three findings, all P3; none is P1 or P2.

## R01 (P3) — 3D: `𝔣_k` is defined only when `ord a_k + ord a_{k+1}` is odd, so the target cannot be evaluated on the README's own isometric pair

- **Location.**
  - `README.md:979–980`: "Here `𝔣_k` is O'Meara's ideal of the adjacent pair `L_k`, `L_{k+1}` (93:26); when `ord a_k + ord a_{k+1}` is odd it is `𝔣_k = 𝔰_k⁻² a_k a_{k+1} 𝒪`".
  - The same section: `README.md:961–963` and the *Needs* line at `983–985`.
  - `README.md:172–173`: "Every statement here is over `ℤ` or `ℤ_p`."
- **Claim.**
  - All three conditions of 93:28 are stated through `𝔣_k`. When `ord a_k + ord a_{k+1}` is even, the README gives no formula for `𝔣_k`, and that formula needs the quadratic defect, which the roadmap never defines. In that case the target is pinned only by a locator into a text the project cannot read.
  - The target is stated for the integers of every dyadic local field `F`. Of the inputs its *Needs* line names, the unimodular classification and the binary moves (`localIntegralForm_two_equivalent_iff`, `equivalent_toBilin'_…`) are proved over `ℤ₂` only.
  - Conditions (ii) and (iii) ask whether one quadratic space over `F` is represented by another. The native classification over a nonarchimedean local field with `2 ≠ 0` decides that, and neither the *Needs* line nor the 3D row of the Dependencies table names it.
  - Line 172 contradicts the generality of 3D.
  - The formula this repair needs is in Beli line 398–399, citing O'Meara 93:26: `𝔰_k²𝔣_k` is the sum of the quadratic defect of `a_k a_{k+1}`, of `a_{k+1}𝔴_k` and `a_k𝔴_{k+1}`, and of `2π^{(u_k+u_{k+1})/2+r_k}𝒪`.
- **Witness.** The Check `⟨1⟩ ⊕ ⟨4⟩ ≅ ⟨5⟩ ⊕ ⟨20⟩` (`README.md:1006`) has `ord a_1 + ord a_2 = 0 + 2`, which is even, so the README gives no `𝔣_1` for it. The native classification is `LocalField/QuadraticForm/Classification.lean:190`.
- **Repair.**
  - State the even-case formula for `𝔣_k` with that locator (Beli line 398–399, after O'Meara 93:26), and define the quadratic defect `d(α)` (O'Meara §63A) and the weight `𝔴_k` (O'Meara §93A) in one clause each.
  - Add the native local classification to 3D's *Needs*, to the 3D row of the Dependencies table, and to the consumer column of `README.md:512`.
  - Amend line 172–173, for example: "every target is over `ℤ` or `ℤ_p`, except 3D, which is over the integers of a dyadic local field".
  - Tested on the Check: `r_1 = 0`, `u_1 = 0` and `u_2 = 2`, so `𝔣_1 ⊇ 2·2^1·ℤ₂ = 4ℤ₂`. Condition (i) then asks for `1/5 ∈ (1 + 𝔣_1)(ℤ₂ˣ)²`, and it holds, since `1/5 ≡ 1 (mod 4)`. This is consistent with the isometry.

## R02 (P3) — 3D and its Tau Ceti row: the partial-sum determinant lemma is paraphrased with sums `L_1 ⊥ … ⊥ L_j`, which drops the constituent of index 0 that the native lemma and the Check use

- **Location.**
  - `README.md:955–958`: "when one of two consecutive constituents `L_j`, `L_{j+1}` is of type II, the Gram determinants of the partial sums `L_1 ⊥ … ⊥ L_j` of Jordan splittings of two isometric forms agree up to a square".
  - `README.md:473`, which uses the same wording.
  - The Check at `README.md:997–999`: "at `j = 0`, where the empty constituent of index 1 counts as type II, would need `1 ≡ 7 (mod 4)`".
- **Claim.**
  - In 3B's convention, which the native lemma follows, `L_i` is the `π^i`-modular constituent and `i ≥ 0`. In that convention the sum `L_1 ⊥ … ⊥ L_j` omits `L_0`. At `j = 0` it is empty, so both determinants are 1 and the Check's conclusion does not follow from the lemma as the README states it.
  - The O'Meara paragraph just below uses a third indexing: positional `L_(k)` over the nonempty constituents only.
- **Witness.** `TauCeti/LinearAlgebra/BilinearForm/JordanSplitting/Determinant.lean:89` takes the sum `⨆ i ∈ Set.Iic j, N i` over the indices `0, …, j`, and `N i` is `π ^ i`-modular (`JordanSplitting/Basic.lean:132`).
- **Repair.**
  - In both places, write: "the Gram determinants of the sums `L_0 ⊥ … ⊥ L_j` of the constituents of index at most `j`, indexed by scale exponent (empty constituents included, an empty constituent being of type II)".
  - Say in one clause that O'Meara's `L_(k)` counts nonempty constituents in order.
  - Tested on `⟨1⟩ ⊥ ⟨56⟩` against `⟨7⟩ ⊥ ⟨8⟩`. At `j = 0` the sums are `⟨1⟩` and `⟨7⟩`, and the index-1 constituent is empty. The lemma then needs `7 ∈ (ℤ₂ˣ)²(1 + 4ℤ₂)`, which is false because `7 ≡ 3 (mod 4)`. This is the Check's conclusion.

## R03 (P3) — The head still conflicts with main in both files, and no order with #617 is stated for this folder (previous R06, not repaired)

- **Location.** `git merge-tree --write-tree origin/main HEAD`, with merge base `eaf17b1`. The description's merge-order paragraph reads: "#617 and #1215 amend the same roadmap: whichever of the three merges first, the other two are rebased onto it".
- **Claim.**
  - Main (`3090489`) took `47fc6a3` (#1239) into this folder after the merge base, so the pull request cannot merge as it stands.
  - #617 also rewrites this folder and conflicts with this head. The order sentence speaks of ClassFieldTheory, "the same roadmap", not of `TauCetiRoadmap/IntegralLattices`.
  - No repair report marks the previous finding as not actionable.
- **Witness.** `git merge-tree` reports "CONFLICT (content): Merge conflict in TauCetiRoadmap/IntegralLattices/README.md", and the same for `Suggested.lean`. `roadmaps overlaps IntegralLattices` lists #617 and #1411 as conflicting in both files.
- **Repair.**
  - Rebase onto main, resolving toward this head.
  - Add one sentence to the description saying which of #617 and #1411 is rebased onto the other for `TauCetiRoadmap/IntegralLattices`.

## Previous findings (review of `5bfdf39`)

- **R01 — repaired.**
  - `README.md:961–981` now states 93:28 with its hypotheses: one quadratic space, the same fundamental type, and the three conditions on `L_(k)` and `K_(k)`.
  - `README.md:989–1003` carries the negative control `⟨1⟩ ⊥ ⟨56⟩` against `⟨7⟩ ⊥ ⟨8⟩`.
  - I recomputed the Check. `x² + 56y²` takes only the values `0, 1, 4` mod 8. Both Hasse symbols are 1. `𝔣_1 = 8ℤ₂`, and `1/7 ≢ 1 (mod 8)`.
  - The remaining gap, the even case of `𝔣_k`, is R01 here.
- **R02 — repaired.**
  - `README.md:2995–3015` states `m_p(L) = p^{v_p(det L)(n+1)/2}·α_p(L)⁻¹` at odd `p`, with the diagonal and cross factors.
  - I checked the exponent identity `E = (v(n+1) − ∑_{j<j'}(j'−j)n_jn_{j'})/2` algebraically, and the four Checks by brute force (table below).
  - The grammar slip is fixed: `README.md:3027` reads "The target of this milestone is".
- **R03 — repaired.**
  - N0 is stated on `L.norm` (`README.md:1833–1838`).
  - The native case is `β(v, v)` a unit, with `⟨1⟩` at 2 as the native instance (`1871–1875`, `1891–1893`).
  - `U` at 2 is among the cases proved here (`1897–1901`).
  - This matches `localStabilizer` on `orthogonalGroup (L.norm.baseChange ℚ_[p])` (`Localization/Stabilizer.lean:97`) and the hypothesis `‖Q v‖ = 1` (`Integral/SpinorNorm.lean:145–147`).
- **R04 — repaired.**
  - Mathlib rows have been added at `README.md:429–433`, and `SameGenus.exists_isometry` is in row 496.
  - The Orthogonal and Spin Groups row (`543`) now names 4B (0C) and 4C (Layers 1 and 2, 1D, 2F) only.
  - Every name resolves at the pin: `JacobiSymbol.lean:423`, `PrimesInAP.lean:443`, `Haar/Basic.lean:582`, `Order/Disjoint.lean:313`, `HaarToSphere.lean:52`, `VolumeOfBalls.lean:344`, `UnitaryGroup.lean:318, 338`, `Gamma/Basic.lean:402` and `FreeModule/PID.lean:530`.
- **R05 — repaired.**
  - The `LocallyCarries` Check is at `README.md:2053–2062`.
  - Layer 8 has `### Examples` and `### Dependencies` (`3252–3264`).
- **R06 — not repaired.** It is R03 here.
- **R07 — repaired.** The label 5H is at `README.md:36`, `135` and `3669`.

## Verified sound

**Gate, dependency check, build, signatures, probe.**
- **My gate run (`--base origin/main`).** Every scanner is 0, the build included, except `outside-folder=5`. All five files are in `TauCetiRoadmap/ClassFieldTheory/` and `TauCetiRoadmap/QuadraticFormInvariants/`, which are this pull request's own folders, so that is not a finding.
- **The worker's gate.** Every check passes.
- **The other changed file.** `Completed/LocalGaloisGroups/Suggested.lean` (4 lines) matches `outside_folder_allow` in the gate configuration. It is ClassFieldTheory's adaptation of a consumer and touches nothing here.
- **The three files beside README and `Suggested.lean`.** `PROGRESS.md`, `STATUS.md` and `metadata.toml` are allowed roadmap files.
- **Dependency check.** Output: `depcheck: 236 roadmaps, 2286 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
  - The roadmap is on main. Its suppliers are Global Quadratic Forms (6.3 at its README 723, 7.3 at 848), Orthogonal and Spin Groups (0C, 1D, 2C, 2F at 368, 508, 684, 717), Restricted Products (Layers 0–3 at 248–361) and Differential Geometry (12.1, 12.4 at 915, 923). All four are on main.
- **Build.** `lake env lean` on `Suggested.lean` exits 0 in 16 s, with 15 warnings, all "declaration uses `sorry`".
- **Signatures.** I put `#check @name` for all 36 declarations in one scratch copy and elaborated it once, with 0 errors. Each type matches the README:
  - 4B: `[L.IsNondegenerate]` on both theorems, and `[FiniteDimensional ℚ V]` on the proper one;
  - 5A and 6A: in any two ambient spaces;
  - 5B: the dyadic exception is a hypothesis of `padicDiscriminant_eq_squareClass_gramDet`;
  - 5G: `S.sigPos ≤ lp` and `S.sigNeg ≤ lm`;
  - 7E: the `C¹` charted structure, `LindelofSpace` and the immersion hypotheses.

  Nothing changed.
- **Padding probe.** In the same copy I replaced each `sorry` with `first | rfl | simp | infer_instance | decide | omega | aesop | trivial`. All 15 fail.

**Citations and names.**
- **`roadmaps resolve`.** Its 13 leads are all declarations of `Suggested.lean`.
- **Relative links.** All 11 resolve on main.
- **Further names at the pin, with file and line.**
  - The B-layer declarations: `Binary/NormForm.lean:43, 87, 173, 177`, `Orientation.lean:95`, `Order.lean:43, 106, 141`, `Examples.lean:294`, `NormOne.lean:72, 104`, `Isometry.lean:127` and `Determinant23.lean:268`.
  - The binary forms: `BinaryQuadraticForm/Ideal/PicEquivalence.lean:55`, `Narrow/Equivalence.lean:106`, `RingClassField.lean:83`, `FiniteClasses.lean:48` and `Split/Composition.lean:133`.
  - `Multiquadratic/Quadratic/AmbiguousClassNumber.lean:133`.
  - Masses and class numbers: `Mass.lean:100, 154` and `ProperClassNumber.lean:217`.
  - `BinaryDiagonal.lean:160` and `JordanSplitting/Determinant.lean:89`.
  - Local densities: `LocalDensity/Diagonal.lean:136, 163`. Their exponent `∑_j C(#{i : j < k_i} + 1, 2)` is the README's `E`.
  - `LocalField/QuadraticForm/Classification.lean:190` and `Representation.lean`.
- **OTM at its head.** §§0.3, 1.1–1.4, 2.1–2.3, 3.1, 4.1 and 4.2 exist (its README 185–634), as the scope table cites them.

**Sources.**
- **`beli2010`.**
  - §3, p. 13: the statement of 93:28 is at line 500. Its hypotheses (the same fundamental type and `FL ≅ FK`) and its conditions (i)–(iii) are those of `README.md:968–977`.
  - The equivalent form of the fundamental type (the same weights and `a_k ≅ b_k mod 𝔴_k`) is at line 498.
  - In the proof of Lemma 2.15, p. 10, line 400 gives `𝔰_k²𝔣_k = a_k a_{k+1}𝒪` in the odd case, as the README states.
- **`allcock-gal-mark2016`.**
  - Lemma 4.2 at line 552 (p. 12), Lemma 4.3 at 621 (p. 14) and Theorem 4.4 at 672 (p. 15).
  - Theorem 5.1 at 686 (p. 16), Lemma 5.2 at 760 (p. 17) and Lemma 6.1 at 808 (p. 19).
  - Theorem 6.2 at 849 and Theorem 6.3 at 864 (p. 20), and Corollary 6.4 at 917 (p. 21).
- **`voight2023`.** Definition 3.10 at line 230 (p. 5), Lemma 3.12 at 245 (p. 6) and Proposition 3.13 at 251.
- **`boya-sudarshan-tilma2003`.** Equations (6.1)–(6.5) at lines 643–669 (pp. 16–17), and (6.9) at 684.

**Seeded sample B1–B8.**
- **The mathematics.** I checked every statement against the computed values in the table.
  - B1 and B4 are native, with the declarations above.
  - B2's sign transport and oriented branch, B3's three steps and split branch, B5's reduction step and cycle theorem, and B6–B8 hold on every instance tried.
- **The locators.** None can be checked against a text: they are in Cox, Cohen, Cassels and Conway–Sloane 1988 (see *Not verifiable*).

**Ownership and overlaps.**
- **This roadmap's declarations.**
  - Tau Ceti contains none of the 15 theorem names, nor `LocallyCarries`, `IsPrimitiveEmbedding`, `padicDiscriminant` or `soEuclideanMeasure`.
  - The one Loogle "same-name hit", `primaryComponent`, is Mathlib's `AddCommGroup.primaryComponent`, which the abbreviation wraps.
- **Clashes with the Completed foundation.** `Completed/IntegralLattices/Suggested.lean` shares the namespace `TauCetiRoadmap.IntegralLattices`. It declares `IntegralLattice`, `FiniteBilinearModule` and `FiniteQuadraticModule` with their own lemmas, and none of their fully qualified names coincides with a declaration here.
- **The open roadmap pull requests.** The overlap tool finds no id cited here dropped by an open pull request, and none defined only by an open revision. #617 is R03, and #1187 is a Tau Ceti bump.
- **Two owners of the determinant `−1` element (no change here).**
  - GeometryOfNumbersAndQuadraticArithmetic (#851, its README 620, 2.4.6) states, over any discrete valuation ring, the element of determinant `−1` that N0 proves for `ℤ_p`.
  - OrthogonalTamagawaAndLatticeMass (#1222, its README 241) takes that element from 2.4.6.
  - IntegralLattices is on main, so under the ownership rule those open roadmaps are the ones to cite N0 or narrow their statements.

**Adversarial table.** Every value is exact or a brute-force count from my scripts: local densities modulo `3^r`, integral automorphisms of 2×2 Gram matrices with entries bounded by 8, reduced forms and `ρ`-steps, and the values of `x² + 56y²` modulo 8 and 64.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| B1 norm form, content, Δ (native) | `A₂`; `⟨2e₁,e₂⟩` and `⟨e₁+e₂,e₁−e₂⟩ ≤ ℤ²` | `2x²−2xy+2y²`, `c = 2`, `Δ = −3`, `disc N = −12 = −4·3`; `4x²+y²` content 1 and `2x²+2y²` content 2, both of index 2 | pass | none |
| B2 sign transport | `⟨−1⟩⊕⟨−1⟩ ↦ ⟨1⟩⊕⟨1⟩` | det 1/1, Δ −4/−4, content 1/1, `|O|` 8/8 by brute force | pass | none |
| B2 oriented map | Δ = 12: `(1,0,−3)`, `(−1,0,3)` | both have `𝔞_f = ℤ+√3ℤ`; the second goes to `√12·𝒪 ~ √3·𝒪`, `N(√3) = −3 < 0`, `N(2+√3) = +1` | pass | none |
| B3 steps 1–3 | Δ = −20, −36 | reduced forms `(1,0,5),(2,2,3)` and `(1,0,9),(2,2,5)`; tuples `(+,+),(−,−)` and `(+,+),(−,+)`; Kronecker characters `δχ₅` and `δ`; `[C:ker Φ] = 2 = 2^{μ−1}` | pass | none |
| B3 split branch | m = 5, 8 | `5xy+cy²` odd values mod 5: `{1,4},{1,4},{2,3},{2,3}`; `8xy+cy²`: `c` mod 8 for each `c`; torus quotients of order 2 and 1 | pass | none |
| B4 `|O|`, `|SO|` (native) | `A₂`, `I₂`, `!![4,1;1,6]`, `!![2,1;1,12]`, `!![3,1;1,4]`, `−I₂` | 12/6, 8/4, 2/2, 4/2, 2/2, 8/4 | pass | none |
| B5 reduction step | general `(a,b,c)`, `r = 2cs−b` | `(c, 2cs−b, a−bs+cs²)`, `4c(a−bs+cs²) = r²−Δ`, substitution of determinant 1 | pass | none |
| B5 cycle theorem | Δ = 12, 8, 5 | 12: `(1,2,−2)↔(−2,2,1)`, `(−1,2,2)↔(2,2,−1)`; 8: `(1,2,−1)↔(−1,2,1)`; 5: `(1,1,−1)↔(−1,1,1)`; `ρ(1,0,−3) = (−3,0,1)` | pass | none |
| B6 `T_L(ℤ)` | `x²+y²`, `x²−3y²`, `U` | `{±1,±i}` of order 4; `±(2+√3)^k`; `{±1}` | pass | none |
| B7 quotient volumes | Δ = −4, 12; `U` | `2π/4 = π/2`; `log(2+√3) ≈ 1.3170`; the modulus kernel `ℤ̂ˣ` has volume 1, the full quotient infinite volume | pass | none |
| B8 `m⁺ = h⁺/w` | `A₂`; genus of `!![4,1;1,6]` | `1/6`, `m = 1/12 = 1/|O(A₂)|`; `m⁺ = 3/2`, `m = 1/4+1/2 = 3/4`, against `h/(2w) = 1/2` | pass | none |
| 4B classes and proper classes (Lean) | `⟨1⟩`; genus of `!![4,1;1,6]`; `⟨1⟩⊕⟨1⟩` | one point each side; 2 and 3 points (h = 2, h⁺ = 3); one point, `K₅⁺ ≅ ℤ₅ˣ ≠ SO(V₅) ≅ ℚ₅ˣ` | pass | none |
| `LocallyCarries` | `ℤ²` and its 5-neighbour | `det σ = −1`, `det σ·diag(1,−1) = +1`, both carry `L` to `M`; the identity fails at 5 | pass | none |
| N0 improper element | `⟨1⟩` and `⟨4⟩` and `U` at 2; `⟨1⟩⊕⟨2⟩` at 3 | `L.norm(e) = 1`, a unit; 4 is not a unit, `s_e = −1`; `v = e+f` of norm 2, `s_v(e) = −f`; `e₁ − (2/3)(e₁+e₂) ∉ L₃` | pass | none |
| 4C rank 2 | `x²+y²`; genus of `!![4,1;1,6]` | `J/(ℚˣJ_L)` of order 2 against `[C:C²] = 1`; `ℤ₂₃ˣ/(ℤ₂₃ˣ)²` of order 2 `= 2·[C_L:C_L²] = 2·1` | pass | none |
| 3D target | `⟨1⟩⊥⟨56⟩` against `⟨7⟩⊥⟨8⟩` | `x²+56y² mod 8 ∈ {0,1,4}`, 7 not represented mod 64; `(1,56)₂ = (7,8)₂ = 1`; `𝔣₁ = 8ℤ₂`, `1/7 ≡ 7 (mod 8)` | pass | none |
| 3D target, even case | `⟨1⟩⊥⟨4⟩ ≅ ⟨5⟩⊥⟨20⟩` | `u₁+u₂ = 2`, so the README defines no `𝔣₁`; with Beli's formula `𝔣₁ ⊇ 4ℤ₂` and `1/5 ≡ 1 (mod 4)` | unstated | R01 |
| native partial-sum lemma | `⟨1⟩⊥⟨56⟩` against `⟨7⟩⊥⟨8⟩`, `j = 0` | native sums `⟨1⟩`, `⟨7⟩`: `7 ∉ (ℤ₂ˣ)²(1+4ℤ₂)`; the README's `L_1⊥…⊥L_0` is empty: `1` against `1` | misindexed | R02 |
| 7C odd-`p` dictionary | `⟨3⟩`, `⟨1⟩⊕⟨3⟩`, `⟨1⟩⊕⟨9⟩`, `⟨1⟩⊕⟨1⟩⊕⟨3⟩` at 3 | brute force `α₃` = 6 (r = 3,4,5), 12 (r = 3,4), 36 (r = 3,4), 16 (r = 3); `m₃` = 1/2, √3/4, 3/4, 9/16 on both sides | pass | none |
| 7C unramified (native) | `U`, `I₂` at 3 | brute force 4/3 and 8/3 = `2(1∓1/3)`, `ε = ((−1)^m det | 3)` = +, − | pass | none |
| 5A (Lean) | `E₈²`/`D₁₆⁺`; `I₈`/`E₈`; `⟨1⟩⊕⟨5⟩`/`!![2,1;1,3]` | `(16,0,0)` and `A = 0`; parity differs; `b` values `{1/5,4/5}` against `{2/5,3/5}` | pass | none |
| 5B `padicDiscriminant_…` (Lean) | `⟨2⟩`, `⟨10⟩` at 2 | dets 2 and 10, ratio 5, a nonsquare in ℚ₂; excluded by `HasCyclicTwoSummand` | pass | none |
| 5B `exists_evenLattice_iff` (Lean) | `(1,0,q₁⁽²⁾(2))`, `(1,0,q₁⁽³⁾(3))`, `(0,0,0)`, `(0,2,q₁⁽³⁾(3))` | all hold, `⟨2⟩`; `sign = 6 ≢ 1`, no lattice; all hold, the zero lattice; `−2 ≡ 6`, `A₂(−1)` | pass | none |
| 5B `exists_evenLattice_of_lt` (Lean) | `(0,2,q₁⁽³⁾(3))` | `l = 1 < 2`, `−2 ≡ 6`; `A₂(−1)` | pass | none |
| 5G `exists_primitiveEmbedding_iff` (Lean) | `⟨2⟩` in `U` | `e+f`; complement `⟨−2⟩`, `q = −1/4 = −q_S`; without `t ≤ l` the truncated `ℕ` difference breaks the statement | pass | none |
| 5G `forall_exists_…` (Lean) | `(5,0,8,0)`; `(1,10,3,19)` | `10 > 8`, `⟨2⟩⁵` has complement rank 3 `< l = 5`; for `⟨6⟩⊕⟨−6⟩¹⁰`, condition 3 `−6¹¹ = −6¹¹` and `−7 ≡ 1 = sign(−q)` | pass | none |
| 5J (Lean) | `(1;1,0,1)`; the four boundary tuples | `⟨2⟩`; each fails exactly clauses 4, 5, 6, 7 | pass | none |
| 6A even and odd (Lean) | `U⊕E₈⊕E₈(−1)`/`U⁹`; `U⊕⟨1⟩`/`I_{2,1}`; `U`/`⟨1⟩⊕⟨−1⟩` | `(9,0,9)`; `(2,0,1)`; the parities differ | pass | none |
| 6A odd step | `u = w'+((ε−a')/2)v`, `y = v−εu` | `u² = ε`, `B(y,u) = 1−ε² = 0`, `y² = −ε` | pass | none |
| 6D basis Check | `h` with the `D₁₅` chain; the `A₁₅` chain | minors 4, 8, …, 60, 1; `16·(4 − 15/16) = 49` | pass | none |
| 6E (Lean) | `D₁₆E₈`/`E₈³`; `A₁₇E₇`/`D₁₀E₇²` | 480+240 = 720 = 3·240; 306+126 = 180+252 = 432; `n+1 = 2n−2` only at `n = 3` | pass | none |
| 6E, Leech (Lean) | any row | `N_r ⊇ R_r` has a norm-2 vector; Leech minimum 4 | pass | none |
| 7E `soEuclideanMeasure_univ` (Lean) | n = 0, 1, 2, 3 | 1, 1, `2π`, `2π·4π = 8π²`; the Frobenius metric gives `2π√2` at n = 2 | pass | none |
| 7E `oEuclideanMeasure_eq_…` (Lean) | n = 0, 1, 2 | `dirac 1`; mass 2; `4π` | pass | none |
| 9B | the three Gram matrices of `!![2,1;1,12]` | `!![2,3;3,16]` from `(e₁, e₁+e₂)`; their sum is `3/4` and misses `!![4,1;1,6]` | pass | none |

## Not verifiable

- **Cox, *Primes of the form x² + ny²*.**
  - It is cited for B2 (Theorem 7.7, p. 137), B3 (§3.B, Theorem 3.15), B4 (Theorem 3.9, p. 50), and B5 and B7 (Theorems 2.8 and 2.13, pp. 27, 29).
  - This round, `sources fetch` answered "no legal source found". I ran it against a scratch copy of the manifest and left the manifest unedited.
- **Cohen, GTM 138, §§5.2 and 5.6** (B2, B5, B7): recorded as uncertified.
- **Cassels, *Rational Quadratic Forms*, chapter 13** (B4, B6), and **Cassels, *An Introduction to the Geometry of Numbers*, chapter VIII** (2F): not in the cache, and cited as uncertified.
- **Conway–Sloane 1988** (B8, 7A, 7C, including §12 for the new dictionary): waived. The diagonal-and-cross-factor form of `m_p` was checked only against the README's own formulas and the native densities.
- **O'Meara.** Every numbered locator, including 93:26, 93:28, 93:29, §63A, §93A, 92:5 and 81:14. It is a Springer book and not in the cache. 93:26 and 93:28 were checked only through Beli's restatement.
- **Not in the cache, so their numbering is unchecked:**
  - Nikulin 1979: 1.3.3, 1.8.1–1.8.2, 1.9.1, 1.9.4, 1.10.1–1.10.2, 1.11.2–1.11.3, 1.12.2–1.12.4, 1.15.1–1.15.2, 1.16.3, 3.6.2;
  - Serre V.1.4.3, V.2.2 and VII.6.6;
  - Milnor–Husemoller, SPLAG, Cho, Gan–Yu, Wall, van der Blij, Ebeling, Kitaoka and Kneser;
  - Kawauchi–Kojima, recorded as uncertified.

## Source issues

- **Misprint** in beli2010 at §3, statement of Theorem 93:28, p. 13 (line 502): the source quantifies over `1 ≤ i ≤ t − 1` while the three conditions are indexed by `k`; it should read `1 ≤ k ≤ t − 1`; affects nothing.
