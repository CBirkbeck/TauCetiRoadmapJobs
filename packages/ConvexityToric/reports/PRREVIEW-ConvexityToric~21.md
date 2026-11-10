# Review of ConvexityToric (pull request #1651 at 8979daa)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`

**Verdict:** needs changes

Full review of the folder at 8979daa. The folder has not changed since 99961d4f, which restated `HamiltonianTorusData` as the commutative specialisation of `TauCeti.SmoothTwoForm.IsEquivariantMomentMap`. That repair is correct and is checked below. The findings come from the pins this head carries (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b): the pinned Tau Ceti now proves one of the six headlines and three objects of §1.2, and the folder cites none of them.

## R01 (P2) — `schur_horn` is proved by the pinned Tau Ceti

**Location:** `Suggested.lean:86–94` (`theorem schur_horn`) and its docstring line `:14`. In `README.md`: `:21–22` ("Layer 3 adds realization of every majorized diagonal and the exact unitary-orbit image"), `:535–538` ("The headline `schur_horn` states Schur–Horn in both directions for every n≥0; prove its equivalence with majorization"), and the *Needs:* line `:549–551`.

**Claim:** The roadmap states the two-sided Schur–Horn theorem, and its equivalence with majorization, as its own targets and as a headline. At 2fd255d9 both are theorems of `TauCeti/Analysis/InnerProductSpace/SchurHorn.lean`:
- `LinearMap.IsSymmetric.range_re_inner_apply_self_eq_convexHull_eigenvalues_comp_perm` (`:401`): for a symmetric operator T on an n-dimensional inner product space over ℝ or ℂ, the diagonals `(Re⟪T eₖ, eₖ⟫)ₖ` over all orthonormal bases are exactly the convex hull of the rearrangements of the eigenvalues. No distinctness is assumed and n=0 is included.
- `LinearMap.IsSymmetric.exists_orthonormalBasis_re_inner_apply_self_eq_iff` (`:416`): the majorization form (prefix sums of the decreasing rearrangement, and the trace).
- Horn's realization is `…exists_orthonormalBasis_re_inner_apply_self_eq_of_mem_convexHull`. Rado's theorem is `TauCeti.mem_convexHull_range_comp_perm_iff` in `TauCeti/Analysis/Convex/PermutationOrbit.lean`.

The file is new at this pin (absent at 358314d4). The headline is the special case T = diag(spectrum) on ℂⁿ: the rows of a unitary U are an orthonormal basis e with `(U D U*)ₖₖ = ⟪T eₖ, eₖ⟫`, and the eigenvalues of a diagonal operator are the decreasing rearrangement of its entries, which has the same permutation orbit.

**Witness:** A scratch file importing `TauCeti.Analysis.InnerProductSpace.SchurHorn` (built with `lake build`) states the operator form of `schur_horn` for `Matrix.toEuclideanLin (Matrix.diagonal fun j ↦ (s j : ℂ))` on `EuclideanSpace ℂ (Fin n)`. The single term `hT.range_re_inner_apply_self_eq_convexHull_eigenvalues_comp_perm finrank_euclideanSpace_fin` closes it with no `sorry`.

**Exact repair:**
- `Suggested.lean`: delete `schur_horn` (`:86–94`) and remove "Schur–Horn," from the docstring's list of statable headlines (`:14`). Do not prove it in place.
- `README.md:21–22`: replace the sentence with "Tau Ceti owns the Schur–Horn theorem in both directions and its majorization form (`TauCeti/Analysis/InnerProductSpace/SchurHorn.lean`), with Rado's description of the permutohedron; Layer 3 identifies the diagonal moment image of a U(n) coadjoint orbit with that theorem."
- Supplier contract (`:63–113`): add the three declarations above with their files.
- `:535–538`: replace "The headline `schur_horn` states … total trace)" with a sentence consuming the pinned theorems. Keep as this section's target only the matrix corollary: for U ∈ U(n) and real s the diagonal of `U diag(s) U*` ranges over the convex hull of the permutations of s, obtained from the pinned theorem through the row basis of U and the spectrum of a diagonal operator, together with its agreement with Kostant's theorem for U(n).
- `:549–551`: list the pinned declarations in *Needs:*, in place of "OperatorTheory/Majorization Part A, MAJ-A18–A25, for the forward comparison".

**Tested:** a scratch copy of `Suggested.lean` with the theorem and the docstring word removed elaborates under `lake env lean` with five `sorry` warnings (`torus_convexity`, `incidence_moment_range`, `fixedMoment_convexHull`, `toric_fibers`, `toricImage_delzant`) and no other diagnostic.

## R02 (P2) — §1.2 restates three objects of the pinned Tau Ceti without citing them

**Location:** `README.md:305–306` ("Construct the derivative representation at p using native `Representation ℝ K (TangentSpace I p)`"); `:308–311` ("Polar-normalize the bundle endomorphism A … Prove smoothness, `J²=−1`, positivity `ω(v,Jv)>0` for v≠0, and invariance"); `:328–333` ("Prove the quadratic identity, stabilizers, orbit rank and local moment cone"); *Needs:* `:365–367`.

**Claim:** Each of these is stated as a construction or proof of this layer. At 2fd255d9 (all three files are absent at 358314d4):
- `TauCeti.tangentRepresentation` (`TauCeti/Geometry/Manifold/GroupAction/TangentRepresentation.lean:79`) is the representation of the stabilizer of x on `T_x M` by derivatives, with the chain rule as multiplicativity. At a common fixed point the stabilizer is all of K.
- `TauCeti.SymplecticForm.polarComplexStructure` (`TauCeti/Geometry/Symplectic/PolarCompatible.lean:134`) is J, the polar factor of the operator A with `⟪Au,v⟫=ω(u,v)`. `compatible_polarComplexStructure` (`:175`) gives `J²=−1` and positivity, `apply_polarComplexStructure` (`:168`) gives `ω(u,Jv)=⟪|A|u,v⟫`, and `IsSymplectomorphism.polarComplexStructure_apply` (`:231`) gives invariance under isometric symplectomorphisms. `exists_compatible_forall_isComplexLinearMap` (`:243`) is the compact-group averaging corollary at a fixed point.
- `TauCeti/Geometry/Symplectic/Hamiltonian/WeightModel.lean` has the model with the same sign, `TauCeti.weightMomentMap α = −½Σ(qᵢ²+pᵢ²)αᵢ` (`:174`). It proves the quadratic identity (`hamiltonianVectorField_weightMomentMap`, `:244`), the local moment cone −cone{αᵢ} (`range_weightMomentMap`, `:263`), the stabilizers (`weightRotation_apply_eq_self_iff`, `:283`) and the orbit rank (`finrank_range_weightInfinitesimalAction`, `:413`).

What remains for this layer is the manifold-level work: smoothness of the fibrewise polar J along M, the fixed-locus charts, and the equivariant Darboux identification of a neighbourhood of a fixed point with the pinned model.

**Witness:** the declarations at the lines above, and `roadmaps grep` for `weightMomentMap|polarComplexStructure|tangentRepresentation` over main and the open heads: "no match", so no roadmap cites them.

**Exact repair:**
- `:305–306`: "Use Tau Ceti's `TauCeti.tangentRepresentation` at p (the stabilizer of a common fixed point is K), with its underlying `Representation.invariants` submodule."
- `:308–311`: say that the fibrewise J is `TauCeti.SymplecticForm.polarComplexStructure` for the inner product g_p, with `J²=−1`, positivity and K-invariance from the three pinned theorems. The target here is that these fibrewise structures form a smooth bundle endomorphism. At `:321–323` cite `exists_compatible_forall_isComplexLinearMap` for the linear statement at a fixed point.
- `:328–333`: say that the local model is `TauCeti.weightMomentMap` with its pinned image, stabilizer and orbit-rank theorems. Replace "Prove the quadratic identity, stabilizers, orbit rank and local moment cone" with "Transport the pinned model's quadratic identity, stabilizers, orbit rank and moment cone to M through the equivariant Darboux chart", and keep the lattice statement for integer weights.
- Add the three files to the Tau Ceti contract (`:63–113`) and to *Needs:* (`:365–367`).

The README Checks agree with the pinned conventions: weight +1 gives `−(q²+p²)/2` on both sides, and for Euclidean g with ω=dq∧dp both give Ae₁=e₂, J=A and ω(e₁,Je₁)=1. No Check changes.

## R03 (P3) — Two page locators

**Location:** `README.md:360–361` and `:1031` ("Hilgert–Neeb–Plank, Lemmas 2.1–2.2, pp. 141–143"); `:665` and `:1029` ("Escobar … §3.2, p. 8").

**Claim and witness:**
- Hilgert–Neeb–Plank: the statement of Lemma 2.1 begins at the foot of printed p. 140 (`d1611380` line 461, two lines before the page break to p. 141 at line 463). Lemma 2.2 is on pp. 142–143 (line 530).
- Escobar: §3.2 begins on p. 6 (`0673b7d6` line 200). The incidence description and the action on Grassmannians, which the sentence cites it for, are on p. 7 (lines 231 and 253). Page 8 opens with the worked fixed-flag example (line 273).

**Exact repair:** "Lemmas 2.1–2.2, pp. 140–143" at both places; "§3.2, pp. 6–8" at both places.

## R04 (P3) — The family index still routes this roadmap's chambers through RootSystems

**Location:** `TauCetiRoadmap/SymplecticGeometry/README.md:66` ("RootSystems owns the abstract signed inversion/dual positivity and closed-wall chamber theorem") and `:80` ("T3/T4 consume RootSystems and HamiltonianReduction R2/R3").

**Claim:** The folder cites RootSystems nowhere (`grep -c RootSystems` on the folder README prints 0). Its chambers come from Tau Ceti (`README.md:97–113`, `:230`, `:376`, `:485`), and Layer 4 consumes HamiltonianReduction R3. RootSystems on main has no chamber layer: its former "Layer 4: chambers" maps to the native declarations (`RepresentationTheory/RootSystems/README.md:1136`).

**Witness:** `git diff origin/main...HEAD -- TauCetiRoadmap/SymplecticGeometry/README.md` is empty, and `grep -n RootSystems` on the index prints `:66` and `:80`. The dependency check finds no RootSystems edge from this folder. The previous report raised this and the index is unchanged.

**Exact repair:**
- `:66`: replace "RootSystems owns the abstract signed inversion/dual positivity and closed-wall chamber theorem" with "RootSystems owns the abstract signed inversion/dual positivity; Tau Ceti's `RootPairing.dominantChamber`, `TauCeti.weylChamber` and `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` supply the abstract chambers and the closed-wall fundamental domain".
- `:80`: replace "T3/T4 consume RootSystems and HamiltonianReduction R2/R3" with "T3 consumes Tau Ceti's Weyl chambers and HamiltonianReduction R2, T4 HamiltonianReduction R3".

## Verified sound

**Pins and scope.** Head 8979daa415adeca46e95af0694ca4edd74591b68. `lake-manifest.json` pins Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b, and the package checkouts are at those commits. Main is 8fe2a7b. The brief's excluding diff is empty. The folder is unchanged since 99961d4f.

**Gate.** The worker's gate: every counter 0, `build=0`, OK. My rerun gives every counter 0 except `outside-folder=4`, which lists the `CotangentLagrangian` and `IntegrableSystems` files that the brief names as this pull request's own. Dependency check:

```text
depcheck: 234 roadmaps, 2270 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. ConvexityToric is on main and consumes only main and the pins.

**Elaboration.** `lake env lean` on `Suggested.lean`: six `sorry` warnings at lines 74, 88, 118, 126, 146 and 196 and nothing else. No `set_option`, no `lemma`, no sorry'd data. The 17 elaborated signatures in `signatures.md` match the README statements. `HamiltonianTorusData` carries `[IsManifold I ∞ M]`, both `CompleteSpace` binders, `[LieGroup IT ∞ T]` and `[ContMDiffSMul IT I ∞ T M]`, and the three manifold headlines carry `ContMDiffSMul` explicitly. No binder is lost.

**One-tactic probe.** On a scratch copy with each `sorry` replaced by `first | rfl | simp | infer_instance | decide | aesop | exact fun _ => rfl`, all six fail (unsolved goals at 82, 93, 122, 155 and 218; a type mismatch at 131). `schur_horn` is not one-tactic padding. It is a corollary of a pinned theorem (R01).

**The repaired `HamiltonianTorusData`, against the pin** (11 declarations opened):
- `TauCeti.SmoothTwoForm.IsEquivariantMomentMap` (`…/Hamiltonian/EquivariantMomentMap/Basic.lean:170`) extends `IsMomentMap (InfinitesimalAction.fundamental …) μ` with `apply_smul : μ (g • x) = Lie.coadjointRepresentation ℝ I G g (μ x)`. Its section asks for `LieGroup I (minSmoothness ℝ 3) G`, complete model spaces, `IsManifold I' ∞ M` and `ContMDiffSMul I I' ∞ G M`, as `README.md:232–240` says.
- `IsMomentMap` (`…/Hamiltonian/MomentMap.lean:133`) has the fields `contMDiff` and `isHamiltonianVectorField`, with no equivariance, as `:79–81` says. `add_const` is at `:160` and `comp` along a Lie algebra homomorphism at `:183`.
- `add_const_iff` (`Basic.lean:280`) has `[Nonempty M]` and the invariance condition, as `:87–88` says. `IsEquivariantMomentMap.prod` (`EquivariantMomentMap/Prod.lean:50`) is for one group acting on two manifolds, as `:89–92` says.
- `InfinitesimalAction.fundamental` (`TauCeti/Geometry/Lie/FundamentalVectorField.lean:366`) and `fundamentalVectorField_apply` (`:87`, by `rfl`): ξ_M(x) = `mfderiv (fun g ↦ g • x) 1 ξ`.
- `SmoothForm.mpullback` (`…/DifferentialForm/Pullback/Smooth.lean:212`), `eval₂_mpullback` (`:249`), `SmoothBundleForm.eval₂` (`…/DifferentialForm/Smooth.lean:249`), `SmoothTwoForm.prod` (`…/Symplectic/Manifold/Prod.lean:59`).

**Other library names at the pins** (14, all resolve): `RootPairing.dominantChamber` and `openDominantChamber` (`Chamber.lean:141, 144`); `TauCeti.weylChamber`, `openWeylChamber`, `exists_smul_eq_of_mem_openWeylChambers`, `existsUnique_mem_openWeylChamber` (`Weyl/Chamber.lean:107, 111, 186, 368`); `existsUnique_mem_orbit_inter_dominantChamber` (`FundamentalDomain.lean:247`, under `:137` and `:148`, with `[P.IsRootSystem]`); `Toric.IsIntegralLattice`; `SmoothTwoForm` (`TwoForm/Basic.lean:37`); `SmoothTwoForm.IsSymplectic` (`Symplectic/Manifold/TwoForm.lean:115`); `RiemannianIsometry.riemannianExp_mfderiv` (`…/Isometry/Exponential.lean:117`); Mathlib `Module.Basis.addHaar` (`MeasureTheory/Measure/Haar/OfBasis.lean:254`), `GroupLieAlgebra` (`Geometry/Manifold/GroupLieAlgebra.lean:56`) and `ContMDiffSMul` (`Geometry/Manifold/Algebra/SMul.lean:68`). The previous report's remarks on `TauCeti.dominantChamber` and `Basis.addHaar` are repaired.

**Duplication by object at the pin.** Beyond R01 and R02, I searched the pinned Tau Ceti for Delzant polytopes, Duistermaat–Heckman, moment polytopes, Liouville measure, Bott–Samelson, fixed loci of isometry groups and period or cocharacter lattices of tori: no file. `TauCeti/Geometry/Symplectic/Manifold/Descent.lean` (the reduced form as a descent) and `Coadjoint.lean` (the linear KKS form) belong to HamiltonianReduction R3 and R2, which this roadmap consumes. `InvariantForm.lean` (the Lie derivative of an invariant form along fundamental fields vanishes) is not restated here.

**Cross-roadmap citations, resolved on main 8fe2a7b.** LieGroups Layers 1, 2 and 6 (`RepresentationTheory/LieGroups/README.md:301, 356, 673`); HamiltonianReduction R2 `:127`, R2a `:157`, R3 `:187`, R3.1 `:262`; Majorization MAJ-A18 `:153`, MAJ-A25 `:165`, milestone `:212`. Between 4452ffa, where the previous report resolved every other citation (SmoothBundlesConnections, Orbifolds, MorseTheory, CharacteristicClasses, AlgebraicTopology, DifferentialGeometry, HeegaardFloer, HopfRinow, GeometricTopology, SchubertGeometry, ComplexKahlerGeometry, AnalyticToricGeometry), and 8fe2a7b, main only adds new roadmap folders, so those resolutions stand. `citations.md` lists no unresolved cross-roadmap citation. Its seven Lean leads are this file's own declarations.

**Overlaps.** `overlaps.md` lists `#t1-compact-symplectic-actions-and-local-models` as dropped and cited by IntegrableSystems on main `:16`. This pull request's own `IntegrableSystems/README.md:21` cites `#layer-1-compact-symplectic-actions-and-local-models`, and `README.md:158–159` maps T1–T5 to Layers 1–5. The description's generated `merge-order` block orders `IntegrableSystems`: this pull request → #1187. Not a finding. No other open pull request changes this roadmap.

**Ownership against open pull requests.** `roadmaps grep` over main and the open heads finds `HamiltonianTorusData`, `schur_horn`, `torus_convexity`, `toric_fibers`, `incidence_moment_range` and `IntegralFacetPresentation` only in this folder (and its version on main). No fully qualified name clashes.

**Sources, seeded sample** (read at the cached texts):
- Cannas da Silva `0b1c3a1f` (printed page = marker − 8): Proposition 12.6 line 2802, p. 70; Definition 22.1 p. 133; Theorem 27.1 line 6472, p. 169; Homework 21 line 6630, p. 174, exercise 2 at line 6643 (the fixed set of a subgroup is a symplectic submanifold, by the invariant-J exponential argument the README generalises); Definition 28.1 line 6730, p. 177; Theorem 28.2 line 6822, p. 179; §§29.1–29.3 lines 6934–7025, pp. 183–185; Definition 30.2 line 7188 and Theorem 30.3 line 7215, p. 191; Proposition 30.7 line 7320 and Theorem 30.8 line 7337, p. 194; §30.3 line 7359, p. 195.
- Hilgert–Neeb–Plank `d1611380`: Theorem 3.10 line 769, p. 149; Theorem 4.1 line 816, p. 151, with item (v) at lines 825–827 giving the local cone t₀^⊥ + cone of the slice weights, as `:477–480` states. Lemma 2.2 (line 532) uses the scalar product ω(Iv,w), which the README says it translates. Lemmas 2.1–2.2: see R03.
- Lerman–Meinrenken–Tolman–Woodward `e47b0f8e`: Theorem 1.1, line 45. Lerman `f7da6544`: Theorem 1.1 line 131, proof to line 247, pp. 3–5. Lerman–Tolman `e33ce367`: Theorem 1.5, line 92.
- Conrad–Landesman `bf051df7`: §18, p. 82, lines 3786–3788 (the kernel is discrete normal, hence central, and the centre of SU(2) is {±1}); Proposition R.2.1 line 11552, p. 254.
- Escobar `0673b7d6`: §4.1 line 439, p. 12. §3.2: see R03.
- The README flags no locator as unverified.

**Headlines.** The README's headlines: torus convexity with connected fibers; Kirwan convexity; Kostant projection and Schur–Horn; the word121 image and polygon; equivariant perfection; Duistermaat–Heckman; toric fibers, Delzant image, Delzant classification and its cohomology ring; the labeled-polytope classification. Six are stated; `schur_horn` goes (R01). The docstring names the missing carriers for each of the others, and no stand-in is stated.

**Adversarial table.** Rows marked ★ were computed this round. The other rows are statements whose text is unchanged since the round that computed them, with those values.

| Statement | Instances tried | Values on both sides | Result |
| --- | --- | --- | --- |
| ★ §1.1 moment sign | ℝ², dx∧dy, positive rotation | ξ_M=(−y,x); σ(ξ_M,v)=−y v₂−x v₁=d(−(x²+y²)/2)(v); +(x²+y²)/2 at (1,0), v=e₁: −1 against +1 | ✓ |
| ★ §1.1 equivariance Check | ℝ² translations, μ(x)(ξ)=σ(ξ,x) | dμ_ξ(v)=σ(ξ,v)=σ(ξ_M,v); defect σ(e₂,e₁)=0·0−1·1=−1≠0 | ✓ |
| ★ §1.1 preservation Check | ℤ/2, (x,y)↦(x,−y) | Lie algebra 0, μ=0 passes; pullback of dx∧dy is −dx∧dy | ✓ |
| ★ §1.1 products | T₁×T₂ on M₁×M₂ | (g₁,g₂)·(x₁,x₂)=(g₁x₁,g₂x₂); moment μ₁∘pr₁+μ₂∘pr₂=μ₁⊕μ₂ | ✓ |
| ★ `HamiltonianTorusData` against the pin | fields of `IsEquivariantMomentMap`, `IsMomentMap` | `preserves` + moment equation + `apply_smul`; Ad trivial on a commutative group, so `apply_smul` is invariance | ✓ |
| ★ `schur_horn` against the pin | T=diag(2,0); n=0 | pinned hull: segment (2,0)–(0,2), diagonals (2t,2−2t); n=0: {()} on both sides; operator form closed by one term | R01 |
| ★ §1.2 polar J against the pin | Euclidean g, ω=dq∧dp | Ae₁=e₂, −A²=1, J=A, ω(e₁,Je₁)=1; pinned ω(u,Jv)=⟪\|A\|u,v⟫ gives 1 | R02 |
| ★ §1.2 weight model against the pin | weight +1 | README −(q²+p²)/2; `weightMomentMap` −½(q²+p²)α; image −cone{α} on both | R02 |
| ★ `fixedMoment_convexHull` | (1,1,1); general a,b,c>0 | x+y+z=4, x,y≤3, z≤2: vertices (3,1,0),(3,0,1),(2,0,2),(0,2,2),(0,3,1),(1,3,0); general edges: z=b+c rows 4,8; x=a+b+c rows 1,3; y=0 rows 3,4; x=0 rows 7,8; y=a+b+c rows 6,7; z=0 rows 1,6 | ✓ |
| ★ §3.3 rows 2, 5 | (1,1,1); (2,1,1) | both (2,2,0); (3,2,0),(2,3,0) at t=1/3, 2/3 on (4,1,0)–(1,4,0) | ✓ |
| ★ §5.1 presentations | normals ±1, supports 0,−1; translate by 2; rank 0 | [0,1]; supports 2,−3 give [2,3]; empty list gives {0}, compact with nonempty interior | ✓ |
| ★ §5.1 `IsSmoothVertex` | interval at 0; normals ±2 | active normal +1 is a ℤ-basis; ±2 is not | ✓ |
| ★ `toric_fibers`, `toricImage_delzant` rank 0 | point, trivial torus | one orbit, one fiber; d=0, region {0} | ✓ |
| ★ §5.2 area | (a,b)=(2,3), ε=1/2; a=b=1 | (1/2)π(2ε/3)=π/6; 2πε | ✓ |
| ★ §4.1 DH | S² height; trivial circle | mass 4π on [−1,1], density 2π; Dirac 4π | ✓ |
| ★ chamber hypotheses | `FundamentalDomain.lean:137, 148, 247` | linear order, strict ordered ring, finite index, crystallographic, reduced, reduced flip, root system: as `README.md:106–109` | ✓ |
| ★ family index | `SymplecticGeometry/README.md:66, 80` | index names RootSystems; folder has 0 RootSystems citations | R04 |
| §1.1 period, coroot | SU(2), H=diag(i,−i) | exp(2πH)=I; H/2 gives −I; α∨=H for both metric scalings | ✓ |
| §1.1 kernel bound | id, SO(3), zero map | {I}; {±I}; zero map fails α(dφH)=2 | ✓ |
| §1.1 U(2) lattice | (1,1),(1,−1) | det −2, index 2 | ✓ |
| §1.2 shear, irrational rotation | S=((1,1),(0,1)); e^(iθ) on first ℂ | ‖Sⁿe₂‖ unbounded; fixed set {0}×ℂ | ✓ |
| §1.2 weight signs | +1, −1, 0 | Hessian −Id (index 2), +Id (index 0), fixed plane | ✓ |
| §2.1 Euler sign, Betti | weight-2 line; S²; trivial T² | 2u=−2h; (1,0,1); rank H¹=2 | ✓ |
| `torus_convexity` | point; S² height | {0}; [−1,1]=hull{±1}, fibers circle, point, ∅ | ✓ |
| §3.1 nonabelian, gradient | SU(2) orbit radius r; p=x⁴ | chamber {r}, torus [−r,r]; ‖∇p‖=4p^(3/4), tail \|x₀\| | ✓ |
| §3.3 projector diagonals | 0, V3, initial plane, span(e₁+e₂) | (0,0,0), (1,1,1), (1,1,0), (½,½,0) | ✓ |
| §3.3 KKS/FS sign | line (1,w) | σ(∂x,∂y)=−2, ω_FS=1/π, ratio −2π | ✓ |
| §4.2 variation | reversed circle on ℂ²; weight k=2 | area 2πc, dA/dc=2π; πc and πc/2 | ✓ |
| §5.1 volumes | [0,c]; simplex; rectangle | 2πc; (2π)ⁿcⁿ/n!; (2π)²ab | ✓ |

**Shape.** One module docstring, namespace `TauCetiRoadmap.ConvexityToric`, layer section comments in README order, `theorem` only, imports `Mathlib` plus four Tau Ceti modules that exist at the pin. Every layer ends with Examples and Dependencies, and every definition has at least three Checks.

## Not verifiable

- Kirwan, *Cohomology of quotients in symplectic and algebraic geometry* (1984), Part I §§4–5 (`README.md:424–425`): no legal copy; the README cites it by locator.
- Atiyah 1982, Guillemin–Sternberg 1982, Kirwan 1984 (Invent. Math. 77), Duistermaat–Heckman 1982 and Delzant 1988 (References only): paywalled. Their statements were checked through Cannas da Silva §§27–30, Lerman–Meinrenken–Tolman–Woodward and Lerman.
- Condevaux–Dazord–Molino (`README.md:463`) has no locator; Hilgert–Neeb–Plank Theorems 3.10 and 4.1 cover the route.
- I did not derive the matrix form of `schur_horn` from the pinned theorem in Lean. The operator form is closed by one term; the row-basis and diagonal-spectrum steps are argued in R01, not elaborated.
- Elaboration and the computed instances do not prove the five remaining admitted headlines.

## Source issues

- none
