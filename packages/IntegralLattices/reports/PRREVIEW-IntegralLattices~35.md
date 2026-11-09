# Review of IntegralLattices (pull request #617 at adfe4b1)

**Verdict:** needs changes

This is an incremental re-review. Since `e919c36`, 140 lines of `TauCetiRoadmap/IntegralLattices/README.md` changed; `Suggested.lean` is byte-identical. Previous findings R02–R05 are repaired. R01 (gate) and R06 (order against #1411) are not, and are raised again as R01 and R02. One new finding, R03: the head does not merge with main. All three findings are P3; there is no P1 or P2. Pins: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`.

## R01 (P3) — Gate `outside-folder`: files under `Completed/` still change in this pull request

- **Location.** `git diff --stat origin/main...HEAD` lists:
  - `Completed/LocalFieldsRamification/{COMPLETION.md, README.md, Suggested.lean}`;
  - `Completed/LocalGaloisGroups/{README.md, Suggested.lean}`.
- **Claim.** These files lie outside the three folders this pull request owns (IntegralLattices, ClassFieldTheory, QuadraticFormInvariants). So the gate fails, and while it fails this folder cannot be accepted.
- **Witness.**
  - The worker's gate at `adfe4b1` prints `outside-folder=4 … build=0 FAIL`, with every other scanner at 0.
  - My rerun prints `outside-folder=9`: the same four `Completed/` files, plus five files of the two sibling folders this pull request owns.
- **Repair.** Do one of the following, then rerun the gate until `outside-folder` lists only files of folders this pull request owns:
  - name `Completed/LocalFieldsRamification` and `Completed/LocalGaloisGroups` as this pull request's own folders, so that each gets its own review; or
  - move those changes to a separate pull request. The title and description are about LocalFieldsRamification.

## R02 (P3) — #1411 rewrites this folder differently, and no merge order is stated

- **Location.** The description's revision paragraph: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410".
- **Claim.**
  - #1411 (a draft) changes both IntegralLattices files, and its head conflicts with this one. Nothing says which pull request is rebased onto which.
  - #1797 no longer changes this folder, so that half of the previous finding has lapsed.
- **Witness.**
  - `roadmaps overlaps IntegralLattices` (index of 2026-11-09T19:11:44Z) reports "#617 and #1411 conflict in … `TauCetiRoadmap/IntegralLattices/README.md`, `TauCetiRoadmap/IntegralLattices/Suggested.lean`".
  - `roadmaps list` shows #1797 touching only AlgebraicTopology, GeometricTopology, QuadraticFormInvariants, ReductiveGroups and LieHighestWeight.
- **Repair.** First rebase onto main (R03). Then state in the description which of #617 and #1411 merges first, and that the other rebases onto it. Do not restate in one what the other already changes.

## R03 (P3) — The head does not merge with main: both IntegralLattices files conflict with the version main merged on 2026-11-08

- **Location.** `TauCetiRoadmap/IntegralLattices/README.md` and `Suggested.lean`. Every passage changed since `e919c36` lies inside a conflict hunk:
  - the supplier rows at README.md:430, 482, 537 and 539;
  - B3 at 1343–1467;
  - the Layer 5 *Needs* lines at 2224, 2288, 2356 and 2429;
  - the dependency rows at 2440–2445.
- **Claim.**
  - This branch's merge base with main is `eaf17b1` (2026-11-07).
  - Main has since merged `47fc6a3`, "IntegralLattices: classification and mass prerequisite constructions" (#1239). It rewrote both files: 2431 insertions and 2289 deletions in the folder.
  - So the head cannot merge as it stands. Any resolution has to settle, item by item, what main's version states and this head does not. For example:
    - main's `Suggested.lean` has 62 declarations, and this head's has 35;
    - `milgram`, `vanDerBlij`, `finite_classes_of_posDef` and `exists_twoElementaryLattice_iff` exist only on main.
  - The same conflict already existed at `e919c36` against main `1bea835`. The previous review did not report it. It is raised now because every passage changed this round lies in a conflict hunk.
- **Witness.** `git merge-tree --write-tree origin/main adfe4b1` prints "CONFLICT (content)" for both files: 83 hunks in the README and 14 in `Suggested.lean`. A single hunk, merged lines 1707–1867, holds all of B3's new text.
- **Repair.**
  1. Rebase onto current main (`3090489`) and resolve the 83 + 14 hunks.
  2. For each declaration or section of main's version that the rebased head retires, say in §*Scope and ownership* where it now lives: a native name, or a target of this roadmap. `overlaps.md` reports no dropped id cited elsewhere, so no old → new table is required.
  3. Rerun the gate, `lake env lean` and `roadmaps overlaps` on the rebased head.
  4. Test the repair: `git merge-tree --write-tree origin/main <new head>` must print no CONFLICT line.

## Previous findings

- R01 — not repaired: the worker's gate at `adfe4b1` still prints `outside-folder=4`: the three `Completed/LocalFieldsRamification` files and `Completed/LocalGaloisGroups/README.md`. Raised again as R01.
- R02 — repaired: README.md:1348–1352 now assigns "none when `Δ ≡ 1 (mod 4)` or `N ≡ 1 (mod 4)`; `δ` when `N ≡ 3 (mod 4)` or `N ≡ 4 (mod 8)`; `ε` when `N ≡ 2 (mod 8)`; the single character `δε` when `N ≡ 6 (mod 8)`; both … when `N ≡ 0 (mod 8)`". There is a Check at `Δ = −8` (1452).
- R03 — repaired: B3 step 3 (1380–1414) is now "*The ambiguous classes: `#C[2] = 2^{μ−1}`.* For every nonsquare `Δ` …", proved in three parts. The *Needs* line (1428–1434) and the B3 row (1764) name its inputs.
- R04 — repaired: row 2441 reads "L 1G, 1H, 1I, 3C, 3D, 5A, N0; T `localHasse`, `hilbertSymbol_productFormula`; R Global Quadratic Forms §7.3 `exists_globalForm_of_isAdmissible`". The *Needs* line is at 2288–2292 and a supplier row at 537.
- R05 — repaired: line 539 now reads "| 4B, 4C, 4F | Orthogonal and Spin Groups | …". B7 (1646–1724) cites nothing from that roadmap.
- R06 — not repaired: the description still reads "…which merge first: #1410", and #1411 still conflicts in both IntegralLattices files. #1797 no longer touches the folder. Raised again as R02.

## Verified sound

**Gate, dependencies and build.**
- Gate:
  - the worker's run at `adfe4b1`: every scanner is 0 except `outside-folder=4` (R01), and `build=0`;
  - my rerun: every scanner is 0 except `outside-folder=9`, which also counts the two sibling folders this pull request owns.
- The dependency check (`gate --depcheck … --movable`) prints `depcheck: 236 roadmaps, 2288 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line.
- `lake env lean …/Suggested.lean` exits 0 in 13 s. The only diagnostics are 15 `declaration uses sorry` warnings, at lines 265, 284, 308, 325, 371, 378, 399, 412, 426, 441, 453, 472, 485, 547 and 574.
- `Suggested.lean` is unchanged since `e919c36`. It has one `import Mathlib` and 21 `TauCeti.*` imports, and no `set_option`, `lemma`, `#eval` or sorry'd data.

**Signatures and padding, rerun this round.**
- The 36 `#check @…` lines of `signatures/SignatureCheck.lean` elaborate with 0 errors. The elaborated types are unchanged from the previous round's comparison with the README, for example `exists_evenLattice_iff` with `q.IsNondegenerate` and a `NikulinDecomposition q`. No section binder is lost.
- One-tactic probe: on a scratch copy, each of the 15 `sorry`s was replaced by `first | rfl | infer_instance | simp | trivial | decide | aesop`. All 15 fail:
  - 6 with "aesop made no progress";
  - 9 with unsolved goals.

  None is padding.

**The new B3 mathematics, checked by computation.** These are scripts in my scratch directory; the values are in the table below.
- **Characters at 2.** For all 576 nonsquare `Δ` with `|Δ| ≤ 600`, the span of the listed characters equals the group of characters of `(ℤ/8ℤ)ˣ` that are constant on the values prime to `2Δ` of the principal form. There are 0 mismatches.
- **Step 1.** On the same 576 discriminants, `(Δ | m) = ∏_{p ∣ Δ₀ odd} χ_p(m) · (δ, ε or δε)` holds for every `m < 8|Δ|` prime to `2Δ`, with 0 mismatches. The factor at 2 always lies in the span of the assigned characters.
- **Steps 3 and 4.** For all 283 nonsquare `Δ` with `|Δ| ≤ 300`, the following were enumerated by reduction (positive definite classes for `Δ < 0`, Gauss cycles for `Δ > 0`):
  - each assigned character is constant on every class;
  - the number of genera is `2^{μ−1}`;
  - the number of ambiguous classes (`[f] = [f⁻]`) is `2^{μ−1}`;
  - the number of normalized ambiguous primitive forms with `a > 0` is `2^μ`;
  - every ambiguous class contains exactly two of them.

  There were 0 failures.
- **Step 3, part 1, by hand.** An improper isometry has eigenvalues `{λ, −1/λ} = {1/λ, −λ}`, which forces `{1, −1}`; its eigenvectors are orthogonal; and `s_v(e) = e − (b/a)v` under the polar convention. The proof is correct as written.
- **Step 3, part 2.** The SO-orbits on the improper automorphisms correspond to `SO/SO²`, since `g s_v g⁻¹ = g² s_v`. The pairing of `s_v` with `−s_v = s_{v^⊥}` gives values of opposite sign, and `−1 ∉ SO²` when `Δ > 0`.

**Library declarations opened this round, at the pins.**
- Mathlib:
  - `isCyclic_subgroup_units` (`Mathlib/RingTheory/IntegralDomain.lean:150`): a finite subgroup `S` of `Rˣ` for a domain `R`.
  - `Subgroup.dense_or_isCyclic` (`Mathlib/Topology/Algebra/Order/ArchimedeanDiscrete.lean:67`): it needs an archimedean linearly ordered group with the order topology, and is in namespace `Subgroup` (line 28).
  - `jacobiSym.quadratic_reciprocity` (`Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean:423`).
  - `Nat.forall_exists_prime_gt_and_eq_mod` (`Mathlib/NumberTheory/LSeries/PrimesInAP.lean:443`, in namespace `Nat`, line 422).
- Tau Ceti:
  - `exists_eq_smul_reflected_iff_picClass_sq_eq_one` (`TauCeti/NumberTheory/BinaryQuadraticForm/Ideal/Reflection.lean:208`). Hypotheses: `D < 0`, primitive, `0 < f.a`.
  - `exists_eq_smul_reflected_iff_narrowPicClass_sq_eq_one` (same file, line 219). Hypotheses: `0 < D`, primitive.
  - `specialOrthogonalGroupEquivNormOneUnits` (`TauCeti/NumberTheory/IntegralLattice/Binary/NormOne.lean:72`). Hypothesis: `L.form ≠ 0`.
  - `card_specialOrthogonalGroup_of_binaryDiscriminant_neg` (NormOne.lean:104).
  - `infinite_specialOrthogonalGroup_of_binaryDiscriminant_pos_of_not_isSquare` (NormOne.lean:114).
  - `localHasse` (`TauCeti/NumberTheory/LocalField/QuadraticForm/Hasse.lean:93`).
  - `hilbertSymbol_productFormula` (`TauCeti/NumberTheory/QuadraticForm/Global/ProductFormula.lean:67`).
  - `TwoElementaryAdmissible`, `TwoElementaryLatticeWithInvariants` and `TwoElementaryLatticeWithInvariants.twoElementaryAdmissible` (`TauCeti/LinearAlgebra/IntegralLattice/TwoElementary.lean:81, 285, 303`).
  - `SameGenus` (`TauCeti/NumberTheory/IntegralLattice/Genus.lean:77`).
  - `sameGenus_iff_of_isUnimodular` (`…/UnimodularGenus.lean:48`).
  - `sameGenus_of_isEven_of_isUnimodular` (`…/EvenUnimodularGenus.lean:58`).
- The new Mathlib row (README.md:430) and the widened B4 row (482) name exactly these files.

**Cross-roadmap citations resolved on main (`3090489`).**
- Global Quadratic Forms:
  - §7.3 "Realization of admissible invariant systems" is at its README.md:848, and `exists_globalForm_of_isAdmissible` is at its `Suggested.lean:516`. It takes `I : GlobalFormInvariants K` with `I.IsAdmissible`, and returns a nondegenerate `Q` on `Fin I.rank → K` with `globalInvariants Q hQ = I`.
  - The carrier, at its README 327–340, has a rank `n ≥ 1`, a discriminant class, finite Hasse signs and a real positive index. This matches the contract in row 537.
  - `overlaps.md` reports that no open pull request drops §7.3.
- 5B no longer appears among the consumers of `hasseMinkowski_equivalent`, and its route does not use that theorem (grep: 1036–1038, 1972–1978, 2178, 2664 and 2741 only).
- *Needs* lines against dependency rows:
  - 5A: 3F is native `SameGenus`, which the row lists as T;
  - 5B, 5G and 5J: identical.
- N0 depends on nothing in Layer 5, so the new 5A and 5B edges to N0 create no cycle.

**Ownership.** `roadmaps grep -i 'ambiguous (form|class)'` finds, outside this folder, only the field-level ambiguous class number formulas in EulerSystemsCyclotomicMainConjecture and AbelianSchemesAndArithmeticModuliPartII. Neither is the form-theoretic count for orders that B3 step 3 owns. The native `narrowTwoRank_eq_ncard_ramifiedPrimes_sub_one` covers squarefree `d` only.

**Remark (no change asked).** README.md:1370–1371 says the Kronecker character is a product "of all of them when `Δ` is fundamental and of a proper subset in general". At the nonfundamental `Δ = −12`, `−16` and `−27` the product uses all the assigned characters (`χ₃`; `δ`; `χ₃`). So "in general" must be read as "possibly", which the exact factorization in the preceding sentence makes unambiguous.

**Adversarial table.**
- Rows marked *new* were computed this round (*bf* means brute force).
- Rows marked *r32* are carried from the previous report for statements this diff leaves untouched, with their values re-read.

| Statement | Instances | Left / right values | Result | Change |
| --- | --- | --- | --- | --- |
| B3 characters at 2 (*new*, bf) | `Δ = −8, −24, −16, −32, −12, 24, 8, 12` | residues of principal values mod 8: `{1,3}` → `δε`; `{1,7}` → `ε`; `{1,5}` → `δ`; `{1}` → `δ,ε`; all → none; `{1,3}` → `δε`; `{1,7}` → `ε`; `{1,5}` → `δ`; the listed rule gives the same eight | holds (576/576) | none |
| B3 step 1 factorization (*new*, bf) | `Δ = −36` (`Δ₀=−4`); `Δ = 45` (`Δ₀=5`); `Δ = −128` (`Δ₀=−8`, `8∣N`) | `(−36\|m) = δ(m)`; `(45\|m) = χ₅(m)`; `(−128\|m) = δε(m)` with `δ`, `ε` both assigned | holds (576/576) | none |
| B3 step 3, part 1 (*new*) | `x²+y²`, `g = !![0,1;1,0]`; `(5,5,−1)` | eigenvalues `1, −1`, eigenvectors `(1,1) ⊥ (1,−1)`, `g = s_{(1,−1)}`; `s_{e₁}(e₂) = e₂ − (5/5)e₁` integral | holds | none |
| B3 step 3, part 2 (*new*, bf) | `Δ = −4`; `Δ = 45`; 283 discriminants | `(1,0,1)`, `(2,2,1)` both in `[x²+y²]`, `[SO:SO²] = [⟨i⟩:⟨−1⟩] = 2`; `(1,1,−11)`, `(9,9,1)` principal and `(5,5,−1)`, `(45,45,11)` in `[(−1,5,5)]`, `[SO:SO²] = 4` with 2 of 4 having `a>0` | holds | none |
| B3 step 3, part 3 count (*new*, bf) | `Δ = −3`; `Δ = 96` (`N=24`); `Δ = 60` (`N=15`) | `(1,1,1)`, `(3,3,1)`: 2 `= 2^1`; `2^{ω(24)} + 2^{ω(24)} = 4+4 = 8 = 2^3`; `4+4 = 8 = 2^3` (`χ₃, χ₅, δ`) | holds (283/283) | none |
| B3 step 4 and genus count (*new*, bf) | `Δ = 96, 60, 180, 45, 12, −24` | `h⁺` / genera / ambiguous classes: `4/4/4`, `4/4/4`, `2/2/2`, `2/2/2`, `2/2/2`, `2/2/2` | holds | none |
| B3 Check `Δ = −8` (*new*) | `x² + 2y²` | values `1, 3`; `δ(3) = ε(3) = −1`, `δε(3) = +1`; `μ = 1`, `h = 1 = 2⁰` | holds | none |
| B3 Check `Δ = −24` (*new*) | `x²+6y²`; `2x²+3y²` | `1, 7` → `(χ₃,ε) = (+,+)`, `δ(7) = −1`; `5, 11` → `(−,−)` | holds | none |
| B3 Check `Δ = 45` (*new*) | normalized forms; splittings `3·15`, `15·3` | discs `1+44`, `25+20`, `81−36`, `2025−1980` all `= 45`; `(3,3,−3)`, `(15,15,3)` have gcd 3; `h⁺(45) = 2` (no norm `−1` unit, since `φ⁴ = 2+3φ`); `(−1,5,5)` → `(χ₃,χ₅) = (−,+)` | holds | none |
| B3 split remark `Δ = 25` (*new*) | `(ℤ/5ℤ)ˣ`; `SO(f)` | 2 elements of order ≤ 2 against `2^{μ−1} = 1`; `SO = {±1}`, `[SO:SO²] = 2` | holds; nonsquare hypothesis needed | none |
| 5B supplier row vs GQF §7.3 (*new*) | its README 327–363; its `Suggested.lean:516` | rank `n ≥ 1`, discriminant, finite Hasse signs, real positive index, against the row's list: equal | holds | none |
| Layer 5 *Needs* vs rows (*new*) | 5A, 5B, 5G, 5J | `{1D,1G,3C,3D,3E,3F,N0}` against `{SameGenus=3F,1D,1G,3C,3D,3E,N0}`; the other three identical | holds | none |
| B3 `Δ = −20`, `Δ = −36` Checks (r32, recomputed bf) | `(1,0,5)`, `(2,2,3)`; `(1,0,9)`, `(2,2,5)` | `(+,+)`, `(−,−)`, `h = 2 = 2^{μ−1}`; `(+,+)`, `(−,+)`, image `= ker δ` | holds | none |
| B1 `disc N_L = −4 det L` (r32) | `A₂`; `U`; `!![3,1;1,4]` | `−12 = −4·3`; `4 = −4·(−1)`; `−44 = −4·11` | holds | none |
| B2 oriented sign clause (r32) | `Δ = 12`: `±(x² − 3y²)` | ideals `𝒪₁₂` and `√3𝒪₁₂`; `h⁺ = 2`, `h = 1` | holds | none |
| B2 positive-definite restriction (r32) | `±(x²+y²)` | 2 proper classes against `#Pic ℤ[i] = 1` | holds | none |
| B3 ring class field (r32) | `Δ = −23` | 3 reduced forms `= [H:K] = 3` | holds | none |
| B3 split branch (r32) | `Δ = 25`; `Δ = 64` | 2 genera, torus order 2; 4 genera, torus trivial | holds | none |
| B4 `[O:SO]` (r32) | `!![2,1;1,12]`; `!![4,1;1,6]`; `A₂`; `U` | `4/2`; `2/2`; `12/6`; `4/2` | holds | none |
| B5 class counts (r32) | `Δ = −23`, `−44`, `25` | 3; 3; `φ(5) = 4` | holds | none |
| B6 integral points (r32) | `Δ = −4`; `12`; `U` | `{±1,±i}`; infinite (`2+√3`); `{±1}` | holds | none |
| B7 volumes (r32) | `Δ = −4`; `Δ = 12`; `U` | `π/2`; `log(2+√3) = 1.31696`; 1 | holds | none |
| B8 masses (r32) | `A₂`; genus of `!![4,1;1,6]` | `m = 1/12`; `1/4 + 1/2 = 3/4 = h⁺/(2w)` | holds | none |
| N0 determinant `−1` (r32) | `⟨4⟩`@2; `U`@2; `⟨1⟩⊕⟨2⟩`@3 | `s_e = −1`; swap; `s_{e₁+e₂}(e₁) ∉ L₃` | holds | none |
| 4B classes / proper classes (Lean, r32) | `⟨1⟩`; genus of `!![4,1;1,6]` | 1 = 1; 2 = 2 and 3 = 3 (`h⁺`) | holds | none |
| 5A `sameGenus_iff_of_isEven` (Lean, r32) | `E₈²`/`D₁₆⁺`; `⟨2⟩⊕⟨−2⟩`/`U(2)` | `(16,0,0)`, trivial `q`: true/true; `q` differ: false/false | holds | none |
| 5B `padicDiscriminant_eq_squareClass_gramDet` (Lean, r32) | `⟨6⟩`@3; `⟨2⟩`, `⟨10⟩`@2 | `realizationDet = 6 = gramDet`; excluded by `hp` | holds | none |
| 5B `exists_evenLattice_iff` / `_of_lt` (Lean, r32) | `(1,0,q₁^{(3)}(3))`; `(0,2,·)`; `(1,1,0)` | false/false; `A₂(−1)` true/true; `U` | holds | none |
| 5G 1.12.2, 1.12.4 (Lean, r32) | `S = 0`; `⟨2a⟩ ↪ U` | `8 ∣ l₊−l₋` both sides; `e+af` primitive of norm `2a` | holds | none |
| 5J sufficiency (Lean, r32) | `(1;1,0,1)`; `(0;4,0,0)` | `⟨2⟩`; condition 4 fails | agrees | none |
| 6A even/odd (Lean, r32) | `U⊕E₈⊕E₈(−1)`/`U⁹`; `U`/`⟨1⟩⊕⟨−1⟩` | `(9,0,9)` both; parities differ | holds | none |
| 6E (Lean, r32) | `D₁₆E₈`/`E₈³`; Leech | 720 = 720 roots, multisets differ; empty norm-2 shell | holds | none |
| 7E (Lean, r32) | `n = 0,1,2,3` | `vol SO = 1, 1, 2π, 8π²`; `vol O(1) = 2` | holds | none |
| 7C stabilizer index (r32) | `⟨a⟩`; rank 0 | index 2; index 1 | holds | none |

## Not verifiable

- **Cox, *Primes of the form x² + ny²*** (B2 Theorem 7.7, B4 Theorem 3.9, B3 §3.B Theorem 3.15, B5): not in the manifest. The previous round's `sources fetch` found no legal copy, and I did not retry, since this review edits no manifest. B3's step 3 no longer relies on the citation: it is proved in the text and checked by computation above.
- **Cohen, GTM 138, §§5.2 and 5.6** (B2, B5, B7): recorded as uncertified; not read.
- **Cassels.** *Rational Quadratic Forms*, Chapter 13 (B4, B6), and *An Introduction to the Geometry of Numbers*, Chapter VIII (2F): not in the cache; not read.
- **Conway–Sloane, the mass formula paper** (B8): waived. **Kawauchi–Kojima** (1G): uncertified.
- No passage changed this round cites a new source.

## Source issues

- none
