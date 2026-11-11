<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13045#issuecomment-6790902263 -->
Review (codex) of 8ed7a17

Verdict: needs_changes

1. **F01** (P2) Degree-zero classicality is missing its chamber hypothesis

   **Location:** `packages/HigherHidaAndColemanTheory/README.md:1272`, §7.6: “A degree-zero small-slope overconvergent cuspidal class becomes a classical canonical class”.

   **Claim:** Geometric smallness gives this classicality assertion for every locally algebraic weight admitted by the Coleman conventions.

   **Witness:** BP-Coleman line 7971, Theorem 6.10.3, p. 173, requires C(κ)+={1}. At modular weight k=1, Cκ+={id,long}; geometric smallness excludes no chamber, and the permitted interior degrees are [0,1].

   This hypothesis is absent both from the sentence and the standing Coleman datum. It is essential to the cited argument: BP-Coleman lines 7976–7983 use the vanishing of the outgoing degree-one interior Cousin term. At k=1, the complement of Cκ+ is empty, so the definition of geometric smallness in §1.2 imposes no slope restriction. The amplitude theorem allows that degree-one term. The existing §9.2 warning that weight one has no automatic strict-positive window is consistent with this obstruction. This is a missing-hypothesis finding, not a claim to have constructed a nonclassical geometric eigenform.

   **Exact repair:** Separate this consequence from the general interior bounds. State it for an M-dominant algebraic κ with Cκ+={id}, a finite-order χ, and the positive identity-stratum geometric small-slope cohomology: the map from cuspidal to canonical H⁰ on that stratum factors through classical canonical H⁰. Retain the limitation concerning classical cuspidality, and cite Theorem 6.10.3, p. 173. Keep the general singular-weight amplitude theorem unchanged. Add a wall-weight negative control explaining that Cκ+={id,long} at k=1 leaves a possible degree-one obstruction.

   **Repair test:** At k=1 the added chamber hypothesis fails, so the invalid inference from vacuous smallness is excluded. At k=2, Cκ+={id}, l_max=0, the outgoing interior degree-one group vanishes on the small region, and the standard normalized threshold is slope <1. Thus the source's factorization proof applies in precisely the tested regular chamber. The same distinction persists for the two compatible chambers at the genus-two weight (k+2,2).

## Verified sound

The three previous findings are repaired. This round finds one new P2 issue, R01. The four reviewed package inputs were not edited, and no source entry was added or changed. All four source texts were accessible.

### Previous findings and the changed passages

The previous review and repair report were checked finding by finding before the new pass. No previous finding was marked not actionable in this package. Quotations below are from the present README.

| Previous finding | Repaired passage | Assessment and retest |
|---|---|---|
| F01: relative properness did not imply scalar finiteness | Line 345: “and S=Spec A”; line 415: “It has bounded cohomology consisting of finite A-modules”; line 463 specifies the core “proper over S=Spec A”. | Repaired. The affine-line identity over Spec 𝔽₂[t] no longer qualifies as a proper compactification over Spec 𝔽₂. The proper point has ordinary H⁰=𝔽₂, dimension 1. |
| F02: a pure cocharacter was incorrectly necessary | Line 523: “in general exactly when that character takes the value 1 at u, which can happen with u≠1”. | Repaired. At diag(2,6), the unit diag(2,2) has character value 1 and the ratio is 3; at diag(2,3) it has value 1/2 and the ratio is 3/2. |
| F03: all-ones spherical Hecke assignment | Line 642: “through its degree character reduced modulo 3^s”. | Repaired. At ℓ=2 the degrees 3,6,1 give 3²=6+3·1=9, hence 0=0 modulo 9. The former assignment gives 1≠4. |

The F01 sweep included the Scope and Conventions, §§2.4–2.8 and their geometric consumers. Section 2.5 now specifies X′=X×_S Spec A′ and Tor independence; §§2.6–2.7 retain flatness/smoothness over the scalar base. Its Artinian coefficient setting includes the finite flat coefficient extensions used by the consumers. The separate affinoid finiteness statement in §6.3 uses compact spectral theory, not relative properness. The F02 sweep included the comparison scalar, its API, the positive-valuation argument in §3.6, and source clarification E12. The F03 sweep included the completed action in §3.8 and the scalar-closed Hecke algebra of §4.7. No remaining occurrence of these three defective patterns was found.

### Principles, shape and acceptance-file audit

All 68 numbered target subsections, every Needs line, and the nine layer dependency endings were read. The 24 explicit construction/API blocks each have at least three Check bullets; the computed checks below distinguish flat from nonflat coefficients, ordinary from finite slope, formal completion from local cohomology, and support images from their specialized maps. The main-branch PadicMeasuresIwasawaAlgebras and ResolutionOfSingularitiesCharacteristicZero roadmaps were used for the shape comparison.

The opening identifies this as Part II of PadicFamilies and states where that base roadmap stops. The package retains all-genus Siegel theory, cofinal p=2 levels, singular weights and locally quasi-split abelian-type Coleman data. No route-specific shortcut, replacement plan, computational algorithm, copied source passage, forbidden supplier, upward edge or cycle was found. The mathematical layer order is supported by its dependency lines: ordinary dynamics precedes the geometric families; the analytic coefficient construction precedes eigenvarieties; both precede comparison. The ordering is not justified by a source's chapter arrangement.

Every kept theorem has a locator and stated or explicit standing hypotheses, subject to R01. No undeclared own backticked identifier, process narrative, local path, forbidden option or sorry'd data was found in the roadmap. All four cited works have one manifest entry each, with the recorded version information. No author-flagged unverified locator remains.

The requested pinned `lake env lean` elaboration of `packages/HigherHidaAndColemanTheory/Suggested.lean`, run from the content checkout, exited **0 with no output and no warnings**. No Tau Ceti module build was required. The file has a single `import Mathlib`, the required module docstring and the empty namespace `TauCetiRoadmap.HigherHidaAndColemanTheory`.

There are **zero declarations and zero sorried theorems**. Therefore the exhaustive one-tactic-probe set and the own-declaration `#check @name` set each have cardinality zero. There is no unprobed sorry, padding declaration, erased section hypothesis or placeholder theorem. The ten headlines are accounted for as follows; the module docstring names each and its missing carriers.

| Headline | README | Why it is not statable at these pins |
|---|---|---|
| Derived arithmetic Hida control | §4.6 | Supported ordinary Igusa complexes and their universal Iwasawa realization are absent. |
| Integral Iwasawa Serre duality | §4.8 | Those geometric complexes, coefficient duality and transposed correspondences are absent. |
| Integral low-genus amplitude | §4.9 | The ordinary geometric family complex is absent. |
| Rational all-genus amplitude | §8.4 | That complex and its analytic comparison family are absent. |
| Regular and singular geometric classicality | §5.10 | Supported Shimura finite-slope cohomology, Bruhat tubes and their Cousin filtration are absent. |
| Cohomological eigenvariety | §7.1 | The Shimura weight-space coefficient family and its coherent Hecke support are absent. |
| Interior dimension and deformation | §7.5 | The geometric interior image sheaf and its eigenvariety are absent. |
| Sharp interior bounds | §7.6 | Supported interior coherent cohomology is absent. |
| Sharp Siegel bounds | §8.5 | The integral supported overconvergent geometric model is absent. |
| Two-term Klingen control | §9.8 | The height-one tower and the partial-ordinary Klingen complex are absent. |

Pin searches by geometric objects, not just proposed declaration names, found no carriers that make these headlines expressible using a few simple definitions. Generic complexes and endomorphisms would be substitutes for the missing geometric objects. No statable headline was omitted.

### Seeded source sample

All fifteen targets in this round's sample were checked at the cited text, including their hypotheses and printed pagination in the manifest's recorded versions. The table gives reproducible source-line witnesses. The source excerpts were read in place; none was copied into the repository.

| Target | Source and locator checked | Outcome |
|---|---|---|
| §1.1, cohomological weights | BP-Coleman lines 166–190 and 307–312, §§1.1–1.3, pp. 2–9; lines 2832–2843, §4.2.9/Proposition 4.2.10; line 7385, §6.5.4, p. 160 | Left Weyl cosets, inverse weight formulas and the −2ρ_nc and reduced-boundary factors agree. The dual formula is already explicit in the cited introduction. |
| §2.6, equivariant perfectness | BP-Hida lines 1102–1125, Theorems 2.6.8, 2.6.10, Lemma 2.6.11, p. 22 | S=Spec A, Artinian coefficients, A-flatness or A[Γ]-flatness, finite abelian Γ and commuting action retained. No averaging at p is used. |
| §2.8, finite rank and bridge | BP-Hida lines 1477–1495, Lemma 2.10.1(4), p. 29; lines 1553–1636, Propositions 2.10.3–2.10.4, pp. 30–31; lines 1637–1715, Theorem 2.11.4, pp. 31–33 | Properness is now over the scalar base; cross-containments, principal boundaries, factorization and the alternative twists are retained. |
| §3.7, regular ordinary control | BP-Hida lines 2677–2688, Corollaries 4.5.4–4.5.5, p. 52 | Singleton chamber, local/global normalization and rational torus twist agree. Finite characters remain in the coefficient. |
| §4.1, torus group-ring perfectness | BP-Hida lines 2750–2759, §5.1 definition; lines 2780–2802, Lemma 5.2.2 and Proposition 5.2.3, p. 54 | “Decomposable compact” uses the source's compact-open convention, giving finite torus quotient. Perfectness covers canonical and cuspidal coefficients. |
| §4.3, universal Igusa complex | BP-Hida line 194, Definition 1.4.1, p. 4; lines 2842–2856, §5.2.6 and Proposition 5.2.7, p. 55 | Filtered level limit precedes p-adic completion; admissibility uses continuous regular functions on an open pro-p subgroup. |
| §5.4, level and character control | BP-Coleman lines 5274–5291, Theorem 5.4.14, p. 113 | Positive pullback and negative trace, finite torus invariants and sufficient character depth agree; exactness is over characteristic-zero F. |
| §6.1, normalized analytic action | BP-Coleman lines 7170–7217, Lemmas 6.3.10–6.3.11, pp. 155–156; lines 7385–7407, §6.5.4, p. 160 | Inverse trace factor, dual transpose and algebraic comparison twists agree, including torus units. |
| §7.3, interior image/support | BP-Coleman lines 7823–7832, Proposition 6.9.5, p. 170; lines 7870–7875, definitions, p. 171 | Interior is an image in degree ℓ±(w); the support construction does not assert arbitrary base-change exactness of that image. |
| §7.5, dimension/deformation | BP-Coleman lines 7872–7899, Theorem 6.9.7, pp. 171–172 | Nonempty interior supports have full weight dimension; the torsion-free chart argument and classical interior-point inclusion agree. |
| §7.6, sharp interior bounds | BP-Coleman lines 7935–7958, Theorem 6.10.1, pp. 172–173; lines 7961–7986, Theorems 6.10.2–6.10.3 and Remark 6.10.4, p. 173 | Slope bounds and interior amplitude agree, including the source's small/strongly-small clarification. Degree-zero classicality drops Cκ+={id}: R01. |
| §8.2, ordinary comparison | BP-Hida lines 3064–3084, Proposition 6.1.7, pp. 59–60; lines 3114–3126, Proposition 6.1.11, pp. 60–61; lines 3177–3207, Theorem 6.2.9, p. 62 | Formal supported model, finite-slope projected lattice and rational ordinary comparison retain their different roles. |
| §8.3, family comparison | BP-Hida lines 3222–3296, Propositions 6.2.12–6.2.14 and Theorem 6.2.15, pp. 63–64; lines 2941–2953, Remark 5.4.3, p. 57 | Uniform pole bound, radius condition and inverse-character map are explicit. Reduction-index misprint in the source is recorded below. |
| §9.2, modular normalization | BP-Coleman lines 6536–6549, §5.14.2, p. 141; BP-GL2 lines 80–106, Theorems 1.2–1.4, p. 3 | Naive versus standard U, strict slope thresholds, degree-one dual weight and k≥3 specialization agree. |
| §9.8, singular control | Pilloni-Singular lines 82–93, Theorem 1.1, pp. 2–3; lines 3283–3299, Corollary 11.2.1/Theorem 11.3.1, p. 71; lines 4582–4606 and 4658–4676, Theorem 14.8.1/Lemmas 14.8.2–14.8.4, pp. 100–102 | Two-term amplitude, all k≥0 rational control, stricter k>p+1 torsion control and its changed level agree. The two Euler-characteristic comparisons are retained. |

### Computed adversarial evidence

The table covers the seeded sample, all ten headlines, the three repaired patterns and the new finding. Previously computed rows were reused only for unchanged formulas, compared with their current statements and Checks. The remaining targets were read for hypotheses, routes and consistency; rows without numerical or algebraic values from the earlier review were not treated as evidence. These tests are falsification checks, not purported proofs of the geometric theorems.

| Statement(s) | Instance tried | Values computed on the relevant sides | Result / change |
|---|---|---|---|
| Conventions: degree and duality | A[−1], and d=3 | H¹(A[−1])=A, H⁰=0; RHom(A[−2],A[−3])=A[−1], pairing degrees 2+1=3 | Shift agrees. |
| §1.1, §9.1 weight dictionary | C₂ with ν=(0,−2) | κ=(5,3),(5,1),(2,−2),(0,−2); inverse formula returns (0,−2) four times; dual pairs are first/fourth and second/third | Retains four chambers and the boundary dual. |
| §§1.1–1.2, chamber endpoints | GL₂ weights k=0,1,2 | Compatible sets {long},{id,long},{id}; dual weights 2,1,0; intervals [1,1],[0,1],[0,0] | Wall is not a regular chamber. |
| §2.1, smooth purity | Dimensions 0,1,2 | Ω^d has rank 1, shifted into degrees 0,−1,−2; at d=2, Ω¹ has rank 2 | Rejects wrong differential degree and missing shift. |
| §2.1, finite Tor qualification | A=ℤ/4, M=𝔽₂ | Tor_i^A(M,M)=𝔽₂ for every i≥0, whereas a flat rank-one coefficient has Tor_i=0 for i>0 | Properness cannot replace the stated Tor condition. |
| §2.2, strict versus compact | Frobenius on ℙ¹ over 𝔽₂ and 𝔽₃ | Pullback ideals (t²),(t³); strict constants 1/2,1/3; topological interior of boundary ∅ | Strictness does not imply compact containment. |
| §2.3, ordinary localization | U=1,0,3 on ℤ/9 | Ordinary modules ℤ/9,0,0; 3²=0 modulo 9, although 3 is invertible in ℚ₃ | Separates ordinary from rational invertibility. |
| F01, §§2.4/2.6/2.8(a) | Affine-line identity and proper point over 𝔽₂ | Ordinary H⁰ dimensions ∞ and 1; infinite identity cannot factor through finite-dimensional cohomology | Line excluded by corrected scalar-base properness; point qualifies. |
| §2.4, attempted compactification | Identity on ℙ¹ with nonempty boundary | For a=1,b=2, t∉(t²), so required strict ideal inclusion fails | Cannot restore the excluded affine example by adding infinity. |
| §2.5, geometric base change | Proper point A=ℤ/9, A′=𝔽₃ | A⊗^L_A A′=𝔽₃=RΓ(Spec 𝔽₃,O); for nonflat X=Spec 𝔽₃, self-Tor has 𝔽₃ in all negative degrees | Tor-independent hypothesis separates the two cases. |
| §2.6, equivariant perfectness | A=𝔽₂, Γ=C₂ | A[Γ]=A[e]/e² is free of rank 1 over itself; augmentation specialization is A. Trivial A has Tor_i^{A[Γ]}(A,A)=A for all i | Group-ring flatness rules out the wrong trivial model; no 1/2 averaging. |
| §2.7, Artinian duality | Proper point over ℤ/9 | RHom_A(A,A)=A, degree 0 pairs with degree 0 | Scalar and duality base agree. |
| §2.8(b), cross-containments | Two points a,b; support ∅ versus {a} | Complement cohomology dimensions 2 versus 1; required {a}⊆∅ is false; equal support pairs give identities | Non-equivalent pairs are excluded. |
| §2.8(c), bridge | Identity, all boundaries empty, zero twists | Both support orders are RΓ; n=1,m=0 leaves the same object and every comparison identity | Boundary-free check passes; general factorization is not discarded. |
| F02, §3.2 | p=3, κ=(2,0), t=diag(2,3), diag(2,6), diag(1,9) | Ratios (1/6)/(1/9)=3/2, (1/12)/(1/36)=3, (1/9)/(1/81)=9; unit factors 1/2,1,1 | Exact character criterion works in both directions; nontrivial unit may have value 1. |
| §3.6, noncompatible ordinary factor | Scalar 3 times an integral unit modulo 9 | Square is 0, so ordinary factor is 0; replacing unit by 2 leaves valuation 1 | Only positive valuation is used. |
| §3.7, regular global control | GL₂, k=2, constant q-coefficient, p=3 | Naive operator scalar 3; integral id normalization gives 1; algebraic twist restores scalar 3 | Local/global operator distinction retained; k=1 has two columns. |
| F03, §§3.8/4.7 | Degree action at ℓ=2 and 5 | 3²=6+3=9; 6²=30+6=36; all-ones gives 1≠4 modulo 9 | Genuine Hecke character replaces false action. |
| §3.8, completed scalars | C_s=ℤ/3^s[0] | Limit ℤ₃[0]; 3·1=3≠0, but 3=0 in ℤ/3 | Limit is ℤ₃-linear, not ℤ/3-linear. |
| §4.1, torus group ring | Γ=C₂ at p=2 | ℤ₂[Γ] has ℤ₂-rank 2 and group-ring rank 1; mod 2 gives e²=0 | Perfectness does not require semisimplicity. |
| §4.3, limit order/admissibility | Pro-p torus ℤ₂ and its quotients | Locally constant levels have 2,4,8 coordinate values; continuous f(z)=z has infinite image and is their 2-adic uniform limit | Completion is essential for C⁰; a fixed finite level is wrong. |
| §§4.5–4.6, derived control | Two-term [Λ —X→ Λ], fiber X=0 | Generic differential invertible: cohomology 0; special differential 0: H⁰=H¹=F, whereas family H⁰=0 | Ordinary specialization must be derived. |
| §4.6, inverse character | Group-like [u], ν(u)=4 in ℚ₃ | Required scalar 1/4 versus direct-character scalar 4; trivial ν gives 1 in both conventions | Nontrivial character distinguishes the regular-action inversion. |
| §4.7, finite image algebra | Rank-one Λ-module; rank-two nilpotent N | Scalar-closed image is Λ, containing X; bare ℤ-image misses X. N²=0, N≠0 | Scalar closure and nilpotents retained. |
| §4.8, integral Iwasawa duality | d=3, free one-term summands in degrees 1,2 | Degrees add to 3; RHom(Λ[−2],Λ[−3])=Λ[−1] | No shift or integral/rational substitution. |
| §4.9, low-genus amplitude | g=2,d=3, length 1 | Canonical interval [1,3], cusp [0,1]; opposite cusp interval [0,2] | Complementary intervals differ as required. |
| §§5.2/6.2, Banach versus Fréchet | f_n=3^(−n/2)z^n, n=4,8,12 | Norms at radius 3^(−1/2): 1,1,1; at radius 3^(−1/4): 3,9,27 | Exhaustion cannot be replaced by a single Banach norm. |
| §5.3, finite slope | diag(1,3,0) over ℚ₃ | Finite-slope dimension 2, ordinary dimension 1, zero-eigenvalue dimension 1 | Distinct projectors. |
| §5.4, level/character invariants | C₂ over ℚ₂ versus ℤ₂ | Regular invariants dimension 1 over ℚ₂; sign invariants 0. Integral augmentation on invariants has image 2ℤ₂, not ℤ₂ | Exactness is used only after passing to F. |
| §§5.5/5.10, Cousin degree/classicality | Two Weyl columns r=0,1, q=0 | Total degrees 0 and 1; k=1 permits [0,1], k=2 permits [0,0]; strict endpoint 1<1 is false | Singular cohomology is not collapsed. |
| §§5.6–5.7, vanishing/duality | d=3, lengths 0,1,3 | Cuspidal degree ranges [0,0],[0,1],[0,3]; paired complementary canonical ranges [3,3],[2,3],[0,3] | Cusp/canonical direction agrees. |
| §§5.8/7.3, image and base change | A=F⟨t⟩, multiplication by t | Image (t) has fiber (t)/(t²)≅F; specialized map 0:F→F has image 0 | Interior image is not assumed to commute with arbitrary fibers. |
| §6.1, analytic normalization | Unit c=2 over ℚ₃; genus-two trace | Positive/negative unit scalars 2 and 1/2, pairing product 1; trace exponent 3 gives factor 1/27 | Inverse action and trace division agree. |
| §6.1a, coefficient descent | Quotient of affine plane by ±1, characteristic 0 | Generic degree 2; origin fiber k[x,y]/(x²,xy,y²) has dimension 3 | Arbitrary finite quotient is not flat; regular-target hypotheses matter. |
| §6.5, BGG | SL₂, k=1, polynomials 1,z,z² over ℚ₂ | D² gives 0,0,2; diag(3,1/3) gives 1,9,81 before twist, 1/3,3,27 after twist | Algebraic kernel and twist are distinguished even at p=2. |
| §§6.7–6.8, BGGsafe | Two required lower thresholds 0 and 3 | Slope 2 satisfies the first and fails the second; slope 3 satisfies both | Termwise exclusion uses both proved inequalities. |
| §6.9, bottom-degree projectivity | Ideal (x,y) in F⟨x,y⟩ | Generic rank 1, fiber at origin has dimension 2 | Torsion-free does not mean projective. |
| §6.10, descended coefficients | GSp₄→PGSp₄ and −I | Image of −I is identity in PGSp₄, but its standard H¹ action is −1 | No universal abelian H¹ is silently descended. |
| §§5.2/6.10, supports | Add x outside tube U to allowed Z; related x′ not added | Intersections with U unchanged; support memberships at x,x′ are 1,0 | General support action needs continuation, not direct preservation. |
| §7.1, cohomological eigenvariety | [F —1→ F] with U=1, versus F in degree 1 | Chain Fredholm product (1−X)² but cohomological support empty; degree-one F gives one point | No extra acyclic points; higher degrees retained. |
| §7.3, support structure | Nonzero ideal (t) versus zero image | Ann_A((t))=0 gives whole one-dimensional base; Ann_A(0)=A gives empty support | Support is faithful image support, not the specialization of the image map. |
| §7.5, full dimension | A=F⟨t⟩, B=A[N]/N² versus A/(t) | B free rank 2, minimal prime (N) has dimension 1; A/(t) has dimension 0 and t-torsion | Torsion-free finite support has the claimed dimension; torsion example excluded. |
| §7.6, sharp analytic slopes | Stable ℤ_p-lattice, scalars p and p⁻¹ | Slopes 1 and −1; p preserves the lattice, p⁻¹ does not | Nonnegative bound is a geometric/integral statement. |
| R01, §7.6 degree-zero consequence | Modular k=1 versus k=2 | k=1: excluded chamber set ∅, smallness true for every slope, l_max=1. k=2: l_max=0 and normalized strict bound 1 | Add singleton-id chamber hypothesis; do not infer degree-one vanishing at the wall. |
| §§8.1–8.2, support realization | Formal disc and puncture | Formal H⁰=𝔽₂[[t]]; local-cohomology H¹=𝔽₂[t,t⁻¹]/𝔽₂[t], containing t⁻¹≠0 | Formal completion is not ordinary local cohomology. |
| §8.2, ordinary and rational lattice comparison | U=diag(1,p,0); lattices p^mℤ_p | Ordinary dimension 1 versus finite-slope dimension 2; every lattice rationalizes to ℚ_p, but quotient length is m | Comparisons have the stated rational and slope restrictions. |
| §8.3, family weight inversion | ν(u)=4, then ν=1 | Base-change scalars 1/4 and 1; direct character gives 4 and 1 | Nontrivial weight fixes the family convention; constant weight alone cannot test it. |
| §8.4, all-genus amplitude | g=3,d=6, lengths 0,2,6 | Canonical [0,6],[2,6],[6,6]; cusp [0,0],[0,2],[0,6] | Correct rational ranges, not an integral all-genus assertion. |
| §§8.5/9.3, sharp Siegel bounds | κ=(5,3;−8) | A_w=(0,2;−8),(−2,2;−8),(3,−3;−8),(−5,−3;−8); t₁ pairings 6,6,11,11; t₂ pairings 3,4,4,8 | Subtracting trace exponent 3 gives U₂ bounds 0,1,1,5. |
| §9.2, normalized degree-one check | k=2,0,3 respectively | Degree-zero threshold 1; degree-one threshold 1; dual ordinary bundle weight 2−3=−1 | Strict endpoints and complementary family weight agree. |
| §9.3, symplectic diagonal | p=3, diag(1/3,1/9,1,1/3) | Both antidiagonal products 1/9; printed alternative last entry 3 gives products 1 and 1/9 | Roadmap uses the corrected GSp₄ element. |
| §9.4, height-one tower | p=2,m=1; multiplicative heights 1 and 2 | Primitive generator counts 2^(0)(2−1)=1 versus 2²−1=3 | One-variable Klingen tower differs from full ordinary frames. |
| §9.5, isolated refinement | p=3; Satake labels 1,1,9,9 | Products 1,9,9,81; normalized values 1/3,3,3,27; chosen projector values 1,0,0,0 | Pairing, normalization and primary blocks agree. |
| §9.6, primary localization | F[y]/y² and its residue F | Generalized local block dimension 2; residue tensor dimension 1, with nonzero Tor₁ | Retain nilpotents and derived base change. |
| §§9.6–9.8, BGG operator | k=0,p=3,f=z, U(f)(z)=f(3z) | D(Uz)=3=3U(Dz), but (1/3)U(Dz)=1/3 | Corrected positive power is required. |
| §§9.7–9.8, degree-specific control | r=2,k=0, slope 0 | Degree-zero threshold 1 includes 0; all-degree minimum min(1,−2)=−2 excludes it | Does not substitute all-degree control for the required degree. |
| §9.8, torsion range and trace | p=2, k>p+1; trace at k=0 | First allowed integer k=4; component trace products 16,8,8 divided by 8 give 2,1,1 | Strict torsion range and integral trace calculation agree. |
| §9.9, unitary illustration | n=2, ν=(4,2,0) | Weights (−3,−5,2),(0,−5,−1),(0,−2,−4); canonical [0,2],[1,2],[2,2], cusp [0,0],[0,1],[0,2] | Conversion and complementary degrees agree. |

The domains were checked before applying degenerate tests. Genus zero is outside the declared Siegel datum; analytic coefficients are characteristic zero, so an inseparable characteristic-p coefficient field is not admitted there. Integral coefficients include nonreduced rings and p=2. Torus quotient groups are abelian; S₃ is not an input to the finite-abelian group-ring theorem, though the ambient reductive groups need not be abelian. Noncompact subgroups do not meet the compact-open level convention. Empty boundaries, zero coefficients and identity correspondences are retained; no division by zero, unrestricted natural subtraction or unmarked isomorphism supplies a headline. A source theorem or a successful elaboration was not substituted for these domain checks.

### Pinned declarations and duplication by object

The following native definitions and their surrounding assumptions were opened at the pins. The six backticked native names used by the README resolve here. Searches for Igusa towers, Klingen complexes and Shimura supported cohomology found no native version of the geometric headlines. Generic algebra, module cohomology, condensed categories and abstract Hecke rings are present and do not supply those missing objects.

| Native object | File at the pin | Boundary of the existing statement |
|---|---|---|
| `Module.End` | `Mathlib/Algebra/Module/LinearMap/End.lean:33` | Endomorphisms of a module; no compactness, topology or geometric realization is part of the carrier. |
| `zpow_sub₀` | `Mathlib/Algebra/GroupWithZero/Units/Basic.lean:402` | Nonzero base is required; the lemma does not authorize division by a nonunit on torsion coefficients. |
| `HasDerivedCategory`, `DerivedCategory` | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74`, line 87 | Abelian category and size conditions; no supported Shimura complex is defined. |
| `CondensedMod` | `Mathlib/Condensed/Module.lean:41`, abelian instance line 43 | Condensed modules, not a scheme-level six-operation formalism. |
| `CondensedMod.IsSolid` | `Mathlib/Condensed/Solid.lean:83`, context lines 74–81 | Solidity predicate with the surrounding finite-type-over-ℤ context, not the analytic-ring localization kernel. |
| Abstract double cosets/convolution | `Mathlib/NumberTheory/HeckeRing/Defs.lean:157`, lines 183, 189 | `HeckeCoset`, `HeckeCosetModule`, `HeckeRing`; these do not construct the coherent geometric action. |
| Existing degree character | `TauCeti/NumberTheory/HeckeRing/Degree.lean:104` | `HeckeRing.deg` is a ring homomorphism, so the repaired degree assignment has an existing algebraic justification. |
| Prime-power double-coset degree | `TauCeti/NumberTheory/HeckeRing/GL2/Degree.lean:54` | `HeckeRing.GL2.degree_diagCoset_prime_pow` assumes p prime and k>0, giving p^(k−1)(p+1); at p=2, k=1,2 this is 3,6. |
| Existing GL₂ multiplication | `TauCeti/NumberTheory/HeckeRing/GL2/MultiplicationTable.lean:551` | `heckeT_prime_mul_heckeTDiag_one_prime_pow` has coefficient p+1 at k=1, giving the relation used to test F03. |

The GL₂ degree and multiplication identities are README Checks, not new acceptance declarations. The owned construction is the integral all-degree supported geometric action, where abstract convolution alone would not prove the relations. In particular, individual derived operators with equal H⁰ action need not commute: E₁₂E₂₁=diag(1,0) and E₂₁E₁₂=diag(0,1) on a degree-one 𝔽₂². The package preserves the geometric convolution obligation.

### Suppliers, current heads and overlap audit

The supplied board-package index was read before making ownership conclusions. Its other packages concern analytic number theory, the Lawrence–Venkatesh method and logic/definability, not these geometric constructions. Roadmap `show` and object-based `grep` searches were used against the supplied open-head index and main. The current `resolve` result had no missing cross-roadmap leads. Its warning that native Lean names were not checked automatically was not treated as a pass: the pin checks above supply that evidence.

Every supplier citation was resolved against the main version or the applicable new-roadmap head. The table names current section witnesses; line numbers refer to the repository README, excluding the tool's one-line extraction header. Existing main-roadmap revisions were not taken as new dependencies.

| Supplier | Resolved sections / witness |
|---|---|
| AdicSpacesPartIII, main | `TauCetiRoadmap/AdicSpacesPartIII/README.md:9136` R3.1; R3.4 line 10053, R3.6 line 10472, R3.8 line 11858. Coherent quasi-Stein and finite-free trace inputs do not already supply the declared Banach extension. |
| AdicSpacesPartIV, main | `TauCetiRoadmap/AdicSpacesPartIV/README.md:5032`, F1.10. Coherent dagger pairing; the complementary-support LB/Fréchet extension remains a gap. |
| AutomorphicBundles, head #1069 | `TauCetiRoadmap/AutomorphicBundles/README.md:911`, §§1.4–1.5, 1.9; §3.3 line 1399; §§5.2–5.4, 5.10; §6.1; §9.1; §11.10 line 4082, §§11.16–11.17; §§12.1, 12.11 line 4928. Bundle, weight, integral-model and individual-correspondence inputs resolved. |
| AutomorphicBundlesPartII, head #1823 | `TauCetiRoadmap/AutomorphicBundlesPartII/README.md:373`, §§2.2, 2.4–2.5; §3.0a line 453, §3.0b; §§3.1–3.3, 3.6, 3.9–3.13; §§5.1–5.2 and §5.13 line 1104. Six operations, torsor flatness, correspondence composition and hyperspecial genus-two relations remain supplier owned. |
| AutomorphicFormsOnReductiveGroups, head #1037 | `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:1083`, §6.7, coherent chambers. |
| CompletedCohomologyPartII | `TauCetiRoadmap/CompletedCohomologyPartII/README.md:967`, §§3.11–3.12, continuous regular functions and dual action; inverse-character convention compared. |
| DeformationAndDerivedPatchingAlgebra, head #1034 | `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:1366`, §§7.1, 7.3, 7.5–7.6, 7.8, 7.10. In particular §7.8 line 1516 supplies completion of derived Hom for bounded finite-free models over a complete Noetherian local ring, compatibly with identity and composition. |
| HodgeTateAndCanonicalSubgroups, head #1084 | `TauCetiRoadmap/HodgeTateAndCanonicalSubgroups/README.md:1370`, §5.1. Its Hilbert construction does not silently supply either the all-genus Siegel or height-one Klingen extension. |
| IntegralHeckeAndGaloisDeterminants, head #1689 | `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:2899`, §2.1; §2.3 line 3024. The finite image is the scalar-linear algebra range, as now used in §4.7. |
| LocallyAnalyticDistributions | `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:2007`, §3.3; §4.16 line 3035 and §4.17 line 3227, projective compact complexes and limit-stage factorization. Generic spectral theory is imported, not rebuilt here. |
| OverconvergentAutomorphicForms, head #1422 | `TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:204`, §0.4; §8.6 line 1467 and §8.7 line 1499. Coefficient descent and finite-flat/projective-Banach interfaces are supplied; supported higher cohomology remains the application here. |
| PELModuli, head #966 | `TauCetiRoadmap/PELModuli/README.md:2380`, M2.8–M2.9; M5.1–M5.2, M5.5–M5.6, ending at line 3703. |
| PadicFamilies, head #1019 | `TauCetiRoadmap/PadicFamilies/README.md:594`, §§0a.24–0a.25; §2a.8 line 1493, §§2a.12, 2a.15–2a.17. The package extends, rather than replans, ordinary finite algebra and spectral infrastructure. |
| PadicMeasuresIwasawaAlgebras, main | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:606`, §1.1; §1.7 line 909. Measure/Iwasawa carriers remain imported. |
| PerfectoidShimuraVarieties, head #1085 | `TauCetiRoadmap/PerfectoidShimuraVarieties/README.md:1479`, §3.13; §4.5; §§6.3–6.10, 6.12–6.15 including §6.13a. §6.4 line 2017 supplies the auxiliary abelian-type route; §6.8 line 2122 and §6.9 line 2147 supply Hecke-compatible period/torsor descent. |
| PhiGammaModulesAndIwasawaCohomology, head #1310 | `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:1256`, §2.7. |
| ResolutionOfSingularitiesCharacteristicZero, main | `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:913`, §6.3. The consumed Cartier separation statement is not restricted to characteristic-zero schemes merely because of the roadmap title. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4452`, §2.20. Cohen–Macaulay duality is consumed from main, without requiring its open revision. |
| ShimuraCompactifications, head #1053 | `TauCetiRoadmap/ShimuraCompactifications/README.md:690`, §0.14; §4.10, §§6.16–6.17, §§7.19–7.21, §7.29 line 2904. Integral toroidal and cone-refinement inputs resolved. |
| ShimuraData, head #1038 | `TauCetiRoadmap/ShimuraData/README.md:528`, §§3.8, 3.10, 3.13; §§5.5–5.6, 5.10–5.11. §5.5 line 1168 fixes the symplectic coordinate convention used in the t₁ calculation. |
| SolidAnalyticRings, head #1458 | `TauCetiRoadmap/SolidAnalyticRings/README.md:715`, §§7.2–7.4, with §7.3 line 745 and §7.4 line 787. The two precise comparison/kernel extensions remain declared gaps. |
| LieHighestWeight, main | `TauCetiRoadmap/LieHighestWeight/README.md:405`, Layer 3. Algebraic Verma/PBW input is distinct from the locally analytic BGG construction here. |
| SmoothRepresentationsOfLocalGroups, head #1688 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:667`, SR.0.2; SR.1.4 line 1445 and SR.4.5 line 3597. |

Additional endpoints were opened explicitly: PadicFamilies §§0a.25 and 2a.15–2a.17 distinguish derived ordinary-factor independence, chain Fredholm products and cohomological annihilator support. AutomorphicBundlesPartII §§3.2, 3.12–3.13 and 5.1–5.2 distinguish individual operators from an algebra action, completion from local cohomology, and PEL subcanonical vanishing from its requested extension. SmoothRepresentationsOfLocalGroups SR.1.4 requires compact-open levels; this agrees with BP-Hida's definition at line 2750. Its SR.4.5 Satake convention retains the central similitude and root pairing. No consumed section disappeared or supplied less than the stated input after accounting for the declared gaps.

The overlap record lists no conflicting heads modifying this package, dropped cited IDs, package IDs dropped despite external citations, or IDs available only in an unnamed open revision. Its closest roadmaps were read by scope and ownership:

- AutomorphicBundlesPartII #1823, `TauCetiRoadmap/AutomorphicBundlesPartII/README.md:453` and line 737: generic enhanced coherent operations and all-degree individual Hecke maps, with convolution separately owned there. This package consumes them and constructs their supported Hida/Coleman realization.
- OverconvergentAutomorphicForms #1422, `TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:1467` and line 1499: coefficient descent and projective Banach interfaces, distinct from the supported higher family cohomology here.
- PerfectoidShimuraVarieties #1085, `TauCetiRoadmap/PerfectoidShimuraVarieties/README.md:2017` and line 2122: abelian-type perfectoid/period descent, with the classical-flag affinoid extension explicitly requested as a gap here.
- GSp4NonregularModularityLifting #1817, `TauCetiRoadmap/GSp4NonregularModularityLifting/README.md:7` and line 11: a lifting consumer of higher-Hida chambers and singular control, not an independent owner of the general comparison theorem.
- AlgebraicModularFormsAndSerreWeightsPartII #1822, `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeightsPartII/README.md:17`: full-frame algebraic function coefficients and their marked Klingen comparison, distinct from the height-one partial-ordinary cohomological interpolation here.

The object search included ordinary Igusa towers, partial-ordinary coefficients, supported coherent cohomology, analytic BGG and compact-stage factorization. Generic spectral constructions remain with PadicFamilies/LocallyAnalyticDistributions, root/PBW theory with its earlier owners, and six operations with AutomorphicBundlesPartII and the solid/adic suppliers. No double ownership or mutual handoff was found among the inspected heads. There are no own Lean declarations whose fully qualified names could collide.

The requested dependency check produced exactly:

```text
depcheck: 237 roadmaps, 2159 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Every Needs line and supplier contract was also read; the mechanical result alone was not used to infer mathematical ownership.

### Declared supplier contracts

All nine slugs agree between `design/plan.json` and the README's Exact supplier contracts. Each names an owner, specifies the missing extension and its geometric/coefficient setting, and has a genuine residual requirement beyond the supplier's present text. The compatibility clauses belong to single interfaces rather than unrelated projects. None has supplier `none`, and none asks for an object already furnished by this package or the pins.

| Gap | Owner / residual interface |
|---|---|
| solid-localization-kernel | SolidAnalyticRings §§7.2–7.3: relative polynomial analytic kernel, localization triangles and specified vanishing tensor. |
| discrete-adic-solid-comparison | SolidAnalyticRings §§7.3–7.4: discrete-adic locales and countable completion/localization diagrams with their derived tensors and limits. |
| siegel-ordinary-igusa | HodgeTateAndCanonicalSubgroups §5.1 continuation: polarized ordinary Siegel towers in all genera, including cofinal p=2 levels and the stated reductions/quotients. |
| klingen-height-one-igusa | Same supplier's height-one continuation: p-rank-at-least-one locus, ℤ_p× torsor and affine étale nonfinite transitions. |
| abelian-affinoid-basis | PerfectoidShimuraVarieties §§3.13, 6.8: abelian-type classical-flag affinoid basis with finite-level and toroidal comparisons. |
| projective-banach-cohomology | AdicSpacesPartIII §§R3.4, R3.6: finite quasi-Stein covers with locally projective Banach coefficients, countable projective models, compact restrictions and the stated lattice/torsion comparisons. |
| banach-support-duality | AdicSpacesPartIV §F1.10: complementary-support LB/Fréchet pairing over finite extensions of ℚ_p, with Ω^d and finite-slope perfectness. |
| coherent-correspondences | AutomorphicBundlesPartII §§3.3, 3.6, 3.10–3.12 on §3.0a: both partial-support orders, comparison, support-change, composition/base-change compatibility and twist-limit formulas. |
| abelian-subcanonical-vanishing | AutomorphicBundlesPartII §5.2 continuation: abelian-type toroidal-to-minimal subcanonical vanishing with locally trivialized projective Banach coefficients and bounded-torsion reductions. |

These are declared contracts, not unowned prerequisites. This verdict is needs changes for R01, so no conditional-acceptance field is asserted.

## Not verifiable

- No cited text was inaccessible. All source checks use the editions recorded in the manifest; differently paginated publication versions were not independently certified. No missing-reference request is needed.
- The nine supplier extensions are not present proofs to test. Their ownership, hypotheses, minimality and declarations were checked, not their future implementations.
- The geometric headlines cannot be elaborated at these pins because their carriers are absent. The passing empty acceptance file is accurately reported as such; it is not evidence that the geometric statements have been formally proved.

## Source issues

These are source issues, not additional package findings where the roadmap already corrects the mathematics. The reduction-index misprint below does not occur in the package's formula.

- **Error** in BP-Hida at Remark 4.3.12, printed page 48: the source says the comparison scalar is a pure power of p for arbitrary positive torus elements; it should retain the character evaluated on the unit part; affects a stated result.
- **Gap** in BP-Hida at Remark 5.4.3 and Theorem 6.2.15, printed pages 57 and 64: the source says inverse-character specialization agrees with a family base change without specifying its character map; it should specify inverse-character evaluation for the regular action; affects a stated result.
- **Misprint** in BP-Hida at Proposition 6.2.13, printed page 63: the source says the coefficient reduction is A/p^n in the equality for reduction depth r; it should be A/p^r, as in the following proof; affects a stated result.
- **Misprint** in BP-Coleman at §5.14, diagonal formula preceding Remark 5.14.1, printed page 140: the source says the last diagonal block is p times the identity; it should be p⁻¹ times the identity, giving equal antidiagonal products; affects a stated result.
- **Misprint** in BP-Coleman at Theorem 6.10.2(1), printed page 173: the source says the interior amplitude conclusion uses the strongly-small region; it should use the small region established in the proof; affects a stated result.
- **Gap** in BP-Coleman at Definition 5.11.14 and Corollary 6.8.4, printed pages 134 and 168: the source says coefficient strongly-small exclusion follows with inconsistent shifts and a doubled noncompact-root term; it should derive exclusion termwise from the two twisted analytic bounds; affects a stated result.
- **Misprint** in Pilloni-Singular at §5.1.5 before Proposition 5.1.5.2, printed page 22: the source says the labels satisfy αβ=γδ; it should be αδ=βγ for those labels; affects nothing.
- **Misprint** in Pilloni-Singular at Proposition 13.3.3.1, printed page 90: the source says the target BGG operator is p^(−k−1)U; it should be p^(k+1)U in the contracting convention; affects a stated result.
- **Gap** in Pilloni-Singular at §13.4, printed page 91: the source says spectral-point pullback yields eigenspace cohomology without distinguishing pullback from localization; it should specialize over weight then take the primary spectral component, retaining Tor and nilpotents; affects a stated result.
- **Misprint** in BP-Hida at Introduction §1.1, printed page 2: the source says M_µ is the unipotent radical; it should be the Levi, with the unipotent radical separately denoted U; affects nothing.
- **Misprint** in BP-Hida at Proposition 4.3.17, printed page 49: the source says the normalized algebraic character with a misplaced parenthesis and rho shift; it should be −w⁻¹w0M(κ+ρ)−ρ, retaining the finite character separately; affects a stated result.
- **Misprint** in BP-Coleman at the proof of Theorem 6.4.3, printed page 157: the source says compactness follows using an unresolved lemma reference; it should identify root contraction together with Lemma 6.3.10 and the supported-cover argument of Theorem 5.4.3; affects the proof.
- **Misprint** in BP-Coleman at Definition 6.4.7, printed page 158: the source says the first negative-support inclusion has coefficient-radius index n; it should use geometric depth l there and retain the separate coefficient-domain condition; affects a stated result.
- **Misprint** in BP-Coleman at Proposition 2.7.3, printed page 32: the source says an already derived supported complex receives another shift and uses Ω¹ in top-degree duality; it should omit that extra shift and use Ω^d; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "8ed7a1730bd3672cd8020fc9a420773bc5a60689", "job": "REV-PKG-HigherHidaAndColemanTheory~5", "model": "gpt-6-astra", "worker": "chris-8"} -->
