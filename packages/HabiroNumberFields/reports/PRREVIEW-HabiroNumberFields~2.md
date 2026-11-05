# Review of HabiroNumberFields (pull request #1469 at 84e120a)

**Verdict:** accepted

No findings. Unless otherwise stated, README locators below refer to `TauCetiRoadmap/HabiroNumberFields/README.md`. This is an independent AI incremental re-review of 101 changed lines since 8617991, covering the repairs and their mathematical dependencies. Acceptance is conditional on the declared `gap:bloch-foundations` contract, as permitted by the review brief. It means ready for human final approval, not approval or merger by the AI.

## Previous findings

- R01 — repaired: README:85–96 imports PadicHodgeRegulators §§4.7, 5.6–5.9, 6.1 and 6.3; §3.0 retains only the global-degree/torsor adapter. The normalized map, finite presentations and full trace diagrams are included.
- R02 — repaired: README:55 restores the precise gap:bloch-foundations contract matching design/plan.json. Sections 1.11–1.12 consume its positive comparison and reduction square while retaining the finite P calculation locally.
- R03 — repaired: README:93 labels the determinant-three column ζ⁵ and gives the Frobenius-converted ζ column with determinant two. Both values were recomputed in 𝔽₂₅.
- R04 — repaired: README:360, 431 and 905 now point to GZ line 875, CGZ line 218 and GSWZ lines 806, 810, 855. Each replacement opens the intended passage.

## Verified sound

The six Lean declarations are byte-identical to those at 8617991; only the module docstring changed. Full new review was confined to changed text and its dependencies. The previous review's unchanged adversarial rows are reproduced below with individual [r1] citations, rather than represented as newly executed experiments. New calculations cover the supplier normalization, determinant, exceptional finite field, completed presentations, torsors, and restriction/transfer consequences.

### Gate, elaboration and signatures

The worker's supplied gate passes every check, including the targeted build. The independent gate rerun reports:

    gate HabiroNumberFields: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

The independently rerun dependency command gives exactly:

    depcheck: 204 roadmaps, 1497 edges, 0 problem(s)

No UPWARD or CYCLE line occurs. Merge-order positions are K3BlochGroups 122, PadicHodgeRegulators 302, HabiroNumberFields 304. The new supplier edge points in the permitted direction. No PR file or outside-folder file changed. Both the incremental outside-folder list and the full `origin/main...HEAD` outside-folder diff are empty.

Independent `lake env lean` elaboration of `TauCetiRoadmap/HabiroNumberFields/Suggested.lean` and the targeted `lake build TauCetiRoadmap.HabiroNumberFields.Suggested` succeed. A scratch copy with `#check @name` for all six declarations also succeeds. The only warnings are the four intended theorem admissions, at lines 43, 50, 62 and 71. No binder disappeared and no signature changed.

| Declaration | Explicit elaborated context compared with README |
|---|---|
| cyclicDilog | Arbitrary commutative ring and universe; n:ℕ; actual finite product; n=0 remains permitted in the definition. |
| cyclicDilog_quasiPeriodicity | Field, positive n, primitive ζ, s≤n; no nonvanishing condition on x and no division by 1−xⁿ. |
| cyclicDilog_one_pow_twentyFour | Field, positive n, primitive ζ, nonzero image of n; exponent 12n. |
| cyclicHypergeom | Arbitrary field and universe, actual finite sum with total field division. |
| cyclicHypergeom_shift | Positive n, primitive ζ, X≠1, Y≠1 and (1−Y)Z=1−X all remain explicit. |
| kms | Positive invertible order, primitive ζ, x,y,z≠0, X,Y≠1, X≠Y and the hypersurface equation all remain explicit. |

The four one-tactic probes (`simp`, `rfl`, `infer_instance`, and the pinned-lemma search) in [r1] remain applicable to the unchanged statements. No new theorem or definition was added, and no padding was substituted for the removed ownership claims. There are two real-bodied definitions, four admitted headlines, one `import Mathlib`, no sorry'd data and no options.

The retained headline list is: finite Chern unit theorem; cyclic quasi-periodicity and phase-free value; cyclic difference equation and KMS; finite regulator/Chern comparison and conditional calibration; arithmetic Habiro gluing and rational-field comparison; local rank-one freeness; effective global descent; tensor equivalences and Picard character; field pullback/scalar equivalence; multiplicative transfer. Completed Coleman lattice comparison and root generation are now supplier theorems, not local headlines. Their deletion from the docstring matches that ownership repair. The four finite headlines are present. The docstring still identifies the missing K-theory/Bloch, cyclotomic-completion/Taylor, Chern-root-line/indexed-module and analytic Pochhammer/bilateral carriers for the other headlines.

### Changed sources and seeded sample

The source manifest was read from `packages/HabiroNumberFields/sources.toml`; the checked locators use its CGZ v3, published GZ and GSWZ v2 texts. No source manifest was edited. All required texts for this incremental pass were available in the supplied legal cache. No README locator is flagged unverified.

| Changed target or contract | Text opened and result |
|---|---|
| PadicHodgeRegulators contract; §3.0 | GSWZ lines 1975–2026, Lemma 3.1/Propositions 3.2–3.3, printed pp.38–39, and Theorem 9, p.39, give the unramified p>3 lattice/root-generation setting. The actual Chern/logarithm normalization and transfer are explicitly imported from the supplier's §§4.7,5.7,6.3, rather than attributed to Theorem 9 alone. |
| §3.0 and dependent §3.4 | GSWZ lines 2157–2179, (205)–(208)/Definition 3.9, p.42, discuss presentations and sections. Keeping the original global ξ and its finite Chern torsors is expressly the roadmap's refinement; a p-completed zero class does not determine those torsors. |
| Seed §1.3 | GZ lines 875–879, paragraph after (56), p.236, supplies the generic-locus motivation. The roadmap continues to own the monic integral descent and positive-characteristic specialization. The corrected locator is accurate. |
| §1.6 | CGZ lines 218–224, Theorem 1.7, p.5, displays the exact sequence with K₂(F)[n], not all K₂(F). Its existing hypotheses and comparison route are unchanged. |
| §1.11 and seed §1.12 | CGZ line 1048 explicitly assumes odd residue characteristic; lines 1228–1248, Theorem 5.2/Lemma 5.3, pp.26–27, give the comparison argument. The F₂ positive comparison now correctly comes from the declared supplier gap. The higher-valuation passage remains a separate target, not a claim that an order-n root generates every larger cyclic quotient. |
| Seed §3.3 | GSWZ lines 806–816, (48)–(50), p.18, and 855–864, Proposition 2.2, p.19, are the corrected locators. The coefficient of t is −p/x; (49) agrees with that sign. The printed positive sign in (56) remains a source misprint. |
| Seed §3.6; dependent §§3.16,3.18–3.19 | The change repoints the regulator/presentation input to §3.0 and the verified supplier maps. The corrected local shape, first-jet requirement, effective descent and coherent Chern transfer remain explicit local targets. No new theorem is falsely attributed to GSWZ. |

Of the 15 seeded targets, §§1.3,1.12,3.3,3.6 intersect changed passages and were checked as above. Sections 0.6,0.9,1.2,1.4,1.8,1.13,1.15,2.4,3.13,3.17,3.19 have unchanged mathematical statements; their computed rows are carried from [r1]. The changed paths feeding §§1.13,1.15 and 3.19 were additionally checked through the exceptional comparison, independent global torsors and transfer-to-trace contract. The unchanged source audits and proof limitations remain those recorded in [r1].

### Ownership, supplier contracts and pins

The prescribed roadmap grep/show tools were used, together with the supplied open-head files and a board-package object search. Searches covered completed root classes, normalized local K₃ regulators, finite root presentations and the exceptional positive comparison. They confirm PadicHodgeRegulators as the comparison owner and HabiroNahmSeries as another consumer. The new §3.0 has four API laws and three discriminating Checks. Its definition is the Habiro-specific pairing of a completed presentation with an unchanged global degree and its torsors; it does not reconstruct the completed K-group, regulator or lattice.

The citation resolver was rerun against main fa41b37 and the indexed open heads: no cross-roadmap citation or own Lean identifier was found nowhere. Its library-name check is unavailable on that host; the pin checks below were performed locally. The substantive changed imports were read in the supplied checkouts, not inferred from resolver success.

| Supplier file and lines | Contract resolved in this round |
|---|---|
| TauCetiRoadmap/PadicHodgeRegulators/README.md:1030–1060 | §4.7 fixes the universal rational c₂, both regulator normalizations and p-adic unit calibration at p>3. Calibration is a supplier target, not assumed to follow solely from rank. |
| TauCetiRoadmap/PadicHodgeRegulators/README.md:1172–1218 | §§5.6–5.7 construct the admissible root classes and D=−c₂(log_BK∘c_(2,1)), with root values, product, naturality and finite-free trace compatibility. |
| TauCetiRoadmap/PadicHodgeRegulators/README.md:1220–1251 | §§5.8–5.9 state the unramified p>3 lattice isomorphism and finite ℤ_p presentations, including rank zero and excluding the p=3 torsion counterexample. |
| TauCetiRoadmap/PadicHodgeRegulators/README.md:1265–1272,1302–1315 | §§6.1,6.3 give the global completion composite, torsion vanishing and restriction/transfer diagrams on the full semilocal algebra. No global surjectivity is asserted. |
| TauCetiRoadmap/K3BlochGroups/README.md:952–981,1885–1903 | §3.13 supplies B_old(F₂)=ℤ/3 on [0]; §5.5's general comparison has q≥4. The exceptional signed reduction square is properly declared as a gap rather than misattributed to that general theorem. |

The exact gap sentence in README:55 matches `packages/HabiroNumberFields/design/plan.json`'s sole slug, supplier and needs. It requests one comparison with its naturality square, not another carrier or an unspecified foundational package. No other owner found in the permitted object search supplies that exceptional square. Its absence from the supplier today is permitted and is not re-raised as a finding. This respects the settled F06 disposition.

The repaired Needs lines in §§1.11–1.12,3.0–3.1,3.4,3.6,3.16,3.18 and Layer 3 dependencies point to the replacement owner or adapter. Searches find no remaining local §3.0a/§3.0b target or reference in either reviewed file. The supplier's older downstream labels for those sections are consumer descriptions, not inputs creating a reverse edge. Unchanged contracts retain the substantive audit in [r1]; their names/locators were re-resolved this round.

Pins remain Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The following three native declaration groups were reopened:

| Pinned file and line | What its definition actually supplies |
|---|---|
| Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:62 | IsPrimitiveRoot records ζ^n=1 and n dividing every vanishing power exponent. It does not itself impose n>0; the four signatures keep the needed positivity separately. |
| TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:341 | kummerClassMap is a quotient-group homomorphism requiring IsUnit (n:K), not an exponentiation action of ℤ_p on arbitrary finite Chern data. |
| TauCeti/NumberTheory/LocalField/ResidueCorrespondence.lean:164,178 | frobeniusAlgEquiv and its order require the unramified local-field setting. They do not erase product factors or construct the normalized Coleman regulator. |

Object searches at both pins found no cyclic-dilogarithm/cyclic-hypergeometric or normalized completed-K₃ replacement. The previous review's broader 16-file native audit and absence of colliding fully qualified declarations are carried forward; no declaration has been added or renamed here. Ownership against readable open work was checked for the changed objects. No claim is made about work whose files were not supplied.

### New computed adversarial rows

Here ζ satisfies ζ²+ζ+1=0. Finite-field values were recomputed directly in 𝔽₂[ζ] and 𝔽₅[ζ]. Other rows give explicit algebraic computations, including the wrong models excluded. These tests are necessary checks, not proofs of the future comparison or descent theorems.

| Statement | Instances tried | Computed values on both sides / correct and wrong models | Result; change |
|---|---|---|---|
| Supplier D normalization | p=5, i=ω(2); raw Chern/logarithm versus normalized D | λ([i])=−c₂⁻¹Li₂(i); −c₂λ([i])=Li₂(i)≡25 mod125. Multiplying D by 5 gives 0 mod125; −D gives 100. | Correct actual normalized map imported. |
| Supplier finite-product lattice | L=ℚ₅×ℚ₂₅; empty product | Both completed group and 25O_L have rank 1+2=3; selecting one factor gives rank 1 or 2. Empty product has 0→0. | Full product and zero algebra retained. |
| Supplier exceptional p | p=3, L=ℚ₃ | The nonzero order-three summand maps to 0 in ℚ₃; an isomorphism to 9ℤ₃ would have a nonzero kernel. | p>3 restriction matches supplier. |
| Supplier root residue and determinant, README:93 | p=5, cubic ζ and fourth root i | li₂,₅(ζ)=3ζ; D(ζ⁵)/25=4+3ζ; D(i)/25=1; determinant of (1,0),(4,3) is 3. | Previous R03 repaired. |
| Supplier Frobenius convention | Same ζ | (4+3ζ)⁵=4+3ζ²=1+2ζ; determinant with column (1,2) is 2. Zero or 5D has residue determinant 0. | Correct root label and arithmetic Frobenius. |
| Supplier restriction/trace | Diagonal ℚ₅→ℚ₅×ℚ₅; degree-2 then degree-3 tower; identity | 25↦(25,25); trace=50=2·25; iterated trace=150=6·25; identity trace=25. A selected-factor trace gives 25 instead of 50. | §§6.1,6.3 supply all diagrams. |
| Factor-supported roots | L=ℚ₅×ℚ₂₅ | The supported second-factor value is (0,Li₂(ζ)); projection to the first factor is 0. The argument (1,ζ) fails the supplier's all-components-nontrivial condition. | Product inclusion used without an inadmissible root tuple. |
| Exceptional comparison and §1.11 P-value | n=3, residue field F₂; ζ∈F₄ | D₃(ζ,1)=ζ, inverse=ζ²=1+ζ≠1; (ζ²)³=1 and all nonzero cubes equal 1. Source and target quotients have order 3. | Nonzero calculation retained; signed naturality square imported under gap. |
| §1.12 changed exceptional input | n=3, ℓ=2,5,17 | v₃(3)=v₃(6)=1, v₃(18)=2; in C₁₈ the order-3 element 6g is 0 in C₁₈/3C₁₈. F₄ value ζ² is nontrivial. | Retains all primes and higher-order distribution obligation. |
| §1.3 corrected locator and integral descent | n=1; n=2, generic y | x=1−(1−y)z for n=1. For n=2, z²=(1−y²)⁻¹ at a zero, and derivative −2(1−y²)z≠0 over ℂ(y). | Source motivates generic-locus step; monic/torsion-free descent remains local. |
| §1.6 corrected exact-sequence locator | F=ℚ,n=5, symbol [32] | Boundary 32∧(−31)=5(2∧−31), hence 0 mod5. Tame value of {2,−31} at 31 is 2, with 2⁵=1 mod31 and 2≠1. | Endpoint is 5-torsion K₂, consistent with CGZ line 218. |
| §3.0 presentation definition and existence | ξ=0; supplied completed class ρ | Empty sum=0 and pole=0. The one-term expression 1·ρ=ρ gives pole Li₂(ζ); it is a presentation of ξ only if λξ=ρ. | No arbitrary-data theorem or claim of global surjectivity. |
| §3.0 presentation independence | Insert aρ and −aρ while keeping ξ fixed | Completed difference aρ−aρ=0; regulator difference aLi₂(ζ)−aLi₂(ζ)=0; normalized logarithmic difference a log U−a log U=0. | Same global degree/torsors; section comparison remains in §3.4. |
| §3.0 completed zero versus global degree | Cubic eta over ℚ, p=5,m=3; compare ξ=0 | Both completed values and poles are 0. For ξ=0 torsor class=1; eta has class ζ or ζ². F₂₅ˣ has 24 elements and its cube subgroup has 8, containing neither ζ nor ζ². | Completion alone cannot replace global torsors. |
| §3.0 coefficient reduction | Root order 3, p=5 | 3⁻¹ mod5=2, 3⁻¹ mod25=17; 3·17=51≡1 mod25 and 17≡2 mod5. | Supplied divided classes have the right coefficient direction. |
| §3.0 finite Chern data are separate | A a ℤ₅-module, B exponent 3 | a=3(a/3) implies every additive f:A→B has f(a)=3f(a/3)=0. Exceptional cubic regulator has ζ²≠1. | No finite Chern map is assigned via ℤ₅ exponents. |
| §3.1 and §3.4 use the adapter | Empty presentation; η and zero global degree | Normalized product=1 in both cases; constants are e₃(η) versus 1. Formal pole remains 0. | Replacement reference preserves the root line and shape data. |
| §3.3 corrected Pochhammer locators | q=1+x, coefficient t; p=5,cubic ζ | p/(1−q)=−p/x. Depleted Li₂(ζ) mod5=(3ζ)/(1−ζ²)=1+2ζ≠0. Thus opposite residues differ mod25. | Correct sign and replacement locators. |
| §3.6 new presentation dependency | p=5, ξ=0,s=1; generators 2s and 5s | Ratios 2 and 5 have valuations 0 and 1; multiplication by 2 is invertible, by 5 is not. Eta completion 0 still has the preceding nontrivial cubic torsor. | Local freeness uses the same corrected sections; no global descent shortcut. |
| §3.16 replacement naturality input | ℚ→ℚ(i), p=5; identity | Coefficient a becomes (a,a); normalized regulator does likewise. Identity sends a to a. Abstract ζ_m is fixed. | Supplied restriction suffices for poles; coherent root-line maps remain required. |
| §3.18 replacement transfer input | Quadratic split series (1+2x,1+3x) | Norm=1+5x+6x²; first coefficient=Tr(2,3)=5. log coefficient x² is 6−25/2=−13/2, equal to −4/2−9/2. | Uses full trace on degree and whole-series norm on sections. |
| §3.19 affected transfer route | Quadratic norm of base scalars; tower degrees 2,3 | Norm(1+1)=4 but Norm(1)+Norm(1)=2; Norm(2·3)=36=4·9; (2²)³=64=2⁶. | Multiplicative transfer remains distinct from additive trace. |

### Carried adversarial evidence

94 unchanged-statement rows and ten finite-field rows are carried forward, alongside 22 new rows above.

The following unchanged-statement rows retain the values in [r1]. The four rows about the deleted local §§3.0a–3.0b targets are replaced by the supplier/adapter rows above. The exceptional-field row's ownership conclusion is replaced above as well. Other rows that intersect a locator-only or Needs-only change are retained for their unchanged mathematics and supplemented above.

| Statement | Instance(s) tried | Computed values on the two sides, or correct/wrong models | Result; change |
|---|---|---|---|
| Conventions: positive orders and zero completion | n=0,1; R=ℤ[1/6],p=3 | Empty D=1 and empty f=0; coefficient order 1 gives the trivial group. R/3ᵃR=0 for every a, while R⊗ℤ₃=ℚ₃≠0. | Retain positivity and zero-completion convention. [r1] |
| Conventions: full tensor factors | K=ℚ(i),m=4 | K⊗ℚ ℚ(i)≃K×K has K-rank 2; a selected field has rank 1. | Retain full algebra. [r1] |
| §0.1 integral eigenspaces | n=9,G=(ℤ/9)ˣ; G=1 | Twisted augmentation of an eigenvector is 6c, with image {0,3,6}; 1 has no eigenlift. With G=1 the projector is identity. | Correct obstruction; averaging cannot replace lifting. [r1] |
| §0.1 inverse character | n=5,σ₂; root character at n=7 | χ⁻¹(σ₂)=3, while χ(σ₂)=2. On μ₇, σ₂ζ=ζ²; inverse weight would require ζ⁴. | Distinguishes χ from χ⁻¹. [r1] |
| §0.2 excluded integers | ℚ; ℚ(i); n=1,3,9 | For ℚ, M=12,M′=4; gcd(3,4)=1 but 9∣9 excludes n=9 in the reduced variant. For ℚ(i), M=24,M′=8. gcd(1,M)=1. | Matches tame-kernel data and reduced hypothesis. [r1] |
| §0.3 Kummer direction | 𝔽₇,n=3,a=2 | α³=2 gives α⁷/α=α⁶=4; inverse convention gives 2. Cubes are {1,6}. | Positive Kummer sign distinguished. [r1] |
| §0.3 Tate root change | r=1,2,k=−1 | Root-change exponent is 1 at r=1 and −1 at r=2; a cubic class 2 changes to 4, not 2. | Retain basis-dependent untwisting. [r1] |
| §0.4 restriction/injectivity | F=ℚ,n=3,9; trivial group | n=3 has no repeated prime and qualifies. n=9 fails since 3∣w₂(ℚ)=24. The trivial-group scalar a−1 is 0, not a unit. | No artificial vanishing or squarefree exclusion. [r1] |
| §0.5 finite endomorphism criterion | A=ℤ/9,f=2,n=9 | f(A)=A and ker f=0; hence ker f∩A[9]=0. | Retain. [r1] |
| §0.5 failed premises and n=0 | A=ℤ/9,f=0,n=3; A=ℚ/ℤ,f=3,n=3; A=0 | Finite premise gives 3A≠A and intersection has order 3. Infinite example has f(A)=A but intersection also order 3. At n=0, onto finite f has kernel 0; zero group gives 0=0. | Finiteness is essential. [r1] |
| §0.6 exact eigenlift | Injection U→M, zero target class; D=3ℤ⊂ℤ,n=3 | Injectivity turns f(σu−χ⁻¹u)=0 into σu−χ⁻¹u=0. The generator 3 of D/3D is nonzero but maps to 0 in ℤ/3. | Retain exact lattice, not ambient valuation test. [r1] |
| §0.6 cyclotomic ramification | F=ℚ,p=3,a=2 | Degree=e=φ(9)=6, residue degree=1; 6 mod9 is not invertible. | Lifting works without averaging; ramification premise retained. [r1] |
| §0.7 S-unit/ordinary-unit separation | Class [2], then adjoin an n-th root | v₂(2)=1, so 2 is not an ordinary unit; after adjoining α with αⁿ=2, its power class becomes 1. | No unconditional extension injectivity or uniform S in n. [r1] |
| §0.8 unit multiplicities | F=ℚ,p=3,5,7 | r₂=0; inverse-character mod-p dimensions are 1,0,0. At p=3 the extra class is μ₃, not a free-unit rank. | Torsion correction retained. [r1] |
| §0.8 equivariant Dirichlet rank | Totally imaginary quadratic F, odd nontrivial character; trivial character | Nontrivial odd multiplicity r₂(F)=1; trivial multiplicity r₁+r₂−1=0. | Nontriviality and archimedean stabilizers distinguish the formulas. [r1] |
| §0.9 finite Chern unit theorem | F=ℚ,n=1,3,5,35 | At 1 both groups are trivial. At 3 the reduced good-order statement compares order-3 groups; at 5 and 35, the odd K₃ quotient and inverse-character unit part are zero. | Prime/composite and reduced-order controls agree. [r1] |
| §1.1 definition D | n=0,1,2; ζ=−1 | D₀=1,D₁=1,D₂(x)=1+x; in the zero ring its value is the unique element 0=1. | Actual commutative-ring definition; not restricted to fields. [r1] |
| §1.1 quasi-periodicity | n=2,s=1,ζ=−1,x=2 | Left (1−4)D(−2)=3; right D(2)(1−2)²=3. At x=1 both sides are 0; at s=0 both are D(x). | Retain cleared, division-free form. [r1] |
| §1.1 phase-free value | n=1,2,3 | Values are 1=1, 2²⁴=2²⁴ and D₃(1)²⁴=3³⁶. The cubic value before taking powers is ζ(1−ζ)³. | Exact polynomial remainder tests n≤16 also pass. [r1] |
| §1.1 cubic class and field extension | ℚ(ζ₃)⊂ℚ(ζ₉) | D₃(1)=ζ₃(1−ζ₃)³; over ℚ(ζ₉) it equals (ζ₉(1−ζ₃))³. | Nontriviality is field-relative, not universal. [r1] |
| §1.2 finite sum and singular total division | n=0,1; n=2,ζ=−1,x=y=−1,z=1 | f₀=0,f₁=1. Singular f₂=1 because its second quotient is 0/0=0, whereas a geometric-sum replacement gives 2. | Singular input excluded from identities. [r1] |
| §1.2 shifted product convention | n=2,ζ=−1,x=2,y=3,z=5 over ℚ | f=1+(1+3)/(1+2)·5=23/3. Starting the product at exponent 0 gives 11 instead. | Fixes j+1 indexing. [r1] |
| §1.2 difference equation | n=1,𝔽₁₁,(2,3,6) | (1−6)·1=6; (2−3·6)·1=6. | Exhaustive tests above extend beyond this boundary. [r1] |
| §1.3 KMS | Ten finite-field/order pairs above | 8,038 pairs of exact left/right values agree, including 𝔽₁₆,n=3 and 𝔽₂₇,n=2. | No field-embedding shortcut; retain integral descent. [r1] |
| §1.3 analytic center | X=1/5,Y=2,Z=−4/5 | (1−Y)Z=4/5=1−X; &#124;X/Y&#124;=1/10<4/5<1; S=4/9 and C=169/36. | Nonempty nonsingular annulus and positive branches. [r1] |
| §1.3 Gaussian/phase scale | Same center, n=1; residue increment j at general n | √S=2/3; ((1−x)/(1−yz))√C=(4/13)(13/6)=2/3. Log-period summation gives −nεj²/(2S), hence √(2πS/n), not √(2πS). | Corrected scale; uniform tails remain a proof target. [r1] |
| §1.3 unshifted Pochhammer half-power | n=1,x=−1 | After removing exp(Li₂(−1)/ε), inverse product tends to 2^(−1/2); positive half-power would give 2^(1/2). | README and actual PDF (57) agree; no sign finding. [r1] |
| §1.3 dilogarithm route | Same center | Abel inputs are 4/9,1/9 with sum 5/9; its three transformed arguments are 1/2,1/5,1/10. Log quotient (1−Z)/(1−X/(YZ))=8/5=−YZ. | Branch domains and cancellation inputs agree. [r1] |
| §1.3 algebraic-density target | n=1; general simple zero in z | For n=1 the x equation has derivative 1. For general n the constant polynomial 1−(1−yⁿ)zⁿ has nonzero z derivative at each zero over the generic coefficient field. | Eisenstein route retains a simple prime and monic freeness; no positive-characteristic embedding in ℂ. [r1] |
| §1.4 Kummer value/odd-order scope | n=2,X=1/2 | For x=1/√2, P=(2+√2)/4. A square root is t/2 with t⁴−4t²+2=0; its cyclic quartic field is not the universal multiquadratic extension. | Even-order case is not covered by odd descent. [r1] |
| §1.5 powered descent ambiguity | F=ℚ(ζ₃),n=3,ξ=0 | [1] and [2] both restrict to 1 in the universal Kummer extension; v₂(2)=1 prevents [2]=1 in Fˣ/Fˣ³. | Lift set is a torsor, not a unique value without coprimality. [r1] |
| §1.5 root and CRT laws | n=15; ζ↦ζ⁻¹ | Roots for orders 3,5 are ζ⁵,ζ³, respectively; inversion changes exponent 1 to −1. At ξ=0,n=1, lift set={1}. | Domains and uniqueness conditions retained. [r1] |
| §1.6 étale Bloch versus ordinary Bloch | F=ℚ,n=5,[32] | Boundary is 5(2∧−31), so it vanishes mod5. Dividing gives {2,−31}; its tame value at 31 is 2 of order 5. Ordinary K₃(ℚ)/5=0. | Larger group detects a nonzero boundary; not the ordinary Bloch group. [r1] |
| §1.7 eta degeneracies/root change | n=3,5 | At 3 the degenerate sum [∞]+2[0]=[0], not 0. At 5, root change k=2 multiplies eta by k²=4. | Keeping [0] and the root convention matters. [r1] |
| §1.8 positive chains | C₃ | dα₂=3[t], while dα₃=0 in coinvariants. A negative periodic generator gives the opposite Bockstein. | Positive chain convention agrees with supplied Bott. [r1] |
| §1.8 integral lift obstruction | Scalar ζI in M₃(ℚ(ζ₃)); ζ in the field | det(ζI)=ζ³=1, so its K₁ class is zero; the field unit ζ has nonzero K₁ class. | Obstruction concerns K₁, not inequality of ring elements. [r1] |
| §1.9 diagonalization/cyclic generator | n=3 | det of eigenvector matrix is ζ−ζ⁻¹≠0; rescaling a column by its inverse makes determinant 1. Root inversion exchanges the two eigenvalues. | No unmarked conjugacy/normalization shortcut. [r1] |
| §1.10 raw versus positive Chern | Order 3 | Raw value ζ⁻¹=ζ² differs from positive value ζ; squaring gives ζ versus ζ², still different. | Separate normalization comparison required. [r1] |
| §1.11 unique finite roots | n=3,ℓ=5 versus ℓ=7 | gcd(3,4)=1 gives a unique cube root in 𝔽₅ˣ; gcd(3,6)=3 gives three cube roots of 1 in 𝔽₇ˣ. | Congruence ℓ≡−1 is material. [r1] |
| §1.12 exact valuation | n=3,ℓ=5,17 | v₃(6)=1 versus v₃(18)=2. In cyclic order 18, an order-3 element is 6g and is 0 modulo 3G; it cannot generate G/3G. | Retain exact-valuation test and higher-order distribution. [r1] |
| §1.13 detection up to unit | Cyclic order 5, classes g and 2g | At every place, r(g)=0 iff 2r(g)=0; g≠2g. Nonzero Frobenius occurs at infinitely many places. | Vanishing loci cannot fix a scalar; target must be a product, not finite-support sum. [r1] |
| §1.14 scalar calibration | n=5,a=2,b=1 or −1 | γ=ab⁻¹ gives 2 in the positive case, 3 in the negative case. | Sign comparison cannot be omitted. [r1] |
| §1.15 torsors/root lines | ξ=0; m=2; representatives 2 and 18 | Trivial class gives trivial torsor; squaring a square class gives 1. y²=2 is transported to (3y)²=18, without supplying a rational root of 2. | Representative independence does not trivialize every torsor. [r1] |
| §1.15 retain global degree | Cubic torsion class and p=5 completion | Prime-to-5 torsion maps to 0 in the completed ℤ₅-module but its order-3 Chern data need not be 1. | Completed presentations cannot replace all-order global torsors. [r1] |
| §2.1 compatible roots | Coprime 2 and 3 | ζ₂ζ₃=exp(5πi/3), not exp(πi/3). At p=2,m=5 the transition shift is −2ζ₅ and has valuation 1. | Distinguishes compatible CRT roots from independent principal choices. [r1] |
| §2.2 two Frobenii | K=ℚ(i),p=3,m=4 | φ_R(i)=−i and φ_R(ζ₄)=ζ₄; φ_cycl(i)=−i and φ_cycl(ζ₄)=−ζ₄. | Coefficient and root action separated. [r1] |
| §2.2 semilocal order | ℚ(∛2),p=5 | x³−2=(x−3)(x²+3x+4) mod5; residue degrees 1,2 give Frobenius order lcm(1,2)=2. | Retains all factors and inseparable exclusions. [r1] |
| §2.3 convergent re-expansion | x²; Σxᵏ with constant shift c | x²↦x²+2cx+c². For c=p, the geometric constant is 1/(1−p); for c=1 the scalar sum diverges. | Requires topological nilpotence and completeness. [r1] |
| §2.4 twisted gluing | K=ℚ(i),p=3,constant family i | rex(i)=i, φ_R(i)=−i; 2i≠0. Constant 0 and 1 give 0=0 and 1=1. | Rejects arbitrary coefficient constants. [r1] |
| §2.5 p-chain untwisting | Scalar seed i, p=3 | Twisted sequence i,−i,i becomes i,i,i after φ_R^0,φ_R^1,φ_R^2. | Fixes inverse reconstruction direction. [r1] |
| §2.6 prime-to-p chart | m=5,p=11; m=3,p=2 | Φ₅ has four roots 3,4,5,9 mod11, giving four factors; Φ₃ mod2 is irreducible of degree 2. | Full étale algebra has rank φ(m) in both cases. [r1] |
| §2.6 excluded nonétale case | m=p=3 | Φ₃(q)=(q−1)² mod3; derivative at 1 is 0. The residue quotient is nonreduced, unlike the prime-to-p chart. | Retain p∤m. [r1] |
| §2.6 mixed-adic p-chain | p=2,m=1,q+1 quotient | Mod(4,q+1), q−1=−2≠0 but (q−1)²=4=0. At q=1, (q+1)^N=2^N is not in (2)^(N+1). | Mixed ideals, not falsely identical single-adic topologies. [r1] |
| §2.7 splitting/image criterion | p=2, prime-to-p seed 1 only at order 1; polynomial q² | Reconstruction is 1 along orders 1,2,4,… and 0 on other chains. At q=1+x, q² has coefficients 1,2,1. | Local product supports more seeds than a global integral Taylor family. [r1] |
| §2.8 coordinate conversion | q=ζ(1−u),x=q−ζ | x=−ζu; x²=ζ²u². At m=1 the linear sign is −; at m=2 it is +. | Weighted Taylor coordinate sign retained. [r1] |
| §2.8 jet index bounds | N=0,1,2,4 | First two have no pairs; N=2 has (1,0); N=4 has (1,0),(1,1),(1,2),(2,0),(3,0), with total coefficient rank 6. | Strict bound matters; no natural-subtraction junk entry. [r1] |
| §2.9 rational-field comparison | R=ℤ[1/2] | Odd-order indicator e satisfies e²=e, e≠0,1; integral H_ℤ is a domain. | Localization changes components; no blanket domain assertion. [r1] |
| §2.10 external components | Δ=6; orders 5,35,10,18 | Their Δ-supported parts are 1,1,2,18. | Orders with different labels are disconnected by the allowed edges. [r1] |
| §2.10 internal idempotents | K=ℚ(i),m=4 | With a=i⊗ζ₄, a²=1. Thus e=(1−a)/2 has e²=e and gives components 0,1. | One order component need not be a domain. [r1] |
| §2.11 scalar embedding | K=ℚ(ζ₅),order 2 | φ₂⁻¹(ζ₅)=ζ₅³, and φ₂(ζ₅³)=ζ₅. Wrong choice φ₂(ζ₅)=ζ₅² gives φ₂(ζ₅²)=ζ₅⁴. | Inverse Artin action is necessary. [r1] |
| §3.1 corrected local section | ξ=0,m=1,f=(1+x)^(1/p) | Log defect is 0, constant 1, but first coefficient 1/p is nonintegral. | Integral first jet excludes the wrong section. [r1] |
| §3.1 module versus units | Generator s; 0 and ps | 0 has constant 0; ps has nonunit constant p. Both are module elements but neither is an invertible local section. | Span definition, not a group of units. [r1] |
| §3.2 Dwork criterion | p=5,f=1+x/5 | Coefficient of x² in log(f(q⁵−1))−5log f(x) is 8/5, not in 5ℤ₅. For (1+x)^(1/5), quotient is 1 but first jet fails. | Both defect and first-jet premises tested. [r1] |
| §3.2 coefficient scope | Equal characteristic p; ramified ring; p=2 | In characteristic p, p=0 and inversion collapses; ordinary exp at arbitrary 2ℤ₂ does not meet the p>2 convergence bound. | No implicit extension of the unramified mixed-characteristic result. [r1] |
| §3.3 depleted coefficients | p=5,s=0 | Coefficients at t,t²,t³,t⁴ are 1; at t⁵ and t⁰ are 0. Li₀(t)−Li₀(t⁵) has those coefficients. | Checks depletion and zero index. [r1] |
| §3.3 defect residue | Coefficient t, q=1+x | p/(1−q)=−p/x, not +p/x. | README corrects source (56); Locator repaired in this round. [r1] |
| §3.4 regularized factors | Empty root presentation; generator rescaling | Empty nonconstant product is 1. Rescaling local generator by 2 at p=5 has unit ratio 2, while original prime-to-p torsors remain separate data. | No recovery of global torsors from a completed zero class. [r1] |
| §3.4 representative change | p=5,m=3,u=6 | First log term log(6)=5 mod25; the indicated twice-log contribution is 10 mod25, not 0. | Trivialization changes must be included, not discarded as constants. [r1] |
| §3.5 half-shift coefficient | ζ=−1,r=1; ζ=2,r=1; ζ=−1,r=2,−1 | H values are 1/48,1/12,1/96,−1/48. B₂(1/2)/2·Li₀(−1)=1/48. | Sign and 1/r scaling agree. [r1] |
| §3.5 excluded denominators | ζ=1; r=0; p=2,3 | ζ/(1−ζ) and 1/r have totalized zero values at forbidden inputs; 24 is nonunit at 2,3. | These are outside the analytic/first-jet theorem, not valid zero limits. [r1] |
| §3.6 local rank-one freeness | ξ=0,s=1; s′=2s or 5s at p=5 | Ratios are 2 (unit) and 5 (nonunit). Coordinates of as under s′=2s are a/2. | Freeness concerns an invertible generator, not every nonzero section. [r1] |
| §3.7 phase normalization | ω=2 at p≥5 versus p=3 | ω−ω⁻¹=3/2 is a unit at p≥5 and 0 mod3. Zero cocycle gives β=0. | Prime restriction is tied to a computed denominator. [r1] |
| §3.7 linear extension | s′=2s,p=5; zero | E(a/2)·2ŝ=E(a)ŝ; E(0)=0. At degree zero the i seed extends i,−i,i. | Generator independence and scalar reconstruction agree. [r1] |
| §3.8 linear equalizer | K=ℚ,Δ=6,f₂=−1,others 1 | Nonlinear products are all 1, but edge 2→10 at p=5 asks −1=1. | Correctly rejects nonlinear-only membership. [r1] |
| §3.8 addition negative control | Same f and constant 1 | Their sum has values 0 at order2 and 2 elsewhere; γ=1 products are 0 at2 and 4 at10. | Printed nonlinear condition is not additive; linear equalizer excludes this defect. [r1] |
| §3.8 nonlinear consequence | Degree 0,f=1−q,γ=2 | Product is (1−q²)²(1−q⁻¹), a Laurent polynomial over ℤ[1/2]. | Localize coefficients; do not reduce modulo 2. [r1] |
| §3.9 zero-degree ring identification | f_pm=φ_R⁻¹rex(f_m) | Applying φ_R gives rex(f_m)=φ_R(f_pm), and applying φ_R⁻¹ reverses it. At the sign family the edge is −1≠1 in either form. | Both directions agree with ring gluing. [r1] |
| §3.9 graded multiplication | Degrees 0,0 and ξ,−ξ | 0·f=0,1·f=f,e(1−e)=0; ξ+(−ξ)=0. | Multiplication need not produce a unit. [r1] |
| §3.10 effective descent | H and proper idempotent summand eH | Component ranks are (1,1) for H and (1,0) for eH. | Rank one must hold on every component. [r1] |
| §3.10 finite-presentation negative control | L_p=p⁻¹ℤ_p in ℚ_p for every p | Intersection contains 1/2,1/3,1/5,…; every finite set of rational generators has bounded denominator support, so cannot generate it. | Local rank 1 does not prove finite generation; actual descent remains a target. [r1] |
| §3.11 tensor equivalence | M₀⊗M_ξ; dual pairing | 1⊗s↦s. A finite dual witness maps Σf_i⊗g_i to Σf_i g_i=1; a single fg=1 would imply more. | Keeps genuine tensor inverse, not global generator. [r1] |
| §3.11 Picard character | ξ=0 and ξ+(−ξ) | [M₀]=0 and [M_ξ]+[M_(−ξ)]=0. | Only after invertibility; agrees with pinned Picard API. [r1] |
| §3.12 substitution | γ=2,m=1,f=1−q; m=2 | At 1+x, 1−q²=−2x−x². Order 2 is sent to order 1. | Full order change, not an automorphism at every m. [r1] |
| §3.12 involution | q=ζ+x | q⁻¹=ζ⁻¹−ζ⁻²x+…; at ζ=1, x↦−x/(1+x), whose double application is x. | Pins sign, center and inverse map. [r1] |
| §3.13 proportionality | g=0; f=g; orthogonal idempotents | For g=0, a=b=0 and af=bg=0. For f=g, both sides use gτg; orthogonal factors may give b=0. | Cross multiplication is valid without division by a section. [r1] |
| §3.14 propagation | Zero component; series x | E(0)=0, but ct(x)=0 while x≠0. An inverted-prime component indicator has values 0 and 1 on disconnected components. | Neither constant-term nor across-Δ propagation is asserted. [r1] |
| §3.14 constant line | Torsor y²=2; zero degree | y is not in ℚ, while y spans its root line. At ξ=0,q² has constant 1 at q=1; zero section has constant 0. | Integral root-line target, not an unjustified scalar value. [r1] |
| §3.15 multiplication/freeness | Sections 1,0,1−q in degree zero | Multiplication by 1 is identity, by 0 is zero. If (1−q)f=1, evaluation at 1 would give 0=1. | Nonzero does not imply generator. [r1] |
| §3.16 pullback | ℚ→ℚ(i),p=5; identity | a↦(a,a), retaining both split factors; identity gives a↦a. | Field map fixes the abstract root and acts on coefficients. [r1] |
| §3.16 scalar base change | ξ=0 | H_S⊗_(H_R)H_R→H_S sends s⊗r↦sr and 1⊗1↦1. Arbitrary R coefficients would require the failed constant-i embedding. | Correct tensor base; no invented universal R-algebra structure. [r1] |
| §3.17 Galois action | K=ℚ(i),σ conjugation | i↦−i↦i, abstract ζ₄ unchanged. Involution τ instead sends ζ₄↦ζ₄⁻¹. | Coefficient action and q-involution differ. [r1] |
| §3.18 determinant norm | Split quadratic u=(1+2x,1+3x) | Norm=1+5x+6x²; coefficientwise norm misses 6. Base scalar 3 has norm 9 and trace 6. | Whole-series determinant and full rank retained. [r1] |
| §3.18 log/trace | Same u | x coefficient 5 on both sides; x² coefficient in log norm is 6−25/2=−13/2, equal to −4/2−9/2. | Correct additive regulator degree for a multiplicative norm. [r1] |
| §3.19 transfer | Quadratic extension, constants; tower degrees 2,3 | Norm(1+1)=4 but Norm(1)+Norm(1)=2; Norm(6)=36=Norm(2)Norm(3)=4·9. Tower gives (2²)³=2⁶=64. | Multiplicative, not additive; identity extension and 0,1 have expected values. [r1] |

The following ten finite-field rows are also carried unchanged from [r1]. Their total is 8,038 admissible triples, with no recorded KMS or shift failure. The unchanged quasi-periodicity checks comprised 1,735 cases, and the phase-free polynomial remainders were zero for n=1,…,16; those computations were not rerun in this incremental review.

| Field, n, ζ | Admissible triples | One (x,y,z) | KMS left/right | Shift left/right | Failures |
|---|---:|---|---|---|---:|
| 𝔽₁₁,1,1 | 72 | (2,3,6) | 1 / 1 | 6 / 6 | 0; [r1] |
| 𝔽₁₁,2,10 | 32 | (2,4,3) | 2 / 2 | 10 / 10 | 0; [r1] |
| 𝔽₁₉,3,7 | 108 | (2,10,5) | 5 / 5 | 11 / 11 | 0; [r1] |
| 𝔽₁₇,4,4 | 128 | (3,6,6) | 6 / 6 | 11 / 11 | 0; [r1] |
| 𝔽₃₁,5,2 | 500 | (3,11,7) | 30 / 30 | 26 / 26 | 0; [r1] |
| 𝔽₃₇,6,11 | 864 | (2,5,9) | 11 / 11 | 21 / 21 | 0; [r1] |
| 𝔽₄₃,7,4 | 1372 | (3,7,6) | 39 / 39 | 31 / 31 | 0; [r1] |
| 𝔽₇₃,9,2 | 4374 | (3,25,25) | 18 / 18 | 64 / 64 | 0; [r1] |
| 𝔽₂[t]/(t⁴+t+1),3,t+t² | 108 | (t,1+t,t) | t²+t³ / t²+t³ | t+t² / t+t² | 0; [r1] |
| 𝔽₃[t]/(t³+2t+1),2,−1 | 480 | (t,1+t,2t+t²) | 2+t+t² / 2+t+t² | 2 / 2 | 0; [r1] |

## Not verifiable

- No changed source locator was inaccessible; no new missing-reference request was needed. Unchanged source claims were carried from the previous full review, not re-certified by fetching every paper again.
- The positive F₂ comparison and its unramified arithmetic reduction square remain the declared K3BlochGroups gap. The calculation D(1)=ζ and R([0])=ζ² verifies a necessary test, not that signed naturality square. Acceptance is conditional on that exact contract.
- PadicHodgeRegulators supplies mathematical targets, including the universal normalization calibration, not a claim that these maps are implemented at the pins. The replacement references match its actual statements.
- Effective descent, the half-shift higher-defect argument, c_fixed normalization and coherent scalar/norm descent remain explicit proof obligations as in [r1]. A passing sorry build and the finite checks are not proofs of them.

## Source issues

The following errata are carried from [r1]; no additional source issue was found in the repair. The Pochhammer residue sign and the finite eta exact-valuation obstruction were rechecked at the locators discussed above.

- **Error** in GZ at Appendix A, Gaussian preceding (59), printed p.236, GZ line 912: the source says the quadratic exponent has positive coefficient 1/S; it should be −mn²ε/(2S), with the subsequent sum scaled by 1/√m; affects the proof.
- **Misprint** in GZ at Appendix A (60), printed p.237, GZ line 935 onward: the source says the m-th power has prefactor √(2π/ε); it should be (2π/ε)^(m/2), with the consistently tracked phase; affects the proof.
- **Error** in W-thesis at Lemma 2.12 proof, printed p.32, W-thesis line 1448: the source says Φ_m is irreducible modulo ℓ whenever ℓ∤m; it should be separable, retaining every field factor; affects the proof.
- **Error** in Q at Lemma 2.12 proof, printed p.18, Q line 781: the source says the prime-to-ℓ cyclotomic quotient is one residue field; it should be the full finite étale algebra, for example four factors at m=5,ℓ=11; affects the proof.
- **Error** in GSWZ at Definition 1.3 and Theorem 1, printed p.9, GSWZ lines 380–402: the source says arbitrary rational linear coefficients satisfy the intended local-section definition; it should require an integral first jet, excluding (1+x)^(1/p); affects a stated result.
- **Misprint** in GSWZ at (56), printed p.19, GSWZ line 858: the source says the additive-coordinate residue is positive pLi₂^(p)(ζ); it should be −pLi₂^(p)(ζ), since 1−q=−x; affects a stated result.
- **Error** in GSWZ at Definition 1.4 and Theorem 2, printed pp.10–11, GSWZ lines 415–447: the source says the nonlinear product condition defines the asserted module and recovers degree zero; it should include coherent full-order linear transitions; affects a stated result.
- **Gap** in GSWZ at proof of Theorem 2, printed p.43, GSWZ lines 2217–2220: the source says multiplicative compatibility yields the tensor isomorphism and invertibility; it should supply effective descent or a finite projective presentation with conservative tensor comparisons; affects the proof.
- **Error** in GSWZ at footnote 1, printed p.6, GSWZ lines 262–265: the source says the abelian scalar family uses the direct Artin action at m; it should use its inverse for the displayed Frobenius gluing direction; affects a stated result.
- **Error** in GSWZ at (329), printed p.65, GSWZ lines 3335–3336: the source says the p-adic completion agrees with R⊗ℤ_p without excluding inverted primes; it should restrict that identification to p∤Δ; affects a stated result.
- **Misprint** in CGZ at Proposition 4.2(a), printed p.22, CGZ line 1008: the source says the simultaneous local map lands in a direct sum; it should land in the product, since nonzero Frobenius values occur infinitely often; affects a stated result.
- **Error** in CGZ at proof of Theorem 5.2 after Lemma 5.3, printed p.27, CGZ lines 1243–1244: the source says the reduced order-n eta class generates at every q≡−1 mod n; it should require exact p-valuation or pass through higher-order distribution; affects the proof.
- **Misprint** in CGZ at §6 after (36), printed p.32, CGZ line 1488: the source says Q/nR is K₂(F); it should be K₂(F)[n], as in the surrounding exact sequence; affects nothing.

[r1]: packages/HabiroNumberFields/reports/PRREVIEW-HabiroNumberFields~1.md
