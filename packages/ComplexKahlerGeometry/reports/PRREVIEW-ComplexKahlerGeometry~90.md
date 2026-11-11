# Review of ComplexKahlerGeometry (pull request #1807 at 806b373)

**Verdict:** needs changes

## R01 (P2) — ComplexKahlerGeometry supplies, and is supplied by, RealAnalyticGeometry and PseudodifferentialOperators

**Location.** `TauCetiRoadmap/ComplexKahlerGeometry/README.md` 110–113: "RealAnalyticGeometry R0–R5 … consumes K1–K4, K5a's local estimates, K5b.0 and K6.0"; 104–107: "PseudodifferentialOperators P1.0 … after K5a's initial density-line construction and before its analytic scale". Contracts are at 310–314 and 327–331.

**Claim.** 3.4 and 6.4 consume RealAnalyticGeometry R1 and R5. 5.1, 5.4 and 5.7 consume PseudodifferentialOperators P1.0. Both roadmaps also consume this one, so each pair forms a two-roadmap cycle.

**Witness.** `RealAnalyticGeometry/README.md` line 22 (main): "Consume ComplexKahlerGeometry K3.0's … K4's Chern connection … K6.0's … CK K5a's". `PseudodifferentialOperators/README.md` line 91 (main): "From TauCetiRoadmap.ComplexKahlerGeometry. K5a supplies bundle distributions…".

**Repair.** Make supply run one way, from ComplexKahlerGeometry to both roadmaps:
- Move 3.4's finite regular-piece partition, and 6.4's triangulated integral class with its integration comparison, to "ComplexKahlerGeometry, Part II", placed after RealAnalyticGeometry. Then delete the RealAnalyticGeometry contract.
- Move P1.0's differential-operator carrier, Laplace-type predicate, symbol and formal-density-adjoint maps into K5a, with PseudodifferentialOperators P1.0 citing K5a. Then delete the PseudodifferentialOperators contract.

## R02 (P2) — 8.1 owns the decreasing-filtration regrading that AlgebraicTopology §5.0 owns at this head

**Location.** README 3338–3344: "as the increasing filtration `G_t=F^(−t)` … the cohomological reindexing in which `E_r^(p,q)` is the native page `r+1` object at `(2p+q+1,−p−1)`".

**Claim.** 8.1 plans the generic regrading of a decreasing cochain filtration as part of its own Frölicher adapter.

**Witness.** `AlgebraicTopology/README.md` 2173–2186 at this head owns the same object: "For a decreasing cochain filtration F^p use the increasing functor G_t=F^(−t) … native page r+1 at (a,b)=(2p+q+1,−p−1)". It names "ComplexKahlerGeometry K8's column-filtration adapter" as the consumer, and 5337–5339 repeat this.

**Repair.**
- In 8.1, replace the clauses "as the increasing filtration `G_t=F^(−t)` … `(2p+q+1,−p−1)`, of total degree `p+q`" with "regraded by AlgebraicTopology §5.0's decreasing-filtration reindexing".
- Add "§5.0 (regrading of decreasing filtrations)" to the AlgebraicTopology contract (318–321) and to 8.1's *Needs:*.
- Keep the type complex, the column filtration and `E₁^(p,q)=H^(p,q)_∂̄` as this roadmap's own.

## R03 (P3) — The rewritten consumer sentence misstates CharacteristicClasses C7.6 and GeneralizedCohomology

**Location.** README 3532–3533: "C7.6 consumes K7.1's biholomorphism CP¹≃`OnePoint ℂ`; MorseTheory and GeneralizedCohomology use K7.1 and K7.2."

**Claim.** C7.6 consumes K7.1's biholomorphism with `OnePoint ℂ`, and GeneralizedCohomology uses K7.2.

**Witness.** `CharacteristicClasses/README.md` 272–274 at this head: "C7.6 uses only K7.1's comparison of the sphere-quotient model … with `Projectivization ℂ (Fin 2 → ℂ)`; the Riemann-sphere diffeomorphism … is Tau Ceti's". `GeneralizedCohomology/README.md` 417 consumes "K1 and K7.1".

**Repair.** Replace the bullet with: "CharacteristicClasses C2.4a consumes K7.1's projective atlas and C7.6 K7.1's comparison of `TauCeti.ComplexProjectiveSpace 1` with `Projectivization ℂ (Fin 2 → ℂ)`; MorseTheory uses K7.1 and K7.2, and GeneralizedCohomology K1 and K7.1."

## R04 (P3) — 7.1 applies Tau Ceti's topological instances and atlas to Mathlib's topology, but at the pins they live on Tau Ceti's own copy

**Location.** README 2702–2711: "with Mathlib's quotient topology … and Tau Ceti's instances … `instT2Space` … `instCompactSpace` … `instSecondCountableTopology` and `instPathConnectedSpace`". The affine atlas at 2717 has the same problem. The contract at 318–319 cites "4.6's quotient topology on `Projectivization`", and 2754 repeats it.

**Claim.** The pinned Hausdorff, compactness, second-countability and path-connectedness instances, and the affine atlas, hold for Mathlib's instance.

**Witness.** At the Tau Ceti pin, `Topology/Algebra/Projectivization.lean:90` redeclares `instTopologicalSpace`, and `instT2Space` (`:188`) is stated for that copy; README 2727 concedes the clash. `AlgebraicTopology/README.md` 1825–1827 says the same. Its 4.6 takes the topology from Mathlib.

**Repair.**
- Replace "and Tau Ceti's instances (…) … `instPathConnectedSpace` (…)" with: "and prove on Mathlib's instance the Hausdorff, compactness, second-countability and path-connectedness properties and the affine atlas that Tau Ceti pins on its own copy of the same coinduced topology, by repeating those proofs or transporting them through the comparison with `TauCeti.ComplexProjectiveSpace n`".
- In 318–319 and 2753–2754, replace the quotient-topology attribution with "4.6's cells of ℂPⁿ on `TauCeti.ComplexProjectiveSpace`".

## R05 (P3) — Sampled theorems without a source locator (previous R09 only partly repaired)

**Location.** Theorems with no locator:
- 3.5, 1044–1049: Hartogs extension across `dimℂ A ≤ n−2` and its point case. The `hartogs_extension_across_point` docstring (`Suggested.lean` 300–304) has none either.
- 6.4, 2543–2547: "Own Lelong local finite-mass estimates … Stokes for analytic sets".
- 7.9, 3267–3270: the Hopf surface.
- 2.4, 709–716; 1.2, 443–446; 5.4.

**Claim.** These theorems carry no locator.

**Witness.** Demailly I (3.28), p. 28 (demailly-agbook line 1266), is Hartogs extension for n≥2. II (6.1), p. 105 (line 5189), gives local boundedness in codimension ≥2. III (2.6)–(2.7), p. 140 (lines 6997, 7027), is Lelong's theorem. VI (4.7), p. 297 (line 14702), is the Hopf surface.

**Repair.**
- 3.5's point case and the docstring: add "(Demailly, Chapter I, (3.28), p. 28)".
- The codimension-two case: add "(Demailly, Chapter II, (6.1), p. 105, with (4.2), p. 91)".
- 6.4: add "(Demailly, Chapter III, (2.6)–(2.7), p. 140)".
- 7.9: add "(Demailly, Chapter VI, (4.7), p. 297)" after "not Kähler since `H²(M;ℝ)=0`".
- 2.4, 1.2 and 5.4: add a locator, or write "this roadmap's own" as 2.2 does.

## R06 (P3) — The docstring gives the wrong reason why the Hopf diamond cannot be stated

**Location.** `Suggested.lean` 89–91: "the pins have no Hopf surface, that is, no free properly discontinuous action of the dilations `z ↦ 2^m z` on `ℂ² ∖ {0}` with its quotient complex manifold".

**Claim.** The pins lack the quotient complex manifold.

**Witness.** The quotient manifold of a free, properly discontinuous smooth action is pinned:
- Mathlib `MulAction.instChartedSpaceQuotient` (`Geometry/Manifold/Instances/Quotient.lean:50`);
- Tau Ceti `instIsManifoldQuotient` (`Geometry/Manifold/Instances/Quotient.lean:242`).

What is missing is the dilation action together with its instances.

**Repair.** Replace the clause with: "the pins have the quotient manifold of a free, properly discontinuous smooth action (Mathlib's `MulAction.instChartedSpaceQuotient`, Tau Ceti's `instIsManifoldQuotient`), but not the dilation action of ℤ on `ℂ² ∖ {0}` with its `ProperlyDiscontinuousSMul`, `IsCancelSMul` and `ContMDiffConstSMul` instances".

## R07 (P3) — Frölicher's Euler-characteristic identity is not a target (previous R05 partly repaired)

**Location.** README 3350–3352: "the Frölicher inequality `b_k ≤ Σ_(p+q=k) h^(p,q)`, with equality for every k exactly when every `d_r`, `r≥1`, vanishes".

**Claim.** 8.1 stops at the inequality and omits the identity proved from the same spectral sequence.

**Witness.** Demailly VI (11.7), p. 323 (demailly-agbook line 16000), proves `Σ(−1)^k b_k = Σ(−1)^(p+q) h^(p,q)` for every compact complex manifold. On the Iwasawa manifold both sides are 0 (1−4+8−10+8−4+1 and 1−5+11−14+11−5+1).

**Repair.** After the inequality, add: "and the Euler-characteristic identity `Σ_k(−1)^k b_k=Σ_(p,q)(−1)^(p+q)h^(p,q)` on every compact complex manifold (Demailly, Chapter VI, (11.7), p. 323)".

## R08 (P3) — The description misstates what C7.6 consumes

**Location.** Pull-request description: "two sentences name CharacteristicClasses C1.5a, C2.4a and C7.6 … as the consumers of K7.1's projective atlas, of its biholomorphism CP¹ ≃ `OnePoint ℂ` and of the comparison of the finite projective spaces with the infinite one."

**Claim.** C7.6 consumes K7.1's biholomorphism with `OnePoint ℂ`.

**Witness.** `CharacteristicClasses/README.md` 272–274 at this head: C7.6 uses K7.1's comparison of the sphere-quotient model with `Projectivization ℂ (Fin 2 → ℂ)`, and the `OnePoint` diffeomorphism is Tau Ceti's.

**Repair.** Replace with: "…as the consumers of K7.1's projective atlas (C2.4a), of its comparison of `TauCeti.ComplexProjectiveSpace 1` with `Projectivization ℂ (Fin 2 → ℂ)` (C7.6) and of the finite-to-infinite projective comparison (C1.5a)."

## Verified sound

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| Previous R01 (VariationalMethods, UnboundedOperators) | 5.7 at head | Cites `IsCoercive.formSolutionOperator`, `isSelfAdjoint_of_surjective_addSub`, `HasCompactResolvent`; all present in Tau Ceti `Variational/Spectrum.lean`, `LinearPMap/*` | repaired |
| Previous R02 (twisted identities, Kähler) | 6.1, 2388 | "over a Kähler manifold (X,ω) … (1.1) with τ=0 … (1.3)"; for non-Kähler ω, (1.2) adds torsion | repaired |
| Previous R03 (Layer 7 headlines) | `Suggested.lean` 481–528 | ℂPⁿ Hodge, Betti and cup ring and torus Hodge numbers are stated on the pinned models | repaired |
| Previous R04 (ℂPⁿ carrier) | 7.1, 2744–2754; AT 4.6 at head | Comparison owned by K7.1, matching AT 1863–1866; the instance attribution remains wrong | partly: R04 |
| Previous R05 (Frölicher) | `Suggested.lean` 549 | inequality stated; (11.7) identity absent | partly: R07 |
| Previous R06 (LieGroupoidsPoisson) | README 116, 3385 | consumes only §G1.3; no sentence makes LieGroupoidsPoisson a consumer | repaired |
| Previous R07 (pinned targets) | 1.3, 466; 7.1, 2764; 273 | `baseChange_nijenhuis_…`, `OnePoint.diffeomorphProjectivization` cited; ComplexTori narrowed to items 3–4 | repaired |
| Previous R08 (locators) | 8.2, 3379; docstrings 422, 431 | Angella §4.1/§4.2 p. 13 give b₁=4, h^(1,0)=3, h^(0,1)=2; "(8.5) and (8.12)" | repaired |
| Previous R09, R10, R11 | 5.9, 7.3, 8.3 have locators; 3.4 chain starts at `(0)`; docstring 53–58 names `∂̄_V` | 1.2, 5.4, 7.9 still unlocated | R09 partly (R05); R10, R11 repaired |
| Previous R12, R13 | folder diff vs main 3 lines, no headings; merge-order block orders #1808, #1854 | no dropped ids (overlap check) | R12 moot; R13 repaired |
| 1.1 orientation, holomorphy | `z↦2z`, `z↦z̄`, `|z|²` | det 4=|2|², det −1; `φ_z̄=z` vanishes only at 0; for `z̄`, `ℓ(i)=−i≠i=iℓ(1)` | holds; none |
| 1.3 type calculus | `Nijenhuis.lean:18`; `Dolbeault/Basic.lean:414` | `N=[JX,JY]−[X,Y]−J[JX,Y]−J[X,JY]`; `∂²f(v,w)=−¼∂̄f(N(v,w))`; `u^(1,0)=∂_z`, `J∂_z=i∂_z` | holds; none |
| 2.1 polydisc lemma, Cauchy–Pompeiu | Demailly I (3.29) p. 28 (line 1288); Rainer (10.6) | local lemma only, whole polydisc own; `π⁻¹∫(w−ζ)⁻¹f∂̄χ = −π⁻¹∫f∂̄χ/(ζ−w)` | holds; none |
| 2.2 finite-rank Runge | annulus K={2≤|z|≤3} in {|z|<4}, f=1/z | ∮(f−Af)=2πi, length 4π gives sup≥1/2>ε·2/3 iff ε<3/4; Rainer 10.3 p. 24, 11.1 p. 25 | holds; none |
| 2.4 Dolbeault cohomology | ℂ×, `dz̄/z̄`; n=0; q=0 | `dz̄/z̄=∂̄log|z|²`, ∮=−2πi; polydisc=univ, H^(0,0)=ℂ; coboundaries `⊥` by `rfl` | holds; R05 |
| 3.1 realified atlas, sheaf | pinned names | `restrictScalars_of_ne_zero`, `contMDiff_iff_mdifferentiable`, `smoothSheafIso`, `smoothStalkIso` resolve at pin | holds; none |
| 3.5 Riemann, Hartogs | g=z on ℂ; 1/z; k=0 | Demailly II (4.2) p. 91 states locally bounded extension; 1/z unbounded; k=0 forces U=∅ | holds; R05 |
| 4.4 componentwise, local systems | ℂ⊔ℂ ranks 0, 2; `d−a dz/z` | fibres 0, ℂ²; `z^a` gives `M=e^(2πia)`; Demailly V (6.6)–(6.7) pp. 260–261, IV (16.8) p. 249 | holds; none |
| 5.2 local structure | H–S 1.70 p. 35, 4.22 p. 90 | 4.22: `u|Ω=∂^α f`, f continuous, via `E_(N+2)`; `exp(1/‖x‖²)`: `Cε^(−N)` against `ε^n exp((1+c)^(−2)ε^(−2))` | holds; none |
| 5.5 punctured plane | z=±i | `Log_−−Log_+`: 0 at i, 2πi at −i; `c_U−c_L=0−(−2πi)=2πi`; `dz/z=β+iα` | holds; none |
| 6.4 analytic cycles | Łojasiewicz Thm 2 p. 464 (line 512); cusp cubic; `xy=0` | countable real-analytic M, locally finite families; ∫ω_FS=3; `[V]=2[ℂP¹]` | holds; R05 |
| 7.4 incidence blowup | chart overlap; k=1 | `a'=az_k`, `z'_i=1/z_k`, `z'_j=z_j/z_k`; F(tv)=t⁻¹F(v) forces F=0; Knutson §1 p. 1 | holds; none |
| 7.5 rational quartic | n=1, 2 | `(a,b,c,d)↦(a,b,0,c,d)`; exponent sums 0..8, 10−9=1, `x₀x₃−x₁x₂` gives `s⁴t⁴−s⁴t⁴=0` | holds; none |
| 7.6 complex tori | n=0, 1, 2; L=ℤ⊂ℂ | 1; C(1,p)C(1,q); h^(1,1)=4, b₂=6=C(4,2); ℂ/ℤ=ℂ× not compact; Demailly VI (4.5) p. 297 | holds; none |
| 7.8 flat lines | ρ=exp(aλ); holonomy; Green gauge | `Re(aτ)=v` recomputed, recovers a=α+iβ; `(λ,v)~(0,ρ⁻¹v)`; u=−2Gφ gives F=0; BE–T Rem 2.1 p. 6 | holds; none |
| `newlander_nirenberg` | J=i on ℂ; E=0 | `id` intertwines i; n=0 point target; binders `Boundaryless`, `T2Space`, `finrank=2n` present | holds; none |
| `dolbeault_grothendieck_polydisc` | n=1, `z̄dz̄`; r≤0 | ψ=z̄²/2; empty polydisc, φ=ψ=0 | holds; none |
| `exists_mixed_parameter_dbar_solution` | P=Q=pt, f=1; f=q̄ | u=z̄: `(1+i·(−i))/2=1`; q̄ excluded by `hfhol` | holds; none |
| `weierstrass_preparation` | `w²−z`; d=0 | u=1, a=(−z,0); u=f | holds; none |
| `weierstrass_preparation_unique` | `(1+z)(w−z)` | unit 1+z, a₀=−z forced; P−P′ of degree <d divisible by P′ is 0 | holds; none |
| `weierstrass_division` | w³ by w²−z; d=0 | q=w, r=zw; q=f/g | holds; none |
| `ruckert_nullstellensatz` | f=z², g=z; k=0 | m=2; g vanishes near x, m=1 | holds; none |
| `oka_coherence` | (z₁,z₂); k=0 | relation (z₂,−z₁) generates; m=0 | holds; none |
| `cartan_coherence_reducedIdeal` | f=z² on ℂ | reduced ideal (z), not (z²) | holds; none |
| `riemann_extension` | g=z, f=sin z/z; 1/z | extends by 1; unbounded, excluded | holds; none |
| `isRegularLocalRing_holomorphicStalk` | n=0, 1 | ℂ, dim 0; DVR (`instIsDiscreteValuationRingStalk`), dim 1; `infer_instance` fails | holds; none |
| `uniqueFactorizationMonoid_holomorphicStalk` | cusp, node | `w²−z³` irreducible; `w²−z²−z³=(w−z√(1+z))(w+z√(1+z))` | holds; none |
| `hartogs_extension_across_point` | dim 1, 1/z; non-Hausdorff M | excluded by `2≤finrank`; extension local in a chart | holds; R05 |
| `hodge_theorem_deRham` | S¹; empty M | harmonic 1-forms ℝdθ, b₁=1; sign `(−1)^(m(k+2)+1)` = `Codifferential.lean:88`; both sides 0 | holds; none |
| `finiteDimensional_dolbeaultCohomology` | ℂP¹ | h^(0,1)=0; `infer_instance` times out | holds; none |
| `finrank_dolbeaultCohomology_serre` | Hopf | h^(0,1)=1=h^(2,1), h^(1,0)=0=h^(1,2) | holds; none |
| `del_delBar_lemma` | Kähler form of elliptic curve | ∫ω>0, not exact; excluded by `hexact` | holds; none |
| `finrank_deRhamCohomology_eq_sum_dolbeault` | ℂP¹; Iwasawa | b₂=1=0+1+0; 4≠5, excluded by `hκ` | holds; none |
| `finrank_dolbeaultCohomology_symm` | Hopf | 0≠1; Hopf has H²=0, so not Kähler | holds; none |
| `even_finrank_deRhamCohomology_odd` | Kodaira–Thurston; closed annulus | b₁=3, J not integrable; b₁=1, excluded by `Boundaryless` | holds; none |
| `hard_lefschetz`, `lefschetzMap` | ℂP²; S²×S² class σ₁; j=0 | [ω]²≠0; σ₁²=0 (not Kähler); `LinearMap.id` | holds; none |
| `finrank_dolbeaultCohomology_complexProjectiveSpace` | n=0, 1 | h^(0,0)=1; h^(1,1)=1, h^(2,2)=0 by `p≤n`; Demailly VI (8.8) p. 312 | holds; none |
| `finrank_deRhamCohomology_complexProjectiveSpace` | n=2 | b=1,0,1,0,1; χ=3 = `eulerChar_complexProjectiveSpace` | holds; none |
| `integralCohomology_complexProjectiveSpace` | S²∨S⁴; u=2·gen; n=0 | u²=0 fails; fails at k=1; u=0, u⁰=1; Demailly V (15.10) p. 280 | holds; none |
| `finrank_dolbeaultCohomology_complexTorus` | n=0, 2 | 1; h^(1,1)=4 | holds; none |
| `finrank_dolbeaultCohomology_riemannSurface` | two elliptic curves; ℂP¹ | 2=2, b₁=4; 0=0, b₁=0; Demailly VI (10.1)–(10.2) p. 317 | holds; none |
| `finrank_deRhamCohomology_le_sum_dolbeault` | Iwasawa; Hopf | 1,4,8,10,8,4,1 ≤ 1,5,11,14,11,5,1; 1≤1 | holds; none |
| `polydisc`, `DolbeaultCohomology`, `IsKahler` | (0.9,0.9), (1,0) at r=(1,1); `h dz`; `−dx∧dy` | in, out; wrong type excluded by type range; positivity fails | right; none |
| R01 cycles | 3.4, 6.4, 5.1/5.4/5.7 | RealAnalyticGeometry line 22 and PseudodifferentialOperators line 91 cite K1–K6.0, K5a | fails; R01 |
| R02 regrading | E₁^(1,0) | page-2 object at (3,−2) in both 8.1 and AT §5.0 | duplicate; R02 |
| R04 instances | Mathlib `:44`, Tau Ceti `:90` | both coinduced by `mk'`; same name, cannot coexist | drift; R04 |
| R07 Euler identity | Iwasawa | Σ(−1)^k b_k = 0 = Σ(−1)^(p+q)h^(p,q) | missing; R07 |

- Gate at 806b373: every scanner 0, build 0, OK. Dependency check: `depcheck: 237 roadmaps, 2169 edges, 0 problem(s)`; it does not read cycles between two roadmaps on main (R01).
- `lake env lean` on `Suggested.lean`: 27 warnings, all `declaration uses sorry`, in 12.7 s. Checked `#check` signatures: all 27 theorems keep their binders; 4 definitions drop unused `[FiniteDimensional]`/`[Boundaryless]`/`[T2Space]`/`[CompactSpace]`, harmlessly. No change.
- Padding probe on a scratch copy: no padding found. `inferInstance` fails for `IsDomain`, `UniqueFactorizationMonoid`, `IsRegularLocalRing` and `IsNoetherianRing` of the stalk; `FiniteDimensional` of `DolbeaultCohomology` times out.
- Source locators checked against the text (42):
  - Demailly I (3.28), (3.29); II (2.1)–(2.10), (3.19), (4.2), (4.22), (4.29), (6.1); III (2.6)–(2.7); IV (16.8); V (6.6), (6.7), (15.5)–(15.10); VI (3.16)–(3.17), (4.5), (4.7), (7.2), (7.3), (8.5)–(8.17), (10.1)–(10.2), (11.2), (11.7);
  - Rainer 10.3, 11.1, 12.2; Hörmann–Steinbauer 1.70, 4.22; Knutson §1; Łojasiewicz Thm 2; Berwick-Evans–Tripathy Rem 2.1; Angella §§4.1–4.2.
- Library: all 410 backticked README names were resolved against the pinned Mathlib and Tau Ceti; none is missing, apart from this roadmap's own names and other roadmaps' names. Opened by file and line: `Codifferential.lean:88`; `Projectivization.lean` (Mathlib `:44`, `:83`; Tau Ceti `:90`, `:188`, `:215`); `Instances/Quotient.lean` (Mathlib `:50`, Tau Ceti `:242`); `Nijenhuis.lean:18–346`; `Dolbeault/Basic.lean:405, 414`; `Complex/Orientation.lean:35`; `DeltaSeries.lean:68, 97`; `Eigenbundle.lean:96`; `Pompeiu/Basic.lean:163`; 15 variational and spectral-sequence names.
- Suppliers: all 16 are on main or `Completed/`. Section ids resolved:
  - ComplexManifolds Milestones 1–7 (2 item 4); ComplexTori M1 items 3–4; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3, 4.1; StableReduction Layer 4 anchor; LieGroupoidsPoisson §G1.3;
  - AlgebraicTopology §§4.5–4.7, 5.0, 6.3–6.5, 7, 8.7 (Stage≡Layer, AT 967–985), and CharacteristicClasses C1.5, C1.5a, C2.4a, C7.6, both at this head;
  - GeneralizedCohomology and TopologicalKTheory contracts, at this head.
- Ownership against open pull requests: CalibratedGeometry (#946) owns the Wirtinger inequality, and the overlap with 6.4's calibrated volume equality is its citation to make, this roadmap being on main. In GeometricQuantization (#1186) and GlobalHolomorphicFunctions (#992), a search for Weierstrass, Hartogs, Oka, Newlander, Hodge decomposition and Lefschetz finds no restated target.

## Not verifiable

- webster-nn, pp. 303–316 (1.4, `newlander_nirenberg`): uncertified in the manifest, so not read.
- hormander-alpdo1, Theorems 2.3.4–2.3.5 (5.2): uncertified, so not read.
- wells-dacm, griffiths-harris chapter 0, koszul-malgrange pp. 102–109, nomizu-nilmanifolds Theorem 1, raghunathan-discrete-subgroups Theorem 1.13 and Corollary 1: uncertified, so not read.
- Ownership against ComplexComparisonPartII (#848) and the SmoothBundlesConnections revision (#2127): the index gives no checkout for either, so these were not checked.

## Source issues

- none
