# Repair report: AnticyclotomicLocalUnits

## F01 (P2) — applied

The supersingular gap’s mass relation and exceptional-j criteria → imports from ModularCurvesPartII §12.1, `gammaZeroPrime_mass`, verified at head 35be0c8. Section 5.4 explicitly translates m+e/2+d/3=(p−1)/12 into p−1=12m+4d+6e. Updated scope, supplier contract, subsection and layer dependencies, Checks and the matching top-level gap. Trace-class counts and representatives remain requested from EllipticCurves.

## F02 (P2) — applied

Undefined “torsion-corrected” control → defined multiplicative completions and norm limits, exact kernel/cokernel/injectivity statements, and finite coinvariant projection/rank statements with nonexceptional-character hypotheses. README and gap agree. Evidence: Win80 line 80, line 167, line 192, line 296 and line 321. Added §0.3’s nonzero cyclotomic norm-cokernel Check; the trivial tame character is explicitly distinguished.

## F03 (P3) — applied

Asserted consumers → the documented InertAnticyclotomicCMMainConjecture imports and explicitly prospective HeegnerPointEulerSystems/SelmerIwasawaCohomologyPartII uses. Deleted the earlier SelmerIwasawaCohomology consumer claim. Verified the ALU nodes in `packages/InertAnticyclotomicCMMainConjecture/design/README.md` and the two prospective roadmaps’ scopes. Their order positions are 215, 251 and 240, all after AnticyclotomicLocalUnits at 214.

## F04 (P3) — applied differently

ClassFieldTheory Layer 0 ownership → pinned Tau Ceti declarations in scope, supplier contracts, §7.1 and its layer dependencies. Used the actual public names `TauCeti.TateCohomology.H0IsoNormQuotient` and `TauCeti.TateCohomology.HNegOneIsoNormKernelQuotient`; the review’s nested spellings are incorrect. Recorded totalization and multiplicativity’s finite outer Tate-group hypotheses. ClassFieldTheory remains the arithmetic duality/reciprocity supplier.

## F05 (P3) — applied

Section 8.2’s cokernel O/pO → Λ/pΛ. Added the explicit p=5 comparison: 𝔽₂₅[[T]] surjects onto 𝔽₂₅, contains independent classes 1,T, and has infinitely many independent monomials. The matrix with columns e₁,e₁+pe₂ has determinant p and image Λe₁⊕pΛe₂. The unchanged worked example asserts only failure of integral surjectivity and remains correct.

## F06 (P3) — applied

Corrected all seven Rubin line citations, the duplicated Rubin/Win citations, and the Win page range in both README and manifest. Corrected the manifest’s result kinds in §§5 and 7 as well: Theorem 5.3 and Lemma 5.5 are not propositions; 7.3–7.4 are propositions. Evidence: Rubin87 line 292, 306, 322, 325, 353, 389, 474, 508, 519, 526, 529; Win80 line 192.

## F07 (P3) — applied

Sections 2.1 and 8.5’s incomplete construction interfaces → prose APIs and three separate Checks each. Added finite exactness, both torsion transitions, field functoriality and trace pairing; signed membership, injectivity, restriction/corestriction, zero and sums. Computed |F(Φ)/π|=25 and Tr(3)=1 at p=5; finite signed image coranks at n=2 are 20 and 5. No Lean padding was added.

## F08 (P3) — applied

Deleted §6.5 from §7.1’s dependencies; §7.2 retains that edge. The rational signed representation from §§3.2–3.3 and finite-index invariance suffice: the induced O[G₁] contribution is p^(2(n−1)), and every odd-layer quotient contributes p^(−2). Rubin87 line 509–518 supplies that computation independently of a chosen point. Its product is 1,25,625 at p=5,n=1,3,5.

## F09 (P3) — applied

Section 4.3’s secondary locator alone → Kato93, Chapter II, Theorem 2.1.7, alongside BKO21 equations (3.4)–(3.6). Added the single source key and reference through the sources service, then completed its bibliographic metadata from BKO21 line 965–968. The publisher locator resolved as paywalled: status uncertified. BKO21 line 467–468 verifies the attribution; the original Kato text was not read.

## F10 (P3) — applied

“Finite field” meaning a p-adic extension → “finite extension of Φ” in the completion-realization contract, its top-level gap, Layer 2 introduction and the additional occurrence in Conventions. A whole-file search leaves no instance of that ambiguous phrase. The actual finite fields 𝔽_p and 𝔽_(p²), including the mass and trace examples, are unchanged.

## Verification outcomes

- From the content repository, ran `lake env lean` on `packages/AnticyclotomicLocalUnits/Suggested.lean`: exit 0, no output or warnings. It imports only Mathlib; no Tau Ceti object build was necessary. No Lean process remains running.
- Enumerated every declaration for the requested `#check @name` comparison: there are zero declarations. Elaborated the empty signature inventory in one scratch Lean file: exit 0, no output. There are no hidden section binders, new/deleted Lean names or README/signature changes. The missing arithmetic carriers listed in the existing module docstring remain absent at the pins; no abstract substitute was introduced.
- Ran the prescribed dependency check with `--movable`: exit 0. Its complete output was:

```text
depcheck: 48 roadmaps, 536 edges, 0 problem(s)
```

- Ran citation resolution after editing: exit 0; no cross-roadmap citations or Lean names found nowhere. The resolver says it cannot check external library names; those were inspected directly at the worker’s pinned sources instead.
- Parsed the manifest and plan: seven distinct source keys with required metadata; Kato93 and Wiles78 remain uncertified. All nine gap texts equal their README contracts. Only three top-level gap `needs` values changed; all other plan data, including every supplier, section, target and dependency, is unchanged.
- Both repaired constructions have exactly three Check bullets and their prose APIs. `git diff --check` passed. Scans found no stale reviewed line numbers, duplicated reviewed citations, “torsion-corrected”, ClassFieldTheory Layer 0 citation, ambiguous “finite field”, or machine paths in the edited deliverables.
- No gate failures were supplied in the brief. No tooling, merge order, other package, metadata or acceptance-file edits were needed. No commit or remote write was made.

## Source, pin and ownership audit

The main checkout is b41e47bc34e30def0db01d84cc92062ed72c6e68. The manifest pins Mathlib at 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Read the main LocalFieldsRamification, PadicMeasuresIwasawaAlgebras and ImaginaryQuadraticClassNumber roadmaps for form and their actual supplier boundaries.

Checked cross-roadmap locators against main where present, the supplied open heads for new roadmaps, and the board’s existing designs. No existing roadmap revision was used in place of main. Object searches used the roadmap service across the available open heads/main, the board packages, and the pinned libraries. Ownership against the available open work was checked; no new generic construction was assigned here. The added Kummer APIs describe this package’s existing formal division comparison and signed image, while the generic Cartier dual, cohomology, reciprocity and formal-point carriers remain imported.

| Supplier | Verified sections or targets and boundary |
|---|---|
| LocalFieldsRamification; ProfiniteArithmetic | Layers 0–3; §1.3: local fields, unit filtration and continuous p-adic powers |
| PadicMeasuresIwasawaAlgebras | §§1.7, 4.2–4.5, 5.2: coordinates, structure, compact limits and Nakayama; the two coefficient gaps remain explicit |
| IntegralIwasawaTheory, head 5d2ed25; ColemanPowerSeries, head 37908a0 | §§7.1–7.2; Layer 1: multiplicative interpolation and arithmetic Coleman sequence, not the requested general norm-control package |
| LubinTateFormalModulesAndQuasiCanonicalLifts | Existing design LT.0–LT.9, including every LT.7/LT.8 target named in the supplier contract; completion realization remains a gap |
| ClassFieldTheory; ArithmeticGaloisDuality, head 09ad340 | §§2.5–2.6, Layers 5–8; §§R02.1.2–R02.1.3: arithmetic normalization, local duality and genuine coefficient limits |
| NonordinaryCMSpecialValues | Existing design NCM.0–NCM.5, including unramified-cm-coefficients and scalar-tensor-character-comparison; no signed-unit ownership there |
| PadicHodgeRegulators, head 1a3728e | §§1.4, 1.7: ordered positive adjunction and trace compatibility; the local Coleman comparison remains here |
| EllipticCurves; ModularCurves; ModularForms | Layers 1, 3–5; Layers 5, 8–9; Layer 10B: supplied elliptic arithmetic, moduli and genus comparisons |
| ModularCurvesPartII, head 35be0c8 | §§3.2, 3.9, 5.2–5.3, 9.9–9.11, 12.1, 13.2, 13.7, 16.6; §12.1 contains the mass and exceptional criteria already |
| EllipticCurveModularity, head ed342f3 | R29.5–R29.6: chosen genuine parametrization and unconditional modularity |
| ImaginaryQuadraticClassNumber | H1.3, H2.1–H2.3: forms, splitting and class-number formula; the extra upper bound remains a gap |

The pinned public low-degree names are in `TauCeti/RepresentationTheory/Homological/TateCohomology/LowDegree.lean:151` and `:284`; periodicity is in `Periodic.lean:346`. The Herbrand definition and requested theorems are in `HerbrandQuotient.lean:105`, `:196`, `:206`, `:380`, `:482`; the totalization statement is at `:120`. Multiplicativity explicitly assumes cyclicity and finite outer degree-minus-one Tate groups. This is stronger evidence than the review’s mistaken nested names.

Also inspected the native unit-filtration body at `TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:99`, the abelian pro-p scalar action at `TauCeti/Topology/Algebra/Group/Profinite/ProP/PadicPow.lean:454`, completed algebra/action definitions at `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` and `Module.lean:344`, formal-point maps at `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/AdicCompletion.lean:273`, their range/reduction comparison, and Cartier duality at `TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:271`. None constructs the arithmetic signed tower. Mathlib’s referenced power-series, normal-basis and local-ring freeness declarations were checked in their contract files, including `Mathlib/RingTheory/LocalRing/Module.lean:299`.

The five certified papers were read from their supplied legal cache extractions. Wiles78 was not requested again. Kato93’s title/DOI service attempts encountered HTTP 429; the publisher-URL request succeeded in classifying the source as uncertified without fetching paywalled text. There is no outstanding missing-text request. The Kato attribution is certified only indirectly by BKO21 line 467 and line 965, not by inspection of Kato’s theorem.

## Adversarial mathematics pass

Values below were recomputed, including all added APIs and the unchanged consumers of the repaired objects. O has residue cardinal p²; p=5 unless otherwise specified. Finite cardinalities in the table use actual finite groups. “Retained” records no mathematical edit; “rejects” records a countermodel excluded by the hypotheses, rather than a failed target. Numerical evaluation supplies boundary evidence, not a proof of the general theorem.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| Conventions: prime and coefficient range | p=2,3,5; equal characteristic; zero ring | 1728=0 in 𝔽₂,𝔽₃, but 1728=3≠0 in 𝔽₅; in characteristic 5, 5=0; native characteristic-zero O has 5≠0 and 0≠1 | Exceptional collision and wrong coefficient carriers excluded | Retained |
| Conventions: π-basis | n=0,1 | [−5]w₁=−w₀; [−5](−w₁)=w₀=v₀ | Alternating π-basis agrees | Retained |
| Conventions: arithmetic Artin and twist | unit a=2 | κ(Art(2))=1/2; inverse Tate factor=2; product=1 | Direct and inverse factors distinguished | Retained |
| Conventions: conjugation | u in Γ⁻; u=1 | c u c⁻¹=u⁻¹; u·u⁻¹=1; 1⁻¹=1 | Correct inverse action | Retained |
| Conventions: fields and tame degrees | n=0,1,2 | Θ degrees 1,25,625; Ψ degrees 1,5,25; tame degrees 24 versus 6 | Same fields; finite extensions, not finite cardinality | F10 |
| Conventions: trace and different | unramified O=ℤ₅[z], z²=2; ramified ℤ₅[√5] | Trace matrices diag(2,4) modulo 5, determinant 3≠0; ramified diag(2,10), determinant 20 with valuation 1 | Unramified pairing perfect; ramified reuse rejected | Retained |
| §0.1 conductor parity and inversion | orders 1,5,25 | Conductors 0,2,3 give +,+,−; inversion preserves orders and these exponents | Parity table and both membership directions agree | Retained |
| §0.2 principal filtration/norm | 1; 1+ϖ; Teichmüller 2; base a in degree 25 | Residues 1,1,2; norms 1,a²⁵; N(u⊗b)=N(u)⊗b | Whole-unit alternative rejected | Retained |
| §0.2 projector | ω-vector and distinct η-vector; zero family | 24/24=1; nontrivial character sum=0; e_ω(0)=0 | Idempotent and membership agree | Retained |
| Norm-control definition | F=Φ; m=1; finite cyclotomic stages | Z(Φ)≃ℤ₅³, one valuation and two principal-unit coordinates; Φˣ/(Φˣ)⁵ has size 5·25=125; norm indices at levels n=0,1,2 are 1,5,25 | Actual multiplicative completion specified | F02 |
| Norm-control kernel and injectivity | Cyclotomic F′/Φ, nonexceptional free component with coordinate T=σ−1; e,Te,0 | T sends e,Te,0 to Te,T²e,0; the first two are nonzero; projection/norm sends Te,T²e,0 to 0,0,0 | Kernel and injectivity agree with Win80 line 192–198 | F02 |
| Norm-control cokernel and tame action | cyclotomic F′/Φ; nontrivial/trivial tame components | Cokernel ℤ₅, with quotient modulo 5 of size 5; ψ≠1 component 0, trivial component ℤ₅ | Surjectivity on every component rejected | F02 |
| Norm-control finite coinvariants | r=2,K=Φ,ψ=ω; n=0,1 | Ranks [Φ:ℚ₅]·5^(2n)=2,50; projection kernel I_n and quotient equal its norm image | Exact finite comparison; cyclotomic tame component excluded from freeness | F02 |
| §0.3 omega freeness | p=5, n=0,1 | Tame exponents 1 versus 6 modulo 24; free rank-two coinvariant ranks 2,50 | Nonexceptional component | Extra norm Check |
| §0.4 inverse Hom twist | trivial O; basis v,−v,5v | Evaluations b,−b,5b; last image 5O misses 1; twist factor at 2 is 1/2 | Nonbasis equivalence rejected | Retained |
| §0.5 quotient/generator change | σ and σ⁶ | Twisted relation κ⁻¹κ−1=0; generator-change ratio at σ=κ is 6κ⁵, a unit | Same closed ideal; rank-two specialization | Retained |
| §1.1 interpolation and coordinate | identity family; Z=X+X² | f=1, N(f)=1; inverse in Z begins −Z+2Z²; scalar rank 25 | Coordinate negation and rank-5 models rejected | Retained |
| §1.2 invariant derivative | f=1; coordinate derivative 2; v↦−v | f′/(fλ′)=0; 2h/2=h; (−a)(−h)=ah | Nonzero denominators and basis cancellation | Retained |
| §1.2 norm differentiation | consecutive levels, numerator A | Tr δ_(n+1)=−5δ_n; constant term of πh([π]X)=Σh(X[+]w) gives πh(0) on both sides | π-trace normalization agrees | Retained |
| §1.3 character derivative | n=0,1; order-5 ζ | (−1/5)A=(1/25)(−5A); covariance ζ⁻¹=ζ⁴≠ζ | Level independence and inverse character | Retained |
| §1.4 trivial Euler/descent | δ=1,0; χ(σ)=1 | 1−(−5)⁻¹=6/5; δ₁=6/5,0; (χ(σ)⁻¹−1)δχ=0 | Descent and kernel comparison | Retained |
| §1.5 signed unit kernels | ξ* with δ=1; zero; W=O² | δ₁(ξ*)=6/5≠0; all derivatives of zero=0; tensor derivative=(δχx,δχy) | Correct opposite-parity kernels | Retained |
| §1.5 scalar/tensor boundary | E=Φ(ζ₅), W=O[ζ₅] | ζ₅⊗1−1⊗ζ₅ is nonzero in the tensor, scalar image ζ₅−ζ₅=0 | Ramified scalar kernel cannot replace tensor kernel | Retained |
| §2.1 exact Kummer map | k=1; Q with λ(Q)=5u | λ([π]Q)=−25u gives class 0 modulo π; λ(Q) has nonzero class 5u modulo 25 | Kernel [π]F; zero map rejected | F07 |
| §2.1 finite size | L=Φ,k=1,2 | F(Φ)/π^k≃5O/5^(k+1)O has size 25,625 | Left exact term has expected size | F07 |
| §2.1 torsion transitions | primitive Q, k=1 | Inclusion transition Q mod π ↦ [π]Q mod π² is nonzero; reduction of that image modulo π is 0 | Distinct coefficient arrows pinned | F07 |
| §2.1 restriction/corestriction | identity; base Q in degree 5 | res Q=Q; formal trace Q=[5]Q; cor κ(Q)=κ([5]Q); identity maps fix κ(Q) | Two Kummer squares agree | F07 |
| §2.1 trace/Cartier comparison | 1,3,z in 𝔽₂₅=𝔽₅[z]/(z²−2) | Tr(1)=2, Tr(3)=1, Tr(z)=0; evaluation at zero=1 multiplicatively, 0 additively | Surjective trace and pairing normalization | F07 |
| §2.2 universal formal norms | height 2,n=1,2,3,4; n=0; height 1 | Depths 1,2,2,3; identity image at n=0 has depth 1; multiplicative norm cokernel at level n has size 5^n | Height/base hypotheses retained; no zero-index evaluation | Retained |
| §2.3 actual Kummer duality | π-torsion class; zero point | Values in π⁻¹O/O of size 25; zero pairs to 0 with every unit | Correct finite target and zero law | Retained |
| §2.4 anticyclotomic descent | scalar action a=κ(σ) | κ(σ)⁻¹a−1=0 versus untwisted 1−κ(σ), generally nonzero | Correct annihilator relation | Retained |
| §2.5 Wiles trace | m=k=0; m→m+1; y=0; k=0 | A/(−5)=−A/5; (−5A)/25=−A/5; zero gives 0; y⊗1=0 requires integral trace | π normalization preserved | Locator repaired |
| §3.1 Fourier logarithms | base log a; order-5 ζ | (5a)/5=a; Σζ^i a=0; λχ(gy)=ζλχ(y) | Direct character and normalized average | Retained |
| §3.2 signed points | n=0,1,2 | (rank A⁻,rank A⁺)=(1,0),(5,0),(5,20); base λ₁=a≠0 excludes A⁺ | Same-parity vanishing, both signs | Retained |
| §3.2 tensor saturation | 5O⊂O without saturation | Multiplication by 5 on Φ/O has kernel 5⁻¹O/O of size 25 | Unsaturated inclusion rejected | Retained |
| §3.3 rational Fourier lattice | cyclic orders 1,5,25 | Orbit dimensions 1; 1+4=5; 1+4+20=25; denominators 1,5,25 | No integral normal-basis assertion | Retained |
| §3.4 divisible sum | n=0,1,2,3 | Minus ranks 1,5,5,105; plus ranks 0,0,20,20; totals 1,5,25,125 | Both unbounded; divisible sum not assumed direct | Retained |
| §3.5 finite-level saturation | [π]z fixed; unsaturated comparison | [π](gz−z)=0 implies gz−z=0; 5O quotient/tensor defect each size 25 | Actual tower is torsion-free | Locator repaired |
| §3.6 signed annihilator | order-25 plus point component; trivial minus component | Plus-unit δχ=0 on the former, so λχδχ=0; minus-unit δ₁=0 on the latter | Both signed zero pairings agree | Retained |
| §3.7 disjointness/rank | rank-two V; n=2,3 minus points | Two quotient ranks ≥1 force signed ranks ≤1; coranks 5→105 exclude finite O-corank | Correct rank route | Locator repaired |
| §4.1 auxiliary field: small primes | All 13 primes from 5 through 47 | Selected D have (D/p)=−1; h(−7)=1,h(−15)=2,h(−31)=3, none divisible by selected p | Uniform small-prime coverage | Retained |
| §4.1 auxiliary bound | p=47,53 | Upper expression 48.9434676>47, 52.7611868<53; ratio at 53≈0.995494<1 | Large-prime bound starts at 53 | Retained |
| §4.2 projected class | exact order l; [1],[g]; p=5 | Conductor l²; evaluation 1,ν(g); Δ average 1/24 rather than 1/6; zero maps to 0 | Character and tame normalization | Retained |
| §4.3 dual-exponential comparison | n=0,1; trivial representation | π⁻¹=−1/5, π⁻²=1/25; exp*(log χ_cyc)=1 | Normalization agrees with §1.3 and supplier | Kato locator added |
| §4.4 CM values/sign | χ=1, order 5, order 25 | Euler deletion 1−(−5)/25=6/5; root signs +,+,−; last central value 0 | Same Euler factor and parity | Retained |
| §4.5 primitive plus unit | W with basis, all coordinates in 5O | Σδ(x_i)w_i lies in 5W; a unit has valuation 0 and cannot lie there | At least one coordinate is a unit | Retained |
| §5.1 auxiliary curve | y²+y=x³ at 5,11; y²=x³−x at 7 | Counts 6,12,8; a_p=(p+1)−count=0 each | Small primes included | Retained |
| §5.2 separable reduction | disk t+t²; disk t⁵; good optimal curve | Derivatives at 0 are 1,0; good-prime Manin valuation 0 | Inseparable reduction rejected | Retained |
| §5.3 scalar Frobenius | p²-traces ±10; orders 6 and 7 | Point counts 16,36; −5≡1 mod 6 but ≡2 mod 7 | Subgroup stability differs from pointwise fixing | Retained |
| §5.4 weighted mass | p=5,7,47 | m+e/2+d/3=1/3,1/2,23/6; (p−1)/12=1/3,1/2,23/6; multiplied identities 4,6,46 | Supplied mass translation agrees | F01 |
| §5.4 twist classes | p=5,7,47 | (N(2p),N(p),N(0))=(1,2,0),(1,0,2),(5,2,2); same for negative traces | Geometric invariants distinguished from twists | F01 |
| §5.5 different bound | levels 27,32; genus-one identity | μ=36,48; 2g−2=0≤6,8; identity different 0 | Correct separable bound | Retained |
| §5.6 generic count | p=5,13,23,29,47 | m=0,1,1,2,3; generic bounds 0,μ,μ,2μ,3μ; at 47 weaker source expression 0 | No positive conclusion at zero | Recomputed after F01 |
| §5.7 exceptional fibres | (p,N)=(5,27),(7,32); p=13 | μ/3=12>6; μ/2=24>8; at 13 d=e=0 | Congruence hypotheses distinguish fibres | Recomputed after F01 |
| §5.8 fine level | p=5,7 | M=6,8; φ(M)=2,4; #Ā(𝔽_(p²))=36,64; −p acts as 1 on M-torsion | Exact-order points and tame quotient | Retained |
| §5.9 primitive formal point | log 5u; multipliers 36,5 | Valuations 1→1 under 36, 1→2 under 5; 36≡1 mod 5 | Unit multiplier preserves disk and primitivity | Retained |
| §6.1 quasi-canonical images | s=0,1,2 | Degrees 1,6,30; at s=2, (24·25)/(4·5)=30; x₀=Q | Separate zero level; no natural subtraction | Retained |
| §6.2 tame trace | s=0,1,2 | Primed degrees 6,30,150 divided by 6 give 1,5,25; y=6Q, y₀=0 | Correct shifted field and primitive y | Retained |
| §6.3 lattice/Hecke traces | 𝔽₅², s=1 | Five outward lines (1,a), one inward (0,1); det((1,a),(1,b))=b−a≠0; omitted θ gives only one lattice | Correct p+1 neighbors | Retained |
| §6.4 trace recurrence | first two wild steps | y₀=0; Tr y₁=−6Q; Tr y₂=−y₀=0 | Initial trace differs from recurrence at s=0 | Retained |
| §6.5 parity and total trace | n=1,3,5; y₂ | Total traces −y,5y,−25y; λ₁(y₂)=0 and higher forbidden Fourier terms 0 | Signs and extra p factors agree | Locator repaired |
| Imported Herbrand definition | zero module; trivial group; infinite ⊕ℤ/5 with C₅ action | Finite zero Tate groups have sizes 1/1=1; trivial group also 1; infinite defining groups have Nat.card 0/0=0 | Totalization distinguished from finite ratio | F04 |
| Imported Herbrand cyclic boundary | trivial integral S₃ module versus C₅ | For S₃ h=6 but #H²/#H¹=2; for C₅ both ratios are 5 | Periodic comparison needs cyclicity | F04 |
| Imported Herbrand multiplicativity/invariance | trivial O, 5O⊂O with quotient O/5 | h(O)=25; h(5O)=25; h(O/5)=25/25=1; 25=25·1 | Finite-index invariance and exact product agree | F04 |
| §7.1 Herbrand lattice | n=1,3,5 | 5⁰=1; 5⁴·5⁻²=25; 5⁸·5⁻⁴=625; each O[G_k] has (Tate-zero size,H¹ size)=(5^(2(n−k)),1) | No primitive point used | F04,F08 |
| §7.2 first cohomology | n=3, primitive y; y=5y′ | |Ĥ⁰|≤25, h=25 gives |H¹|≤1; nonprimitive bound 625 instead | Primitivity is used here | Retained |
| §7.3 divisible invariants | base logarithm lattice 5O | 5O⊗Φ/O≃Φ/O; its π-torsion has size 25; comparison into O⊗Φ/O would have kernel size 25 | Actual base inclusion retained | Retained |
| §7.4 free quotient/kernel | X=Λ; X=Λ/(T); noncompact Φ/O | Both first two coinvariants are O, but ranks 1 and 0; noncompact M/5M=0 while M≠0 | Rank and compactness hypotheses essential | Retained |
| §8.1 augmentation generation | f=T,1+5T,5+T | Constant terms 0,1,5; coefficient-of-T(T)=1 while augmentation(T)=0 | Exactly 1+5T is a unit among these | Retained |
| §8.2 integral sum | standard basis; e₁,e₁+5e₂ | Determinants 1,5; cokernels 0,Λ/5Λ; latter has quotient 𝔽₂₅ and independent 1,T,T²,… | Rational complement does not suffice | F05 |
| §8.3 derivative nonzero | trivial character; exact order 25 | Optimal δ₁=6δ/5≠0; character orbit has dimension 20; a primitive point divided by π has nonzero class | Actual Kummer duality detects nonzero evaluation | Retained |
| §8.4 signed generator | plus v,−v; order-25 character | δ(v) valuation 0, δ(−v)=−δ(v) valuation 0; plus δχ=0, minus δχ≠0 | Matching/opposite parities agree | Retained |
| §8.5 membership/injection | n=0; zero; primitive Q | Plus image=0; minus image corank 1; Q⊗π⁻¹ maps nonzero; zero maps to zero | Zero-map replacement excluded | F07 |
| §8.5 sums/transitions | z+(−z); identity; base log a, degree 5 | κ(z)+κ(−z)=0=κ(0); identity fixes class; trace log 5a, not −5a | Submodule and two commuting squares | F07 |
| §8.5 signed coranks | n=2 | 20 exact-order-25 characters support plus points; 1+4=5 support minus; 20+5=25 | Injective images have coranks 20,5 | F07 |
| Worked discriminants | −7,−15,−31 | Reduced form lists have 1,2,3 elements; every discriminant is 1 modulo 8; all 13 chosen Legendre symbols equal −1 | Class-number witnesses agree with §4.1 | Retained |
| Worked modular and lattice examples | p=5,7,47; distinct a,b | (μ,exceptional bound)=(36,12),(48,24); at 47 mass 46=36+4+6; b−a≠0 for distinct outward lines | Same objects in Layers 5–6 | Recomputed after F01 |
| Worked generation example | f=1+5T; f=T | δ(fe)=1 in first example with δ(e)=1; augmentation of Te=0 while coefficient extraction gives 1 | Same distinction as §8.1 | Retained |

## Maintainer consequences

All ten findings are addressed within the authorized package files. The general norm-control, trace-class and completion-realization obligations remain supplier gaps; this repair does not claim to have changed their suppliers. Mass ownership now points to the existing ModularCurvesPartII §12.1 target, and generic Herbrand ownership to the pin. No Lean name cited by another roadmap changed. InertAnticyclotomicCMMainConjecture’s signed Kummer carriers, labels and normalizations are unchanged. Fresh independent mathematical review remains required.
