# Review of TopologicalKTheory (pull request #1807 at ec7b876)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines in `TauCetiRoadmap/TopologicalKTheory/` since 64a16e1. `git diff --quiet 64a16e1 HEAD -- TauCetiRoadmap/TopologicalKTheory` reports the folder byte-identical. Both previous findings therefore stand unrepaired.

Between the two heads, the eleven commits rewrote AlgebraicTopology and GeneralizedCohomology, among other folders, and DGFloerPartII's open head moved from 58c40aed to ba8a4149. This review re-resolved every citation of those three roadmaps against their current text:
- The loop of R01 still closes at those heads.
- Every other citation still resolves.

## R01 (P1) — T1.6a and T1.6d consume DGFloerPartII 4.2a–4.2b, which close a loop back to T1.5–T1.6 through GeneralizedCohomology G4.0

- **Location.** In `TauCetiRoadmap/TopologicalKTheory/README.md`:
  - Lines 497–499: "Own the loop comparisons ΩBO≃O and ΩBSO≃SO: the based loop space of stableRealGrassmannian … is weakly homotopy equivalent to DGFloerPartII 4.2a's stable `O`".
  - Lines 823–838: "Construct the comparison with DGFloerPartII 4.2b's Grassmannian member Ω₇ … compatibility with 4.2b's block stabilization".
  - The supplier bullet, lines 198–203: "T1.5–T1.6 … own … T1.6a's loop comparisons ΩBO≃O and ΩBSO≃SO, and T1.6d's comparison of the homogeneous tower with 4.2b's Grassmannian member".
- **Claim.** At section level the supply runs in a circle: T1.6a/T1.6d → DGFloerPartII 4.2a/4.2b → GeneralizedCohomology G4.0 (G4.0a–G4.0b) → TopologicalKTheory T1.5–T1.6.

  The dependency check cannot see this loop. TopologicalKTheory and GeneralizedCohomology are both on main and absent from the merge order, so it prints `0 problem(s)`, which is a false negative. The supplier itself forbids this consumption: DGFloerPartII's own Downstream consumers paragraph limits this roadmap to consuming 4.2a–4.2c in T7.
- **Witness**, re-read at the current heads:
  - DGFloerPartII (ba8a4149): 4.2a *Needs:* (lines 1368–1369) and 4.2b *Needs:* (line 1426) name "GeneralizedCohomology G4.0b". Lines 1938–1941 say this roadmap "cannot consume 4.2a–4.2c in T1.5–T1.6".
  - GeneralizedCohomology at this head:
    - G4.0 *Needs:* (line 2479) is "TopologicalKTheory T1.5–T1.6".
    - G4.0b consumes "TopK T1.5's smooth graph-chart upgrade" (lines 2443–2449).
    - G4.0a is built "following TopK T1.5–6's real/complex construction" (line 2293).
- **Repair.** Unchanged from the previous report: move both comparisons into T7.1 item 1, which already consumes 4.2a–4.2c (line 1505).
  1. **T1.6a.** Move lines 497–517 ("Own the loop comparisons … part of T7's bridge.") into T7.1 item 1, just before "Use DGFloerPartII 4.2a–4.2c's actual stable groups", with R02's change. Keep line 518 in T1.6a.
  2. **T1.6d.** Keep in T1.6d:
     - the integer components;
     - the tower `O(2n)/(O(k)×O(2n−k))` with its orbit map and labels `k−n`;
     - the cofinal equivalence with `BO×ℤ`;
     - the transport of the block sum.

     Move the Ω₇ comparison into T7.1: everything from "compatibility with 4.2b's block stabilization" to "the base point J₇ into d=0", with the `SO(2n+2)` homotopy and the telescope comparison. At line 1538 write "read on ℤ×BO through that comparison".
  3. **Supplier bullet.** In lines 198–203, assign the loop comparisons and the Ω₇ comparison to T7, which is "the only part of this roadmap that consumes 4.2a–4.2c".

  **Tested at these heads.** After the move the edges run T1.5–T1.6 → G4.0 → 4.2a–4.2b → 4.2c → T7.1 → GeneralizedCohomology G5.0 (*Needs:* line 2868). Nothing returns to T1.6:
  - G4.0's only TopologicalKTheory input is T1.5–T1.6 (lines 2479, 2725).
  - DGFloerPartII names this roadmap only in its Downstream consumers (lines 1935–1941).
  - G5.0 is not an input of T7 (README line 1434 places T7.0 before G5.0).

## R02 (P3) — The T1.6a sentence misnames 4.2c's Bott map and promises a comparison that T7 never states

- **Location.** `TauCetiRoadmap/TopologicalKTheory/README.md` lines 516–517: "These are the fibration-sequence comparisons, not 4.2c's Bott map `O≃Ω(ℤ×BO)`; their agreement on coefficients is part of T7's bridge."
- **Claim.** There are two problems with this sentence.
  - **The Bott map is misnamed.** 4.2c's eighth equivalence is `O ≃ Ω(Ω₇)`. `ℤ×BO` enters only through this roadmap's own Ω₇ comparison.
  - **The promised agreement has no target.** T7.1's bridge (lines 1536–1548) states only `B_n(α_n(m))=α_(n+8)(m⊗λ₈)`. It never compares the two isomorphisms `π_i(O)→π_(i+1)(BO)`.

    That comparison carries a sign. Inversion in the topological group `O` acts by `−1` on `π₃(O)=ℤ`. The two possible frame lifts of the Bott loop end at `A₀⁻¹A` or at `A⁻¹A₀`. So "agreement" is unpinned in degrees `i≡3,7 (mod 8)`.
- **Witness.** DGFloerPartII (ba8a4149) line 1529 lists "`Ω₇ ≃ Ω(U/O)` and `O ≃ Ω(Ω₇)`". T7.1 (lines 1536–1548) has no comparison of these isomorphisms.
- **Repair.** In the paragraph moved by R01, write "not the composite of 4.2c's Bott map `O ≃ Ω(Ω₇)` with the Ω₇ comparison". Then either delete "their agreement on coefficients is part of T7's bridge", or state it in T7.1 item 1:
  - **Target.** For every `i≥0`, the inverse of `π_(i+1)(BO)≅π_i(O)` and the composite `π_i(O)→π_(i+1)(Ω₇)→π_(i+1)(ℤ×BO)` agree up to `ε_i∈{±1}`. Fix `ε_3` and `ε_7` by AlgebraicTopology Stage 5.5's transport convention.
  - **Check.** At `i=3` the two frame lifts give `+1` and `−1`.

  **Tested.** For `i≡0,1 (mod 8)` both groups are `ℤ/2`, and for `i≡2,4,5,6` both are `0`, so agreement is automatic there. The sign matters only at `i≡3,7`.

## Previous findings

- R01 — not repaired: lines 497–499 still read "Own the loop comparisons ΩBO≃O and ΩBSO≃SO … weakly homotopy equivalent to DGFloerPartII 4.2a's stable `O`"; lines 823–824 still construct "the comparison with DGFloerPartII 4.2b's Grassmannian member Ω₇" inside T1.6d.
- R02 — not repaired: lines 516–517 still read "not 4.2c's Bott map `O≃Ω(ℤ×BO)`; their agreement on coefficients is part of T7's bridge."

## Verified sound

**Change set.**
- `git log 64a16e1..ec7b876` has 11 commits, all in other folders of this pull request:
  - AlgebraicCurves, AlgebraicTopology, BordismFormalGroups, ClassifyingSpaces, GeneralizedCohomology, ReductiveGroups, RigidAnalyticGeometry and SchemeAndStackFoundations;
  - 16 files, +11956/−14118.
- `README.md` (1640 lines) and `Suggested.lean` (113 lines) are unchanged.
- `lake-manifest.json` is unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.
- `git diff --stat origin/main...HEAD` outside the fourteen named folders is empty.

**Gate and tooling.**
- **Gate**, re-run on ec7b876: every check is 0 except `outside-folder=24`. All 24 files lie in the thirteen other folders the brief names as this pull request's own. Counted by folder:
  - two files in each of AlgebraicCurves, AlgebraicTopology, BordismFormalGroups, CharacteristicClasses, ClassifyingSpaces, ComplexKahlerGeometry, GeneralizedCohomology, PadicFunctionalAnalysis, ReductiveGroups, RigidAnalyticGeometry and SchemeAndStackFoundations;
  - one file in each of LocalPurity and PurityOfBranchLocus.

  So that failure is not a finding. The worker's gate on the same head passed every check, `build=0`.
- **Dependency check** with `--movable`: `depcheck: 236 roadmaps, 2279 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. This is the false negative described in R01.
- **Elaboration.** `lake env lean TauCetiRoadmap/TopologicalKTheory/Suggested.lean` exits 0 in 5.7 s. Its only warning is `102:8: declaration uses 'sorry'`.
- **Signatures and padding.** The four elaborated types in `scratch/signatures.md` are identical to the previous review's, and none loses a section binder. The file and the pins are unchanged, so the earlier padding probe still stands: `simp` makes no progress on `exists_continuous_inside_projection`.

**Citations re-resolved in the rewritten AlgebraicTopology** (12 of them, all found):
- **Stage 4.5** (item 5):
  - `cofibrationTowerHomotopyEquivalence` (line 918), including the version for squares commuting up to specified homotopies (lines 927–929), which T1.6d uses;
  - `basedHomotopyInverseOfEquivalence` (line 990, "AT8.5 and TopK T7.0");
  - `cwProductKelley` (line 997);
  - the compact-generation coreflection (line 139).
- **Stage 4.6** (line 1078): the RP manifold structure on `Projectivization ℝ`, and the transported `RealProjectiveSpace.cwComplex` cells that lines 139, 474 and 844 cite.
- **Stage 5.5** (line 1314): it owns the fibration homotopy long exact sequence. Line 1465 says "TopologicalKTheory T1.5 consumes the based homotopy sequence".
- **Stage 8.1** (lines 2288–2297): the Kelley product comparison of homotopy groups, "TopK T7.0 uses it".
- **Stage 8.5** (line 2383): CW Whitehead.
- **Stages 8.10–8.12** (lines 2758, 2797, 2917) exist, as line 847's exclusion assumes.
- AlgebraicTopology's own lines 151–153 still name T1.6 as consumer of its CW/Whitehead tools.

**Citations re-resolved in the rewritten GeneralizedCohomology** (all found):
- **G4.0b** (lines 2375–2477): it owns the quaternionic Grassmannian, Stiefel and HP smooth carriers and consumes T1.5's smooth upgrade. This matches README lines 142–147 and 484–486.
- **G2.8** (line 809): the Γ-space infinite-loop machine of lines 758 and 1500.
- **G5.0** (line 2729): it owns `stableBSpinToBSO_blockSum` against T1.6c's Whitney sum (line 2779) and consumes T7.0's inverse (line 2819), as lines 819, 1434 and 1499 say.
- **No reverse edge.** GeneralizedCohomology's supplier contract for this roadmap (lines 267–272) lists T1 and T5–T7. TopologicalKTheory consumes nothing from GeneralizedCohomology.

**Other changed folders.**
- AlgebraicCurves, ClassifyingSpaces, ReductiveGroups, RigidAnalyticGeometry and SchemeAndStackFoundations do not cite this roadmap. Line 169's "ReductiveGroups" is AutomorphicFormsOnReductiveGroups §2.1.
- BordismFormalGroups lines 50, 197 and 569 cite the Conventions' `β=[O(−1)]−1`. README lines 242–245 define exactly that.

**DGFloerPartII at ba8a4149** (merge-order line 46). The supplier bullet (lines 191–198) and T7.1 (lines 1505–1508, 1536–1544) match its current text:
- 4.2a (line 1330): `ι_r(A)=diag(A,1)`, new coordinate last, and the finite-to-stable range.
- 4.2b (line 1384): the chain `Ω₀…Ω₈`, `Ω₇ ≅ ⊔ G_p(ℝ^(2m))`, and `d=p−m` preserved.
- 4.2c:
  - line 1529: the eight equivalences;
  - line 1530: `O ≃ Ω⁸O`;
  - line 1538: `π_i(O)` = ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, ℤ;
  - lines 1524–1526: `J₇` in the component `d=0`.

**Seeded sample.**
- **T2.0** (lines 868–883) was re-verified against `hatcher-vbkt` lines 1504–1558 (§2.1, printed pp. 39–40):
  - the compact Hausdorff standing hypothesis (line 1508);
  - Proposition 2.1 (line 1522);
  - cancellation (lines 1535–1537);
  - the formal-difference relation, whose transitivity needs cancellation (lines 1540–1545).

  The README's paracompact common-summand version agrees with it, as stated, when `G` has a trivial complement.
- **T7.0** (lines 1428–1495) is untouched. Its four AlgebraicTopology inputs resolve (above). `sibson-1969` is uncertified.
- No locator is flagged unverified.

**Headline theorems** (unchanged), none statable at the pins, as the module docstring says:
- complex Bott periodicity (T4);
- complex Thom (T5.3);
- equivariant Thom and `R(G)≃K_(G,c)(V)` (T6.7);
- real Bott periodicity with `ℤ[η,a,b,b⁻¹]/(2η,η³,ηa,a²−4b)` (T7.1);
- numerable classification (T1.6a);
- the projective-bundle theorem (T5.2).

**Overlaps.** #1808 and #1854 conflict with this pull request only in other folders. No id cited here is dropped, and no id is defined only by an open revision.

**Remarks on untouched text** (not findings):
- Line 126's "bundle-to-Serre comparison" is native Tau Ceti `TauCeti.TopCat.mem_serreFibrations_proj` (`Topology/Homotopy/SerreFibration/FiberBundle.lean:395`), which AlgebraicTopology Stage 5.5 consumes. Naming it would be sharper.
- For GeneralizedCohomology's own review: its line 71 says the eight stable Bott equivalences "remain in TopologicalKTheory", but this README takes them from DGFloerPartII 4.2c (lines 196–198).
- This README cites DGFloerPartII at its open head, but the description's merge-order paragraph does not name that pull request.

**Adversarial table.** The R01/R02 rows and the seeded and headline rows were recomputed at this head; the rest are carried forward from the previous report, whose statements this diff leaves untouched.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| R01 loop edges | T1.6a→4.2a; 4.2a→G4.0b; G4.0→T1.5–T1.6 | README 497–499; DGFloerPartII 1368–1369, 1426; GC 2479, 2443–2449 | cycle of length 3; depcheck reports 0 (recomputed) |
| R01 repaired order | T1.5–6→G4.0→4.2a–c→T7.1→G5.0 | GC 2479, 2868; DGFloerPartII 1935–1941 | acyclic (recomputed) |
| 4.2c Bott map at line 516 | DGFloerPartII 1529 | `O≃Ω(Ω₇)` vs written `O≃Ω(ℤ×BO)` | R02 (recomputed) |
| fibration iso vs Bott composite | `π₃(O)=ℤ`; `π₀`,`π₁` | lifts `A₀⁻¹A` (+1) vs `A⁻¹A₀` (−1); `ℤ/2`, `ℤ/2` automatic | sign unpinned at `i≡3,7`, R02 (recomputed) |
| T2.0 (seeded) | compact `X`; `X=∅`; discrete `X=ℕ` with rank `n` at `n` | Hatcher p. 39 stable relation; zero ring; `K⁰=∏_ℕ ℤ`, with `[ε¹]=(1,1,…)` not in `⊕` | agrees; the arbitrary product is needed (recomputed) |
| T2.0 regressions | `X=ℝ` | `K⁰(ℝ)=K⁰(pt)=ℤ`; `K_c⁰(ℝ)=K̃⁰(S¹)=0` | agrees (recomputed) |
| T7.0 (seeded) shear | `π₁(BO×BO)=(ℤ/2)²` | `sh_*=[[1,0],[1,1]]`, det 1; `sh_*(1,0)=(1,1)`, inverse `(1,1)↦(1,0)` | bijective (recomputed) |
| T7.0 complement class | `k=N`; general `k` | `[0]−[1⁰]=0`; `([γ]−[1^k])+([γ^⊥]−[1^(N−k)])=0` | agrees (recomputed) |
| T7.0 basepoint track | `k=1, N=4` | `e₁→e₄→e₀`, `e₂→e₅→e₁`, `e₃→e₆→e₂`; each target line is outside the current plane | well defined (recomputed) |
| T1.6a `π_(i+1)(BO)≅π_i(O)` | `i=0,1,3` | `ℤ/2=ℤ/2`; `ℤ/2=ℤ/2`; `ℤ=ℤ` | agrees with 4.2c line 1538 (recomputed) |
| T1.6a fibres vs 4.2a `O` | `diag(1,A)` vs `diag(A,1)` | `w_(n+1)diag(1,A)w_(n+1)=diag(w_nAw_n,1)` | identified (previous) |
| T1.6d `J₇ ↦ d=0` | 4.2b, `m=1` | `G₀,G₁,G₂(ℝ²)` ↔ `d=−1,0,1`; `J₇∈G₁` | agrees (previous) |
| `adamsValueOfLambdaSeries` | `1+Lt`; `1+t` | coefficient `n` of `λ′λ⁻¹` times `(−1)^n` is `L^(n+1)`; `1` | agrees with T2.5 (previous) |
| `adamsValueOfLambdaSeries_mul` | `1+Lt`, `1+Mt` | `L^(n+1)+M^(n+1)` on both sides | proved in file (previous) |
| `adamsValueOfLambdaSeries_eq_coeff_logDeriv` | `1+t` over ℚ | `(−1)^n·(−1)^n=1` on both sides | proved (previous) |
| `exists_continuous_inside_projection` | `diag(0,2)`; `[[0,1],[0,0]]`; `n=0` | `P=diag(1,0)`; `P=1`; `P=0` | Riesz law, not vacuous (previous) |
| `PartitionOfUnity.gap` | `E=∅`; empty complement | `0`; `sup ∅=0` | matches (previous) |
| `finiteOrientedGrassmannian r N` | `r=N` | 2 points; `ncard_fiber=2` | agrees (previous) |
| T1.5a reflection degree `1−(−1)^m` | `m=1,2` | 2; 0 | agrees (previous) |
| T1.6c `ε_k=(−1)^(k(k−1)/2)` | `k=1,2,3` | `+,−,−` | agrees (previous) |
| T5.2 relation | `r=2`, `E=M⊕1` | `(t−1)(t−[M])` | agrees (previous) |
| T7.1 `c`, `r` | `r(c(a))`; `c(r(u²))` | `2a`; `a` | consistent (previous) |
| T7.3 failures | `(D²,S¹)`; `(D³,S²)` | restriction `0`; `β` missed | as stated (previous) |

## Not verifiable

- `sibson-1969`, `atiyah-bott-1964`, `abs-1964`, `husemoller-fibre-bundles` and `atiyah-1968-bott-index` are settled as uncertified. They are cited by locator and were not read.
- DGFloerPartII is not on main. Its §§4.2a–4.2c were read at its open head ba8a4149. Milnor's *Morse Theory* §24, behind them, was not opened: R01 and R02 do not depend on it.

## Source issues

- none
