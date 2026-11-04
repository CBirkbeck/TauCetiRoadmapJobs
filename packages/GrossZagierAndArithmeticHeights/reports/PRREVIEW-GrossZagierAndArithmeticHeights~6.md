# Review of GrossZagierAndArithmeticHeights (pull request #1487 at d4722a0)

**Verdict:** needs changes

## R01 (P2) — Retire the three fulfilled supplier gaps

**Location:** `packages/GrossZagierAndArithmeticHeights/design/plan.json:4`, :10 and :16: “polarized-skeleton-green”, “ideal-zeta-genus-factorization”, “normalized-e2-family”. The resolved imports are in `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:106`, :132 and :140.

**Claim:** Previous R03 remains unresolved. All three active gaps request supplied mathematics. Their slugs are absent from the README, which instead imports the actual owners. These entries fail the declared-gap minimality requirement; this is not a finding against an unfinished implementation.

**Witness:** TropicalAndBerkovichArithmetic §§2.10–2.13, 3.1–3.3, 6.6–6.8 supply the graph contract; AnalyticNumberTheoryPartI §§2.8, 2.10, 2.25 supply the genus contract; AutomorphicSpectralTheory §1.30 and pinned E2 supply the Eisenstein contract. Their exact locations are below.

Re-raised: r2b F01 in FIX-RT-GrossZagierAndArithmeticHeights~2.

That report's reason was that the Tropical supplier could not be read and the gap appeared in both required locations. The supplied Tropical head is readable, and README:106 expressly imports its objects. This reason no longer holds. The other two entries also remain despite their resolved imports.

**Exact repair:** Set the active `gaps` array to `[]`, removing these three entries and leaving the resolved README contracts and owned normalization/derivative adapters in place. This requires no change to a supplier and no new mathematical target.

**Repair tests:** Removing those entries still leaves the genus-one circle with μ=ds/2, g(0)=1/6, g(1)=−1/12 and mean zero supplied by Tropical §6.6; the norm-two genus values ε₅(2)=ε₋₃(2)=−1 supplied by AnalyticNumberTheoryPartI §2.10; and E2 coefficients 1,−24,−72 with E2*(i)=0 supplied by the existing Eisenstein interfaces. The proposed deletion was assessed read-only; no package or PR file was edited.

## Previous findings

- R01 — repaired: README:3651 distinguishes the normalized intersection coefficient from −(i+j)log N_v; :3683–3684 divides horizontal and vertical terms by e and :3686 applies the logarithm once. The ramified and unramified controls agree.
- R02 — repaired: README:123–127 imports full-order CM from ImaginaryQuadraticClassNumber H3.1, supersingular orders from SerreWeightAndLevelOptimisation §2.6, and the restricted CM/general integration comparisons separately. The repeated dependencies and §9.4 agree with those suppliers.
- R03 — not repaired: `packages/GrossZagierAndArithmeticHeights/design/plan.json:4`, :10 and :16 still contain all three fulfilled gaps. README:106, :132 and :140 already imports their replacements. Repeated as this report's R01.

## Verified sound

This is an independent AI incremental re-review of 61 changed lines since c3a16ba. I read the previous report, every changed passage, the affected mathematical interfaces and their replacement suppliers. Unchanged adversarial rows are explicitly attributed to [r5]; they are not presented as a second full review. Repository README and CONTRIBUTING were read, and the main-roadmap shape examples were ImaginaryQuadraticClassNumber and Completed/LocalGaloisGroups.

**Gate and scope.** HEAD is d4722a0845b9a31652f9d38c41526d81e67f5765. The PR diff has no changes outside this roadmap folder; the worktree was clean before and after review. The worker's gate reports every counter zero, including build. The independently rerun scanner gate returned:

    gate GrossZagierAndArithmeticHeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

The independently executed dependency check returned:

    depcheck: 204 roadmaps, 1642 edges, 0 problem(s)

No UPWARD or CYCLE line appeared. The targeted build `lake build TauCetiRoadmap.GrossZagierAndArithmeticHeights.Suggested` completed successfully (8981 jobs); direct `lake env lean` elaboration also succeeded. The only warning was the intended `sorry` at Suggested.lean:43. No changed passage introduces a route restriction, computational algorithm, copied source passage, sorry'd data, option override or duplicate foundational target. The outstanding issue is the active gap metadata, not a failing gate.

**Lean signatures and headlines.** The sole theorem is unchanged. A scratch copy with `#check @canonicalHeightRat_exists_unique` confirms that K, Field, admissible absolute values, DecidableEq, W and ellipticity remain in its type. Its unique real-valued rational quadratic extension restricts to the actual canonical height on 1⊗P, exactly as README:331 states. No binder changed. Four separate one-tactic replacements failed: `simp` made no progress, `rfl` did not close the existential, `infer_instance` had no instance goal, and `exact W.canonicalHeightQuadratic` supplied a ℤ-quadratic map rather than the required unique extension. These expected scratch errors are not PR build errors. No Lean process remains running.

The unchanged headline inventory is rational canonical-height extension (§0.2); Poincaré/Faltings–Hriljac comparisons (§§1.1, 2.12); strict GL₂ realization (§3.4); half-weight central value and coherent Waldspurger period (§§5.2–5.3); projected kernel and Fourier-height identities (§§8.1, 8.6); marked CM-point comparison (§8.8); YZZ/CST and ring-class/elliptic specializations (§§8.11, 8.14–8.19); algebraic-point subgroup and eigenlogarithm nonvanishing (§§9.2, 9.13); and weight-two anticyclotomic special values/logarithmic comparisons (§§9.11–9.22). The statable rational-height theorem remains present. Suggested.lean:11–26 names the other headlines and missing arithmetic-model, CM/Jacobian, automorphic, logarithm, measure and Abel–Jacobi interfaces. No replacement headline or padding was introduced.

**Pinned APIs inspected (8 declarations).** Mathlib remains at 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. File locations below are relative to the pinned library repositories.

| File | Declarations and relevance |
| --- | --- |
| `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:341` and :350 | `canonicalHeightQuadratic`, `canonicalHeightQuadratic_apply`: the real-valued ℤ-quadratic height and its evaluation require ellipticity. |
| `Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:127`, :131, :158 | `QuadraticForm.baseChange`, `baseChange_tmul`, `QuadraticMap.baseChange_ext`: ring-valued scalar extension and uniqueness, not the whole claimed real-valued existence theorem. |
| `Mathlib/NumberTheory/ModularForms/EisensteinSeries/E2/Defs.lean:60` | `EisensteinSeries.E2`: normalization by 2ζ(2). |
| `Mathlib/NumberTheory/ModularForms/EisensteinSeries/E2/Summable.lean:107` | `EisensteinSeries.hasSum_qExpansion_E2`: coefficients 1 and −24σ₁(n). |
| `Mathlib/NumberTheory/ModularForms/EisensteinSeries/E2/Transform.lean:229` | `EisensteinSeries.E2_slash_action`: retains the quasimodular defect; E2 alone is not the completed modular form. |

**Resolved supplier contracts (9 roadmaps).** Main was used where the roadmap exists there. Otherwise the indexed open head was read through roadmap lookup, with the supplied Tropical checkout used directly. Lookup adds a header; the line numbers below exclude that header.

| Supplier and exact file location | Contract checked and effect |
| --- | --- |
| `TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md:43`, :83–89 (main), H1.3/H3.1 | Proper forms and ideals for every order; analytic/algebraic lattice and differential comparison; isogeny kernel/degree; actual units, ring/ray reciprocity and conjugation. These support §§0a.1–0a.3, 0a.5, 0.5, 0.12, 2.15 and the nonmaximal-order branch of §9.4. |
| `TauCetiRoadmap/ClassFieldTheory/README.md:1843` (main), Layer 13 | Ring-class fields and arithmetic Artin/Picard identifications on invertible proper ideals. The quadratic-degree hypothesis is retained here. |
| `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md:354`, :368, :372, §1.2 | Injective O_L-action, degree 2 dim A, projective CM Lie module and splitting base. Covariant Hodge sequence, inverse torus action distinguished from pullback, and conjugate-first de Rham pairing are reproduced with their domains. |
| `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:2681`, :2719, A5.6–A5.7 | Actual integration/de Rham–Betti comparison preserving invariant differentials and evaluation. Supplies the nonmaximal elliptic and false elliptic marked summand without imposing full-field CM. |
| `TauCetiRoadmap/SerreWeightAndLevelOptimisation/README.md:452`, §2.6 | Supersingular cyclic pairs at positive level prime to the residue characteristic have Eichler endomorphism order; retains ideal classes, stabilizers and correspondence compatibilities. The replacement is valid in §§7.2, 7.21 and 7.61. |
| `TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:1221`, :1237, :1251, :1265, :1469, :1522, :2204, :2239, :2279 | Split semistable skeleton, polarized graph, refinement/base extension, weak Laplacian, probability measure, mean-zero Green kernel and model curvature. These are the objects still requested by the first gap. |
| `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:1027`, :1134, :1351, §§2.8, 2.10, 2.25 | Partial ideal series, imaginary-quadratic genus dictionary including discriminant 1, and factorization retaining ramified Euler factors. These replace the second gap. |
| `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:1510`, §1.30 | Weight-zero and weight-two Eisenstein families and their Fourier formulas, with continuation from §2.17. Together with pinned E2 and this roadmap's existing §6.18 adapter, replaces the third gap. |
| `TauCetiRoadmap/ShimuraVarieties/README.md:1068`–:1069, §4.4; also AbelianSchemesAndArithmeticModuli:2377, A4.10 | Resolves all three worker citation leads: `CanonicalModel.special_rational`, `CanonicalModel.special_action`, `SerreTate.homCriterion`. These are supplier roadmap APIs, not claims of installed library declarations. |

Roadmap lookup's rerun found no unresolved cross-roadmap citation. Its local invocation did not inspect pinned Lake names, so that limitation was covered by opening the pinned files and resolving the worker's three leads separately. Object searches used roadmap grep across main/open work and a board-package search for the CM Hodge, period and integration objects. The changed text imports those foundations; the level, arithmetic-normalization and marked-period comparisons remain this roadmap's additional work. A Lean-name search found the sole fully qualified target only in this roadmap. No new competing owner or supply cycle was established. This is not a claim to have audited unprovided open PR files.

**Source checks within the incremental scope.**

| Passage | Legal text inspected | Finding |
| --- | --- | --- |
| Seeded §2.15, changed supplier line README:1072 | gz86 line 895–905, II §4, printed p.248, first two displays | The h complex places are permuted simply transitively; the class-pair sum uses the already squared-norm local symbol. The off-diagonal and classical hypotheses remain. The new H1.3/H3.1 supplier supplies the same class/lattice indexing. |
| §7.46a(5), README:3651 | disegni line 2028–2055, §4.2 equation (4.2.4) and Proposition 4.2.2, printed p.41; README §§2.5, 2.9 | Horizontal and vertical coefficients have the same normalization; their sum is an intersection multiplicity before applying the logarithmic character. The roadmap's local e-normalization follows from log(q_w)/[H_w:F_v]=log(N_v)/e. This is a normalization comparison, not an assertion that Disegni's global denominator is literally e. |
| §7.47(2)–(4), README:3681–3687 | disegni line 2825–2858, Proposition 8.3.1(3), printed p.57 | Supports separate horizontal/vertical Schwartz theta terms under the source's assumptions. The changed coefficients agree with §7.46a and the single negative logarithm in the full height expression. The precise YZZ construction remains waived. |
| §9.4's new CM-period paragraph and Checks, README:5280–5285 | The CM §1.2 and abelian A5.6–A5.7 contracts above | This is an import with the supplier's hypotheses, not a new claim of having read KS. False elliptic surfaces use the marked rank-one summand of §0a.5; quadratic degree 2 is not twice dimension 2. |

Of this round's 15 seeded targets, only §2.15 has a changed passage. Its locator was reread. The unchanged seeded targets §§3.2, 3.3, 3.6, 6.8, 6.31, 6.32, 6.43, 6.48, 6.55, 7.52, 7.57, 7.77, 8.18 and 9.12 retain the previous record below. The sign-sensitive consequences in §§7.57 and 7.77 were additionally recomputed against the repaired coefficients. There is no newly added unverified locator to chase; settled waived/uncertified texts were not requested again.

**Computed adversarial record.** “Fresh” rows below were calculated for the repairs and their affected interfaces. “Inherited [r5]” preserves the preceding report's instances and values for unchanged statements; old line numbers are omitted because the README shifted. H is a fixed height and B a fixed pairing. These checks test normalization, domains, homogeneity and concrete instances; they do not purport to evaluate every global L-value or prove the kernel identities. Every numbered target, every seeded target and every headline retains a row. Additional rows separate the new laws and the three gap-removal tests.

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| §0a.1 | c=d; Gaussian conductors 1 and 3; C₃ conjugation | identity restriction has kernel 1; h(O₃)/h(O₁)=2/1=2; conjugation sends g to g² and back to g | Fresh; replacement H3.1/Layer 13 contracts preserve the tower law. |
| §0a.2 | N=1, Gaussian norm-five ideal, Eisenstein norm-seven ideal, nonmaximal order | identity degree 1; (2+i)(2−i)/5=1, kernel order 5; (2−ω)(3+ω)/7=1, kernel order 7; O₃ has 2 units versus 4 for O_K | Fresh; all-order import supports the same cyclic-pair construction. |
| §0a.3 | Gaussian level-five multiplication matrix; conductor-three restriction | [[2,−1],[5,−2]]²=−I and det=1; 5 divides lower-left 5 but not upper-right −1; O₃⊊O_K rejects nonoptimal restriction | Fresh; form/lattice supplier repointed. |
| §0a.4 | C3 arithmetic/geometric Artin | exponents 1 and −1=2; applying both gives 0 | Inherited [r5]. |
| §0a.5 | marked elliptic isogeny [2]; level 3 versus level 2 | degree 4 and differential factor 2; −1 acts as 2≠1 modulo 3 but as 1 modulo 2 | Fresh; full-order ideal/differential supplier retained, markings still necessary. |
| §0.1 | q(nP)=n²H; rank 0 | half polarization (4H−H−H)/2=H; empty determinant 1 | Inherited [r5]. |
| §0.2 | r=0,1/2,1,2 and torsion P | q(r⊗P)=0,H/4,H,4H from q(1⊗P)=H; torsion gives tensor 0 and height 0 | Fresh; same signature, no dropped binder or one-tactic proof. |
| §0.3 | s=1; central zero | Γ_C(1)=2/(2π)=1/π; completed derivative √N L′/π | Inherited [r5]. |
| §0.4 | D=−7,−4,−3 | unit counts 2,4,6; u=1,2,3; inverse squares 1,1/4,1/9 | Inherited [r5]. |
| §0.5 | C₃, ζ=2 in F₇ | arithmetic/geometric exponents 1 and 2; 2·4=1 mod7, whereas 2·2=4 | Fresh; replacement reciprocity preserves inverse convention. |
| §0.6 | two real components | full period 2Ω₀, identity period Ω₀; ratio 2 | Inherited [r5]. |
| §0.7 | real quadratic character; split place | λ²=−1 respectively 1; volume scale 4 gives pairing scale 16 | Inherited [r5]. |
| §0.8 | inert prime coefficient; split prime | quadratic Euler coefficient 0 respectively 2a; character product agrees | Inherited [r5]. |
| §0.9 | fixed orbit of size 3 | trace 3P, average P; quadratic heights 9H and H | Inherited [r5]. |
| §0.10 | pairing scales 2 and 3; rank r | bilinear value 6B; scaling form by 2 gives determinant 2^r det | Inherited [r5]. |
| §0.11 | [H:K]=3,[K:Q]=2 | H-relative height 3H_K; K-relative height 2H_absolute | Inherited [r5]. |
| §0.12 | D=−23,N=2, class g of order 3 | Fricke sends (0,n) to (2,n̄), then to (0,n); using +g first instead gives 1 | Fresh; new supplier retains class inversion and level conjugation. |
| §1.1 | elliptic principal polarization; dual −P | Poincaré diagonal H; negating dual point gives −H | Inherited [r5]. |
| §1.2 | M=Q(√5), basis 1,√5 | trace Gram diag(2,10); dual basis 1/2,√5/10 gives diag(1,1) | Inherited [r5]. |
| §1.3 | isogeny [2] | degree 4 and pulled-back diagonal height 4H | Inherited [r5]. |
| §1.4 | C3 eigencharacters ζ and ζ⁻¹ | product 1 permits B; matched ζ,ζ gives ζ²≠1 and B=0 | Inherited [r5]. |
| §1.5 | C2 fixed vector; zero module | trace 2x divided by 2 is x; zero maps to zero | Inherited [r5]. |
| §2.1 | squared metric versus norm | −log(norm²)=2(−log norm); tensor product gives sum, not product | Inherited [r5]. |
| §2.2 | g=1,2 | g orthonormal summands divided by g have total mass 1 in both cases; g=0 excluded | Inherited [r5]. |
| §2.3 | circle length 2; point graph | g(0)=1/6,g(1)=−1/12, mean 0; point kernel 0 and measure mass 1 | Inherited [r5]. |
| §2.4 | line degree 2; degree 0 | curvature mass 2 respectively 0, equal to degree·mass(μ) | Inherited [r5]. |
| §2.5 | two-component matrix [−2,2;2,−2]; P1 example | corrected intersection 1/2 gives −log(q)/2; P1 intersection −1 gives +log p | Inherited [r5]. |
| §2.6 | degree-zero divisor; one point | Green equation masses 0−0=0 and 1−1=0 | Inherited [r5]. |
| §2.7 | multiply metric by exp(1) | curvature unchanged; normalization shifts by 1, excluding the wrong constant | Inherited [r5]. |
| §2.8 | mean-zero kernel versus g+1 | means 0 and 1; only first satisfies normalization | Inherited [r5]. |
| §2.9 | weak normalization on degree 2 | mean correction −2 versus −1 for degree 1; degree-zero correction 0 | Inherited [r5]. |
| §2.10 | g=1,2 | dualizing curvature mass 0 respectively 2, equal to 2g−2 | Inherited [r5]. |
| §2.11 | P1 divisors (1)−(2), (0)−∞ | squared-norm symbol −2log2, equal to log of squared absolute ratio | Inherited [r5]. |
| §2.12 | principal divisor; multiplication [2] | global product-formula sum 0=height 0; quadratic scale 4 on both sides | Inherited [r5]. |
| §2.13 | conjugation-invariant metric; asymmetric candidate | conjugate norms 1,1 descend; values 1,2 fail invariance | Inherited [r5]. |
| §2.14 | ramification index 2 | residue-normalized coefficient 1/2; multiplying back by 2 gives 1 | Inherited [r5]. |
| §2.15 | one complex place and a symbol of value 2; two complex places with values 2 and 3 | h=1: place sum 2=one class-pair term; h=2: 2+3=5 on both sides; an extra embedding factor gives 10 | Fresh; sampled locator and changed class/lattice supplier agree. |
| §3.1 | odd bounds (a,b)=(2,1); dyadic (4,2,k=2) | odd lower expression −1/2; dyadic expression 1; dropping dyadic term changes bound | Inherited [r5]. |
| §3.2 | Hodge degree d; cover degree 2 | normalized class degree 1; pullback degree 2 | Inherited [r5]. |
| §3.3 | zero morphism; ξ degree 1 | normalization subtracts 0; constant c subtracts c·1, giving 0 | Inherited [r5]. |
| §3.4 | coefficient degree 1,2; multiplicity 2 | rank-two dimensions 2,4 match 2dim A; multiplicity 2 instead gives 4,8 | Inherited [r5]. |
| §3.5 | parametrization followed by [2] | differential factor 2c, degree 4d; constants alone are excluded | Inherited [r5]. |
| §3.6 | degree 2, volume 2 | normalized composition 1; unnormalized composition 2 | Inherited [r5]. |
| §3.7 | e=1,p=3 and p=2 | 1<2 true; 1<1 false, so dyadic boundary is excluded | Inherited [r5]. |
| §3.8 | c divides 6d; d=1 | allowed c=1,2,3,6; c=5 fails divisibility | Inherited [r5]. |
| §3.9 | ω=2πif dz | iω∧conj(ω)=8π² norm(f)² dxdy | Inherited [r5]. |
| §3.10 | isogeny degree 2 at p=5 | 2 is a p-unit, so valuations of transported unit factors remain 0 | Inherited [r5]. |
| §3.13 | two components versus one | c∞=2 versus 1; Ω_full=c∞Ω₀ in both cases | Inherited [r5]. |
| §4.1 | central character product −1 | equivariance gives l=−l, hence l=0 in characteristic 0 | Inherited [r5]. |
| §4.2 | two quaternion alternatives | local Hom dimensions (1,0) or (0,1), sum 1 | Inherited [r5]. |
| §4.3 | zero vector | unnormalized toric form 0; quotient 0/0 is not used | Inherited [r5]. |
| §4.4 | conductor exponents c<n at nonsplit place | incompatible fixed/eigen line dimension 0; admissibility excludes it | Inherited [r5]. |
| §4.5 | unramified spherical datum | normalized local factor 1; empty exceptional-place product 1 | Inherited [r5]. |
| §4.6 | nonzero one-dimensional toric line | nonzero functional has rank 1; zero vector evaluates 0 and is excluded | Inherited [r5]. |
| §4.7 | q=3 spherical; real weight 2 | Whittaker norm 9/2 and α=1; real norm 1/(8π²), α=1/4 | Inherited [r5]. |
| §5.1 | binary (m,r)=(2,0); split ternary (3,1) | anisotropic converges; 3−1=2 is not >2, so ordinary convergent-range theorem does not cover split case | Inherited [r5]. |
| §5.2 | d=±1; form scaled by 2 | gamma arguments have real parts 1/4,3/4; coefficient square and norm both scale 4 | Inherited [r5]. |
| §5.3 | vectors scaled 2,3; torus volume scaled 4 | bilinear sides scale 6; two periods scale 16 | Inherited [r5]. |
| §5.4 | one local toric Hom zero | period and normalized factor both 0; nonvanishing conclusion requires all factors nonzero | Inherited [r5]. |
| §5.5 | new vector scaled 2 | period square scale 4; normalized local quotient compensates by 1/4 | Inherited [r5]. |
| §5.6 | Whittaker characters ψ and ψ⁻¹ | unipotent multipliers multiply to 1; ψ with ψ gives ψ² instead | Inherited [r5]. |
| §6.1 | k=2 exponential seed | integral y²exp(−4πmy)=2/(4πm)³; normalizing factor returns 1 | Inherited [r5]. |
| §6.2 | terminating orders 0,1,2 at t=1; q0 derivative | polynomials 1,0,−1/2; q0′(1)=−exp(−1) | Inherited [r5]. |
| §6.3 | correspondence of degree 2 | pushforward degree 2; normalization by 2 gives degree 1 | Inherited [r5]. |
| §6.4 | component degrees (1,−1) | total degree 0 but both component degrees nonzero; componentwise condition is stronger | Inherited [r5]. |
| §6.5 | empty proper truncation; exponential growth | empty sum 0; exp(p^(4n)) defeats polynomial majorant, hence excluded | Inherited [r5]. |
| §6.6 | I(s)=s | I(0)=0 but I′(0)=1; central vanishing does not imply derivative vanishing | Inherited [r5]. |
| §6.7 | one mismatched local sign | product of local signs −1; changing that sign gives +1 | Inherited [r5]. |
| §6.8 | constant 1 on orbit size 3 | average 1; unnormalized sum 3 | Inherited [r5]. |
| §6.9 | one versus two zero local factors | derivatives of s and s² at 0 are 1 and 0 | Inherited [r5]. |
| §6.10 | inert p=11 in Q(√−3) | Euler series 1+11^(−2s)+…; norm-11 coefficient 0 | Inherited [r5]. |
| §6.11 | torsion divisor class | all height coefficients 0; cusp form 0 | Inherited [r5]. |
| §6.12 | degree-two trace | trace of pullback constant 2; normalized trace 1 | Inherited [r5]. |
| §6.13 | oldform f(q²), level divisible by 2 | odd coefficients 0 although even coefficient a2 can be 1 | Inherited [r5]. |
| §6.14 | scalar residue c=2 modulo 7 | inverse 4 gives 2·4=1; using 2 gives 4 | Inherited [r5]. |
| §6.15 | bijection of two ramified ideal indices | two summands a+b become b+a; sum unchanged | Inherited [r5]. |
| §6.16 | D=−3, n=3 and −3 | paired genus signs (1,−1) and (1,1) | Inherited [r5]. |
| §6.17 | zero index with w=6 | r(0)=1/6; it is not the positive-ideal count 0 | Inherited [r5]. |
| §6.18 | z=i; first two q coefficients | E2*(i)=0; E2(i)=3/π; coefficients −24,−72 | Inherited [r5]. |
| §6.19 | p=2, exponent 1 | [[1,1/4],[1,1]]·(1/3)[[4,−1],[−4,4]]=I | Inherited [r5]. |
| §6.20 | F=Q constant coefficient | factor 1/2 retained; doubling would give 1 | Inherited [r5]. |
| §6.21 | q=2 auxiliary integral | j=−1/7, not 0 | Inherited [r5]. |
| §6.22 | Q2(i), discriminant exponent 2 | wild correction retains exponent 2; tame replacement exponent 1 differs | Inherited [r5]. |
| §6.23 | first admissible shell versus outside support | admissible shell can contribute q^(−a); forbidden shell contributes 0 | Inherited [r5]. |
| §6.24 | product s·u(s), u(0)=2 | derivative 2; differentiating a second vanishing factor would give 0 | Inherited [r5]. |
| §6.25 | nontrivial discriminant character of order 2 | character at negative test element −1; forgetting it gives +1 | Inherited [r5]. |
| §6.26 | inert prime | odd norm coefficient 0 on both ideal and Rankin sides | Inherited [r5]. |
| §6.27 | k=1, Re(s)=2 and 3/2 | 2>3/2 is inside convergence half-plane; equality is excluded | Inherited [r5]. |
| §6.28 | r_A(m)=0 versus 1 | CM intersection support empty versus nonempty; disjointness iff zero tested in both directions | Inherited [r5]. |
| §6.29 | Mellin exponent 2 | ∫y exp(−4πmy)dy=(4πm)^(−2), fixing 4π | Inherited [r5]. |
| §6.30 | N=2,k=1,s=1 | e=1 coefficient 1/2; e=2 coefficient −ε(2)/8; normalized trace would introduce another index | Inherited [r5]. |
| §6.31 | N=37,k=1,s=2 | scalar 1369/(32π³); convolution 37·3+1=112 retains nonzero summand | Inherited [r5]. |
| §6.32 | D=−7; rows [1:1],[2:2] | inverse products both 1 mod7; direct products 1,4 differ; coset count 8 | Inherited [r5]. |
| §6.33 | t=2 prime discriminants | ordered sign choices 2²=4; quotienting prematurely gives 2 | Inherited [r5]. |
| §6.34 | D=−3, divisors of n=±3 | ε(3,1),ε(3,3)=(1,−1); ε(−3,1),ε(−3,3)=(1,1) | Inherited [r5]. |
| §6.35 | n=3 and −3, D=−3 | signed derivative sum 2log3; negative-index ordinary signed sum 2 | Inherited [r5]. |
| §6.36 | coprime m=2,n=3 | divisors of 6 are 1,2,3,6, matching four pairs; m=n=2 fails pair uniqueness | Inherited [r5]. |
| §6.37 | cusp denominator M=2, coprime auxiliary modulus | leading scale 1/4; logarithmic term log(1/2), not log2 | Inherited [r5]. |
| §6.38 | constant torus-pair kernel, volume 3 | outer integral 3; normalized inner average 1 | Inherited [r5]. |
| §6.39 | spherical local inputs | local normalized factors 1; global remaining ratio L_ad/(2ζ), not L_ad/ζ | Inherited [r5]. |
| §6.40 | degree 4, N=±1; positive N=1,3 | both (1±i)^(−4)=−1/4; positive choices have moduli 1/4 and 1/100 | Inherited [r5]. |
| §6.41 | coefficient i in conjugate-linear slot | conjugation gives −i; failing to conjugate gives i | Inherited [r5]. |
| §6.42 | U2 acting on q² | result q; coefficient index 2→1, not 1→2 | Inherited [r5]. |
| §6.43 | one prime discriminant | two ordered contributions; imaginary phase −i retained rather than +1 | Inherited [r5]. |
| §6.44 | two Weyl terms at zero index | constant coefficient a+b; deleting one leaves a | Inherited [r5]. |
| §6.45 | positive versus negative Fourier frequency | positive terminating contribution and negative q-integral differ; zero-frequency branch separate | Inherited [r5]. |
| §6.46 | D=−3,n=−3 | σ(−3)=2; δ(3)R(3)=2·1=2 | Inherited [r5]. |
| §6.47 | boundary Eisenstein against cusp form | cuspidal constant term 0 makes boundary contribution 0 | Inherited [r5]. |
| §6.48 | α=β=1 boundary exponents | endpoint contribution 1; deleting boundary gives 0 | Inherited [r5]. |
| §6.49 | nontrivial finite character on C2 | sum 1+(−1)=0; trivial character gives 2 and needs exclusion | Inherited [r5]. |
| §6.50 | W0(s)=2^(−s)a | W0′(0)=−a log2; corrected derivative 0 | Inherited [r5]. |
| §6.51 | torsion CM class | height-series coefficients 0 and cuspidal projection 0 | Inherited [r5]. |
| §6.52 | four Hodge terms; d=2 | sign pattern +,−,−,+ gives constant cancellation 0; retained archimedean coefficient −1 | Inherited [r5]. |
| §6.53 | N=2,n=1,l=1,mδ=3 | index equation 2·1+1=3; dropping N gives 2≠3 | Inherited [r5]. |
| §6.54 | n=6 | log6=log2+log3; only corresponding valuation terms 1,1 occur | Inherited [r5]. |
| §6.55 | a/s+b−a/s | finite part b; taking separate totalized values loses b | Inherited [r5]. |
| §6.57 | good inert place, valuation 1 | derivative log q, not 0; arithmetic partner log q | Inherited [r5]. |
| §6.58 | nonzero Fourier mode | pole coefficient 0 for that mode; possible constant-mode residue retained | Inherited [r5]. |
| §6.59 | even and odd valuation 2,3 | parities 0,1; inert norm has even valuation only | Inherited [r5]. |
| §6.60 | one versus two zero Euler factors | s·2 has derivative 2; s²·2 has derivative 0 | Inherited [r5]. |
| §6.61 | d=2 | archimedean projection constant −γ−log(4π), not twice this | Inherited [r5]. |
| §6.56 | linear projection with correction K | Pr(I′)=Pr(main)−2K; K=1 gives subtraction 2 | Inherited [r5]. |
| §6.62 | k=1 terminating branch | degree-zero polynomial; all higher coefficients 0 | Inherited [r5]. |
| §6.63 | k=1,s=1 | reflected parameter −1; applying reflection twice returns 1 | Inherited [r5]. |
| §6.64 | central parameter 0 | holomorphic value may have constant term 1; cuspidality does not follow from regularity | Inherited [r5]. |
| §6.65 | k=1,s=0 | functional-equation partner 2; centre 1 fixed | Inherited [r5]. |
| §6.66 | k=1,D=−7 | central coefficient 8π²/√7 | Inherited [r5]. |
| §6.67 | negative index −3, D=−3 | negative divisor sum 2; substituting positive sum 0 deletes a real term | Inherited [r5]. |
| §6.68 | weight 2, root sign −1 | central equation L(1)=−L(1) gives 0; order can be 1 or 3 | Inherited [r5]. |
| §6.69 | k=1,h=u=1 | prefactor (2π)²·2/√δ=8π²/√δ | Inherited [r5]. |
| §6.70 | h=u=N=N1=1 | cusp prefactor h/(2u²)·N1/N=1/2 | Inherited [r5]. |
| §6.71 | zero constant term versus nonzero constant term | Mellin constant-tail integral 0 versus divergent unregularized integral | Inherited [r5]. |
| §6.72 | D=−7, zero endpoint | δ(0)r(0)=2·(1/2)=1 | Inherited [r5]. |
| §6.73 | nontrivial C2 genus character | sum 1−1=0; compatible trivial branch gives 2 | Inherited [r5]. |
| §6.74 | unit boundary coefficients | product 1·1=1, not 0 | Inherited [r5]. |
| §6.75 | test vector scaled 2 | definite period scales 2; its square and norm scale 4 | Inherited [r5]. |
| §6.76 | k=1 derivative normalization | 8π²/√δ remains; omitted unit factor u=3 changes height coefficient by 9 | Inherited [r5]. |
| §6.77 | period scaled 2; zero period | square-class multiplier 4 is a square; zero has no multiplicative square class | Inherited [r5]. |
| §6.78 | u=3 coefficient a=1 | height coefficient 9, matching u²a | Inherited [r5]. |
| §7.1 | square-zero thickening in characteristic 2 | Q=1+ε has Q³=1+ε=Q; length(O/π^r)=r | Inherited [r5]. |
| §7.2 | supersingular curve at p=5, levels 1 and 2 | endomorphism-order reduced discriminants 5 and 10; level 2 is prime to 5, while level 5 is excluded by the imported theorem | Fresh; Deuring–Eichler import changes owner, not lifting-length formula. |
| §7.3 | isogeny and its negative; zero morphism | nonzero maps remain distinct in actual Hom; zero degree 0 is excluded from isogenies | Inherited [r5]. |
| §7.4 | one versus two local zeros | s derivative 1; s² derivative 0, requiring both S2 places | Inherited [r5]. |
| §7.5 | nonzero coherent kernel orthogonal to π | projection 0; kernel itself need not be 0 | Inherited [r5]. |
| §7.6 | Q3(√3),Q2(i),split | lattice indices 3,4,1; full equality fails in first two | Inherited [r5]. |
| §7.7 | n=v(ad)+1 | norm-shell admissibility fails, count 0; boundary n=v(ad) retained | Inherited [r5]. |
| §7.8 | ramified quadratic discriminant exponents 1 and 2 | wild shell correction differs by one valuation unit | Inherited [r5]. |
| §7.9 | archimedean δ=1 | logδ=0; δ=2 gives log2 | Inherited [r5]. |
| §7.10 | valuation n=1 versus 2 | linear local correction c logq versus 2c logq | Inherited [r5]. |
| §7.11 | a/s+b multiplied by 1+cs | finite part b+ca, not b | Inherited [r5]. |
| §7.12 | valuation 0,r=1,q=3 | diagonal auxiliary value 1/(q−1)=1/2 | Inherited [r5]. |
| §7.13 | reduced-norm valuation 2 | division multiplicity 2/2=1 | Inherited [r5]. |
| §7.14 | degree-zero same-component divisor | component degree 1−1=0, vertical contribution 0 in stated specialization | Inherited [r5]. |
| §7.15 | q=2 special test function | nonzero auxiliary integral 1/7 distinguishes zero theta datum | Inherited [r5]. |
| §7.16 | λ=−1,k=0 | derivative kernel value (log2)/2 | Inherited [r5]. |
| §7.17 | generic PSL2 stabilizer | effective stabilizer order 1; unreduced SL2 count 2 gives wrong double | Inherited [r5]. |
| §7.18 | N=2,s=2 | level multiplier 1/(1+2²)=1/5 | Inherited [r5]. |
| §7.19 | tangent scaled by t | finite part shifts by log norm(t); t=1 gives 0 shift | Inherited [r5]. |
| §7.20 | D=−3,u=3 | tensor-normalizing exponent 1/3, not 1 | Inherited [r5]. |
| §7.21 | p=5, positive cyclic level 1 and 2 | maximal order discriminant 5; level-two Eichler order discriminant 2·5=10 | Fresh; maximal and level-pair orders remain distinct. |
| §7.22 | connected versus étale degree-two kernel | component indices (1,0) versus (0,1) | Inherited [r5]. |
| §7.23 | six nonzero Hom representatives | quotient by ± gives 3, not 6 | Inherited [r5]. |
| §7.25 | q=2, δ=1/4, n=1/4 | 2n log2+(1/2)logδ=0 | Inherited [r5]. |
| §7.26 | inert singular term a log norm(t) | subtracting same term leaves finite remainder b, not infinity | Inherited [r5]. |
| §7.27 | ramified different exponent 2 | retained extra valuation 2; dropping different changes length by 2 | Inherited [r5]. |
| §7.28 | ramification index e=2 | normalized differential length Ω/2; pulling back doubles it to Ω | Inherited [r5]. |
| §7.29 | horizontal M, diagonal N | full M+N−diagonal; M=2,N=1,diagonal=1 gives 2 | Inherited [r5]. |
| §7.30 | split diagonal in stated convention | extended value 0, not the nonsplit self-term | Inherited [r5]. |
| §7.31 | norm valuation 2 | local division multiplicity 1 | Inherited [r5]. |
| §7.32 | zero determinant versus unit norm | singular input omitted; unit indicator 1 at norm 1 and 0 at norm π | Inherited [r5]. |
| §7.33 | adjunction-normalized tangent | log-singular term cancels, residual correction 0 in normalized test | Inherited [r5]. |
| §7.34 | only diagonal orbit survives before omission | after omission sum 0; counting it gives 1 | Inherited [r5]. |
| §7.35 | inert v=1; ramified v=1,different=1 | lengths (1+1)/2=1 and (1+1)/2=1 | Inherited [r5]. |
| §7.36 | m=2,s=2 | Hecke eigenvalue 2²+2^(−1)=9/2; σ1(2)=3 differs | Inherited [r5]. |
| §7.37 | rational t=2 | log norm product 0: real log2 plus 2-adic −log2 | Inherited [r5]. |
| §7.38 | eta tangent power u=3 | g=(cΔz)³; 1/u log norm(g) recovers log norm(cΔz) | Inherited [r5]. |
| §7.40 | D=−7,p=3,q=23 | pq=69≡−1 mod7; q=11 gives 33≡5 and fails | Inherited [r5]. |
| §7.41 | vertical correction and orthogonal divisor | component pairing 0; uncorrected degree vector (1,−1) is nonzero | Inherited [r5]. |
| §7.43 | six diagram isomorphisms | half count 3 agrees with multiplicity normalization | Inherited [r5]. |
| §7.46 | tangent π versus π⁻¹ | self lengths 1 and −1; pole cannot be silently truncated to 0 | Inherited [r5]. |
| §7.46a | two-component matrix [[−2,2],[2,−2]], degree vector (1,−1), q=5 | M·(1/2,0)=(-1,1), cancelling the degree vector; horizontal 0 plus vertical 1/2 gives symbol −log5/2≈−0.804719 | Fresh; previous R01 repaired. |
| §7.47 | horizontal raw length 1 at e=2; one supported vertical coset φ=3, raw length 1 at e=2 | m=1/2, horizontal height −log5/2; l=3/2, vertical height −3log5/2≈−2.414157; each logarithm applied once | Fresh; horizontal and vertical coefficients now share normalization. |
| §7.48 | d=2 Hodge term | archimedean coefficient −d/2=−1 | Inherited [r5]. |
| §7.49 | split maximal-level diagonal | proper term 0 and extended diagonal 0 | Inherited [r5]. |
| §7.50 | inert v=1,3 | lengths (v+1)/2=1,2 | Inherited [r5]. |
| §7.51 | ramified v=1,different exponent 2 | normalized multiplicity (v+d)/2=3/2; tame replacement gives 1 | Inherited [r5]. |
| §7.52 | q=2 | n=−1/7,c=−2log2/7,d=0 | Inherited [r5]. |
| §7.53 | ramification degree 2 | raw intersection doubles, normalized value divides by 2 and is unchanged | Inherited [r5]. |
| §7.54 | cusp width 10 | first exponential exp(−πY/5); dividing by exp(−Y) grows, so width-independent bound fails | Inherited [r5]. |
| §7.55 | m=1 | ± representatives divided by 2 give one identity correspondence | Inherited [r5]. |
| §7.56 | two unit generators ±1 | generator count 2, ideal count 1; quotient is necessary | Inherited [r5]. |
| §7.57 | raw corrected intersection 1, e=1, residue cardinality 5 | coefficient 1; local symbol −log5≈−1.609438; coefficient 2 at e=2 gives the same symbol | Fresh downstream sign check; statement unchanged. |
| §7.60 | j=1728 | 2^6·3^4=5184 in tangent normalization | Inherited [r5]. |
| §7.61 | connecting ideal class g in C₃; principal degree test t=2 | b̄/b has class g^(−2)=g; reversed orientation gives g²; principal norm ratio 4/4=1, not 4 | Fresh; supersingular supplier repointed, orientation law retained. |
| §7.62 | D=−7,p=7,q=2 | n=14, v7(n)=1; the lattice calculation gives 3−2=1 | Inherited [r5]. |
| §7.45 | congruence n=1,2 | inert indices p,p³; ramified indices p,p²; common p^n guess fails | Inherited [r5]. |
| §7.59 | a=tO,b=t; t=2 | identity morphism degree 1 equals Nb/Na=4/4 | Inherited [r5]. |
| §7.24 | CM-linear versus new anti-CM map | b−=0 gives liftable diagonal; b−≠0 enters new-Hom count | Inherited [r5]. |
| §7.42 | degree prime to p | étale lifting multiplicity 1; p-divisible degree is excluded | Inherited [r5]. |
| §7.58 | p=3,t=2 | inert total 1+3+9=13; split 3+4+6=13; ramified 1+3+9=13 | Inherited [r5]. |
| §7.39 | two isomorphisms, residue degree 2 | −(2/2)·2logp=−2logp | Inherited [r5]. |
| §7.44 | split prime and r_A(m)=0 | intersection multiplicity 0; the r_A(m)>0 diagonal branch is excluded | Inherited [r5]. |
| §7.63 | tensor exponent 6, root stabilizer | scaling tangent π changes tensor by π^6 and normalized log by log normπ | Inherited [r5]. |
| §7.65 | d=2 | full local decomposition retains −E*, since −d/2=−1 | Inherited [r5]. |
| §7.66 | split pair of conjugate primes | two half-log terms sum to full log, which cancels the diagonal correction | Inherited [r5]. |
| §7.67 | e=2, raw lattice length 2 | normalized intersection 1; omitting 1/e gives 2 | Inherited [r5]. |
| §7.69 | N=2,γ=[1,1;2,3] | wγw⁻¹=[3,−1;−2,1], both det1 and lower-left 0 mod2 | Inherited [r5]. |
| §7.70 | C3 versus C2 square map | square fibre sizes 1 and 2; class pair cannot be recovered uniquely in C2 | Inherited [r5]. |
| §7.72 | inert valuations 1,3 | local lengths 1,2; zero anti-CM component excluded | Inherited [r5]. |
| §7.73 | v_p(DNb−)=2 | ramified local length 2 | Inherited [r5]. |
| §7.74 | two extra automorphisms at one layer | half count (2/2)=1; no new automorphisms gives 0 | Inherited [r5]. |
| §7.75 | D=−7,p=3,q=23,a=O,b=j | Nb=69,n=483; 0+3·161=483=69·7 | Inherited [r5]. |
| §7.76 | cotangent self value 0, correction −1 | modified value 1; identifying the two pairings loses 1 | Inherited [r5]. |
| §7.77 | one good-place analytic term log5 and matching normalized arithmetic term | log5−log5=0; each term is ≈1.609438, not 0 | Fresh downstream cancellation check; statement unchanged. |
| §7.78 | e=2, raw i0=−6 | normalized correction −3 | Inherited [r5]. |
| §7.79 | N=2 | κ_N=−4 in stated normalization; residues cancel in the four-term kernel | Inherited [r5]. |
| §7.68 | four resolvent residues κ,−κ,−κ,κ | total residue 0; adding constant 1 changes prescribed cusp limit by 1 | Inherited [r5]. |
| §7.80 | C2 genus-orbit square map | square fibre size 2; treating it as bijective gives 1 | Inherited [r5]. |
| §7.81 | D=−7,N=2,τ=(-1+i√7)/4,γ=[1,1;2,3] | n=2·abs(τ−2)²=11; roadmap polynomial 11; printed GZ polynomial 12 | Inherited [r5]. |
| §7.82 | resolvent parameters s=2,s0=1 | spectral difference s(s−1)−s0(s0−1)=2 | Inherited [r5]. |
| §7.71 | D=−3,m=1,u=3,r(1)=1 | diagonal stabilizer count 3; finite-part term 3g, not 0 or g | Inherited [r5]. |
| §7.83 | six new Hom elements | new intersection half count 3; liftable elements excluded | Inherited [r5]. |
| §7.84 | u=1,δ=2 | orbit multiplier 2; an additional ± quotient would give 1 | Inherited [r5]. |
| §7.85 | u=3,raw self-count 6 | normalized diagonal count 6/2=3, not 1 | Inherited [r5]. |
| §7.86 | nonsplit different contribution d and −d | sum 0; deleting either leaves ±d | Inherited [r5]. |
| §7.87 | tangent normalized constant C | same C in both archimedean terms cancels; changing one by 1 leaves 1 | Inherited [r5]. |
| §7.88 | γ=id, equal CM points | hyperbolic n=0; retained diagonal would violate the off-diagonal n>0 restriction | Inherited [r5]. |
| §7.89 | inert m=p²,u=r_A(m)=1 | diagonal term (1/2)·1·1·2=1; formula without it gives 0 | Inherited [r5]. |
| §7.90 | ramified m=p²,u=r_A(m)=1 | diagonal term 1·1·2=2 | Inherited [r5]. |
| §7.91 | split r_A(m)=2,κ=1 | κ/r=1/2; r=0 branch does not form 0/0 | Inherited [r5]. |
| §7.92 | D=−3,u=3, one level-prime intersection | local J=−3; disjoint branch gives 0 | Inherited [r5]. |
| §7.93 | inert residue degree 2 and h/2 places | sum (h/2)·2logp=h logp | Inherited [r5]. |
| §7.94 | m=2,s=2 | eigenvalue 9/2; replacing it by σ1(2)=3 changes archimedean expression | Inherited [r5]. |
| §7.95 | u=3 | 2u²=18, not 2 | Inherited [r5]. |
| §7.96 | λ=0,κ=1,σ1(m)=1 | constant −λ+2κ=2; printed −λ−2κ gives −2 | Inherited [r5]. |
| §7.97 | m=1 and one split level prime | correction +uh logp; zero correction misses it | Inherited [r5]. |
| §7.98 | D=−7,N=2,m=p=3 | δ(6)R(2)ord3(18)=1·2·2=4; finite term −4log3 | Inherited [r5]. |
| §7.99 | ramified different exponent 2 | norm parameter retains two valuation units, unlike tame exponent 1 | Inherited [r5]. |
| §7.100 | u=3, positive ideal counts both 1 | multiplier u² is 9 when D∤n and 18 when D divides n | Inherited [r5]. |
| §7.101 | two prime discriminants | 2² ordered choices; genus quotient counts 2, not 4 | Inherited [r5]. |
| §7.102 | r_A(m)=0 | diagonal term 0; remaining finite expression retains −u²σ′ contributions | Inherited [r5]. |
| §7.103 | u=3, one counted orbit | coefficient −2u²=−18 | Inherited [r5]. |
| §7.104 | two genus classes with equal kernel a | orbit sum 2a; probability average a | Inherited [r5]. |
| §7.105 | D=−3,n=3 | δ(3)=2; using unramified value 1 loses half the count | Inherited [r5]. |
| §7.106 | spectral difference 2; h orbit points | summed constant 2h | Inherited [r5]. |
| §7.107 | resolvent pole coefficient hσκ | subtracting hσκ/(s−1) leaves finite part; pole coefficient is not 0 individually | Inherited [r5]. |
| §7.108 | u=3,r_A(m)=1 | extra diagonal coefficient 2hu r=6h | Inherited [r5]. |
| §7.109 | one complex place | two embeddings give 2a; one place weighted 2 also gives 2a | Inherited [r5]. |
| §8.2 | C3 over F7,ζ=2; characteristic 3 | vector (1,2,4) shifts to (4,1,2)=4v; in F3 trace of 1 is 0 so averaging excluded | Inherited [r5]. |
| §8.3 | one, two mismatched local signs | global products −1,+1; odd parity is necessary | Inherited [r5]. |
| §8.4 | ω=2πif dz; map followed by [2] | area factor 8π²; differential square and degree both multiply by 4 | Inherited [r5]. |
| §8.5 | D=−7,N=11,A=[1,−1;22,−8] | A²+7A+14I=0; lower-left 22 divisible by 11 | Inherited [r5]. |
| §8.6 | u=3,m=1,a1=1 | height coefficient u²a1=9; u=1 would give 1 | Inherited [r5]. |
| §8.7 | L=Q(i),base B=1 | B(ix,iy)=−1; Hermitian alternative +1; trace of base value 1 is 2 | Inherited [r5]. |
| §8.8 | orbit size 3, quotient followed by [2] | point 6Q, height 36H, log 6l; basepoint correction 3T | Inherited [r5]. |
| §8.10 | χ(t)=ζ of order 3 | toric scalar ζ⁻¹; multiplying by χ gives 1 | Inherited [r5]. |
| §8.9 | K=Q(i),h=1 | completed L(1,η)=1/4; volume 1/2; volume-height factor 1/4 | Inherited [r5]. |
| §8.12 | one local Hom dimension 0 | global Heegner functional and α both 0; identity 0=0 gives no L′ information | Inherited [r5]. |
| §8.1 | projector onto first coordinate, I′=(2,7),Z=(1,3) | Pr(I′)=2=2Pr(Z); unprojected second coordinates 7≠6 | Inherited [r5]. |
| §8.11 | CST versus YZZ base-height/volume conversion | two conversion factors give 2/8=1/4; torus scale 4 gives square scale 16 | Inherited [r5]. |
| §8.13 | nonzero matching test vectors versus zero vector | nonzero α permits cancellation; zero vector gives 0=0 and cannot detect derivative | Inherited [r5]. |
| §8.14 | one ramified common prime; degree d=2 | ramification factor 1/2; archimedean factor (8π²)² | Inherited [r5]. |
| §8.15 | D=−4,c=1,u=2; class number 3 | 8π²/(4·2)=π²; H-relative height is 3 times K-relative | Inherited [r5]. |
| §8.16 | local ratio factors 1/2,9/2,4 | combined multiplier 9; empty set product 1 reproduces base formula | Inherited [r5]. |
| §8.17 | polarization scaled 2; vector scaled 2 | both height sides scale 2; vector quadratic sides scale 4 | Inherited [r5]. |
| §8.18 | two coefficient embeddings, each order 1 | total order 2=dim A; orders 3,3 would give 6 | Inherited [r5]. |
| §8.19 | map [2], height initially 3, degree initially 2 | new ratio 12/8=3/2 equals 3/2 | Inherited [r5]. |
| §8.20 | positive constant times height; torsion | height 0 gives derivative 0; positive height gives positive derivative | Inherited [r5]. |
| §9.1 | e=1,p=3 and 2; free ranks 1→3→2 | inequality true at 3, false at 2; quotient rank 2 versus nonsaturated 3R⊂R of length 1 | Inherited [r5]. |
| §9.2 | A1×A2, W=Lie A1; torsion point | subgroup A1×0 has Lie dimension 1; nonzero torsion log 0 excluded by nonzero-log premise | Inherited [r5]. |
| §9.3 | F=π²(T+π)³; square | μ=2,λ=3; square μ=4,λ=6; unbounded log(1+T) is not a counterexample in integral algebra | Inherited [r5]. |
| §9.4 | Gaussian multiplication by i; normalized de Rham pair; false elliptic surface | Lie eigenvalue i, contragredient cotangent −i, pullback i; conjugate-first pair sends first-form scale i to −i; [K:Q]=2≠2dim A=4 | Fresh; separate full-CM and general-pairing branches are correct. |
| §9.5 | Tate period 5, points [6],[36] | logs 55,110 mod125; sum 40; projection 55; [30]=[6] has same log | Inherited [r5]. |
| §9.6 | quaternionic form scaled 2 | Petersson denominator multiplies 4, ratio divides 4; primitive p-lattice condition excludes nonunit scaling | Inherited [r5]. |
| §9.7 | p=5,a=−4; p=23,a=−1 | Euler factors 2 and 25/23; valuations 0 at 5 and −1 at 23 | Inherited [r5]. |
| §9.8 | degree-zero divisor P−P; differential 2ω | AJ and log both 0; scaling gives 2log and square factor 4 | Inherited [r5]. |
| §9.9 | ramified Q2(i),d=2,n=0,1 | β=1/2 at n=0 combines to 1; n=1 factors (2/3)(3/2)·2=2 | Inherited [r5]. |
| §9.10 | isogeny differential factor 2 | log scales 2, square 4; reciprocal scalar correction 1/4 restores equality | Inherited [r5]. |
| §9.11 | two root values 1,2; tK=2 | full sum square 9, not 5; JSW multiplier gives 18 | Inherited [r5]. |
| §9.12 | p=5,a_p=±1 | Euler squares 16/25,36/25, both valuation −2; Howard factor 1−1=0 is different | Inherited [r5]. |
| §9.13 | M=Q(√5), embedding idempotent | matching evaluation (1+1)/2=1; opposite evaluation (1−1)/2=0; actual algebraic point required | Inherited [r5]. |
| §9.14 | root 1+T, odd p | square 1+2T+T²; μ=0, leading unit remains a unit | Inherited [r5]. |
| §9.15 | inert ℓ=3,11 at p=5 | correct factors 8/9,120/121 have valuations 0,1; wrong factors 5/3,13/11 give 1,0 | Inherited [r5]. |
| §9.16 | Hecke auxiliary ℓ=2,aℓ=1 | denominator ℓ+1−aℓ=2; its square 4 compensates log scale 2 | Inherited [r5]. |
| §9.17 | norm-twisted χ and inverse | χ·χ⁻¹=1; good Euler factor squared retained, e.g. (17/11)²=289/121 | Inherited [r5]. |
| §9.18 | p=5, differential unit 2 | log square multiplies 4, a p-unit; equality up to p-unit unchanged | Inherited [r5]. |
| §9.19 | non-torsion rational point versus torsion | tested non-torsion log 44 mod121 at p=11; torsion log 0 | Inherited [r5]. |
| §9.20 | unramified residue degree 2 | absolute values of linear φ² eigenvalues are p⁻¹, not p⁻²; torsion Kummer and log both 0 | Inherited [r5]. |
| §9.21 | 1+T versus Σ5^(−n)T^n | coefficient valuations 0,0 versus −n; second is not integral bounded measure | Inherited [r5]. |
| §9.22 | E_p=2,E_pbar=3 | ratio (3/2)·(2·3)=9=E_pbar² | Inherited [r5]. |
| §7.46a(5), field extension | same 1/2 intersection; ramified degree 2 and unramified degree 2 | ramified: raw 1 divided by e=2 gives 1/2; unramified: −(1/2)log25/2=−log5/2 | Fresh; both extension controls preserve −0.804719. |
| §7.46a(5), principal/zero controls | (0)−∞ against (1)−(5); zero divisor | intersection −1 gives +log5≈1.609438; zero gives coefficient 0 and symbol 0; diagonal remains excluded | Fresh; repaired Checks agree with §2.5. |
| §7.47(3), base extension and scaling | φ=3, raw vertical length 1,e=2; further ramification 2 | 3·1/2=3·2/4=3/2; doubling V gives 3, not 6; V=0 gives 0 | Fresh; e-normalization and linearity both preserved. |
| §7.47(4), full decomposition | all other terms zero, vertical coefficient 3/2 and N_v=5 | Z=−(3/2)log5≈−2.414157; inserting −log5 in l first would instead give +(3/2)(log5)² | Fresh; one negative logarithm, not two. |
| §9.4, integration naturality | [2], cycle with Ω=1+i | integral of [2]*ω is 2Ω=2+2i; integral over [2]_*γ is also 2+2i | Fresh; separates covariant cycle transport from inverse torus representation. |
| §9.4, nonmaximal order | O=Z+3Zi and its maximal order | i has imaginary coefficient 1, not divisible by 3, so i∉O; 3i∈O; unit counts 2 versus 4 | Fresh; full O_K-action is not imposed on the all-order branch. |
| §9.4, marked rank-one summand | false elliptic surface with quadratic K-action and idempotent e | full Lie dimension 2; e-Lie dimension 1; [K:Q]=2 versus full-CM requirement 4 | Fresh; general integration restricts to the marked line. |
| §9.4, existing period normalization | weight 2, scale marked differential by 2 | algebraic value multiplier 1/4 times period-square multiplier 4 equals 1; linear root scale 2 gives square scale 4 | Fresh; supplier repair does not change interpolation normalization. |
| gap polarized-skeleton-green | genus-one circle length 2 and a point graph | μ=ds/2 has mass 1; g(s)=s²/4−s/2+1/6 has g(0)=1/6,g(1)=−1/12,mean 0; point kernel 0 | Fresh; supplied, so remove active gap. |
| gap ideal-zeta-genus-factorization | D=−4 and D=−15, norm-two ideal | D=−4 has sole pair {1,−4}; D=−15 has {1,−15},{5,−3}; ε₅(2)=ε₋₃(2)=−1 | Fresh; supplied, including trivial genus character. |
| gap normalized-e2-family | constant, q and q² coefficients; z=i | coefficients 1,−24,−72; E2(i)=3/π≈0.954930, hence E2*(i)=0 | Fresh; native E2 plus supplied family and existing adapter remain after gap deletion. |

[r5]: PRREVIEW-GrossZagierAndArithmeticHeights~5.md

## Not verifiable

- This incremental review does not recertify untouched source proofs. The 274 unchanged rows retain the evidence and limitations of [r5]; 27 fresh rows cover the changed targets, directly affected signs and gap-removal witnesses.
- `yzz-book` and `yzz-draft` remain settled **waived**. In particular the precise model construction and nonsingularity assertions used by §§7.46a–7.47, and the book-only nonzero contraction input, were not independently certified from those texts. The accessible Disegni restatement was read only for what it actually states.
- `argos` and `blr` remain settled **uncertified**. Their unchanged locators are carried forward; no text was requested again and no source manifest was edited.
- Ownership against open pull requests whose files were not supplied was not checked. Indexed lookup was used to resolve named suppliers and search objects; that is not a full ownership review of every open roadmap.
- A successful admitted build verifies elaboration only. Numerical rows involving projections, zero inputs and rescaling verify those necessary properties, not the complete global automorphic formulas.

## Source issues

No new source issue was found in the passages checked this round. The unchanged source-errata record remains in [r5].

- none
