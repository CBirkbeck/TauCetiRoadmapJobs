<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16766#issuecomment-6903312380 -->
Red team round 2 pass b (claude) of 2ff33d4

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the face theorem of Layer 4 is stated for a finite discrete alphabet only

   **Location.** `packages/DimerModelsAndLozengeTilings/Suggested.lean:322–324` and `:334–336`:
   "`[Finite S] [TopologicalSpace S] [DiscreteTopology S] [MeasurableSpace S]
   [DiscreteMeasurableSpace S]`"; `README.md:1301–1303`: "Both Lean statements carry the standing
   hypotheses of the layer explicitly: … and `S` finite with the discrete topology and the discrete
   σ-algebra."

   **Claim.** `gibbsInvariant_isExtreme` and `gibbsInvariant_extreme_iff_ergodic` need a finite
   alphabet with both discrete structures.

   **Witness.** sheffield2005 lines 24–27 and 1367–1371: the cited lemma has ℤ- and ℝ-valued spins.
   Instance: `Γ = I = S = ℤ`, independent specification of a geometric `ν`; `𝒢_inv = {ν^{⊗ℤ}}`,
   ergodic (4.3), a one-point face.

   **Why the route covers it.** The route of 4.6(b) (`README.md:1306–1311`) uses 4.2, 4.6(a), the
   properness of each kernel and Tau Ceti's two lemmas; the README states 4.1–4.3 for any measurable
   `S` (`:1062–1064`), and `Specification` is already defined for any `S`. Neither closedness of `X`
   nor measurability of `X` in `Ω` is used: an invariant event of `X` is the trace of an almost
   invariant event of `Ω` for the push-forward measure. Second instance: `S = {0,1}` with the trivial
   σ-algebra and `X = {0̄, 1̄}` (4.4, fourth Check) has one probability measure, so `𝔓_inv` is a
   point and every subset of it is a face.

   **Repair.** In `Suggested.lean` delete `[Finite S]`, `[DiscreteTopology S]` and
   `[DiscreteMeasurableSpace S]` from both theorems, so that each begins

   ```lean
   theorem gibbsInvariant_isExtreme {Γ I S : Type*} [Group Γ] [Countable Γ] [Infinite Γ]
       [MulAction Γ I] [Countable I] [TopologicalSpace S] [MeasurableSpace S]
       (hproper : ∀ F F' : Finset I, {g : Γ | ∃ i ∈ F, g • i ∈ F'}.Finite)
       (X : Subshift Γ I S) (γ : Specification X) :
   ```

   (the same binder list for `gibbsInvariant_extreme_iff_ergodic`, followed by its `{μ}` and `hμ`);
   in the first docstring replace "a finite discrete alphabet and any specification" by "any alphabet
   and any specification"; in the module docstring replace "of a specification on a finite-alphabet
   subshift" by "of a specification on a subshift". The binders are not mentioned by either statement;
   this pass ran no Lean, so the worker elaborates the file and runs `#check @` on both names. In
   README 4.6 replace the sentence quoted above by: "Both Lean statements carry `Γ` countable and
   infinite, `I` countable and properness as the finiteness of `{γ : ∃ i ∈ F, γ • i ∈ F'}` for all
   finite `F`, `F'`, and no hypothesis on `S`: (a) and (b) use only 4.1–4.2 and the properness of the
   kernels, which hold for every measurable `S` (sheffield2005 states Lemma 3.2.2 for ℤ- and ℝ-valued
   spins, lines 24–27). Finiteness of `S` with its discrete structures is used in 4.4 and in (c)." In
   the Layer 4 preamble replace "For 4.4–4.6 `S` is moreover finite" by "For 4.4, for quasilocality in
   4.5 and for 4.6(c) `S` is moreover finite". Add to the Checks of 4.6: "An infinite alphabet: `Γ =
   I = ℤ`, `S = ℤ` and the independent specification of a geometric law `ν` have `𝒢_inv =
   {ν^{⊗ℤ}}`, which is ergodic (4.3), so (b) holds with a one-point face." Tested on both instances
   above: the repaired statement covers them and is true there.

2. **F02** (P3) the lattice structure of 2.8 is cited to a statement about domino heights

   **Location.** `README.md:879–880`: "cohn-kenyon-propp2001 Section 1.4 for the lattice structure";
   `README.md:2245–2246`: "Section 1.4 (the lattice of height functions), cited for 2.8".

   **Claim.** The source proves that the pointwise minimum and maximum of two height functions of
   2.8 are height functions.

   **Witness.** cohn-kenyon-propp2001 lines 404–420: the order, meet and join are those of domino
   height functions on the square lattice, proved from values agreeing modulo 4. The lozenge heights
   of 2.8 have increments in `{0,1}`.

   **Repair.** In 2.8 replace the quoted words by "cohn-kenyon-propp2001 Section 1.4, lines 404–420,
   for the same lattice structure on the height functions of domino tilings; for the height functions
   here, closure under pointwise minimum and maximum is immediate, both functions having increments
   in `{0,1}` along every positive edge". In the References replace "Section 1.4 (the lattice of
   height functions), cited for 2.8" by "Section 1.4 (the lattice of height functions of domino
   tilings, lines 404–420), cited for 2.8 as the model of the lozenge statement". Tested: for
   `H₁, H₂` with increments in `{0,1}` along `u → v`, `min(H₁,H₂)(v) − min(H₁,H₂)(u)` lies between
   `0` (both are nondecreasing) and `1` (each rises by at most one); on the unit hexagon
   `min(H_{T_a}, H_{T_b}) = H_{T_b}`.

Two findings, both P3. No statement of `Suggested.lean` and no README target was found false. The
round-1 findings are all repaired and the repairs introduced no error.

## Round-1 findings at this head

| Round-1 id | Status | Witness at `2ff33d4` |
|---|---|---|
| 1a/F01, 1b/F01 (P2), 5.3 statable and absent | repaired | `Suggested.lean:348` `IsDimerConfiguration`, `:357` `IsDimerGibbs`, `:372–380` `theorem dimerGibbsInvariant_isExtreme … (τ : Γ →* (G ≃g G)) … IsExtreme ℝ≥0∞ {…} {μ \| IsDimerGibbs G w μ ∧ …}`; the "Not stated separately" paragraph is gone from the module docstring (`:6–33`); README 5.2 (`README.md:1394–1399`) and 5.3 (`:1444–1451`) name the three declarations. |
| 1a/F02, 1b/F02 (P3), equivariance unused | repaired | `Suggested.lean:322–328` and `:334–340` carry no `hγ` and no `[DecidableEq I]`; `Specification.IsEquivariant` occurs in neither file; README `:1293` "(b) For every specification `γ`, equivariant or not, `𝒢_inv(γ)` is a face of `𝔓_inv(X)`". |
| 1a/F03 (P3), `w(s,t)` defined inside 9.5 | repaired | Conventions, `README.md:258–263` "The sine weights of `(s,t) ∈ 𝒯` are the type weights `w(s,t) = (sin πs, sin πt, sin π(1−s−t))`"; 9.5 (`:2005`), 9.6 (`:2030`) and 9.7 (`:2047`) cite the Conventions. |
| 1b/F03 (P3), free tilings and Aggarwal | repaired | Conventions, `README.md:163–167` "The lozenges of a free tiling may overlap in a face outside `R` … For a region `Faces(V)` of 1.3 they cannot"; 1.4 Check (`:618–622`); locators scoped at `:600` and `:813`. |

New statements of the repair, recomputed here (values in the table under "Verified sound"): the
direction of the weights in `IsDimerGibbs` (`2/3` on the weighted `C₆`), the swap argument for a
non-invariant `w`, the law-of-sines sentence (`|1−ξ|` opposite the angle `πs` at `0`), the wedge
`{W(0), W(−e₁)}` with heights `0,0,0,0,1`, the two new Checks of 4.6 and the finite-group Check of
5.3. None is wrong.

## Verified sound

**Counts.** 59 declarations of `Suggested.lean` read (18 theorems, 36 definitions, 1 abbreviation,
4 structures; also 4 instances), each compared with its elaborated type in the worker's
`signatures.md` (59 types, none lost a binder; the file has no `variable` line; this pass ran no
Lean and no `#check`). 51 README targets read, every line of the README. 167 Check bullets in 51
Checks blocks read (at least 3 per target); those listed in the table were recomputed, none found
false. 74 library declarations opened at the pins (58 with their cited line, all within three lines
of it). 56 source locators opened in the cached texts. 7 sibling citations resolved (VonNeumannAlgebras V8.BernoulliArbitraryDiscrete at
its README line 2788; FactorRigidity §8.3; TensorProductCombinatorics §1.1; RandomMatrices
§8.3–8.4; GraphConnectivityAndFlows §6.7; ClassicalErgodicTheory §0.3 item 2 and §1.4 item 2 at
its open head, README lines 417–422 and 778–779). None is used as a supplier.

**Dependency check** (the brief's command, unchanged):
`depcheck: 237 roadmaps, 2240 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. No gap is
declared (`design/plan.json` has `gaps = []`) and none is needed.

**Policy.** `git diff --stat origin/main...HEAD` changes only files under
`packages/DimerModelsAndLozengeTilings/`. No `lemma`, `set_option`, `#eval`, `#print`, `#synth`,
`#check`, `True` placeholder, sorried data, pull-request number or process narrative in the README
or the Lean file. Imports: `import Mathlib` and `TauCeti.MeasureTheory.Group.ErgodicExtreme`, which
exists at the pin and is used.

**Headline theorems.** The README's list (1.5, 2.5, 2.8, 2.9, 3.2, 3.3, 4.6, 5.3, 5.4, 6.3, 7.3,
8.3, 9.5, 9.7, 10.2) is stated in full: `tilingSubgraph_bijOn`, `tilingOfHeight_bijOn`,
`flip_connected`, `thurston_tileable_iff`, `partitionFunction_eq_abs_det`,
`lozenge_correlation_eq_det`, `gibbsInvariant_isExtreme`, `gibbsInvariant_extreme_iff_ergodic`,
`dimerGibbsInvariant_isExtreme`, `lozengeGibbsInvariant_isExtreme`,
`lozengeGibbs_extreme_iff_ergodic`, `slopeEdge_ergodicGibbs_equiv`,
`two_ergodicGibbs_of_slopeEdge`, `torusLimit_mem_gibbsInvariant_slope`,
`torus_partitionFunction_eq`, `exists_ergodicGibbs_of_slope`,
`incompleteBetaProcess_exists_unique`, `localLimit_isLozengeGibbs`. The ergodicity half of 5.3 for
a general graph is not stated; it is `IsExtreme.extremePoints_eq` applied to
`dimerGibbsInvariant_isExtreme` with Tau Ceti's `ErgodicSMul.iff_mem_extremePoints`, so stating it
would be padding, and the module docstring says exactly what Layer 5 states. Not raised.

**Padding probe.** No declaration follows by one tactic or one library lemma. The two
"extreme iff ergodic" theorems need, besides the face theorem and the two lemmas just named, a
`MeasurableConstSMul` instance for the action on a subshift and (for lozenges) the transport from
`Multiplicative (ℤ × ℤ)`; neither is at the pins. Kept, as in round 1.

**Ownership.** Searched main and the open heads (`roadmaps grep`, index of 2026-11-15) by object:
Kasteleyn (main: Fortuin–Kasteleyn only), dimer, lozenge, discrete sine (no match outside this
package), DLR and Dobrushin, Gibbs specification, height function and Thurston's criterion, tail
σ-algebra (Exchangeability on main, whose product is Tau Ceti's `tailProcess`, cited),
`Subshift` (ClassicalErgodicTheory at its open head, one-sided and group-indexed shifts, named in
the scope section), determinantal (RandomMatrices, named in the scope section). No second owner.
The pinned libraries have no `Specification`, no Gibbs measure of a specification, no Kasteleyn
matrix, no dimer or lozenge object (`grep` over both pins). `slope` exists at the root namespace of
Mathlib (`Mathlib/LinearAlgebra/AffineSpace/Slope.lean`); the roadmap's `slope` is namespaced, so
no fully qualified name collides.

### The adversarial pass

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `latticeDir`, `TriEdge`, `TriEdge.target`, `TriFace`, `TriFace.edges` | `W(0)`, `B(0)`, hexagon faces | `W(v)`: `(v,1),(v+e₁,2),(v,3)`; `B(v)`: `(v,2),(v+e₂,1),(v,3)`; type 1 `= W(v) ∪ B(v−e₂)` has vertices `v−e₂, v, v+e₁, v+e₃`, Aggarwal's type 1 with `v = (x,y+1)` | agrees with aggarwal2023 lines 324–361 |
| `hexGraph`; the two `AddAction` instances | `W(0)`; `w = e₁` | neighbours `B(0), B(−e₂), B(e₁)`; `rowCode((a,0) +ᵥ ω) x = ε(x − a)` | sound |
| `IsTiling`, `tilingSubgraph`, `tilingSubgraph_bijOn` | `∅`, `{W(0)}`, `R₆`, `univ` | `1↔1`, `0↔0`, `2↔2`; a perfect matching has `verts = univ`, so it equals `toSubgraph` of its relation | true |
| `regionEdges`, `boundaryEdges`, `boundaryVertices`, `regionGraph` | `R₆'` | 8 boundary vertices, `((1,1),1)` interior (faces `W(1,1)`, `B(1,0)`); a dart `u → u + e_k` of `regionGraph` forces `(u,k) ∈ E(R)` | sound |
| `IsClosedOn`, `IsSimplyConnectedRegion`; 2.1–2.4 | `R_ring` (12 faces recomputed), hexagon shelling, wedge | ray cochain `1` on `((n,0),2)`, `((n,0),3)`, `n ≥ 1`: closed on `B(1,0)` (`1+0=1`), `W(1,0)` (`0+1=1`), sum `1` round `W(0)`; six shelling steps `1,1,1,1,1,2` new edges | sound |
| `neutralIncrement`, `IsHeightFunction`, `tilingOfHeight`, `tilingOfHeight_bijOn` | `x`, `y`, `0`, `⌊(x+y)/2⌋`, `x+y`, `min(0,x,y)` | `M₁`, `M₂`, `M₃`; no type 3; `e₃`-increment `2`; a height function with a flip at `0` | true |
| Rotation law `H_{ρM}(w) = H_M(ρ⁻¹w) + w₁` | `M₁ ↦ M₂`; increment along `e₃` | `(w₂−w₁)+w₁ = w₂`; `ρ⁻¹e₃ = −e₂`, increment `1 − [(w,3) ∈ ρM]` | sound |
| `IsFlip`, `flip_connected`; 2.8 | `T_a → T_b`; tie-break | `H(v+e_k) = H(v) = H(v−e_k)+1` equals the first triple of `IsFlip`; a maximiser with `H(v+e_k) = H(v)+1` or `H(v−e_k) = H(v)` yields a better maximiser | true |
| `positiveSteps`, `thurston_tileable_iff`; 2.9 | `R₆'`; sufficiency without simple connectivity | `h = 0,0,0,0,1,1,1,1` consistent round the boundary, `h(1,1) − h(2,1) = 1 > 0`; `H = min_u(h(u)+ρ(u,·))` has increments in `{0,1}` since `ρ(v',v) = 0` | true |
| `whiteFaces`, `blackFaces`, `kasteleynMatrix`, `partitionFunction`, `partitionFunction_eq_abs_det` | hexagon `(a,b,c)`; `R₆'`; `R_ring` | `det[[c,0,a],[b,a,0],[0,c,b]] = 2abc`; `det[[1,0,0],[1,0,0],[1,1,1]] = 0`; `T` covers the 12 faces, increments `0,0,1` round `W(0)` | true |
| `lozenge_correlation_eq_det`; Leibniz witness | hexagon; `n = 0`; a repeated pair; `A = [[1,2,0],[0,1,3],[4,0,1]]` | `K⁻¹ = ½[[1,1,−1],[−1,1,1],[1,−1,1]]`, `det[[½,½],[−½,½]] = ½`; `1 = 1`; two equal rows against a nonzero left side, so injectivity is needed; `det = 25`, adjugate recomputed, `75/625 = 3/25` | true |
| `Subshift`, `Subshift.exterior`, `Specification`, `Specification.IsGibbs`, `Specification.gibbsInvariant` | `∘ₖ` order; `X = ∅`; `X₀` | `(η ∘ₖ κ) a = (κ a).bind η` (`Comp.lean:50`), so `comp_eq` is `γ_Δ γ_Λ = γ_Δ`; `IsProper` takes `Kernel[𝓑, 𝓧] X X` (`Proper.lean:47`); `invariantMeasuresOfMeasureUnivEq G X c = {ν \| SMulInvariantMeasure G X ν ∧ ν univ = c}` | sound |
| `gibbsInvariant_isExtreme`, `gibbsInvariant_extreme_iff_ergodic`; 4.2, 4.6(a) | `I = ∅`; `I` finite nonempty; `X = ∅`; `S = ℤ`; trivial σ-algebra | point; properness fails (all of `Γ`), vacuous; `∅ ⊆ ∅`; one-point face; one-point `𝔓_inv`. 4.2: `γ_k` with `γ_kF_k ∩ Λ_k = ∅` exists since `Γ` is infinite, `T = limsup γ_kC_k` | true; S01 |
| `IsDimerConfiguration`, `IsDimerGibbs`, `dimerGibbsInvariant_isExtreme` | weighted `C₆`; no edges, `V ≠ ∅`; `V = ∅`; finite nonempty edge set; swap `T` | `1·μ{M_a} = 2·μ{M_b}`, `μ{M_a} = 2/3`; Gibbs set `∅`; `{δ} ⊆ {δ}`; properness fails; `Tη` covers each endpoint of `F` once because `E` contains the edges at `F` | true |
| `IsLozengeGibbs`, `lozengeGibbsInvariant`, the two lozenge theorems | `δ_∅`, `2δ_{M₃}`, `ν₃` | excluded by the null clause; by mass; member, event `{M = M₁}` of mass `1/3` | true |
| `slope`, `rowCode`, `slopeEdge_ergodicGibbs_equiv`; 6.3(b) | `s = 0, 1`; finite modification of `M ∈ Φ₂` | `{δ_{M₃}} ↔ {δ_0}`, `{δ_{M₁}} ↔ {δ_1}`; `H_{M'} − H_M` constant off a bounded set, `H_{M'}` monotone on verticals where `H_M` is constant | true |
| `two_ergodicGibbs_of_slopeEdge` | `Bern(s)` and `β_s`; `ρ` | `s²` against `(s+s²)/2`; `slope(ρ_*μ) = (1−s−t, s)`: `(s,0) ↦ (1−s,s) ↦ (0,1−s)` | true |
| `IsTorusTiling`, `heightChange`, `torusMeasure`, `torusLimit_mem_gibbsInvariant_slope` | `n = 0`; floor tiling; window swap | all plane tilings, infinite, `uniformOn = 0`, harmless for a strictly increasing `φ`; `⌊ax/n₁ + by/n₂⌋` has increments in `{0,1}` iff `a/n₁ + b/n₂ ≤ 1`; a row avoiding the translates of the window keeps `h₁` | true |
| `torusPartitionFunction`, `twistedKasteleyn`, `torus_partitionFunction_eq` | brute force of the Lean formula as typed, all torus tilings, `(n₁,n₂) ∈ {1..4}×{1..3}`, `n₁n₂ ≤ 9`, random integer weights in `[−5,7]` | equal in all 11 cases; tilings counted `3, 5, 9, 5, 9, 17, 9, 17, 42, 17, 33`; e.g. `−347160` on 3 × 3; 1 × 2 unit: `(1+s_a)² − s_b = 3, 5, −1, 1` | true |
| 8.2 sign formula; 8.3 route | parities of `h₁, h₂, n₁, n₂` | `Σ ε_{ab}(−1)^{bh₁+ah₂}`: `4 − 2 = 2` for `h` even, else `−2(−1)^{n₂h₁+n₁h₂}`, and `h₁h₂+h₁+h₂` is odd; `(−1)^{gcd} = (−1)^{h₁h₂+h₁+h₂}` | true |
| 8.4, 8.5 Checks | 2 × 2, unit and `(2,3,5)` | eigenvalue products `−3, 5, 5, 5` and `0, 544, 1044, 1300`; `c = (−1,1,1,3)` and `(·,100,150,190)` from `det · ¼Σ1/λ`; `1900/2888 = 25/38` | true |
| Kernel conventions `P̂_w`, `G_w`; 9.1 | `(1,1,1)`; slope `(0.3,0.45)` | `G(0) = 0.3333333`, `G(0,−2) = −0.0576689 = √3/(2π) − 1/3`; `w₁G(−e₂) = 0.3000`, `w₂G(e₁) = 0.4500`, `w₃G(0) = 0.2500` | sound; `t` is the type-2 density |
| `incompleteBetaKernel` as typed (polygonal paths, `zpow`) | diagonal; vertical neighbours at `e^{πi/3}`; row `m = 3`; reversed side | `0.3333`; `−0.3333` and `0.0576689 = 1/3 − √3/(2π)`; `0.0893544 = \|ξ\|³ sin(3πs)/(3π)`; `−0.7 = −(1−s)` | sides of crossing pinned |
| 9.7(a), `incompleteBetaProcess_exists_unique` | slope `(0.3,0.45)`, 36 ordered pairs from 6 points; triple `(0,0),(1,2),(−1,1)`; uniqueness | largest gap between the two sides `4·10⁻¹³`; both determinants `0.0342140`; one type-1 lozenge in row `y` or `y+1` fixes `d(x) = H(x,y+1) − H(x,y)` | true |
| `exists_ergodicGibbs_of_slope` | `(1/2,1/4)`; `(1/2,0)`; corners | `(1, √2/2, √2/2)`, `1 < √2`; `(1,0,1)` not positive, edge by 6.3; frozen | true |
| `LocalConvergence`, `localLimit_isLozengeGibbs` | empty cylinder; swap on `F + v_N` | mass `1`; new edges have both faces in `R_N` once the faces at `F` are; faces at `F` keep exactly one edge because `E` contains their edges | true |
| 4.1, 4.3, 4.4, 4.5 Checks | shift witness on ℤ; independent kernels | `shift(−1)` of `1_{0}` is `1_{1}`; `γ_{0} ∘ₖ γ_{0,1}` gives `1/2 ≠ 1/3` | sound |
| 9.2(a) | `θ = π/2`; both `n`, `n+1` bad | every even `n` has `j = n/2`; then `\|j + n(j−j')\| ≤ 2(n+1)n^{−1/2}/π`, so `θ` is within `O(n^{−1/2})` of `πℤ` | true |

## Not verifiable

- `thurston1990` and `georgii2011` are recorded as uncertified; their texts were not read. The
  statements used are restated in gorin2021 Theorem 1.4 and sheffield2005 Lemma 3.2.2, both read.
- The Lean text of S01 was not elaborated: no Lean command is available to this pass. It only
  deletes instance binders that the two statements do not mention.
- gorin2021 Definition 3.9 (lines 1452–1457) describes the seam of `a` as the vertical side "with
  `n₁` vertices"; its Proposition 3.8 and the proof of Theorem 3.10 (lines 1423–1428, 1478–1482)
  pair `a` with the parity of `n₁` as the README does, and the README's rule is confirmed by the
  brute force above. Whether the wording of Definition 3.9 agrees with its Figure 3.2 could not be
  checked: the figure is not in the extraction.
- gorin2021 lines 1748–1763 (the definition of `W_θ`) are broken by empty page markers; Lemma 4.7
  at line 1766 is legible.
- Whether the published versions of aggarwal2023, sheffield2005, kos2006 and kenyon2009 keep the
  numbering of the arXiv versions read was not checked; the README says which version it cites.
- Ownership against the open pull requests was checked through the `roadmaps grep` index of
  2026-11-15; no open head was read in full.

## Source issues

- **Error** in gorin2021 at Lemma 4.7, line 1766: the source says that for large `n` one of `n`, `n + 2` lies in the good set `W_θ`; it should be `n` or `n + 1`, since at `θ = π/2` every even `n` fails; affects the proof.
- **Error** in aggarwal2023 at the remark after Definition 1.2, lines 465–467: the source says a plane tiling is determined by its type-1 positions unless that set is empty; it should require a type-1 lozenge in one of every two consecutive rows; affects nothing.
- **Error** in kenyon2009 at Section 5.4, lines 863–866: the source says ergodicity of a torus limit follows because the extreme points of the fixed-slope convex set are the ergodic measures; it should use extremality among all invariant Gibbs measures, the fixed-slope set not being a face; affects the proof.
- **Error** in kenyon2009 at Theorem 6 and its use, lines 836–839 and 858–859: the source says each slope of the closed triangle carries a unique ergodic Gibbs measure; it should restrict uniqueness to interior slopes, the open edges carrying several (sheffield2005 Theorem 9.5.1); affects a stated result.

Source independence: 20 passages compared with 8 sources (aggarwal2023 lines 380–383, 395–398, 413–415, 416–418, 463–464, 472–476, 572–580; sheffield2005 lines 1367–1371; kos2006 lines 198–202, 215–220; gorin2021 lines 521–526, 1452–1457, 1458–1472, 4534–4537, 4556–4562; kenyon2009 lines 557–565, 860–866; kenyon1997 lines 184–186; cohn-kenyon-propp2001 lines 404–412; okounkov-reshetikhin2003 lines 965–968), none shared beyond formulas and standard names; largest share gorin2021, 49 of 173 locators; contents compared with gorin2021 (Lectures 1, 2, 3, 4, 6, 13 against Layers 2, 3, 3 and 7–8, 8–9, 9, 4–6 and 10): independent, since Layers 1, 4 and 5 have no counterpart lecture, Layers 4–6 stand before the torus layers while Lecture 13 is the source's last, Layer 9 merges three lectures, and the order 2 → 3 → 8 → 9 is forced by the `*Needs:*` lines of 3.2 (2.8), 8.1 (7.1) and 9.1 (8.5). The table (3.4) of gorin2021 is restated as one parity rule; no table, figure or exercise list of a source is reused.

## For the human reviewers

- **Licence.** `gorin2021` is read from the author's page (`sources.toml`, `licence_class = "author-page"`), a pre-publication copy of a Cambridge University Press book; it carries the largest share of the locators (49 of 173).
- **Licence.** `Specification` (`Suggested.lean:294–305`) bundles a consistent family of proper kernels, as public formalisations of Gibbs measures do; its field names are its own. No external repository was opened in this pass.
- **Scope.** README 6.4, 9.2 and 9.7 state corrections to published sources (kenyon2009 lines 860–866, gorin2021 Lemma 4.7, aggarwal2023 lines 465–467); each was recomputed here and holds, and no refereed erratum is cited for them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2ff33d429e47bae9af6e9e9603984e07c753440a", "job": "RT-DimerModelsAndLozengeTilings~2b", "model": "fable", "worker": "chris-x29"} -->
