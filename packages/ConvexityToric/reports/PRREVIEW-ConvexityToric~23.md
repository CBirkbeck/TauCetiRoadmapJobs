# Review of ConvexityToric (pull request #1651 at c955776)
Folder: `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/`

**Verdict:** needs changes

Full review of the folder at c955776. The folder is byte-identical to b46a9c85, which cites the pinned Tau Ceti Schur–Horn, polar-structure and weight-model declarations and deleted `schur_horn`; those repairs are checked below and are correct. Two P3 findings remain, neither in the mathematics: the family index, and one docstring locator.

## R01 (P3) — The family index still routes this roadmap's chambers through RootSystems

**Location:** `TauCetiRoadmap/SymplecticGeometry/README.md:66` ("RootSystems owns the abstract signed inversion/dual positivity and closed-wall chamber theorem") and `:80` ("T3/T4 consume RootSystems and HamiltonianReduction R2/R3").

**Claim:** The index describes this roadmap's suppliers. Since this pull request repointed the chambers to Tau Ceti, the folder cites RootSystems nowhere: its chambers are `RootPairing.dominantChamber`, `TauCeti.weylChamber` and `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` (`ConvexityToric/README.md:136–152`, `:269`, `:541`), and Layer 4 consumes HamiltonianReduction R3 only (`:875–876`). RootSystems on main says the same of its side (`RepresentationTheory/RootSystems/README.md:1158–1162`: ConvexityToric consumes the native chamber declarations).

**Witness:** `grep -c RootSystems TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md` prints 0; `grep -n RootSystems TauCetiRoadmap/SymplecticGeometry/README.md` prints `:66` and `:80`; `git diff origin/main...HEAD -- TauCetiRoadmap/SymplecticGeometry/README.md` is empty. The index is the pull request's own file, so the change belongs in this pull request.

**Exact repair** (in `TauCetiRoadmap/SymplecticGeometry/README.md`):
- `:66`: replace "RootSystems owns the abstract signed inversion/dual positivity and closed-wall chamber theorem" with "RootSystems owns the abstract signed inversion/dual positivity; Tau Ceti's `RootPairing.dominantChamber`, `TauCeti.weylChamber` and `TauCeti.existsUnique_mem_orbit_inter_dominantChamber` supply the abstract chambers and the closed-wall fundamental domain".
- `:80`: replace "T3/T4 consume RootSystems and HamiltonianReduction R2/R3" with "T3 consumes Tau Ceti's Weyl chambers and HamiltonianReduction R2, T4 HamiltonianReduction R3".

Tested: the three names resolve at the pin (`Chamber.lean:141`, `Weyl/Chamber.lean:107`, `FundamentalDomain.lean:247`), and the dependency check has no RootSystems edge from this folder.

## R02 (P3) — `fixedMoment` docstring points at the wrong section

**Location:** `Suggested.lean:102`, "In the order of the eight fixed flags in T3.1."

**Claim:** The table of eight fixed flags that `fixedMoment` transcribes is in §3.3 (`README.md:686–695`). §3.1 is torus and nonabelian convexity and lists no flags.

**Witness:** `README.md:620` (`### 3.3 The word121 Bott–Samelson moment polygon`) and `:697` ("Define `BottSamelson.fixedMoment` by the eight rows of this table").

**Exact repair:** replace the docstring with "The moment values of the eight torus-fixed flags, in the order of the table of README §3.3." No statement changes; the file elaborates as before.

## Verified sound

**Pins and scope.** Head c955776751d26b47cd7c8dd76b0e20e2cd9501c2. `lake-manifest.json` pins Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b; both package checkouts are at those commits. Main is 2bbd3cbf. The brief's excluding diff is empty. `changes.md`: 0 changed lines in the folder since b46a9c85.

**Gate.** The worker's gate: every counter 0, `build=0`, OK. My rerun: every counter 0 except `outside-folder=4`, the `CotangentLagrangian` and `IntegrableSystems` files that are this pull request's own. Dependency check:

```text
depcheck: 234 roadmaps, 2273 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean` on `Suggested.lean`: five `sorry` warnings (lines 74, 108, 116, 136, 186) and nothing else. No `set_option`, no `lemma`, no sorry'd data; imports are `Mathlib` and four Tau Ceti modules that exist at the pin. The 16 elaborated signatures of `signatures.md` agree with the README statements. `HamiltonianTorusData` carries `[IsManifold I ∞ M]`, both `CompleteSpace` binders, `[LieGroup IT ∞ T]` and `[ContMDiffSMul IT I ∞ T M]`; the three manifold headlines carry finite dimension, boundarylessness, Hausdorff, second countability, compactness and connectedness of M and compactness and connectedness of T in their own signatures. No binder is lost.

**One-tactic probe.** A scratch copy with each `sorry` replaced by `first | rfl | simp | infer_instance | decide | aesop | exact fun _ => rfl`: all five fail (errors at 82, 112, 121, 145, 208). No padding.

**Repairs of the previous round, against the pin** (17 declarations opened):
- `TauCeti/Analysis/InnerProductSpace/SchurHorn.lean`: `LinearMap.IsSymmetric.range_re_inner_apply_self_eq_convexHull_eigenvalues_comp_perm` `:401` (symmetric T, `finrank 𝕜 E = n`, orthonormal bases indexed by `Fin n`, hull of `eigenvalues ∘ σ`: as `README.md:127–130`), `exists_orthonormalBasis_re_inner_apply_self_eq_iff` `:416`, `exists_orthonormalBasis_re_inner_apply_self_eq_of_mem_convexHull` `:378`; `TauCeti.mem_convexHull_range_comp_perm_iff` (`Analysis/Convex/PermutationOrbit.lean:257`, for antitone w). `schur_horn` is gone from `Suggested.lean` and from its docstring; §3.2 keeps only the matrix corollary and the Kostant comparison.
- `TauCeti.tangentRepresentation` (`Geometry/Manifold/GroupAction/TangentRepresentation.lean:79`): a `ContRepresentation` of `stabilizer G x` on `TangentSpace I x`, hypothesis `MDifferentiableAt` at x only, no topology on G, as `README.md:101–105` says; Mathlib's `ContRepresentation.toRepresentation` (`RepresentationTheory/Continuous/Basic.lean:73`) and `Representation.invariants` (`RepresentationTheory/Invariants.lean:73`) give the invariant submodule §1.2 uses.
- `TauCeti/Geometry/Symplectic/PolarCompatible.lean`: `polarComplexStructure` `:134`, `apply_polarComplexStructure` `:168`, `compatible_polarComplexStructure` `:175`, `IsSymplectomorphism.polarComplexStructure_apply` `:231` (for a linear isometric equivalence that is a symplectomorphism), `exists_compatible_forall_isComplexLinearMap` `:243` (compact topological group, finite-dimensional E, continuous representation preserving ω). All are single-vector-space statements, as `README.md:114` says; smoothness along M stays this roadmap's target.
- `TauCeti/Geometry/Symplectic/Hamiltonian/WeightModel.lean`: `weightRotation` `:97`, `weightMomentMap` `:174` (`Σ (−½(qᵢ²+pᵢ²)) • αᵢ`, the README's sign), `hamiltonianVectorField_weightMomentMap` `:244`, `range_weightMomentMap` `:263`, `weightRotation_apply_eq_self_iff` `:283`, `finrank_range_weightInfinitesimalAction` `:413`.

**Other library names at the pins** (22, all resolve): `IsEquivariantMomentMap` (`EquivariantMomentMap/Basic.lean:170`), `add_const_iff` `:280` (with `[Nonempty M]`), `IsEquivariantMomentMap.prod` (`EquivariantMomentMap/Prod.lean:50`), `IsMomentMap` (`MomentMap.lean:133`), `add_const` `:160`, `comp` `:183`, `InfinitesimalAction.fundamental` (`Lie/FundamentalVectorField.lean:366`), `fundamentalVectorField_apply` `:87`, `SmoothForm.mpullback` (`Pullback/Smooth.lean:212`), `eval₂_mpullback` `:249`, `SmoothBundleForm.eval₂` (`DifferentialForm/Smooth.lean:249`), `SmoothTwoForm.prod` (`Symplectic/Manifold/Prod.lean:59`), `SmoothTwoForm.IsSymplectic` (`Symplectic/Manifold/TwoForm.lean:115`), `RiemannianIsometry.riemannianExp_mfderiv` (`Riemannian/Isometry/Exponential.lean:117`), `RootPairing.dominantChamber`/`openDominantChamber` (`Chamber.lean:141, 144`), `weylChamber`/`openWeylChamber` (`Weyl/Chamber.lean:107, 111`), `exists_smul_eq_of_mem_openWeylChambers` `:186`, `existsUnique_mem_openWeylChamber` `:368`, `existsUnique_mem_orbit_inter_dominantChamber` (`FundamentalDomain.lean:247`), `Toric.IsIntegralLattice` (`Toric/Algebraic/Lattice.lean`); Mathlib `ContMDiffSMul` (`Geometry/Manifold/Algebra/SMul.lean:68`), `Module.Basis.addHaar` (`MeasureTheory/Measure/Haar/OfBasis.lean:254`), `IsZLattice` (`Algebra/Module/ZLattice/Basic.lean:434`), `Matrix.unitaryGroup` (`LinearAlgebra/UnitaryGroup.lean:105`), `Submodule.starProjection`.

**Duplication by object.** The pinned Tau Ceti has no file on Delzant polytopes, Duistermaat–Heckman measures, moment polytopes, Bott–Samelson varieties or Liouville measure (case-insensitive grep; the six hits are unrelated uses of "convexity theorem" and Demazure operators). `library-matches.md` has no same-name hit and no candidate that states one of the five headlines. `roadmaps grep` finds `HamiltonianTorusData`, `torus_convexity`, `toric_fibers`, `toricImage_delzant`, `IntegralFacetPresentation` and `incidence_moment_range` only in this folder (this pull request and main); no fully qualified name clashes. Schur–Horn elsewhere: only Majorization's forward inequality (MAJ-A18–A25), which this roadmap no longer consumes.

**Cross-roadmap citations, resolved on main 2bbd3cbf** (24): LieGroups Layers 1, 2, 6 (`:301, 356, 673`, the compact real root and rank-one bullets `:750–751`); HamiltonianReduction R2 `:127`, R2a items 2–4 `:157 ff.`, R3 `:187`, R3.1 `:262`; SmoothBundlesConnections B2.4 `:776`, B6.2 `:1668`, B6.3 `:1716`; Orbifolds O1 `:87`, O4 item 1 `:298`, O4-N/S/R/K/W `:314–394`, O4-T `:419`, O5 `:672`; MorseTheory M1–M5 `:110–857`; CharacteristicClasses C1–C3 `:212, 728, 1000`; AlgebraicTopology Stage 6 `:946`; DifferentialGeometry Layers 0, 1, 6 `:268, 311, 782` and 5.5 `:528`; HeegaardFloer §4.1 `:2437`; HopfRinow (completed) Layer 1 `:264` and Layer 4 `:495`, with its transport across smooth Riemannian isometries at `:521`; GeometricTopology Layer 1 `:783`; SchubertGeometry S2 `:38`, S9 `:107`, word121 `:140`; ComplexKahlerGeometry K7.2 `:1444`; AnalyticToricGeometry (completed) `IsIntegralLattice` `:197`. `citations.md` lists no unresolved cross-roadmap citation; its seven Lean leads are this file's own declarations (`Suggested.lean:91, 99, 103, 108, 116, 168, 175`).

**Overlaps.** `overlaps.md`: the anchor `#t1-compact-symplectic-actions-and-local-models` is cited by IntegrableSystems on main `:16`. This pull request's own `IntegrableSystems/README.md:21` cites `#layer-1-compact-symplectic-actions-and-local-models`, and `ConvexityToric/README.md:197–198` maps T1–T5 to Layers 1–5; the description's `merge-order` block orders IntegrableSystems: this pull request → #1187. Not a finding. No other open pull request changes this roadmap, and no cited id is dropped. Consumers on main cite T1, T2 and T3 by label (LieGroups `:1454`, HamiltonianReduction `:143`, BordismFormalGroups `:2734`, TensorProductCombinatorics `:415`), which the label sentence keeps valid.

**Description.** The three ConvexityToric bullets agree with the head: §1.2 (arbitrary group, preserved metric, irrational rotation and shear), §3.3 (eight fixed flags, six vertices, a=c collision, a=0 limit), §5.2 (slice discs, area 2πε/(ab), ε=1/2).

**Sources** (lines read in the cached texts; the README flags no locator as unverified):
- Cannas da Silva `0b1c3a1f`: Proposition 12.6 line 2802; Theorem 27.1 line 6472; Homework 21 line 6630 with exercise 2 at line 6643 (fixed set of a subgroup); Definition 28.1 line 6730; Theorem 28.2 line 6822; §29.1 line 6934; Definition 30.2 line 7188; Theorem 30.3 line 7215; Proposition 30.7 line 7320; Theorem 30.8 line 7337; §30.3 line 7359.
- Hilgert–Neeb–Plank `d1611380`: Lemma 2.1 line 461 (before the page break at 463, so pp. 140–143 is right), Lemma 2.2 line 530, Theorem 3.10 line 769, Theorem 4.1 line 816 with item (v) at line 825.
- Lerman–Meinrenken–Tolman–Woodward `e47b0f8e` Theorem 1.1 line 45; Lerman `f7da6544` Theorem 1.1 line 131; Lerman–Tolman `e33ce367` Theorem 1.5 lines 92–97 (rational simple polytope, facet labels, classification and existence).
- Conrad–Landesman `bf051df7`: §18 kernel argument line 3786; Appendix Q p. 248 and Appendix R p. 254 (contents lines 80–81); Proposition R.2.1 line 11552.
- Escobar `0673b7d6`: §3.2 line 200, incidence description line 231, Grassmannian action line 253, §4.1 line 439.

**Headlines.** Torus convexity with connected fibers, the word121 image and its polygon, toric orbit fibers and the Delzant image are stated (five theorems). Kirwan and Kostant convexity, equivariant perfection, Duistermaat–Heckman, Delzant reconstruction and uniqueness with the cohomology ring, the fixed-locus theorem, the period/root comparison and the labeled-polytope classification are named in the module docstring with the missing carrier of each; none is forced through a stand-in. Schur–Horn is a pinned theorem and is cited.

**Adversarial table** (all rows recomputed this round).

| Statement | Instances tried | Values on both sides | Result |
| --- | --- | --- | --- |
| §1.1 moment sign (`HamiltonianTorusData`) | ℝ², dx∧dy, positive rotation | ξ_M=(−y,x); σ(ξ_M,v)=−y v₂−x v₁=d(−(x²+y²)/2)(v); with +(x²+y²)/2 at (1,0), v=e₁: −1 against +1 | ✓ |
| §1.1 equivariance Check | ℝ² translations, μ(x)(ξ)=σ(ξ,x) | dμ_ξ(v)=σ(ξ,v); defect at ξ=e₂, g=e₁: 0·0−1·1=−1 | ✓ |
| §1.1 preservation Check | ℤ/2, (x,y)↦(x,−y) | Lie algebra 0, μ=0 passes; pullback −dx∧dy ≠ dx∧dy | ✓ |
| §1.1 commutative specialisation | fields of pinned `IsEquivariantMomentMap` | `apply_smul`: μ(g·x)=Ad*_g μ(x); Ad=id on commutative T, so μ(g·x)=μ(x) | ✓ |
| §1.1 period, coroot, kernel | SU(2), H=diag(i,−i); SO(3); zero map | exp(2πH)=I, exp(πH)=−I; kernel {±I}; zero map has α(dφH)=0≠2 | ✓ |
| §1.1 U(2) lattice | (1,1),(1,−1) | det −2, index 2; (1,0) not in the span | ✓ |
| §1.2 polar J against the pin | Euclidean g, ω=dq∧dp | Ae₁=e₂, −A²=1, J=A, ω(e₁,Je₁)=1; −J gives −1 | ✓ |
| §1.2 weight model against the pin | weight +1, −1, 0 | −(q²+p²)/2 on both sides, Hessian −Id (index 2); +Id (index 0); fixed plane | ✓ |
| §1.2 shear, irrational rotation | S=((1,1),(0,1)); e^(iθ) on first ℂ | Sⁿe₂=ne₁+e₂, norm unbounded; fixed set {0}×ℂ, dimension 2 | ✓ |
| §2.1 Euler sign, Betti | weight-2 line; S²; trivial action on T² | 2u=−2h; (1,0,1); one fixed component, rank H¹=2 | ✓ |
| `torus_convexity` | point with trivial torus; S² height; trivial circle on S² | {0}=hull{0}; [−1,1]=hull{±1}, fibers circle/point/∅ all preconnected; {c}=hull{c} | ✓ |
| §3.1 nonabelian, gradient | SU(2) orbit radius r; p=x⁴ | chamber image {r}, torus projection [−r,r], 0 not on the orbit; ‖∇p‖=4\|x\|³=4p^(3/4), tail \|x₀\| | ✓ |
| §3.2 matrix corollary | spectrum (2,0); (1,1); n=0 | (2t,2−2t)=segment (2,0)–(0,2); {(1,1)}; {()} on both sides | ✓ |
| §3.3 table rows | all eight flags | e.g. (e₁,12,e₂): a·e₁+b(1,1,0)+c·e₂=(a+b,b+c,0); (e₂,23,e₃): (0,a+b,b+c); every row has sum a+2b+c | ✓ |
| `fixedMoment_convexHull` | general a,b,c>0; (1,1,1) | edges: z=0 rows 1,6; x=a+b+c rows 1,3; y=0 rows 3,4; z=b+c rows 4,8; x=0 rows 8,7; y=a+b+c rows 7,6; at (1,1,1): (3,1,0),(3,0,1),(2,0,2),(0,2,2),(0,3,1),(1,3,0) | ✓ |
| §3.3 rows 2, 5 | general; (2,1,1); (1,1,1); a=0, b=c=1 | row-6 coefficients c/(a+c), a/(a+c); (3,2,0) at 1/3, (2,3,0) at 2/3 on (4,1,0)–(1,4,0); both (2,2,0); six permutations of (2,1,0) | ✓ |
| §3.3 projector diagonals, KKS sign | 0, V3, initial plane, span(e₁+e₂); line (1,w) | (0,0,0), (1,1,1), (1,1,0), (½,½,0); σ(∂x,∂y)=−2, ω_FS=1/π, ratio −2π | ✓ |
| §4.1 DH | S² height; trivial circle; unit square for 2dx∧dy | mass 4π on [−1,1], density 2π; Dirac of mass 4π; mass 2 | ✓ |
| §4.2 variation | reversed circle on ℂ²; common weight k=2 | area 2πc, derivative +2π; effective πc, full-isotropy πc/2 | ✓ |
| §5.1 presentations (`region`) | normals ±1, supports 0,−1; translate by 2; rank 0; rank 1 empty list | [0,1]; supports 2,−3 give [2,3]; {0}; all of ℝ | ✓ |
| §5.1 `IsSmoothVertex`, `IsDelzant` | interval; normals ±2; duplicated facet; supports 0,0; x≥0 alone; rank 0 | smooth at 0 and 1; ±2 not a ℤ-basis; two active indices in dimension 1 and irredundancy fails; empty interior; not compact; Delzant with d=0 | ✓ |
| `toric_fibers`, `toricImage_delzant` | point with trivial torus; S² with effective circle | one orbit, one fiber, d=0, region {0}; fibers are circles or poles, image [−1,1] with normals ±1, supports −1,−1 | ✓ |
| §5.1 volumes | [0,c]; n-simplex; rectangle | 2πc; (2π)ⁿcⁿ/n!; (2π)²ab | ✓ |
| §5.2 area and periods | (a,b)=(2,3), ε=1/2; a=b=1 | (1/2)·π·(2ε/3)=π/6, axial periods π and 2π/3; 2πε | ✓ |
| Family index against the folder | `SymplecticGeometry/README.md:66, 80` | index names RootSystems; folder has 0 RootSystems citations | R01 |
| `fixedMoment` docstring | `Suggested.lean:102` against `README.md:620, 686–697` | docstring says T3.1; table is in §3.3 | R02 |

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, five layers each ending with Examples and Dependencies, Downstream consumers, References. Every definition (`HamiltonianTorusData`, the projector diagonal and moment, `fixedMoment`, `IntegralFacetPresentation` with `pairing` and `region`, `IsSmoothVertex`, `IsDelzant`) has its API bullets and at least three Checks. One module docstring, namespace `TauCetiRoadmap.ConvexityToric`, layer comments in README order, `theorem` only.

## Not verifiable

- Kirwan, *Cohomology of quotients in symplectic and algebraic geometry* (1984), Part I §§4–5 (`README.md:480–481`): no legal copy; cited by locator.
- Atiyah 1982, Guillemin–Sternberg 1982, Kirwan 1984 (Invent. Math. 77), Duistermaat–Heckman 1982 and Delzant 1988 (References only): paywalled. Their statements were checked through Cannas da Silva §§27–30, Lerman–Meinrenken–Tolman–Woodward and Lerman.
- Condevaux–Dazord–Molino (`README.md:519`) has no locator; Hilgert–Neeb–Plank Theorems 3.10 and 4.1 cover the route.
- Page numbers were not re-derived this round beyond the Hilgert–Neeb–Plank page break and the Conrad–Landesman contents; the texts and the locators are unchanged since the round that fixed the offsets.
- Elaboration and the computed instances do not prove the five admitted headlines.

## Source issues

- none
