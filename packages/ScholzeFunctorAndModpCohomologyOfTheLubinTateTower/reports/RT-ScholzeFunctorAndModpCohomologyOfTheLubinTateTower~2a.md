<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1702#issuecomment-6452694965 -->
Red team round 2 pass a (codex) of 6b357b6

Verdict: needs_changes

1. **F01** (P2) Specify geometric base change in the finite-level component count

   **Location:** packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:237: “the height-zero components at Lubin–Tate level K_m form (O_F/ϖᵐ)ˣ”.

   **Claim:** The component count is stated without extending the supplied finite-level tower's base F̆. It is the geometric count; the distinction matters even in rank one.

   **Witness:** For r=1, F=ℚ₃, m=1, the height-zero level over F̆ is the point of the totally ramified quadratic Lubin–Tate extension: one connected component. After base change to C it has two. STR08 line 337 and line 391.

   **Exact repair text:** “Fix a complete algebraically closed extension C/F̆. All component sets in this subsection are those of the towers after base change to C. For r≥1 and m≥1, the geometric height-zero components at level K_m are (O_F/ϖᵐ)ˣ; the height-zero space over F̆ itself is connected. The all-height geometric component set is a torsor under Fˣ/(1+ϖᵐO_F).” Add the rank-one ℚ₃, m=1 example as a negative-control Check.

   **Repair test:** Over F̆ the cardinality is 1; over C it is |𝔽₃ˣ|=2, agreeing with the repaired scope. At m=0 both height-zero counts are 1.

2. **F02** (P1) The final Borel quotient does not retain integer height

   **Location:** packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:551: “The intermediate and final quotient maps respect height”.

   **Claim:** Both quotient maps preserve the tower's height, although the final quotient is by all of B(ℚ_p).

   **Witness:** Take h(x)=0 and b=diag(p,1)∈B(ℚ_p). Then h(xb)=1 but q(xb)=q(x). Thus no integer-valued height descends through q. LUD17 line 926 identifies B′ as the height-preserving kernel.

   **Exact repair text:** “The intermediate quotient M_∞⁽⁰⁾→M_B stays in height zero. The final B(ℚ_p)-quotient identifies all integer heights; the inclusion of height zero induces M_∞⁽⁰⁾/B′≃M_∞/B. No integer-valued height descends through q. The local chart comparisons commute with their finite-level transition maps and the period factorisation.” Add h(x)=0, h(x·diag(p,1))=1, q(x)=q(x·diag(p,1)) as a Check.

   **Repair test:** The two different heights now have the same final quotient point, as required; diag(p,p⁻¹) remains in B′ and changes height by 0. This also agrees with README:542.

3. **F03** (P3) The quotient-map Check reverses composition

   **Location:** packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:562: “Postcomposing a descended map with q detects its equality.”

   **Claim:** Equality of maps out of the quotient is tested by postcomposition with its quotient map.

   **Witness:** q:M_∞→M_∞/B and π̄:M_∞/B→ℙ¹_C have composite π̄∘q. The claimed postcomposition q∘π̄ is not typed: π̄ ends at ℙ¹_C, while q starts at M_∞.

   **Exact repair text:** “Precomposing maps out of M_∞/B with q detects their equality.”

   **Repair test:** For f,g:M_∞/B→Z, the test is f∘q=g∘q, with both sides M_∞→Z. For f=π̄ it recovers π̄∘q=π_GH.

## Earlier findings: finding-by-finding verification

The identifiers below retain the original report's F numbering, prefixed by its pass. All fourteen are repaired. None was marked “not actionable in this package” by the repair report. The three new findings above concern different passages; they do not reopen a settled finding.

| Earlier finding | Status and repaired passage | Witness at this head |
|---|---|---|
| r1a F01: arithmetic level-zero components | Repaired. README:755: “Over K=ℚ_p Frobenius interchanges them”. | README:764,867: Frobenius interchanges the two heights when the residue degree is odd. For K=ℚ_p, H⁰ has dimension 1; for its unramified quadratic extension, dimension 2; for a ramified quadratic extension, dimension 1. CDN23 line 179. |
| r1a F02: necessity of admissibility for extending Weil actions | Repaired. README:394: “Admissibility is sufficient, not necessary”. | README:407–409: Laurent multiplication gives an infinite Frobenius orbit, a quotient by Tᵐ−1 has dimension m and finite Frobenius order, and the infinite trivial direct sum is not admissible but extends. SCH18 line 871; DPS23 line 1337. |
| r1a F03: comparison at the coefficient prime | Repaired. README:186 names “R18.3.29(c)” and retains global residual absolute irreducibility and the discrete-series condition. | TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:3838–3846 supplies the coefficient-prime statement. README:615,626 uses the supercuspidal point: its WD representation is irreducible of dimension 2, including when the residual local representation is reducible. |
| r1a F04: finite length versus Hom finiteness for general F | Repaired. README:684: “For F=ℚ_p”; README:686 restricts the cosocle criterion to that case. | README:694 retains Le's excluded example. For F=ℚ_{p³}, the irreducible has length 1 and infinite-dimensional endomorphisms over k. LE19 line 169, line 269, line 370. The finite-image-family closure does not use the false unrestricted criterion. |
| r1a F05: fixed-level twisting | Repaired. README:739 requires “δ∘Nrd is trivial on Ǧ_n”. | Take p=5, K=ℚ₅(ζ₅), δ the residual cyclotomic character: δ∘N_{K/F}=1, but δ(Nrd(2))=δ(4)=4 at n=0. The new condition excludes it there; it holds on the pro-p group at n≥1. |
| r1b F01: missing local almost-finite-image input | Repaired. README:128 declares “gap:local-almost-finite-image”; README:352 consumes it. | The identical slug and supplier occur in design/plan.json. SCH13 line 1425–1435 gives the good-coordinate, strict-rational-subset estimate. U=∅ gives image 0; the closed radius-\|p\| disc gives the strict case; U=V at its Gauss point is excluded. |
| r1b F02: duplicated analytic cohomological dimension | Repaired. README:138 imports “Section 6.36”; the redundant gap is absent from design/plan.json. | TauCetiRoadmap/HodgeTateAndCanonicalSubgroups/README.md:2606 states the qcqs analytic bound for all abelian sheaves. Thus H²_an(ℙ¹,−)=0, while dimension 0 gives all positive degrees 0. Needs at README:390,582 use this owner. |
| r1b F03: locally admissible coefficients for the Galois action | Repaired. README:394 extends the assertion to “locally admissible” modules; README:407–409 give positive and negative controls. | Every vector in the infinite direct sum of trivial finite modules has Frobenius orbit size 1, though the invariant module is infinite-dimensional. In k[T,T⁻¹], the orbit of 1 contains all Tʲ and is infinite. SCH18 line 871; DPS23 line 1337. |
| r1b F04: duplicate global admissibility/injectivity | Repaired. README:613 imports the large module from “§1.7(c)–(d)” and proves the λ-typical passage and block occurrence. | TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:652–682 supplies the fixed-character injectivity, with its small-level hypotheses. For λ=O, Hom_O(λ,−) is the original module; no new large-module theorem is asserted here. |
| r1b F05: covering theorem's kernel generality | Repaired. README:100: “for finite and profinite kernels with trivial action”; README:457 uses finite discrete kernels. | TauCetiRoadmap/KTheoryLowDegrees/README.md:1068–1078 supplies the local rank-two classification at this generality. Over ℚ₃, Hom(μ₂,𝔽₃)=0; no arbitrary locally compact kernel is invoked. MOO68 line 2054. |
| r1b F06: low-degree continuous-cocycle dictionary | Repaired. README:67 names explicitH1AddEquivContinuousCohomology and explicitH2AddEquivContinuousCohomology; README:472 consumes them. | Pinned TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologyComparison.lean:134,232; the degree-two local-compactness binder is at line 203. SL₂(ℚ_p) satisfies it. A split extension gives zero on both sides. |
| r1b F07: wrong compact Hochschild–Serre locator | Repaired. README:216: “Lemmas 2.13 and 3.12” with “SCH18 line 717”. | SCH18 line 717 is Lemma 3.12, the stated compact-action spectral sequence. K=1 leaves only column 0 and recovers Hʲ(X,𝒢). |
| r1b F08: twists restricted to smooth characters | Repaired. README:396 permits “continuous adic characters”; README:410 tests the nonsmooth unit character on ℤ₅. | δ(5)=1 and δ(u)=u has no open kernel on ℤ₅ˣ; modulo 5 it acts by 2 on the D factor and 3 on the inverse Artin factor. Reduction modulo 5ᵐ is smooth for every m. DPS23 line 1401. |
| r1b F09: incorrect missing carrier for Fust's exceptional representations | Repaired. Suggested.lean:23–26 names the missing smooth irreducible GL₂(ℚ_p) classification, Steinberg and principal-series objects. | FUST22 line 399 and line 434 use these actual exceptions. The docstring no longer claims that Galois block labels are required to state this theorem. No replacement proposition stands in for it. |

## Verified sound

Read all 889 README lines and all 119 Suggested.lean lines, the repository rules, both previous reports, their repair report and the supplied elaborated signatures. Counts: **4 Lean declarations**, **28 numbered target sections** (representative computations below), **155 Check bullets**, **110 distinct numbered source-line anchors**, **31 named supplier roadmaps** including the ProfiniteCohomology citation, and **7 declared supplier gaps**. Twelve source texts were available; BW00 remains uncertified. The line-anchor count counts resolved anchors, not independent proofs of 110 mathematical theorems. The finite test calculations below do not replace the source and hypothesis checks.

The three kept Lean theorems are deep targets, not one-tactic padding. Their predicate is used by the compact-cohomology headline. No additional statable geometric headline was found: the relevant tower, étale cohomology, almost-module, smooth classification, automorphic and quaternionic carriers are absent at the pins. Their absence is recorded by name in the module docstring. In particular a bare abstract Ext or arbitrary Galois representation does not supply the missing smooth category or the tower multiplicity functor.

There is one `import Mathlib`, one used Tau Ceti import, one namespace and three theorem bodies consisting of `sorry`. There is no admitted data, `set_option`, `lemma`, duplicate fully qualified declaration, placeholder proposition or computational algorithm. All four own Lean declaration names occur in the README. Native predicate admissibility is only equated with the README condition under the theorem's bounded-torsion and smoothness binders.

The pins read were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. All 25 explicitly cited library file paths exist at these pins. The explicit cocycle comparisons, coinduction action and quotient relation were read at the pin; no later library version was substituted. The supplied elaborated-signature record was compared with all four source declarations and with README §§0.3, 2.1 and 2.2: **zero missing binders, zero changed signatures**. No Lean process was run, in accordance with the read-only instruction.

### Lean declaration and context ledger

All four declarations are in `TauCetiRoadmap.ScholzeFunctorAndModpCohomologyOfTheLubinTateTower`, universe `u`. There are no section variables or hidden standing hypotheses. Each row records the declaration's own context.

| Declaration / section | Explicit variables and instances | Computed instances, both sides | Result / change |
|---|---|---|---|
| AdmissibleCompactInvariants, Suggested.lean:55, §0.3 | A,H:Type u; CommRing A, TopologicalSpace A, Group H, TopologicalSpace H; X:TopRep A H. Quantifies compact open subgroups K. No smoothness or topology axioms are silently included. | H=1, X=k: invariants=k, module rank 1, predicate true. X=0: rank 0, true. X=⊕ℕk trivial: invariants=⊕ℕk, infinite rank, false. For finite S₃ and its regular k-module, fixed dimensions are [S₃:K], hence all finite. | Real-bodied native predicate; used only with explicit smoothness/boundedness. No change. |
| compactLie_cohomology_finite, Suggested.lean:67, §0.3 | p,d:ℕ; Fact p.Prime. H:Type u, Group, TopologicalSpace, IsTopologicalGroup, T2Space, CompactSpace, ChartedSpace (Fin d→Padic p), analytic LieGroup. A:Type u, CommRing, IsLocalRing, IsNoetherianRing, IsAdicComplete at maximal ideal, finite residue field of characteristic p, discrete topology. X:TopRep A H, IsSmoothDiscrete, admissibility; j>0; every element of 𝔪ʲ annihilates X; i:ℕ. | H=C_p, d=0, X=𝔽_p: every Hⁱ has dimension 1 and p elements, matching both finiteness conclusions. H=ℤ_p, X=ℤ/p²: degrees 0,1 have p² elements; degrees ≥2 have 1 element. A=𝔽_p[ε]/ε², H=1, X=A: rank 1 over A, p² elements; zero X has rank 0 and one element. V=ℚ_p/ℤ_p, H=1 has infinite H⁰ and fails the uniform annihilator. | No torsion-free-group hypothesis is needed. p=2 is included. d=0 is intentional. Zero ring fails IsLocalRing; j=0 excluded; noncompact H excluded. No change. |
| continuousCohomology_coind_iso, Suggested.lean:94, §2.1 | R,H:Type u. R commutative topological ring. H group, topological group, Hausdorff, locally compact, totally disconnected. J≤H closed. X:TopRep R J with explicit joint continuity. Continuous s:J∖H→H with projection∘s=id; i:ℕ. Conclusion Nonempty of a topological R-module isomorphism. | J=H: induction and both cohomology objects equal those of X. H=C₂,J=1,k=𝔽₂: coefficient dimensions 2 versus 1, H⁰ dimensions 1 versus 1, higher dimensions 0 versus 0. H=S₃,J=A₃,k=𝔽₃: induced coefficient dimension 2, H¹ dimension 1 on each side. H=ℚ_pˣ,J=1: invariant functions are constants X and positive cohomology vanishes on both sides. | Right-coset relation is yx⁻¹∈J, matching functions f(jh)=jf(h). TopRep alone lacks joint continuity; hact supplies it. No termwise isomorphism claimed. BW00 general theorem remains uncertified. |
| moore_sl2_h2_vanishes, Suggested.lean:113, §2.2 | p:ℕ, Fact p.Prime, hp:2<p. Actual SL₂(Padic p); trivialFp supplies discrete ULift(ZMod p), not an arbitrary coefficient object. | p=3: Hom(C₂,C₃)=0; p=5: Hom(C₄,C₅)=0; H² is a singleton in both cases. p=2: Hom(C₂,C₂) has 2 elements and fails hp. In ℚ₃(ζ₃), Hom(C₆,C₃) has 3 elements, outside the ℚ_p carrier. | Genuine rank-two covering theorem. Universe lift affects coefficients only. No change. |

The one-tactic probe found no library theorem giving any of the three conclusions under their full signatures. Pinned Shapiro is for profinite groups and discrete coefficients; its finite-coefficient finiteness theorem retains additional compact/normal/prime-degree assumptions. Pinned `Matrix.SL2.commutator_eq_top` only provides degree one after the cocycle dictionary, not degree two.

### Sampled adversarial computations

“Pass” below means the displayed instances agree and the stated source/supplier hypotheses cover the target, except for explicitly declared gaps. “S01–S03” points to the required change. Values are over k=𝔽_p unless another coefficient ring is specified. The zero object always has one underlying additive element and vector-space dimension zero. Rank r=0 is excluded from the tower, but rank zero is allowed in the almost-module conclusion. Finite F/ℚ_p excludes equal-characteristic and inseparable local extensions from the tower statements; Moore's general local-field statement explicitly permits equal characteristic.

| Statement / location | Instances and computed values on each side | Result / change |
|---|---|---|
| Conventions: right G, left D, inverse Artin, trace, duals, README:19–29 | At δ(2)=2 mod 5, f(x·2)=3f(x), (2f)(1)=2f(1), Weil Art=2 gives 3f(1); 2·3=1. Trace of degree 1,2 is 1,2, including 0 for degree 2 at p=2. Lattice dual scales by 1/2, evaluation by 1. | Pass; negative inverse/dual models detected. |
| §0.2 finite component count | r=1,F=ℚ₃,m=1: over F̆ one connected point of a quadratic extension, over C two points; label group has order 2. F=ℚ₂: geometric m=1,2 counts 1,2 and transition 2→1. | S01: state geometric base change. |
| §0.3 compact-dual finite generation iff admissibility | Trivial k: dual k generated by 1, invariants dimension 1. Infinite trivial sum: dual ∏ℕk, not finitely generated for H=1, invariants infinite. Regular module dual k[[H]] has one generator and invariant rank [H:K]. | Both directions pass. |
| §1.1 sheaf, stalk and exactness | Rank one evaluation gives π, zero gives 0. Regular GL₂(𝔽₂) coefficient gives stalk dimension 6, not invariant dimension 1. A nonsmooth all-functions K-module has smooth stalk C⁰(K,k), a proper subspace. | Pass; smooth input essential. |
| §1.3 strict image | U=∅: image 0. Radius \|p\| disc into radius 1: \|p\|<1 and strictness holds. U=V closed disc: Gauss boundary prevents valuative extension. U=V proper smooth: extension holds and restriction is id. | Pass conditional on two declared local geometry/image gaps. |
| §1.4 Frobenius system and API | Zero system r=0. Constant M_k=O/π gives γ(M_p)=1 versus p, excluding it. Standard r=1 has ker reduction πO/π²=image(q₁). Reduction 3→2→1 equals 3→1; all ranks remain 1. | Pass; no ordinary length substituted for γ. |
| §1.5 full finiteness/base change/2(r−1) bound | r=1 bound 0 and positive S vanish; r=2 trivial k gives nonzero S²=k(−1), S³=0. C→C′ sends constant generator 1 to 1 and is an isomorphism. | Pass; includes every finite F. |
| §2.4 five-term sequence | π=1,r=2,odd p: first outer H¹(SL₂,k)=0, S¹=0 and later H²(SL₂,k)=0 force middle multiplicity 0. At p=2 only the injection into one-dimensional H² remains. | Pass; not an unconditional middle isomorphism. |
| §3.1 quotient, height and universal property | B contains diag(p,1): q(x)=q(xb) while heights are 0 and 1. diag(p,p⁻¹) has height shift 0 and is not integral. | S02 for height; S03 for equality test. |
| §3.2 Ludwig principal-series/Steinberg vanishing | S²(Ind 1)=0 versus S²(1)=k(−1). Exact sequence gives surjection S¹(St)→k(−1), hence S¹(St)≠0; S²(St)=0. | Pass at p=2 and odd p; no genericity restriction. |
| §4.2 auxiliary place / quaternion exchange | For k=𝔽₂₇, primitive ξ has order 26 and ξ² order 13, outside 𝔽₃ˣ of order 2. Exchanging two invariants changes sum by 1=0 modℤ. | Pass; later target uses residue degree ≥3. |
| §5.1 finite-image-family definition and closure | Empty support gives all dimensions 0; singleton value k gives support 1, dimension 1; singleton ⊕ℕk has infinite dimension and fails. In an exact pointwise sequence dimensions obey dim middle≤dim left+dim right, support lies in their finite union. | Pass, both finiteness clauses needed. |
| §5.2 arithmetic descent / scalar ascent | Geometric level-zero H⁰=k². Frobenius swap has invariant diagonal k, dimension 1; residue degree 2 gives identity, dimension 2. Scalar step is 2 and regular ℤ-coinduction has H¹=0. | Pass; arithmetic and geometric bases distinguished here. |
| §6.2 right exactness / finite-group coinvariants | C_p matrix 1+N: invariants=ke₁, coinvariants=k[e₂], and e₁ maps to 0. Dual of invariants equals coinvariants of dual, not a natural identification with invariants of that same module. | Pass; characteristic-p averaging excluded. |
| §6.3 finite length / dimension vanishing | d=0 gives 0. Absolutely irreducible d=3 has no map to factors of dimensions 1 or 2, so Π=0. Absolutely irreducible d=2 has only its supplied supersingular label, with length possibly 0. | Pass; reducible dimension 2 is not put into a single block. |
| §6.4 infinite smooth vectors / finite-level finiteness | A finite representation of additive ℚ_p has image 0 by divisibility. Odd p gives character multiplicity bounded by H²(SL₂,k)=0; at p=2 bound is dimension 1. Thus the indicated infinite-level smooth part is 0 only in the asserted odd range. | Pass; finite-level smooth vectors may be nonzero through finite descent errors. |

### Sampled README Checks

These representative rows identify Checks by README line and retain their computed discriminants. They are not independent proofs.

| README line | Computed result / discriminant | Verdict |
|---|---|---|
| 79 | (12)⁻¹(23)(12)=(13)≠(23); second-factor-only translation gives hk. | Pass |
| 254 | Geometric units mod 2 count 1, mod 4 count 2, with both reducing to 1. Scope repair S01 applies. | S01 scope |
| 280 | pⁱ-torsion of ℚ_p/ℤ_p has pⁱ elements; full H⁰ is infinite. | Pass |
| 313 | For K=ℤ_p, indicator of {0} is a function but not continuous; the stalk is C⁰(K,k), a proper subspace of all functions. | Pass |
| 334 | S¹(St) surjects onto k(−1), whereas S¹(1)=0 and S²(Ind1)=0; S¹ not exact. | Pass |
| 372 | Over 𝔽₃((t)), φ(e)=−e would require a²=−1 for a fixed basis, impossible on unit residues; algebraic closure supplies a solution. | Pass |
| 387 | A=k[ε]/ε² has dimension 2 with ε·1=ε≠0; reduction has dimension 1. | Pass |
| 407 | Laurent orbit {tⁿ:n∈ℤ} infinite; compact invariants infinite; no finite-orbit Galois extension. | Pass |
| 409 | Finite-support orbit divides lcm(m₁,…,m_s), but invariant dimension infinite; trivial direct sum has singleton orbits. | Pass |
| 410 | δ on ℤ₅ˣ has non-open kernel {1}; mod5 D scalar 2, Gal scalar 3; congruence subgroup 1+5ℤ₅ fixes the reduction. | Pass |
| 449 | det diag(t,1)=t, det(tI₂)=t²; p≠p². | Pass |
| 467 | Hom(C₂,𝔽₂) has 2 elements and dimension 1. | Pass |
| 486 | d¹d⁰=ghv−gv−ghv+v+gv−v=0. | Pass |
| 562 | π̄∘q is typed M∞→ℙ¹; q∘π̄ is not typed. S03: precompose. | S03 |
| 564 | 0=1+(−I₂) belongs to 1+M₂(ℤ_p) and is singular. | Pass |
| 623 | λ=O: lattice dual O; O⊗L/O=L/O≠0; torsion-dual tensor gives 0. | Pass |
| 662 | Xᵐ−1 in characteristic p has m_{p′} distinct roots, at most m. | Pass |
| 694 | Le example: cosocle length 1, End contains k̄ and is infinite-dimensional; pro-p invariants infinite. | Pass |
| 739 | p=5 tame δ: norm restriction 1 but δ(Nrd2)=4; excluded at n=0, trivial on pro-p norm image for n≥1. | Pass |
| 755 | Swap on k² has diagonal invariants dimension 1; residue degree 2 gives dimension 2; ramified quadratic f=1 gives dimension 1. | Pass |
| 782 | Arithmetic dual may have infinite invariants while each fixed-π geometric Hom is finite; these have different quantifiers. | Pass |
| 808 | N(e₂)=e₁,N(e₁)=0: invariants ke₁, coinvariants k[e₂], map e₁↦0. | Pass |
| 810 | Continuous dual of ∏ℕk is ⊕ℕk, strictly smaller than algebraic dual. | Pass |
| 826 | d=0 gives zero input/output; d=1 has no vanishing conclusion. | Pass |
| 846 | Odd p: character Hom embeds into H²=0; p=2: H²=k dimension 1, so this proof does not show zero. | Pass |

Each defined object has at least three Checks in its section. Nonzero/zero, wrong-inverse, wrong-coefficient, infinite-value and wrong-topology controls are present; the identity and zero controls are not the only tests for any definition. Some global-existence and support Checks are structural rather than numerical; their source-dependent status is shown explicitly.

### Ownership, supplier and order audit

Ownership was searched by object using `roadmaps list`, `roadmaps grep` and `roadmaps show`, followed by reads of the matching passages. The searches covered main and Completed, the board packages, and the supplied open-head checkouts. The open-head index was used to distinguish new roadmap folders from revisions of existing roadmaps; main was used for existing owners. No exact-name collision for the four retained declarations was found in the pinned libraries or the readable roadmaps. The generic site, tower, representation, covering and duality objects are imported; the retained new targets are their stated coefficient extensions, continuous/noncompact comparisons and tower-specific consequences.

The following table records the named supplier citations rather than claiming every theorem of each supplier has been reviewed. Paths are `TauCetiRoadmap/<supplier>/README.md`, except the two board designs identified below. Section numbers refer to the read main/new-roadmap head, not remembered numbering. The broad references to whole layers were checked at the named input targets within those layers.

| Supplier | Resolved sections / hypothesis and ownership check |
|---|---|
| CompletedCohomologyAndLocalGlobalCompatibility | §0.6 full-rank torsor/sheaf and O-torsion extension; §§1.5–1.7 fixed-character quaternionic modules and injectivity; §3.7 Hecke localisation; §4.12 non-Eisenstein comparison/isotypy. The new A-coefficient results are extensions of these imports, not a second torsor construction. |
| EndoscopicTransferAndUnitaryTraceComparison | §§12.2–12.8 towers, actions, perfectoid limits; §12.11 infinite-level marked EL duality; §12.14 central quotient; §12.19 Drinfeld arithmetic descent; §12.21 Stein/Mittag–Leffler. Finite equal-numbered levels are not identified. Scalar determinant shift is 2. Its inverse-character tensor-sector convention is transported through the explicitly fixed section/right-action convention here. |
| SmoothRepresentationsOfLocalGroups | SR.0.1–SR.0.4 smooth categories/invariants/central characters, SR.0d.1–SR.0d.2 derived smooth category and compact-U derived invariants, SR.2.1 induction. SR.0d.2's compact-U comparison does not own the new noncompact continuously split Shapiro theorem. |
| ModpRepresentationsOfGL2OverLocalFields | `packages/ModpRepresentationsOfGL2OverLocalFields/design/README.md`: MP.0 torsion-admissibility, finite-presentation, finiteness-calculus, amalgam-coherence, scalar-extension; MP.1 central-ext, finite-type-presentation, cosocle-length, smooth-dual-length. The finite-length/Hom criteria are ℚ_p statements; endomorphism-field input requires admissibility. Smooth finite presentation is by compact inductions, not the abstract group-ring condition. |
| PadicLocalLanglandsForGL2Qp | §§0.1,0.3 coefficient-linear compact/discrete and lattice dualities; §§2.1–2.7 mod-p smooth classification; Layer 3 Montréal values; §§5.1–5.4 blocks/envelopes/centres; §§6.7–6.8 residual fibres and occurrence. Fixed-character projectivity is kept in the fixed-character category. |
| KTheoryLowDegrees | §11.5 local rank-two covering classification, including finite then profinite kernels and root-symbol normalisation. No stable K₂ replacement is made. |
| ClassFieldTheory | Layer 5 finite local cohomology and Hilbert pairings; Layer 9 Weil group/topology, residue-degree change, reciprocity. The supplier's arithmetic Artin convention is explicitly inverted here; geometric/arithmetic Frobenius gives scalars 3/2 in the mod-5 test. |
| PerfectoidSpaces | P0.5–P0.13, P0.29 almost-module operations; P2 affinoid geometry; P3.18–P3.22 étale/tilting/acyclicity; P5 finite-stage étale descent; P8 quotient/torsor comparisons. The new almost-system Frobenius rigidity is not an additional almost category. |
| DiamondsAndVStacks | D0 coherent-site limits, cutoffs and Čech/derived comparisons; D4,D6 diamonds and analytic diamond functor. qcqs/profinite assumptions are retained where limits are used. |
| DiamondEtaleCohomology | C0.17 quasi-pro-étale comparison and C0.18 cofiltered étale continuity, followed by C1 sheaf cohomology. C0.18 has arbitrary abelian coefficients; p-torsion is allowed. |
| IgusaVarietiesAndTorsionConcentration | IG.4.1 equivariantEtaleSite, pullback and slice. §0.1 here adds the stated closed-subgroup/tower cohomology refinements. |
| PadicHodgeTheory | §2.7 imports the proper smooth primitive comparison from AInfCohomology AI.3.1. It does not supply the strict-open local-image theorem as a named target. |
| AInfCohomology | AI.3.1 primitive comparison and its local-chart proof route; separate precise image-estimate gap retained. |
| HodgeTateAndCanonicalSubgroups | §6.36 qcqs analytic-topology dimension bound for every abelian sheaf. Applied to projective spaces, dimensions r−1 and 1. No redundant gap remains. |
| NoncommutativeAndEquivariantIwasawa | Layer 0 completed group-algebra noetherianity and finite-index comparisons. The finite-global-dimension statement requires no p-torsion; the roadmap only uses degreewise finite free resolutions, not bounded resolution length for C_p. |
| DeformationAndDerivedPatchingAlgebra | Layer 1, especially §1.10: compatible Cohen coefficient map including p-torsion targets and finite power-series presentations. No coefficient embedding into a p-torsion ring is asserted. |
| CompletedCohomologyPartII | Layer 3 compact duals, coefficient limits and finite-coefficient tower duality, with its foundational duality imports. The A[[H]] finite-generation converse here is separately proved by Nakayama. |
| AdicSpacesPartII | R0.10–R0.18 separatedness, charts and valuative geometry. Full good-germ affinoid-neighbourhood input remains declared as a gap. |
| EtaleCohomologyFoundations | §§0.9,0.11 Kummer/projective-space classes and smooth trace. n=pᵃ is invertible over the characteristic-zero geometric base; trace degree one is 1. |
| ClassicalAdicEtaleCohomology | §§1.1,1.3,1.5 cohomology/descent/limits; §8.2 proper algebraic-to-analytic comparison includes torsion p over C. Arithmetic Stein Hochschild–Serre is separately declared. |
| PerfectoidShimuraVarieties | §§1.13–1.15 anticanonical towers and limits. The height-zero Lubin–Tate embedding with compact GL₂(ℤ_p)-action is separately declared. |
| LocalGaloisDeformationRings | §3.4 fixed potentially semistable/type rings; mere existence of that ring does not guarantee a lift, so potentially Barsotti–Tate existence is a declared gap. |
| PotentialModularityAndCompatibleSystems | §§2.23,4.15 prescribed local data/potential modularity; p odd, local-type compatibility, splitting and avoidance restrictions retained. |
| AutomorphicGaloisRepresentations | §§3.10–3.11 Hilbert attachment and convention transport. Its prime-away Carayol comparison is not used as a coefficient-prime theorem. |
| GL2AutomorphicRepresentationsAndTransfer | R16.3 local type/WD dictionary; R17.3 quaternionic exchange; R17.4 solvable base change and prescribed splitting. These characteristic-zero normalized operations do not introduce a square-root modulus into the unnormalised mod-p induction. |
| HilbertModularVarietiesAndShimuraCurves | R18.3–R18.4 localised coefficient spaces; R18.3.29(c) coefficient-prime comparison under the stated global residual/discrete-series hypotheses. The local residual representation may be reducible. |
| ReductiveGroupsPartII | RG2.2 building, oriented facets, stabilisers and finite orbit geometry over local fields; §2.1 here owns the coefficient resolution and finiteness argument. |
| LubinTateFormalModulesAndQuasiCanonicalLifts | `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md`, LT.2 character and reciprocity comparison. Its arithmetic Artin value on πʳu gives unit scalar u⁻¹; inverse reciprocity convention here is recorded explicitly. |
| Chebotarev | Layer 10 prescribed conjugacy classes outside finite exceptional sets; applied after combining residual/cyclotomic fields. |
| ProetaleCohomologyOfPAdicCurvesAndTowers | The arithmetic finite-presentation section is a declared supplier contract. No readable implementation/roadmap body was found; this absence is not a finding. |
| ProfiniteCohomology | Layer 2 explicit low-degree cocycle complex; actual H¹/H²-to-native comparisons are imported from the pinned Tau Ceti declarations separately. The profinite restriction is not used to assert SL₂(ℚ_p) is profinite. |

All seven gap slugs occur in both README supplier contracts and design/plan.json. Their suppliers are named, not `none`; their scope is minimal relative to the actual statements consumed.

The final prescribed read-only dependency check returned:

```text
depcheck: 156 roadmaps, 1084 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Internal direct needs were also traced in README order: §6.1 uses the general-F part of §5.2 without §5.4; §6.2 takes general-F arithmetic finite presentation directly from the gap; §6.4 takes LT arithmetic descent from its own gap. The later PadicLocalLanglandsForGL2Qp Part II is a consumer, not a supplier. No ownership move is required by these findings.

The read-only `git diff --stat origin/main...HEAD` showed eight changed files, all below this package folder (1,811 insertions, 8 deletions). No package source was edited during this review.

### Source locator ledger

All 110 numbered extraction anchors were resolved to the supplied legal cached text. The following are the principal supporting passages read around those anchors. Pages follow each manifest's version note; journal and preprint pagination were not interchanged. The manuscript's own source issues are separated below.

| Source | Read locators / evidence |
|---|---|
| SCH18 | Propositions 2.8–2.12 and Lemmas 2.10–2.13, lines 318–412; Proposition 3.1, lines 440–470; Theorem 3.2 and strict-image route, lines 481–560; Lemmas 3.12–3.13, lines 717–744; Definition 4.1, Theorems 4.3–4.4 and Propositions 4.6–4.7, lines 769–914; Proposition 7.7, lines 1278–1306. |
| SCH13 | Almost classification and majorisation, lines 450–515; Lemma 2.12, proof including Lemma 2.13, lines 516–574; Lemma 5.6 good-coordinate strict image, lines 1420–1450. |
| LUD17 | Theorem 3.11, Corollary 3.13, Theorem 3.14 and Proposition 3.15, lines 850–980; Lemma 3.22 and Proposition 3.23, lines 1098–1190; character local system, pushforward, fibre cohomology, tensor comparison and vanishing, lines 1230–1342. |
| PAS22 | Lattice-dual and cyclotomic corrections, lines 744–795; Lemmas 6.1–6.2, lines 1242–1288; Proposition 6.4 and Theorem 6.5's supercuspidal-type argument, lines 1299–1354. |
| DPS23 | Locally admissible compact-dual functor and limits, lines 1320–1340; central actions and twists, lines 1387–1423; residual globalisation and auxiliary place, lines 1748–1816; fixed-character modules, coefficient choices and correction footnotes, lines 1848–1909. |
| GK14 | Proposition A.1, Theorem A.2 and Corollary A.3, lines 1689–1747. The p>2 condition and the need for actual potentially Barsotti–Tate lifts are retained. |
| STR08 | Theorem 4.3 base-field hypothesis, line 337; Theorem 4.4 geometric component/action labels and original-base connectedness, lines 372–399. This supplies S01's witness. |
| MOO68 | Theorems 10.3–10.4, lines 2054–2094, printed pp.51–53. Finite discrete kernel comparison is proved by the target, not silently identified with measurable/topological cohomology. |
| ECD17 | Propositions 14.8–14.9, lines 3520–3582; Lemma 23.6, lines 6017–6023, compared with Proposition 22.11, lines 5518–5522. The README uses the arbitrary-torsion finite-stage continuity route. |
| CDN23 | Component/descent convention, lines 170–185; arithmetic finite presentation and geometric corollary, lines 923–935,1278–1317; Cartan–Leray and degree-one comparison, lines 1450–1562; global/module arguments, lines 1563–1774; finite support/finite length, lines 1778–1925; general-F and geometric multiplicities, lines 1926–2019; smooth vectors and effective descent assertion, lines 2021–2065. |
| FUST22 | Induction and untwisting, lines 90–120; Corollary 4.4 and exceptional representations, lines 345–445; compact and reductive finiteness, lines 470–500,580–625. In this journal version reductive finiteness is Lemma 6.6. |
| LE19 | Nonadmissibility and endomorphism-field statements, lines 27–55; central scalar normalisation, lines 165–175; construction/results, lines 255–281,363–378. The resulting object is a G′-module and refutes the unrestricted Hom criterion. |
| BW00 | Chapter IX, Proposition 2.3, retained as explicitly uncertified; no claim to have read its text. |

## Not verifiable

- **BW00, Chapter IX, Proposition 2.3:** text access is settled as uncertified. The full noncompact, topological-coefficient Shapiro statement was checked for typing, continuity hypotheses, map direction and finite/noncompact test cases, but its precise textbook formulation was not certified. No new source request was made.
- **Lean elaboration during this pass:** prohibited. The supplied elaborated signatures were compared declaration by declaration; no independent elaboration or build is claimed.
- **Supplier implementations and declared gaps:** this review verifies planned contracts, not proofs that have yet to be written. ProetaleCohomologyOfPAdicCurvesAndTowers has no readable body here; the other six gaps are likewise accepted as contracts, not completed results.
- **Global-existence instances:** no explicit automorphic eigenform or Galois extension was computed. Their source proof routes, hypotheses and arithmetic obstruction tests were checked. The existence results are certified from the available sources rather than from an algorithm or an invented numerical example.
- **Unlisted/unreadable open work:** ownership was checked against the provided checkouts, main, board packages and the connected roadmap index. No assertion is made about other inaccessible drafts.

## Source issues

- **Misprint** in SCH13 at Lemma 2.13 proof, printed p.12 (SCH13 line 556): the source says the approximating free-module map has almost-annihilated kernel; it should be almost-annihilated cokernel; affects the proof.
- **Misprint** in PAS22 at Lemma 5.1, equation (26), preprint p.17 (PAS22 line 751): the source says the coefficient-lattice factor is its torsion-valued Pontryagin dual; it should be Hom_O(λ,O) before tensoring with L/O; affects the proof; corrected in print at DPS23 footnote 15, preprint p.40 (DPS23 line 1896).
- **Misprint** in PAS22 at Lemma 5.3 and its proof, preprint p.18 (PAS22 line 782 and line 794): the source says the determinant formula uses the cyclotomic character in the displayed direction; it should use its inverse in those two places; affects a stated result; corrected in print at DPS23 footnote 14, preprint p.39 (DPS23 line 1848).
- **Misprint** in CDN23 at Corollary 2.12 proof, printed p.30 (CDN23 line 1284): the source says a dualised multiplicity equals an undualised finite-group Hom; it should dualise the latter Hom as well; affects the proof.
- **Misprint** in CDN23 at Proposition 4.3 and its proof, printed pp.37,42 (CDN23 line 1575 and line 1774): the source says a character factors through Gal(K/ℚ_p) for arbitrary finite K; it should say its restriction to Gal_K is trivial; affects a stated result.
- **Misprint** in CDN23 at proof of Theorem 4.1, printed p.42 (CDN23 line 1779): the source says degree-zero cohomology with L coefficients is a finite group; it should use finite residue coefficients k_L in that assertion; affects the proof.
- **Misprint** in CDN23 at equation (4.15), printed p.44 (CDN23 line 1852): the source says scalar-p quotient component labels divide Fˣ by p^ℤ; it should divide by p^{2ℤ}, because det(pI₂)=p²; affects the proof.
- **Error** in CDN23 at proof of Lemma 4.13, printed p.44 (CDN23 line 1855): the source says all division-algebra compact level groups are torsion-free; it should permit roots of unity at level zero and use compact analytic degreewise finiteness; affects the proof.
- **Misprint** in LUD17 at proof of Theorem 4.6, preprint p.31 (LUD17 line 1322): the source says the completed-fibre result is Lemma 3.23; it should refer to Proposition 3.23; affects nothing.
- **Gap** in ECD17 at Lemma 23.6 proof, printed p.144 (ECD17 line 6021): the source says the shriek projection formula proves the statement for arbitrary coefficient rings; it should justify arbitrary coefficients by finite-set continuity, since the cited formula assumes prime-to-p torsion; affects the proof.
- **Gap** in DPS23 at Lemma 7.4, preprint p.31 (DPS23 line 1401): the source says every smooth torsion input has a Galois-equivariant twist comparison; it should assert Weil equivariance generally and Galois equivariance when the actions extend, in particular for locally admissible inputs; affects a stated result.
- **Gap** in CDN23 at §4.3.3, printed p.48 (CDN23 line 2022): the source says the finite Lubin–Tate scalar quotient is defined over F without supplying effective descent; it should justify effectiveness of its Weil descent cocycle with height translation; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "6b357b62725a4219955d447d367883577ad180b2", "job": "RT-ScholzeFunctorAndModpCohomologyOfTheLubinTateTower~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
