<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1576#issuecomment-6420621897 -->
Red team round 2 pass a (codex) of 53d8650

Verdict: needs_changes

1. **F01** (P2) Finite-field Chern isomorphism includes rank zero

   **Location:** `packages/SymplecticReidemeisterTorsionModSquares/README.md:698`: “For every odd finite field it is the finite-rank K-theoretic isomorphism.” The section starts at line 690 with unrestricted rank 2r.

   **Claim:** The Chern transformation of §3.6 is an isomorphism at every permitted rank over an odd finite field.

   **Witness:** Set r=0 and R=𝔽₃. Sp₀ is trivial, so H₃(BSp₀;ℤ)/2=0. But H¹(𝔽₃,μ₂)=𝔽₃ˣ/𝔽₃ˣ² has two elements, represented by 1 and −1. The zero map is not surjective.

   **Exact repair text:** Replace the API bullet by “For every odd finite field and every positive symplectic rank r≥1, this map is the finite-rank K-theoretic isomorphism. At r=0 its source is zero and it is the zero map.” Add the rank-zero 𝔽₃ calculation as a negative-control Check. Keep the transformation itself defined in rank zero. The repaired assertion gives the correct map 0→C₂ in the refuting instance.

2. **F02** (P3) The cochain-locator repair produced nonexistent subsection numbers

   **Location:** `packages/SymplecticReidemeisterTorsionModSquares/README.md:499`, also lines 513 and 854: “AlgebraicTopology Stages 6.1–6.4.1.”

   **Claim:** This is a resolved range of supplier sections.

   **Witness:** `TauCetiRoadmap/AlgebraicTopology/README.md:1018` supplies cellular cochains in Stage 6 item 1; item 4 contains `compactTriadPoincareLefschetz` at line 1534. There is no Stage 6.4.1. The repaired contract itself correctly identifies 6.1.

   **Exact repair text:** At lines 499 and 854 replace “AlgebraicTopology Stages 6.1–6.4.1” by “AlgebraicTopology Stage 6.1”. At line 513 replace it by “AlgebraicTopology Stages 6.1–6.4”, retaining the duality used when transporting the pairing through subdivision. The rank-two genus-two computation still has cocycle dimension 6, principal dimension 2 and quotient dimension 4.

3. **F03** (P2) The Wang supplier contract adds a coefficient extension

   **Location:** `packages/SymplecticReidemeisterTorsionModSquares/README.md:55`: “the Wang cone for a mapping torus with a chosen coefficient intertwiner”; also §4.6's Needs at line 833.

   **Claim:** AlgebraicTopology Stage 5 supplies the Wang identification with the chosen local-system intertwiner already incorporated.

   **Witness:** `TauCetiRoadmap/AlgebraicTopology/README.md:868` states the homological endomorphism id−f_* and commuting monodromies. It supplies no coefficient intertwiner. For f=id and coefficient map −I, the required map is 2I, whereas id−f_* on untwisted coefficients is zero.

   **Exact repair text:** Replace that supplier clause with “Stage 5 supplies the ordinary mapping-torus Wang cone and finite-cover transfer. Section 4.6 constructs the local-coefficient Wang comparison, including the specified intertwiner, from Stage 6.1's natural local-coefficient Mayer–Vietoris sequence.” Add “AlgebraicTopology Stage 6.1” to §4.6's Needs and explicitly retain that comparison as part of §4.6. This uses its existing two-cylinder proof, rather than asking for a new supplier construction. For f=id and intertwiner −I on four-dimensional surface cohomology, its differential becomes 2I, its kernel has dimension zero, and the false zero differential is excluded.

4. **F04** (P3) Two Checks merely repeat their definitions

   **Location:** `packages/SymplecticReidemeisterTorsionModSquares/README.md:850`: “φ(g⁻¹)=−ρ(g)⁻¹φ(g)”; also line 367, “Any complex whose nonzero terms are K² is strongly even, independently of its differential.”

   **Claim:** These serve as discriminating Checks of the cocycle and strongly-even definitions.

   **Witness:** The first repeats line 837 without an instance; the zero cocycle satisfies both omitted-factor alternatives. The second repeats the term-rank definition at line 351. Neither computes a value distinguishing a wrong construction.

   **Exact repair text:** Replace the first with “Over ℚ take a₁=a₂=b₂=I₂, b₁=diag(2,1/2), φ(b₁)=e₁ and the other generator values zero. Then φ(b₁⁻¹)=−e₁/2; omitting the minus sign gives e₁/2 and omitting the inverse gives −e₁.” The relator is I₂ and its cocycle value is zero, so this is a valid instance with b₁−1 invertible. Delete the second Check; the other three Checks of §1.4 already give zero ranks, odd acyclic terms, and even terms with odd cohomology. If a replacement is desired, use “K² in degree −1 has Euler characteristic −2 and even term rank 2; replacing integer degree signs by natural-number subtraction gives +2.”

## Earlier findings: verification at this head

Locations in this table are in `packages/SymplecticReidemeisterTorsionModSquares/README.md` unless a source or supplier is named. The identifiers distinguish the two previous passes. The previous repair report's settled disposition is respected; none of the findings above re-raises a settled finding.

| Previous finding | Status and repaired passage | Recomputed witness |
|---|---|---|
| r1a F01, Darboux/Lagrangian sign | Repaired. Line 463: “ν_L=(−1)^r times this Darboux volume”; line 470: “their square classes differ by [(−1)^r]”; line 478 adds §1.8. | With ω(e,f)=1, q(f)=−e*, so L=Ke gives −e∧f. L=Kf also gives −e∧f. Darboux gives +e∧f. At r=0 the ratio is 1; at r=2 it is +1. The cellular normalization stays Darboux. |
| r1a F02, nonfree projectives as standard group labels | Repaired. Line 27: “a fibre identified with the standard free symplectic module”; §3.7 reserves arbitrary projectives for §3.5. Line 684: “P has no global frame.” | For the tangent-plane module of the real algebraic sphere, a frame would trivialize TS². Its constant S³ system has normalized value 1, but no standard-free representation label. Over a field every symplectic fibre has a frame. |
| r1a F03, geometric realization of twists | Repaired as a declared contract, conditional on its implementation. Line 67 declares `gap:marked-surface-twists`; line 858: “Realize T₁,…,T₅ by orientation-preserving smooth Dehn twists”; line 871 consumes the gap. The repair report's “not actionable in this package” disposition is accepted because this prerequisite is now a declared supplier obligation. | Free-word reduction gives T₁,T₂,T₄,T₅(R)=R and T₃(R)=(a₂⁻¹a₁⁻¹)R(a₁a₂). Reversing the ordered handles as stated gives R⁻¹. Exact Q(i) arithmetic gives four zero intertwining residuals, while reversed composition has nonzero b₂ residual. Algebra does not by itself certify geometric realization. |
| r1a F04, impossible dimension-four perfect example | Repaired. Line 573: “the zero skew-symmetric dimension-four pairing”. | For C=K²[0], D has terms in degrees −1 and 4. χ(C)=2, χhalf(D)=−2, so the displayed half-sum is 0 and r=0. No nonexistent degree-four perfect self-pairing is asserted. |
| r1a F05, cellular-cochain supplier | Partly repaired. Line 55 now says “Stage 6.1: local-system cellular cochains and their singular comparison”; line 839 derives crossed homomorphisms locally. Three Needs lines contain the malformed replacement reported in S02. | AlgebraicTopology Stage 6.1 supplies the cellular presentation. For genus two and rank two, b₁−1 invertible makes the relator coefficient rank 2; cocycles have dimension 8−2=6, principal cocycles dimension 2, quotient dimension 4. |
| r1b F01, nonexistent consumer | Repaired. Line 15: “The arithmetic application to central values … is outside this roadmap’s ownership.” The final consumer discussion names no fictitious supplier or roadmap. | The final torsion identity remains a theorem for all indicated three-manifolds; the Gaussian value is [2] and the constant S³ normalized value is 1 without an arithmetic-L-function consumer. |
| r1b F02, compound supplier requests | Repaired. Line 97 now separately requires “prove β_et(c₃₁(z))=c₂₂(β_G z) for every z∈H₃(G;𝔽₂)”; lines 95/97 separate real components from compatibility; 105/107 separate dyadic rank from reduction; 119/121/123 separate detection, nonsplit weight and residue-order counting. All fourteen slugs match the plan. | Real β(t)=t² is a different map from identifying c₂₂. A rank lower bound does not imply injectivity of coefficient reduction. At dimension d=2 the total normalized point weight is 1/2, while the pointwise count bound is of order q; the contracts now distinguish those assertions. |
| r1b F03, Dirichlet residue class | Repaired. Lines 33 and 1065 name `Nat.forall_exists_prime_gt_and_eq_mod`; line 1057 says “Choose r>N in the unit class 1+h modulo 2h”. | For even h, gcd(h+1,2h)=1. At h=4, primes 5 and 13 give odd quotient indices 1 and 3; 17 gives index 4 and kills complex conjugation. The latter is excluded by the repaired congruence. |
| r1b F04, duality section | Repaired. Line 55 says “Stage 6.4: Poincaré–Lefschetz duality, including `compactTriadPoincareLefschetz`”; the boundary gap's plan section is Stage 6.4. | The native supplier target is at AlgebraicTopology line 1534. For an interval the boundary coefficients are −1,+1; Stage 6.3 alone supplies orientation classes, not this relative-duality comparison. S02 concerns separate cochain references. |
| r1b F05, source locators | Repaired. §1.4 now quotes the locator “Appendix B.4.1, pp. 73–75, line 3415”; §§1.4–1.8 cite AV-v1 lines 3415, 3427, 3498/3513/3526, 3565/3583 and 3588; §2.7 cites 3653/3675; §2.3 cites 3766; §4.1 includes 3854; §7.6 cites equation (1.5), line 94; JRV Lemma 6.1 is line 855. | Each cited definition/equation was read at the new location. Signs n=0,…,4 are +,+,−,−,+; scalar complex 2 gives acyclic volume 1/2; the symplectic-plane volume ratio is −1; rotation spinor class is [2]. The updated locators support these values, subject to the source errata recorded below. |

## Verified sound

Read all 1251 README lines and all 57 Lean lines, the repository README and CONTRIBUTING rules, both previous reviews and their repair dispositions. The inventory is **1 Lean theorem, 0 local definitions/instances, 60 numbered README targets, 87 subsidiary API assertions, 189 target Checks and 9 convention/supplier Checks**. The README has no additional bold theorem blocks: its bold labels are Summary, Checks and the three reference keys. The summary's end theorem is included in the headline inventory and sampled computations below. All 198 Check bullets were compared with their definitions and the computed examples; S04 records two nondiscriminating bullets.

The sixty numbered target citation blocks and all 77 distinct line anchors (74 AV-v1, 2 JRV, 1 Thom) were resolved against the three legal cached works, including the repaired page/equation locators. Twelve named roadmap supplier groups, their cited sections, and fourteen gap contracts were inspected. The supplier failures found are S02 and S03. Source errors were distinguished from package assertions: the package already corrects many of them. These checks are finite stress tests and source comparisons, not formal proofs of all target theorems.

### Lean declaration and headline inventory

The supplied elaborated-signature transcript was compared with the declaration and §4.1; no binder disappeared. No new Lean command or build was run. The theorem's namespace is `TauCetiRoadmap.SymplecticReidemeisterTorsionModSquares`. Its only imports are `Mathlib` and the actually used pinned spinor-norm module. There is no `set_option`, `lemma`, sorry-valued data, placeholder predicate, hypothesis containing its conclusion, auxiliary API catalogue, or padding declaration.

| Declaration / section | Full variable and instance context | Instances and computed sides | Result / change |
|---|---|---|---|
| `zassenhaus_primary_formula`, Suggested.lean:40; §4.1 | K,V arbitrary type universes; Field K; Invertible(2:K); AddCommGroup V; Module K V; FiniteDimensional K V; Q:QuadraticForm K V; hQ:Q.Nondegenerate; A in the full orthogonal group. t=A+id, Vminus=ker(t^finrank V), U=range(t^finrank V); arbitrary native basis b of Vminus and invariance witness hU. D is unsigned associated-form determinant times det(t/2 on U); conclusion includes D≠0 and equality in the multiplicative square-class group. | Zero space: t⁰=id, both empty determinants 1, spinor 1. Q=3x²,A=−1: D=3, spinor [3]. I₂ rotation: D=1/2, spinor [2], ratio 1/4 a square. Hyperbolic plane A=−1: both [−1]. Reflection in e₁+e₂: both [2]. S₃ three-cycle: D=1/4, spinor [2]²=1. Q₈ commutator −I₄: D=1, spinor 1. A basis rescaling by 2 multiplies D by 4. | No refuting instance. All required instances appear in the elaborated type. hU is stable-image invariance, not a disguised spinor hypothesis. The full primary formula is absent at the pins and is not a one-lemma restatement. Keep. |

| README headline | Acceptance-test disposition |
|---|---|
| Strict splitting and locally constant parity (§§0.6–0.7) | Named in the module docstring; the signed finite-projective Poincaré carrier and its normalization are missing. |
| Boundary sign, normal extension, normalized specialization (§§2.7–2.8, 3.4–3.5) | Named; signed cellular torsion and determinant-root comparisons are missing. |
| Low-degree labelled bordism and even symplectic semicharacteristic (§§3.1–3.2) | Named; labelled smooth bordism and twisted finite cellular duality are missing. |
| Full Zassenhaus primary decomposition (§4.1) | Stated on native carriers by the sole theorem. |
| Circle, mapping-torus and Gaussian torsion (§§4.4, 4.6, 4.8) | Named; signed torsion is missing. The exact Gaussian matrix calculations do not replace the geometric theorem. |
| Chern-liftable rank, transfer and density-one goodness (§§5.3–5.4, 6.5) | Named; Chern slant and normalized torsion transformations are missing. |
| Universal comparison, topological theorem and mapping-class identity (§§7.4–7.6) | Named; universal equivariant Chern slant and signed torsion are missing. |
| Real metaplectic identification and full-mod-two vanishing (§§8.1–8.2) | Named; real Chern components and Bockstein comparison are missing. |

### Sampled adversarial computations

These 22 retained rows cover boundary cases, signs, specialization, the four findings and the arithmetic comparisons. K has characteristic different from two unless an excluded characteristic-two control is given; R has two invertible, and family rows require a nonzero normal domain. “Retain” records no refuting instance, not certification of a future proof. The exhaustive per-target and subsidiary assertion ledgers are omitted from this shortened report.

| Target | Instances and computed values on the relevant sides | Result / change |
|---|---|---|
| §0.2 Symmetric Poincaré complex | Hyperbolic cross adjoint is an isomorphism. A nonzero contractible K→K with zero pairing has H=0→0 but zero component adjoints, so Poincaré=true, strict=false. Shifting (ε,n)=(−1,3) gives (+1,1). | Retain. |
| §0.6 Parity | Rank-one d=0: χ≤0=1, lower rank=1. Rank-two d=J: χ=0, lower rank=2, difference=2. d=sJ has fibre values 0 and 2, both parity 0. Over F₂, rank-one d=1 has χ=0 versus lower rank 1: excluded. | Retain two-invertible hypothesis. |
| §1.3 Reverse wedge | Dimensions 0,1,2,3,4 give exponents 0,0,1,3,6 and signs +,+,−,−,+. At m=n=1 the sum sign −1 equals (+1)(+1)(−1). | Retain. |
| §1.4 Strong evenness | Zero has all ranks 0. Acyclic K→K has H ranks 0 but term ranks 1. diag(1,0):K²→K² has term ranks 2 but H ranks 1. Shifting K²[0] to degree −1 changes χ from 2 to −2, both even. | Retain definition; remove repeated Check as S04. |
| §1.8 Lagrangian class | Generator multiplied by 2 scales square image by 4. Two odd roots give extra −1. In ω(e,f)=1 the two coordinate lines both give −e∧f, whereas Darboux gives +e∧f. | Repaired r1a F01; retain. |
| §2.1 Symplectic volume | At r=0 volume=1. At r=1 Darboux=e∧f, Lagrangian=−e∧f. At r=2 ratio +1. Rank 6 over F₃ has nonzero ordered wedge although 3!=0. Change of symplectic basis has determinant 1. | Retain. |
| §2.7 Three boundary volumes | C=0: a=b=c=1,r=0. C=K²[0] with zero dimension-four pairing: χC=2, χhalf D=−2, half-sum 0. Middle acyclic J block has determinant 1 but root ratio −1 with r=1. C=K² in degree 3 gives half-sum −2 and actual r=0, equal modulo 2 only. | Retain repaired congruence and zero pairing. |
| §3.4 Raw extension | Over Q[s]_(s), 1+s gives an étale unit torsor, with special value 1; s has odd valuation 1 and is ramified. Root rescaling by 2 multiplies scalar by 4. Orthogonal H⊕H family has generic raw [−(1+s)] and special raw 1. | Retain generic extension without raw specialization claim. |
| §3.5 Normalized families | In that circle family generic h=2, raw −(1+s), so normalized 1+s; special h=4, raw 1, so normalized 1. Constant symplectic rank-two S³ normalizes (−1)(−1)=1. Nonfree tangent module of S² likewise gives normalized constant-system value 1. | Retain arbitrary finite projectives here. |
| §3.6 Chern transformation | Zero cycle→1. Positive-rank F₃ generator→[−1]; F₅ generator→[2], with [−1]=1 there. At r=0, source 0 but target over F₃ has cardinality 2. For C₂×C₂ the UCT extra H₂[2] has cardinality 2. | S01: restrict isomorphism to positive rank. |
| §4.6 Mapping torus | T=I₄: h=4,θ=1,raw 1. char T=x⁴+1: det(1−T)=2,h=0,θ=[2]. Hyperbolic unipotent F₃ example: fixed-space Gram determinant 0, generalized-primary discriminant 1. f=id with intertwiner −I: 1−T=2I, kernel 0. | Retain formula; S03 assigns twisted comparison correctly. |
| §4.7 Cocycle quotient | Rank two: 8 generator coordinates−2 independent relator equations=6 cocycles; principal rank 2; quotient rank 4. Explicit b₁=diag(2,1/2),φ(b₁)=e₁ gives φ(b₁⁻¹)=−e₁/2, not e₁/2 or −e₁. For commuting M=diag(3,1/3), principal v=e₁ maps to v/3. | S02 locator; S04 numerical inverse Check. |
| §4.8 Gaussian witness | Both relators evaluate I₂; all eight generator intertwining residuals are zero. First 6-space polynomial x⁶+x⁴+x²+1, det(1−T̃)=4, principal det=2, quotient x⁴+1, ratio 2. Second polynomial (x²+1)³, determinant 8, quotient (x²+1)², ratio 4. Reversed first composition gives b₂ residual [[1−i,1−i],[−1−i,1+i]]. | Retain. Exact rational Gaussian computation and free-word reduction reproduced these values. Geometry remains the declared gap. |
| §5.5 Weighted control | Nonidentity C₂ subset density 1/2. Empty subset has size 0 and is excluded. Finite singleton contribution ≤log(3)/X→0. Degree≥2 contribution O(log X/√X)→0. Alternating dominating blocks have two lower densities 0 but union density 1. | Retain upper-density-zero definition. |
| §5.7 Composita | Equal quadratics: compositum group size 2, diagonal image inside product size 4. Disjoint quadratics: union of nonidentity inverse images size 3/4. One empty subset leaves the other; two empty subsets give size 0. | Retain individual projections, not product surjectivity. |
| §6.3 Cyclic auxiliary field | h=4,r=5 and13 give (r−1)/h=1,3 and nontrivial conjugation. r=17 gives 4 and trivial conjugation. For even h the allowed residue h+1 is coprime to 2h. | Retain corrected congruence. |
| §6.4 Density improvement | δ=1/2,h=8,N=4: gain 7/128≥δ³/16=1/128. δ=1/4,h=12,N=6: gain 5/256≥1/1024. δ=0 admits no finite h in the displayed minimum and already means density 1. | Retain δ>0 condition. |
| §7.1 Characteristic zero | Spec Z[1/2]:d=1, total weight~Q. Affine line over it:d=2, degree-one weight~Q²/2. Bad-prime weight o(Q) gives Q^(d−1)o(Q)=o(Q^d); higher powers give O(Q^(d−1/2)log²Q)=o(Q^d). | Retain positive lower bound, not universal limit 1. |
| §7.2 Witt lift | Sp₂(F₃) has order24, Sylow order8,index3; transfer composite 3≡1 mod2. In F₃,8⁻¹=2. In F₂,8=0, so averaging impossible. Zero class lifts as zero. | Retain odd characteristic and mod-two quotient. |
| §7.5 Topological theorem | S³ rank2: χhalf2,raw−1,N1,Chern1. Gaussian mapping torus:χhalf0,N=[2]=Chern. Two copies:[2]²=1 and doubled integral cycle; empty manifold:1. | Retain. |
| §8.1 Metaplectic component | Positive rank kernel Z→Z/4→Z/2 sends1→1→1; coefficient Bockstein0. Rank0 has π₁=0,notZ and is excluded. On C₂ the reduction of integral H² generator is t²≠0 but β(t²)=0. | Retain precise real contracts. |
| §8.2 Real vanishing | H*(C₂;F₂)=F₂[t], β(t)=t²≠0 and is an isomorphism in degrees1→2. A hypothetical c₃₁=t contradicts zero paired group Bockstein. Zero cycle gives0 (square class1). For C₂×C₂, H₂(Z)[2]=C₂, so integral-cycle vanishing leaves an extra summand. | Retain full-mod-two proof. |

The excluded-domain tests are substantive: q=1 is not a finite field; q=2 and characteristic two fail the two-invertible hypotheses; zero rings occur only in the ring linear algebra, not in the field or normal-domain families. For Q[ε]/ε² the differential εJ has zero residue differential and residual H⁰ dimension 2, while the nonreduced base is excluded from the family theorem. A purely inseparable extension F₃(t)→F₃(u), t↦u³, sends [t] to [u³]=[u], since the quotient is u². Empty index sets give determinant 1, Fin 0 has no basis entries, and the stable exponent at dimension zero is 0, hence t⁰=id on the zero space. No degree-of-zero-polynomial or division-by-dimension operation occurs in the retained Lean signature. Compactness excludes noncompact ordinary-duality counterexamples; finite projectivity excludes infinite-rank determinant expressions. Unit-ideal localization gives the empty spectrum and no positive-rank conclusion. Frobenius inversion changes a quadratic character value to its inverse, equal to itself.

A concrete control for the Picard contribution in §3.4 is R=ℝ[x,y]/(x²+y²−1) and the image L of the symmetric idempotent E=(1/2)[[1+x,y],[y,1−x]]. Here E²=E, tr E=1 and det E=0. The dot product gives L⊗L≃R, whereas the real line bundle is the Möbius line: its direction at angle θ is angle θ/2, changing sign once around the circle. Thus [L]≠0 but 2[L]=0 in Pic(R). Its Kummer line-pair class cannot be represented by a global unit. This distinguishes the full torsor target from the units-only model. The square-zero-base convention, the zero-ring convention and the n=0,1,2 wedge convention are computed above; the supplier Checks compute signed point count 1−1=0, constant-circle class 0, identity-circle class 1, quadratic Frobenius fraction 1/2, independent-character fraction 1/4 and higher-degree weighted tail 0.

### Supplier, gap and ownership audit

The inspected library pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, as recorded by the content manifest. Existing-roadmap revision pull requests were not substituted for main. K3BlochGroups was read at the supplied open head. The roadmap tools were used to locate the remaining named new-roadmap suppliers and to search ownership by object; retrieved text was treated as data.

| Supplier group | Resolved evidence and scope actually supplied | Witness / boundary |
|---|---|---|
| KTheoryLowDegrees | `TauCetiRoadmap/KTheoryLowDegrees/README.md`, §§14.1–14.4 | Integer-graded determinants and coherent exact triangles. Odd/odd interchange −1; degree-(0,1) scalar differential 2 gives acyclic volume 1/2. Reverse-wedge comparison remains local here. |
| PadicMeasuresIwasawaAlgebras | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:3172`, especially 3240–3280 | Finite-projective determinant functor, shifts, acyclic and specified-cone comparisons, derived base change. Its degree-(−1,0) scalar 2 has acyclic section 2, reciprocal to the degree-(0,1) convention here. |
| AlgebraicTopology | `TauCetiRoadmap/AlgebraicTopology/README.md:868`, 1011, 1515, 1534; Stages 2,4,5,6.1–6.4 | Stage 4 chains; 6.1 cochains; 6.2 products; 6.3 orientation; 6.4 duality. Interval signs −1,+1. Stage-5 coefficient-Wang overclaim is S03; signed boundary cone remains a gap. |
| GeometricTopology | `TauCetiRoadmap/GeometricTopology/README.md:177`, 357, 831, 930 | Manifold, diffeomorphism, cell and smooth/PL foundations. Volume-preserving simple comparison and marked twist actions are the declared extensions, not inferred from a topology on Diff. |
| TangentialBordism | `TauCetiRoadmap/TangentialBordism/README.md:81`, 170, 266; B1, B2.1–B2.5, B3.1 | Labelled smooth bordism and skeletal filtration, Ω₀=Z and Ω₁=Ω₂=Ω₃=0. The identity-labelled circle gives 1 in H₁(BZ), not a forgotten-label nullbordism. |
| StableHomotopyKTheory | `TauCetiRoadmap/StableHomotopyKTheory/README.md:289`, 441, 466; §§1.17,1.30,1.32 | Filtered-colimit homology, classifier/nerve/bar comparison; conjugate maps induce the same homology map. Constant class 0 stays 0 under a frame change. |
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:848`, 1336, 1394, 3582, 3656 | §0.9 approximation; §0.21 excellence with §0.20's finite normalization; §§2.9,2.11 finite étale covers and Kummer line pairs. Unit 1+s is étale; valuation-one s is ramified. Generic full faithfulness is a gap. |
| KTheoryFiniteLocalFields | `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:254`, 303, 327; §§1.5,1.8,1.9 | Restriction/transfer and finite Chern classes; the finite-rank isomorphism explicitly has r≥1. H₂(SL₂F₉) has order3, hence 2-torsion0. Restriction multipliers 10,26 vanish modulo2. |
| K3BlochGroups | `TauCetiRoadmap/K3BlochGroups/README.md:471`, 504, 1685, 2256; §§2.4–2.5,4.20,6.7 | Stable Hurewicz and finite-coefficient comparison. Rational orders48→24 leave kernel2. Unstable SL₂ and dyadic rank/reduction require their three declared extensions. |
| Chebotarev | `TauCetiRoadmap/Chebotarev/README.md:245`, 452, 590; Layers7,11.3,13 | Number-field weighted density, cyclotomic irreducibility and negligible tails. Density1/2 for a quadratic nonidentity class. Arithmetic-scheme detection and estimates are separate contracts. Dirichlet's desired residue class comes from the pin. |
| RepresentationTheory/LieGroups | `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:358`, Layer5 | Universal covering group with discrete central kernel π₁. Identifying positive-rank symplectic π₁ with Z is a gap, not a consequence of connectedness alone. |
| MetaplecticAutomorphicForms | `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:477`, §2.4b | Real double cover with central μ₂, including zero-dimensional case. Positive-rank cover is nonsplit; its Chern interpretation is not supplied there. |

The following fourteen slugs occur identically in the plan's top-level gaps and the README contracts, with named suppliers and matching needs. No gap has supplier `none`. They are precise extensions of the cited suppliers; their absence from implemented libraries is not a finding. The split contracts are not recombined during this review.

| Gap slug | Supplier / section | Precision and minimality control |
|---|---|---|
| smooth-cell-comparison | GeometricTopology Layer11 and smoothing comparison | Adds boundary dual cells and simple maps preserving local-coefficient volumes; rank-two elementary attaching determinant1. General smooth triangulability alone does not identify that determinant. |
| marked-surface-twists | GeometricTopology Layer3 | Adds marked word/geometric compatibility with oriented exponent +1; R versus R⁻¹ separates orientation. |
| poincare-boundary-cone | AlgebraicTopology Stage6.4 | Adds chain-homotopy-compatible signed comparison, not just an isomorphism of cohomology groups; interval endpoints −1,+1. |
| normal-torsor-gluing | SchemeAndStackFoundations §§2.9,2.11 | Generic isomorphisms of existing finite étale covers extend; it does not assert extension of the ramified s-torsor. |
| unstable-sl2-chern-lift | K3BlochGroups §§2.4,4.20 | Unstable integral H₃(SL₂)→K₃ind is not the stable rational Hurewicz isomorphism; rational kernel order2 distinguishes them. |
| dyadic-number-field-chern-rank | K3BlochGroups §§2.5,6.7 | Surjection with at least r₂ independent mod-two classes: Q(i) lower bound1. |
| dyadic-number-field-chern-reduction | K3BlochGroups §6.7 | Injectivity of reduction is separate from the preceding rank assertion; a zero reduction on a rank-one group would fail it. |
| witt-sylow-lift | KTheoryFiniteLocalFields §1.9 | Compatible integral lifts of finite Sylow representations, beyond degree-three comparison; order8 is invertible in odd residue characteristic and zero in F₂. |
| real-chern-bockstein | KTheoryFiniteLocalFields §1.8 | Real standard-representation components with c₂₂ fixed by the metaplectic cover; a zero component would miss its central nontrivial class. |
| real-chern-bockstein-compatibility | KTheoryFiniteLocalFields §1.8 | Explicit H₃→H₂ and étale H¹→H² coefficient Bocksteins; β_et(t)=t², not0. |
| symplectic-universal-cover-kernel | RepresentationTheory/LieGroups Layer5 | Positive-rank kernel Z and quotient by2Z; generator1 survives modulo2. Rank0 kernel0 is excluded. |
| arithmetic-scheme-frobenius-detection | Chebotarev Layer13 extension | Detects independent pairs as well as single classes, in either characteristic; pair pattern(0,1) distinguishes span membership. |
| arithmetic-scheme-nonsplit-weight | Chebotarev Layer13 extension | Characteristic-zero lower bound cQ^d for every Q≥Q₀; affine line example has total leading constant1/2, so no false normalization1 is imposed. |
| arithmetic-scheme-residue-order-count | Chebotarev Layer13 extension | One C for all prime powers q; in dimension2 a residue-p fibre contributes p degree-one points, consistent with Cq. |

At the pins, the native declarations were read rather than inferred from their names. `CochainComplex` is literally `HomologicalComplex V (ComplexShape.up α)` in `Mathlib/Algebra/Homology/HomologicalComplex.lean:157`: boundedness, finite projectivity and a pairing are extra conditions. `HomologicalComplex.homology` is the associated short-complex homology at `Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean:89`. `groupHomology` is `(inhomogeneousChains A).homology n` for an actual representation A in `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:228`; it is not automatically the integral quotient used here. `Sylow` extends a subgroup with its maximal-p-subgroup property in `Mathlib/GroupTheory/Sylow.lean:54`; averaging and integral lifting are not part of that carrier. `SymplecticGroup.det_eq_one` at `Mathlib/LinearAlgebra/SymplecticGroup.lean:385` applies over commutative rings, not merely fields.

`TauCeti.SquareClassGroup` is the additive quotient of units by squares at `TauCeti/FieldTheory/SquareClassGroup/Basic.lean:45`, while `squareClassHom` at line73 uses its multiplicative wrapper and the iff at line83 characterizes triviality by being a square. `RingHom.squareClassMap` is at `TauCeti/FieldTheory/SquareClassGroup/Multiplicative.lean:149`. The orthogonal group's carrier is “{f ∣ ∀ m, Q (f m) = Q m}” in `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean:180`. The spinor map and reflection theorem at `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean:96` and line120 give [Q(v)], with finite dimension, nondegeneracy and two invertible, and its special-orthogonal restriction is at lines143–152. Thus Q(v)=2 gives [2], not [−2]. The existing Lagrangian definition at `TauCeti/Geometry/Symplectic/Lagrangian/Basic.lean:99` is a real subspace equal to its symplectic orthogonal, with no differential or shifted quotient.

The remaining native signature carriers resolve to `Mathlib/LinearAlgebra/Basis/Defs.lean:89`, `Mathlib/Algebra/Module/Submodule/Ker.lean:59`, `Mathlib/Algebra/Module/Submodule/Range.lean:57`, `Mathlib/Algebra/Module/Submodule/LinearMap.lean:209`, `Mathlib/LinearAlgebra/Determinant.lean:173`, and `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:63`. The associated-form diagonal identity is `QuadraticMap.associated_eq_self_apply` at `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:909`. The Dirichlet declaration at `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:442` has q≠0 via `NeZero q`, a unit residue and an arbitrary lower bound. Here q=2h>0 and h+1 is a unit.

Ownership searches covered main, Completed, board packages and all **38 supplied sibling-head directories**, using objects as well as the one fully qualified Lean name. No competing declaration with that fully qualified name was found. The relevant nearby owners were compared rather than treated as duplicates by vocabulary:

- `TauCetiRoadmap/MorseNovikov/README.md:219` owns based homological torsion and a zero-extended nonacyclic scalar. Its elementary degree-(1,0) scalar is a⁻¹. The present roadmap imports general determinant comparisons and constructs a nonzero self-dual root-line ratio, so its signed nonacyclic square-class invariant is a different adapter, not a reconstruction of that determinant functor.
- `TauCetiRoadmap/HermitianKTheoryOfPoincareCategories/README.md:659`, §4.7, uses homotopy-fixed-point symmetric structures and bounded [0,n] Ranicki models. Its own final Check distinguishes a strict tensor pairing from that coherent structure. The integer-supported strict pairing and signed determinant comparisons here are not declarations of its short L-group theory.
- `TauCetiRoadmap/OrthogonalSpinGroups/README.md:483` owns the spinor norm, already consumed from the pin. The inspected main roadmap does not state the generalized-primary Zassenhaus determinant formula. A different board design's attribution of that formula to it is not evidence that the target already exists there.
- KTheoryLowDegrees and PadicMeasuresIwasawaAlgebras own the general determinant carrier and coherence; SchemeAndStackFoundations owns the Kummer carrier; TangentialBordism owns the labelled geometric quotient; KTheoryFiniteLocalFields owns finite-rank Chern theory. Their supplied objects are not redeclared in Suggested.lean. The new normalization comparisons and torsion/Chern equality are owned here.

The prescribed dependency check returned exit0 and exactly:

```text
depcheck: 56 roadmaps, 643 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Local Needs references proceed from earlier sections, apart from explicitly explained later applications rather than proof dependencies. No move of ownership is required by this review. The base-to-head diff contains seven files, all inside `packages/SymplecticReidemeisterTorsionModSquares/`, with 2029 insertions and 5 deletions. This review changed only its report and scratch notes; the working-tree diff of tracked files is empty. No process/PR narrative, computational-algorithm milestone or prohibited Lean command was found in the README or Lean docstrings.

## Not verifiable

- Fresh Lean elaboration was prohibited. The supplied signature transcript and pinned source declarations were checked; this report does not claim a new `#check` run or build.
- The fourteen declared supplier gaps remain contracts. In particular the exact matrix computation cannot establish the smooth marked-surface realization, and the cohomological duality theorem alone cannot establish the signed boundary-cone comparison. Acceptance of the mathematical plan remains conditional on those declared contracts.
- All three cited works were legally readable from the supplied cache. No missing-reference request was needed. No later published correction or different edition was used to certify the stated preprint locators.
- Ownership against open work was checked at the supplied sibling heads and through the required ownership tool. Open pull requests without supplied files were not exhaustively reviewed; revisions of existing roadmaps were not used as replacements for main. There is no assertion about subsequent heads or unpublished work.
- The finite stress tests do not prove the general constructions. In particular normalized naturality must be proved with the root-line sign correction; the source's raw-naturality argument does not certify it. General source errors and their corrected usage are recorded below.

## Source issues

- **Error** in AV-v1 at B.1, printed p. 68 (AV-v1 line 3175): the source says ordinary orientation modulo even permutations describes the tensor product of arbitrary graded lines; it should be the Koszul-weighted permutation relation; exchanging two even lines has sign +1, not −1; affects the proof.
- **Misprint** in AV-v1 at §1.5, printed p. 8 (AV-v1 line 331): the source says both same-half blocks of the standard symplectic pairing are one; it should be zero on each same-half block; affects a stated result.
- **Error** in AV-v1 at A.6.1, printed p. 66 (AV-v1 line 3076): the source says the induced nondegenerate alternating form lives on the middle differential's cokernel; it should be on C⁰/ker(d⁰), whose dimension is rank(d⁰); affects the proof.
- **Misprint** in AV-v1 at B.3, printed p. 70 (AV-v1 line 3261): the source says the inverse construction is used when n≤1; it should be used for negative shifts, with the identity for shift zero; affects the proof.
- **Misprint** in AV-v1 at (B.14), printed p. 74 (AV-v1 line 3450): the source says the successive-truncation quotient is Cʳ[−r]; it should be Cʳ⁻¹[1−r]; affects the proof.
- **Misprint** in AV-v1 at B.6(a), printed p. 78 (AV-v1 line 3666): the source says the cone's distinguished Lagrangian is C; it should be C∨[−n] with the declared cone convention; affects the proof.
- **Misprint** in AV-v1 at B.6, printed p. 79 (AV-v1 line 3699): the source says D₂ is the acyclic middle block; it should be D₁, with the corresponding subsequent block labels exchanged; affects the proof.
- **Error** in AV-v1 at (B.20) and its justification, printed pp. 78–80 (AV-v1 line 3736): the source says the actual half-rank equals the displayed Euler half-sum as an integer; it should be equality modulo two; C=K² in degree three gives actual half-rank zero and half-sum −2; affects the proof.
- **Misprint** in AV-v1 at the calculation before (B.23), printed p. 80 (AV-v1 line 3745): the source says the boundary term dimension is cᵢ+cₙ₋₁₋ᵢ; it should be cₙ₋ᵢ+cᵢ₊₁ under its cochain-cone convention; affects the proof.
- **Misprint** in AV-v1 at B.9.2 before (B.34), printed p. 83 (AV-v1 line 3907): the source says the acyclic N-map uses the same unshifted Jordan vectors in both degrees; it should be their N-images in the target degree; affects the proof.
- **Misprint** in AV-v1 at (B.34), printed p. 84 (AV-v1 line 3913): the source says the second Jordan-chain wedge terminates with the first chain's generating vector; it should be the vector from the second chain; affects the proof.
- **Misprint** in AV-v1 at (B.36), printed p. 84 (AV-v1 line 3941): the source says transposing the operator puts Me in the second pairing argument; it should be Mf; affects the proof.
- **Error** in AV-v1 at B.9.2, printed p. 85 (AV-v1 line 3979): the source says commutator monodromy makes raw boundary-circle torsion trivial; it should be normalized torsion; the constant orthogonal plane has raw class [−1] and normalized class 1; affects the proof.
- **Error** in AV-v1 at §2.3.3, printed p. 13 (AV-v1 line 573): the source says raw torsion is natural under all maps of normal domains; it should be the semicharacteristic-normalized invariant; the circle family has generic raw [−(1+s)] but special raw 1; affects a stated result.
- **Gap** in AV-v1 at B.10, printed p. 86 (AV-v1 line 4033): the source says the root-line description directly gives raw specialization; it should be supplemented by the varying middle-rank sign and its cancellation in normalized torsion; affects the proof.
- **Error** in AV-v1 at (C.2), printed p. 87 (AV-v1 line 4083): the source says to take discriminant on the fixed space; it should be on the generalized one-eigenspace; the hyperbolic unipotent four-space has zero fixed-space Gram determinant and generalized discriminant one; affects a stated result.
- **Misprint** in AV-v1 at (C.8), printed p. 89 (AV-v1 line 4171): the source says to precompose a cocycle with T; it should be with the group automorphism t, before passage to the induced cohomology operator T; affects the proof.
- **Misprint** in AV-v1 at the sentence preceding (C.9), printed p. 89 (AV-v1 line 4183): the source says T acts on the mapping torus's first cohomology; it should be the surface's first cohomology; affects a stated result.
- **Gap** in AV-v1 at (C.9), printed p. 89 (AV-v1 line 4184): the source says quotient acyclicity permits dividing by the principal-subspace determinant; it should be assumed independently that det(1−M⁻¹) is nonzero, or the equation should be cross-multiplied; affects the proof.
- **Error** in AV-v1 at Lemma 2.7.1, printed p. 16 (AV-v1 line 698): the source says finite-field symplectic H₂ vanishes without exception; it should be odd-order for this mod-two argument; SL₂(F₉) has H₂=Z/3; affects a stated result.
- **Error** in AV-v1 at §2.7 before Definition 2.7.1, printed p. 17 (AV-v1 line 746): the source says a nonsquare raw torsion value witnesses nonzero normalized torsion; it should be a nonsquare normalized value; the constant symplectic plane on S³ over F₃ normalizes to 1; affects the proof.
- **Error** in AV-v1 at §2.8, printed p. 18 (AV-v1 line 754): the source says closed-point Frobenius elements are dense for every indicated affine scheme; it should be qualified for dimension zero; Spec F₃ has one Frobenius element, not a dense subset of Ẑ; affects a stated result.
- **Misprint** in AV-v1 at §2.9, printed p. 18 (AV-v1 line 764): the source says a homology element x lifts x; it should be that x lifts the square class α under the Chern map; affects nothing.
- **Error** in AV-v1 at Definition 2.11.1 and Lemma 2.11.2, printed pp. 20–21 (AV-v1 line 870): the source says exceptional sets with lower weighted density zero may be combined by union; it should be upper density zero; alternating dominating prime blocks have lower densities zero but union density one; affects the proof.
- **Error** in AV-v1 at Lemma 2.11.1's proof, printed p. 21 (AV-v1 line 898): the source says the normalized homology value equals the chosen raw torsion witness; it should be the normalized witness; constant rank-two S³ has normalized value 1 and raw value [−1]; affects the proof.
- **Error** in AV-v1 at Lemma 2.11.2, printed p. 21 (AV-v1 line 909): the source says the compositum Galois group surjects onto the product; it should be surjectivity of each projection; equal quadratic extensions give a diagonal group of order two inside a product of order four; affects the proof.
- **Error** in AV-v1 at Lemma 2.12.2, printed p. 22 (AV-v1 line 974): the source says the controlling construction allows every finite-dimensional W different from the specified line; it should be required that dim W≥1; W=0 gives an empty nonidentity subset; affects a stated result.
- **Error** in AV-v1 at §2.14, printed p. 25 (AV-v1 line 1122): the source says the Qᵈ-normalized total closed-point logarithmic weight tends to one; it should be replaced by a positive order-Qᵈ bound; the affine line over Z[1/2] has leading constant one-half; affects the proof.
- **Gap** in AV-v1 at §2.15, printed p. 26 (AV-v1 line 1139): the source says the Sylow lifting argument gives an arbitrary integral homology lift; it should be a lift modulo two, since odd-index transfer provides the needed surjectivity only after the indicated localization or reduction; affects the proof.
- **Error** in JRV at §5 before Theorem 5.1, printed p. 16 (JRV line 773): the source says every nondegenerate space of dimension at least two has surjective spinor norm; it should be restricted by represented square classes; the positive real plane has image {1}; affects a stated result.
- **Misprint** in JRV at §6, printed p. 17 (JRV line 847): the source says the dimension correction uses n while the dimension variable is d; it should be (−1)^(d(d−1)/2); affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "53d865070df5be183898481fae0fd7e1d644e90c", "job": "RT-SymplecticReidemeisterTorsionModSquares~2a", "model": "gpt-6-astra", "worker": "chris-30"} -->
