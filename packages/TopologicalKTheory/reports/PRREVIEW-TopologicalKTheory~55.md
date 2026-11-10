# Review of TopologicalKTheory (pull request #1807 at 73914b5)

**Verdict:** needs changes

This is an incremental re-review of the 147 lines changed in `TauCetiRoadmap/TopologicalKTheory/README.md` since ec7b876. Both previous findings are repaired as they were written. Two findings remain:

- R01 is about the supplier that the moved passages now rest on. It partly withdraws the previous report's own repair, which moved the comparisons into T7.1 "which already consumes 4.2a–4.2c" and so left that consumption standing.
- R02 is a consumer sentence in this pull request's AlgebraicTopology folder that the move made stale.

## R01 (P2) — T7 names DGFloerPartII 4.2a–4.2c as a supplier: it is not on main, it now disclaims the consumption, and it lies downstream of this roadmap

- **Location.** `TauCetiRoadmap/TopologicalKTheory/README.md`:
  - Lines 211–216 (changed): "T7 is the only part of this roadmap that consumes 4.2a–4.2c, because GeneralizedCohomology G4.0 consumes T1.5–T1.6 and 4.2a–4.2b consume G4.0b. T7.1 owns the loop comparisons … with 4.2a's `O` and `SO`".
  - Lines 1490–1553 (moved into T7.1): the loop comparisons against "DGFloerPartII 4.2a's stable `O`" and the Ω₇ comparison against "4.2b's Grassmannian member".
  - Lines 1676–1680 (changed), and with them the supplier bullet at lines 196–203 and the untouched T7.1 citations at lines 1555, 1575, 1587 and 1626.
- **Claim.** Three things are wrong with DGFloerPartII as T7's supplier.
  - **It is not on main.** TopologicalKTheory is on main, and a roadmap on main consumes only the pins and roadmaps on main.
  - **The supplier's head no longer agrees.** Since the previous review read it, DGFloerPartII's Downstream consumers paragraph was rewritten: this roadmap consumes nothing from it and precedes it in the direction of supply. The previous report's repair leaned on the earlier sentence that allowed T7 to consume 4.2a–4.2c.
  - **The roadmaps form a loop.** TopologicalKTheory T7 → DGFloerPartII 4.2a–4.2b → GeneralizedCohomology G4.0b → TopologicalKTheory T1.5–T1.6. The sections are acyclic (T1.5–T1.6 → G4.0 → 4.2a–4.2c → T7.1 → G5.0, re-checked at both heads), but no merge order of the three roadmaps satisfies all three edges.

  The dependency check prints `0 problem(s)`. That is a false negative: the citation is prose, not a `*Needs:*` line.
- **Witness.**
  - Main (71c8f21) has no `TauCetiRoadmap/DGFloerPartII`; the roadmap exists only in its own open pull request.
  - DGFloerPartII at 43d9b63, lines 2238–2242: "TopologicalKTheory consumes nothing from this roadmap, in any section. It precedes this roadmap in the direction of supply". Its lines 1626–1627 and 1687 (*Needs:* of 4.2a and 4.2b) name GeneralizedCohomology G4.0b.
  - GeneralizedCohomology at this head, line 3005: G4.0's *Needs:* names "TopologicalKTheory T1.5–T1.6".
- **Repair.** T7 owns its real Bott inputs, and DGFloerPartII is named, if at all, only under Downstream consumers.
  1. **Supplier bullet (lines 196–218).** Delete DGFloerPartII as a supplier. Keep the T1.5–T1.6 ownership sentences. Say that T7.1 owns the stable groups `O` and `SO`, the loop comparisons and real Bott periodicity.
  2. **Stable groups.** In T7.1 define `O` and `SO` as the colimits of Mathlib's `Matrix.orthogonalGroup (Fin n) ℝ` and `Matrix.specialOrthogonalGroup (Fin n) ℝ` along `A↦diag(A,1)`, on AlgebraicTopology Stage 4.5's compactly generated substrate. The loop-comparison paragraph and its three Checks (lines 1490–1537) then stand, with "DGFloerPartII 4.2a's" replaced by "T7.1's".
  3. **Real periodicity.** State the eightfold periodicity that T7.1 uses as a target owned here, with its own locator. Its route may use only inputs owned at or below this roadmap.
     - The Clifford-chain route of lines 1539–1553 and 1585–1596 passes through `Sp(r)` and the quaternionic Grassmannians (the chain members Ω₂–Ω₅). GeneralizedCohomology G4.0b owns those carriers, and GeneralizedCohomology consumes this roadmap, so that route cannot be taken over unchanged.
     - A bundle-level route needs no quaternionic carrier, for example Atiyah's Real K-theory, which extends T4's clutching proof. I did not open that source here, so its locators are the author's to verify.
     - If the route no longer yields "eight stable Bott equivalences read on ℤ×BO", GeneralizedCohomology lines 82, 355–361, 3505–3507 and 3773 change with it. That folder is this pull request's own.
  4. **Dependencies paragraph (lines 1676–1680).** Rewrite it to match.

  **Tested.**
  - After steps 1–4 the README names no roadmap that is absent from main, and TopologicalKTheory has no edge into DGFloerPartII, which removes the loop.
  - T1.5–T1.6 already consume nothing from DGFloerPartII: lines 423–520 and 811–826 contain no "4.2" or "DGFloer".
  - Step 2 needs nothing beyond what lines 1490–1512 already use: T1.5a's connectivity, T1.6a's Stiefel-quotient comparison and AlgebraicTopology Stage 5.5.

## R02 (P3) — AlgebraicTopology still names T1.6d as the consumer of the cofibration-tower equivalence

- **Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 1027–1028: "Own the cofibration-tower homotopy equivalence (the target TopologicalKTheory T1.6d cites as cofibrationTowerHomotopyEquivalence)". Also `TauCetiRoadmap/TopologicalKTheory/README.md` lines 126–127: "its Stage 5.5 supplies the based homotopy long exact sequence used by T1.5".
- **Claim.** The move made both sentences inexact. T1.6d no longer cites the tower equivalence, and T7.1 now uses Stage 5.5's sequence as well.
- **Witness.** In this README `cofibrationTowerHomotopyEquivalence` occurs only at line 1549, in T7.1. T1.6d (lines 811–822) names no AlgebraicTopology target. Line 1509 uses "the based homotopy long exact sequence of AlgebraicTopology Stage 5.5" in T7.1.
- **Repair.**
  - In AlgebraicTopology line 1027, write "TopologicalKTheory T7.1 cites".
  - In this README line 127, write "used by T1.5 and T7.1".
  - If R01's step 3 removes the Ω₇ comparison, name instead whichever section still cites the tower equivalence, or drop the parenthesis.

  **Tested.** After the edit, a search for `cofibrationTowerHomotopyEquivalence` in this README finds only the section that AlgebraicTopology names.

## Previous findings

- R01 — repaired: T1.6a ends "This supplies T7's BO/BSO classification input"; T1.6d says its tower's "comparison with the Grassmannian member Ω₇ of the Clifford chain is T7.1's". The supplier the move rests on is this report's R01.
- R02 — repaired: lines 1513–1517 read "not the composite of 4.2c's Bott map `O ≃ Ω(Ω₇)` with the Ω₇ comparison below … no agreement between the two resulting isomorphisms … is asserted or used", with the `i=3` sign Check.

## Verified sound

**Change set.**
- `git diff --stat ec7b876 HEAD` for this folder: `README.md` only, 100 insertions and 47 deletions. `Suggested.lean` (113 lines) and `lake-manifest.json` are unchanged.
- `git diff --stat origin/main...HEAD` outside the fourteen named folders is empty.

**Gate and tooling.**
- **Gate**, re-run on 73914b5: every check is 0 except `outside-folder=26`. All 26 files lie in the thirteen other folders the brief names as this pull request's own (none left after filtering those names), so that is not a finding. The worker's gate on this head passed every check, `build=0`.
- **Dependency check** with `--movable`: `depcheck: 234 roadmaps, 2285 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. See R01 for why it misses the DGFloerPartII edge.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/TopologicalKTheory/Suggested.lean` exits 0. Its only warning is `102:8: declaration uses 'sorry'`.
- **Signatures and padding.** The four elaborated types in `scratch/signatures.md` are identical to the previous review's and none loses a section binder. The file and pins are unchanged, so the earlier one-tactic probe stands.

**Changed passages.**
- **Tau Ceti names** (lines 127–132, 427–428), opened at pin 2fd255d9 in `Topology/Homotopy/SerreFibration/FiberBundle.lean`:
  - Line 365, `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`: its hypothesis is `∀ b, ∃ e : Trivialization F p, b ∈ e.baseSet` for a `TopCat` morphism with a fixed fibre `F`, and no hypothesis on the base. T1.5a's forgetful map has the fixed fibre `S^m`, so it applies.
  - Line 395, `TauCeti.TopCat.mem_serreFibrations_proj`: the projection of a `FiberBundle`.
  - AlgebraicTopology Stage 5.5 at this head cites the same two names (lines 1457–1458) and owns the long exact sequence.
- **Fibre identification** (lines 1498–1506): the rank map `V↦ℝe₀⊕shift(V)` of T1.6a (line 528) sends `f₀·g` to `f₀′·diag(1,g)`, so the induced map is `A↦diag(1,A)`. Conjugation by `w_n` is a group automorphism preserving the determinant, so it also carries `SO(n)` to `SO(n)`.
- **Contractibility** (lines 1506–1508): `V_n(ℝ^N)` is `(N−n−1)`-connected, consistent with T1.5a's `(m−1)`-connectivity at `m=N−n`; at `N=2n` this is `n−1`, which is unbounded.
- **No hidden use of the sign** (R02's repair): the bridge `B_n` (lines 1585–1589) acts on `π_n(ℤ×BO)` through `Ω₇≃ℤ×BO` and `Ω₇≃Ω⁸Ω₇` alone. The coefficient groups need only the isomorphism type of `π_(n−1)(O)`.
- **T1.6d** (lines 811–822): the tower's two stabilizations are T1.6a's rank and ambient maps, whose squares commute strictly (line 530). So the tower is cofinal in T1.6a's own grid and needs no DGFloerPartII input.
- **DGFloerPartII citations** in the moved text, resolved at 43d9b63 (they bear on R01's repair, not on correctness):
  - 4.2a line 1587: `ι_r(A) = diag(A, 1)`.
  - 4.2b lines 1664 and 1680–1685: `Ω₇ ≅ ⊔_(0≤p≤2m) G_p(ℝ^(2m))`; the stabilization `G_p → G_(p+1)` adds the new block's `+1`-eigenspace and preserves `d = p − m`.
  - 4.2c lines 1786–1790: `J₇` lies in the component `d = 0`; `O ≃ Ω(Ω₇)`.

**Other folders of this pull request.**
- GeneralizedCohomology at this head (lines 355–361, 3505–3507, 3773, 3816, 4807) consumes T1.5–T1.6, T7.0 and "T7.1's eight stable Bott equivalences read on ℤ×BO". None cites the loop comparisons under T1.6a or the Ω₇ comparison under T1.6d.
- CharacteristicClasses line 84 calls the stable `O`/`SO` and ΩBSO comparisons "downstream consumers of these classifiers", which agrees with their place in T7.1.

**Seeded sample.** T2.0 (from line 851) and T7.0 (lines 1411–1484) are outside the diff, so the previous report's verification against `hatcher-vbkt` lines 1504–1558 stands. No locator is flagged unverified.

**Headline theorems** are unchanged. None is statable at the pins, as the module docstring says: complex Bott periodicity (T4), complex Thom (T5.3), equivariant Thom (T6.7), real Bott periodicity with its coefficient ring (T7.1), numerable classification (T1.6a) and the projective-bundle theorem (T5.2).

**Overlaps.**
- #1808 and #1854 change this folder too; the description's shared-folder paragraph fixes the order: this pull request → #1808 → #1854.
- No id cited here is dropped by an open pull request.
- GeneralizedCohomology §G4.0b (line 147) is defined at this pull request's own head.

**Remarks on untouched text** (not findings):
- HomotopySpheres at its open head (line 3301) still says T1.6d "compares its classifier tower with the R₀ model of 4B.1". That is its text to update.
- AlgebraicTopology line 154 names only T1.6 as the consumer of its CW/Whitehead tools; T7.0 also uses them (line 1431).

**Adversarial table.** Rows marked "recomputed" were computed at this head; rows marked "previous" are carried from the report at ec7b876, whose statements this diff leaves untouched.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| Rank maps vs 4.2a inclusions (line 1503) | general `n`; `n=2`, `A=[[a,b],[c,d]]` | `(w·M·w)_(ij)=M_(n−i,n−j)`: corner `M₀₀=1`, block `A_(n−1−i,n−1−j)=(w_n·A·w_n)_(ij)`; `[[d,c,0],[b,a,0],[0,0,1]]` on both sides | identity holds (recomputed) |
| Negative control, same Check | `diag(1,A)∈ι₂(O(2))` | third row and column force `b=c=0`, `d=1`, so `a=±1` | only `A=diag(±1,1)`, as stated (recomputed) |
| Connecting map at `i=0` (Check 1) | `n=1`, `N=2` | lift of `ℝ(cos θ,sin θ)`, `θ∈[0,π]`, ends at `(−1,0)=f₀·(−1)` | generator ↦ `−1∈O(1)`; with `SO(1)` the target is trivial (recomputed) |
| Sign Check at `i=3` | inversion on `π₃(O)=ℤ` | pointwise product induces the sum, and `f·f⁻¹` is constant, so inversion is `−1`; `g↦g⁻¹` negates the connecting map | as stated (recomputed) |
| Automatic agreement | `i≡0,1,2,4,5,6 (mod 8)` | `π_i(O)` = ℤ/2, ℤ/2, 0, 0, 0, 0; automorphism group trivial | as stated (recomputed) |
| Weak contractibility of `EO` | `N=2n`, `n=1,2,3` | connectivity `N−n−1` = 0, 1, 2 | unbounded (recomputed) |
| T1.6d labels | stage `2n`, `k=n+d` | `Gr_(n+d)(ℝ^(2n))`, label `d`; `d=0` at `k=n` | consistent with 4.2b's `d=p−m` (recomputed) |
| Two stabilizations (line 1546) | `V⊂ℝ^(2n)` | 4.2b gives `V⊕L` with `L` in the new block; T1.6d gives `e₀⊕shift(V)`; the isometry `shift`, `L↦e₀`, sign fixed on the free line, has det 1 | differ by an element of `SO(2n+2)` (recomputed) |
| R01 roadmap edges | T7→4.2a–c; 4.2a–b→G4.0b; G4.0→T1.5–T1.6 | README 211–216; DGFloerPartII 1626–1627, 1687, 2238–2242; GeneralizedCohomology 3005 | roadmap loop of length 3; supplier disclaims; depcheck reports 0 (recomputed) |
| R01 repaired | T7.1's own `O` | fibres `colim O(n)` along `diag(1,A)`, conjugate to `diag(A,1)` | no DGFloerPartII input (recomputed) |
| T2.0 (seeded) | compact `X`; `X=∅`; `X=ℕ` | Hatcher p. 39 relation; zero ring; `K⁰=∏_ℕ ℤ` | agrees (previous) |
| T7.0 (seeded) shear | `π₁(BO×BO)=(ℤ/2)²` | `sh_*=[[1,0],[1,1]]`, det 1 | bijective (previous) |
| T7.0 complement class | `k=N`; general `k` | `0`; `([γ]−[1^k])+([γ^⊥]−[1^(N−k)])=0` | agrees (previous) |
| `adamsValueOfLambdaSeries` | `1+Lt`; `1+t` | `L^(n+1)`; `1` | agrees with T2.5 (previous) |
| `adamsValueOfLambdaSeries_mul` | `1+Lt`, `1+Mt` | `L^(n+1)+M^(n+1)` on both sides | proved in file (previous) |
| `adamsValueOfLambdaSeries_eq_coeff_logDeriv` | `1+t` over ℚ | `(−1)^n·(−1)^n=1` on both sides | proved (previous) |
| `exists_continuous_inside_projection` | `diag(0,2)`; `[[0,1],[0,0]]`; `n=0` | `P=diag(1,0)`; `P=1`; `P=0` | not vacuous (previous) |
| `PartitionOfUnity.gap` | `E=∅`; empty complement | `0`; `sup ∅=0` | matches (previous) |
| `finiteOrientedGrassmannian r N` | `r=N` | 2 points | agrees (previous) |
| T1.5a reflection degree `1−(−1)^m` | `m=1,2` | 2; 0 | agrees (previous) |
| T1.6c `ε_k=(−1)^(k(k−1)/2)` | `k=1,2,3` | `+,−,−` | agrees (previous) |
| T5.2 relation | `r=2`, `E=M⊕1` | `(t−1)(t−[M])` | agrees (previous) |
| T7.1 `c`, `r` | `r(c(a))`; `c(r(u²))` | `2a`; `a` | consistent (previous) |
| T7.3 failures | `(D²,S¹)`; `(D³,S²)` | restriction `0`; `β` missed | as stated (previous) |

## Not verifiable

- `sibson-1969`, `atiyah-bott-1964`, `abs-1964`, `husemoller-fibre-bundles`, `atiyah-1968-bott-index` and `eschenburg-hanke-bott` are settled as uncertified. They are cited by locator and were not read.
- Atiyah's Real K-theory paper, named in R01's repair as one possible route, is not in the manifest and was not opened. No locator is asserted for it.
- DGFloerPartII is not on main. It was read at its open head 43d9b63. Milnor's *Morse Theory* §24, behind 4.2a–4.2c, was not opened.

## Source issues

- none
