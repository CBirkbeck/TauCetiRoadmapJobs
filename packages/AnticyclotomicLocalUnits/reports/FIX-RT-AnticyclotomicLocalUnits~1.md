# Mathematical repair report

The first three finding sections refer to RT-AnticyclotomicLocalUnits_r1a.md; the following four refer to RT-AnticyclotomicLocalUnits_r1b.md. Their identifiers repeat, so their order and review attribution are retained. No finding is silently combined with another. These are repairs and computed checks, not independent acceptance.

## F01 (P2) — applied

Review a. Omitted field existence → `exists_auxiliaryQuadraticField`, with prime and p≥5 hypotheses, degree two, total complexity, distinct prime factors of (2), primality of (p), and class-number nondivisibility. Section 4.1 names it and adds positive/negative field Checks. BKO21 line 339 supports every clause. The separate marked Hecke-character assembly remains unstatable and is identified in the module docstring.

## F02 (P2) — applied

Review a. New multivariable coordinate request → consumption of SelmerIwasawaCohomology §3.0's coordinates, regular sequences, closed quotients and twists. The existing coordinate gap now requests only coefficient/generator naturality and agreement with PadicMeasuresIwasawaAlgebras §4.5. Both the README and plan name SelmerIwasawaCohomology §3.0. Scope, §0.5 and Layer 0 dependencies agree; no supplier construction is replanned.

## F03 (P2) — applied

Review a. Pure tensors presumed inside the omega component → finite tensor sums on the ambient inverse twist, followed by restriction to Δ-invariants. Sections 0.2 and 1.2 now specify finite-free limit transport, balancedness, continuity and the projected-generator formula. The order-three tensor Check has multiplication image 1. Rubin87 line 126 explicitly extends the derivatives on the ambient tensor module.

## F01 (P2) — applied

Review b. Norm-control gap including finite freeness → kernel/cokernel and coinvariant-to-norm-image control only. Section 0.3 owns general nonexceptional rank-two finite-level freeness and its passage to the arithmetic limit. Its route uses logarithm lattices, normal basis and topological Nakayama, with three Checks. Win80 line 296 and Win80 line 301 support that ownership. Only top-level plan gaps changed.

## F02 (P2) — applied

Review b. Duality requested from PadicMeasuresIwasawaAlgebras → CompletedCohomologyPartII §§3.1–3.2, including the compact/discrete topologies, inverse-precomposition action and qualified biduality. The coefficient gap retains general finite-free limit commutation: §1.7 explicitly covers measure/completed-algebra base change, not arbitrary principal-unit limits. Updated §§2.3–2.4, §7.4 and Layer 2/7 dependencies; §3.6 uses the Layer 2 pairing.

## F03 (P3) — applied

Review b. LocalFieldsRamification supplying normal basis → LocalFieldsRamification supplying ramification. The normal-basis input remains Mathlib `IsGalois.normalBasis`, at Mathlib/FieldTheory/Galois/NormalBasis.lean:120. Both §3.3 and the repaired §0.3 use finite Galois normal basis, with the finite-dimensionality hypothesis. The main-branch LocalFieldsRamification Layers 0–3 contain no normal-basis target.

## F04 (P3) — applied

Review b. Correct sign cited without qualification → explicit correction at §5.3, also referenced at §5.1's use of the same lemma. BKO21 line 576 prints parameter ∓p, whereas its proof at BKO21 line 586 gives scalar Frobenius ±p. The retained parameter is εp for trace 2εp; the Check computes both signs. LT.4 states this same convention.

## Verification outcomes

- Required elaboration, run from the content checkout with the absolute path to the final `Suggested.lean`: exit 0. Its only diagnostic was `packages/AnticyclotomicLocalUnits/Suggested.lean:55:8: warning: declaration uses sorry` (diagnostic path rendered repository-relative). One theorem, no auxiliary definitions, no Tau Ceti import, no missing object build, and no options were required. An earlier invocation from the board directory failed because that directory has no default toolchain; the specified content-directory invocation succeeded without changing any environment or toolchain file.
- Mechanical signature audit: a scratch copy containing the final file and `#check @TauCetiRoadmap.AnticyclotomicLocalUnits.exists_auxiliaryQuadraticField` elaborated, exit 0, with only the intended sorry warning. This is every declaration in the file. The output retains p, `Nat.Prime p`, `5 ≤ p`, the existential field and number-field instances, degree two, total complexity, both prime ideals, their distinctness and product, prime (p), and class-number nondivisibility. No section variable or needed instance disappeared. No signature correction was needed after this audit.
- Required dependency command with `--movable`: exit 0, output exactly:

```text
depcheck: 52 roadmaps, 593 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The two added supplier edges point to earlier roadmaps. No merge-order file changed.

- Citation resolver: no unresolved cross-roadmap citation and no unresolved Lean name. The resolver's host did not inspect pinned Lake packages, so native declarations were inspected locally instead. In particular `TauCeti.Iwasawa.exists_completedCoordinate` is a PadicMeasuresIwasawaAlgebras §4.5 target, not a declaration claimed to exist in the pinned library.
- The final plan, with top-level `gaps` omitted, equals the original plan with `gaps` omitted. All nine gap slugs have matching supplier/needs contracts in the README. Only the three reviewed gap entries changed. README and Lean have exactly one own declared name, `exists_auxiliaryQuadraticField`, in agreement.
- `git diff --check`: exit 0, no output. The changed-file inventory contains only the README, Suggested.lean, top-level plan gaps and this report.
- No gate failures were supplied separately in the brief. The citation lead about the completed coordinate was settled by its supplier attribution, not by inventing a pinned declaration. Sources and metadata required no changes. No source was added or requested; Wiles78 and Kato93 retain their settled uncertified status.

## Ownership, sources and scope

The pinned revisions are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, as in the content manifest. Native carriers used for the added theorem were read at Mathlib/NumberTheory/NumberField/Basic.lean:42, Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:209, Mathlib/NumberTheory/NumberField/ClassNumber.lean:64 and Mathlib/RingTheory/Ideal/Prime.lean:41. In particular prime ideals are proper, so the unit ideal cannot witness either splitting or inertness. Total complexity means all infinite places are complex; combined with degree two it gives the intended imaginary quadratic field.

The main-branch PadicMeasuresIwasawaAlgebras, LocalFieldsRamification and ImaginaryQuadraticClassNumber roadmaps were read for shape and ownership. The roadmap service was used to search ownership by objects and to inspect new-roadmap suppliers at their heads, particularly SelmerIwasawaCohomology §3.0 and CompletedCohomologyPartII §§3.1–3.2. Its multivariable coordinate explicitly fixes each variable's image; its twists fix group-element images. It does not explicitly state the comparison to the selected PadicMeasuresIwasawaAlgebras coordinate under all requested coefficient and generator changes, so that residual gap is retained. PadicMeasuresIwasawaAlgebras §5.2 states compact inverse-system and Nakayama results, not the duality being requested before this repair. Its scope excludes that duality. The remaining general limit comparison is already a declared supplier gap, not an assertion that the supplier states it.

Ownership searches also covered the board's packages, the supplied sibling checkouts and main through the roadmap grep service. The Lubin–Tate and early CM suppliers are design packages: their LT.0–LT.9 and NCM.0–NCM.5 contracts were read in `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md` and `packages/NonordinaryCMSpecialValues/design/README.md`. The service does not list them as merged/open roadmap folders. Their positions and contracts remain explicit; this repair makes no claim of proof closure. The listed open sibling checkouts were searched by the relevant objects, including the regulator comparison at `TauCetiRoadmap/PadicHodgeRegulators/README.md` §1.4. No supplier is inferred merely from its title. This package retains the particular arithmetic derivatives and auxiliary field: the existing owners supply generic coordinates/duals and quadratic-field arithmetic, not these existence and arithmetic comparison theorems.

Source verification used the five provided legal extractions. Key repair evidence is BKO21 line 253 (ambient tensor and omega component), BKO21 line 265 (inverse twist), BKO21 line 270 (derivatives), Rubin87 line 126 (ambient linear extension), BKO21 line 339 (auxiliary field), Win80 line 192 (norm control), Win80 line 296 (finite freeness), Win80 line 301 (rank calculation), Win80 line 321 (torsion exclusion), BKO21 line 573 and BKO21 line 586 (opposite printed/proved signs). The positive-valuation denominators and formal-norm scope were compared with Haz77 line 37. The good-prime differential application retains AU96 Theorem A, p.269 and its optimality hypotheses. No text from a source is reproduced in this report.

The native unit-filtration body at TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:99 is a transported congruence kernel, `((Units.map ...).ker).map ...`; its field, valuation, topology and nonarchimedean-local-field instances are in scope. It supplies neither the pro-p proof nor the completed action by its definition alone. The actual scalar construction is in TauCeti/Topology/Algebra/Group/Profinite/ProP/PadicPow.lean:454 and its continuity at line 473. The compact algebra carrier at TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145 is an inverse-limit subalgebra, not the missing arithmetic norm tower. Searches of both pinned libraries for Lubin–Tate and Coates–Wiles found no corresponding arithmetic carrier. The finite Galois normal basis and finite-flat local freeness inputs were read at Mathlib/FieldTheory/Galois/NormalBasis.lean:120 and Mathlib/RingTheory/LocalRing/Module.lean:299. Native formal-point maps still require the adic-completion presentation specified in the existing realization gap.

## Computed adversarial mathematics pass

Unless specified otherwise, p=5, π=−5, O has residue field of cardinal 25, and Λ=O[[T]]. Each row records actual values or an explicit algebraic calculation. These are boundary and convention checks, not proofs of the general target. The table covers all numbered targets, their defining maps and changed supplier comparisons. Unchanged statements retain their hypotheses and locators.

| Statement | Instances and computed values | Result and change |
|---|---|---|
| Characteristic-zero unramified coefficients | O/5O has 25 elements; Φ/5Φ=0. For bases of ℤ₅[√2] and ℤ₅[√5], trace determinants are 8 and 20, reducing to 3 and 0. | Integral/unramified coefficients cannot be replaced by the field or a ramified trace pairing. |
| Prime and residue restrictions | At p=2,3, 1728 becomes 0; at p=5 it is 3. In characteristic 5 the proposed parameter −5 is 0. The zero ring has 1=0. | The standing p≥5 and characteristic-zero DVR hypotheses exclude these models. |
| Arithmetic Artin and inverse twist | For Artin unit 2 the Tate scalar is 1/2 and the inverse-twist scalar is 2; product 1. | Retain arithmetic reciprocity and inverse twist. |
| π/p Tate bases | For consecutive levels [−5](−w₁)=w₀ while [−5]w₁=−w₀. | Alternating basis signs retained. |
| Quadratic directions | On Γ⁻, cgc⁻¹=g⁻¹, hence g(cgc⁻¹)=1. In S₃, (12)(23) and (23)(12) are opposite 3-cycles. A trivial group has rank 0. | The abelian rank-two tower hypothesis rules out both wrong ambient models. |
| Field indices and zero level | Θ indices for n=0,1,2 are 1,25,625; Ψ indices are 1,5,25. The tame orders are 24 and 6. | Separate the full tame and ring-class groups; do not evaluate the positive-level primed formula at zero. |
| Compact and discrete topologies | A continuous homomorphism from a compact group to a torsion-free discrete lattice has finite image; the only finite torsion-free subgroup is {0}. | The continuous cocycle route needs precisely the discrete topology used in §7.2. |
| Finite-free coefficient/limit comparison | A rank-two coefficient basis changes each compatible sequence into a pair of compatible sequences: lim(M_n²)=(lim M_n)², including the zero system. | Retain only this general comparison in the coefficient gap; use it in §§0.2,1.2. |
| Multivariable coordinate and quotient | O[[S,T]] has dimension 3; quotient by S is O[[T]], dimension 2. On Λ₂² both basis vectors survive S=0. | Generic ownership moved to SelmerIwasawaCohomology §3.0. |
| Twisting the plus relation | Tw_κ(σ−κ(σ))=κ(σ)σ−κ(σ)=κ(σ)(σ−1). For κ(σ)=6 this is 6(σ−1), with 6≡1 mod 5. | Same ideal up to a unit; no inverse-sign swap. |
| Generator/coefficient naturality | (1+T)⁶−1=6T+15T²+20T³+15T⁴+6T⁵+T⁶. Sending S to 0 before/after a coefficient map gives 0 in either order. | Residual comparison retained, with linear coefficient 6 a unit. |
| Continuous coefficient dual | For trivial action, D_t(O)=Φ/O and D_t(O/π)=O/π, of cardinal 25; Hom_O(O/π,O)=0. | Duality redirected to CompletedCohomologyPartII; O-valued dual would lose torsion. |
| Closed coinvariants versus dual invariants | For σ=1 on O both sides are Φ/O. For σ=6, M/(σ−1)M=O/5 and dual invariants are (Φ/O)[5], both of cardinal 25. | Evaluation factors in both directions through the closed quotient. |
| Contragredient composition | With A=((1,1),(0,1)), B=((1,0),(1,1)), φ(x)=x₁ and x=(1,0), φ(B⁻¹A⁻¹x)=1 and φ(A⁻¹B⁻¹x)=2. | Left dual action requires inverse precomposition; transpose alone reverses composition. |
| §0.1 conductor and parity | Character orders 1,5,25 give conductor exponents 0,2,3 and signs +,+,−. Inversion preserves each order; zero level has only exponent 0. | Both directions of the parity partition agree. |
| §0.2 principal subgroup and norm | Residues of 1,1+ϖ and a Teichmüller unit of residue 2 are 1,1,2. N(1)=1 and N(a)=a²⁵ for a fixed base unit in a degree-25 extension. | Only the first two units belong to the principal subgroup. |
| §0.2 tame projector | On omega and distinct-eta eigenvectors the character sums give 24/24=1 and 0/24=0. Squaring leaves 1 and 0. | Projector, zero family and Galois-compatible norm transport agree. |
| §0.3 general norm control | In the cyclotomic ℤ₅-extension the norm cokernel is ℤ₅, not 0; its nontrivial tame component is 0, its trivial component remains ℤ₅. | Kernel/image contract retained without finite freeness. |
| §0.3 finite freeness | Base degree 2 gives finite ranks 2,50,1250 at n=0,1,2 and limit rank 2. Tame exponents 1 and 6 differ modulo 24. | Finite-level freeness now owned here, with the source's nonexceptional hypothesis. |
| §0.3 excluded Tate model | On M=O let γ₊ act by 6 and γ₋ by 1. Level-zero coinvariants are O/(5,0)=O/5, with 25 elements and nonzero 5-torsion. | New negative Check distinguishes the nonexceptional module from a Tate line. |
| §0.4 evaluation and basis | If h(v)=b, evaluations at −v and 5v are −b and 5b. The latter image omits 1. A tame omega scalar times its inverse is 1. | Evaluation equivalence requires a basis, and Δ-invariants are the inverse-twisted omega part. |
| §0.5 arithmetic quotient | If the untwisted σ-scalar is κ(σ), σ−κ(σ)=0 and σ−1=κ(σ)−1; after twisting the scalar is 1 and σ−1=0. | Quotient convention unchanged; supplier corrected throughout. |
| §0.5 changed generator | For σ′=σ⁶, the ratio (σ⁶−κ⁶)/(σ−κ) evaluates at σ=κ to 6κ⁵, an O-unit. | Generator independence and normalized coefficient 6 agree. |
| §1.1 interpolation and norm | The family 1 has series 1, product over all 25 torsion translates equal to 1 and derivative 0. Products interpolate u_nw_n. | Rank-p² norm, not rank p, retained. |
| §1.1 basis/coordinate transport | v′=−v gives f([−1]v′_n)=f(v_n)=u_n. For Z=X+X², transported inverse starts −Z+2Z², rather than −Z. | Formal inverse, not coordinate negation, is needed. |
| §1.2 ambient finite presentation | In basis (1⊗1,1⊗ζ,ζ⊗1,ζ⊗ζ), z has coefficients (1,−1,−1,−2)/3. Both dz and ζz have (1,2,2,1)/3. Multiplication maps z to 1. | Ambient recipe repairs the nonzero eigentensor missed by pure eigenvectors. |
| §1.2 pure-tensor negative control | For each of 1⊗1, ζ⊗ζ⁻¹, ζ²⊗ζ⁻², the equation dz=ζz would require ζ∈ℚ₅; X²+X+1 has no root modulo 5. | None of the displayed nonzero pure summands is an eigenvector. |
| §1.2 balanced logarithmic derivative | For integer b=2, f_(u²)=f_u² and D(f_u²)=2D(f_u). Thus D(u²⊗a)=2aD(u)=D(u⊗2a). For the identity family both sides are 0. | Additivity and continuity extend this balancing to ℤ_p before restriction. |
| §1.2 projected generators | D₀(f_(du))=ω(d)D₀(f_u); the inverse-weighted average is 24D₀(f_u)/24. On a different tame eigenspace it is 0. | Explicit projected-generator rule added; targets are O and Φ_n. |
| §1.2 denominator and changes | For f=1 the ratio is 0. Replacing coordinate X by 2Y multiplies numerator and pulled-back λ′ by 2, leaving the ratio fixed. Basis/scalar change by −1 gives (−a)(−D)=aD. | Unit values and nonzero invariant differential exclude 0/0. |
| §1.2 trace compatibility | If the level-n numerator is A, the next traced derivative is −5A. For zero input it is 0 at both levels. | The π rather than p factor is retained. |
| §1.3 character derivative | With χ(g)=ζ₅, reindexing gives ζ₅⁻¹=ζ₅⁴, not ζ₅. Adjacent weighted numerators A and −5A normalize to −A/5 and (−5A)/25=−A/5. | Character covariance and admissible-level independence agree. |
| §1.4 trivial derivative and descent | The full torsion sum is −5h(0); deleting zero gives −6h(0); division by −5 gives 6h(0)/5. For χ(σ)=1 the specialization of σ−1 is 0. | δ₁=(6/5)δ and descent remain valid for the repaired domain. |
| §1.5 signed unit kernels | If δ(ξ*)=1, δ₁(ξ*)=6/5≠0, so ξ* cannot be minus. Zero lies in both signs; every minus derivative δ is 0. | Opposite-parity unit convention retained. |
| §1.5 tensor versus scalar kernels | For W=O², tensor derivative is (δχ(x),δχ(y)). In E⊗_O O[ζ₅], ζ₅⊗1−1⊗ζ₅ is nonzero but scalar multiplication gives 0. | Tensor-kernel coordinate descent still requires the stated scalar comparison. |
| §2.1 finite Kummer maps | A primitive Q is nonzero mod π; πQ is nonzero mod π² and zero mod π. Base quotient cardinalities for k=1,2 are 25,625. | Inclusion/reduction directions and nonzero connecting map agree. |
| §2.1 coefficient trace | In 𝔽₂₅/𝔽₅, Tr(1)=2 and Tr(3)=6≡1. Pairing (1,1) has value 2. | Unramified trace retained; an identity scalar map fails. |
| §2.2 norm vanishing | Heights n=1,…,6 give depths 1,2,2,3,3,4, tending to infinity. Level zero is the identity of depth 1. For height-one cyclotomic norms the initial cokernel sizes are 1,5,25. | Do not use positive-level subtraction at zero or the height-two estimate for height one. Finite ramified bases retain their separate estimate target. |
| §2.3 Kummer duality | On the specified primitive coordinate, π⁻² and π⁻¹ pair to 1/25 and −1/5 mod O; multiplication by −5 gives −1/5 then 1=0 mod O. | Actual nonzero evaluation excludes the zero pairing and fixes transition normalization. |
| §2.3 scalar trace | The values 1/5 and 3/5 trace to 2/5 and 6/5≡1/5 mod ℤ₅. | Coefficient trace is not the identity; duality's supplier changes no values. |
| §2.4 anticyclotomic descent | For untwisted eigenvalue a=κ(σ), the inverse twist gives κ(σ)⁻¹a−1=0; using the untwisted relation again gives 1−κ(σ). | Closed coinvariants and point invariants use the qualified coefficient dual. |
| §2.5 trace reciprocity | Increasing m replaces A/π^(m+1+k) by πA/π^(m+2+k), equal fractions; for m=k=0 both are −A/5. At k=0 the point tensor y⊗1=0. | Formula is modulo O; the admissibly large trace must be integral at k=0. |
| §3.1 point Fourier logarithms | For a base logarithm a, the repeated level-one sum is 5a/5=a; for a nontrivial order-five character it is aΣζ₅^i=0. Covariance is ζ₅, inverse to unit covariance ζ₅⁴. | Point and unit normalizations remain distinct. |
| §3.2 signed points | At levels 0,1,2 the ranks (minus,plus) are (1,0),(5,0),(5,20). A base logarithm a≠0 belongs to minus and fails plus. | Same-parity point kernels retained. |
| §3.2 saturation and tensor embedding | For a≠0 in O, aλχ(y)=0 implies λχ(y)=0. The unsaturated inclusion 5O⊂O has tensor kernel 5⁻¹O/O of cardinal 25. | Saturation, rather than rational injectivity, justifies the stated tensor map. |
| §3.3 rational normal basis and projectors | For C₁,C₅,C₂₅ the rational orbit dimensions are (1),(1,4),(1,4,20), summing to 1,5,25. Projector denominators are 1,5,25. | Native normal basis is a rational statement; the integral denominator bound is separate. |
| §3.4 signed sum | At n=2 the ranks add to 5+20=25; the integral denominator bound is 25, and tensoring with Φ/O clears it. | Divisible sum alone is not a direct-sum assertion. |
| §3.5 finite-level saturation | If πz is fixed by g, π(gz−z)=0. The tame-fixed tower has zero π-torsion, giving gz−z=0. For 5O⊂O the quotient instead has 25 elements. | The formal tower, not an arbitrary lattice inclusion, supplies saturation. |
| §3.6 annihilator equality | On an order-25 component the plus point logarithm may be a, but the plus-unit derivative is 0: product a·0=0. Conversely, a nonzero matching derivative b pairs with a sufficiently divided nonzero a to give a nonintegral ab/π^k. | Both containment directions use the actual pairing and arbitrary denominators. |
| §3.7 ranks and intersection | Ann(D⁺)∩Ann(D⁻)=Ann(D)=0. Two positive quotient ranks from ambient rank 2 leave each kernel rank ≤1. Minus point ranks at n=2,3 are 5 and 105. | A bounded O-corank dual cannot account for the unbounded signed point ranks. |
| §4.1 native existence theorem | For ℚ(√−7), X²−X+2 mod 2 is X(X−1); mod 5 its discriminant is 3, not a square. Class number is 1, so 5∤1. For ℚ(√−15) the discriminant is 0 mod 5. | Positive witness satisfies every Lean conjunct; the negative field fails prime (5). |
| §4.1 all small primes | For p=5,7,11,13,17,19,23,29,31,37,41,43,47 the selected D gives D^((p−1)/2) mod p respectively 4,6,10,12,16,18,22,28,30,36,40,42,46. | Every residue equals p−1, so all thirteen selected primes are inert. |
| §4.1 class numbers and threshold | Reduced forms at −7: (1,1,2); at −15: (1,1,4),(2,1,2); at −31: (1,1,8),(2,−1,4),(2,1,4). Counts 1,2,3. The p=53 bound is 52.7611867782<53; the ratio's derivative has negative sign −log(8p). | Recomputed all field Checks and worked examples; no prime-range shortcut. |
| §4.1 character assembly | With φ((p))=−5, its norm at p is 25 and the deleted Euler factor at 1 is 1−(−5)/25=6/5. At discriminants −7,−15,−31, D≡1 mod 8. | Split dyadic place and selected canonical plus sign agree with the early CM contracts. |
| §4.2 projected CM class | Exact order l first has conductor l². On [g],[1],[h], the ν-evaluation/augmentation values are ν(g),1,1. At p=5 the unit projector uses 24⁻¹, point trace has 6 terms. | All projection directions and the two tame groups remain distinct. |
| §4.3 dual-exponential normalization | On log χ_cyc the supplied dual exponential is 1. The finite prefactors for n=0,1 are −1/5 and 1/25. | The derivative-domain repair changes no prefactor or ordered pairing. |
| §4.4 interpolation and parity | At χ=1, 1−(−5)/25=6/5; conductor exponents 2,3 give root signs +,−, hence opposite-sign scalar value 0. | The canonical unramified scalar-to-tensor comparison is still required for membership. |
| §4.5 optimal unit | If coordinate derivatives all lie in 5O, their tensor derivative lies in 5W. A derivative in W× has valuation 0, contradicting that conclusion. | A unit coordinate exists only after tensor-valued membership; no signed freeness is assumed. |
| §5.1 auxiliary elliptic curve | Counts for y²+y=x³ over 𝔽₅ and 𝔽₁₁ are 6,12; for y²=x³−x over 𝔽₇ the count is 8. Traces are 0,0,0. | All exceptional small primes retained. |
| §5.2 good differential and separability | A normalized leading q coefficient 1 times c_E∈ℤ₅× stays nonzero modulo 5. Multiplication by 5 instead kills the reduction differential. | Good-prime optimality and p-unit Manin constant are indispensable to this route. |
| §5.3 Frobenius and Honda signs | Over 𝔽₂₅, y²+y=x³ has 36 points, trace −10, scalar −5 and parameter −5. The other trace +10 gives 16 points, scalar/parameter +5. On orders 6,7, −5 acts by 1,2. | Corrected the locator's printed sign pairing; subgroup stability does not mean pointwise fixation. |
| §5.4 mass and trace classes | At p=5,7,47, (m,d,e)=(0,1,0),(0,0,1),(3,1,1). The mass integers are 4,6,46. Counts (N(±2p),N(±p),N(0)) are (1,2,0),(1,0,2),(5,2,2). | Twist-class counts and geometric j counts are distinct. |
| §5.5 ramification | N=27 gives μ=36,g=1 and different degree 0≤6; N=32 gives μ=48,g=1 and 0≤8. Identity genus-one map has different 0; t↦t² has different multiplicity 1. | Inseparable Frobenius in characteristic 5 has differential 0 and fails the hypothesis. |
| §5.6 generic bound | At p=13,47,5 the generic lower counts are μ,3μ,0. The p=47 weaker expression is μ(3−3/2−1−1/2)=0, whereas 3μ>μ/6. | No existence inference from a zero lower bound. |
| §5.7 exceptional bound | At (p,N)=(5,27), μ/3=12>6; at (7,32), μ/2=24>8. At p=13 both exceptional indicators are 0. | Exceptional and generic branches cover the intended primes. |
| §5.8 fine level and descent | p=5 gives M=6, φ(M)=2, and p=7 gives M=8, φ(M)=4. Neither product Mφ(M) is divisible by the corresponding p. Scalar −5 fixes order-six points. | Retain the fine marking and the stabilizer-removing composite level. |
| §5.9 primitive disk point | λ(Q) has valuation 1; λ([5]Q) has valuation 2. The rescaling 36 reduces to 1 mod 5; a rescaling 5 reduces to 0. | Primitivity and the disk isomorphism survive precisely the p-unit rescaling. |
| §6.1 quotient curves and fields | At s=0, C₀=0,A₀=A,x₀=Q. At p=5 the primed degrees for s=0,1,2,3 are 1,6,30,150, versus first LT degree 24. | Marked quotient and field indices agree; no totalized s−1 at zero. |
| §6.2 local point system | At p=5, y=6Q is primitive, while y₀=Tr_Δ′x₁=0. The defining trace has 6 terms, not 24. | Point construction's source and tame group retained. |
| §6.3 Hecke neighbors | The five outward lines are (1,a), a=0,…,4; determinants b−a are nonzero for distinct a,b. The remaining line is (0,1). Replacing θ by 1 gives 1+5a, always a unit. | The wrong model collapses five lattices to one and cannot give the Hecke orbit. |
| §6.4 initial and later traces | y=6Q,y₀=0; Tr₁/₀y₁=−6Q and Tr₂/₁y₂=−y₀=0. | The first trace is −y, not −y₀. |
| §6.5 parity and odd total trace | For n=1,3,5, total traces are −y,5y,−25y; total trace of y₂ is 0. | π/p signs and same-parity point definitions remain consistent. |
| §7.1 Herbrand quotient | At odd n=1,3,5 the ratios are 1,5⁴/5²=25,5⁸/5⁴=625. Using residue size 5 would give 5 at n=3. | Finiteness is retained before the native totalized cardinality ratio is used. |
| §7.2 first cohomology | At n=3, the primitive norm contains 5Oy, so |Ĥ⁰|≤25 and h=25 force |H¹|≤1, hence 1. A nonprimitive y=5y′ gives only bound 625. | Primitive trace system is essential; vanishing follows without later decomposition. |
| §7.3 divisible invariants | Base lattice 5O has rank 1 and its divisible tensor has π-torsion cardinal 25. The inclusion 5O⊗Φ/O→O⊗Φ/O has a kernel of size 25. | The actual inclusion in D⁻ is used; a different lattice inclusion is not silently substituted. |
| §7.4 free minus quotient/kernel | X⁻/TX⁻≅O gives residue dimension 1, cardinal 25. Λ/(T) also has that residue dimension but Λ-rank 0; a split Λ²→Λ has rank-one kernel. | Positive-rank hypothesis and qualified biduality are retained. |
| §8.1 augmentation generation | For f=1+5T, f(0)=1 is a unit; for 5+T it is 5 and not a unit. Coefficient extraction gives T↦1 while augmentation gives T↦0. | The argument uses augmentation linearity, not just continuity. |
| §8.2 integral direct sum | Signed basis addition has determinant 1. Columns e₁,e₁+5e₂ have determinant 5 and cokernel Λ/5Λ; mod T that cokernel has 25 elements and 1,T are independent before mod T. | Rational complement is insufficient; the actual compact isomorphism is integral. |
| §8.3 all-character nonvanishing | At χ=1 and δ(ξ*)=1 the value is 6/5≠0. An exact-order-25 orbit has dimension 20 and a primitive character-lattice coordinate divided by π has nonzero class. | Kummer nondegeneracy rules out an identically zero derivative on that orbit. |
| §8.4 signed generators | At χ=1, v₊ and −v₊ have opposite unit δ-values, valuation 0; v₋ has δ=0. At order 25 the plus value is 0 and the matching minus value is nonzero. | Generator changes multiply by nonzero specializations of Λ-units. |
| §8.5 finite Kummer export | At n=0 the plus image is 0 and minus corank is 1, with nonzero Q⊗π⁻¹. At n=2 the coranks are 20 and 5, adding to 25. Degree-five trace changes a base logarithm a to 5a, not −5a. | Existing signed carriers and actual restriction/corestriction squares retained. |

The rows with source or supplier changes were recomputed along their consumers: coordinate/twist relations in §§0.4–0.5 and §2.4; derivatives in §§1.3–1.5, §2.5, §§4.2–4.5 and §§8.1–8.4; coefficient duality in §§2.3–2.4, §3.6 and §7.4; Frobenius/Honda signs in §§5.1,5.3,5.8–5.9 and the LT.4 supplier convention. All worked examples use the same unchanged mathematical objects with the corrected domains and ownership.

## Maintainer consequences

The nine gap slugs remain stable. `quadratic-coefficient-coordinates` now names SelmerIwasawaCohomology §3.0; `compact-coefficient-duality` keeps its existing slug but only requests finite-free compact-limit comparison. The generic duality now has an existing earlier owner. The general norm-control supplier still needs its stated extension; this package does not claim IntegralIwasawaTheory §7.2 already provides it. Existing gaps remain prerequisites, not silently discharged facts.

The sole new Lean name is `TauCetiRoadmap.AnticyclotomicLocalUnits.exists_auxiliaryQuadraticField`. No existing name cited by another roadmap changed or was deleted. No other package, tooling, source cache, merge-order file or pull-request text was edited. No commit or publication was performed.
