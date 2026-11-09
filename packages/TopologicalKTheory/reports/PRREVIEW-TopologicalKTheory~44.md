# Review of TopologicalKTheory (pull request #1807 at 64a16e1)

**Verdict:** needs changes

This is an incremental re-review of the 93 changed lines in `TauCetiRoadmap/TopologicalKTheory/` since e473a36. All of them are in `README.md`, in commit 3adc0470. `Suggested.lean` is byte-identical. The previous finding is repaired: HomotopySpheres is gone and the gate's `dropped` check reads 0. But the repair places two of the new DGFloerPartII consumptions in T1.6, and that closes a loop through GeneralizedCohomology G4.0b. DGFloerPartII's own head now rules this consumption out.

## R01 (P1) — T1.6a and T1.6d consume DGFloerPartII 4.2a–4.2b, which close a loop back to T1.5–T1.6 through GeneralizedCohomology G4.0b

- **Location.** These are the passages that consume DGFloerPartII outside T7:
  - `TauCetiRoadmap/TopologicalKTheory/README.md` lines 497–499: "Own the loop comparisons ΩBO≃O and ΩBSO≃SO: the based loop space of stableRealGrassmannian … is weakly homotopy equivalent to DGFloerPartII 4.2a's stable `O`". Lines 505–508 identify the fibres "with 4.2a's `O` and `SO`".
  - Lines 823–826: "Construct the comparison with DGFloerPartII 4.2b's Grassmannian member Ω₇ … cofinally compared with 4.2b's stages". Lines 831–838 add the compatibility with 4.2b's block stabilization.
  - The supplier bullet at lines 198–203, which assigns "T1.6a's loop comparisons ΩBO≃O and ΩBSO≃SO, and T1.6d's comparison of the homogeneous tower with 4.2b's Grassmannian member" to T1.5–T1.6.
- **Claim.** At section level the supply now runs in a circle:
  - TopologicalKTheory T1.5–T1.6 supplies GeneralizedCohomology G4.0b. This README says so at lines 142–147: G4.0b's direct inputs are "T1.5's cells and smooth upgrade and T1.6's stable carriers".
  - G4.0b supplies DGFloerPartII 4.2a and 4.2b, for `Sp(r)` and the quaternionic Grassmannians of the Clifford chain.
  - 4.2a and 4.2b now supply T1.6a and T1.6d.

  So T1.6 waits on 4.2a, which waits on G4.0b, which waits on T1.6. The dependency check cannot see this. GeneralizedCohomology and TopologicalKTheory are both on main, and roadmaps on main are never flagged as upward suppliers, so it prints `0 problem(s)` (output below). That is a false negative.

  The previous review's repair items (ii)–(iii) proposed exactly this placement. Since then the supplier has fixed where it may be consumed: DGFloerPartII's head, 58c40aed, allows this roadmap to consume 4.2a–4.2c in T7 only, for the reason above.
- **Witness.**
  - DGFloerPartII at its open head: 4.2a *Needs:* (lines 1340–1341) and 4.2b *Needs:* (line 1398) both name "GeneralizedCohomology G4.0b".
  - GeneralizedCohomology at this head, line 1992: G4.0b must "Consume TopK T1.5's smooth graph-chart upgrade … reuse its bundles/classifiers".
  - DGFloerPartII line 1883: this roadmap "cannot consume 4.2a–4.2c in T1.5–T1.6".
- **Repair.** Move both comparisons into T7, which already consumes 4.2a–4.2c (lines 1503–1508):
  1. **T1.6a.** Move the paragraph at lines 497–517 ("Own the loop comparisons ΩBO≃O … part of T7's bridge.") into T7.1 item 1, before "Use DGFloerPartII 4.2a–4.2c's actual stable groups", with the change R02 asks for. Keep line 518 ("This supplies T7's BO/BSO classification input.") in T1.6a.
  2. **T1.6d.** Keep in T1.6d the integer components and T1.6's own tower `O(2n)/(O(k)×O(2n−k))` with its orbit map and the labels `k−n`. Keep the cofinal based homotopy equivalence with `BO×ℤ` and the transport of the block sum along it. None of these needs 4.2b. Move the comparison with 4.2b's Ω₇ into T7.1 item 1: everything from "compatibility with 4.2b's block stabilization" to "the base point J₇ into d=0", with its `SO(2n+2)` homotopy and the telescope comparison. At line 1538 write "read on ℤ×BO through that comparison".
  3. **Supplier bullet.** At lines 198–203 write: "T1.5–T1.6 consume Tau Ceti's finite Grassmannian and finite oriented carriers and own their Schubert cells, fixed-rank BO(n)/BSO(n), stable BO/BSO colimits, universal bundles and their finite-CW/numerable classification. T7 owns the loop comparisons ΩBO≃O and ΩBSO≃SO and the comparison of T1.6d's homogeneous tower with 4.2b's Ω₇. It is the only part of this roadmap that consumes 4.2a–4.2c, because GeneralizedCohomology G4.0b consumes T1.5–T1.6 and 4.2a–4.2b consume G4.0b."

  **Tested on the loop.** After the move the edges run T1.5–T1.6 → G4.0b → 4.2a–4.2b → 4.2c → T7.1. Nothing leads back to T1.6:
  - G4.0a and G4.0b cite this roadmap only at T1.5–T1.6 (GeneralizedCohomology lines 1843 and 1992).
  - 4.2a–4.2c cite no section of this roadmap.

  This is the consumption DGFloerPartII line 1879 allows. Nothing in T1–T6 consumes the moved targets: the only other mention of them is CharacteristicClasses line 28, which calls the ΩBSO comparisons downstream consumers.

## R02 (P3) — The new T1.6a sentence misnames 4.2c's Bott map and promises a comparison that T7 never states

- **Location.** `TauCetiRoadmap/TopologicalKTheory/README.md` lines 516–517: "These are the fibration-sequence comparisons, not 4.2c's Bott map `O≃Ω(ℤ×BO)`; their agreement on coefficients is part of T7's bridge."
- **Claim.** There are two problems with this sentence.
  - **The Bott map is misnamed.** 4.2c's eighth equivalence is `O ≃ Ω(Ω₇)`. `ℤ×BO` comes in only through this roadmap's own Ω₇ comparison.
  - **The promised agreement has no target.** T7.1's bridge (lines 1536–1548) states `B_n(α_n(m))=α_(n+8)(m⊗λ₈)`. It says nothing comparing the two isomorphisms `π_i(O)→π_(i+1)(BO)`: the inverse of the fibration connecting map, and the Bott map followed by the Ω₇ comparison.

    The agreement also needs a sign. The Bott loop of `A` is the minimal geodesic of `A` followed by the reversed geodesic of `A₀`. Lifted to frames, it ends at `A₀⁻¹A` or at `A⁻¹A₀`, depending on the transport direction. Inversion acts by `−1` on `π₃(O)=ℤ`. So "agreement" is unpinned in degrees `i≡3,7 (mod 8)`, and no target owns it.
- **Witness.** DGFloerPartII line 1501: "`Ω₇ ≃ Ω(U/O)` and `O ≃ Ω(Ω₇)`". This README's T7.1, lines 1536–1548, has no such comparison.
- **Repair.** In the moved paragraph (R01, step 1), write "not the composite of 4.2c's Bott map `O ≃ Ω(Ω₇)` with the Ω₇ comparison". Then either delete "their agreement on coefficients is part of T7's bridge", or state it in T7.1 item 1 as a target:
  - **Target.** For every `i≥0`, the inverse of the fibration isomorphism `π_(i+1)(BO)≅π_i(O)` and the composite `π_i(O)→π_(i+1)(Ω₇)→π_(i+1)(ℤ×BO)` agree up to a sign `ε_i∈{±1}`. Compute `ε_3` and `ε_7` with AlgebraicTopology Stage 5.5's transport convention.
  - **Check.** At `i=3`, the two candidate lifts of the Bott loop give `+1` and `−1`.

  **Tested.** For `i≡0,1 (mod 8)` both groups are `ℤ/2`, and for `i≡2,4,5,6` both are `0`, so the agreement is automatic. At `i=3` the frame lift above shows that the sign depends on the endpoint convention, which the target now fixes.

## Previous findings

- R01 — repaired. `grep -n HomotopySpheres` on the README and `Suggested.lean` at this head returns nothing, and the gate reads `dropped=0`. Lines 191–210 now cite "DGFloerPartII 4.2a–4.2c", and their content matches the supplier (see Verified sound). Placing the loop and Ω₇ comparisons in T1.6a and T1.6d introduced the new R01.

## Verified sound

**Change set.**
- `git diff e473a36..64a16e1 -- TauCetiRoadmap/TopologicalKTheory` touches `README.md` only: 8 hunks, +65/−28, now 1640 lines. `Suggested.lean` has no diff (113 lines).
- `git diff --stat origin/main...HEAD` outside the fourteen folders the brief names is empty.
- The one other change since e473a36 is commit 64a16e11 in ComplexKahlerGeometry, a folder of this pull request. It keeps every id this README cites: its id map at lines 480–488 lists `K1` → Layer 1, `K5` → Layer 5, `K6` → Layer 6, `K7` → Layer 7, `K7.1` → 7.1, `K7.2` → 7.2. Its §7.1 (line 2189, projective charts and orientation) and §7.2 (line 2231) carry the content cited at lines 140, 162, 475–478 and 845–851.
- Remark on untouched text: line 851's "CKG K7.2's complex characteristic cells" names cells that CKG K7.2 consumes from AlgebraicTopology Stage 4.6 (CKG line 2249). It already did so at e473a36 (line 2016), so this is not a finding here.

**Gate and tooling.**
- **Gate**, re-run by this review on 64a16e1: every check is 0 except `outside-folder=20`. The 20 files are exactly the files of the other thirteen folders the brief names as this pull request's own, so that failure is not a finding. The worker's record of the same head: every check passed, `build=0`.
- **Dependency check** with `--movable`: `depcheck: 239 roadmaps, 2342 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. This is the false negative described in R01.
- **Elaboration.** `lake env lean TauCetiRoadmap/TopologicalKTheory/Suggested.lean`: exit 0 in 4.8 s, with the single warning `102:8: declaration uses 'sorry'`.
- **Padding probe.** On a scratch copy, `exists_continuous_inside_projection` with `simp` in place of `sorry` gives "`simp` made no progress".
- **Signatures.** The four signatures in `scratch/signatures.md` are identical to the previous review's. They were compared again with T2.5 and T4.4: no section binder is lost.
- **Pins.** Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` are unchanged, so the 70 library names the earlier review resolved still stand.

**DGFloerPartII citations**, resolved at its open head 58c40aed. DGFloerPartII is a new folder there, at merge-order line 46 and not on main.
- **4.2a** (line 1302): `O(r)` and `SO(r)` with `ι_r(A)=diag(A,1)`, the new coordinate last. `O`, `SO`, `U` and `Sp` are colimits in 1.0's convenient category, with the finite-to-stable range.
- **4.2b** (line 1356): the chain `Ω₀…Ω₈`, the minimal geodesics `γ_J`, and `Ω₇(16m) ≅ ⊔_(0≤p≤2m) G_p(ℝ^(2m))`. Its stabilization `G_p → G_(p+1)` adds the new block's `+1`-eigenspace and preserves `d=p−m`.
- **4.2c** (line 1414): the eight stable equivalences (lines 1500–1501), `O ≃ Ω⁸O` (line 1503), and `π_i(O)` = `ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, ℤ`. The component `d=0` of Ω₇ contains `J₇` (lines 1497–1498).
- Every claim of the supplier bullet at lines 191–198 and of T7.1 (lines 1505–1508, 1525–1526, 1536–1544, 1576) matches these.

**Other citations in the changed text.**
- AlgebraicTopology at this head: Stage 4 item 5 owns `cofibrationTowerHomotopyEquivalence` (line 698), including the version for squares that commute up to specified homotopies, which T1.6d uses. Stage 5 item 5 (line 1017) owns the fibration homotopy long exact sequence that T1.6a cites as Stage 5.5.
- SpinRepresentations (main), Layer 7 (line 881, lines 893–895), supplies `Cliff(p+8,q) ≅ Cliff(p,q) ⊗ M₁₆(ℝ)`, as line 1534 now says. It consumes Tau Ceti `TauCeti.realCliffordBottEquiv` (pin: `LinearAlgebra/CliffordAlgebra/BottPeriodicity.lean:384`). Remark: naming that pinned declaration at line 1534 would be sharper.
- No leftover "RB" or HomotopySpheres-era "supplier's §4B" reference remains. The one "supplier's" at line 995 refers to the Adams-operations supplier.

**Mathematics of the changed passages, apart from R01's placement.**
- **T1.6a route.** Each frame-span map `V_n(ℝ^N)→Gr_n(ℝ^N)` is a principal `O(n)`-bundle. The colimit map is a Serre fibration, because every lifting problem with compact domain lies in a finite stage. `V_n(ℝ^(2n))` is `(n−1)`-connected, so the colimit total space is weakly contractible. AlgebraicTopology Stage 5.5 then gives `π_(i+1)(BO)≅π_i(O)`.
- **Matching TopK's colimit with 4.2a's `O`.** TopK's rank maps add the new coordinate first (`diag(1,A)`), 4.2a's last (`diag(A,1)`). Conjugation by the reversal permutation matches the two systems exactly: `w_(n+1) diag(1,A) w_(n+1) = diag(w_n A w_n, 1)`. The reversal is the composite of the cyclic permutations that the finite-oriented-carriers paragraph (lines 541–545) uses with a path in `SO(n)`.
- **T1.6d's `SO(2n+2)` argument.** Both stabilizations have the form `V ↦ φ(V) ⊕ L`, with an isometric embedding `φ` and a free line left over. The orthogonal map matching them can be corrected by the reflection in the free line, so it lies in `SO(2n+2)`. That group is connected, which gives the homotopy.

**Overlaps and ownership.** #1808 and #1854 conflict with this pull request only in other folders, and no id cited here is dropped. On the ownership split, DGFloerPartII owns `O` and Ω₇, and says the comparisons with `BO` belong to this roadmap (its line 1882), so nothing has two owners. Remark for the worker: this README now cites DGFloerPartII at its open head. The description's merge-order paragraph ("No open pull request must merge before this one") should name that pull request. It adds a new folder, so this is not a finding.

**Seeded sample.**
- T2.0 was re-verified against `hatcher-vbkt` lines 1504–1558 (printed pp. 39–40). They give the compact Hausdorff standing hypothesis, Proposition 2.1's finite trivial complements, cancellation, and the formal-difference relation whose transitivity uses cancellation. Lines 868–883 state these, and say how the common-summand relation agrees with the stable one when `G` has a trivial complement.
- T7.0 is untouched; it cites `sibson-1969`, which is uncertified.
- No locator in the README is flagged unverified.

**Headline theorems.** These are unchanged:
- complex Bott periodicity (T4);
- the complex Thom isomorphism (T5.3);
- the equivariant Thom isomorphism and `R(G)≃K_(G,c)(V)` (T6.7);
- real Bott periodicity with `ℤ[η,a,b,b⁻¹]/(2η,η³,ηa,a²−4b)` (T7.1);
- numerable classification (T1.6a);
- the projective-bundle theorem (T5.2).

None is statable at the pins, as the module docstring says: `FiniteRankBundleCore` has no tensor product at Tau Ceti `2fd255d9`, and there is no KO or compact-support carrier.

**Adversarial table.** Rows for the changed statements first; the rest are carried forward from the previous report, whose statements this diff leaves untouched.

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| T1.6a `π_(i+1)(BO)≅π_i(O)`, `π_(i+1)(BSO)≅π_i(SO)` | `i=0,1,3`; BSO at `i=0` | `π₁BO=ℤ/2=π₀O`; `π₂BO=ℤ/2=π₁O`; `π₄BO=ℤ=π₃O`; `π₁BSO=0=π₀SO` | agrees with 4.2c and T7.1's `KO^(−n)=π_(n−1)(O)`: ℤ/2,ℤ/2,0,ℤ,0,0,0,ℤ (new) |
| T1.6a total space contractible along `N=2n` | `n=1`; `n=2` | `V₁(ℝ²)=S¹`, `π₁=ℤ`, `∂:π₁RP¹=ℤ→π₀O(1)=ℤ/2` onto, not injective; `V₂(ℝ⁴)` 1-connected | the colimit is needed, and it holds (new) |
| T1.6a fibres vs 4.2a `O` | rank maps `diag(1,A)` vs `diag(A,1)` | `w_(n+1)diag(1,A)w_(n+1)=diag(w_nAw_n,1)` | identified (new) |
| T1.6d stabilizations differ by `SO(2n+2)` | `n=1`, `k=1` | `ℝe₀⊕shift(V)`, free `e₃` vs `V⊕ℓ`, free `ℓ^⊥`; det fixed by the free reflection; labels `1−1=0`, `2−2=0` | sound; R01 moves it to T7 (new) |
| T1.6d `J₇ ↦ d=0` | 4.2b, `m=1` | `G₀,G₁,G₂(ℝ²)` ↔ `d=−1,0,1`; `J₇∈G₁` | agrees (new) |
| 4.2c Bott map named at line 516 | DGFloerPartII line 1501 | `O≃Ω(Ω₇)` vs written `O≃Ω(ℤ×BO)` | R02 (new) |
| fibration iso vs Bott composite | `π₃(O)=ℤ`; `π₀,π₁` | lifts `A₀⁻¹A` (+1) vs `A⁻¹A₀` (−1); `ℤ/2` automatic | sign unpinned, R02 (new) |
| T2.0 (seeded) | compact `X`; `X=∅`; summand `G` | Hatcher p. 39 stable relation; zero ring; equal when `G⊕G′≃ε^n` | agrees (re-verified) |
| `adamsValueOfLambdaSeries` index `n` is `ψ^(n+1)`, sign `(−1)^n` | `1+Lt`; `1+t` | coefficient `n` of `λ′λ⁻¹` times `(−1)^n` is `L^(n+1)`; `1` | agrees with T2.5 (previous) |
| `adamsValueOfLambdaSeries_mul` | `1+Lt`, `1+Mt` | `L^(n+1)+M^(n+1)` both sides | proved in file (previous) |
| `adamsValueOfLambdaSeries_eq_coeff_logDeriv` | `1+t` over ℚ | `(−1)^n·(−1)^n=1` both sides | proved (previous) |
| `exists_continuous_inside_projection` | `diag(0,2)`; nilpotent `[[0,1],[0,0]]`; `k=0`; `‖z‖=1`; `n=0` | `P=diag(1,0)`; `P=1`; `v=0`; only `v=0`; `P=0` | Riesz law, not vacuous (previous) |
| `PartitionOfUnity.gap` junk values | `E=∅`; empty complement | `gap ∅=0`; `sup ∅=0` | matches (previous) |
| T1.6a gap Checks | `(0.7,0.3)`; tie `(0.5,0.5)` | `q₁=0.4,q₁₂=0.3,q₂=0`, sum 1; `q₁₂=0.5` | agrees (previous) |
| `gapPartition` weights | `n=0`; `(0.7,0.3)` | `w₀=0`; `w₁=0.4,w₂=0.6` | agrees (previous) |
| `Submodule.finConsEquiv`, new line first | `⟨e₀⟩⊂𝕜²` | rank-2 image `⟨e₀,e₁⟩` | agrees (previous) |
| `mem_range_rankStabilization` | `⟨e₀⟩`; `⟨e₁⟩` | in; not in | agrees (previous) |
| `ambientStabilization_rankStabilization` | `⟨e₀⟩⊂𝕜¹` | both `⟨e₀,e₁⟩⊂𝕜³` | equal (previous) |
| `equivModuleGrassmannian` index `N−r` | `r=N`; `r=0`; `r>N` | Subsingleton; Unique; empty | agrees (previous) |
| `finiteOrientedGrassmannian r N` | `r=N`; fibre of `forget` | 2 points; `ncard_fiber=2` | agrees (previous) |
| T1.3 base hypotheses | compact Hausdorff; finite cover | normal ⇒ embedding; `[Finite ι]` | agrees (previous) |
| `isIso_iff_bijective` | `𝕜=ℝ,ℂ` | `[CompleteSpace 𝕜]`, `[FiniteDimensional]` | in scope (previous) |
| T1.5a reflection degree `1−(−1)^m` | `m=1,2` | 2; 0 | agrees (previous) |
| T1.5a `π_m V_r(ℝ^n)` | `V₂(ℝ³)`, `m=1`; `V₂(ℝ⁴)`, `m=2` | `ℤ/2`; `ℤ` | agrees (previous) |
| T1.6a cyclic-SO sign `(−1)^(n−1)` | `n=2,3` | `−1·−1=1`; `+1` | consistent (previous) |
| T1.6c `ε_k=(−1)^(k(k−1)/2)` | `k=1,2,3` | `+,−,−` | agrees (previous) |
| T2.5 `N_p≡e₁^p mod p` | `p=2` | `e₁²−2e₂` | holds (previous) |
| Koszul class of `O(−1)` | `L=O(−1)` | `(1+β)⁻¹−1=−β` | consistent (previous) |
| T5.2 relation | `r=2`, `E=M⊕1`; `r=0` | `(t−1)(t−[M])`; zero ring | agrees (previous) |
| T6.6 `U(r)/H_r≃CP^(r−1)` | `r=1` | `pt=CP⁰` | as stated (previous) |
| T7.0 shear | `π_n(BO)` | `(a,b)↦(a,a+b)`, inverse `(a,b−a)` | route sound; Sibson uncertified (previous) |
| T7.1 `c`, `r` | `r(c(a))`; `c(r(u²))` | `2a`; `a` | consistent (previous) |
| T7.3 failures | `(D²,S¹)`; `(D³,S²)` | restriction `0`; `β` missed | as stated (previous) |

## Not verifiable

- `sibson-1969`, `atiyah-bott-1964`, `abs-1964`, `husemoller-fibre-bundles` and `atiyah-1968-bott-index` are settled as uncertified in the manifest. They are cited by locator and were not read.
- DGFloerPartII is not on main. Its §§4.2a–4.2c were read at its open head through the sibling checkout. Milnor's *Morse Theory* §24 behind those sections was not opened, because R01 and R02 do not depend on it.

## Source issues

- none
