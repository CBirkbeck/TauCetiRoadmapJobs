# Review of TopologicalKTheory (pull request #1807 at a45c4d6)

**Verdict:** needs changes

This is an incremental re-review of the 125 lines changed in this folder since 7408995. The previous review's R01, R03 and R04 are repaired. Two findings remain, both carried from that review, and both need edits outside `TauCetiRoadmap/TopologicalKTheory/`:
- R01 (P2): DGFloerPartII still owns O, SO, the stable range and π_i(SO) at its head.
- R02 (P3): AlgebraicTopology's two sentences about this roadmap are unchanged.

## R01 (P2) — DGFloerPartII still owns O, SO, their stable range and π_i(SO), which T7.1 owns

This re-raises the previous R02, which is only partly repaired.

- **Location.**
  - `TauCetiRoadmap/TopologicalKTheory/README.md` lines 208–212: "T7.1 owns the stable orthogonal and special orthogonal groups O and SO … the stable range of those inclusions, the stable homotopy groups π_i(O) and π_i(SO)".
  - The same objects at README lines 1513–1530 and `Suggested.lean` line 130.
- **Claim.** This roadmap is the right owner:
  - It is on main.
  - On main it took these objects from HomotopySpheres, which is not on main and may not be cited.

  The description now has the sentence the previous review asked for: DGFloerPartII 4.2a–4.2c and HomotopySpheres §4A–4B "are to cite T7.1". But the DGFloerPartII head has not changed since that review. It still owns the same carriers and the same theorem, and states them in Lean, so the objects still have two owners.
- **Witness.** DGFloerPartII at 43d9b63:
  - README line 71 claims "the stable orthogonal and special orthogonal groups with the finite-to-stable range (4.2a)"; its `### 4.2a` is at line 1583.
  - `Suggested.lean` lines 362–395 state `bijective_map_soBlockInclusion` (`i + 2 ≤ n`), `surjective_map_soBlockInclusion` and three π_(j+1)(SO(m)) values for `j + 3 ≤ m`.
- **Repair.** In DGFloerPartII (#1799, same author):
  1. 4.2a cites TopologicalKTheory T7.1 for O, SO, the finite-stage factorization and the stable range. 4.2c cites T7.1 for π_i(O) and π_i(SO).
  2. Its `Suggested.lean` drops `bijective_map_soBlockInclusion`, `surjective_map_soBlockInclusion`, `subsingleton_pi_SO_of_stable`, `nonempty_pi_SO_mulEquiv_zmod_two` and `nonempty_pi_SO_mulEquiv_int`. This file's `nonempty_homotopyGroup_orthogonalGroup_mulEquiv` states them.
  3. U, Sp, the Clifford chain and the Morse-theoretic Bott maps stay in DGFloerPartII, together with their comparison to T7.1's eightfold equivalence.
  4. The description of #1799 names #1807 as a dependency.

  Nothing in this folder changes. HomotopySpheres is another author's pull request, so its own review holds it to the description's sentence.
- **Tested.**
  - **No statement is lost.** For k ≥ 1, π_k at 1 is the same for SO(m) and O(m), since SO(m) is the identity component. With k = j+1, DGFloerPartII's values match this file's table:

    | j mod 8 | k mod 8 | DGFloerPartII | this file |
    |---|---|---|---|
    | 1, 3, 4, 5 | 2, 4, 5, 6 | trivial | `ZMod 1` |
    | 0, 7 | 1, 0 | ℤ/2 | `ZMod 2` |
    | 2, 6 | 3, 7 | ℤ | `ZMod 0` |

  - **No cycle.** A search of this README for `DGFloer` is empty, so a citation from DGFloerPartII to T7.1 creates no cycle.

## R02 (P3) — AlgebraicTopology still says T1.6d cites the cofibration-tower equivalence, and that only T1.5 consumes the fibration sequence

This re-raises the previous R05, which is not repaired.

- **Location.** `TauCetiRoadmap/AlgebraicTopology/README.md`:
  - lines 1027–1028: "Own the cofibration-tower homotopy equivalence (the target TopologicalKTheory T1.6d cites as cofibrationTowerHomotopyEquivalence)";
  - line 1628: "TopologicalKTheory T1.5 consumes the based homotopy sequence".
- **Claim.**
  - No section of this README cites the tower equivalence.
  - T7.1 uses Stage 5.5's sequence twice: in the new stable-range route (README line 1526) and in the loop comparisons (line 1567). README lines 130–131 already say the sequence is "used by T1.5 and T7.1".
- **Witness.**
  - `grep cofibrationTower TauCetiRoadmap/TopologicalKTheory/README.md` is empty.
  - DGFloerPartII at 43d9b63 cites the equivalence at lines 521, 1770 and 1810.
  - Main's AlgebraicTopology, after #1652, lists only "(MorseTheory, DGFloerPartII)" as its consumers (line 4636).
- **Repair.**
  1. At lines 1027–1028, either replace the parenthesis by "(the target DGFloerPartII cites as cofibrationTowerHomotopyEquivalence)" or drop it.
  2. At line 1628, write "TopologicalKTheory T1.5 and T7.1 consume the based homotopy sequence".
  3. Keep both edits when this pull request is rebased onto main's Layer form of AlgebraicTopology.
- **Tested.** After the edit, every AlgebraicTopology sentence that names a TopologicalKTheory section matches a citation in this README:
  - Stage 5.5: this README's lines 130, 432 (T1.5a), 1526 and 1567 (T7.1).
  - `basedHomotopyInverseOfEquivalence` (AlgebraicTopology line 1098): this README line 1439.
  - `cwProductKelley` (AlgebraicTopology line 1106): this README line 1430.
  - `homotopyGroupKelleyProduct`: this README line 1431.

## Previous findings

- R01 — repaired: `Suggested.lean` line 130 states `nonempty_homotopyGroup_orthogonalGroup_mulEquiv (i n : ℕ) (hn : i + 3 ≤ n)`. README lines 1513–1530 add the stable range. Docstring lines 32–37 name the KO, KR and `BO` forms as not statable.
- R02 — partly repaired: the description now sends DGFloerPartII 4.2a–4.2c and HomotopySpheres §4A–4B to T7.1. DGFloerPartII at 43d9b63 still owns "the finite-to-stable range (4.2a)" (line 71) and its `Suggested.lean` lines 362–395. Carried as R01.
- R03 — repaired: docstring lines 23–27: "the tautological line on `TauCeti.finiteGrassmannian ℂ 1 2 ≅ ℂP¹` is an object of it by `TauCeti.FiniteRankBundleCore.ofBundle`; but the category has no tensor product".
- R04 — repaired: README lines 1590–1592: "A Real space is a locally compact Hausdorff space X with a continuous involution τ, and a Real pair is a compact Real space with a closed τ-invariant subspace."
- R05 — not repaired: AlgebraicTopology README lines 1027–1028 still read "the target TopologicalKTheory T1.6d cites as cofibrationTowerHomotopyEquivalence", and line 1628 still names only T1.5. Carried as R02.

## Verified sound

**Gate and tooling at a45c4d6.**
- **Gate.** Re-run with `--base origin/main`, every check is 0 except `outside-folder=26`.
  - The 26 files are the two files of each of the 13 other folders that the brief names as this pull request's own.
  - The brief's filtered `git diff --stat` is empty (exit 0), so this is not a finding.
  - The worker's gate on this head passed with `build=0`.
- **Dependency check.** `gate --depcheck … --movable --content … --pr 1807` printed `depcheck: 234 roadmaps, 2127 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/TopologicalKTheory/Suggested.lean` exits 0. The only warnings are `declaration uses 'sorry'` at 111:8 and 130:8.
  - Imports: `public import Mathlib` and `TauCeti.RingTheory.PowerSeries.Log`.
  - No `set_option`, no `lemma`, no sorry'd data.
- **Signatures.** A scratch copy with `#check @` of all five declarations elaborated. The types are those in the tool's `signatures.md`; nothing changed.
  - The four older declarations match README T2.5 and T4.4, as in the previous review. `[CompactSpace X]` and the circle hypothesis are kept on `exists_continuous_inside_projection`.
  - The new theorem has the type `∀ (i n : ℕ), i + 3 ≤ n → Nonempty (π_ (i + 1) ↥(Matrix.orthogonalGroup (Fin n) ℝ) 1 ≃* Multiplicative (ZMod (![2,2,1,0,1,1,1,0] ⟨(i+1) % 8, _⟩)))`. Its generality equals the README's sentence at lines 1751–1755: degree i≥1, n≥i+2, on `Matrix.orthogonalGroup (Fin n) ℝ`. It has no section variables.
- **Padding probe on the new theorem.** On a scratch copy, `simp`, `infer_instance`, `aesop`, `exact?` (in a file containing no other copy) and `rfl` all fail. It is a headline, not padding.
- **Table and topology probes.**
  - `rfl` confirms the table values at `(i+1) % 8` for i = 0, 1, 2, 3, 6, 7, 8, 10. The values are 2, 1, 0, 1, 0, 2, 2, 0.
  - `rfl` also confirms that, under `open scoped Matrix.Norms.Operator`, the topology on `Matrix (Fin n) (Fin n) ℝ` is `Pi.topologicalSpace`. So `O(n)` carries the subspace topology of the matrix space, as README line 1500 says.
- **Citations.** `roadmaps resolve` lists nothing missing.

**Library declarations opened at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d997):
- **Tau Ceti `TauCeti.specialOrthogonalGroupFundamentalGroupMulEquiv`** (`Topology/Algebra/CliffordAlgebra/Spin/UniversalCover.lean:237`).
  - Type: `(n : ℕ) (hn : 3 ≤ n) : FundamentalGroup (Matrix.specialOrthogonalGroup (Fin n) ℝ) 1 ≃* Multiplicative (ZMod 2)`.
  - It is built through the compact Spin group as universal cover. Its generator is described at :247.
  - This matches the new supplier bullet (README lines 123–127) and the new T1.5a sentence (lines 447–451), including "proved through the Spin double cover" and the bound n≥3.
- **Tau Ceti `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`** (`Topology/Homotopy/SerreFibration/FiberBundle.lean:365`).
  - Its hypothesis is `∀ b, ∃ e : Trivialization F p, b ∈ e.baseSet`, for `E B : TopCat.{u}` and any topological fibre `F`.
  - The two charts of the stable-range route supply exactly this.
- **Tau Ceti carriers in the rewritten docstring:** `TauCeti.finiteGrassmannian` (`Topology/Grassmannian/Basic.lean:52`), `finiteGrassmannian.Tautological` (`Grassmannian/Tautological.lean:143`) and `FiniteRankBundleCore.ofBundle` (`VectorBundle/FiniteRank/Basic.lean:209`).
- **Mathlib:**
  - `HomotopyGroup.Pi` (`Topology/Homotopy/HomotopyGroup.lean:460`) and its `group` instance (:550), which needs `Nonempty N`; this holds for `Fin (i+1)`.
  - `Matrix.orthogonalGroup` (`LinearAlgebra/UnitaryGroup.lean:318`) and `Matrix.specialOrthogonalGroup` (:338).
- **Duplication at the pins.**
  - Neither pin has a homotopy group of an orthogonal group beyond π₁(SO(n)). Searching for `HomotopyGroup`/`π_` together with `orthogonalGroup` finds nothing in either library.
  - Neither pin has a stable Grassmannian or a KR group.
  - Tau Ceti's `LinearAlgebra/CliffordAlgebra/BottPeriodicity.lean` is algebraic Clifford (1,1)-periodicity, not topological.
  - So the new theorem is not at the pins. Its i=0 case agrees with the pinned SO(n) value, which is more special. This also confirms the docstring's three "not statable" bullets.

**Sources at the new locators** (`hatcher-vbkt`, printed page = PDF page − 4):
- **Introduction, p. 1** (`hatcher-vbkt` lines 97–102): the table of reduced KO of Sⁿ for n mod 8 = 1, …, 8 is ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, ℤ. Then π_k(O) = KO~(S^(k+1)) gives the README's and the docstring's table for k ≡ 0, …, 7. This supports README line 1755 and the docstring at line 128.
- **§4.1, p. 108** (`hatcher-vbkt` lines 4145–4146 for the heading, line 4168 for the claim): π_i(O(n)) is independent of n for n > i+1, that is n ≥ i+2. This supports README line 1515 and docstring line 129. The "onto at n=i+1" half is the README's own route, recomputed below.

**Cross-roadmap citations in the changed passages, resolved at this head:**
- AlgebraicTopology Stage 5.5 is Stage 5 item 5 (lines 1456–1461): "Own the fibration homotopy long exact sequence, including components", on native `TauCeti.TopCat.serreFibrations`. It is cited at README lines 1526 and 1567.
- T1.5a at r=1 gives π_j(S^m)=0 for j<m (README line 433: "(m−1)-connectivity … For r=1 the space is S^m").
- **Consumers of T7.1 in this pull request.** GeneralizedCohomology lines 398–403, 3613–3616 and 3888 consume T7.1's eightfold equivalence and the coefficient ring. Both are still owned here: the coefficients and ring relations at README lines 1733–1771, the eightfold equivalence from line 1792.

**Ownership.**
- T7.1 owns O, SO, the stable range and π_i(O). The roadmap is on main, and main's version took these from HomotopySpheres, which may not be cited.
- `roadmaps grep` over main and the 435 open heads, for `orthogonalGroup (Fin` in Lean and for the stable-range wording in READMEs, finds only:
  - this roadmap;
  - IntegralLattices' volume carriers, which are unrelated;
  - TeichmullerGeometry's `O(3)` surjectivity, which is unrelated;
  - HomotopySpheres and DGFloerPartII, see R01.

**Overlaps.**
- #1808 and #1854 also change this folder, and the description fixes the order: this pull request → #1808 → #1854.
- GeneralizedCohomology G4.0b (README line 151) is defined at this pull request's own head (GeneralizedCohomology lines 2832–2954), so the tool's "only an open revision defines" lead is satisfied.
- No id this README cites is dropped by an open pull request, and this pull request drops no cited id.

**Seeded sample.** The diff touches neither target.
- **T2.0** (lines 858ff) was re-read against `hatcher-vbkt` lines 1522–1547 (printed pp. 39–40):
  - formal differences with `E₁−E₁′=E₂−E₂′` iff `E₁⊕E₂′≈_s E₂⊕E₁′` (line 1541–1542);
  - transitivity through cancellation, hence compactness (lines 1535–1545).

  It is supported as the previous review found.
- **T7.0** relies on `sibson-1969`, which is uncertified. Its rows are carried below.

**Headline theorems** (README summary and T4–T7):
- complex Bott periodicity and `K(S²)=ℤ[β]/(β²)` (T4): not statable, and named with the corrected reason;
- complex Thom (T5.3): not statable, named;
- equivariant Thom and `R(G)≃K_(G,c)(V)` (T6): not statable, named;
- real Bott periodicity:
  - the homotopy-group form on O(n) (T7.1): stated as `nonempty_homotopyGroup_orthogonalGroup_mulEquiv`;
  - the KO form with its coefficient ring, (1,1)-periodicity and `ℤ×BO→Ω⁸(ℤ×BO)` (T7.1): not statable, each named with its missing carrier.

**Adversarial table.** The first block is carried from the previous review (r56), for statements the diff leaves untouched. The second block was computed at this head for every changed statement.

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
| `adamsValueOfLambdaSeries`, `_mul`, `_eq_coeff_logDeriv` (r56) | `1+Lt`, `1+Mt`, `1+t` | `L^(n+1)`; additive; `1=1` | agrees |
| `exists_continuous_inside_projection` (r56) | `diag(0,2)`, nilpotent, `n=0`, `B=1` | `diag(1,0)`; `1`; `0`; excluded | not vacuous |
| T1.5a degree, T1.6c signs, T5.2 relation (r56) | `m=1,2`; `k=1,2,3`; `r=2` | `2, 0`; `+,−,−`; `(t−1)(t−[M])` | agrees |
| **Stable range (README 1513–1530), O** | `(i,n)=(0,1),(0,2),(1,2),(1,3),(3,4),(3,5),(4,5),(4,6)` | `{±1}→ℤ/2` bij.; bij.; `ℤ→ℤ/2` onto, kernel 2ℤ; `ℤ/2≅ℤ/2`; `ℤ²→ℤ` onto; `ℤ≅ℤ`; `π₄(SO(5))=ℤ/2→0` onto; `0≅0` | onto at n=i+1, bijective at n≥i+2; n≥i+1 fails at (1,2), (3,4), (4,5) |
| **Stable range, SO** | `(0,1)`, `(1,2)`, `(1,3)` | `pt→pt`; `ℤ→ℤ/2` onto; `ℤ/2≅ℤ/2` | as stated |
| **Fibre of g↦g·e_n** | `n=1`; general | `{I, diag(−1,1)}=ι₁(O(1))`; last column e_n and unit rows force last row e_n | as stated |
| **Section s over S^n∖{−e_n}** | `s=I+K+K²/(1+c)`, `K=x e_nᵀ−e_n xᵀ`, `c=⟨x,e_n⟩`; `n=1`, `x=(cos θ,sin θ)` | `K(x−c e_n)=−(1−c²)e_n`, so `s(x)e_n=x`; `s(e_n)=I`; defined iff `c≠−1`; rotation by θ−π/2 | continuous section into SO(n+1) |
| **Section over S^n∖{e_n}** | `x↦s(−x)R`; `n=1`, `R=−I`; `n=0` | `s(−x)R e_n=s(−x)(−e_n)=x`; `−I∈SO(2)`; SO(1) has no such R | as stated, hence n≥1 |
| **LES degrees** | `π_(i+1)(S^n)→π_i(O(n))→π_i(O(n+1))→π_i(S^n)`; `n=2, i=1` | both ends 0 for i≤n−2, right end 0 for i=n−1; `ℤ→ℤ→ℤ/2→0` with boundary 2 = `1−(−1)¹` (T1.5a) | bijective / onto as stated |
| **Check: winding-one loop** | `π₁(SO(2))→π₁(SO(3))→π₁(SO)` | `1↦1`, `2↦0` in ℤ/2; then bijective at n=3=i+2 | nonzero, double null; SO(2) alone gives ℤ |
| **Check: i=3** | `SO(4)`, `SO(5)` | `π₃(SO(4))=ℤ²` (S³×S³ cover) `→π₃(SO(5))=ℤ`, kernel ℤ; `π₃(SO(5))≅π₃(O)=ℤ` | onto, not injective; n≥i+1 would give ℤ² |
| **T1.5a: Tau Ceti π₁(SO(n))** | `n=0,1,2,3`; `SO(2)→SO(3)→S²` | `0,0,ℤ` (outside `hn : 3 ≤ n`); `ℤ/2`; `π₂(S²)=ℤ→ℤ→π₁(SO(3))→0` with boundary 2 | the generator is the image of winding one |
| **Coefficient sentence (README 1751–1755)** | `i=1,…,8` | `a_(i+1)` = ℤ/2, 0, ℤ, 0, 0, 0, ℤ, ℤ/2 = π₁…π₈(O) | the table for i≡1,…,7,0 matches |
| **`nonempty_homotopyGroup_orthogonalGroup_mulEquiv`** | `(i,n)=(0,3),(1,4),(2,5),(3,6),(6,9),(7,10),(8,11),(10,13)` | table (Lean `rfl`) `2,1,0,1,0,2,2,0`; true groups π₁(O(3))=ℤ/2, π₂=0, π₃(O(5))=ℤ, π₄(O(6))=0, π₇(O(9))=ℤ, π₈(O(10))=ℤ/2, π₉=ℤ/2, π₁₁=ℤ | agree |
| same, excluded boundary | `(0,2)`, `(2,4)`, `(3,5)`, `(6,8)` | `π₁(O(2))=ℤ`, `π₃(O(4))=ℤ²`, `π₄(O(5))=ℤ/2` (stable 0), `π₇(O(8))=ℤ²` | `hn` excludes each |
| same vs pinned SO(n) | `i=0`, `n≥3` | π₁(O(n),1)=π₁(SO(n),1) (open identity component) ≅ ℤ/2 = `specialOrthogonalGroupFundamentalGroupMulEquiv n hn` | consistent |
| **Real space / Real pair (README 1590–1600)** | `ℝ^(1,1)=ℂ`; `(B^(8,8),S^(8,8))`; `Y×{±1}`, Y compact | locally compact with conjugation, so a Real space; compact pair, so `KR^(8,8)(pt)` is defined; compact, so `KR=K(Y)` | the definitions cover every use |
| **Docstring T4 bullet** | `ofBundle ℂ 1 (Tautological ℂ 1 2)` | elaborates (r56 probe); no monoidal structure in `FiniteRank/*` | clause now true |
| **Docstring "not statable" bullets** | KO relative or negative degree, KR, BO | none at either pin (searches above) | true |

**Remarks on untouched text** (no change requested):
- The docstring's first paragraph (lines 9–11) says the file states headline theorems and the definitions they need. T2.5's `adamsValueOfLambdaSeries`, with its two proved theorems, and T4.4's `exists_continuous_inside_projection` are neither; the docstring lists them as "also stated". The previous review passed them.
- **Merge with main.** This head does not merge cleanly with main 4ec889e: `git merge-tree` reports conflicts in both files of this folder.
  - Main has #1781's revision of this roadmap, merged 2026-11-08, and #1652's Layer-form AlgebraicTopology. The branch last merged main at eaf17b1.
  - The bold target ids of the two README versions are identical.
  - The head's T6.4 carries #1781's principal-bundle material (Mitchell, Kolář–Michor–Slovák), so the conflict is textual.
  - The rebase onto main belongs to the worker. The description already orders #1652 before this pull request.
- **Sources manifest** (it lives in the board package, outside this folder).
  - It has no key for Atiyah's *K-theory and reality*.
  - The `hatcher-vbkt` entry does not record the new locators: the Introduction, p. 1, and §4.1, p. 108, for T7.1.

## Not verifiable

- **Atiyah, *K-theory and reality* (1966).** It is cited for §2 and Theorem 3.10 (README lines 1626, 1707, 1887). The text is untouched since the previous review, which found no legal copy (the DOI landing page returns 403). The section and theorem numbers remain unchecked.
- **Settled as uncertified and cited by locator** (not read): `sibson-1969`, which is behind the seeded T7.0; `abs-1964`, `atiyah-bott-1964`, `husemoller-fibre-bundles`, `atiyah-1968-bott-index` and `eschenburg-hanke-bott`.
- **Ownership against open pull requests** was checked through the sibling checkouts and `roadmaps grep` only.

## Source issues

- **Misprint** in hatcher-vbkt at §4.1, printed p. 108: the section heading reads "Lower Bounds for Im J", while the table of contents and the running heads read "Lower Bounds on Im J"; it should be one title throughout; affects nothing.
