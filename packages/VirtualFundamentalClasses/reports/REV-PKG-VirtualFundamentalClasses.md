# Review of VirtualFundamentalClasses (package, round 1)

**Verdict:** needs changes

The package has substantial, carefully distinguished mathematics, but the successful elaboration does not test it: Suggested.lean contains no declarations. The findings below include false statements, one missing ambient finiteness condition, conflicting ownership, and supplier and scope corrections. No author files were changed. There was no previous review.

## R01 (P1) — Finite type does not imply finite generic stabilisers

**Location:** packages/VirtualFundamentalClasses/README.md:133–143, 174–179, 540–545. Claim: the stated DM-stack convention suffices to define a finite generic stabiliser order and prove generic finite étale inertia.

**Witness:** Over an algebraically closed field, Bℤ has an étale point atlas, is quasi-compact and locally of finite type, but its inertia fibre is the infinite discrete scheme ℤ. No dense open has finite inertia.

**Repair:** Require quasi-separatedness in the Vistoli/Behrend–Fantechi ambient convention, specifying the condition on the diagonal. Preserve the distinction from separatedness. This is a source hypothesis, not a restriction to good characteristics: behrend-fantechi1997 lines 165–170 explicitly assumes quasi-separatedness. The supplier's algebraic-stack definition does not include it: TauCetiRoadmap/SchemeAndStackFoundations/README.md:2930–2935. Bℤ is then excluded because its diagonal is not quasi-compact; B(S₃) remains allowed with generic order 6. Carry this correction into the module docstring's ambient description.

## R02 (P2) — Two open roadmaps own the same core construction

**Location:** packages/VirtualFundamentalClasses/README.md:35–65. Claim: this roadmap owns DM-stack Chow groups, cone stacks, the intrinsic cone, obstruction theories and the virtual class.

**Witness:** PR #1996, TauCetiRoadmap/VirtualFundamentalClass/README.md:199–205, claims the same objects; its Layers 2, 4–9 construct the same rational Chow/Gysin theory, cone stacks, obstruction theories and absolute/relative virtual classes.

**Repair:** Establish one owner of the common construction and import it by roadmap and section from the other roadmap. Consolidate the core with VirtualFundamentalClass, then place genuinely additional work in a Part II extension, with the core earlier in the merge order. Do not merely add a reciprocal citation. Explicitly assign the curve-map interface too: PR #1998, TauCetiRoadmap/GromovWittenTheory/README.md:256–269, constructs the stable-map specialisation of §§11.2–11.5. Its verification of the moduli problem can remain there, but the general perfect-pushforward/duality/resolution construction must have one owner. These are read head contents, not inferred from titles. The singular-name roadmap is not on main or in ORDER.txt; the current order therefore does not already settle the conflict. The objects agree even on the test X = ℙ¹, E = [O(1) → Ω] with zero differential: both cores construct the degree −1 virtual class.

## R03 (P1) — Arbitrary base change does not preserve a scheme-source proper cover

**Location:** packages/VirtualFundamentalClasses/README.md:421–422: “the base change of a proper cover along a morphism of DM stacks, are proper covers.”

**Witness:** Base change the proper cover id : Spec k → Spec k along B(C₂) → Spec k. The resulting source is B(C₂), not a scheme; its geometric stabiliser has order 2.

**Repair:** State stability when the base-changed source is a scheme, in particular along a morphism representable by schemes. Separate stability of proper surjectivity from stability of the additional scheme-source condition. Keep the displayed example as a negative control: the base-changed morphism is still the proper surjection id of B(C₂), but is not a proper cover under Convention 3. Also repair the argument at lines 433–437: a torsor over a scheme meeting the special fibre can be separated (over that fibre itself it is a torsor under C₂). Use the component dominating the base and specialising to the doubled origin, rather than the asserted statement about every scheme meeting the fibre.

## R04 (P2) — Several sign-action Checks admit characteristic two

**Location:** packages/VirtualFundamentalClasses/README.md:169–171, 521, 550–551, 581–582, 635–637, 657–660. Claim: [𝔸¹/μ₂] and Bμ₂ are DM examples under the arbitrary-field convention.

**Witness:** In characteristic 2, μ₂ = Spec k[u]/((u−1)²) is not unramified. The stabiliser at the origin of [𝔸¹/μ₂] is μ₂, so this quotient is not DM.

**Repair:** Add an explicit standing convention that all sign-action μ₂ examples assume char k ≠ 2, and retain characteristic-two tests using constant C₂ or the existing constant C_p action. This changes the examples only. The existing statement-local qualification in §1.2 does not qualify the earlier Convention 4 or the other independent Checks under Convention 1's wording. In characteristic 3 the sign example has stabiliser 2 and A₀ = ℤ/2 as intended; in characteristic 2 it must be rejected by the example's hypotheses.

## R05 (P1) — The negative-index rational-function group of BG is not zero

**Location:** packages/VirtualFundamentalClasses/README.md:638–639: “W_i(BG) = 0 for every i”.

**Witness:** Take k = ℚ and i = −1. The integral substack BG has dimension i+1 = 0, so W₋₁(BG) = ℚ×; the element 2 is nonidentity. Its boundary is zero.

**Repair:** Say W_i(BG) = 0 for i ≠ −1, W₋₁(BG) = k×, and ∂ = 0 in every degree. Thus R_i(BG) = 0 and the claimed Chow groups remain correct. Test k = ℚ to avoid the accidental trivial group 𝔽₂×. The source's direct-sum indexing is vistoli1989 lines 901–906, printed p. 633.

## R06 (P1) — Condition (⋆) does not give a two-term representative of E

**Location:** packages/VirtualFundamentalClasses/README.md:1313–1315. Claim: E satisfying (⋆) has an étale-local representative in degrees −1 and 0.

**Witness:** E = O[2] on Spec k satisfies (⋆), as the package itself observes at line 1325. Its H⁻² is k; every two-term complex in degrees −1 and 0 has H⁻² = 0.

**Repair:** Assert the two-term presentation for τ≥−1 E, and explicitly say that h¹/h⁰(E∨) depends only on that truncation. Apply the same qualification to “every local presentation” in §7.4. The source uses a resolution with lower terms and then its cokernel in degree −1, not a two-term representative of E: behrend-fantechi1997 lines 679–688. For O[2], the repaired presentation is the zero complex, while O[2] itself remains nonzero.

## R07 (P1) — h¹/h⁰ is not faithful on arbitrary derived objects

**Location:** packages/VirtualFundamentalClasses/README.md:1336–1340. Claim: morphisms in the derived category are determined by h¹/h⁰, citing Lemma 2.2.

**Witness:** On Spec k take E = F = k[2]. The distinct endomorphisms id and 0 induce the same morphism of the trivial Picard stack h¹/h⁰(E). End_D(E) = k, whereas the induced morphism set is a singleton.

**Repair:** State the faithful two-term correspondence on cohomological degrees [0,1], retaining O-linear/additive structure in morphisms and homotopies. For arbitrary complexes, state only the construction through τ[0,1] and invariance under quasi-isomorphism. Do not assert recovery of the original derived morphism. The counterexample becomes an explicit negative control outside that two-term domain. This overclaim is also printed in the cached source, behrend-fantechi1997 lines 635–639; a locator alone does not validate it.

## R08 (P1) — Truncation does not commute with derived pullback or preserve this triangle

**Location:** packages/VirtualFundamentalClasses/README.md:1477–1491 and 1934–1936. Claim: flatness of either arrow gives an isomorphism for the already-truncated cotangent complex, and an lci u gives the displayed distinguished triangle of truncated complexes.

**Witness:** Let A = k[x,y,z]/(xy,xz,yz), t = x+y+z, B = A/(t). The nonzero conormal class xyz is killed by t and has differential zero. Consequently H⁻²(B ⊗ᴸ_A τ≥−1 L) ≠ 0.

**Repair:** Keep the general functoriality morphism, but put τ≥−1 around the derived pullback in the Tor-independent base-change comparison. For transitivity, supply the full cotangent triangle from an explicitly owned construction, then state precisely its low-degree consequences; do not call the three truncated objects a distinguished triangle. Alternatively establish the additional Tor-amplitude hypotheses for each actual use, without discarding the general theorem from the library plan. Rework §10.7's compatibility datum: a base change of an lci morphism need not itself be lci, and §8.3 as written cannot supply its lower triangle.

The detailed calculation is in the table below. For base change, A is flat over k[t], but the left H⁻² contains k and the truncated target's H⁻² is 0. For transitivity over k, u is the regular immersion t = 0 and L_(B/A) = B[1]; a triangle as printed would force the same nonzero H⁻² to vanish. Truncating the base-change source removes this discrepancy. Olsson's Theorem 8.1 is about the full complex (olsson2007 lines 1130–1145), and the cited Stacks triangle is also untruncated.

## R09 (P2) — The duality contract is enlarged from quasi-coherent complexes to all modules

**Location:** packages/VirtualFundamentalClasses/README.md:2075–2077: “Rπ_* ⊣ π^! … on D(O_M)”.

**Witness:** TauCetiRoadmap/SchemeAndStackFoundations/README.md:4267–4296 supplies the right adjoint on DQCoh and the upper-shriek construction on D⁺_QCoh. It does not supply this formula on the category of all module sheaves defined in §7.3.

**Repair:** State the duality and adjunction on the quasi-coherent derived subcategories, with the boundedness/perfectness needed by the cited supplier, and state the étale descent comparison there. Keep the ordinary Lπ* ⊣ Rπ* adjunction on all module sheaves separate. All inputs used in §11.3 lie in the corrected coherent/quasi-coherent domain. On π : ℙ¹ → Spec k, V = O, both (RΓO)∨ and RΓω[1] are k in degree 0, so the intended duality and the construction survive this repair.

## R10 (P1) — The curve-map Ext comparison has an extra shift

**Location:** packages/VirtualFundamentalClasses/README.md:2120–2122: “Ext^{i−1}_T(g^*E, J)”.

**Witness:** Let C = ℙ¹, X = 𝔸¹, M = Mor(C,X) = 𝔸¹, T = Spec k, J = k. Then g*E = k[0]. At i = 0 the stated comparison reads k = Ext⁰_C(O,O) ≅ Ext⁻¹_k(k,k) = 0.

**Repair:** Replace i−1 by i. For V = F*TX and E = (Rπ*V)∨, projection formula and perfect duality give Extⁱ_C(V∨,π*J) ≅ Extⁱ_T(E,J). In the displayed test the repaired degree-zero comparison is k ≅ k, and degree one is 0 ≅ 0. The cited source itself has the same exponent on both sides, behrend-fantechi1997 line 1609 (its right-hand subscript has a separate typographical problem).

## R11 (P2) — Deformation invariance uses an undefined virtual count in positive dimension

**Location:** packages/VirtualFundamentalClasses/README.md:2009–2016. Claim: the fibre virtual degree is constant, without requiring fibre virtual dimension zero.

**Witness:** Let 𝔐 = Spec k, B = 𝔸¹, M = ℙ¹ × B and E = Ω_(M/B). Each fibre virtual class is [ℙ¹] in A₁, while §6.3's integration map has domain A₀.

**Repair:** Require m + rk E = 0 for the fibre theories (equivalently total virtual dimension 1). Alternatively include a specified insertion of fibre degree m + rk E extending over the family. Under the zero-dimensional hypothesis the pushforward lies in A₁(B), exactly as the proof requires. Test M = B, E = 0: each fibre count is 1 and the total pushforward is [B]. Apply the correction to the properties headline in Suggested.lean:66–67.

## R12 (P1) — The obstruction-bundle Check incorrectly kills rank zero

**Location:** packages/VirtualFundamentalClasses/README.md:1883. Claim: for M = Spec k and E = [O^s → 0], the top Chern expression lies in A₋s = 0.

**Witness:** Set s = 0. Then E = 0, vd = 0, c₀(O⁰) = 1 and [Spec k,E]^vir = [Spec k] ≠ 0 in A₀(Spec k)_ℚ = ℚ.

**Repair:** Split the Check: s > 0 gives zero, while s = 0 gives the fundamental class of degree 1. The corrected values are 1, 0, 0 for s = 0, 1, 2 and agree with §§10.2 and 10.4's no-obstruction theorem.

## R13 (P3) — The nonreduced-curve Check needs an actual nonvanishing example

**Location:** packages/VirtualFundamentalClasses/README.md:2151–2152: “such as a double line”.

**Witness:** For the ordinary plane double line D = 2L ⊂ ℙ², the sequence O_L(−N−1) → O_D(−N) → O_L(−N) gives H⁰(O_D(−N)) = 0 for every N > 0.

**Repair:** Replace the unspecified double line by an explicit nonreduced curve with embedded nilpotents: the square-zero thickening of ℙ¹ with algebra O_ℙ¹ ⊕ k_p, and the pullback of O(1). Its negative twists contain the skyscraper summand k_p, so H⁰ is k for every N > 0. Explain that nonreducedness alone does not force nonvanishing; the prestable reduced-fibre hypothesis supplies the sufficient vanishing used in the construction.

## R14 (P1) — Exact supplier contracts contain unresolved declaration names

**Location:** packages/VirtualFundamentalClasses/README.md:349–352, 363. Claim: suppliers provide FiniteLocallyFreeSheafOfRank, relativeSpecUniversalProperty, linearSpecBaseChangeIso, and Algebra.CotangentComplex.extensionObstruction.

**Witness:** None of these four identifiers occurs in the cited suppliers' README/Suggested.lean or either pinned library. AlgebraicVectorBundles now maps L0B/L1A/L2A to pinned objects at README.md:351–368; DerivedModuleAlgebra §0.25 supplies the mathematical lift statement in prose.

**Repair:** Cite the actual contracts: AlgebraicVectorBundles' isFiniteLocallyFreeOfRank or Tau Ceti FiniteLocallyFreeSheaf.isConstantRank (TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean:52); the native relativeSpecHomIso/relativeSpecHomEquiv; QuasicoherentLinearScheme.pullback and linearSpecPullbackIso (TauCeti/AlgebraicGeometry/VectorBundle/LinearScheme/BaseChange.lean:52, 99); and DerivedModuleAlgebra §0.25's morphism-lifting obstruction, without inventing a declaration name. The latter statement is at TauCetiRoadmap/DerivedModuleAlgebra/README.md:1776–1782. The old section labels themselves are valid through the explicit old-to-new map, and homologyOneIso is valid through DerivedModuleAlgebra's mapping at line 56; do not flag or delete those mappings. Re-run the resolution and dependency checks after replacement. These repairs preserve, for example, rank 1, Spec Sym O = 𝔸¹, its identity base change, and the k-parameter family of lifts of x ↦ 0 to k[ε]/ε².

## R15 (P3) — Two definitions have fewer than three discriminating Checks

**Location:** packages/VirtualFundamentalClasses/README.md:772–788 and 2005–2025. The exterior product and virtual degree/count definitions each have only two Check bullets.

**Witness:** §3.5 has one field-tensor-product bullet and one classifying-stack bullet; §10.8 has one regular-zero-locus bullet and one BG bullet. Each count is 2, below the required 3.

**Repair:** Add a distinct test to each definition, retaining their API. For exterior products, use the empty factor (zero) together with [Spec k] as the unit on a nonzero cycle. For virtual degree use the sign-sensitive ℙ¹ theory [O(1) → Ω], which gives −1, and distinguish it from the wrong dual's +1. Put these in the README only. Theorems §§10.3, 10.5 and 11.5 also have two bullets, but the three-Check rule is for definitions; their counts alone are not findings.

## Verified sound

Reviewed all 53 numbered target subsections, all 9 conventions, every Needs line, the 11 layer dependency paragraphs, the summary/ownership and downstream statements, the 86-line Lean file, metadata and all 22 source entries. The adversarial instances below record the sampled targets, all headline families and every mathematical finding. Additional per-layer calculations were retained in the scratch worklist/ledger. “Pass” means the stated computation agrees, not a claim that finitely many examples prove a theorem.

The package has no computational algorithms, copied source passages identified in the comparisons, sorry'd data, set_option, or route-specific prime restriction. Its header, layer endings, import, namespace and module docstring have the requested form. Mathematical backticks are notation; the README does not advertise any of its own Lean declarations. The bare metadata topic is consistent with the subject. No declared supplier gaps were found.

### Computed adversarial table

All μ₂ sign examples in this table use characteristic different from 2 unless the row explicitly tests failure. k can be ℚ for the characteristic-zero calculations. Chow groups are rational wherever virtual/Gysin classes on stacks are used.

| Statement | Instances and computed values on the two sides | Result / change |
| --- | --- | --- |
| Convention 1; §1.4 finite generic inertia | Bℤ: one point and a point étale atlas, but generic inertia has infinitely many components, not a finite degree. B(S₃): order 6. | R01; add quasi-separatedness, retain nonabelian finite example. |
| §1.1 proper covers | id_pt base-changed to B(C₂): source B(C₂) has Aut = C₂ versus Aut = 1 for a scheme point. | R03. |
| Convention 4; §§1.3–2.3 μ₂ examples | char 3: e(Bμ₂)=2 and ord₀(x²)=2. char 2: tangent dimension of μ₂ at 1 is 1, not 0, so Bμ₂ is not DM. | R04. |
| §1.5 degree | G=C₂,S₃,Q₈: deg(BG/pt)=1/2,1/6,1/8; deg(pt/BG)=2,6,8; products all 1. 𝔸¹/pt has degree 0. In the wild C_p example: (1/p)[k(y):k(yᵖ)]=(1/p)p=1. | Pass; no replacement of inseparable degree by 1. |
| §2.1 cycle multiplicity | k[x]/x² has length 2; its cycle is 2[pt], whereas its reduction gives 1[pt]. Empty stack: every cycle group is 0. | Pass. |
| §2.2 divisor and negative index | div(x²)=2[Bμ₂]; coarse div(y)=[0]. W₋₁(BG)=ℚ× contains 2, but Z₋₁=0 and ∂(2)=0. | Divisor passes; R05 corrects W, not Chow. |
| §2.3 Chow groups | A₀(BG)=ℤ, A₋₁(BG)=0; sign quotient has generator z and relation 2z=0, hence A₀=ℤ/2 and A₀⊗ℚ=0. | Pass with R04. |
| §2.4 scheme comparison | Doubled-origin line: div(t)=[0₁]+[0₂]; nonzero closed points are killed by their defining polynomials. A₀=ℤ with [0₂]=−[0₁], consistent with either origin generating. | Pass; no erroneous equality of the two generators assumed. |
| §3.1 flat pullback | pt→BG sends [BG] to [pt], coefficient 1, not cardinality. Coarse sign quotient sends [0] to length-2 fibre 2[Bμ₂]. | Pass. |
| §3.2 representable pushforward | pt→B(S₃): [pt]↦6[BG]; closed immersion: coefficient 1; ℙ¹→pt: the 1-cycle maps to 0 while a degree-d closed point maps to d[pt]. | Pass. |
| §3.3 rational pushforward | B(S₃)→pt: coefficient 1/6; composing gives 6/6=1. Sign quotient sends 2[Bμ₂] to 2(1/2)[0]=[0]. | Pass, with proper-cover hypothesis retained. |
| §3.4 push–pull/localisation | pt×_BG pt=S₃: both composites give 6[pt]. ℤ→ℤ/2→0 is exact; kernel of ℤ²→ℤ for two points on ℙ¹ is generated by (1,−1). | Pass. |
| §3.5 exterior product | Separable quadratic K: K⊗K=K×K, degree 2+2=4. Purely inseparable degree p: K⊗K has length p over K, degree p·p=p². B(C₂)×B(S₃) has degree 1/12=(1/2)(1/6). | Pass; R15 adds third bullet. |
| §4.1 cones and dual convention | C(0)=base; C(k)=𝔸¹. C(O(1))=Tot O(−1): zero-section self-intersection degree −1 versus wrong dual +1. Node cone has equation xy=0; abelian hull has no equation and dimension 2. | Pass. |
| §4.2 local embeddings | Δ_BG has |G| geometric points in its fibre, codimension 0 and zero normal bundle; it is not a closed immersion if |G|>1. Ideal (x,y)² has 3 minimal generators, normal-sheaf fibre dimension 3, normal-cone dimension 2. | Pass. |
| §4.3 scheme-target Gysin | Pull {0}⊂𝔸¹ through z↦z²: length 2, so 2[pt]. Pull pt→B(S₃) against itself: [S₃], degree 6, not 1. | Pass, integral coefficients. |
| §4.4 rational equivalence | X=Y or Y'=Y: empty blow-up construction gives β=0 and boundary [N]−[N]=0. For origin⊂𝔸² and Y'={y=0}, β=cν/η; ξ-translation fixes it, η↦η+1 gives cν/(η+1)≠cν/η. | Correctly excludes the source's full-tangent invariance; no finding. |
| §§4.5–5.2 orientations, homotopy, Chern signs | Zero section of O(−1)/ℙ¹: s!π*=id; s!s*[ℙ¹]=−[pt]. Rank 0: c₀=1 and s!=id. L⊕L∨ has c₁=0, c₂=−c₁(L)². | Pass. |
| §5.3 intersection | On [ℙ¹/μ₂], point P: P²∈A₋₁=0, P·[𝓜]=P and integral 1/2. On BG the rational ring is ℚ with unit [BG]. | Pass on the proper-cover domain of Convention 3. |
| §6.1 coarse comparison | BG: ℚ→ℚ is multiplication by 1/|G|, inverse multiplication by |G|. Sign line in degree 0: 0→0 rationally versus ℤ/2→0 integrally. Wild closed substack: degree p/p=1, not 1/p. | Pass. |
| §6.2 equivariant comparison | μ_n: ℤ[t]/(nt) rationalises to ℚ in degree 0; 𝔾_m on 𝔸²\{0}: A₂^G=ℤ=A₁(ℙ¹), while A₂(ℙ¹)=0. | Pass, dimension shift i−g essential. |
| §6.3 degrees | [Spec ℂ/C₄] over ℝ: residue field ℝ and inertia C₂ give 1/2; cover calculation 2/4=1/2. On sign ℙ¹, div(x²/(x²−1))=2P−O and 2·(1/2)−1=0. | Pass. |
| §§7.1–7.2 cone stacks | α_p has coordinate algebra k[t]/tᵖ, not Sym(k), and is not smooth. Translation [𝔸¹/𝔾_a]=pt; trivial-action quotient=𝔸¹×B𝔾_a, with nontrivial inertia despite dimension 0. | Pass; group-scheme alone does not define an abelian cone. |
| §7.3 small étale site and complexes | BG-coherent modules are representations. O[1]: rank −1. O[2]: H⁻²=k, H⁰=H⁻¹=0. A two-term model has H⁻²=0. k over dual numbers has infinite projective dimension. | Site/duality convention passes; R06. |
| §7.4 h¹/h⁰ | [k --id→ k] gives a point; zero differential gives 𝔸¹×B𝔾_a. For k[2], id≠0 but both induced maps of the truncated Picard stack agree. | Construction examples pass; R07. |
| §7.5 morphism criteria | 0→k[0]: H⁰ map not surjective, induced B𝔾_a→pt not representable. k[1]→0: H⁰ map 0→0 surjective, induced pt→𝔸¹ a closed immersion. | Pass, including direction of dual arrows. |
| §8.1 local embeddings | BG chart product (G,pt) still has K=0, although G→pt is not an immersion. Dual numbers: differential x²↦2x dx, zero in char 2, nonzero rank-1 image over k in char ≠2. | Pass. |
| §8.2 truncated cotangent calculation | I=(x,y)²: I/I² length 7, Ω length 6, image length 3 in char ≠2, hence (length H⁻¹,length H⁰)=(4,3). For dual numbers these lengths are (1,1), or (2,2) in char 2. | Pass for the local model; does not imply §8.3. |
| §8.3 derived base change/transitivity | I=(xy,xz,yz), A=k[x,y,z]/I. c=xyz mod I²≠0 (degree 3, I² starts in degree 4); dc=0. xc,yc,zc are respectively (xy)(xz),(xy)(yz),(xz)(yz), hence 0 mod I². t=x+y+z is a nonzerodivisor on A. Thus Tor₁^A(B,H⁻¹K) contains kc, and H⁻²(B⊗ᴸK) contains k; the target truncation has H⁻²=0. | R08. For base change use base k[t], over which A is torsion-free hence flat. For transitivity use base k and regular immersion t=0; B[1] has H⁻³=0, forcing the impossible equality H⁻²=0. |
| §8.4 intrinsic normal sheaf | pt→Spec k[ε]/ε²: I/I²=k, Ω_relative=0, N=𝔸¹ but C=Spec k[t]/t². Fat point (x,y)²: conormal length 7≠3·3=9, so not locally free. | Pass; perfect truncated L need not mean relative lci. |
| §8.5 intrinsic cone headline | Smooth n-fold over k: dim BT=n−n=0. pt→B𝔾_m: dim B𝔾_a=−1 equals base dimension. I=x(x,y): Sym(I/I²)=gr_I, but depth at origin 0<dimension 1, so C=N need not imply lci. | Pass; the roadmap correctly repairs BF Proposition 3.12's third condition. |
| §§9.1–9.3 obstruction headline | x²=0, lift x=ε from k[ε]/ε² to k[ε]/ε³: (ε+aε²)²=ε²≠0 in every characteristic. In char 2, φ=(0,id) kills the obstruction although no lift exists. | Pass; h⁻¹ surjectivity cannot be omitted. |
| §9.4 basic example | Section x² of O/𝔸¹: E=[A --2x→ A], rank 0, regular-zero-locus multiplicity 2. Zero section: E=[O --0→ Ω], rank 0, obstruction line O. | Pass. |
| §§10.1–10.3 construction and independence | Add [G --id→ G] of rank g: both bundle ranks increase by g, vd unchanged; enlarged cone is C×G∨ and zero-section Gysin returns the same class. On ℙ¹, E=[O(1) --0→ Ω], vd=1−1=0 and class degree −1 in either resolution. | Pass; global comparison via fibre product avoids assuming a global chain map. |
| §10.4 obstruction-bundle headline | ℙ¹ with O(a) in degree −1 gives Ob=O(−a), degree −a. At pt, s=0,1,2 gives degrees/classes 1,0,0 respectively. | Formula passes; R12 fixes the Check at s=0. |
| §10.5 products | Two ℙ¹ theories of degree −1 give product degree (−1)(−1)=1, vd=0+0=0. Tensor with pt,E=0 leaves the class unchanged. | Pass. |
| §10.6 pullback headline | Origin→𝔸¹, M=𝔸¹×Y smooth: Gysin [𝔸¹×Y]=[Y], agrees with fibre virtual class. Flat identity over dual numbers preserves length 2. | Pass on these cases; reducedness retained for the rational-equivalence route. |
| §10.7 functoriality headline | v:𝔸²→𝔸¹, (s,t)↦st, canonical smooth-stack theories: graph z=st has codimension 1, Γ![𝔸³]=[𝔸²] of dimension 2, agreeing with F's class. | Formula passes; compatibility foundation needs R08. |
| §10.8 virtual counts | M=B,E=0: fibre count 1, total cycle [B]. M=ℙ¹×B,E=Ω_relative: fibre class in degree 1, outside ∫:A₀→ℚ. Sign-sensitive virtual count on ℙ¹ is −1. | R11, R15. |
| §11.1 moduli hypothesis | M=pt carrying id:ℙ¹→ℙ¹: H⁰(E) dimension 3 versus H⁰(L_pt) dimension 0. The infinitesimal moduli condition excludes this datum. | Pass; headline is not quantified over unrelated universal maps. |
| §11.2 duality | π:ℙ¹→pt, V=O: RΓO=k, RΓω=k[−1], so (RΓO)∨=RΓω[1]=k. Nodal rational component with two branches: degree ω=−2+2=0. | Values pass; R09 corrects the categorical domain. |
| §11.3 Kodaira–Spencer | Constant maps ℙ¹→𝔸¹ form M=𝔸¹; E=O[0], φ on H⁰ is dt↦dt, coefficient 1. For X=pt, E=0 and φ=0. | Pass; direction and shift [1] in duality agree with the source. |
| §11.4 obstruction-theory headline | Same constant-map family, T=pt,J=k: Ext⁰_C(O,O)=k and Ext⁰_T(E,k)=k; Ext⁻¹_T(E,k)=0. Elliptic translations: tangent and obstruction dimensions both 1, virtual dimension 0. | R10 corrects proof comparison; intended headline survives. |
| §11.5 global resolutions | For V=O on a genus-g curve, the two terms have rank difference 1−g. Plane double line: H⁰(O_D(−N))=0 for N>0; embedded square-zero skyscraper example gives k. | Construction passes; R13 specifies a valid negative control. |
| §11.6 virtual dimension | ℙ², g=0,d=1,n=0: 3+2−3=2. Calabi–Yau threefold: δ=0, dim X−3=0, vd=n. X=pt gives vd=b. | Pass. |

### Seeded source verification

All 15 sampled targets were checked in the supplied legal cached texts. Page numbers below for Behrend–Fantechi are those of the explicitly recorded arXiv v1, not invented published pagination. Vistoli page numbers are printed journal pages. The line locators are the cache's own numbers. The two uncertified works were not requested again.

| Target | Opened locator and page | Support and limitations |
| --- | --- | --- |
| 1.5 | vistoli1989 lines 356–432, (1.15)–(1.17), pp.620–622 | Separated dominant maps, rational stabiliser ratio and multiplicativity agree. Generic finite inertia needs R01. |
| 2.3 | vistoli1989 lines 901–966, (3.2)–(3.4), pp.633–634 | Quotient by principal boundaries and rationalisation agree; the negative indexing also witnesses R05. |
| 3.2 | vistoli1989 lines 974–1011, (3.6)(ii), (3.7), pp.635–636 | Integral proper representable pushforward and descent via norms agree. Modern representability is reconciled using proper algebraic spaces after atlas base change; ordinary proper cycle theory for spaces is available through §2.4. |
| 3.3 | vistoli1989 lines 985–1048, (3.6)(iii), (3.7), (3.8), pp.635–637 | Rational pushforward, proper-cover route and surjectivity agree. OCR loses some repeated roman numerals, but displayed domains and the proofs distinguish the three cases. |
| 3.5 | vistoli1989 lines 1705–1718, p.655; fulton1998 §1.10 | Vistoli explicitly introduces the exterior product; the separate Fulton text is uncertified. Product multiplicities independently computed above. |
| 4.1 | behrend-fantechi1997 lines 181–243, pp.5–7; vistoli1989 lines 470–484, p.623 | Degree-one generation, coherent degree-one part, vertex/action, contravariance and dual convention agree. |
| 4.2 | vistoli1989 lines 485–535, (1.19)–(1.20), pp.623–624; BF lines 985–999, pp.29–30 | Local embeddings, normal cone descent and base-change embedding agree. The pure-dimensional normal-cone input cites fulton1998 Appendix B.6.6, uncertified. |
| 4.3 | vistoli1989 lines 1081–1122, (3.10)–(3.13), pp.638–639 | Scheme test targets, integral Gysin map and commutation agree. |
| 5.3 | vistoli1989 lines 1705–1740, (5.6), pp.655–656 | Graph Gysin construction and evaluation on the smooth fundamental class agree. The expanded formal-properties list also cites uncertified fulton1998 Proposition 8.1.1. |
| 7.3 | BF lines 171–177, p.5; 642–688, pp.19–20 | Sites, dual and (⋆) agree; source resolution argument does not assert the false two-term representative in R06. |
| 8.1 | BF lines 906–962, pp.27–28; 1645–1656, p.49 | Local-embedding maps and relative extension agree. The extra affine-diagonal hypothesis ensures affine fibre-product charts. |
| 8.4 | BF lines 902–903, 943–962, pp.27–28; 1652–1656, p.49 | Intrinsic normal sheaf and local quotient description agree; the package's nonreduced-base distinction is supported by its computed example. |
| 10.3 | BF lines 1282–1320, Definition 5.2/Proposition 5.3, pp.38–39 | Resolution independence is the stated result. The package gives its own local comparison route instead of the source's common-target chain-map reduction. |
| 10.5 | BF lines 1366–1374, Proposition 5.7, p.41; 1713–1720, Proposition 7.4, p.51 | External-sum obstruction theory, global resolution and virtual-dimension sum agree. |
| 11.3 | BF lines 1583–1599, p.47; behrend1997 lines 148–161, p.5 | Direction of the differential, duality adjunction and the relative curve-map theory agree. The error R10 is in the next target, not in the source's Kodaira–Spencer morphism. |

There are no other locators explicitly marked unverified in the README. The manifest's gillet1984 §4 and fulton1998 §1.10/Corollary 6.3/Proposition 8.1.1/Appendix B.6.6 remain uncertified. All cited works, including boundary and consumer references, have a manifest entry; no additional fetch or manifest modification was needed. The source numbering used is tied to the recorded versions.

### Headline coverage and Lean acceptance

The summary's end results are the coarse-space comparison, equivariant comparison, degree of zero-cycles, relative intrinsic-cone dimension and lci characterisation, obstruction-theory equivalences, virtual class and resolution independence, its no-obstruction/product/pullback/functoriality/count properties, and the curve-map obstruction theory/global resolution/virtual dimension. Suggested.lean's numbered list 1–8 names all these families and identifies missing carriers. Its statements about the properties need the prose corrections R01 and R11, but there is no statable headline omitted in favour of a stand-in.

At these pins, generic sites, module sheaves and derived categories exist, as do schemes, algebraic spaces and scheme Chow groups. They do not give the algebraic/DM-stack carriers and operations appearing in these headlines. Making them statable would require precisely the heavy stack/Chow/cone constructions forbidden as acceptance-test scaffolding. The empty signature file is therefore appropriate in principle.

Ran the prescribed `lake env lean` on packages/VirtualFundamentalClasses/Suggested.lean from the pinned content checkout: exit 0, no diagnostics and no warnings. No TauCeti import required a targeted build. There are **0 declarations and 0 sorried theorems**: the exhaustive one-tactic padding probe and `#check @name` signature audit both have empty domains, not skipped samples. No padding, free-Prop stand-in, hidden section binder or duplicate fully qualified name was found.

### Pinned declarations opened

Paths below are relative to the corresponding pinned library repository. These are source inspections, not assertions based on a newer documentation website.

- Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44, 55, 69: locally finite cycle carrier and weighted map. The dimension weights must be supplied; it is not an unqualified map of dimension-graded cycles.
- Mathlib/AlgebraicGeometry/OrderOfVanishing.lean:35, 52: coheight-one order; zero and non-coheight-one junk values are 0. The README uses units at codimension one.
- Mathlib/RingTheory/Extension/Cotangent/Basic.lean:61, 319, 324, 546: presentation differential, map to Kähler differentials, exactness and H1Cotangent. This is not the full derived cotangent complex.
- Mathlib/RingTheory/Smooth/Basic.lean:70, 290, 370: FormallySmooth has projective differentials and vanishing H1Cotangent, with splitting/lifting characterisations. Mathlib/RingTheory/Derivation/ToSquareZero.lean:116 gives derivationToSquareZeroEquivLift after a specified lift/algebra structure; it does not assert unconditional existence of lifts.
- Mathlib/Algebra/Category/ModuleCat/Sheaf/Abelian.lean:40 and Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74–91: module-sheaf abelian category and derived-category localisation. Neither constructs a stack's ringed site.
- Mathlib/CategoryTheory/Limits/Shapes/Pullback/Categorical/Basic.lean:81: CategoricalPullback. Mathlib/AlgebraicGeometry/Sites/Etale.lean:50 supplies the scheme small-étale topology; a DM-stack site remains a separate target.
- TauCeti/AlgebraicGeometry/Chow/Basic.lean:71, 87, 113, 257, 295, 304, 369: dimension support, RatEquivFamily, RatEquiv, ChowGroup, cycleClass, equivIntOfUnique. The carrier is a scheme; rational equivalence uses locally finite families of integral closed subschemes. No separation or quasi-compactness is built into the cycle definition; finite type in §2.4 makes the locally finite supports finite.
- TauCeti/AlgebraicGeometry/Chow/ClosedImmersion.lean:211: Chow.pushforward for a closed immersion. TauCeti/AlgebraicGeometry/AlgebraicCycle/Principal.lean:71: div of a nonzero rational function. These are reused, not new scheme targets.
- TauCeti/AlgebraicGeometry/RelativeSpec/Graded.lean:93, RelativeSpec/BaseChange.lean:272, RelativeSpec/UniversalProperty.lean:349: gradedRelativeSpec, relativeSpecBaseChangeIso and CommMon.relativeSpecHomEquiv. The last has no restriction on the test morphism q.
- TauCeti/AlgebraicGeometry/VectorBundle/LinearScheme.lean:175, VectorBundle/Geometric.lean:221, VectorBundle/TotalSpace.lean:130, 229: linearSpec is contravariant; totalSpace dualises; totalSpaceHomEquiv identifies sections; totalSpaceSchemeBaseChangeIso is the native base-change comparison.
- TauCeti/AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean:80 and VectorBundle/Rank.lean:125: native finite local freeness and locally constant rank. TauCeti/AlgebraicGeometry/Sites/Big/StructureSheaf.lean:84: scheme big fpqc structure sheaf.
- TauCeti/AlgebraicGeometry/Curves/Prestable.lean:45–60: proper, geometrically connected, nodal relative curves; no projectivity, fixed genus or chosen ample bundle in the predicate. Thus the additional ampleness in §11.5 is not redundant.
- TauCeti/AlgebraicGeometry/AlgebraicSpace/Basic.lean:195–201: fppf sheaf, representable diagonal and étale atlas; no separatedness field. TauCeti/AlgebraicGeometry/Stack/Basic.lean:37: SchPseudofunctor is Cat-valued, not a bundled algebraic stack. Searches by intrinsic cone, perfect obstruction theory and algebraic/DM-stack carrier found no native carrier for the headlines.

### Suppliers, order and ownership

Read the main README forms of SchemeAndStackFoundations, DerivedModuleAlgebra and AlgebraicVectorBundles before drafting this report. Resolved the package's cross-roadmap sections against main, including their explicit legacy-number/name mappings:

| Supplier | Locations opened and conclusion |
| --- | --- |
| SchemeAndStackFoundations | README.md:923 (§0.7), 2145 (§1.1), 2422 (§1.10), 2849–3173 (§§1.18–1.23), 3554/3719/3772 (§§2.6/2.9/2.10), 4265/4452 (§§2.19–2.20), 4917 (§3.3), 5305 (§4.1), 6902–7317 (§§5.1–5.6). The stackification, DM, Chow/Gysin and graph-pullback names in the resolver's leads are roadmap targets here, not missing pinned declarations. R01 and R09 concern omitted qualifications, not absent sections. |
| DerivedModuleAlgebra | README.md:43–63 maps historical names, including homologyOneIso; 1398 (§0.7), 1588 (§0.13), 1761 (§0.25) supply the affine cotangent and obstruction mathematics. R14 concerns the unmapped extensionObstruction name. |
| AlgebraicVectorBundles | README.md:27–158 and 344–374 explicitly map L0B/L1A/L2A/L2B into the native bundle/relative-Spec API. No lost-section finding is warranted. R14 concerns three stale declarations that the package still calls supplied. |
| EnhancedDerivedSheaves | README.md:441 (§0.2), 534 (E1.2), 580–636 (E1.4): replacements, tensor/internal Hom, derived pullback/pushforward and their adjunction. This does not supply π! duality on all module sheaves. |
| StableReduction | README.md:405–466 (Layer 2), 467 onward (Layer 3): coherent curve theory, relative duality, ampleness, prestable families and genus. |
| EquivariantIntersectionTheory | README.md:48–74 (conventions), 378–436 (§§2.1–2.2), 437 (§2.3): smooth affine groups, linearised quasi-projective schemes, approximation groups and operations. The package's rational comparison differs from the integral equivariant carrier. |

The closest-open-work and object searches were run with `roadmaps grep`/`roadmaps show`, not declaration-name matching alone. The board-packages index was read first. No competing implementation of the stack headlines was found at the pins or on main. The substantial open overlap is R02. PR #1996 is a new roadmap, so this is an ownership defect, not a claim that this package revises an already merged roadmap. The algebraic stable-map work at #1998 also shows that the assertion that all GromovWittenTheory work is symplectic needs qualification in the ownership repair.

The supplied overlaps report contains no conflicting head changing VirtualFundamentalClasses, no dropped cited ids and no ids existing only in an open revision. The scopes of SchemeAndStackFoundations at #1808, #1807, #1854 and #1656 were also opened: their scheme intersection theory and foundational stack carriers do not claim this DM virtual-class extension. These revision leads do not replace the main supplier: its cited sections were resolved on main, as required. No reciprocal supplier edge was introduced. The within-layer 4.4 construction versus consequence is explicitly split, so the displayed return to the consequence is not itself a circular proof of the construction.

Prescribed dependency-check output:

```text
depcheck: 233 roadmaps, 2091 edges, 0 problem(s)
```

There were no UPWARD, CYCLE or moved lines. The check validates the declared graph; it cannot detect duplicate ownership or the mathematical truncation problem. No forbidden supplier was cited as an input by this package. No merge-order file was modified.

## Not verifiable

- gillet1984 §4: manifest status uncertified; no readable cached text was supplied. The cycle/rational-equivalence definitions were cross-checked against Vistoli's explicit restatement. The book/article was not requested again.
- fulton1998 §1.10, Corollary 6.3, Proposition 8.1.1, Appendix B.6.6: manifest status uncertified. Vistoli and Behrend–Fantechi supply the readable stack statements and the test calculations above, but the precise wording of these Fulton locators was not directly inspected.
- Full formal proof validation of the README targets is unavailable: no stack carriers at the pins and no theorem declarations in Suggested.lean. This limitation is not a missing Lean-headline finding; the counterexamples and supplier-domain discrepancies are independently decisive.

## Source issues

- **Error** in behrend-fantechi1997 at Lemma 2.2, arXiv v1 p.19 (line 635): the source says h¹/h⁰ detects arbitrary derived morphisms; it should be restricted to the appropriate two-term, module-compatible correspondence; affects a stated result.
- **Error** in behrend-fantechi1997 at Proposition 3.5, arXiv v1 pp.26–27 (line 889): the source says the rational equivalence is invariant under the whole ambient tangent bundle; it should use the relevant smooth-substack or relative tangent directions; affects a stated result.
- **Error** in behrend-fantechi1997 at Proposition 3.12, arXiv v1 p.30 (line 1010): the source says equality of intrinsic cone and normal sheaf implies local complete intersection; it should require the cone to be a vector bundle stack; affects a stated result.
- **Misprint** in kresch1999b at Theorem 3.1, arXiv v2 pp.10–11 (lines 331–343): the source names the tangent bundle of the arbitrary substack as acting; it should name the smooth substack's tangent bundle, as the proof does on p.12; affects a stated result.
- **Misprint** in behrend-fantechi1997 at proof of Proposition 6.2, arXiv v1 p.48 (line 1609): the source places the base Ext group over O_C; it should place that group over O_T, with the same Ext degree; affects the proof.
