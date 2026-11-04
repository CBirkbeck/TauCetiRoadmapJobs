<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1062#issuecomment-6399388065 -->
Red team round 1 pass a (codex) of e118857

Verdict: needs_changes

1. **F01** (P2) The auxiliary quadratic-field existence theorem is absent from the acceptance test

   **Location:** `packages/AnticyclotomicLocalUnits/README.md:615`; `packages/AnticyclotomicLocalUnits/Suggested.lean:9–37`. The README promises an imaginary quadratic field for every p≥5, with 2 split, p inert and p not dividing its class number.

   **Claim:** The acceptance test omits §4.1’s auxiliary-field existence theorem while listing missing carriers for the other headlines. That auxiliary-field assertion already has native carriers at the pins.

   **Witness:** Mathlib already has `NumberField`, `NumberField.IsTotallyComplex`, `Module.finrank`, `NumberField.classNumber`, prime ideals and ideal products. For p=5, K=ℚ(√−7) has degree 2, two primes over 2, inert 5 and class number 1.

   **Exact repair text:** “The auxiliary-field assertion of §4.1 is the headline `exists_auxiliaryQuadraticField`: for every prime p≥5 there exists a number field K with [K:ℚ]=2 and no real places, such that (2)=PQ for distinct prime ideals P,Q of its ring of integers, (p) is prime, and p does not divide `NumberField.classNumber K`.” Add this theorem with `sorry` to `Suggested.lean`, using native field/number-field instances and ideals; register its name in §4.1. Keep the separate Hecke-character assembly in the README and explain its missing carriers in the module docstring. No class-number algorithm or surrogate numerical predicate is needed.

   **Repair test:** In K=ℚ(√−7), use α=(1+√−7)/2 with α²−α+2=0: modulo 2 the polynomial is X(X−1), while modulo 5 its discriminant −7≡3 is nonsquare. Thus (2)=PQ with P≠Q, (5) is prime, and 5∤1. The repaired statement retains every clause of the existing auxiliary-field theorem. Pinned locators: `Mathlib/NumberTheory/NumberField/Basic.lean:42`, `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:209`, `Mathlib/NumberTheory/NumberField/ClassNumber.lean:64`, `Mathlib/RingTheory/Ideal/Prime.lean:41`. No elaboration was run under the read-only review restriction.


2. **F02** (P2) The coordinate gap duplicates an earlier multivariable supplier

   **Location:** `packages/AnticyclotomicLocalUnits/README.md:70`, and the matching `quadratic-coefficient-coordinates` entry in `packages/AnticyclotomicLocalUnits/design/plan.json`.

   **Claim:** PadicMeasuresIwasawaAlgebras must supply a new two-variable coefficient-preserving coordinate, its local-domain structure, twisting and plus-relation quotient.

   **Witness:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:1321–1341`, §3.0, already owns multivariable coordinates over complete local coefficients, regular-local DVR specialization, closed-subgroup quotients and continuous character twists. Its merge-order position is 63; this package’s is 214.

   **Exact repair text:** “Use SelmerIwasawaCohomology §3.0, `iwasawaAlgebra_mvPowerSeries_equiv`, `iwasawaAlgebra_isRegular_augmentation` and `iwasawaAlgebra_twist`, for the continuous O-coefficient two-variable coordinate, its regular-local structure, twisting and closed Γ⁺ quotient. Use PadicMeasuresIwasawaAlgebras §1.7 for finite-free coefficient extension and §4.5 for the one-variable comparison.” Replace the matching gap needs in both files by only the additional naturality comparison: “Relative to those supplied coordinates and twists, identify the two-variable coordinate under finite-free unramified coefficient extension and changes of the selected Γ⁺ and Γ⁻ generators, and prove that specialization of the plus coordinate to zero equals PadicMeasuresIwasawaAlgebras §4.5’s selected Γ⁻ coordinate.” Assign this residual comparison to SelmerIwasawaCohomology §3.0 and update §0.5’s Needs line. Delete the residual gap too if its naturality is already supplied when the repair is made.

   **Repair test:** Take R=O, d=2 and Δ=1 in the existing supplier. It gives O[[S,T]] and quotient by σ−1 equal to O[[T]], of dimensions 3 and 2. Its twist sends σ−κ(σ) to κ(σ)(σ−1), with identical quotient ideal since κ(σ) is a unit. At p=5 a generator change by 6 has linear coefficient 6, a unit. These are precisely the claimed application, with no new coordinate owner. Supplier text was read at its current new-roadmap head through the roadmap service; service output adds a one-line header, removed from the cited line numbers. This is a minimality finding, not a finding that an announced gap remains unimplemented.

3. **F03** (P2) The derivative recipe has no nonzero pure generators on its stated domain

   **Location:** `packages/AnticyclotomicLocalUnits/README.md:284`: “For a pure element x=u⊗a⊗v⁻¹ of U∞* … Extend O-linearly and continuously.” Here u is the actual principal-unit family used by §1.1.

   **Claim:** Pure tensors already lying in the omega component supply the generators on which the derivative is defined.

   **Witness:** At p=5 choose a tame element with ω(d)=ζ₃∉ℚ₅. In the rationalized unit tensor, d(u⊗a)=ω(d)(u⊗a) forces ζ₃∈ℚ₅ if u⊗a≠0. Thus the stipulated pure tensors cannot span the nonzero omega component.

   **Exact repair text:** “Use the finite-free limit comparison to identify Ũ∞ with (lim P_n)⊗_ℤ_p O. First define the logarithmic-derivative maps on Ũ∞*=Hom_O(T,Ũ∞): for an arbitrary finite tensor presentation x=Σ_i u_i⊗a_i⊗v⁻¹ set δ̃(x)=Σ_i a_i f′_(u_i)(0)/f_(u_i)(0) and δ̃_n(x)=Σ_i a_i f′_(u_i)(v_n)/(λ′(v_n)f_(u_i)(v_n)). Prove ℤ_p-balancedness, presentation independence and continuity there. Define δ and δ_n by restricting to U∞*=(Ũ∞*)^Δ.” Add the equivalent projected-generator rule using e_ω(u⊗a), and make this ambient domain explicit in the API and proof route.

   **Repair test:** Take the elementary tame module M=O over ℤ₅ with d acting by ζ₃, and extend scalars to O. The vector z=(1⊗1+ζ₃⊗ζ₃⁻¹+ζ₃²⊗ζ₃⁻²)/3 satisfies dz=ζ₃z and multiplication sends z to 1, so z≠0. None of its nonzero pure summands individually lies in that eigenspace. The repaired ambient finite-sum recipe applies to z before restricting; the original recipe supplies no value for it. In general a nonzero equality (du)⊗a=u⊗ζ₃a over ℚ₅ forces the two second tensor factors to be ℚ₅-proportional, contradicting X²+X+1 being irreducible modulo 5. This is a domain defect, not a claim that the intended Coates–Wiles maps do not exist.

## Verified sound

Read all 1,154 README lines and all 47 Suggested.lean lines at the requested head. The inventory has **50 numbered README targets**, **96 Check bullets**, **69 distinct line-numbered source locators** across five available works, **nine declared gap entries**, and **zero Lean declarations**. The 96 Check bullets were evaluated below. For coordinate transport in §1.2, λ denotes the pullback of the fixed logarithm; renormalizing that logarithm is a different operation. Numerical calculations include all 13 small primes in §4.1, enumeration of the displayed reduced forms, the three finite-field point counts, twist-count formulas, signed ranks through level five and the p=53 bound. These computations test statements; they are not substitute proofs of the roadmap.

The gap slugs and needs sentences agree between README and plan. Comparing the plan at origin/main with the reviewed head after removing only its top-level gaps gives equality. The pull-request diff is confined to `packages/AnticyclotomicLocalUnits/`. There is one `import Mathlib`, no `set_option`, no admitted data, no `lemma`, no process-number citation and no algorithmic target in the reviewed README or Lean file. No padding declaration exists because no declaration exists.

### Declaration and headline inventory

| File/context | Declarations and binders | Computed audit result | Consequence |
|---|---|---|---|
| Suggested.lean, namespace TauCetiRoadmap.AnticyclotomicLocalUnits | No theorem, definition, instance, structure, abbreviation, opaque constant or section variable | Counts all 0; one import; namespace opens once and closes once | The list of required `#check @name` commands is empty. No elaboration or Lean build was run. No disappearing instance can occur. |
| §§0.3,0.5: rank-two arithmetic units and anticyclotomic quotient | Actual LT tower, norm limit and inverse Tate twist | Native completed algebra alone gives a ring, not those three arithmetic objects | Missing carriers named in Lean lines 11–13. |
| §1.1: height-two interpolation | Actual formal O-module, torsion basis, analytic evaluation | Formal power series have coefficients/derivative, not an assigned LT arithmetic tower | Missing carriers named in lines 14–15. |
| §§2.2–2.5: norm vanishing, arithmetic duality, reciprocity | Actual point towers, Kummer maps and derivatives | Generic Hom and cohomology do not select this arithmetic pairing | Missing carriers named in lines 16–19. |
| §§3.6–3.7: signed annihilators and ranks | Actual logarithms and signed submodules | No native signed arithmetic submodule in either pin | Missing carriers named in lines 20–21. |
| §4.1: auxiliary quadratic field | Number field, degree, real places, ideals, class number | Degree 2, two factors over 2, inert 5 and class number 1 for ℚ(√−7) | Statable but omitted: R01. The additional CM-character assembly remains separate. |
| §4.5: optimal plus unit | Actual signed unit and derivative | A free abstract Λ-module would omit the arithmetic derivative | Missing carriers named in lines 22–23. |
| §§5.9,6.4–6.5: primitive modular point and trace system | Integral modular map, marked quasi-canonical quotients and formal points | No native integral modular parametrization or marked LT quotient tower | Missing carriers named in lines 24–26. |
| §§7.2–7.4: minus cohomology, invariants and freeness | Signed point module and actual action/quotient | Generic cohomology is available but does not define A⁻ or X⁻ | Missing carriers named in lines 27–31. |
| §§8.2–8.5: integral sum, derivative nonvanishing and finite Kummer export | Actual signed arithmetic carriers and maps | No abstract free-module or scalar substitute identifies these objects | Missing carriers named in lines 32–37. |

### Computed pass: conventions and target statements

Unless a row specifies otherwise, p=5, π=−5, O is the unramified quadratic integer ring, Λ=O[[T]], and fractions in pairings are taken modulo O. “Consistent” means the displayed instances agree with the statement, not that its future proof has been formalized. The first column identifies each target’s standing variable/instance context; the last records any change required.

| Statement and context | Instances tried | Values on the two sides, or correct and incorrect models | Result/change |
|---|---|---|---|
| Conventions: prime, field, coefficient ring | p=2,3,5; equal characteristic; zero ring; square-zero ring | 1728 reduces to 0,0,3; in characteristic 5, 5=0; in the zero ring, 1=0; in O[ε]/ε², ε²=0 with ε≠0 | The native characteristic-zero field/DVR and p≥5 hypotheses exclude these degenerate models. |
| Coefficients: O versus Φ and ramified integers | Quotient by p; O=ℤ₅[√2] versus ℤ₅[√5] | O/5O has 25 elements; Φ/5Φ=0; trace-pairing determinants 8≡3 and 20≡0 modulo 5 | Integral and unramified restrictions are necessary. |
| Towers, signs and zero level | n=0,1,2 | Θ degrees 1,25,625; Ψ degrees 1,5,25; full tame degree 24; ring-class tame degree 6 | Consistent; no primed-degree formula at s=0. |
| π-adic versus p-adic Tate basis | Consecutive indices 0,1 | [−5](−w₁)=w₀; [−5]w₁=−w₀ | Alternating sign retained. |
| Artin normalization and dual action | Artin unit 2; inverse twist | Tate multiplier 1/2, inverse-twist multiplier 2, product 1 | Arithmetic reciprocity and contragredience agree. |
| Quadratic directions and admissible groups | u∈Γ⁻; S₃; trivial Γ | u(cuc⁻¹)=uu⁻¹=1; (12)(23)≠(23)(12); trivial Γ has rank 0 rather than 2 | Nonabelian and rank-zero ambient alternatives violate stated hypotheses; trivial finite level remains allowed. |
| Compact/discrete topology | Γ compact; torsion-free discrete target | A continuous homomorphism has finite torsion-free image, hence image size 1 and value 0 | Supports the discrete cocycle argument; valued topology is not substituted. |
| §0.1 conductor parity, finite continuous χ | Orders 1,5,25; inversion | c=0,2,3; conductor ideals O,25O,125O; signs +,+,−; inverse order 25 still gives 3 | Partition and both directions of membership agree; three Checks discriminating. |
| §0.2 principal units, norms, projector | 1,1+ϖ, Teichmüller 2; ω and η≠ω vectors | Residues 1,1,2; N(1)=1; N(a)=a²⁵ for fixed a; projector eigenvalues 24/24=1 and 0/24=0 | Native principal subgroup and additive identity agree; e² eigenvalues 1 and 0. |
| §0.3 rank-two freeness, nonexceptional tame component | n=0,1,2; trivial character | Coinvariant O-ranks 2,50,1250; tame exponents 1 and 6 modulo 24 differ; trivial norm cokernel ℤ₅≠0, nontrivial tame part 0 | Consistent conditional on the declared norm-control contract. |
| §0.4 inverse Tate twist, basis evaluation | h(v)=b; −v; pv; κ(g)=2 | Evaluations b,−b,5b; image of evaluation at 5v misses 1; action multiplier 1/2, not 2 | Basis condition and diagonal action are essential. |
| §0.5 quotient and generator change | S=0 on Λ₂²; σ′=σ⁶ | Both basis vectors survive, rank 2; σ−κ acts by 0; σ−1 acts by κ−1 before inverse twist and by 0 afterwards; shifted-coordinate ratio at σ=κ is 6κ⁵ | Arithmetic quotient consistent; reuse the multivariable supplier: R02. |
| §1.1 Coleman interpolation and norm, arithmetic family | Identity family; products; basis −v | f=1 gives 25 factors 1, norm 1 and derivative 0; (fg)(v_n)=u_nw_n; f([−1](−v_n))=u_n | Norm rank is 25 rather than 5. Transported additive inverse for Z=X+X² begins −Z+2Z². |
| §1.2 derivative domain | A tame order-three action, ζ₃∉ℚ₅ | Nonzero pure eigenvector count 0 after rationalization; projected sum z has multiplication image 1 | Define on the ambient tensor first: R03. |
| §1.2 derivative values, basis and coordinates | f=1; basis −v; X=2Y | f′/(fλ′)=0; (−a)(−h)=ah; pulled-back numerator and λ derivative both acquire factor 2, which cancels | The Check is correct for the pulled-back λ. If instead renormalized to λ(2Y)/2, its derivative at zero is 1 and the ratio changes by 2; that is a different normalization. |
| §1.3 character derivatives, admissible n | χ(g)=ζ₅; n=0,1; next weighted numerator −5A | Covariance ζ₅⁴ rather than ζ₅; factors −1/5 and 1/25; (−5A)/25=−A/5 | Character specialization and adjacent-level normalization agree. Descent is for χ trivial on Γ⁺ as in §1.4. |
| §1.4 trivial character and descent | δ=1,0; χ(σ)=1 | δ₁=6/5,0; χ(σ)⁻¹−1=0; full torsion sum −5h(0), nonzero-torsion sum −6h(0) | Removing zero and dividing by −5 gives 6/5, not 1. |
| §1.5 signed kernels and coefficient extension | ξ* with δ=1; zero; W=O²; W=O[ζ₅] | δ₁(ξ*)=6/5≠0; minus δ=0; zero in both; tensor derivative (δx,δy); ζ⊗1−1⊗ζ≠0 maps to 0 under multiplication | Opposite parity and tensor kernels are essential; the scalar comparison is not assumed for ramified W. |
| §2.1 Kummer sequence, finite L and k≥1 | Base primitive Q; k=1,2; Q and πQ | Quotient sizes 25,625; Q mod π≠0; πQ mod π²≠0 but πQ mod π=0 | Transition directions and exactness agree. Trace on residue scalars sends 1↦2 and 3↦1. |
| §2.2 universal formal norms, height two | n=0,1,2,3,4; multiplicative height-one control | Identity image depth 1; positive-depth formula 1,2,2,3; intersection of depths is 0; multiplicative norm cokernels have sizes 1,5,25 at initial cyclotomic levels | No n=0 subtraction; ramified-base shrinking estimate remains an explicit target, not supplied by Haz77 alone. |
| §2.3 actual two-variable Kummer duality | Primitive Q and one compatible dual x | Pairings at π⁻² and π⁻¹ are 1/25 and −1/5; multiplication by −5 gives −1/5 then 1=0 modulo O; zero pairing gives 0,0 | Nonzero finite tests exclude the zero pairing; identity restriction/norm gives −1/5 on both sides. |
| §2.3 coefficient trace | 1/5 and 3/5 | Trace values 2/5 and 6/5≡1/5 modulo ℤ₅; identity would give 1/5 and 3/5 | The unramified trace is not an identity scalar map. |
| §2.4 anticyclotomic descent | Untwisted σ-eigenvalue κ(σ) | κ⁻¹κ−1=0 after twisting; repeated untwisted relation would give 1−κ | Correct quotient/invariant directions. |
| §2.5 explicit trace reciprocity | Adjacent admissible m; k=0; zero input | πA/π^(m+2+k)=A/π^(m+1+k); at m=k=0 both −A/5; y⊗1=0; zero input has trace 0 | Formula has the correct negative π factor; k=0 requires integral trace. |
| §3.1 Fourier logarithms, finite y and χ | Base logarithm a; χ=1 and order 5; inflation | 5a/5=a; aΣζ₅^i=0; direct covariance ζ₅ versus unit covariance ζ₅⁴ | Three Checks distinguish normalization, level and character direction. |
| §3.2 signed points and saturation | n=0,1,2; primitive base point; pO⊂O | (rank A⁺,rank A⁻)=(0,1),(0,5),(20,5); nonzero base logarithm excludes A⁺; unsaturated tensor kernel has 25 elements | Same-parity vanishing and saturation retained. |
| §3.3 rational Fourier lattices | C₁,C₅,C₂₅ | Orbit dimensions (1),(1,4),(1,4,20); total dimensions 1,5,25; averaging denominators 1,5,25 | Normal basis is rational; integral bound uses trace projectors. |
| §3.4 signed sum and intersection | Levels 0,1,2 and divisibility | Ranks (A⁻,A⁺)=(1,0),(5,0),(5,20); 25F(Ψ₂) is in the integral sum; tensoring clears the denominator | Integral intersection 0 does not by itself prove divisible intersection 0. |
| §3.5 finite-level saturation | πz fixed at level n; unsaturated pO⊂O | π(gz−z)=0 implies gz−z=0 since π-torsion in Ψ∞ is 0; unsaturated quotient and tensor kernel both size 25 | Natural tensor injections have the required saturation. |
| §3.6 signed annihilator | Order-25 character and plus sign | Plus point support may have conductor 3; plus-unit derivative on it is 0, hence product 0; trivial component belongs to A⁻ | Same sign annihilates same sign because unit and point vanishing conventions differ. |
| §3.7 rank bounds and disjointness | Ambient rank 2; n=2,3 | Each quotient rank ≥1 leaves signed rank ≤1; minus point ranks 5,105 are unbounded; Ann(D⁺+D⁻)=Ann(D)=0 | O-torsion-free quotients and finite-generation hypotheses are retained. |
| §4.1 auxiliary field, every prime p≥5 | All p≤47; p=53 | Euler-criterion residues are p−1 in all 13 cases; h(−7),h(−15),h(−31)=1,2,3; upper bound at 53 is 52.7611867782<53 | Arithmetic witnesses agree; add the native acceptance theorem: R01. |
| §4.2 early-class projection | Order l; [g],[1],[h]; p=5 | Correct conductor l² versus incorrect l; evaluation ν(g),1; H augmentation 1; Δ denominator 24 versus point trace length 6 | Sources, coefficient order and projection convention retained. |
| §4.3 dual-exponential comparison | Trivial representation; n=0,1 | Supplied exp*(logχ_cyc)=1; finite factors −1/5,1/25 | Positive ordered adjunction matches the supplier; original Kato proof remains uncertified. |
| §4.4 special values and signs | χ=1, order 5, order 25 | Euler deletion 1−(−5)/25=6/5; root signs +,+,−; wrong-sign central value 0 | Period and scalar-to-tensor comparison explicitly retained. |
| §4.5 optimal plus unit | Finite free unramified W; all coordinates in 5O | Sum of coordinate derivatives lies in 5W, residue 0; a unit has nonzero residue | Some coordinate has valuation 0; no plus freeness is assumed. |
| §5.1 rational supersingular curve | Stated curves over 𝔽₅,𝔽₁₁,𝔽₇ | Counts 6,12,8; traces 0,0,0; quadratic trace −10 at p=5 gives 36 points | Finite models are nonsingular; optimal-isogeny replacement preserves the good local trace. |
| §5.2 good optimal parametrization | Unit differential; t+t²; t^5 in char 5 | Manin valuation 0; derivatives at zero 1 and 0 | Nonconstant characteristic-zero lift alone is insufficient; separable reduction is supplied by the unit. |
| §5.3 scalar-Frobenius subgroup descent | Traces ±10; torsion orders 6 and 7 | Scalars ±5 give counts 16,36; −5≡1 mod 6 and ≡2 mod 7 | Subgroup stable need not mean every point fixed; LT sign is −5 for trace −10. |
| §5.4 mass and twists | p=5,7,47 | (m,d,e)=(0,1,0),(0,0,1),(3,1,1); masses 1/3,1/2,46/12; (N(±2p),N(±p),N(0))=(1,2,0),(1,0,2),(5,2,2) | Geometric invariants and rational twist classes remain distinct. |
| §5.5 ramification/different | N=27,32; identity; Frobenius; tame square | μ=36,48; g=1 so different 0≤6,8; identity different 0; Frobenius differential 0; square-map multiplicity 1 | Generically étale hypothesis excludes Frobenius; wild contributions are allowed. |
| §5.6 generic supersingular count | p=5,13,47 | Counts 0,μ,3μ; at 47 weak expression is 0 but stronger 3μ>μ/6 | No positive existence conclusion drawn at p=5 from the generic bound. |
| §5.7 exceptional fibres | p=5,N=27; p=7,N=32; p=13 | Bounds 12>6 and 24>8; at 13 exceptional indicators both 0 | Correct use of orbit sizes 3 and 2. |
| §5.8 fine lift and stabilizers | M=6 at p=5; M=8 at p=7; levels 27,32 | φ(6)=2, φ(8)=4; −5 acts identically on 6-torsion and −7 on 8-torsion; residual stabilizers are removed by the selected N | Fine model and completed-disk comparison are declared, not inferred from a coarse point alone. |
| §5.9 primitive CM formal point | λ(Q) in 5O minus 25O; multipliers 36 and 5 | Valuations 1 and 2 for Q and [5]Q; 36≡1 gives unit derivative; multiplier 5 gives derivative 0 in residue field | Primitivity and completed-disk isomorphism are preserved only by the first multiplier. |
| §6.1 marked quasi-canonical modular points | s=0,1,2,3 | C₀=0,x₀=Q; field degrees 1,6,30,150; conductor orders ℤ₅+5^sO; first LT tame degree 24≠6 | Marked quotient and level transport use the named supplier, not a new lattice classification. |
| §6.2 tame-trace system | y₀,y; Q=0 negative control | y₀=0, y=6Q primitive; if Q=0 then y=0; trace length 6 instead of 24 | Base input and zero-level trace are distinct. |
| §6.3 Hecke neighbours | p=5,s=1 | Outward lines (1,a), a=0,…,4; determinant b−a≠0; inward (0,1); missing θ collapses the five proposed directions to one | Correct orbit supplies the relative trace; T_p acts as a_p=0. |
| §6.4 trace recurrence | s=0,1,2 | y=6Q; y₀=0; first trace −6Q; second trace 0; next relative trace −y₁ | Boundary −y is not −y₀; no extra p in relative recurrence. |
| §6.5 parity and total trace | n=1,2,3,5 | Odd total traces −y,5y,−25y; even n=2 total trace 0 | Even y_s is plus, odd y_s minus; trivial character boundary consistent. |
| §7.1 finite Herbrand quotient | Odd n=1,3,5 | h=1,25,625; n=3 product 5⁴·5⁻²=25; using residue size 5 would wrongly give 5 | Ratio uses finite groups and residue cardinality 25. |
| §7.2 H¹ vanishing | n=3; primitive y; y replaced by 5y | Norm contains 5Oy, so size Ĥ⁰≤25 and h=25 force size H¹=1; nonprimitive input only gives bound 625 | Primitive input essential; finite-image cocycles reduce to finite odd level. |
| §7.3 divisible invariants | Base lattice 5O; π-torsion | (5O)⊗Φ/O is abstractly Φ/O, whose π-torsion has 25 elements; inclusion into O⊗Φ/O is multiplication by 5 and has kernel 25 | Uses actual base-point inclusion, not the latter unsaturated lattice map. |
| §7.4 quotient/kernel freeness | X⁻/(T)=O; negative control Λ/(T) | Residual dimension 1 and size 25 in both; Λ-ranks 1 and 0 respectively | Positive rank rules out the cyclic torsion countermodel. |
| §8.1 augmentation generation | T,1+5T,5+T | Constant terms 0,1,5; coefficient-of-T sends T to 1 while augmentation sends it to 0 | Only 1+5T is a unit; continuity alone does not imply generation. |
| §8.2 integral direct sum | Signed basis; e₁,e₁+5e₂ | Determinants 1 and 5; second cokernel 𝔽₂₅[[T]], with quotient by T of size 25 and independent 1,T | Actual integral surjectivity is stronger than rational complementarity. |
| §8.3 all character derivatives | χ=1 and exact order 25 | δ₁(ξ*)=6δ(ξ*)/5≠0; order-25 rational orbit dimension 20; a primitive orbit lattice vector divided by π has nonzero class | Perfectness excludes an identically zero character derivative. |
| §8.4 signed generator nonvanishing | χ=1 and order 25; generator multiplied by −1 | Plus δ valuation 0, minus δ=0; multiplying generator gives sign −1; order-25 plus derivative 0 and minus derivative nonzero | Matching versus opposite parity and all generators agree. |
| §8.5 finite signed Kummer images | n=0,2; primitive Q; degree-5 and identity traces | At 0 plus=0, minus corank 1 and Q/π≠0; at 2 coranks 20 and 5 sum to 25; trace log 5a, identity a | Same finite carriers and restriction/corestriction squares retained. |

### Explicit small-prime and finite-field computations

| p | D | D modulo 8 | D^((p−1)/2) modulo p | h(D) | Nondivisibility |
|---|---|---|---|---|---|
| 5 | −7 | 1 | 4 | 1 | 5∤1 |
| 7 | −15 | 1 | 6 | 2 | 7∤2 |
| 11 | −15 | 1 | 10 | 2 | 11∤2 |
| 13 | −7 | 1 | 12 | 1 | 13∤1 |
| 17 | −7 | 1 | 16 | 1 | 17∤1 |
| 19 | −7 | 1 | 18 | 1 | 19∤1 |
| 23 | −31 | 1 | 22 | 3 | 23∤3 |
| 29 | −15 | 1 | 28 | 2 | 29∤2 |
| 31 | −7 | 1 | 30 | 1 | 31∤1 |
| 37 | −15 | 1 | 36 | 2 | 37∤2 |
| 41 | −7 | 1 | 40 | 1 | 41∤1 |
| 43 | −15 | 1 | 42 | 2 | 43∤2 |
| 47 | −7 | 1 | 46 | 1 | 47∤1 |

The reduced-form lists are respectively {(1,1,2)}, {(1,1,4),(2,1,2)}, and {(1,1,8),(2,−1,4),(2,1,4)}. Their discriminants are −7,−15,−31, all forms have gcd 1, and the boundary sign convention removes the reflected duplicates. Thus the cardinalities are 1,2,3. The nonsingular models y²+y=x³ over 𝔽₅ and 𝔽₁₁ have 6 and 12 points including infinity; y²=x³−x over 𝔽₇ has 8. Each trace p+1−#E is 0. These were finite checks of the README examples, not proposed computational targets.

### Interface and boundary audit

These rows record the auxiliary API clauses used alongside the numbered targets. They do not assert that testing examples proves a general theorem.

| Interface or excluded input | Instances and values | Result/change |
|---|---|---|
| Standing coefficient domain | p=2,3 fail p≥5; a ramified coefficient DVR has e>1 instead of e=1; characteristic-p coefficients have p=0 instead of v(p)=1 | These are excluded explicitly, not silently included instances. Generic suppliers retain their own domains. |
| Group and rank domains | S₃ and Q₈ are nonabelian, hence cannot be Δ×ℤ_p²; Γ=1 has rank 0 instead of 2; Γ=ℤ_p has rank 1 instead of 2 | No claimed rank-two conclusion applies to these countermodels. The general norm-control contract separately has r≥1. |
| Topology and scalar actions | Discrete ℤ with its usual addition has infinitely many singleton opens and is not compact; finite principal-unit quotients have p-power orders | Compact Hausdorff inverse limits and discrete direct-limit point groups are distinguished. No arbitrary-topology carrier occurs in Lean. |
| Projector/limit API, §0.2 | e_ω on eigencharacters ω,η gives 1,0; norms of 1 and base a give 1,a²⁵ at p=5; differing coordinate at n prevents equality of families | Idempotence, compatible projections, extensionality and actual norm action match. Ambient tensor presentations still need R03. |
| Evaluation and postcomposition, §0.4 | h(v)=3 gives h(−v)=−3 and h(5v)=15; postcomposition by multiplication 2 then 3 gives 18, as multiplication 6 | Basis evaluation is invertible; evaluation at 5v has proper image 5O. Identity and composition clauses require no new owner. |
| Quotient universal property, §0.5 | Λ₂²→Λ² takes S e₁ to 0 and e₂ to e₂; x and x+S e₁ have equal image; an equivariant map detecting S e₁ does not factor | Closure and actual relation image are retained. Coordinate ownership changes under R02. |
| Character covariance, §§1.3,3.1 | For a cyclic character with χ(g)=ζ, reindexing Σχ(h)h(a) gives ζ⁻¹; reindexing Σχ(h)⁻¹h(a) gives ζ | Two inverse conventions are intentional. For χ=1 both factors are 1. A nonabelian arbitrary representation is not substituted for these one-dimensional characters. |
| Finite connecting-map obstruction, §2.1 | On Φ, the primitive logarithm-p point is not π-divisible in F(Φ), so its mod-π boundary is nonzero; a π-multiple has zero boundary | The Kummer kernel is the image of multiplication by π, not all points. Cartier dual is a distinct native object. |
| Duality domains, §§2.3–2.4 | O/π has 25 elements at p=5 and its O-linear dual into Φ/O has 25; zero has one element and dual zero | Finite/perfect and compact/discrete limits use different topologies; trace to ℚ_p/ℤ_p is through the unramified different. No arbitrary ramified self-duality is claimed. |
| Signed projection and saturation, §§3.2,3.5 | At n=2, point coranks 20 and 5; if πx is killed by a field-valued logarithm, πλ(x)=0 implies λ(x)=0 since π≠0 | Same-parity point kernels are saturated; the argument would fail with a target killed by π. |
| CM projection, §4.2 | A group-ring element [g]+2[h] maps to ν(g)+2ν(h); augmentation sends it to 3; at ν(g)=−1,ν(h)=1 the first value is 1 | Projection, augmentation, zero and addition are actual maps with different outputs; source conductor r+1 retained. |
| Fine-level marking, §5.8 | M=6 gives φ(M)=2; at p=5 this is a unit. Multiplication by #E(𝔽₂₅)=36 has reduction 1 modulo 5 | Prime-to-p marking and origin-rescaling preserve the selected unramified disk. There is no blanket coarse universal-family claim. |
| Formal group law, §§5.9–6.2 | Under h(X)=X+X², formal inverse begins −Z+2Z²; naive −Z differs by 2Z². Tame trace of a base point is 6Q at p=5 | All point operations and traces use the formal law, not ordinary coordinate addition. |
| Herbrand totalization, §7.1 | Trivial finite group on the zero module: 1/1=1; C₅ on trivial O: #Ĥ⁰=25, #H¹=1; an infinite defining Tate group gives Nat.card=0 | Actual finiteness is proved before using ordinary cardinalities. No 0/0 is treated as 1. |
| Unit and zero-ring boundaries, §8.1 | f=0 gives δ=0, not a unit; f=T gives f(0)=0; f=1+5T gives f(0)=1 | The zero ring and unit ideal do not enter the unramified integer-ring domain. The native unit criterion is cited, not redeclared. |
| Identity, levels and universes | Identity trace is 1·a; degree-5 trace of a base logarithm is 5a; Ψ₀=Φ; primed degree formula is restricted to s≥1 | No negative-level natural subtraction, division by zero, out-of-range array index, empty-cover argument or universe-lifting construction occurs. |

### Supplier, ownership and pinned-library audit

Checked the cited contracts in **17 distinct supplier roadmaps**, including each numbered section/target named in the README; also checked the multivariable owner in R02 and the three named consumer boundaries. Read current service snapshots for open suppliers, the supplied local heads for PadicHodgeRegulators and the two prospective consumers, and main for existing roadmaps. Board designs supplied the named LT and NCM nodes. Current main was `794d0fcddfd32a8c6bb445faa33347cc578f43b0`; Mathlib was `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No newer library was substituted.

| Supplier | Resolved section/target and boundary | Computed compatibility witness |
|---|---|---|
| LocalFieldsRamification | Layers 0–3; principal units at README:267, pro-p target at :355 | Residue-nontrivial Teichmüller unit is outside U₁; 1+ϖ is inside. |
| ProfiniteArithmetic | §1.3, README:403–428, native abelian pro-p scalar action | Exponents 1,0,−1 give x,1,x⁻¹. |
| PadicMeasuresIwasawaAlgebras | §§1.7,4.2–4.5,5.2; README:909,2409,2485,2530,2620,3367 | γ↦1+T, γ⁶−1↦6T+15T²+20T³+15T⁴+6T⁵+T⁶. `TauCeti.Iwasawa.exists_completedCoordinate` is a planned declaration in its Suggested.lean:650, not a missing pinned theorem. |
| IntegralIwasawaTheory | §§7.1–7.2, multiplicative unramified Coleman theory and the declared norm-control extension | Parent scalar algebra has rank p=5; this height-two target has rank 25. Coefficient Frobenius is retained in the parent. |
| ColemanPowerSeries | Layer 1, determinant norm and norm/evaluation refinements | N(1)=1 and multiplication norm of a base scalar in rank 5 is a⁵, not a²⁵. Height-two interpolation remains this continuation’s work. |
| LubinTateFormalModulesAndQuasiCanonicalLifts | LT.0–LT.2; LT.4/unramified-honda-comparison and elliptic-honda-comparison; LT.5–LT.6; all eight named LT.7–LT.8 comparison nodes; LT.9 | LT design:738,757 gives scalar −p, type p+X² and parameter −p; :1124,1336 gives primed degrees 6,30 and tame-fixed degrees 1,5 at p=5. No sign or level mismatch. |
| ClassFieldTheory | §§2.5–2.6, Layers 5–8; README:460–473 fixes arithmetic Artin | Artin unit a has cyclotomic value N(a)⁻¹; LT value a⁻¹; inverse Tate value a. |
| ArithmeticGaloisDuality | R02.1.2–R02.1.3, compact coefficient limits, lim¹ and discrete torsion transition | T/π→T/π² uses multiplication by π under the Φ/O realization; an identity transition would give a different direct limit. |
| NonordinaryCMSpecialValues | NCM.0–NCM.4 and NCM.5/unramified-cm-coefficients, scalar-tensor-character-comparison | Exact order l gives conductor l²; W(φ)=1 gives root signs +1 at c=2 and −1 at c=3. Its canonical-character existence is imported from ComplexMultiplicationAndExplicitReciprocity CM.4; current CM.4.3 still supplies that existence and good reduction. |
| PadicHodgeRegulators | Current supplied head §§1.4,1.7 | Ordered adjunction is positive; trivial-representation log χ_cyc maps to 1; trace of a base scalar over degree 5 is 5a. |
| EllipticCurves | Layers 1,3–5; trace convention at README:689–715, twist section :1154 | a₅=0 gives a₂₅=−10 and 36 points. Extra trace-class enumeration is declared, not falsely attributed to the present Layer 3. |
| ModularCurves | Layers 5,8,9 at README:1279,1648,1803 | Marking M=6 is within fine affine range; cyclic order-N subgroup transport uses p∤N. |
| ModularCurvesPartII | §§3.2,3.9,5.2–5.3,9.9–9.11,12.1,13.2,13.7,16.6 | Composite levels 27 and 32 are permitted good models; μ=36,48. §13.7’s existing exact expansion comparison is prime-level, so the declared composite-level congruence extension is necessary. |
| ModularForms | Layer 10B, README:1115–1118 | g=1+μ/12−e₂/4−e₃/3−c/2 gives 1 for N=27 and 32; the index is in PSL₂. |
| SchemeAndStackFoundations | §3.2, scheme Riemann–Hurwitz with the different | Genus-one target gives different degree 2g_X−2; wild multiplicity is not replaced by tame e−1. |
| EllipticCurveModularity | R29.5–R29.6, README:1464 onward | A degree-d isogeny changes the parametrization differential; the package chooses the optimal representative before asserting a good-prime unit. |
| ImaginaryQuadraticClassNumber | H1.3,H2.1–H2.3, README:35,53,57,67 | D=−7,−15,−31 give h=1,2,3; w=2 in these cases. The requested upper estimate differs from the existing ineffective lower-bound direction. |
| Additional earlier owner: SelmerIwasawaCohomology | §3.0, README:1317–1358 | d=2 gives O[[S,T]], regular dimension 3, and quotient S=0 gives O[[T]]; R02. |
| Consumer boundaries | InertAnticyclotomicCMMainConjecture design:20,40 imports this package; HeegnerPointEulerSystems and SelmerIwasawaCohomologyPartII current scopes are only prospective consumers | The latter’s unitary rank-(2,3) arithmetic and the former’s global Heegner systems are not another construction of these height-two local signed units. |

Ownership searches by object covered the main/Completed trees, board packages and the indexed open-head README/Suggested files, including the supplied sibling checkouts. Searches included formal modules and torsion, Coleman norms, Coates–Wiles maps, anticyclotomic signed units, Cartier and compact duality, multivariable coordinates, supersingular mass, primitive formal points and auxiliary quadratic fields. The shared constructions have the owners above. The specific height-two interpolation, arithmetic unit eigenspace, signed decomposition, primitive modular point and its trace system belong here; no second owner for those precise statements was found. The auxiliary-field existence with simultaneous dyadic splitting, inert p and p-prime class number was not found as another roadmap’s target. There are zero own Lean fully qualified names to collide with a sibling.

| Pinned API read | Definition/hypothesis audit and values |
|---|---|
| Mathlib/RingTheory/PowerSeries/Basic.lean:76,139; Derivative.lean:49; Inverse.lean:109 | Coefficients/constant coefficient are native maps; derivative is formal, with derivative(1)=0. Unit criterion tests f(0), so T is a nonunit and 1+5T a unit. No analytic evaluation is supplied by these declarations. |
| Mathlib/FieldTheory/Galois/NormalBasis.lean:58,120,127 | Finite-dimensional field extension and IsGalois instances remain in scope; normal basis element at σ is σ of its identity component. A purely inseparable extension is not admitted by IsGalois. |
| Mathlib/RingTheory/LocalRing/Module.lean:299 | `Module.free_of_flat_of_isLocalRing` requires finite flat module over the local ring; the finite projective application has both hypotheses. Zero module has rank 0, consistent with this generic result. |
| TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:99,192 | Native subgroup is transported from integer-unit congruence kernel; pro-p is not a field in that definition. Depth one distinguishes 1+ϖ from a residue-nontrivial unit. |
| TauCeti/Topology/Algebra/Group/Profinite/ProP/PadicPow.lean:454,473 | Abelian pro-p module/action with its topology; scalar 0 sends the additive point to 0 and scalar 1 fixes it. |
| TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145; Module.lean:344,387 | Inverse-limit carrier does not imply arbitrary coefficient compactness; action uses actual compact-module and continuous-action hypotheses. The ring identity acts as identity. PowerSeries/ProductCoordinate do not supply the two-infinite-variable O-coordinate themselves. |
| TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/AdicCompletion.lean:273,292; Range.lean:158; KerReduction.lean:79,87 | Source is maximal-ideal points over a height-one completion; image is 0 or 1<v(x), and equals the native reduction kernel. Formal parameter 0 gives elliptic identity; an arbitrary complete local field needs the declared realization comparison. |
| TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:271,331 | Contravariant equivalence over an arbitrary commutative base. μ_p and its Cartier dual constant ℤ/p are different group schemes in characteristic p; no self-duality of the LT kernel is imported. |
| TauCeti/RepresentationTheory/Homological/TateCohomology/LowDegree.lean:151,284; Periodic.lean:346 | Finite group coefficients in Rep, with IsCyclic for periodicity. Ĥ⁰ is invariants/norm, Ĥ⁻¹ is norm-kernel/augmentation. For trivial C₅-action on O these have orders 25 and 1. |
| TauCeti/RepresentationTheory/Homological/TateCohomology/HerbrandQuotient.lean:105,196,206,380,482 | Totalized rational quotient; finite module theorem uses cyclicity; multiplicativity assumes finite outer degree-minus-one groups; invariance assumes finite kernel and cokernel. These conditions match §7.1’s proof route. |

No LT, Coates–Wiles or anticyclotomic arithmetic declarations were found by object searches in either pinned library. The existing elliptic formal-group carrier is not an O-linear Lubin–Tate division tower. R01 uses different, already native number-field carriers.

### Declared gaps

All nine slugs occur in both the README’s exact supplier contracts and plan.json; none names supplier `none`. Their present absence from a supplier is not reported as a defect.

| Slug | Precision, ownership and minimality audit | Witness |
|---|---|---|
| quadratic-coefficient-coordinates | Duplicates an earlier owner; R02 | O,d=2 gives the requested coordinates and twist quotient in Selmer §3.0. |
| compact-coefficient-duality | Coefficient/compact-limit and Φ/O-dual comparisons remain explicit contracts | O has ℤ_p-rank 2; dual of O/π has order 25, not 5. |
| general-unit-norm-control | General r≥1 norm theorem, specified irreducible tame component, nonexceptional rank-two specialization | Trivial tame component has cokernel ℤ_p; at p=5 the ω and cyclotomic tame exponents are 1 and 6 modulo 24. |
| formal-point-completion-realization | Specifies actual finite local extensions, model and compatible maps; native completion API alone does not do this | Transporting only an abstract field would not identify formal-point source or its reduction kernel. |
| supersingular-trace-classes | Existing geometric supersingularity is retained; exact finite-field trace counts are the extension | p=5 gives N(±10)=1, N(±5)=2, N(0)=0. |
| mixed-level-disk-comparison | Actual mixed marking and unramified disk, not a blanket coarse universal curve | M=6,φ(M)=2,p=5 meets the marked good-model hypotheses. |
| good-model-hecke-comparison | Integral composite-level correspondence to marked CM orbit and quotient map is the residual comparison | At p=5 there are six first neighbours, and five outward plus one inward later. |
| integral-congruence-comparison | Extends the prime-level exact lattice comparison to the required composite conductors | N=27,32 are composite; a prime-level theorem cannot be substituted. |
| quadratic-class-number-upper-bound | Concrete uniform upper estimate, distinct from current H2.3’s lower-bound program | At p=53 its right endpoint is 52.7611867782<53. |

### Sources and mechanical direction check

All **69 distinct explicit extraction-line locators** were opened in context. This is a count of resolved line locators, not 69 independently proved theorems. The table gives every such locator; the source issues below record disagreements rather than certifying the affected source inference.

| Source | Locators opened | Result |
|---|---|---|
| BKO21, published pp.947–963 | BKO21 lines 249,253,260,265,270,272,287,295,306,308,339,422,434,467,469,490,516,522,527,535,539,542,543,547,550,554,573,590,594,603,617,652,694,703,712,739,746,748,753,769,781,791,793,860 | 44 locators; definitions, propositions and proof steps match the cited published sections. Corrections and coefficient-injectivity qualification were checked against the extraction. |
| Rubin87, §§1–2,4–7,10 | Rubin87 lines 116,124,249,276,292,306,322,325,339,353,359,361,365,389,474,508,519,529,665 | 19 locators; denominator assertion is specifically Lemma 5.5(vi), not an unrestricted integral Fourier decomposition. Augmentation correction to Lemma 4.2 is necessary. |
| Haz77, Theorem 1.3, pp.305–306 and proof §§2–4 | Haz77 line 37 | Absolutely unramified mixed-characteristic base, p>2, height≥2 and total ramification are present; depth n−floor((n−1)/2) tends to infinity. The package does not transplant this exact formula to a ramified base. |
| Win80, §4(i),(iii), pp.91–92; §§5.2–5.5.3, pp.93–98 | Win80 lines 112,192,296 | Norm module, nonexceptional tame component and rank inputs are the cited direction; finite reciprocity alone is not substituted for control. |
| AU96, Theorem A p.269; Propositions 3.3–3.4 and Lemma 3.2, pp.276–278; proof p.279 | AU96 lines 49,322 | Good-prime Manin-unit range and the congruence/differential comparison agree with the named supplier gap. Optimality is retained. |

The read-only dependency command returned exactly:

```text
depcheck: 52 roadmaps, 591 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The additional owner in R02 is earlier in the order. No order file or tooling was edited. The prior repair dispositions were checked; none of the three findings re-raises a finding marked “not actionable in this package.”

## Not verifiable

- Wiles78, pp.235–254, and Kato93, Chapter II, Theorem 2.1.7, for explicit reciprocity, are settled as uncertified in sources.toml. Their texts were not requested again. BKO21’s stated use and the current supplier statements were checked; the underlying unavailable proofs were not certified.
- No Lean build or elaboration was run, as required by this read-only pass. Suggested.lean contains no named declaration, so the elaborated-signature inventory is empty. R01’s proposed native signature still requires the repair worker’s normal elaboration check.
- The available scans include OCR and linearized formulas. A missing fraction bar or overbar in an extraction is not treated as a printed-source error. Mathematical identities were recomputed independently; no new erratum is based only on such a lost glyph.
- The declared supplier extensions remain contracts, not completed proofs. This review verifies their declared placement and stated mathematical scope; it cannot certify future implementations. Whole-paper proof verification beyond the cited claims is not asserted.

## Source issues

- **Error** in Rubin87 at §2, pp.407–408 (Rubin87 line 124): the source says Coleman interpolation uses the unadjusted p-adic division system; it should be the π=−p system, with alternating signs between consecutive generators; affects the proof; corrected in print at BKO21 §2, footnote 2, p.948.
- **Error** in Rubin87 at Lemma 4.2, p.410 (Rubin87 line 249): the source says continuity of a functional and a unit value force a rank-one Iwasawa generator; it should be augmentation-linearity, or the explicit maximal-ideal-to-pO condition, since coefficient extraction sends the nonunit T to 1; affects a stated result.
- **Gap** in BKO21 at §2, p.948 (BKO21 line 272): the source says an arbitrary omega-component element can be represented by one pure tensor; it should be a finite tensor-sum construction on the ambient module, followed by restriction to the omega component; affects the proof.
- **Misprint** in BKO21 at §3.0.2, p.952 (BKO21 line 435): the source says a character of exact order l^m uses ray conductor l^m and layer L_m; it should be order l^r, conductor l^(r+1), and layer L_r for r≥1; affects the proof.
- **Gap** in BKO21 at Proposition 3.3(3), p.953 (BKO21 line 481): the source says scalar character-value zeros immediately give membership in the tensor-extended signed kernel; it should be justified using the unramified coefficient realization and injective tensor multiplication, or by proving tensor-valued vanishing directly; affects the proof.
- **Error** in BKO21 at Lemma 5.1(ii), p.956 (BKO21 line 576): the source says trace 2εp gives Honda type p+εX² and Lubin–Tate parameter −εp; it should be type p−εX² and parameter εp, so trace −2p has parameter −p; affects a stated result.
- **Gap** in BKO21 at Lemma 5.2(ii), p.956 (BKO21 line 599): the source says the displayed lower bound yields an unramified generic point for every p≥31; it should be supplemented at p=47, where that bound is zero, by the stronger generic-fibre count 3μ; affects the proof.
- **Misprint** in BKO21 at proof of Lemma 5.2, p.957 (BKO21 line 654): the source says the modular parametrization has ramification indices 2 or 3 at elliptic points; it should be the forgetful j-map in that fibre-count argument; affects the proof.
- **Misprint** in BKO21 at §5.0.2, p.958 (BKO21 line 728): the source says the degree belongs to Φ′_s; it should be Ψ′_s, the ring-class field just defined; affects a stated result.
- **Misprint** in BKO21 at proof of Theorem 5.5(ii), p.959 (BKO21 line 756): the source says scalar units 1+ap^s distinguish the p outward lattices; it should be 1+ap^sθ for a second integral basis direction θ, giving distinct lines; affects the proof.
- **Misprint** in BKO21 at proof of Theorem 5.5(ii), p.959 (BKO21 line 759): the source says outward neighbours are conjugates of x_s over Ψ′_s; it should be conjugates of x_(s+1); affects the proof.
- **Misprint** in BKO21 at proof of Theorem 5.5(ii), p.959 (BKO21 line 767): the source says the first Hecke trace sums over Δ; it should be Δ′ of order p+1, avoiding multiplicity p−1; affects the proof.
- **Misprint** in BKO21 at Corollary 5.6, p.959 (BKO21 line 771): the source says the quotient numerator is untwisted V∞ while its denominator is starred; it should be V∞* in the numerator, as in the following proof; affects a stated result.
- **Misprint** in BKO21 at §6.0.2, p.962 (BKO21 line 864): the source says the finite character group is Gal(Ψ_n/Ψ); it should be Gal(Ψ_n/Φ), using the defined base field; affects a stated result.
- **Misprint** in Haz77 at Theorem 1.3, p.306 (Haz77 line 49): the source says the integral part is the smallest integer at most r; it should be the greatest integer at most r; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e118857f25b6a615102260bdf0a35c98084d3988", "job": "RT-AnticyclotomicLocalUnits~1a", "model": "gpt-6-astra", "worker": "chris-16"} -->
