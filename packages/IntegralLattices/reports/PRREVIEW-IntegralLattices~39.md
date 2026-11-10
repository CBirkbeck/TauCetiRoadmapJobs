# Review of IntegralLattices (pull request #1411 at d6e2855)

**Verdict:** needs changes

This is a full review. The folder changed by 157 lines since `5d0d7c6`. `Suggested.lean` changed only in one bullet of its module docstring; the rest of the change is in 3D, its supplier rows, the scope bullet and the Beli reference.

- **Pins.** Mathlib `1b1ccf4`, Tau Ceti `2fd255d`.
- **Paths.** `README.md` and `Suggested.lean` mean the files in `TauCetiRoadmap/IntegralLattices/`. `TauCeti/…` paths are in the pinned Tau Ceti.
- **Findings.** There is one finding, P3. Nothing is P1 or P2.
- **The mathematics.** Previous R01 and R02 are repaired. I found no new mathematical defect in the README or in `Suggested.lean`.
- **What remains.** The branch still cannot merge into main, and the obvious way of resolving the conflict would break the build.

## R01 (P3) — The head still conflicts with main in both files of this folder, and no order with #617 is stated for it (previous R03, not repaired)

- **Location.**
  - `TauCetiRoadmap/IntegralLattices/README.md` and `TauCetiRoadmap/IntegralLattices/Suggested.lean`, as whole files.
  - The description's merge-order paragraph: "#617 and #1215 amend the same roadmap: whichever of the three merges first, the other two are rebased onto it".
- **Claim.**
  - **Main rewrote this folder after the branch point.** Main (`3090489`) took `47fc6a3` (#1239) into this folder after the merge base `eaf17b1`. That commit rewrote the README by 2760 lines and `Suggested.lean` by 1899 lines, so the pull request cannot merge as it stands.
  - **Main still holds the older forms of what this head consumes or restates.** Main's `Suggested.lean` declares:
    - `TwoElementaryAdmissible`, `TwoElementaryLatticeWithInvariants`, `exists_isEven_isUnimodular_isPosDef_iff`, `infinite_isometry_of_isIndefinite`, `vanDerBlij`, `milgram` and `localDensityCount`, which this head consumes from Tau Ceti;
    - the Gram-matrix forms `GramSameGenus` and `equivalent_of_isEven_unimodular_indefinite`, which this head restates on the native carrier as `sameGenus_iff_of_isEven` and the two 6A theorems.

    `TwoElementaryAdmissible` and `infinite_isometry_of_isIndefinite` are Tau Ceti's (`TauCeti/LinearAlgebra/IntegralLattice/TwoElementary.lean:81`, `TauCeti/NumberTheory/IntegralLattice/IndefiniteIsometry.lean:171`).
  - **The obvious resolution breaks the build.** A merge that resolves the conflicts toward this head still takes main's non-conflicting hunks. That adds 157 lines to `Suggested.lean`, including second copies of the two 6E theorems, and a second `### Examples`/`### Dependencies` pair to Layer B.
  - **No order with #617 is stated for this folder.** #617 also changes this folder and conflicts with this head in both files. The order sentence speaks of "the same roadmap", which is ClassFieldTheory, not `TauCetiRoadmap/IntegralLattices`.
  - **No repair report exists.** None marks the previous finding as not actionable.
- **Witness.**
  - `git merge-tree --write-tree origin/main HEAD` reports a content conflict in both files: 83 conflict blocks in the README and 14 in `Suggested.lean`.
  - `git merge-tree --write-tree -X ours HEAD origin/main` declares `RootfulNiemeierType.eq_of_nonempty_isometry_lattice` twice, at lines 492 and 616 of the merged `Suggested.lean`. `lake env lean` on that file exits 1 with "has already been declared" at 616:8 and 629:8.
  - `roadmaps overlaps IntegralLattices` lists #617 and #1411 as conflicting in both files.
- **Repair.**
  1. Rebase onto main. Then restore the folder's two files from this head verbatim: `git checkout d6e2855 -- TauCetiRoadmap/IntegralLattices/README.md TauCetiRoadmap/IntegralLattices/Suggested.lean`. Keep main's generated `PROGRESS.md` and `STATUS.md`. Do not resolve with a merge strategy.
  2. Add one sentence to the description saying which of #617 and #1411 is rebased onto the other for `TauCetiRoadmap/IntegralLattices`.
- **Why this repair is safe, tested here.**
  - Both versions carry the same milestone labels: N0, N1, 1G–9B and B1–B8.
  - Every declaration that only main has is one this head consumes from Tau Ceti or restates on the native carrier, so nothing is lost.
  - The restored files are exactly the files at this head. They elaborate with exit 0 and 15 `sorry` warnings, and pass every content scanner of the gate.
  - The `-X ours` tree above does not elaborate.

## Previous findings (review of `5d0d7c6`)

- **R01 — repaired.**
  - **The even case of `𝔣_k`.** It is now stated at `README.md:998–1002`, with its locator: Beli, proofs of Lemma 2.12, p. 8, and Lemma 2.15, p. 10, after O'Meara 93:26. It agrees with `beli2010` lines 302 and 398–399.
  - **The defect and the weight are defined.** The quadratic defect is at `994–996`, on the native `TauCeti.quadraticDefect`. The weight is at `976–979`, with Beli Lemma 2.10 at `beli2010` line 254.
  - **The local classification is now listed as a supplier.** `QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq` is in 3D's *Needs* (`1007–1013`), in the 3D Dependencies row (`1293`), and the 3D consumer column of row `513`. Its hypotheses are at the pin: `TauCeti/NumberTheory/LocalField/QuadraticForm/Classification.lean:183–190` assumes `[IsNonarchimedeanLocalField K] [Invertible (2 : K)]`.
  - **The scope bullet is amended.** It now reads: "every target here is over `ℤ` or `ℤ_p`, except the dyadic classification of 3D" (`172–174`).
  - **The new Checks hold.** I recomputed the four new or extended Checks of 3D (`1037–1071`); the values are in the table below.
- **R02 — repaired.**
  - `README.md:957–963` and row `474` now read "the sums `L_0 ⊥ … ⊥ L_j` of the constituents of index at most `j`", indexed by scale exponent, with a zero constituent counted as type II.
  - This is the native statement: `TauCeti/LinearAlgebra/BilinearForm/JordanSplitting/Determinant.lean:89` uses `⨆ i ∈ Set.Iic j, N i`, with the hypotheses `π ≠ 0` and `2 ∣ π`.
  - O'Meara's positional `L_(k)` is now said to count the nonzero constituents in order (`970–973`).
  - The Check at `1031–1033` now names the index-0 sums `⟨1⟩` and `⟨7⟩`.
  - The added sentence that the single-train reduction also needs `2 ∣ π` matches `JordanSplitting/AdicComplete.lean:366–369`.
- **R03 — not repaired.** It is R01 above.

## Verified sound

### Gate, dependency check, build, signatures and padding probe

- **My gate run (`--base origin/main`).** Every scanner is 0 except `outside-folder=5`. All five files are in `TauCetiRoadmap/ClassFieldTheory/` and `TauCetiRoadmap/QuadraticFormInvariants/`, which are this pull request's own folders. The worker's gate passes every check. In my run the build step did not appear in the output, so I elaborated the file separately (below).
- **`Completed/LocalGaloisGroups/Suggested.lean`.** This 4-line change is the only other one. It matches the gate configuration's `outside_folder_allow`, it is ClassFieldTheory's two-line adaptation of a consumer, and it touches nothing here. I did not raise it against this folder.
- **Dependency check.** Output: `depcheck: 236 roadmaps, 2290 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Build.** `lake env lean` on `Suggested.lean` exits 0 in 9.7 s, with 15 warnings, all "declaration uses `sorry`".
- **Signatures.** I put `#check @name` for all 36 declarations into one scratch copy and elaborated it once: all 36 elaborate. Each type matches its README statement. For example:
  - `soEuclideanMeasure_univ` keeps `[FiniteDimensional ℝ E]`, the charted-space, manifold and Lindelöf instances, and the immersion hypotheses;
  - `exists_genusProperClasses_equiv_doubleCoset` keeps `[FiniteDimensional ℚ V]` and `[L.IsNondegenerate]`;
  - `padicDiscriminant_eq_squareClass_gramDet` carries the dyadic exception `p ≠ 2 ∨ ¬ HasCyclicTwoSummand …`.

  Nothing changed.
- **Padding probe.** In the same copy I replaced each `sorry` with `first | rfl | simp | infer_instance | decide | omega | trivial | aesop`. All 15 theorems fail.

### Library declarations and citations

- **Duplication at the pin.** No theorem or definition name of `Suggested.lean` occurs in the pinned Tau Ceti (23 names searched). By object, Tau Ceti has no indefinite unimodular classification, primitive-embedding notion or adelic class bijection. The one Loogle same-name hit, `primaryComponent`, is Mathlib's `AddCommGroup.primaryComponent`, which the abbreviation wraps.
- **Native names cited by Layer B and 3D.** All 90 exist at the pin, among them:
  - the binary forms (`binaryNormForm` to `card_isometry_hyperbolicPlane`) and the class dictionaries (`posDefProperClassEquivPic`, `properClassEquivNarrowPic`, `posDefProperClassEquivGal`);
  - the principal-genus names on `NarrowClassGroup`;
  - `quadraticDefect` (`LocalField/QuadraticForm/Defect/Basic.lean:247, 285, 301`) and `scaleIdeal`/`normIdeal` (`LinearAlgebra/BilinearForm/Ideals.lean:44, 48`, over any commutative semiring);
  - the dyadic moves and unimodular classifications.
- **Mathlib names.** I opened these at the pin:
  - `Nat.forall_exists_prime_gt_and_eq_mod` (`PrimesInAP.lean:443`) and `jacobiSym.quadratic_reciprocity` (`JacobiSymbol.lean:423`);
  - `toSphere` (`HaarToSphere.lean:52`) and `InnerProductSpace.volume_ball` (`VolumeOfBalls.lean:344`);
  - `AddGroup.rank` (`GroupTheory/Rank.lean:36`) and `DoubleCoset.Quotient` (`DoubleCoset.lean:79`);
  - `Submodule.smithNormalFormOfRankEq` (`FreeModule/PID.lean:530`), `AddSubgroup.relIndex_eq_natAbs_det` (`CardQuotient.lean:106`) and `Submodule.quotientEquivPiZMod` (`FreeModule/Finite/Quotient.lean:83`);
  - `legendreSym`, `sigPos`, `isometryEquivSignWeightedSumSquares`, `PadicInt.unitCoeff` and `dualSubmodule`.
- **Supplier sections on main (`3090489`).** All resolve:
  - Global Quadratic Forms 6.3 (its README 723) and 7.3 (848), with `hasseMinkowski_equivalent`, `exists_globalForm_of_isAdmissible` and `equivalent_of_locallyEquivalent`;
  - Orthogonal and Spin Groups 0C, 1D, 2C and 2F (368, 508, 684, 717). Its README names OTM as the owner of strong approximation (55, 300).
  - Restricted Products Layers 0–3 (248–361);
  - Differential Geometry 12.1 and 12.4 (915, 923), including pullback metrics and `integral_riemannianVolume_eq_integralDensity`;
  - Global Number Fields Layer 11 (571), Rank-24 lattice constructions Layers 3 and 6 (223, 312), and Lie Groups Layer 2 (356).
- **`roadmaps resolve`.** Its 13 leads are all declarations of `Suggested.lean`.

### Sources

- **`beli2010`.**
  - Lemma 2.10, the weight determined by the norm group: line 254, p. 7.
  - The even-case formula `𝔰_k²𝔣_k = 𝔡(a_ka_{k+1}) + a_{k+1}𝔴_k + a_k𝔴_{k+1} + 2𝔭^{(u_k+u_{k+1})/2+r_k}`: in the proof of Lemma 2.12 at line 302 (p. 8), and again at line 398 (p. 10). Lemma 2.12's own statement at line 295 divides by `𝔰_k²` consistently. The formula is invariant under rescaling: every term gains `π²`.
  - The odd case `𝔰_k²𝔣_k = a_ka_{k+1}𝒪`: line 400.
  - Theorem 93:28 with the fundamental type: lines 490–505, pp. 12–13, the theorem itself at line 500 on p. 13. Line 498 gives the equivalent form through `𝔴_k` and `a_k ≅ b_k`.
  - The strict inclusion read as `ord 𝔣_k + ord a_k⁻¹𝔴_k > 2e`: line 598, p. 15.
  - I also checked every `𝔣_1` of the 3D Checks against Beli's invariant `α_1` (Corollary 2.9 and Lemma 2.16(ii), lines 242–244 and 415–417).
- **`allcock-gal-mark2016`.**
  - Lemma 4.2 at line 552 (p. 12), Lemma 4.3 at 621 (p. 14) and Theorem 4.4 at 672 (p. 15).
  - Theorem 5.1 at 686 (p. 16), Lemma 5.2 at 760 (pp. 17–18) and Lemma 6.1 at 808 (p. 19).
  - Theorems 6.2 at 849 and 6.3 at 864 (p. 20), and Corollary 6.4 at 917 (p. 21).
- **`voight2023`.** Definition 3.10 at line 230 (p. 5), Lemma 3.12 at 245 and Proposition 3.13 at 251 (p. 6).
- **`boya-sudarshan-tilma2003`.** Equations (6.1)–(6.5) at lines 643–669 (pp. 16–17), and (6.9) at 684.

### Seeded sample B1–B8

- **The mathematics.** Every statement holds on the instances in the table.
- **The native parts.** B1 and B4, and the native parts of B2, B3 and B5, are the pinned declarations listed above.
- **The locators.** None of them can be checked against a text; see *Not verifiable*.

### Ownership and overlaps

- **The open roadmap pull requests.** Overlaps report no id cited here that an open pull request drops, and none that only an open revision defines. #617 is R01, and #1187 is a Tau Ceti bump.
- **OrthogonalTamagawaAndLatticeMass (#1222, at its head).** It consumes this roadmap and cites §§2G, 6C, 6D, 6E, 6G, 7A, 7C, 7E, 7G, B8 and 9B. All of these exist here. Its scope agrees with the out-of-scope table of `README.md:89–97`.
- **LatticePackingsAndPerfectForms (#1723).** It consumes §§1C, 1D, 1G, 4A, 6C and 9B, all present.
- **The determinant `−1` element.** N0 here proves it for `ℤ_p`. GeometryOfNumbersAndQuadraticArithmetic (#851, its 2.4.6) owns it over any discrete valuation ring, and #1222 consumes it from there. IntegralLattices is on main and may not cite an open roadmap, so the citation is for #851 and #1222 to settle. It is not a finding here.
- **Process words.** None in the README.

### Adversarial table

Every value is exact. Some come from scratch scripts: values of `x² + cy²` modulo 256, Hilbert symbols at 2, Gram changes of basis, and Beli's `α_1` with his relative defect order `d`.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 3D, even-case `𝔣_k` (new) | `⟨1⟩⊥⟨16⟩` against `⟨5⟩⊥⟨80⟩` | `𝔴₁ = 2ℤ₂` and `𝔴₂ = 32ℤ₂` on both sides; `𝔣₁ = 0 + 32 + 32 + 8 = 8ℤ₂` (for `K`: `𝔡(400) = 0`, `160 + 160 + 8`); `α₁ = 3 = ord 𝔣₁`; `1/5 ∉ (ℤ₂ˣ)²`; `x² + 16y²` takes no `5u²` mod 256; `(1,16)₂ = (5,80)₂ = 1` | pass | none |
| 3D, the `r_k` in the exponent (new) | `⟨2⟩⊥⟨32⟩` | `r₁ = u₁ = 1`, `u₂ = 5`; `𝔰₁²𝔣₁ = 128 + 128 + 32 = 32ℤ₂`, so `𝔣₁ = 8ℤ₂`, and `α₁ = 3`; dropping `r_k` gives `4ℤ₂` | pass | none |
| 3D, strict inclusions (new) | `⟨1⟩⊥⟨2⟩ ≅ ⟨3⟩⊥⟨6⟩` | `Pᵀdiag(1,2)P = diag(3,6)` with `det P = 3`; `α₁ = 1`, so `𝔣₁ = 2ℤ₂ = 4a₂𝔴₂⁻¹ = 4a₁𝔴₁⁻¹`; `(3,2)₂ = −1 ≠ (1,6)₂ = 1`, so the `⊆` reading separates two isometric lattices | pass | none |
| 3D, sign walk across 4 | `⟨1⟩⊕⟨4⟩ ≅ ⟨5⟩⊕⟨20⟩` | `Pᵀdiag(1,4)P = diag(5,20)`, `det P = 5`; `𝔣₁ = 4ℤ₂` with `α₁ = 2`; `1/5 ≡ 1 (mod 4)`; `[5]⊥[4]` and `[5]⊥[1]` represent 1 | pass | none |
| 3D, fundamental type does not classify | `⟨1⟩⊥⟨56⟩` against `⟨7⟩⊥⟨8⟩` | `𝔴₁ = 2ℤ₂` and `𝔴₂ = 16ℤ₂` on both sides; `α₁ = 5/2 > 2e`, so `ord 𝔣₁ = 3`; `(1,56)₂ = (7,8)₂ = 1`; `x² + 56y²` takes no `7u²` mod 256 | pass | none |
| 3D, weight uniqueness | `L^{𝔰₂} = ⟨256⟩⊥⟨16⟩` | `𝔴 = 512 + 32 + 0 + 0 + 32 = 32ℤ₂ = 2𝔰₂`; the candidate `16ℤ₂` has `u + ord 𝔴 = 8`, even, and is not `2𝔰`, so it is excluded | pass | none |
| native partial-sum lemma | `j = 0` on the pair above | index-0 sums `⟨1⟩` and `⟨7⟩`; `7(1 + 4t) = c²` is impossible; `Iic j` at `Determinant.lean:89` | pass | none |
| B1 (native) | `A₂`, `U`, `⟨1,−2⟩`, `!![4,1;1,6]`, `!![3,1;1,4]` | content and `Δ`: `2, −3`; `2, 1`; `1, 8`; `2, −23`; `1, −44` | pass | none |
| B2, the sign clause | `Δ = 12` | `𝔞_f = 𝔞_{f'} = ℤ + √3ℤ`; `f'(y,−x) = 3x² − y²` with ideal `(3,√3) = √3·𝒪`, `N(√3) = −3`; `x² ≡ −1 (mod 3)` is insoluble | pass | none |
| B2, the sign transport | `⟨−1⟩⊕⟨−1⟩` | det `1/1`, `Δ` `−4/−4`, content `1/1`, `|O|` `8/8` | pass | none |
| B3, the genus | `Δ = −20`, `−36` | `(2,2,3)` represents 3 and has tuple `(−,−)`; `(2,2,5)` represents 5 and has tuple `((5|3), δ(5)) = (−,+)`; image `{δ = +}`; `ker Φ = 1 = C²` | pass | none |
| B3, split branch | `m = 5`, `8` | `5xy + cy²`: genera `{1,4}` and `{2,3}`, torus quotient of order 2; `m = 8`: 4 genera, torus quotient of order 1 | pass | none |
| B4 | `!![4,1;1,6]`, `U` | minimum 4 attained only at `±e₁`, `|O| = 2` against `2·#𝒪ˣ = 4`; `|O(U)| = 4`, `|SO(U)| = 2` | pass | none |
| B5, `ρ`-cycles | `Δ = 12`, `8` | `ρ(1,2,−2) = (−2,2,1)` with `r = 2`, and back; `ρ(1,2,−1) = (−1,2,1)`; `ρ(1,0,−3) = (−3,0,1)`; substitution of determinant 1 | pass | none |
| B6 | `x² + y²`, `x² − 3y²`, `U` | `T(ℤ)` is `{±1, ±i}`, `{±(2+√3)^k}` and `{±1}` | pass | none |
| B7 | `Δ = −4`, `12`, `U` | `2π/4 = π/2`; `log(2+√3) ≈ 1.3170`; the modulus kernel `ℤ̂ˣ` has volume 1 and the full quotient infinite volume | pass | none |
| B8 | `A₂`; genus of `!![4,1;1,6]`; `x² + y²` | `m⁺ = 1/6`, `m = 1/12`; `m⁺ = 3/2`, `m = 3/4` against `h/(2w) = 1/2`; `m⁺ = 1/4`, `m = 1/8 = 1/|O(ℤ²)|` | pass | none |
| 4B (Lean) | `⟨1⟩`; genus of `!![4,1;1,6]`; the 5-neighbour of `ℤ²` | 1 and 1 points; 2 and 3 points; `det σ = −1`, `det σ·diag(1,−1) = +1`, the identity fails at 5 | pass | none |
| 5A (Lean) | `E₈²` and `D₁₆⁺`; `I₈` | `(16, 0, 0)`; `I₈` is excluded by the evenness hypotheses | pass | none |
| 5B, `exists_evenLattice_iff` (Lean) | `(1,0,q₁⁽²⁾(2))`, `(1,0,q₁⁽³⁾(3))`, `(0,0,0)`, `(0,2,q₁⁽³⁾(3))` | sign 1 against 1, all hold; sign 6 against 1, fails; the zero lattice; `−2 ≡ 6`, `A₂(−1)` | pass | none |
| 5B, `padicDiscriminant_…` (Lean) | `⟨2⟩` and `⟨10⟩`; `q₁⁽²⁾(4)` | ratio 5, excluded by `HasCyclicTwoSummand`; `⟨4a⟩` realizes `q(1) = 1/8` only for `a ≡ 1 (mod 8)`, and `⟨20⟩` gives `5/8`: unique, class 1 | pass | none |
| 5G, 1.12.2 (Lean) | `⟨2⟩` in `U` | `e + f`; complement `⟨−2⟩` with `q = −1/4 = −q_S` | pass | none |
| 5G, 1.12.4 (Lean) | `(0,0,l₊,l₋)`, `(1,0,1,1)`, `(2,0,2,2)`, `(5,0,8,0)` | both sides are `8 ∣ l₊ − l₋`; `⟨2d⟩ → U` by `e + df`; `S ⊕ S(−1)` glues to `U²`; `A₁⁵` needs `l = 5 ≤ 3`, and `10 > 8` | pass | none |
| 5J (Lean) | `(1;1,0,1)`; the four boundary tuples | `⟨2⟩`; each tuple fails exactly clause 4, 5, 6 or 7 respectively | pass | none |
| 6A (Lean) | `U⊕E₈⊕E₈(−1)` and `U⁹`; `U⊕⟨1⟩` and `I_{2,1}`; `U` and `⟨1⟩⊕⟨−1⟩` | `(9,0,9)`; `(2,0,1)`; the parities differ | pass | none |
| 6A, the odd step | `u = w' + ((ε − a')/2)v`, `y = v − εu` | `u² = ε`, `B(u,v) = 1`, `y² = −ε`, `B(y,u) = 1 − ε² = 0` | pass | none |
| 6D basis Check | `h` with the `D₁₅` chain; the `A₁₅` chain | minors `4, 8, …, 60`, then `4(4 − 15/4) = 1`; `16(4 − 15/16) = 49` | pass | none |
| 6E (Lean) | `D₁₆E₈` and `E₈³`; `A₁₇E₇` and `D₁₀E₇²`; Leech | `480 + 240 = 720`; `306 + 126 = 180 + 252 = 432`; `N_r ⊇ R_r` has norm-2 vectors, while Leech has minimum 4 | pass | none |
| 7C, odd-`p` dictionary | `⟨3⟩`, `⟨1⟩⊕⟨3⟩`, `⟨1⟩⊕⟨9⟩`, `⟨1,1,3⟩` at 3 | `E = 0, 1, 2, 1`; `α₃ = 6, 12, 36, 16`; `m₃ = 1/2, √3/4, 3/4, 9/16` on both sides | pass | none |
| 7C, unramified value | `U` at 3 | `ε = ((−1)·(−1) | 3) = +1`, `α₃ = 4/3`; the raw determinant would give `8/3` | pass | none |
| 7E (Lean) | `n = 0, 1, 2, 3` | `1, 1, 2π, 8π²`; `O(1)` has mass 2; the Frobenius metric gives `2π√2` | pass | none |
| 1G and 1H Checks | `oddCyclic 3`, with `θ = 1, 2`; `u` and `v`; `A₁⊕A₁` | sign `6`, `2`; Gauss sums `2`, `−2`; `2i`, sign 2, `H = H^⊥` with `q = 1/2` | pass | none |
| N0, improper element | `⟨1⟩`, `⟨4⟩` and `U` at 2; `⟨1⟩⊕⟨2⟩` at 3 | `s_e = −1`; `s_e = −1` with norm 4; `v = e + f` of norm 2; `e₁ − (2/3)(e₁ + e₂) ∉ L₃` | pass | none |

## Not verifiable

- **Cox, *Primes of the form x² + ny²*.**
  - It is cited for B2 (Theorem 7.7, p. 137), B3 (§3.B, Theorem 3.15), B4 (Theorem 3.9, p. 50), and B5 and B7 (Theorems 2.8 and 2.13, pp. 27 and 29).
  - `sources fetch` answered "no legal source found". I ran it against a scratch copy of the manifest and left the manifest unedited.
- **Cohen, GTM 138, §§5.2 and 5.6** (B2, B5, B7): recorded as uncertified.
- **Cassels, *Rational Quadratic Forms*, chapter 13** (B4, B6), and **Cassels, *An Introduction to the Geometry of Numbers*, chapter VIII** (2F): not in the manifest or the cache, and cited as uncertified.
- **Conway–Sloane 1988** (B8, 7A, 7C): waived.
- **Kawauchi–Kojima** (1G): uncertified.
- **O'Meara.** Every numbered locator: §63A, §93A, 93:16, 93:26, 93:28, 93:29, 92:1–92:5, 81:14 and the others. It is a Springer book and not in the cache. 93:26 and 93:28 were checked only through Beli's restatement.
- **Not in the cache, so their numbering is unchecked:** Nikulin 1979, Serre, Milnor–Husemoller, SPLAG, Cho, Gan–Yu, Wall, van der Blij, Ebeling, Kitaoka and Kneser.

## Source issues

- **Misprint** in beli2010 at §3, statement of Theorem 93:28, p. 13: the source says the conditions hold for `1 ≤ i ≤ t − 1`, although all three are indexed by `k`; it should be `1 ≤ k ≤ t − 1`; affects nothing.
