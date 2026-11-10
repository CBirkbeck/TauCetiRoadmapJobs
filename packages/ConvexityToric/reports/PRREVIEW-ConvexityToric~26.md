# Review of ConvexityToric (pull request #1651 at c1e867d)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`
**Verdict:** needs changes

Three P3 findings, all one-line edits to `README.md`; no P1 or P2. The folder is unchanged since `2fc76b2`; this is a full review of it at the head.

## R01 (P3) — §3.2 states Kostant's theorem without its hypotheses on K

**Location.** `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:591`: "Prove Kostant **compact coadjoint-orbit projection convexity**, `pr_t*(K·ν)=conv(W·ν)` for ν∈t*".

**Claim.** The target's only stated hypothesis is ν∈t*. K, T and W are bound nowhere in §3.2; the nearest binding is §3.1's "compact connected K", in another target.

**Witness.** K=O(2), T=SO(2), t*=ℝ, W=N(T)/T=ℤ/2 acting by −1, ν=1: K·ν={1,−1}, so `pr_t*(K·ν)`={±1}, while conv(W·ν)=[−1,1]. Connectedness of K is used (the orbit must be connected for Theorem 27.1).

**Repair.** Begin the sentence "For a compact connected Lie group K with maximal torus T and Weyl group W=N_K(T)/T, prove Kostant …". On the witness the hypothesis fails (O(2) is disconnected), and for K=SO(2) both sides are {ν}.

## R02 (P3) — §5.2 refers to an unidentified source, "the notes"

**Location.** `README.md:1022`: "At the notes' level ε=1/2 this is π/(ab)."

**Claim.** The README identifies no source as "the notes", and no cited text fixes the level ε=1/2: Cannas da Silva's weighted-circle examples (p. 150) take an arbitrary regular level ξ<0. A reader cannot tell which text is meant.

**Witness.** `grep -n -i "notes" README.md` gives only this line and the Conrad–Landesman URL; Cannas da Silva lines 5890–5904 of the cached text have no level 1/2.

**Repair.** Write "At ε=1/2 this is π/(ab)." (the value is right: 2π·(1/2)/(ab)=π/(ab), and the Check at line 1045 already gives π/6 for (a,b)=(2,3)). If a source is meant, cite it with its locator instead.

## R03 (P3) — roadmaps cited by abbreviations that are never expanded

**Location.** `README.md:465` "over AT’s ordinary cohomology"; `:796` "This is a CT specialization of O4's generic bundle/connection API"; `:828` and `:848` "SBC B6.2’s"; `:1065` "do not consume CT's integration".

**Claim.** AT, CT and SBC are defined neither in this README nor in the family conventions it points to; a cross-roadmap citation names the roadmap and its section.

**Witness.** `grep -n -w` for AT, CT, SBC in `README.md` returns only these five lines; the same search in `TauCetiRoadmap/SymplecticGeometry/README.md` finds no definition.

**Repair.** Write "AlgebraicTopology Stage 6's ordinary cohomology", "a specialization in this roadmap of Orbifolds O4's …", "SmoothBundlesConnections B6.2’s" (twice) and "this roadmap's integration".

## Verified sound

**Gate and build.** The worker's gate at this head passes on every counter. My rerun gives all counters 0 except `outside-folder=4`, which lists the pull request's own `CotangentLagrangian` and `IntegrableSystems` files named in the brief (not a finding). Dependency check output: `depcheck: 234 roadmaps, 2273 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line). `lake env lean` on `Suggested.lean`: five `declaration uses sorry` warnings (lines 74, 108, 116, 136, 186), nothing else.

**Padding probe.** On a scratch copy each of the five `sorry` was replaced by `first | rfl | simp | infer_instance | (constructor <;> simp)`: 5 of 5 fail (`simp` made no progress at 83 and 209, unsolved goals at 112, `constructor` fails at 121 and 146). No declaration is padding.

**Signatures.** The 16 elaborated signatures were compared with the README statements; no binder is lost (`torus_convexity`, `toric_fibers` and `toricImage_delzant` carry compactness, connectedness, Hausdorff, second countability, boundarylessness and finite dimension explicitly). Nothing changed.

**Headlines.** Stated: torus convexity with connected fibers, the word121 moment image and its exact polygon, toric orbit fibers, the Delzant property of a toric moment image. Named as not statable in the docstring, each with its missing carrier: period/root comparison, fixed-locus theorem, equivariant perfection, Kirwan and Kostant convexity, the norm-square deformation, Duistermaat–Heckman, Delzant reconstruction and the facet presentation, labeled orbifold classification. The matrix Schur–Horn corollary of §3.2 follows from the pinned theorem and is rightly not restated.

**Adversarial table (values computed this round).**

| Statement | Instance | Computed | Result |
| --- | --- | --- | --- |
| `fixedMoment` rows vs table §3.3 | 8 flags, μ=aΠ_L₁+bΠ_P+cΠ_L on coordinate subspaces | (e₁,12,e₁)→(a+b+c,b,0); (e₁,13,e₃)→(a+b,0,b+c); (e₂,23,e₃)→(0,a+b,b+c); all 8 agree in order | holds |
| `fixedMoment_convexHull` | vertices of the inequality region in the plane x+y+z=a+2b+c | x=a+b+c: (a+b+c,b,0),(a+b+c,0,b); z=b+c: (a+b,0,b+c),(0,a+b,b+c); y=a+b+c: (0,a+b+c,b),(b,a+b+c,0); six vertices = rows 1,3,4,8,7,6 | holds, both inclusions |
| rows 2, 5 on edge z=0 | row1+t(row6−row1), row6−row1=(−(a+c),a+c,0) | row 2: t=c/(a+c); row 5: t=a/(a+c); equal iff a=c | holds |
| (a,b,c)=(1,1,1) | rows 2 and 5 | both (2,2,0); 7 distinct values, 6 vertices | holds |
| (a,b,c)=(2,1,1) | rows 2, 5 between (4,1,0),(1,4,0) | (3,2,0) at t=1/3, (2,3,0) at t=2/3 | holds |
| a=0, b=c=1 | eight rows | (2,1,0),(1,2,0),(2,0,1),(1,0,2),(2,1,0),(1,2,0),(0,2,1),(0,1,2): the 6 permutations | holds |
| `incidence_moment_range` bounds | L₁⊂span(e₁,e₂) | z=bΠ_P₃₃+c‖L₃‖²≤b+c; x≤a+b+c; trace a+2b+c | consistent with hull |
| kernel of T on X | diag(t₁,t₂,t₃) fixing all (L₁,P,L) | t₁=t₂ from L₁⊂P₀, then t₃ from arbitrary L | diagonal circle; complexity 3−2=1 |
| σ=−2π ω_FS (§3.3 Check) | chart w at e₁ | μ₁=1/(1+‖w‖²)≈1−‖w‖², weight −1 field (y,−x), σ=s dx∧dy gives s·d(‖w‖²/2)=−d‖w‖², s=−2; ω_FS(0)=1/π | holds |
| `torus_convexity` | rank 0 (T a point), M a point | fixed set M, range μ={0}=hull; fiber preconnected | holds |
| `torus_convexity` | trivial circle on S² | image {c}, hull of μ(M)={c} | holds, ineffective case included |
| `toric_fibers` | n=0; circle on S² | point: both sides true; S²: level circles are orbits, poles fixed | holds |
| `toricImage_delzant` | dim T=0 | d=0, region=univ={0}, compact, interior nonempty, extreme point 0 with empty basis of N=0 | holds |
| `IsDelzant` Checks | normals ±1, supports 0,−1 | [0,1]; translate by 2: supports 2,−3, [2,3] | holds |
| `IsSmoothVertex` non-example | normals ±2, supports 0,−2 | region [0,1], {2} not a ℤ-basis of ℤ | excluded |
| `IsDelzant` non-examples | supports 0,0; single x≥0 | {0}: empty interior; [0,∞): not compact | excluded |
| `HamiltonianTorusData` sign | rotation field (−y,x), dx∧dy | ι=−y dy−x dx=d(−‖z‖²/2) | μ=−‖z‖²/2, matches `weightMomentMap` |
| equivariance clause | ℝ² translations, μ(x)(ξ)=σ(ξ,x) | defect σ(e₂,e₁)=−1 | clause not redundant |
| §1.1 normalization | SU(2), H=diag(i,−i) | [H,E₁₂]=2iE₁₂; exp(2πH)=1; exp(πH)=−I | α(H)=2, half-coroot excluded |
| §1.1 lattice | U(2), (1,1),(1,−1) | determinant −2 | index 2 |
| §1.2 polar structure | Euclidean g, dq∧dp | A(q,p)=(−p,q), −A²=1, ω(e₁,Je₁)=1 | holds |
| §1.2 shear | (q,p)↦(q+p,p) | fixed line p=0 Lagrangian; ‖e₂‖=‖ne₁+e₂‖ for all n impossible | no invariant metric |
| §3.1 gradient inequality | p=x⁴ | ‖∇p‖=4‖x‖³=4p^(3/4); bound (x₀⁴)^(1/4)/(4·¼)=‖x₀‖ | holds, θ=3/4 |
| §3.2 Kostant | O(2), ν=1 | {±1} versus [−1,1] | fails without connectedness: R01 |
| §3.2 matrix form | spectrum (2,0), row (√t,√(1−t)) | diagonal (2t,2−2t) | holds |
| §4 DH | ℂ, μ=‖z‖²/2, preimage of [0,R] | disk radius √(2R), area 2πR | density 2π |
| §4.1 level bundle | arrow h, right k | (ht)⁻¹(hx)=t⁻¹x; (tk)⁻¹x=k⁻¹(t⁻¹x) | holds |
| §4.2 common weight k | μ=k‖z‖²/2=c | radius² 2c/k, area 2πc/k, full-isotropy 2πc/k² | holds |
| §5.1 class | [0,c], supports 0,−c | −2π(0·D₁−c·D₂)=2πc D₂ | area 2πc |
| §5.2 oscillator | slice z₁>0 | a z₁²+b‖w‖²=2ε; residual e^(−2πibk/a); area (1/a)π(2ε/b)=2πε/(ab) | holds; (2,3): πε/3, w↦−w |

**Library declarations opened at the pins (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`).** 38 names of the supplier contracts resolve, among them `TauCeti.SmoothTwoForm.IsEquivariantMomentMap` (`EquivariantMomentMap/Basic.lean:170`, extends `IsMomentMap` of the fundamental action with `apply_smul`), `add_const_iff` (`:280`, `[Nonempty M]`), `IsMomentMap` (`MomentMap.lean:133`), `add_const` (`:160`), `comp` (`:183`), `IsEquivariantMomentMap.prod` (`EquivariantMomentMap/Prod.lean:50`), `SmoothTwoForm.prod` (`Manifold/Prod.lean:59`), `IsSymplectic` (`Manifold/TwoForm.lean:115`, closed and nondegenerate), `Toric.IsIntegralLattice` (`Toric/Algebraic/Lattice.lean:92`), `fundamentalVectorField_apply` (`Lie/FundamentalVectorField.lean:87`), `riemannianExp_mfderiv` (`Riemannian/Isometry/Exponential.lean:117`, no completeness), `tangentRepresentation` (`GroupAction/TangentRepresentation.lean:79`), the five `PolarCompatible.lean` names (`:134`, `:168`, `:175`, `:231`, `:243`), the six `WeightModel.lean` names (`:97`–`:413`), the three Schur–Horn theorems (`SchurHorn.lean:378`, `:401`, `:416`), `mem_convexHull_range_comp_perm_iff` (`PermutationOrbit.lean:257`), the chamber names (`RootSystem/Chamber.lean:141`, `:144`; `Weyl/Chamber.lean:107`, `:111`, `:186`, `:368`; `FundamentalDomain.lean:247`), `eval₂_mpullback` (`Pullback/Smooth.lean:249`), and Mathlib's `Submodule.starProjection`, `Representation.invariants`, `IsZLattice`, `Module.Basis.addHaar`, `GroupLieAlgebra`, `ContMDiffSMul`. No pinned declaration states torus convexity, a Delzant predicate, a Duistermaat–Heckman measure or the fixed-locus theorem (searched `TauCeti/Geometry`, `TauCeti/Analysis` and Mathlib by object).

**Cross-roadmap citations resolved on main (`71c8f21`).** All 15 suppliers are on main: SmoothBundlesConnections B2.4 (`:776`), B6.2–B6.3 (`:1668`, `:1716`, dual-character class with Hopf pairing 1) and Layers 1–4; Orbifolds O1–O5, O4 item 1 (`:298`), O4-N/S/R/K/W/T, O7; SchubertGeometry S2, S9 and the word121 calculation (`:140`, eight fixed subwords); LieGroups Layers 1, 2 and 6 (`:750`–`:751`: root characters with dχ_α=iα, α∨=2α♯/‖α‖², rank-one maps with dφ(diag(i,−i))=α∨, normalizer representatives); HamiltonianReduction R2, R2a items 2–4, R3, R3.1 (anchor `#r2-coadjoint-orbits-and-kks` exists); MorseTheory M1–M5; CharacteristicClasses C1 (`:700`–`:706`, u_i=−h_i) and C2–C3; AlgebraicTopology Stage 6; DifferentialGeometry Layers 0, 1, 6 and 5.5; HeegaardFloer §4.1; HopfRinow Layers 1 and 4 (`:521`); GeometricTopology Layer 1; ComplexKahlerGeometry K7.2 (ω_FS=(i/2π)∂∂̄log, value 1/π at the origin); AnalyticToricGeometry; RootSystems' Downstream consumers table (`:1136`) places its Layer 4 chambers at the two pinned names as the README says.

**Overlaps and ownership.** The dropped anchor `#t1-compact-symplectic-actions-and-local-models` is cited only by IntegrableSystems, which this pull request repoints to `#layer-1-compact-symplectic-actions-and-local-models` (`IntegrableSystems/README.md:21`), and the README maps T1–T5 to Layers 1–5. `roadmaps grep` for Delzant, Duistermaat, Kirwan convexity, moment polytope and the six declaration names over main and the open heads finds no second owner; GeometricQuantization cites this roadmap's T1, T3 and T4 as a consumer.

**Sources (seeded sample, read in the cached texts).** Cannas da Silva: Theorem 27.1 p. 169, Homework 21 exercise 2 p. 174 and exercises 3–5 pp. 174–175, Proposition 12.6 p. 70, Definition 28.1 p. 177, Theorem 28.2 p. 179, §§29.1–29.3 pp. 183–185, Definition 30.2 and Theorem 30.3 p. 191, Proposition 30.7 and Theorem 30.8 p. 194, §30.3 p. 195. Hilgert–Neeb–Plank: Lemma 2.1 pp. 140–141, Lemma 2.2 pp. 142–143, Theorem 3.10 p. 149, Theorem 4.1(v) p. 151. Lerman–Meinrenken–Tolman–Woodward v1 Theorem 1.1 (polytope, rationality, connected fibers). Lerman v2 Theorem 1.1 and proof pp. 3–5. Lerman–Tolman v1 Theorem 1.5 p. 3. Conrad–Landesman §18 p. 82 (discrete normal kernel, centre ±1), Appendix Q pp. 248–253, Proposition R.2.1 pp. 254–256. Escobar §3.2 pp. 6–8 and §4.1 pp. 12–13. Each supports the statement at its locator.

**Pull request description.** The three ConvexityToric bullets (§1.2, §3.3, §5.2) agree with the head.

## Not verifiable

- Kirwan, *Cohomology of quotients in symplectic and algebraic geometry*, Part I, §§4–5, pp. 44–78: not in the sources cache and not openly available; the README cites it by locator only.
- The journal articles listed in References without a locator at a target (Atiyah, Guillemin–Sternberg, Kirwan 1984, Duistermaat–Heckman, Delzant) were not opened; every target they bear on carries a Cannas da Silva or arXiv locator that was read.

## Source issues

- none
