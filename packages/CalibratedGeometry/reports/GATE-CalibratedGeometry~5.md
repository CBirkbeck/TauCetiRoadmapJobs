# GATE-CalibratedGeometry~5: answers to the review of 0f3a0d5

The review (CBirkbeck, 2026-10-28) makes seven points, F01–F07, numbered H01–H07 here. The repairs
are in commit `d570d367` on top of `0f3a0d5`. Section labels below are the new README's layers; the
old labels C1–C6 remain as "Layer k (Ck)" because FukayaTheory cites "CalibratedGeometry C2".

## H01 (CBirkbeck) — applied

The old Campanato statement (`TauCetiRoadmap/CalibratedGeometry/README.md` old line 517, `f∈C^(0,ζ) ↔ sup ρ^(−n−2ζ)∫|f−f_(x,ρ)|²<∞`) is now stated for `f ∈ L²_loc(U; ℝᵐ)` in Layer 6.4: the hypotheses are interior balls, positive radii and `U′ ⋐ U`, and the conclusion is an a.e.-unique ζ-Hölder representative, with the seminorm bound, a sup bound that carries the `L²` term, and the converse. The scalar statement is consumed from PDE (Lane A.7 with its build inventory's Campanato/Morrey item) and extended componentwise. The locator is Campanato1963, Teorema I.2, printed p. 183, line 224, with `q = 2`, `λ = n + 2ζ`; that theorem concludes "coincides a.e. with a Hölder function", which confirms the reviewer's point. The reviewer's witness (`f(0)=1`, else 0) is now a Check, along with `|x|^ζ`, `sign(x)`, and constants (which show why the `L²` term is needed). The Dirichlet-growth step at old line 527 ("gives w∈C^(0,γ)") now reads "gives a `C^(0,γ)` representative". The same applies to the qualitative Schauder step.

## H02 (CBirkbeck) — applied

GeometricTopology on main (`TauCetiRoadmap/GeometricTopology/README.md`, smoothing and triangulation comparison item 1) states only the existence and uniqueness of smooth triangulations. It has no boundary subcomplex and no vertex order. The old README nonetheless cited it as the supplier of "the relative smooth triangulation" with ordered parametrizations (old lines 45–46, 225–230).

- **New target here (Layer 2.4).** Every compact smooth manifold with boundary has a smooth triangulation with `∂N` a subcomplex (Munkres1966EDT, Ch. II §10, cited by section because the source is waived). A global vertex order then makes face maps literally equal, and the target proves that interior facets cancel as identical generators.
- **Supplier contracts.** GT item 1 is now listed only for the boundaryless existence statement.
- **Checks.** The reviewer's oriented-square test is a Check with computed signs: `+1` and `−1`, the diagonal cancels, and `∂c = [a,b]+[b,d]−[c,d]−[a,c]`. A negative control shows that opposite diagonal orders leave `[a,d]+[d,a] ≠ 0`.

## H03 (CBirkbeck) — applied

HomotopySpheres 4A (open head, `TauCetiRoadmap/HomotopySpheres/README.md` 4A.2) consumes TopologicalKTheory T1.5–T1.6's carriers and has no oriented carrier of its own. CharacteristicClasses C1.1a on main builds the finite oriented cover of T1.5's Grassmannian and assigns the classifier comparison to TopK T1.6a.

- **Deleted.** The "HomotopySpheres Stage 4A coordinate oriented carrier" comparison and the "commute with CC C1.1a's existing HS identification" triangle (old lines 154–157).
- **Kept.** Layer 1.4 now compares its intrinsic carrier directly with C1.1a's cover of T1.5 (as covers, preserving both orientations). The k = 0 comparison is with C1.1a's two-point sign datum.
- **Checks.** Rank one in ℝ gives two points against `BSO(1)` = point. There are also Checks for k = 0 and k = dim E.

## H04 (CBirkbeck) — applied

`hermitian_gram_hadamard` is SuccessiveMinima 0.1.2 on main, and its statement covers the real case (`0 ≤ Re det Gram ≤ Π‖v_i‖²` for any finite family, including empty and dependent families). The pinned Mathlib has no Hadamard inequality (grep of `Analysis/InnerProductSpace` and `LinearAlgebra/Matrix`). The ownership sentence "Own the Hadamard inequality … through Gram–Schmidt" (old line 133) is deleted. It is now an "Owned elsewhere" item, a `From TauCetiRoadmap.SuccessiveMinima` supplier contract, and a `*Needs:*` entry of 1.1 and 1.2. The `((1,0),(1,1))` example (volume 1, norm product √2) is a Check of `frameVolume`.

## H05 (CBirkbeck) — applied differently

The claim is right: the all-degree Wirtinger theorem is statable at the pins. `⋀[ℝ]^k E` is a submodule of `ExteriorAlgebra` with the Gram inner product (`Mathlib/Analysis/InnerProductSpace/ExteriorPower.lean`, `exteriorPower.inner_ιMulti_ιMulti`). The suggested repair is not used as written, for two reasons:

- **No cast is needed.** `ω̂ʳ` is taken as an algebra power in `ExteriorAlgebra`, with membership in `⋀^(2r)` from `Submodule.pow_mem_pow` and `pow_mul`. This avoids the `simpa` cast on data in `wedgePower`.
- **A continuous form instead of a bare value.** The suggestion uses a bare real-valued `wirtingerValue` with "value 1 ↔ J-invariant ∧ value > 0". The new `kahlerPowerForm n r` is a genuine `ContinuousAlternatingMap`, with continuity proved by a basis expansion; the pins have no `MultilinearMap.continuous_of_finiteDimensional`. So the headline is stated on C1's own carriers:
  - `norm_kahlerPowerForm`: `r ≤ n → ‖kahlerPowerForm n r‖ = 1`, which is the comass.
  - `isCalibratedFrame_kahlerPowerForm_iff`: v is calibrated ↔ it is real-orthonormal and `ιMulti v = ιMulti (complexRealFrame u)` for some ℂ-orthonormal u.

  This pins the complex orientation directly, rather than through positivity of the value it characterizes.

New declarations: `kahlerBivector`, `kahlerPowerForm`, `complexRealFrame`, and the two theorems. The module docstring no longer lists Wirtinger as not statable. As the review's coverage note asked, it now names the Layer 6 second-variation/Jacobi headline as not statable (no normal bundle, Hodge star or integration over submanifolds at the pins). The README's Layer 4.2 states them with Checks. These match the reviewer's computed witnesses (n = r = 2 gives 1 with `1/2!`, reversed orientation −1, real 4-plane 0, r = 0 gives 1), plus two more: the ordering `(e₁,e₂,ie₁,ie₂)` gives −1, and r = 3 > n = 2 gives comass 0, which is why `r ≤ n` is needed.

## H06 (CBirkbeck) — applied

The README is restructured into the house shape:

- **Front matter.** `# Roadmap:` title, `**Summary.**`, Scope and ownership (owned here / owned elsewhere), Conventions, Exact supplier contracts (From Mathlib, From Tau Ceti, from each roadmap, with names and files), How to read the build.
- **Layers.** `## Layer k: … (Ck)` with `### k.n` subsections. Each has prose API bullets, a `*Needs:*` line, at least three `**Checks.**` with computed values (25 Checks blocks in all), and ends with `### Examples` and `### Dependencies`.
- **Tail.** Downstream consumers and References.
- **Content.** None was dropped; the old continuous prose is redistributed into these subsections.
- **Checks the review named.** `frameVolume` (empty frame 1, dependent frame 0, `((2,0),(0,3))` gives 6); orientation reversal (1.5, 2.2, 5.1); a non-Lagrangian frame (`(e₁,ie₁)`, 5.1); the per-component top-degree condition on two circles (6.2); the Züst negative control (1.6).

## H07 (CBirkbeck) — applied

Locators now sit at the targets.

**Read in this job:**

- McLean1998: Lemma 3.1 l.448, Prop. 3.2 l.483, Cor. 3.3/Rem. 3.4 l.486/493, Thm 3.6 l.510, Cors 3.7–3.10 l.519–532, Lemma 3.12 l.580, Thm 3.13 p.723 l.598, Cor. 3.14 l.603, and §1 l.27–48.
- Joyce2001SLLectures, identified as arXiv v3 (2003) in References: Defs 2.1/2.2 l.53/67, the phase convention l.76, Props 2.3/2.4 l.96/107, Thm 5.1 l.678.
- Zust2025Products: v2, Cor. 1.4 p.2 l.74, Thm 1.2 l.59.
- Campanato1963: Teorema I.2 p.183 l.224.

**Cited without being read:**

- HarveyLawson1982 is cited by chapter, plus Thm II.4.2 and Cor. III.1.11 as relayed by Joyce l.65/106 and McLean l.485. It is paywalled; the sources service recorded it as uncertified.
- Munkres1966EDT is cited by section (waived).

**Not done:** the source manifest. It lives in the board package (`packages/CalibratedGeometry/sources.toml`), and this job may edit only README.md and Suggested.lean. The worker must add Joyce2001SLLectures, Zust2025Products, Campanato1963 (all fetched from open repositories in this run) and HarveyLawson1982 (uncertified). No text is missing; `needs-references.toml` is empty.

**Still without a source locator:** analytic targets that are the roadmap's own derivations from named suppliers. These are the vector-valued decay and iteration lemmas in 6.4, the Hölder Green bounds in 6.2, and the frame second-jet identity in 6.5. Each now carries computed Checks instead.

## Signature check

`#check @name` for all 16 declarations was elaborated in one scratch file. Every elaborated type matches its README statement. The file has no section `variable`s, so no binder can drop. The hypotheses carried are:

- `FiniteDimensional ℝ E` on both Layer 1 theorems;
- `1 ≤ n` on `norm_standardKahlerForm`, `norm_standardSpecialLagrangianForm` and `specialLagrangianFrame_iff`;
- `r ≤ n` on `norm_kahlerPowerForm`.

Existing signatures are unchanged; the five new ones are listed under H05.

## Adversarial pass on the changed and added statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `kahlerBivector` duality `⟪ω̂, v∧w⟫ = Im⟪v,w⟫` | `v_j = x₀+iy₀`, `w_j = x₁+iy₁`; Gram row `⟪ie_j, v⟫ = Re(−i v_j)` | `det[[x₀,y₀],[x₁,y₁]] = x₀y₁ − y₀x₁ = Im(conj(v_j) w_j)` | holds; r = 1 agrees with `standardKahlerForm` | API bullet added |
| `norm_kahlerPowerForm` | r = 0, n = 0; r = 1, n = 1; r = 3, n = 2 | `‖const 1‖ = 1` (`norm_constOfIsEmpty`); comass 1; form 0, norm 0 | needs `r ≤ n`, holds at r = 0 | hypothesis `r ≤ n` kept; Check added |
| `isCalibratedFrame_kahlerPowerForm_iff` | n = r = 2 standard; `(ie₁,e₁,e₂,ie₂)`; `(e₁,e₂,ie₁,ie₂)`; n = 4 real plane; n = 3 tilted `(e₁,ie₁,e₂,cos t ie₂ + sin t e₃)`; r = 0 | `2/2! = 1`; −1; −1; 0; `cos t`; 1 with empty u | both directions hold; wrong orderings excluded | `complexRealFrame` interleaves |
| `complexRealFrame` index | `i < 2r ⇒ i/2 < r` | `omega` proof elaborates | holds | — |
| Campanato characterization (6.4) | `1_{0}` on B₁ ⊂ ℝ; `|x|^ζ`; `sign x`; constants | seminorm 0 with representative 0; finite at ζ, ∞ above; `2ρ^(−2ζ) → ∞`; 0 | pointwise reading false, a.e. version holds | restated a.e. with `L²` term |
| Ordered fundamental chain (2.4) | unit square, order `a<b<c<d`; reversed diagonal orders; interval | `ε = +1, −1`; `∂c = [a,b]+[b,d]−[c,d]−[a,c]`; `[a,d]+[d,a] ≠ 0`; `[1]−[0]` | cancellation needs global order | target owned here |
| 1.4 comparison with C1.1a | k = 1 in ℝ; k = 0; k = 2 in ℝ³ | 2 points against 2 (not `BSO(1)` = point); 2 rays; S² and Stiefel dimension 3 | holds | HS triangle deleted |
| 1.1/1.2 dependency | route of `‖φ‖ ≤ comass` | comass form of 1.2 uses only the comass definition | the old Needs cycle 1.1 ↔ 1.2 is broken | Needs split |
| `frameVolume` with Hadamard | empty, `(v,v)`, `((2,0),(0,3))`, `((1,0),(1,1))` | 1; 0 against `‖v‖²`; 6; 1 against √2 | holds | supplier SuccessiveMinima 0.1.2 |
| Hermitian normalization (Conventions) | n = 1 | `(i/2)(dx+idy)∧(dx−idy) = (i/2)(−2i)dx∧dy = dx∧dy` | holds | witness added |
| Joyce phase vs `Re(e^(−iθ)Ω)` | `Ω = a+ib` | `Re((cos θ − i sin θ)(a+ib)) = a cos θ + b sin θ` | equal | stated in Conventions |
| 5.1 Checks | n = 1, θ ∈ {0, π/2}; n = 2 frames `(e₁,e₂)`, `(ie₁,ie₂)`, `(e₁,ie₂)`, `(e₁,ie₁)`; n = 0 | 1, −1, 0; `Re z`, `Im z`; 1; −1; 0 (θ = 0); `Ω = 0`; `cos θ` | consistent with `specialLagrangianFrame_iff`; n = 0 needs `1 ≤ n` | Checks added |
| 5.4 gradient graphs | `u = ax²/2`; `x₁x₂`; `(x₁²+x₂²)/2` | phase `arctan a`; `det = 2`, phase 0; `(1+i)² = 2i`, phase π/2 | `Σ arctan` matches | Checks added |
| 6.5 second-jet identity | `A = (a)`; `diag(1,−1)`; `[[0,1],[−1,0]]` | `a²`; `(1+t²)−(1+t²)`, giving 0; `(1+t²)−(1−t²)`, giving 4; frame side `W₁₂ = 2t`, `|W′|² = 4` | formula and frame form agree | Checks added |
| 3.2 equator | `Sᵐ ⊂ S^(m+1)`, m = 1 | `d²/dt² cos(t)·2π = −2π` | unstable, not calibrated | Check kept |
| 6.2 `Z_⊥` | S¹; two circles with ±1; `Tⁿ` | `∫f = 0`; total 0 but per-component ±2π; harmonic dimension n | per-component condition is needed | Checks added |
| 6.3 moduli | flat `Tⁿ`; `b₁ = 0`; n = 1 geodesic | n translations; rigid; 1 | matches `b₁` | Checks with McLean locators |

## Ownership and citations

- **Ownership against open pull requests.** Checked for the new and changed objects (Gram–Hadamard, relative ordered triangulation, Campanato, the oriented-cover comparison) with `roadmaps grep` over main and the 448 open heads, plus the sibling checkouts given in the brief.
  - Gram–Hadamard is owned by SuccessiveMinima, and its target here is deleted.
  - The scalar Campanato characterization is PDE's; the vector extension is owned here.
  - No roadmap states the relative ordered smooth triangulation, so 2.4 owns it.
- **Citations.** `roadmaps resolve` on the new README: none found nowhere. Spot checks on main:
  - DG 8.3 `SmoothSimplex`, `exists_smoothSimplex_homotopicRel`;
  - RG R5a.1 `volumeVariation_isContDiff`;
  - CKG K5b.0;
  - PDO Layer 5;
  - SBC B1.4;
  - LieGroups Layer 2;
  - SuccessiveMinima 0.1.2;
  - CC C1.1a;
  - TopK T1.5/T1.6a.
- **Pinned names.** Every Mathlib and Tau Ceti name in the supplier contracts was found at the pins, including `IsCoercive.continuousLinearEquivOfBilin`, `ContinuousAlternatingMap.norm_compContinuousLinearMap_le` and `Compatible.transport`.
- **Moves.** No notion moved down.

## Build and gate

`lake build TauCetiRoadmap.CalibratedGeometry.Suggested`: `Build completed successfully (8976 jobs)`. There are eight `declaration uses 'sorry'` warnings, one for each of the eight theorems, and no other warnings.

Gate: `gate CalibratedGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`--movable`): `depcheck: 207 roadmaps, 1704 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.

No review text contained instructions outside its claims.
