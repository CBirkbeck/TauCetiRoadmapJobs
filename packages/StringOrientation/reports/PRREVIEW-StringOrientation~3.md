# Review of StringOrientation (pull request #948 at 4d390c9)

**Verdict:** needs changes

The gate passes, but eight blocking findings remain: two P1 and six P2. Two further findings are P3. This is a full review of both files, including unchanged passages.

**Previous findings, checked individually.** All six findings at 714ab78 are repaired; none is re-raised.

- Previous R01: repaired. S1.1 now uses “`X=S³∪_2e⁴`”; the cellular differential is multiplication by 2 in degrees 3 and 4, giving H³=0 and H⁴=ℤ/2. The same replacement appears in the later checks/examples.
- Previous R02: repaired. S3.5: “Take the manifold diffeology of Orbifolds O2 item 6”. Scope and the supplier contract agree with that main-roadmap item.
- Previous R03: repaired. S2.3: “For every n≥5, `π_(n+3)(Sⁿ)≅ℤ/24`”; `Suggested.lean:48` states it on native carriers. Its elaborated type retains `5 ≤ n`. R07 below concerns changed ownership in the earlier supplier, not the decision to state this native theorem.
- Previous R04: repaired. S3.3 cites “§5.2, line 524” and “§5.4, line 627”. Both locate the intended constructions in meinrenken-basic-gerbe.
- Previous R05: repaired. Scope records the three moves from later roadmaps, and S3.0 requires that its connection and curvature “agree with the ones C4.1 feeds to Chern–Weil”. The SU(2) check distinguishes curvature coefficients 2 and 4.
- Previous R06: repaired. S4.1 defines “`Sym_t(V)=λ_(−t)(V)⁻¹`” and consumes TopologicalKTheory T2.3. For a line L this gives coefficients 1,L,L², as required.

## R01 (P1) — The Hopf-line connection check contradicts Stokes

Location: `TauCetiRoadmap/StringOrientation/README.md:714`: “`dH=½p₁(A)` integrates over the quaternionic Hopf line to −1, matching λ.”

Claim: the global 3-form H supplied by a geometric String structure exists for this bundle over S⁴ and has that differential.

Witness: S⁴ is closed: ∫S⁴dH=0, whereas ∫S⁴½p₁(A)=−1. S1.3 already excludes this String lift. Waldorf's Theorem 1.3.3 assumes a geometric trivialization (waldorf-string-connections line 404).

Repair: make this a negative control: the nonzero integral obstructs both a global H satisfying the equation and a geometric String structure. Use the trivial Spin bundle on S⁴ with flat connection for the positive control, H=0 and both integrals 0. Retain the Hopf curvature calculation in S3.3, where it is correct without a trivialization.

## R02 (P1) — Name the existing supplier of the compact Albert algebra

Location: `TauCetiRoadmap/StringOrientation/README.md:362`: “Let `J₃(𝕆)` be the 27-dimensional real Jordan algebra … over the division octonions”; its Needs list at lines 401–403 supplies neither algebra.

Claim: the division octonions and compact Albert algebra are available inputs to the geometric construction. They are neither pinned carriers nor targets here nor named suppliers here.

Witness: main `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:1255` owns division octonions; line 1332 owns the compact Albert algebra. Pinned `TauCeti/Algebra/Octonion/Basic.lean:375` instead has split norm ab−v·w, with nonzero elements of norm zero.

Repair: consume LieHighestWeight Layer 8's “compact real algebra suppliers” and “formally real Albert supplier” in Scope, contracts and S1.5 Needs. Use its positive norm, compact Albert carrier, trace form, Jordan identities and smooth coordinate structure. Keep the projective-plane geometry here. The split substitution fails concretely: take a nonzero split octonion x with N(x)=0; Hermitian matrices with diagonal (1,0,0) and off-diagonal entries tx and its conjugate are trace-one idempotents for every real t, an unbounded family. In the supplied compact algebra, trace(A²)=trace(A)=1 bounds every idempotent. No later TangentialBordism dependency is needed.

## R03 (P2) — The framing-change formula loses connected components

Location: `TauCetiRoadmap/StringOrientation/README.md:515`: “identify `β=(Ωλ)_*⁻¹α∈π₃Spin≃π₃SO`”. The preceding hypothesis is only a closed oriented 3-manifold.

Claim: any α∈H³(M;ℤ) gives one element of π₃Spin, with bordism change J(β).

Witness: for M=S³⊔S³, H³(M;ℤ)=[M,Spin]=ℤ², while π₃Spin=ℤ. With Ωλ(g)=−1, α=(1,−1) yields β=(−g,g), and total change −J(g)+J(g)=0.

Repair: retain disconnected manifolds and define β componentwise using the oriented fundamental classes, then sum J(β_j) for the change of the total bordism class. The empty manifold has empty sum 0. On one S³ this recovers the current −J(g) check; on the two-component witness it gives zero while preserving the nonzero torsor difference. A single integer must not be described as the inverse image of the whole cohomology class.

## R04 (P2) — Global manifold claims need separation and partition-of-unity hypotheses

Location: `TauCetiRoadmap/StringOrientation/README.md:573`: “each iterated fibre product `Y^[k]` is a closed embedded submanifold of `Y^k`”. Lines 557–564 also assert existence of connections for finite-dimensional smooth manifolds without further hypotheses.

Claim: local smooth manifold/submersion structure alone gives closedness and the cited global gluing theorem. The Hausdorff second-countable assumption at line 566 belongs only to the good-cover sentence.

Witness: let M be the line with doubled origin and Y=ℝ⊔ℝ its chart cover. π is a surjective local diffeomorphism. A cross-component of Y×M Y is {(t,t):t≠0}, which is not closed.

Repair: distinguish the general local fibre-product theorem from closed embeddedness, adding a Hausdorff base for the latter. State explicit global manifold assumptions wherever partitions of unity, good covers and their differential-cohomology consequences are used. The cited pinned `SmoothPartitionOfUnity.exists_isSubordinate` requires `[T2Space M] [SigmaCompactSpace M]` (`Mathlib/Geometry/Manifold/PartitionOfUnity.lean:551`). Hausdorff second-countable finite-dimensional manifolds meet this contract. The doubled-origin witness still has a local fibre-product manifold, but fails exactly the added closedness hypothesis; ℝ²→ℝ has a closed three-dimensional self fibre product.

## R05 (P2) — The proposed diffeology compatibility class does not apply to manifolds in general

Location: `TauCetiRoadmap/StringOrientation/README.md:732`: “elsewhere carry `Diffeology.IsDTopologyCompatible` and `Diffeology.IsContDiffCompatible` explicitly.”

Claim: these classes provide the general compatibility assumptions for the manifold and functional mapping-space constructions.

Witness: pinned `Mathlib/Geometry/Diffeology/Basic.lean:370` requires a real normed vector space for `IsContDiffCompatible`. Already C∞(pt,S¹)=S¹ is noncontractible; no compatible real normed vector-space structure exists.

Repair: use `IsDTopologyCompatible` for general topological carriers and the stated chartwise `DSmooth`/`ContMDiff` theorem for manifolds. Use `IsContDiffCompatible` only on normed coordinate/model spaces. State functional-diffeology universal properties without imposing a vector-space structure on arbitrary mapping spaces. This allows C∞(pt,S¹)=S¹ and the rotation family in the existing check; on ℝ the native class still gives the intended smoothness test.

## R06 (P2) — Preserve p=3 in the Hovey–Ravenel prerequisite

Location: `TauCetiRoadmap/StringOrientation/README.md:897`: “`BO⟨4k⟩` into BP⟨1⟩ spaces for p>3”.

Claim: only the primes needed for the eventual kernel theorem are included in this general prerequisite.

Witness: hovey-ravenel line 292, Corollary 1.5(2), printed p. 8, assumes p odd. At p=3, BO⟨8⟩_(3)≃BP⟨1⟩₈; the product has one factor, not an exceptional undefined case.

Repair: state this decomposition and its connective-cover transition maps for every odd prime, with the source's degree hypotheses. Keep Hovey's later ring presentation and the torsion-free injection at p>3. At p=3 the product index is just i=0; at p=5 it is i=0,1. Both satisfy the corrected prerequisite. This does not assert the false extension of the later torsion-free String-bordism theorem to 3.

## R07 (P2) — Import the stable stem now owned by the earlier EllipticCohomology roadmap

Location: `TauCetiRoadmap/StringOrientation/README.md:499`: “Prove `π₃S≅ℤ/24` … by the Serre spectral sequence computation of the 2- and 3-primary parts”; Scope also claims this computation.

Claim: this roadmap independently owns the sphere computation, rather than the geometric framing/String comparisons built on it.

Witness: the supplied open head's `TauCetiRoadmap/EllipticCohomology/README.md:1675` explicitly uses π₁₂S⁹≅π₃S≅ℤ/24 from “E4.S's stem-3 calculation”; E4.S owns independent sphere inputs. EllipticCohomology precedes StringOrientation.

Repair: consume E4.S's stem computation, using E5's explicit stable-range application to identify the contract, and compare its ν with the quaternionic Hopf normalization here. Keep the geometric bordism, J/framing sign comparisons and native unstable-sphere formulation here; add the supplier to S2.3 Needs and the contracts. For n=9 the two computations are literally π₁₂(S⁹)=ℤ/24; Freudenthal transports that same answer to n=5. No second primary-stem proof is needed. The later HomotopySpheres move remains correctly recorded.

## R08 (P2) — Reuse DGFloer’s compact Lie-group criterion

Location: `TauCetiRoadmap/StringOrientation/README.md:274`: “`π₃=0` forces a torus and `π₁=0` makes it trivial”. S1.2 only names DGFloer Layer 1 item 2 for its exact sequence.

Claim: this proof route supplies the compact Lie-group homotopy criterion without identifying its existing owner.

Witness: main `TauCetiRoadmap/DGFloer/README.md:1614`, Layer 11 item 3, constructs the finite cover T×K→G, proves nontrivial K has nonzero π₃, and derives the torus criterion. This is distinct from its Layer 1 exact-sequence contract.

Repair: consume DGFloer Layer 11 item 3 for this criterion and its finite-cover comparison. Keep here the application to String(n) and the explicitly owned retraction theorem for general connected Lie groups. Test the imported criterion on S¹ (π₃=0, π₁=ℤ) and SU(2) (π₃=ℤ, π₁=0): only the additional π₁=0 assumption makes the torus trivial. Main is an allowed supplier; do not cite its separate open revision.

## R09 (P3) — The round-circle check has zero Ricci curvature

Location: `TauCetiRoadmap/StringOrientation/README.md:993`: “The round sphere `Sⁿ` of radius r has `Ric=(n−1)r⁻²g>0`”.

Claim: the displayed positive-definiteness conclusion applies without a dimension or radius bound.

Witness: n=1,r=1 gives Ric(v,v)=0 for every unit tangent vector, not a positive number. For n=2,r=1 it gives Ric(v,v)=1.

Repair: specify n≥2 and r>0 for the positive example; retain the circle as a negative control. When invoking the bounding disc, use its induced stable framing/String lift. The two computed cases then have the claimed opposite outcomes.

## R10 (P3) — Supply exact locators for the unsourced target blocks

Location: `TauCetiRoadmap/StringOrientation/README.md:615`: “Prove the two exact sequences, pullback, products, the homotopy formula and the comparison with the good-cover Deligne complex.” S1.4 and S5.1 similarly have no source locator at their claims.

Claim: these are source-backed target blocks, but neither the claim nor the reference list identifies their individual results precisely enough to check.

Witness: Cheeger–Simons Theorem 1.1 is at cheeger-simons line 114, printed p. 52; Theorem 2.2 at line 341, p. 58. The README names neither and uses different degree indexing.

Repair: attach those two locators to the exact-sequence and natural-character targets, explaining that source degree k corresponds to Ĥ^(k+1) here; add exact locators for the product, homotopy and Deligne comparisons. Supply locators for S1.4's relative/transport statements and S5.1's associated-bundle construction, or identify them explicitly as derived constructions with named inputs and the derivation. Check the indexing on a point: Ĥ¹(pt)=ℝ/ℤ and Ĥ²(pt)=0. Do not treat a bibliography entry as a locator for every assertion in a block.

## Verified sound

**Mechanical evidence.** The supplied gate at this exact head reports all checks zero and the targeted build successful, including `stray-files=0`, `outside-folder=0`, `sorry-data=0`, `set_option=0`, `build=0`. Independent `lake env lean` on `TauCetiRoadmap/StringOrientation/Suggested.lean` succeeds with only the one expected `sorry` warning. The scratch copy with `#check @TauCetiRoadmap.StringOrientation.homotopyGroup_sphere_three_stem` also elaborates; both n and `5 ≤ n` remain in the signature. Nothing was changed. The one-tactic probe `first | simp | rfl | infer_instance` fails to prove the theorem; object searches found no pinned theorem giving this equivalence. There are no definitions or other admitted declarations to probe and no padding finding.

The requested dependency command, using this README, the supplied order, `--movable` and main content, returned:

```text
depcheck: 208 roadmaps, 1458 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line appeared. Every Needs line and supplier reference was read independently of this coarse check. R02 and R07 describe missing ownership edges, not a cycle detected by the tool. The worktree remains clean; the diff outside StringOrientation is empty. No declared supplier gaps were present.

**Headlines and native statement.** The README's end results are: the λ obstruction and H³ torsor/8-equivalence; the framed/String degree-3 comparison and framing-change formula; the affine space and differential torsor of string connections; integral modular Witten genus; the Cayley-plane kernel theorem away from 6; low-weight Ricci vanishing and the two refined counterexamples. Its deeper intermediate headlines include the non-finite-dimensional String group and rational String bordism. The Lean docstring names these and the missing BSpin, K(ℤ,4), characteristic-class, bordism, gerbe, genus and spectrum carriers. The statable stable-range sphere theorem is present on native homotopy groups, not a free predicate. The module has one import, one namespace, one theorem and no sorry'd data or options. No other missing statable headline was identified.

**Computed adversarial pass.** There are 106 rows below, 13 pinned-declaration groups and 20 cross-roadmap audit entries. The following rows cover the sampled targets, every subsection's definitions and substantive formulas, the headlines and all findings. “Pass” means the displayed adversarial instances agree, not that a finite calculation proves the general theorem. Source verification and remaining uncertainties are recorded separately below. H denotes integral cohomology unless indicated; g is the quaternionic generator with Ωλ(g)=−1; ν denotes J(g) for the sign calculations (the exported Hopf sign must use that comparison).

| # | Statement | Instances tried | Values computed on the two sides / wrong model | Result | Change |
|---|---|---|---|---|---|
| 1 | S1.1 universal λ, 2λ=p₁ | generator in H⁴(BSpin)=ℤ | λ=1 gives p₁=2; λ:=p₁ gives 2λ=4≠2 | Pass | None |
| 2 | Hopf sign and naturality | quaternionic line on oriented S⁴, orientation reversal | c₂=1, p₁=−2, λ=−1; reversed pairings −1,2,1 | Pass | None |
| 3 | Mod-2 reduction | same rank-4 bundle | λ mod 2=1; w₄=e mod 2=1 | Pass | None |
| 4 | Adjoint normalization | SU(2) weights 0,2x,−2x | c₂(ad V⊗ℂ)=−4x²; p₁=4x²=−4c₂(V); λ=−2c₂(V) | Pass | None |
| 5 | Integral torsion distinguishes λ from p₁ | S³∪₂e⁴, trivial/nontrivial bundles | ker(2:ℤ→ℤ)=0, coker=ℤ/2; λ=1 mod 2 but p₁=0; trivial λ=0 | Pass | Previous R01 repaired |
| 6 | Wrong Moore-space control | S⁴∪₂e⁵ | H⁴=ker 2=0; H⁵=coker 2=ℤ/2, so only trivial stable Spin class | Pass | None |
| 7 | Sum/inverse of λ | Hopf class and its virtual inverse | (−1)+1=0=λ(ξ⊕−ξ); λ(−ξ)=1 | Pass | None |
| 8 | S1.2 homotopy fibre, connectivity | stable λ versus p₁ | π₄BString=ker(±1)=0; π₃=coker(±1)=0; fibre of p₁ has coker(±2)=ℤ/2 | Pass | None |
| 9 | High homotopy, 8-equivalence | degrees 4 and 8 | π₄BSpin→π₄K is ℤ≅ℤ; π₈BSpin→π₈K is ℤ→0 onto; π₈BString=ℤ | Pass | None |
| 10 | Finite-rank pullbacks versus connected covers | rank 3 | λ_* is multiplication by −2; π₃ of its fibre=ℤ/2, versus 0 for 3-connected cover | Pass | None |
| 11 | String(n) fibre sequence and independence | n=5, π₂ and π₃ | 0→ℤ→(±1)ℤ→0 is exact; π₂String=π₃String=0 | Pass | None |
| 12 | No finite-dimensional Lie-group model | n=5; wrong contractible String model | Spin(5) top H¹⁰=ℚ; K(ℤ,3) has only rational degrees 0,3, so H¹⁰=0 | Pass on witness | Import criterion under R08 |
| 13 | S1.3 existence iff λ=0 | point, Hopf S⁴ | point: 0=0, one lift class; Hopf: −1≠0, zero lift classes | Pass both directions | None |
| 14 | H³ torsor and difference cocycle | trivial bundle on S³ | differences 0→1=1, 1→3=2, 0→3=3=1+2; a shift fixing 0 has shift 0 | Pass | None |
| 15 | Trivial Spin does not mean unique String | S¹×S² versus point | H⁴=0 in both; H³=ℤ versus 0, so infinitely many versus one lift class | Pass | None |
| 16 | Dimension ≤7 classification | S⁴ and S⁸ | [S⁴,BSpin]=ℤ→H⁴(S⁴)=ℤ is ±1; [S⁸,BSpin]=ℤ→H⁴(S⁸)=0 is not bijective | Pass with bound | None |
| 17 | Skeleton criterion | Hopf S⁴, torsion Moore space | restrictions to 3-skeleton trivial, but λ=−1 and 1 mod 2; 4-skeleton retains each nonzero class | Pass | None |
| 18 | S1.4 gauge transport sign | loop g, twice g, identity | −Ωλ(g)=+1; −Ωλ(2g)=+2; identity shift 0 | Pass | None |
| 19 | Transport composition, sum, inverse | torsor shifts 1,2 | composed/summed difference 3; inverse −1; difference for lift plus inverse 0 | Pass | None |
| 20 | Relative lifts and normal inversion | (D⁴,S³), boundary coordinate a=0,1 | obstruction 0 extends; obstruction ±1 does not; tangent coordinate 1 plus normal −1=0 | Pass | Fix exact convention/locator under R10 |
| 21 | S1.5 compact Albert carrier | compact versus split norm | compact N(x)>0 for x≠0; split x=(0,0,e₁,0) has N(x)=0; split idempotent family unbounded | Missing supplied input | R02 |
| 22 | OP² orbit and isotropy | Spin(9), wrong Spin(8) | 52−36=16; 52−28=24≠16 | Pass | None |
| 23 | OP² cohomology, Spin and String classes | cells 0,8,16 | H⁰=H⁸=H¹⁶=ℤ, χ=3; H¹,H² mod 2 and H³,H⁴ vanish; one Spin and one String lift class | Pass | None |
| 24 | OP² characteristic classes/signature | p₂=6u,p₄=39u², ∫u²=1 | (381·39−19·36)/14175=1; wrong p₄=36u² gives 13032/14175 | Pass consistency test | Primary source remains uncertified |
| 25 | OP² Â and top Stiefel–Whitney class | same numbers | (−192·39+208·36)/464486400=0; w₁₆[u²]=1=χ mod 2 | Pass | None |
| 26 | HP² comparison/non-String example | p₁=2u,p₂=7u² | λ=u≠0; (7·7−4)/45=1 for signature | Pass | None |
| 27 | S2.1 ko/Postnikov comparison | π₄ and π₈ | fourth section sends g to −1; π₄ of both fibres=0, π₈=ℤ on both | Pass | None |
| 28 | Thom transport and inverse diagram | θ plus −θ | virtual class θ+(−θ)=0; induced normal/tangent λ contributions a+(−a)=0 | Pass | None |
| 29 | Rational BString cohomology | degrees 4,8,16 | degree 4=0; degree 8=ℚp₂; degree 16=ℚp₄⊕ℚp₂² | Pass | None |
| 30 | S2.2 structured PT, orientation retained | degree 0, two points | unoriented 1+1=0 in ℤ/2; oriented +1+1=2 in ℤ; both agree with respective Thom π₀ | Pass | General structured-source text unavailable |
| 31 | Products and empty bordism cycle | point and empty manifold | [pt]·[pt]=1; [∅]=0; rational numbers of empty cycle all 0 | Pass | None |
| 32 | Rational detection versus integral detection | Lie-framed circle | integral class has order 2; rationalized class and every rational characteristic number are 0 | Pass | None |
| 33 | Rational String ring | degrees 4,8,12,16 | monomial counts 0,1,1,2; Spin counts 1,2,3,5 | Pass | None |
| 34 | Nonzero rational String cycle | OP² | p₂²[OP²]=36, p₄[OP²]=39; vector (36,39)≠(0,0) | Pass | None |
| 35 | Spin versus String | K3 | σ=−16, p₁=−48, λ=−24≠0; rational String degree 4 rank 0 versus Spin rank 1 | Pass | None |
| 36 | S2.3 sphere-to-MString unit | stems 3,4,5,6 | respective groups ℤ/24,0,0,ℤ/2 on both sides; MSpin stem 3=0 | Pass | Earlier supplier overlap R07 |
| 37 | Third stable stem and primary parts | n=5,6,9; p=2,3 | π₈S⁵=π₉S⁶=π₁₂S⁹=ℤ/24; primary orders 8 and 3, product 24 | Pass | R07 |
| 38 | Freudenthal bound | n=4,5 | n+3≤2n−2 gives 7≤6 false, 8≤8 true; π₇S⁴=ℤ⊕ℤ/12 versus π₈S⁵=ℤ/24 | Pass | None |
| 39 | Lean signature, basepoint, excluded small n | n=5; hypothetical n=0 | basepoint norm=1; n=5 yields π₈S⁵; n=0 would yield π₃S⁰=0≠ℤ/24, excluded by hn | Pass | None |
| 40 | J and relative e-invariant | generator g, 24g, K3 | J(g)=ν order 24; J(24g)=0; λ[K3]=−24≡0 mod 24 | Pass | None |
| 41 | Framing change on connected M | S³ and S¹×S², shift +1 | H³=ℤ; β=−g, tangent shift +g, normal shift −g, bordism change −ν | Pass | None |
| 42 | Framing change on disconnected/empty M | S³⊔S³, α=(1,−1); ∅ | β=(−g,g)∈ℤ², not ℤ; sum J=0; empty sum 0 | Fails written type | R03 |
| 43 | S3.0 trivial principal bundle and connections | ℝ²×U(1), a=x dy; a=0 | F=dx∧dy≠0 versus F=0; difference a is an arbitrary 1-form, not required closed | Pass | None |
| 44 | Nonabelian curvature and carrier comparison | SU(2), a=τ₁dx+τ₂dy | da=0, ½[a∧a]=2τ₃dx∧dy; omitting half gives 4τ₃dx∧dy | Pass | None |
| 45 | Gauge curvature/Bianchi | constant SU(2) gauge with Ad(τ₃)=−τ₃ on preceding example | F transforms from 2τ₃dx∧dy to −2τ₃dx∧dy; in base dimension 2 both Bianchi 3-forms are 0 | Pass | None |
| 46 | Good covers | standard two-arc and three-small-arc S¹ covers | two-arc intersection has 2 components, not ℝ; three-arc nonempty finite intersections are intervals (1 component) | Pass | None |
| 47 | Local sections and fibre-product dimension | ℝ²→ℝ projection, k=1,2,3 | dimensions 2,3,4 =2k−(k−1); section t↦(t,a) through any (t,a) | Pass | None |
| 48 | Submersion hypothesis | x↦x² at 0 | derivative 0, not onto ℝ; self fibre product y=±x has 4 local branches, not a 1-manifold | Pass negative control | None |
| 49 | Closed fibre product | doubled-origin chart cover | cross piece omits (0,0) but contains (1/m,1/m)→(0,0); fibre product≠its closure | Fails | R04 |
| 50 | Global connection gluing assumptions | ℝ² versus doubled-origin line | ℝ² is T2 and sigma compact; doubled-origin line is not T2, so the cited pinned instance cannot be applied | Missing hypothesis | R04 |
| 51 | Face/degeneracy identities | (a,b,c), repeated-coordinate diagonal | deleting coordinates 1 then 1 or 2 then 1 both returns c; deleting either copy of (a,a) returns a | Pass | None |
| 52 | S3.1 character degree conventions | point, k=0,1,2 | Ĥ⁰=ℤ, Ĥ¹=ℝ/ℤ, Ĥ²=0; shifted convention would misplace ℝ/ℤ | Pass | R10 locators |
| 53 | Character boundary equation and holonomy | unit Chern class on S², hemisphere curvature 1/2 | full integral 1 maps to 0 mod ℤ; boundary character 1/2 yields exp(πi)=−1 | Pass | None |
| 54 | Curvature exact sequence | S³ in degree 3 | kernel H²(S³;ℝ/ℤ)=0; normalized volume integral n gives unique character with that curvature | Pass | None |
| 55 | Differential λ and connection change | Hopf bundle, trivial flat bundle | characteristic/curvature pairings −1/−1 versus 0/0; changing connection changes curvature by an exact form, integral change 0 | Pass | None |
| 56 | S3.2 gerbe descent and δ sign | two-chart functions f₁,f₂ | equal overlap values give δ=0; difference 1 gives δ=1; pr₁−pr₂ would give −1 | Pass | None |
| 57 | Alternating complex δ²=0 | values a,b,c on triple overlap | (c−b)−(c−a)+(b−a)=0 | Pass | None |
| 58 | Identity cover/gerbe and dimension | Y=M, k=1,2 | L⊗L≅L forces L trivializable; dimensions d and 2d−d=d | Pass | None |
| 59 | No cohomology injectivity for submersions | Hopf S³→S² | H²(S²)=ℤ→H²(S³)=0 kills generator 1 | Pass | None |
| 60 | Gerbe/2-gerbe classification degrees | point, S³ with generator | Ĥ³(pt)=Ĥ⁴(pt)=0; gerbe class on S³ has integral curvature 1 and H³ class 1, not H⁴ class | Pass | None |
| 61 | S3.3 basic-gerbe level | quaternionic subgroup versus adjoint rank 3 | normalized periods ±1 versus ±2; rank 3 restriction is twice a generator | Pass | None |
| 62 | Finite-rank restriction | Spin(4)=SU(2)×SU(2) | H³=ℤ², not ℤ; n≥5 simple-group statement avoids this extra generator | Pass | None |
| 63 | CS 2-gerbe class and String trivializations | Hopf S⁴ versus trivial S³ | λ=−1: zero trivialization classes; λ=0 on S³: H³ torsor ℤ | Pass | None |
| 64 | S3.4 affine connection space | M=Y=W=pt | numerator Ω²⊕Ω¹⊕Ω¹=0, quotient V_T=0, one connection | Pass | None |
| 65 | Differential torsor shift | trivial flat Spin bundle on S³, κ of class n=1,2 | H period changes by 1,2 respectively; dH remains 0 | Pass | None |
| 66 | Global H equation | Hopf bundle on S⁴ | ∫dH=0 by Stokes, ∫curv(λ̂)=−1 | Fails | R01 |
| 67 | Geometric trivialization is not λ̂=0 | trivial Spin bundle with a connection whose exact characteristic curvature is nonzero | topological λ=0, but curv(λ̂)=dH≠0; λ̂ therefore nonzero | Pass distinction | None |
| 68 | S3.5 manifold diffeology/plots | x³, its inverse, absolute value | x³ smooth with derivative 0 at 0; cube-root derivative unbounded; absolute-value one-sided derivatives −1,+1 | Pass | None |
| 69 | Functional diffeology/evaluation | rotations f_u(θ)=θ+u | joint map is addition, derivatives ∂u=∂θ=1; evaluation at θ=0 gives u | Pass | None |
| 70 | Currying and composition | p(u)(x)=u+x; q(x)=2x | uncurry(p)(u,x)=u+x; q∘p gives 2u+2x on both descriptions | Pass | None |
| 71 | Native compatibility carrier | C∞(pt,S¹), real normed model | mapping space=S¹ with π₁=ℤ; real normed vector space contracts by tv, so π₁=0 | Wrong class | R05 |
| 72 | Parameter-first fibre integration | du∧dθ, dθ∧du on parameter×S¹ | integrals +2πdu and −2πdu; reversed convention swaps signs | Pass | None |
| 73 | S3.6 transgression degree and orientation | closed oriented X dimensions 0,1,2,3 | degree-4 data descends to degrees 4,3,2,1; reversing X changes ∫H from a to −a, holonomy to inverse | Pass | None |
| 74 | Holonomy normalization | ∫H=1,1/2 | exp(2πi)=1, exp(πi)=−1; exp(1)=e not in U(1) | Pass | Source omission recorded |
| 75 | Injectivity/conditional surjectivity | evaluating a transgressed family at pt | evaluation∘transgression(T)=T; equality at pt forces T₁=T₂; under point-determination the reverse composite also returns the given family | Pass under stated condition | No unconditional bordism-with-corners claim |
| 76 | Integer differential shift under transgression | S³, shift with ∫curv κ=1 | exp(2πi(a+1))/exp(2πia)=1, though H³ lift coordinate changes by 1 | Pass | None |
| 77 | S4.1 symmetric powers from λ | line L, zero virtual bundle | (1−tL)⁻¹=1+tL+t²L²+…; Sym_t(0)=1 | Pass | Previous R06 repaired |
| 78 | Reduced Θ series | trivial rank r bundle; first q coefficient | Vℂ−r=0 gives Θ=1; general Θ=1+q(Vℂ−r)+… | Pass | None |
| 79 | Q normalization at q=0 | coefficients x²,x⁴ in log Q | −1/24 and 1/2880; 2G₂(0)/2!=−1/24, 2G₄(0)/4!=1/2880 | Pass | None |
| 80 | Q first q coefficient | formal x | eˣ+e⁻ˣ−2=x²+x⁴/12+…; at x=0 coefficient 0, and limiting Q(0,q)=1 | Pass | No 0/0 interpretation |
| 81 | S4.2 genus unit, zero, products | positively oriented point, empty cycle, point×point | φ=1,0,1=1·1 respectively | Pass | None |
| 82 | Integral genus/modular constant | String dimension 4, OP² dimension 16 | dimension 4: Â=−p₁/24=0, M₂=0; OP²: Â=0, M₈=ℂE₄² with constant 1, so φ=0 | Pass | None |
| 83 | Genus independent of String lift | S³ with torsor coordinates 0 and 1 | ordinary genus 0 for both; refined class changes by an order-24 generator | Pass | Distinguish genus from σ |
| 84 | S5.1 associated Cayley bundle | OP²×HP²→HP² | vertical λ=0, total λ=pullback(u)≠0; fibre String does not imply total String | Pass | R10 locator |
| 85 | S5.2 roots/cosets and pushforward | F₄/Spin(9) | positive roots 24−16=8; orders 1152/384=3 | Pass | Primary pushforward source uncertified |
| 86 | Family vanishing | OP² over pt; OP²×Y with Y closed String | φ(OP²)=0; φ(total)=0·φ(Y)=0 | Pass on product controls | Nontrivial-family proof source status below |
| 87 | S5.3 Spin→SO away from 2 | π₁ and fibre K(ℤ/2,1) | π₁MSpin=ℤ/2, π₁MSO=0; after inverting 2 both 0; reduced fibre homology also 0 | Pass | None |
| 88 | Hovey–Ravenel decomposition | BO⟨8⟩ at p=3,5 | p=3 product BP⟨1⟩₈; p=5 product BP⟨1⟩₈×BP⟨1⟩₁₂ | Unnecessarily omitted first case | R06 |
| 89 | Large-prime String bordism | p=5; free BP summand | BP_* at 5 is ℤ_(5)[v₁,v₂,…], 5x=0 implies x=0; this reasoning does not cover the 3-primary torsion | Pass at source's range | Keep p>3 here |
| 90 | S5.4 generator criterion, first condition | n=2,3 | 2n=4=5−1: valuation at 5 is 1; 2n=6=7−1=1+5: valuations at 5,7 are 1 | Pass | None |
| 91 | Generator criterion, prime-square condition | p=5,i=1,j=2 | dimension 2(5+25)=60; required s₁₅=0 and s₃,₁₂≠0 mod 25; residues 5 passes, 0 (including 25) fails | Pass | None |
| 92 | Arithmetic gcd control from Proposition 11 | n=4,5 | absolute gcds of the even-binomial differences are 42 and 165; p>3 valuations: 7 once, then 5 and 11 once | Pass | None |
| 93 | Geometric degree equation | n=13,14,15,16 | 13 has no nonnegative solution; 14=3·2+8, 15=3·5, 16=8·2 | Pass | None |
| 94 | Tangent exact sequence/vertical square | cubic threefold in ℂP⁴; n_f=1,2 | base p₁=(5−9)x²=−4x²; vertical coefficient 4 at n_f=1 cancels it; n_f=2 gives 16, not 8 | Pass | Source slips already corrected here |
| 95 | Integral λ from torsion-free H⁴ | 2λ=0 in ℤ versus ℤ/2 | ℤ: λ=0; ℤ/2: λ=1 allowed; torsion-free condition rules out the wrong inference | Pass | None |
| 96 | S5.5 rational kernel | degrees 8,12,16 | domain/target ranks (1,1),(1,1),(2,1); first kernels 0, degree-16 kernel rank 1 containing OP² | Pass | None |
| 97 | Integral genus kernel versus σ kernel | framed S³ | ordinary genus=0, σ[S³] has order 24, OP² ideal degree 3=0 | Pass for genus interpretation | Lines 964–966 must refer to genus, not preceding σ conjecture |
| 98 | Algebraic ideal versus derived quotient | R=ℚ[x], repeated sequence (x,x), Koszul control for the source’s route | ordinary quotient R/(x)=ℚ; Koszul H₀=ℚ and H₁=ℚ generated by the difference of the two exterior generators | Extra derived class survives; algebraic quotient is insufficient | No spectrum quotient asserted |
| 99 | S6.1 Ricci sign and positive dimension | S¹(r=1), S²(r=1), pt | Ric on unit vectors 0,1; pt has no nonzero tangent vector but φ(pt)=1 | Circle claim fails | R09; point correctly excluded |
| 100 | S6.2 low-weight vanishing | weights 2,4,6,8,10,14 | dimensions 0,1,1,1,1,1; spanning Eisenstein monomials have constant 1, hence constant-zero subspace 0 | Pass | None |
| 101 | Limits of low-weight argument | weights 12,16 | dimensions 2,2; Δ and ΔE₄ nonzero with constant 0 | Pass negative controls | None |
| 102 | S6.3 Lie-group connection/curvature | orthogonal SU(2) fields, metric −B | ∇=½ bracket; Jacobi gives R=−¼ double bracket, Ric=g/4; opposite R gives −g/4 | Pass | None |
| 103 | Metric scale on SU(2) | round S³ radius 2√2 | sectional curvature 1/8; Ric=2/(2√2)² g=g/4 | Pass | None |
| 104 | Metric hypothesis excludes tori | G=S¹, B=0 | −B=0 on nonzero tangent vectors, so not a Riemannian metric; cannot infer positive Ricci from the displayed formula | Pass with stated metric hypothesis | None |
| 105 | Refined framed examples | SU(3), S³ | π₈tmf torsion class order 2; π₃tmf class order 24; both ordinary genera 0 | Pass | None |
| 106 | Periodic lifts/localization | d₂,d₃,D; local S³ classes | degrees 192·3=576=72·8; injectivity preserves orders 8 and 3, so periodic order lcm(8,3)=24; SU(3) order remains 2 | Pass | None |

**Source audit: all 15 seeded targets.** Sources were obtained through the sources service from arXiv, author pages or institutional hosts. The versions read were Redden v2, Waldorf v4, Meinrenken v3, CJMSW v2, McTague 1111.4520 v5 and 1312.2440 v4, Hopkins v1, BMQ v4 and Belmont–Shimomura v2. Locators below refer to those texts, not an assumed identical pagination in a published edition. Hovey's 2008 publisher-formatted author copy and Hovey–Ravenel's April 1994 author preprint were also read. The latter's Corollary 1.5 agrees in numbering with the README's citation. Milnor–Stasheff was read in the legally hosted TeXromancers transcription; its defects below are not attributed without qualification to the 1974 printing.

| Seeded target | Text opened at locator; result |
|---|---|
| S1.1 λ | milnor-stasheff line 2487, §8, printed pp. 100–101 gives the Thom definition of Stiefel–Whitney classes; line 4714, §15, p. 182 gives p_i=(−1)^i c₂ᵢ; line 4805, Corollary 15.5, p. 185 gives the realification formula. These support the normalization and Hopf/adjoint computations, not by themselves the entire stable λ construction. The latter has its explicitly owned target and G5.0 input. |
| S1.3 existence/torsor | redden-canonical-3forms line 214, Proposition 2.2, p. 5: nullhomotopy obstruction and H^(n−1) action; line 237, Proposition 2.3, p. 5: fibre restriction and equivariance. The CW/classifier setting and fixed-lift data matter. |
| S1.4 transport/sums/relative lifts | Redden's preceding result supports the absolute action; it does not supply the whole relative/sum block at an identified locator. The displayed sign follows from reversing the λ-image before appending. Relative D⁴/S³ computation checked; locator defect R10 remains. |
| S1.5 Cayley plane | Borel–Hirzebruch I §19 not legally readable in this run. The internal characteristic-number tests give signature 1 and Â=0, but do not certify the homogeneous geometry or that source's §19 locator. See R02 and Not verifiable. |
| S2.1 MString comparison | Resolved EllipticCohomology E5 at its supplied open head: the τ_(≥8)ko Thom spectrum and its sequential comparison are owned there. The target here is the normalized comparison with S1's homotopy fibre. The π₄/π₈ tests agree; it is not a second E∞ construction. |
| S2.3 stems/framings | Toda Chapters V and XIII remain uncertified. milnor-stasheff line 5711, Theorem 18.6, pp. 217–219, and line 5805, Thom's theorem, p. 220 cover oriented/unoriented PT, not a proof of every structured case. Hopkins line 396, p. 293 independently corroborates the low tmf groups and unit isomorphism through 6. Current E4.S/E5 ownership gives R07. |
| S3.0 foundations | Bott–Tu Theorem 5.1 and Lee Theorems 4.26/6.30 remain uncertified. Native `Manifold.IsSubmersion` and the actual partition-of-unity binders were opened; they do not supply the missing global hypotheses. R04 is witnessed directly, not inferred from inaccessible books. |
| S3.1 differential characters | cheeger-simons line 100 and Theorem 1.1 at line 114, p. 52; Theorem 2.2 at line 341, p. 58. The universal natural character takes both an integral characteristic class and its compatible invariant polynomial. This is not uniqueness for an arbitrary unrelated choice of curvature and class on one manifold. With λ fixed universally the proposed use is sound; the degree shift and further locators need R10. |
| S3.3 gerbes/CS | meinrenken-basic-gerbe line 524, §5.2, p. 13 and line 627, §5.4, p. 16: normalized form and general compact simply connected simple group. cjmsw-bundle-gerbes line 913, Proposition 4.8, p. 20 classifies connection/curving 2-gerbes by Deligne H³, i.e. Ĥ⁴ in this README; line 1109, Theorem 5.8, p. 24 gives multiplicativity iff transgression. waldorf-string-connections line 759, Lemma 3.1.2, p. 21 supplies the characteristic class. n≥5 avoids the rank-3 level and rank-4 product problems. |
| S3.4 geometric structures | waldorf-string-connections line 404, Theorem 1.3.3, p. 11 assumes a compatible trivialization; line 428, Theorem 1.3.4, p. 12 provides existence; lines 876–887, Proposition 3.3.4, p. 24 give exactly the displayed quotient V_T. The connection-space theorem is correctly transcribed; the Hopf Check violates its hypothesis (R01). |
| S3.5 diffeology | lean-catdg at the stated commit: `Manifolds.lean`, line 28 constructs its manifold diffeology; line 101 gives the forward smoothness comparison; line 145 gives the boundaryless, finite-dimensional-source reverse comparison. `Constructions.lean`, lines 947–1005 give functional diffeology, evaluation, composition, curry/uncurry. These are comparison code on different APIs, not declarations at the pin. Some other assertions there are admitted; see below. Its LICENSE lines 5–6 specify Apache 2.0. |
| S3.6 transgression | waldorf-string-connections line 1092, (4.2.1), p. 30; line 1210, degree-1 holonomy, p. 33; line 1258, Lemma 4.3.2, p. 34; line 1289, Lemma 4.3.3, p. 35. Injectivity is on the relevant isomorphism classes. Surjectivity retains the point-determination hypothesis; no unconditional claim about corners is imported. The real-form normalization needs the corrected exponential already present. |
| S5.1 Cayley bundles | mctague-cayley-plane lines 994–1027, pp. 16–17 construct the associated geometric families and track the total tangent class. The product OP²×HP² is a valid negative control. The general associated-bundle target has no locator attached in the README (R10). |
| S5.4 criterion/families | mctague-cayley-plane line 324, Theorem 4, p. 6 matches both valuation conditions, including 0<i<j and the prime-square test. Line 1030, Lemma 8, pp. 16–17 matches n=3a+8b; line 1114, Proposition 11, p. 18 and line 1131, Lemma 12, pp. 18–19 support the gcd step. The README correctly squares n_f and uses the tangent-before-normal exact sequence, correcting slips in the source. The auxiliary n of Lemma 8 must be instantiated by the required degree-cancellation integer; it is not a restriction of the bordism theorem to dimensions ≥56. |
| S6.1 Ricci/Stolz | Stolz §1 remains uncertified. The positive-dimensional, one-way conjecture stated here is not treated as a theorem. Native Ricci trace and the constant-curvature sign were checked, giving the explicit circle defect R09. The point exclusion is correct. |

Additional end-theorem sources opened: mctague-cayley-plane line 58, Theorem 1, p. 2 (kernel over ℤ[1/6]); line 104, p. 2 (family vanishing, reporting Jung's theta-function argument); hovey-large-primes line 508, Theorem 2.4, p. 2413 (p≥5); hovey-ravenel line 284, Corollary 1.5, p. 8 (all odd primes for BO); mctague-tmf-quotient line 124, Theorem 1, p. 2 and line 146, Corollary 2, p. 3 (no quotient even with its specified module-level identification); hopkins-icm2002 lines 396–405, p. 293 (unit images); bmq-hurewicz lines 128–129, p. 3 (Δ⁸-periodic pattern); belmont-shimomura line 653, Theorem 6.1, p. 18 (Δ³ injectivity). In the last two, retain the primes and connective coefficient rings specified by the sources. I did not promote the integral σ-kernel questions to theorems.

**Pinned-library audit.** Mathlib is pinned at `6b7abb3c`; Tau Ceti at `a91d3aaf`. Object searches included homotopy groups, spheres, Eilenberg–Mac Lane spaces, characteristic classes, Spin/String and Thom/bordism carriers, gerbes, differential characters, diffeologies and smooth maps, submersions and partitions of unity, Ricci/Levi-Civita, modular forms, and split versus division octonions/Albert algebras. The following declaration groups were opened, rather than inferred from names:

| Pinned file and line | Declaration/content checked; boundary of its contract |
|---|---|
| `Mathlib/Topology/Homotopy/Basic.lean:76` | `ContinuousMap.Homotopy` is a continuous map on I×X with endpoint laws; it is not an automatic classifier or a characteristic class. |
| `Mathlib/Topology/Homotopy/HomotopyGroup.lean:441` | Native `HomotopyGroup` quotient; notation at 458, group instance at 547, commutative group at 603. These are sufficient to state the one Lean headline. |
| `Mathlib/Geometry/Diffeology/Basic.lean:159` | `DiffeologicalSpace`; `IsPlot` at 197, `DSmooth` at 202; the plot carrier does not impose an unrelated pre-existing topology. |
| `Mathlib/Geometry/Diffeology/Basic.lean:284` | `CorePlotsOn`, `ofCorePlotsOn` at 319 and the lattice API later in the file. No manifold or functional-map construction was found there. |
| `Mathlib/Geometry/Diffeology/Basic.lean:353` | `IsDTopologyCompatible` compares topologies; at 370 `IsContDiffCompatible` additionally requires a real normed space. `NormedSpace.toDiffeology` at 378 requires finite dimension. R05 preserves these distinct contracts. |
| `Mathlib/Geometry/Manifold/ContMDiffMap.lean:38` | `ContMDiffMap` bundles a map with smoothness; it does not turn every carrier into a separated or paracompact manifold. |
| `Mathlib/Geometry/Manifold/Submersion.lean:153` | Local projection model, then global `IsSubmersion` at 553 via a chosen complement. It does not make the base Hausdorff or prove all of S3.0's fibre-product claims. |
| `Mathlib/Geometry/Manifold/PartitionOfUnity.lean:551` | Explicit T2 and sigma-compact assumptions before `SmoothPartitionOfUnity.exists_isSubordinate` at 555. |
| `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:201` | `IsLeviCivitaConnection`; constructed `leviCivitaConnection` at 359. These native objects, rather than an arbitrary connection, belong in S6's Ricci predicate. |
| `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Ricci.lean:57` | `ricciTensor` is trace of w↦R(w,u)v; `ricciTensor_eq_of_curvatureTensor_eq_smul_sub` at 101 gives the stated sign. No symmetry or positivity for arbitrary connections is silently assumed. |
| `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:123` | The existing K(G,1) predicate uses the fundamental group and higher asphericity, not a constructed K(ℤ,4). |
| `TauCeti/Algebra/Octonion/Basic.lean:121` | Native Zorn/split octonion carrier; norm at 375 is ab−v·w, not the positive division norm. |
| `Mathlib/NumberTheory/ModularForms/LevelOne/DimensionFormula.lean:250` | `ModularForm.dimension_level_one`, for even natural k: rank is k/12 when k≡2 mod 12, and k/12+1 otherwise. Substitution gives every S6.2 dimension in the table. |

**Cross-roadmap and ownership audit.** Searches used the roadmap service's object grep and direct reads in main, the supplied open checkouts and board packages. Main was checked at `9c6e95d9`; the two main files underlying R02/R08 had no local modifications. Names were checked in their actual sections. Existing roadmap scope remains in place: the projective-plane geometry, structured PT comparison, differential String refinements and genus application are an extension, not a replacement of a main roadmap. R02, R07 and R08 identify the particular ownership boundaries still needing correction.

| Supplier/reference resolved | Actual section/object opened |
|---|---|
| GeneralizedCohomology | `TauCetiRoadmap/GeneralizedCohomology/README.md`: G2 item 5 Freudenthal (line 326), G2.10 mapping-path/lifting (535), G3.8 connective covers (785), G5.0 Spin and Hopf c₂ normalization (1375,1504), G5.3 Thom spectra (1536), G5.6 rational EM/Hurewicz input (2212). |
| AlgebraicTopology | `TauCetiRoadmap/AlgebraicTopology/README.md`: Stage 6 universal coefficients; 8.3 Hurewicz, 8.5 Whitehead, 8.7 finite compact-Lie CW models, 8.10 representability and 8.11b loop comparison (the latter at 1993). The loop coordinate convention agrees with the README. |
| CharacteristicClasses | `TauCetiRoadmap/CharacteristicClasses/README.md`: C2 Thom classes, finite Lie-group classifiers and C4.1/C4.3 curvature/universal connections (C4 begins at 1037). The new S3.0 carrier comparison is essential because C4's curvature is not specified by a bare 2-form. |
| TopologicalKTheory | `TauCetiRoadmap/TopologicalKTheory/README.md`: stable BO/BSO, T2.1 virtual bundles and T2.3 λ-series (687). Exterior powers are present; no symmetric-power operation is supplied under that name. S4.1 now constructs it from the correct input. |
| SpinGeometry | `TauCetiRoadmap/SpinGeometry/README.md`: G4.1 Spin cover; G6 Lichnerowicz and the spinor structures used by the dimension-4 index argument. |
| DGFloer | `TauCetiRoadmap/DGFloer/README.md`: Layer 1 item 2's native fibration homotopy sequence, including low-dimensional group/pointed-set terms (487 onward). Layer 11 item 3's compact Lie-group criterion at 1614 is additionally needed, R08. |
| Orbifolds | `TauCetiRoadmap/Orbifolds/README.md:220`, O2 item 6: native manifold diffeology, atlas independence, D-topology, restrictions and finite products. The previous duplication is gone. |
| DifferentialGeometry | `TauCetiRoadmap/DifferentialGeometry/README.md`: forms, smooth-chain integration, Stokes and §8.5 de Rham. Its discussion at 969 distinguishes the non-Hausdorff native manifold setting; separation cannot be silently inferred. |
| RiemannianGeometry | Main `TauCetiRoadmap/RiemannianGeometry/README.md`: geodesics/exponential maps. S3.0 explicitly owns the further convex-neighbourhood/good-cover result; it does not claim that result is already in this supplier. |
| GeometricTopology | Main `TauCetiRoadmap/GeometricTopology/README.md`: Layer 1 collars and tubular neighbourhoods (205,218). No algebraic Bertini or arbitrary transversality is attributed to this contract. |
| ModularForms | Main `TauCetiRoadmap/ModularForms/README.md`: level-one/q-expansion APIs and native dimension formula. The dimension calculation was independently checked at the Mathlib pin above. |
| BordismFormalGroups | `TauCetiRoadmap/BordismFormalGroups/README.md`: F3–F5 BP, truncated BP, cooperations/Hopf rings and ANSS. Its F3 explicitly hands the String-specific Hovey calculation to this application; the general HR splitting must still retain p=3. |
| SchemeAndStackFoundations | Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5680`, §4.13 `bertini_smoothness`: the very ample smooth-complete-intersection input, not an unsupported claim that GeometricTopology supplies Bertini. |
| AffineMorseLefschetz | Main `TauCetiRoadmap/AffineMorseLefschetz/README.md:67`, A0 `complexProjectiveZeroLocus` and its analytic submanifold/Jacobian interface. The comparison of the particular complete intersections remains a target here. |
| IndexTheory | Supplied open `TauCetiRoadmap/IndexTheory/README.md`, I7 (723 onward), including twisted index, Â and signature formulas. This is the named open new-roadmap supplier, not a nonexistent main file. |
| EllipticCohomology | Supplied earlier open `TauCetiRoadmap/EllipticCohomology/README.md`: E4 coefficients/localizations; E5 MString and σ; E6 unit images/localization criterion. E4.S and E5 line 1675 additionally resolve the new stable-stem overlap, R07. Nothing consumed here depends back on StringOrientation. |
| LieHighestWeight | Main `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:1255` and 1332: division octonions and compact Albert algebra. These precede compact homogeneous geometry and can supply S1.5 without a TangentialBordism cycle. |
| Later overlapping roadmaps | Supplied SmoothBundlesConnections B1.0/B1.1/B3.1/B4.1/B6.0, LieGroupoidsPoisson G0 and HomotopySpheres Stage 9 were read. Their needed constructions have been moved here as recorded in Scope; none is used as an upward supplier. |
| TangentialBordism | Supplied open `TauCetiRoadmap/TangentialBordism/README.md`: scope and supplier contracts consume S1.5, S2.2, S2.3 and S5.3 here; the late compact-Albert geometric comparison consumes the main algebra supplier. This review does not reverse that direction. |
| FourManifolds | Supplied open `TauCetiRoadmap/FourManifolds/README.md:1844` consumes the indicated String-lift/classification/adjoint objects. Intended downstream names are not falsely advertised as extra declarations in this Suggested file. |

The object search found no collision with the one fully qualified Lean declaration. Open-work ownership was checked against the supplied checkouts for the relevant objects; no conclusion is drawn about unprovided open checkouts returned incidentally by the broad search. Board-package searches did not reveal another owner of the differential characters, gerbes or functional-diffeology targets. The shape was compared with main Orbifolds, GeneralizedCohomology and TopologicalKTheory. The target has the requested opening, scope, conventions, contracts, layered prose, examples/dependencies and references. Its mathematical coverage is substantial, but this does not cure the findings above. No copied source passage, executable algorithm, sorry'd data or option override was found in the reviewed files.

## Not verifiable

These limitations do not suspend this review. They are not extra P1/P2 findings merely because a legal text was unavailable.

- **Borel–Hirzebruch I–II**, I §19 and Theorems 10.7/20.3: the service reached the JSTOR bibliographic/paywall route; the institutional MPIM listing restricts access. No full legal text was obtained. McTague's restatements at mctague-cayley-plane lines 739 and 775 were read, but they do not independently certify the original locator or its full proof. OP² arithmetic consistency is verified separately.
- **Stong, Chapter II:** the service reached the publisher/DOI landing page, without an accessible full text. General structured PT in the proposed bundle-diagram generality is not certified from that chapter. Milnor–Stasheff's oriented/unoriented cases are narrower.
- **Toda, Chapters V and XIII:** no legal full text was returned by the source service. The exact chapter locators for the primary computations remain uncertified; stable-range arithmetic and supplier overlap were checked independently.
- **Bott–Tu, Theorem 5.1; Lee, Theorems 4.26/6.30:** publisher routes did not yield readable legal texts. Their theorem numbering and precise standing manifold hypotheses were not certified. R04 has an independent native-carrier counterexample.
- **Stolz 1996, §1:** the publisher route and author/public bibliographic listings did not yield the full text. The exact original formulation is therefore not certified. In particular, McTague's stronger biconditional is not used as a substitute.
- **Family vanishing proof:** mctague-cayley-plane line 104 states the theorem and describes Jung's theta-function argument as unpublished. That verifies the reported result and route, not every step of the theta identity. This review did not obtain that unpublished proof; S5.2 still owns the actual proof.
- **lean-catdg proof completeness:** the stated commit was readable, including its licence and both construction files. Its global `DSmooth.contMDiff` theorem has a proof with the displayed finite-dimensional/boundaryless-source assumptions, and its functional construction has real bodies. The separate open-set comparison at `Manifolds.lean` line 140 and finite-product topology instance at `Constructions.lean` line 914 are admitted. They cannot be counted as completed imported proofs. The README calls the development a comparison and explicitly asks to prove its own bridge, so this is not a missing proof in Suggested.lean.

The source service's missing-text scratch record was retained for genuinely unresolved works and cleaned of entries subsequently fetched. No source manifest or roadmap file was edited. For already marked uncertified citations, this report records the access limit without requesting that the review be parked or changing their settled status.

## Source issues

- **Misprint** in waldorf-string-connections at (4.2.1), printed p. 30: the source says the degree-three holonomy is the exponential of the integral of a real form; it should be exp(2πi∫H), consistent with its degree-one formula on p. 33; affects a stated result.
- **Misprint** in mctague-cayley-plane at the ku and BU splitting displays, printed p. 7: the source says the product begins at i=1; it should be i=0 through p−2, including the unsuspended BP⟨1⟩ factor; affects a stated result.
- **Misprint** in mctague-cayley-plane at the paragraph after the Hovey–Ravenel decomposition, printed p. 7: the source says identity factors have 0<i<(p−3)/2; it should be 0<i<(p−1)/2, as in hovey-ravenel Corollary 1.5; affects a stated result.
- **Misprint** in mctague-cayley-plane at the complete-intersection tangent sequence, printed p. 16: the source says the normal bundle injects into the ambient tangent bundle with quotient TV; it should be TV injecting into the restricted ambient tangent bundle with quotient ⊕O(d_j); affects the proof.
- **Misprint** in mctague-cayley-plane at the pullback of p₁(η) and following display, printed p. 16: the source says scaling each root by n_f produces coefficient 4n_f; it should be 4n_f² because p₁ is quadratic in roots; affects the proof.
- **Error** in mctague-cayley-plane at the stated Stolz biconditional, printed p. 3: the source says genus-zero closed String manifolds admit positive Ricci curvature; it should be the forward implication only without additional restrictions, since T⁴ has genus zero and infinite fundamental group; affects a stated result.
- **Misprint** in milnor-stasheff (TeXromancers transcription) at Lemma 15.2, printed p. 182: the source says stabilization by a trivial bundle has total class p(ε); it should be p(ξ); affects a stated result.
- **Misprint** in milnor-stasheff (TeXromancers transcription) at the proof of Theorem 18.6, printed p. 219: the source says h₀ has interval domain [0,1] and prescribes its values on [2,3]; it should be [0,3]; affects the proof.
- **Misprint** in milnor-stasheff (TeXromancers transcription) at the proof of Theorem 18.6, printed p. 219: the source says the resulting cobordism class depends on the homotopy class of B; it should be the homotopy class of g; affects the proof.
- **Misprint** in milnor-stasheff (TeXromancers transcription) at the introduction to regular values, printed p. 215: the source says Arthur Sand; it should be Arthur Sard; affects nothing.
- **Gap** in lean-catdg at `Manifolds.lean`, `IsOpen.dsmooth_iff_smoothOn`, source p. 1, line 140: the source says the open-domain smoothness equivalence is a theorem but admits its reverse direction; it should be supplied with a proof or explicitly treated as an unproved target; affects the proof.
- **Gap** in lean-catdg at `Constructions.lean`, finite-product `DTopCompatible` instance, source p. 1, line 914: the source says the finite-product topology compatibility is an instance but admits its proof; it should be proved from the product theorem before being used as verified formal evidence; affects the proof.
