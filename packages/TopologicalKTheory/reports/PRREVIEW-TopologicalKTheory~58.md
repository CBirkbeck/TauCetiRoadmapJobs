# Review of TopologicalKTheory (pull request #1807 at 88b5f6b)

**Verdict:** needs changes

This is an incremental re-review of the 110 lines changed in this folder since a45c4d6. The change removes T2.5's `adamsValueOfLambdaSeries` with its two proved theorems, and T4.4's `exists_continuous_inside_projection`, from `Suggested.lean`, and restates both in README prose. Both rewrites are correct, and the new docstring matches the file. Two findings remain. Both are carried from the previous review, and both need edits outside `TauCetiRoadmap/TopologicalKTheory/`:
- R01 (P2): DGFloerPartII still owns O, SO, the stable range and π_i(SO) at its head.
- R02 (P3): AlgebraicTopology's two sentences about this roadmap are unchanged.

## R01 (P2) — DGFloerPartII still owns O, SO, their stable range and π_i(SO), which T7.1 owns

This carries the previous R01, which is not repaired.

- **Location.**
  - `TauCetiRoadmap/TopologicalKTheory/README.md` lines 208–213: "T7.1 owns the stable orthogonal and special orthogonal groups O and SO … the stable range of those inclusions, the stable homotopy groups π_i(O) and π_i(SO)".
  - The same objects at README lines 1515–1530 and 1750–1757, and `Suggested.lean` line 56.
- **Claim.** This roadmap is the right owner: it is on main, so an open roadmap that also owns these objects cites it. The description says DGFloerPartII 4.2a–4.2c "are to cite T7.1". The DGFloerPartII head has not changed since the previous review, so the objects still have two owners.
- **Witness.** DGFloerPartII at 43d9b63, which `roadmaps list` confirms is its head:
  - README line 71 claims "the stable orthogonal and special orthogonal groups with the finite-to-stable range (4.2a)"; `### 4.2a` is at line 1583, and the range is proved at lines 1607–1619.
  - README line 2238 says TopologicalKTheory "precedes this roadmap in the direction of supply", but no line cites T7.1.
  - `Suggested.lean` lines 362–395 still state `bijective_map_soBlockInclusion`, `surjective_map_soBlockInclusion`, `subsingleton_pi_SO_of_stable`, `nonempty_pi_SO_mulEquiv_zmod_two` and `nonempty_pi_SO_mulEquiv_int`.
- **Repair.** The same as the previous review's R01, in DGFloerPartII (#1799, same author):
  1. 4.2a cites TopologicalKTheory T7.1 for O, SO, the finite-stage block inclusions and the stable range. 4.2c cites T7.1 for π_i(O) and π_i(SO).
  2. Its `Suggested.lean` drops the five theorems above. This file's `nonempty_homotopyGroup_orthogonalGroup_mulEquiv` states their content.
  3. U, Sp, the Clifford chain and the Morse-theoretic Bott maps stay in DGFloerPartII, together with their comparison to T7.1's eightfold equivalence.
  4. The description of #1799 names #1807 as a dependency.

  Nothing in this folder changes.
- **Tested.** Nothing is lost by the repair. For k ≥ 1, π_k at 1 is the same for SO(m) and O(m), since SO(m) is the open identity component. With k = j+1, DGFloerPartII's three π_(j+1)(SO(m)) statements (j+3 ≤ m) match this file's table, whose `rfl` values are recomputed below:

  | j mod 8 | k mod 8 | DGFloerPartII | this file |
  |---|---|---|---|
  | 1, 3, 4, 5 | 2, 4, 5, 6 | trivial | `ZMod 1` |
  | 0, 7 | 1, 0 | ℤ/2 | `ZMod 2` |
  | 2, 6 | 3, 7 | ℤ | `ZMod 0` |

  A search of this README for `DGFloer` is empty, so a citation from DGFloerPartII to T7.1 creates no cycle.

## R02 (P3) — AlgebraicTopology still says T1.6d cites the cofibration-tower equivalence, and that only T1.5 consumes the fibration sequence

This carries the previous R02, which is not repaired.

- **Location.** `TauCetiRoadmap/AlgebraicTopology/README.md`:
  - lines 1027–1028: "Own the cofibration-tower homotopy equivalence (the target TopologicalKTheory T1.6d cites as cofibrationTowerHomotopyEquivalence)";
  - line 1628: "TopologicalKTheory T1.5 consumes the based homotopy sequence".
- **Claim.**
  - No section of this README cites the tower equivalence.
  - T7.1 uses Stage 5.5's sequence twice: in the stable-range route and in the loop comparisons. README lines 130–131 already say the sequence is "used by T1.5 and T7.1".
- **Witness.**
  - `grep cofibrationTower TauCetiRoadmap/TopologicalKTheory/README.md` is empty.
  - `grep -n "Stage 5.5"` finds lines 130, 432 (T1.5a), 1528 and 1569 (T7.1).
  - Six commits on this branch touch AlgebraicTopology's README (the latest is edec751), and none changes either sentence.
- **Repair.**
  1. At lines 1027–1028, either replace the parenthesis by "(the target DGFloerPartII cites as cofibrationTowerHomotopyEquivalence)" or drop it.
  2. At line 1628, write "TopologicalKTheory T1.5 and T7.1 consume the based homotopy sequence".
  3. Keep both edits when this pull request is rebased onto main's AlgebraicTopology.
- **Tested.** After the edit, every AlgebraicTopology sentence that names a TopologicalKTheory section matches a citation in this README:
  - lines 138 and 154 (T1.5, T1.6);
  - lines 1098–1099 (T7.0, `basedHomotopyInverseOfEquivalence`, this README line 1441);
  - lines 1106–1107 (`cwProductKelley`, this README line 1432);
  - and the two repaired lines.

## Previous findings

- R01 — not repaired: DGFloerPartII at 43d9b63 (unchanged head) README line 71 still owns "the stable orthogonal and special orthogonal groups with the finite-to-stable range (4.2a)", and its `Suggested.lean` lines 362–395 still state the five theorems. Carried as R01.
- R02 — not repaired: AlgebraicTopology README lines 1027–1028 still read "the target TopologicalKTheory T1.6d cites as cofibrationTowerHomotopyEquivalence"; line 1628 still names only T1.5. Carried as R02.

## Verified sound

**Gate and tooling at 88b5f6b.**
- **Gate.** Re-run with `--base origin/main`, every check is 0 except `outside-folder=26`.
  - The 26 files are the two files of each of the 13 other folders that the brief names as this pull request's own.
  - The brief's filtered `git diff --stat origin/main...HEAD` is empty (exit 0), so there is no change outside them.
  - The worker's gate on this head passed every check, including `build=0`.
- **Dependency check.** `gate --depcheck … --movable --content … --pr 1807` printed `depcheck: 236 roadmaps, 2151 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/TopologicalKTheory/Suggested.lean` exits 0 in 4.6 s. The only warning is `declaration uses 'sorry'` at 56:8.
  - Imports: `public import Mathlib` only. The removed `TauCeti.RingTheory.PowerSeries.Log` import is no longer needed, because nothing in the file uses it.
  - No `set_option`, no `lemma`, no sorry'd data, no `example`.
- **Signatures.** A scratch copy with `#check @nonempty_homotopyGroup_orthogonalGroup_mulEquiv` gives the type in the tool's `signatures.md`: `∀ (i n : ℕ), i + 3 ≤ n → Nonempty (HomotopyGroup.Pi (i + 1) ↥(Matrix.orthogonalGroup (Fin n) ℝ) 1 ≃* Multiplicative (ZMod (![2,2,1,0,1,1,1,0] ⟨(i+1) % 8, _⟩)))`.
  - This is unchanged from a45c4d6, and its generality equals README lines 1754–1757 (i ≥ 1, n ≥ i+2).
  - It has no section variables.
- **Dropped scope.** The change drops `open scoped Matrix.Norms.Operator`, and the statement still means the same thing. With no scope open, `rfl` proves two facts in the scratch copy:
  - the topology on `Matrix (Fin n) (Fin n) ℝ` is `Pi.topologicalSpace`;
  - the topology on `↥(Matrix.orthogonalGroup (Fin n) ℝ)` is `instTopologicalSpaceSubtype`.

  These are the same topologies the previous review found under the scope.
- **Padding probe.** On the scratch copy:
  - `simp` leaves the goal unsolved;
  - `infer_instance` fails to synthesize `Nonempty`;
  - `aesop` fails after exhaustive search;
  - `exact?` finds only the sorried copy itself.

  The theorem is a headline, not padding.
- **Table.** `rfl` confirms the values at `(i+1) % 8` for i = 0, 1, 2, 3, 4, 5, 6, 7, 8, 10: 2, 1, 0, 1, 1, 1, 0, 2, 2, 0.
- **Citations.** `roadmaps resolve` lists nothing missing.

**The changed docstring** (`Suggested.lean` lines 5–42).
- It now says the file states headline theorems "each with `sorry`", with no "few definitions they need". That is true: the file has one declaration, a sorried theorem.
- The "Also stated" paragraph is gone, along with the declarations it named. This also resolves the previous review's remark that T2.5's definition and T4.4's projection were neither headlines nor needed definitions.
- The description's sentence "Its Suggested.lean states π_k(O(n)) for n ≥ k+2" matches `hn : i + 3 ≤ n` with k = i+1.

**The changed README passages, and the library declarations they cite at the Tau Ceti pin** (2fd255d997):
- **T2.5 (lines 952–980).**
  - `PowerSeries.logDeriv` is at `RingTheory/PowerSeries/Log.lean:73`, under `variable {A} [CommRing A] [Algebra ℚ A]` (:68). Its body is `d⁄dX (logOf f)`.
  - `PowerSeries.logDeriv_mul` (:89) has the type `(f : A⟦X⟧) (hf : constantCoeff f = 1) : logDeriv f * f = d⁄dX f`.
  - So for a unit u with constant coefficient 1 over a ℚ-algebra, u'·u⁻¹ = logDeriv u. The README's hypotheses (a ℚ-algebra, constant coefficient 1) are exactly those of the lemma.
  - Additivity needs only commutativity: (uv)'(uv)⁻¹ = (u'v+uv')u⁻¹v⁻¹ = u'u⁻¹ + v'v⁻¹. The README says "over a commutative ring", by Leibniz.
  - Mathlib at the pin has no `PowerSeries.logDeriv`, so there is no name clash.
- **T4.4 (lines 1096–1114).** The prose states what the removed Lean theorem stated: hypotheses (a continuous family of finite complex matrices, no eigenvalue on the unit circle, a compact base) and conclusion (continuous, idempotent, commuting, the identity on the generalized eigenvectors for eigenvalues inside the circle and zero outside).
  - The generalized eigenspaces span ℂⁿ, so these conditions fix P uniquely.
  - `TauCeti.isLocallyConstant_finrank_range`, `TauCeti.rangeVectorBundle` and `TauCeti.rangeProdRangeOneSubHomeomorph` are unchanged context, cited as before.
- **Removed names.** Nothing cites a removed Lean name.
  - `roadmaps grep` over main and the 439 open heads finds `adamsValueOfLambdaSeries` and `exists_continuous_inside_projection` only in this roadmap's own versions: main, and the later #1854, which this description orders after this pull request.
  - No other roadmap cites either name.
  - RefinedTraceMethods (line 2459, 2483) and HomotopySpheres (lines 1365, 1493, 3333) cite "TopologicalKTheory T2.5" for the Adams operations, which this change keeps.
- **Ownership of the T2.5 coefficient.** A `roadmaps grep` for the unit-derivative/λ_t-logarithmic-derivative wording finds only this roadmap.

**Seeded sample.** The diff touches neither target.
- **T2.0** (README lines 858–872) was re-read against `hatcher-vbkt` lines 1515–1549 (printed pp. 39–40):
  - stable isomorphism (line 1517);
  - Proposition 2.1 and the finite trivial complements in its proof (lines 1522–1531);
  - cancellation over a compact base (lines 1535–1537);
  - formal differences with `E₁−E₁′=E₂−E₂′` iff `E₁⊕E₂′≈_s E₂⊕E₁′`, transitivity needing compactness (lines 1540–1545).

  The theorem, page, hypotheses and the README's paracompact variant with an arbitrary common summand are supported as stated.
- **T7.0** (README lines 1420–1445) is untouched. It rests on `sibson-1969`, which is uncertified, and its rows are carried below.

**Headline theorems** (README summary and T4–T7), unchanged:
- complex Bott periodicity and `K(S²)=ℤ[β]/(β²)` (T4): not statable, named;
- complex Thom (T5.3): not statable, named;
- equivariant Thom and `R(G)≃K_(G,c)(V)` (T6): not statable, named;
- real Bott periodicity:
  - the homotopy-group form on O(n) (T7.1): stated;
  - the KO form, its coefficient ring, (1,1)-periodicity and `ℤ×BO→Ω⁸(ℤ×BO)` (T7.1): not statable, each named with its missing carrier.

T2.5's Adams operations and T4.4's projector are route lemmas, not headlines, so taking them out of `Suggested.lean` is correct.

**Overlaps.**
- #1808 and #1854 also change this folder. The description fixes the order: this pull request → #1808 → #1854.
- GeneralizedCohomology G4.0b, cited at README line 151, is defined at this pull request's own head (GeneralizedCohomology line 2982). The tool's "only an open revision defines" lead is satisfied.
- No id this README cites is dropped, and this pull request drops no cited id.

**Adversarial table.** The first block is carried from the previous reviews (r57, and r56 where r57 carried it) for statements the diff leaves untouched. The second block was computed at this head for every changed statement.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| T2.0 group completion (r56) | `X=∅`; `pt`; `ℕ` discrete | zero ring; ℤ; `ℤ^ℕ` | agrees |
| T7.0 shear (r56) | `π₁(BO×BO)=(ℤ/2)²` | `[[1,0],[1,1]]`, det 1 | bijective |
| T7.0 complement class (r56) | `k=0`, `N`, general | `0`; `0`; `γ⊕γ^⊥≅1^N` gives 0 | agrees |
| O/SO Checks 1–2 (r56) | `n=0,1`; `diag(A,−1)` | `|O(1)|=2`; `1↦diag(1,…,−1)≠1` | as stated |
| Loop comparison Checks (r56) | `i=0`; `n=2` conjugation; `i=3` inversion | `−1∈O(1)`; `w₃diag(1,A)w₃=diag(w₂Aw₂,1)`; `−1` on ℤ | as stated |
| ℝ^(p,q) spheres, KR Check 1, β_R restriction (r56) | `(1,0),(0,1),(1,1),(2,0)`; `pt`; Möbius | swapped/fixed/2 fixed/free; ℤ vs ℤ²; η≠0 | agrees |
| Complexification, `a_(−1)…a_(−4)`, `a_3`, `η²`, `c(a)`, `c(b)` (r56) | `q=1,0,−1,−2,3,−3,2,4,8` | `0,0,0,ℤ`; `a_3=0`; η² generates ℤ/2; `±2u²`; iso | agrees |
| Ring relations, `r` values, symbols A, B, dimensions, volume element (r56) | as in r56 | `a²=4b`; `r(u²)=a`, `r(u⁴)=2b`; `AB+BA=0`; `256=256`; `ω²=1` | agrees |
| T1.5a degree, T1.6c signs, T5.2 relation (r56) | `m=1,2`; `k=1,2,3`; `r=2` | `2, 0`; `+,−,−`; `(t−1)(t−[M])` | agrees |
| Stable range, O (r57) | `(i,n)=(0,1),(0,2),(1,2),(1,3),(3,4),(3,5),(4,5),(4,6)` | `{±1}→ℤ/2` bij.; bij.; `ℤ→ℤ/2` onto, kernel 2ℤ; `ℤ/2≅ℤ/2`; `ℤ²→ℤ` onto; `ℤ≅ℤ`; `ℤ/2→0` onto; `0≅0` | onto at n=i+1, bijective at n≥i+2 |
| Stable range, SO (r57) | `(0,1)`, `(1,2)`, `(1,3)` | `pt→pt`; `ℤ→ℤ/2` onto; `ℤ/2≅ℤ/2` | as stated |
| Fibre of g↦g·e_n; sections over S^n∖{±e_n} (r57) | `n=1`; `s=I+K+K²/(1+c)`; `x↦s(−x)R` | `{I,diag(−1,1)}=ι₁(O(1))`; `s(x)e_n=x`; `s(−x)R e_n=x` | as stated, n≥1 |
| LES degrees; winding-one loop; i=3 Check (r57) | `n=2,i=1`; `SO(2)→SO(3)`; `SO(4)→SO(5)` | boundary 2; `1↦1`, `2↦0`; `ℤ²→ℤ` onto, kernel ℤ | as stated |
| T1.5a vs Tau Ceti π₁(SO(n)) (r57) | `n=3`; `SO(2)→SO(3)→S²` | `ℤ/2`; `ℤ→ℤ→ℤ/2→0`, boundary 2 | consistent |
| Coefficient sentence (r57) | `i=1,…,8` | `a_(i+1)` = ℤ/2, 0, ℤ, 0, 0, 0, ℤ, ℤ/2 = π₁…π₈(O) | matches |
| Real space / Real pair (r57) | `ℝ^(1,1)=ℂ`; `(B^(8,8),S^(8,8))`; `Y×{±1}` | Real space; compact pair; `KR=K(Y)` | covers every use |
| **T2.5 coefficient c_n(u)=(−1)ⁿ·[tⁿ](u'u⁻¹), line** | `u=1+Lt`, n=0,1,2 | `u'u⁻¹=Σ(−1)ʲL^(j+1)tʲ`, so c_n=`L^(n+1)`: `L, L², L³` = ψ¹,ψ²,ψ³ of a line | index and sign as pinned |
| same, wrong sign model | drop `(−1)ⁿ`, `u=1+Lt`, n=1 | `−L²` ≠ ψ²(L)=`L²` | excluded by the stated sign |
| same, Newton at n=1 | `u=1+λ¹t+λ²t²` | `u'u⁻¹=λ¹+(2λ²−(λ¹)²)t+…`; c₁=`(λ¹)²−2λ²`=N₂ | agrees with Newton |
| same, additivity | `(1+Lt)(1+Mt)`; constant unit `c` | `L^(n+1)+M^(n+1)`; `(cu)'(cu)⁻¹=u'u⁻¹`, c contributes 0 | additive on all units |
| same vs `PowerSeries.logDeriv` (ℚ-algebra) | `u=1+Lt`; `u=2` | `logOf=Σ(−1)^(k−1)Lᵏtᵏ/k`, derivative coefficient `(−1)ⁿL^(n+1)`, equal; constant 2 is outside `hf : constantCoeff f = 1` | hypothesis needed and stated |
| **T4.4 projector P (prose)** | `n=0`; `B=0`; `B=2·1`; `diag(0,2)`; nilpotent `[[0,1],[0,0]]` | empty; `1`; `0`; `diag(1,0)`; `1` | as stated |
| same, non-normal | `B=[[1/2,1],[0,2]]`, eigenvectors `e₁`, `(2,3)` | `P=[[1,−2/3],[0,0]]`, `P²=P`, `PB=BP=[[1/2,−1/3],[0,0]]` | P is idempotent and commutes with B, but is not an orthogonal projection |
| same, wrong model | orthogonal projection onto `span e₁` | `(2,3)↦(2,0)≠0` | excluded by "zero on those outside" |
| same, excluded data | `B=i·1`, `B=diag(1,0)` | eigenvalue on the circle | hypothesis excludes them |
| **`nonempty_homotopyGroup_orthogonalGroup_mulEquiv`** (statement unchanged, scope dropped) | `(i,n)=(0,3),(1,4),(2,5),(3,6),(4,7),(5,8),(6,9),(7,10),(8,11),(10,13)` | Lean `rfl` table `2,1,0,1,1,1,0,2,2,0`; true groups π₁(O(3))=ℤ/2, π₂=0, π₃=ℤ, π₄=π₅=π₆=0, π₇=ℤ, π₈=ℤ/2, π₉=ℤ/2, π₁₁=ℤ | agree |
| same, boundary | `(0,2)`, `(2,4)`, `(3,5)` | `π₁(O(2))=ℤ`, `π₃(O(4))=ℤ²`, `π₄(O(5))=ℤ/2` (stable 0) | `hn` excludes each |
| same, topology after dropping `Matrix.Norms.Operator` | `rfl` probes | `Pi.topologicalSpace`; subtype topology | as in README lines 1501–1502 |
| **Docstring, first paragraph and "not statable" list** | file contents | one sorried theorem; no KO, KR, BO, tensor product or compact-support carriers at the pins (r57 searches) | true |

**Remarks on untouched text** (no change requested):
- **Sphere connectivity at the pin.** T7.1 (README lines 1527–1528) takes π_j(S^n)=0 for j<n from T1.5a at r=1. The pinned Tau Ceti already has this:
  - `TauCeti.subsingleton_homotopyGroup_sphere_of_lt` (`AlgebraicTopology/Sphere/HomotopyGroup.lean:66`, Hatcher Corollary 4.9) states it for the unit sphere of any real normed space of dimension n+1;
  - DGFloerPartII cites it at its line 1614.

  T1.5a's r=1 case could consume it.
- **No Checks for the T2.5 coefficient.** T2.5 has no **Checks.** list for the signed unit-derivative coefficient, as before this change. Three Checks are available from the rows above: the line 1+Lt, the dropped-sign model and Newton at n=1.
- **Missing spaces.** These are spread through untouched text: "it is1 … and0" (line 1099), "constant1" (lines 939, 960), "rank0" (lines 633–672, 978), "index0" (line 984).
- **Merge with main.** `git merge-tree` against main 5fc1aa8 reports conflicts in both files of this folder. Main has #1781's revision, and the branch last merged main at eaf17b1. The rebase belongs to the worker.
- **Sources manifest** (the board package, outside this folder). The `hatcher-vbkt` locator still reads "§1, §§2.2–2.3". It records neither §2.1 (T2.0) nor the Introduction, p. 1, and §4.1, p. 108 (T7.1). There is still no key for Atiyah's *K-theory and reality*.

## Not verifiable

- **Atiyah, *K-theory and reality* (1966).** It is cited for §2 and Theorem 3.10 (README lines 1626, 1707, 1887). The text is untouched, and the previous reviews found no legal copy. The section and theorem numbers remain unchecked.
- **Settled as uncertified and cited by locator** (not read): `sibson-1969`, which is behind the seeded T7.0; `abs-1964`, `atiyah-bott-1964`, `husemoller-fibre-bundles`, `atiyah-1968-bott-index` and `eschenburg-hanke-bott`.
- **Ownership against open pull requests** was checked through the sibling checkouts and `roadmaps grep` only.

## Source issues

- none
