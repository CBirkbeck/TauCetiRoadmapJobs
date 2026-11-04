# Review of CountingBundlesAndHallAlgebrasOfCurves (pull request #1547 at 2a1d1ff)

**Verdict:** needs changes

## R01 (P1) — Declare the missing stable symmetric-function supplier

**Location:** `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md:137`, also 143 and 1369: “That ring and pairing are the carrier of the Macdonald admissibility contract below”.

**Claim:** RepresentationTheory/SchurWeyl Layer 7 supplies the stable symmetric-function ring and Hall inner product used by the Macdonald contract and Layer 10.

**Witness:** Main `TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md:340–342` defers both objects to a later step that is not stated. Pinned `TauCeti/RepresentationTheory/Symmetric/FrobeniusCharacteristic.lean:45` targets finite-variable homogeneous polynomials; it supplies neither the stable ring nor its pairing.

The main supplier gives a degree-bounded finite-variable characteristic. The existing `macdonald-admissibility` gap requests modified Macdonald functions and their operations **on** the purported stable carrier; it does not supply the missing carrier or its transition maps. A reference to a future step does not establish the exact supplier contract required here. An open revision of an existing roadmap cannot replace its main-branch contract.

**Exact repair:** Add a precise declared gap owned by RepresentationTheory/SchurWeyl for the stable graded symmetric-function ring, finite-alphabet specialization/transition maps and Hall pairing, with the Frobenius characteristic isometry and compatibility with its finite-variable version. Record the same slug in the plan and README; make the Macdonald contract explicitly depend on it. Alternatively cite an actual existing target supplying that complete interface. Preserve one owner and one carrier.

**Repair test:** In degree two the stable space has dimension 2, with `(p₂,p₂)=2`, `(p₁²,p₁²)=2`, `(p₂,p₁²)=0`. One-variable specialization has `p₂=p₁²=x²` and dimension 1; it cannot itself carry these three pairing values. The repaired contract must provide the stable object and the specialization map, not identify them.

## R02 (P3) — Synchronize the supplier-gap registration with the retained route

**Location:** `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md:55–161`, particularly the six “Required extension” paragraphs; `packages/CountingBundlesAndHallAlgebrasOfCurves/design/plan.json:5368–5412`.

**Claim:** The README's extension paragraphs are the declared contracts on which the counting theorems depend.

**Witness:** The README has zero `gap:` occurrences; the plan has seven slugs. Six have prose counterparts; `two-line-chart-epimorphism` has none. The plan still requests King’s criterion, absent from the retained GIT contract.

**Exact repair:** Use the required `What <Supplier> must provide (gap:<slug>): ...` form for each retained extension, with matching needs text in the plan. Reconcile the obsolete two-line-chart gap and King criterion with the deleted framed-deformation route: remove them if no retained target consumes them. Add the stable-carrier gap from R01 separately. This is registration cleanup, not a renewed demand to repair the supplier’s two-frame chart.

**Repair test:** A literal slug comparison should give exactly one README contract for every retained plan gap, and no unused request. The mathematical controls remain unchanged: coherent duality on a smooth-point skyscraper has dimensions 1 and 1; the affine-line compact shift is degree 2 and twist −1; ψ₂((q−1)⁻¹) at q=2 is 1/3.

## R03 (P3) — Register the newly cited Mellit parabolic source

**Location:** `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md:22`, 1451 and 1579; `packages/CountingBundlesAndHallAlgebrasOfCurves/sources.toml`.

**Claim:** M20P supplies the parabolic HLV coefficient formula, polynomiality and degree independence.

**Witness:** The README cites M20P, but the supplied manifest has no M20P entry. M20P line 2433 states polynomiality; M20P line 2503 states the coefficient formula and degree independence.

**Exact repair:** Register the already used key M20P for arXiv:1710.04513v1, with Theorem 7.1 and Corollary 7.4, printed pp.54–55, cited for Scope and §11.2. Use the sources-service metadata for the legal arXiv copy. Do not create a second key or request a replacement text.

**Repair test:** The source was fetched and read in this review. Its rank-one coefficient is `P(1)∏p₁[X_i]`; with no marks it is P(1), and with any admissible rank-one flags it remains P(1). The source numbering and the README claim agree.

## Verified sound

This is an independent AI review. I read the complete README (70 numbered subsections), the 100-line Lean file, the repository's normative README and CONTRIBUTING, and the main-branch AlgebraicCurves, GrothendieckEulerForms and SchurWeyl examples. The tables record finite-instance and source checks, not proofs of the proposed theorems. No pull-request file was changed. Text-location helpers were used only to locate supplier passages; the mathematical assessment and verdict are mine.

The worker's gate at the specified head reports every scanner, dependency and targeted-build check passing, including `build=0`, `stray-files=0` and `outside-folder=0`. Independently, the outside-folder diff is empty, and direct `lake env lean` elaboration of Suggested.lean exits 0 with exactly two `sorry` warnings. No prerequisite object file was missing during this run. The required dependency command exits 0 and prints:

```text
depcheck: 204 roadmaps, 1498 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This mechanical result does not detect R01's missing semantic contract. All retained extension requests have named owners; their mathematical absence from their suppliers was not treated as a defect. The obsolete chart correction remains settled; R02 concerns registration after its consuming route was deleted.

### Seeded source audit

All 15 seeded targets were compared with the legal cached texts, including the printed pages, hypotheses and conventions. No additional locator is labelled unverified in the README. M20, FH58 and HES81 remain the settled locator-only exceptions listed below.

| Target | Source text opened | Outcome and boundary |
|---|---|---|
| 0.3 residues | S16 lines 284–306, §1.4, p.303 | Function residue and descending iteration agree. The differential comparison is restricted to simple poles, correctly. |
| 1.5 nilpotent/unit ratio | S16 lines 639–645, Corollary 2.5, p.309 | The identical radical fibres cancel. Repeated summands require full matrix blocks, as the README states. |
| 3.4 flag mass | S16 lines 1011–1014, (4.1), p.316 | Quotient-left order and negative half-Euler correction agree. |
| 4.8 generic Hall form | S16 lines 1165–1191, Theorem 4.4, pp.319–320; SV12 lines 680–694, §1.11, p.13 | SV12 constructs a torus-coefficient torsion-free form; the README correctly makes reciprocal-invariant descent and denominator control explicit targets rather than attributing them verbatim to SV12. |
| 4.9 universal counts | S16 lines 1192–1258, Corollaries 4.5–4.6 and Proposition 4.7, pp.320–321 | Flag masses, nilpotent masses and the induction for absolute counts are present. Density supplies uniqueness. Zero coherent rank includes torsion. |
| 5.5 shuffle | S16 lines 1495–1547, Proposition 5.3, p.325 | Both formulas, the sign (−1)^s, the unaveraged sum and the two expansion regions agree. |
| 5.7 Jordan sum | S16 lines 2028–2106, §5.6, pp.331–332 | Weighted rank and degree agree with the printed monomial (the weight is easy to misread in the extraction). Extra torsion tails stabilize coefficientwise. |
| 5.8 positive arms | S16 lines 2124–2143, Lemma 5.5, p.333 | The product excludes exactly arm-zero cells; the multiplicity formula agrees. |
| 5.9 kernels | S16 lines 274–283 and 309–368, (1.1)–(1.3), pp.303–304 | Both regularized zeta values, descending block residues and surviving-variable substitution agree. |
| 6.4 rank two | S16 lines 389–411, example, p.305; Appendix C | P,U,V,S and every scalar coefficient match. Apparent α=1 poles are cancelled before evaluation. |
| 6.6 origin constants | S16 lines 428–480, Corollary 1.9/examples, pp.305–306; §5.9 | The displayed generating series agrees; the README correctly uses negative differential-residue extraction rather than the source's printed positive sign. |
| 7.3 stable Higgs | S16 lines 2414–2430, §6.2, p.337; lines 3045–3088, §§6.10–6.11, pp.351–352; STACKS lines 3033–3040 and 3130–3138 | The stable scalar gerbe, smooth connected coarse space and proper-core geometry are the source inputs. The roadmap explicitly targets their construction and distinguishes the reduced core from the potentially nonreduced Hitchin fibre. Reduction invariance is supported by the Stacks tags. |
| 9.2 traces/positivity | S16 lines 196–213, Corollary 1.5, pp.301–302; lines 2980–3019, (6.9)–(6.10), p.350 | All-extension traces and weight separation are the route. The roadmap includes q^D, groups coincident monomials and asks for an invariant class, not an invariant positive free-polynomial representative. |
| 9.4 cone | S16 lines 186–195, Corollary 1.4, p.301; lines 3045–3088, §6.11, pp.351–352 | The roadmap corrects the source's prefactor and doubled cohomological degrees. Rank-one duality verifies the corrected normalization. |
| 11.4 slope cuts | S16 lines 3138–3144, Corollary 8.1, p.353 | Rational ν and K_g-valued cut counts are supported. No fixed-HN polynomial theorem is inferred from this corollary. |

Additional text checked: MS14 lines 213–240 (derived coherent Higgs Hom, duality and strict-slope Ext² vanishing), lines 386–452 (relative positive stability and HN integration), lines 481–590 (positive counts and the all-characteristic comparison); SPR66 lines 6739–6749 (perfect fields of dimension at most one, applicable to finite fields); M18 lines 49–58 (S-twisted Hall pairing); M20P lines 2433–2515 (parabolic polynomiality and degree independence). The parabolic strengthening is stated as outside scope, rather than incorrectly labelled a conjecture or deduced from the unmarked theorem.

### Computed adversarial ledger

Here P=P_X(1), E is the displayed Euler form, and D=1+(g−1)r². Values use characteristic-zero count coefficients. A row labelled “agrees” means agreement on the instances stated, not a general proof. “Unchanged” means no repair is proposed for that target. The ledger has 84 computed rows covering all 70 numbered subsections, the seeded targets, headlines and supplier controls. The exact-arithmetic probe enumerated all 2×2 matrices over 𝔽₂ and 𝔽₃, evaluated the rank-two rational formula, and expanded the constant-term partition logarithm through z⁶⁴. No source code was downloaded or run.

| Statement | Instances | Values computed on the two sides / negative control | Result; change |
|---|---|---|---|
| Field, zero and HN conventions | 𝔽₂; zero; rational torsion; O(1)⊕O(−1) | q=2; zero has 0 HN factors; torsion slope +∞; bundle slopes (1,−1), mean 0, minimum −1 | Distinguishes minimum from mean; unchanged |
| Euler and Frobenius conventions | P¹, O and O(1); E:y²+y=x³ over 𝔽₄ | Euler values 2 and 0 in opposite orders; E has 9 points, α=(−2,−2); cubic extension gives 65−(−16)=81 | Agrees; unchanged |
| Adams coefficient convention | q=2, formal α=(−1,−2) | P=6; ψ₂(P)=1−1−4+4=0; ψ₂((q−1)⁻¹)=1/3 versus wrongly fixed value 1 | Agrees; unchanged |
| Stable Hall pairing contract | degree 2; one-variable specialization | Stable Gram matrix diag(2,2), mixed entry 0; in one variable p₂=p₁²=x², so dimension 1 instead of 2 | Missing carrier; R01 |
| S-twisted pairing | q_M=2,t_M=3; p₁,p₂ | Norms −2 and −48; using S(2,3) for the part 2 gives −4 | Agrees with M18; unchanged |
| Supplier Higgs complex orientation | g=2, A=O(P), B=O, zero fields | Supplied C(B,A): dimensions (1,3,0), mass q²; reversed C(A,B): (0,3,1), mass q³ | Source order is C(B,A); unchanged |
| 0.1 coefficient ring | g=0; g=1,q=2,a=−1 | R₀ contains q; a+q/a=−3 before/after flip; a alone changes −1→−2; ψ₂ denominator 1/3 | Agrees; unchanged |
| 0.2 degree definition | P¹ O(1),O(1)⊕O(−1); genus-2 O² | χ₂−rχ₂(O): 2−1=1; 2−2=0; −2−2(−1)=0 | Native degree agrees; unchanged |
| 0.2 absolute predicate | O; O²; zero | End(O_kbar)=kbar, no nontrivial projector; O² has diag(1,0); zero fails explicit nonzeroness | Truth values true,false,false; unchanged |
| 0.2 count and torsion distinction | P¹ ranks 0,1,2; one line over 𝔽₃; degree-2 closed point | Counts 0,1,0; line count 1 versus mass 1/2; degree-2 simple splits into 2 geometric summands and contributes 0 absolute objects | Agrees; unchanged |
| 0.2 field-extension HN | O(2)⊕O(−1); degree-2 skyscraper | Slopes (2,−1) remain (2,−1); skyscraper becomes two points but its HN slope remains +∞ | Agrees; unchanged |
| 0.3 residues | h=1−z/u; h⁻¹,h⁻²,1 | (rRes,dRes)=(1,−1),(0,−1),(0,0) | Simple-pole hypothesis necessary; unchanged |
| 1.2 coherent decomposition | 0,L,L² over 𝔽₂ | Summand multiplicities 0,1,2; residue algebras 0,𝔽₂,M₂(𝔽₂); latter has 16 elements and is not local | Agrees; unchanged |
| 1.3 radical blocks | N=𝔽₂[t]/t²; N² | rad End(N) dimension 1; M₂(rad) dimension 4; quotient cardinal 16, versus erroneous diagonal dimension 2 | Agrees; unchanged |
| 1.4 nilpotent matrix headline | n=0,1,2 over 𝔽₂; n=2 over 𝔽₃ | Counts 1,1,4,9 equal q^(n(n−1)); GL₂ counts 6,48 | Exact enumeration agrees; unchanged |
| 1.5 ratio | 0; line/𝔽₃; doubled line/𝔽₂; N above | Actual and residue-product ratios respectively 1,1/2,4/6=2/3,2/2=1 | Agrees; unchanged |
| 1.6 finite-field neutrality | G_m, dual-number units, constant C₂ | Neutral obstruction in each case; H¹ class counts 1,1,2; dual-number rational units 2 | Neutrality does not imply uniqueness without connectedness; unchanged |
| 1.7 Frobenius orbits | single orbit of length 2 | Contributions over degrees l=1,2 are 0,2; divisor sums 0,2; descended class doubles (r,d) | Agrees; unchanged |
| 1.8 coprime absolute objects | class (2,1); local algebra k[t]/t² | Residue degree divides gcd=1; c+bt has scalar c and nilpotent bt; algebra dimension 2, residue dimension 1 | Does not falsely conclude End=k; unchanged |
| 1.9 positivity bound | rank 1,d=−1,0,1; g=2,r=2,d=3 | Cut indicators 0,1,1; threshold (g−1)r(r−1)=2, and 3>2 | Agrees; unchanged |
| 1.10 periodicity/duality | P¹ lines in degrees −1,0,1; rank 2 | Counts 1,1,1 and 0; twist and dual preserve these values | Agrees; unchanged |
| 2.1 fibre Fubini | Id:BS₃; BC₂→BS₃; B(C₂²)→BC₂ | 1/6=1·1/6; 1/2=3·1/6; 1/4=(1/2)(1/2) | Nonabelian and kernel controls agree; unchanged |
| 2.2 nilpotent pairs | line/𝔽₃; zero; N=𝔽₂[t]/t² | Line mass 1/2; zero mass 1; multiplication by t squares to 0, identity does not | Agrees; unchanged |
| 2.3 exponential headline | one absolute line species,q=2,multiplicity ≤2 | Mass coefficients (1,1,2/3); exp(T+T²/6+…) gives (1,1,1/2+1/6) | Agrees; unchanged |
| 2.4 Jordan class | zero map on line; size-2 block; length-2 torsion | α₁=(1,0); r₂=1 gives weighted rank 2; α₂=(0,1) gives degree 2 | Retains internal zeros; unchanged |
| 2.5 filtered carrier | O(−1)⊂O²; O(1)⊂O(1)⊕O(−1); O⊂O²/𝔽₂ | Total minima 0,−1 give true,false; fixed-total flag mass 3/6=1/2 | Total-sheaf cutoff agrees; unchanged |
| 2.6 Jordan functors | size-2 block on O(−1)²; t on k[t]/t² | H₁=0,H₂=H; total and quotient minima both −1 in first case, both +∞ in second | Both directions of cutoff equivalence agree; unchanged |
| 2.7 Jordan fibres | one step; α₂=[O],g=0,q=2 | Exponents (d,d′,d″)=(0,0,0) and (−1,−1,0); π′ fibre masses 1 and 1/2 | Agrees; unchanged |
| 3.1 Hall convolution | O,O on P¹/𝔽₂; zero | 3 sublines give 3√2; Ext¹=0, #Hom=2 give Δ′=√2/2; zero contributes factor 1 | Product/coproduct normalizations agree; unchanged |
| 3.2 Green identity | same O,O,O² | (δ_O·δ_O ∣ δ_(O²))=3√2/6=√2/2; tensor pairing gives √2/2 | Agrees; unchanged |
| 3.3 characteristics | rank-zero degree 1/−1; rank 2 torsion degree 1 | Torsion indicator 1, negative-degree indicator 0; v⁻²·v²=1 | Correct rank in torsion twist; unchanged |
| 3.4 filtered mass | O⊂O² on P¹/𝔽₂ | 3/6=1/2 and q⁻¹ᐟ²·(√2/2)=1/2 | Agrees; unchanged |
| 4.1 Eisenstein series | O⊕k_x; O(−1); O(1)⊕O(−1) | Factorization gives v·v⁻¹z=z; negative degree gives z⁻¹; total cutoff values 1→0 on unstable degree-zero bundle | Agrees; unchanged |
| 4.2 Hecke shifts | r=0,1,2,q=2 | Empty product 1; arguments z/(√2w); z/(2w),z/w | Agrees with rank shifts; unchanged |
| 4.3 coproduct | r=0; split (1,1),g=0 | E₀⊗E₀; scalar 1/√q and arguments √qz,z/√q | Agrees; unchanged |
| 4.4 bundle residue | r=1; a simple rank-two pole | V₁⁻¹V₁=1, no residues; normalized pole coefficient 1 instead of differential −1 | Agrees; unchanged |
| 4.5 HN factorization | P¹ O(1)⊕O(−1) | E(negative quotient,positive subobject)=3; prefactor q⁻¹ᐟ² and shifts q⁻¹ give q⁻³ᐟ², cancelling Hall q³ᐟ² | Agrees; unchanged |
| 4.6 spherical carrier | line square and rank-two characteristic at O²/𝔽₂ | Values 3√2 and 1 differ; O(m)⊕O(−m) for m=0,1,2 already give 3 distinct supported classes | Requires HN completion; unchanged |
| 4.7 spherical HN | P¹ types ((2,0)),((1,1),(1,−1)),((1,0),(1,0)) | Class counts 1,1,0; last has equal successive slopes | Agrees; unchanged |
| 4.8 universal form | P¹ one-line mass at q=2,3 | P/(q−1)=1,1/2, matching 1/#Aut; flag twist cancels √q·q⁻¹ᐟ²=1 | Scalar checks agree; descent remains a target |
| 4.9 truncated universal counts | P¹/𝔽₂, class (1,1) | N₀=1+3z+…; [T]N=1+4z+…; [Tz]N/N₀=1; actual nilpotent masses 1+3·1=4 | Torsion cancellation agrees; unchanged |
| 4.10 density normalization | q₀=3,m=1,2,3 | q=3,9,27; normalized multiplier always 1; (q−3)/q=0,2/3,8/9 | Radial variable retained; unchanged |
| 5.1 pairing carrier | one line slot at 0 and ∞ | Positive coefficients 1/(q−1) for d≥0; negative expansion of −V₁/(1−zw) gives +V₁ for d<0; zero-rank slot multiplies by 1 | Regional signs agree; unchanged |
| 5.2 torsion separation | P¹,q=2,one rank-one slot | [zw]X₁=#X/(q(q−1))=3/2; omission of q shift gives 3 | Agrees; unchanged |
| 5.3 untruncated pairings | ranks (1,2) | q exponents −r_>1/2=−1, r_<2/2=1/2; one slot exponent 0 | Agrees; unchanged |
| 5.4 expansion separation | f=1/(1−z) at 0 and ∞ | (1−z)Σ_(n≥0)zⁿ=1; (1−z)(−Σ_(n<0)zⁿ)=1 | Polynomial clearing agrees; unchanged |
| 5.5 shuffle | s=1 at w=0/∞; s=2 | V₁/(1−zw),−V₁/(1−zw); negative-degree coefficients +V₁; (−1)²=1 | Agrees; unchanged |
| 5.6 block residues | tuple (1); tuple (2),g=2 | a=0 and −1/2; first prefactor V₁⁻¹V₁=1; second pole ratio q⁻¹ | Agrees; unchanged |
| 5.7 generic Jordan sum | r₂=1; α₂=(1,3); empty rank type | Weighted monomial T²z⁶, not Tz³; empty type has torsion coefficient #X/(q−1), not 0 | Agrees; unchanged |
| 5.8 positive arms | λ=(1),(2),(1,1),(2,1) | Products 1,ζ(q⁻¹z),1,ζ(q⁻²z); exponent sums respectively 0,Xq⁻¹z,0,Xq⁻²z | Both sides agree; unchanged |
| 5.9 kernels | empty,(1),(2),q=2,g=1,α=(−1,−2) | Empty 1; J_(1)=6; H_(1)=1/(1−z); H_(2)=1/(1−z²), coefficients z,z²=(0,1) | Agrees; unchanged |
| 5.10 partition product | empty and one box on P¹/𝔽₂ | Empty torsion series 1+3z+…; one-box product T(1+4z+…), matching §4.9 | Agrees; unchanged |
| 6.1 partition generating headline | P¹/𝔽₂, ranks 0,1 | Both constants 1; coefficient T=1/(1−z), coefficient Tz=1 after torsion cancellation | Agrees; unchanged |
| 6.2 periodic extraction | r=2,b=(2,3),K=ℚ | Differential residues (−5/2,1/2); negative Fourier sums 2,3; in char 2 denominator is (1−z)² | Characteristic condition necessary; unchanged |
| 6.3 residue headline | rank one; P¹ rank two; elliptic q=2,P=3 rank two | Residue at 1: −P→P; P¹ residues 0,0→0; elliptic residues −3,0→3 in either parity | Agrees; unchanged |
| 6.4 rank-two formula | q=2,g=0,1,2; pairs (−1,−2) repeated | (P,U,V,S)=(1,1,1,0),(6,15,0,5/6),(36,225,0,5/3); counts 0,6,1296 | Exact rational evaluations agree; unchanged |
| 6.5 origin carrier | rank one; q⁻¹; paired equation | P(1) at origin 1; q⁻¹ undefined; α₁α₂=q gives 0=0 | Excludes arbitrary Laurent evaluation; unchanged |
| 6.6 origin partition headline | g=1,2,3,r=1…4 | Partition-Log coefficients z⁶⁰…z⁶³ are constant with values (1,1,1,1),(1,2,6,22),(1,3,15,95); genus polynomials give the same lists | Exact coefficient computation agrees; unchanged |
| 7.1 positive Higgs category | line; doubled line; rational skyscraper | Stability true,false respectively; skyscraper self-Ext dimensions (1,2,1), versus underived wrong model (1,1,0) | Derived terms needed; unchanged |
| 7.1 positivity and differential | O(−1)⊂O² on P¹; (O,0)→(O,η) on elliptic curve | Minimum slopes −1,0,1 give false,true,true; column map Id↦η has coefficient +1 and acyclic cone | Exact structure and sign agree; unchanged |
| 7.2 duality criterion | W=ke₁; matrices [[1,1],[0,2]],[[1,0],[1,2]] | Lower-left entries 0,1 give preservation true,false and factorization true,false | Both directions agree; unchanged |
| 7.3 Higgs geometry headline | r=1,g=2; char 2,g=1,r=2,d=1 | Coarse/stack/cone dimensions 4,3,2; elliptic scalar characteristic polynomial t²+a², reduced core a=0 | Reduction distinction agrees; unchanged |
| 7.3 family nilpotence | rank-one θ=ε over k[ε]/ε² | θ²=0, characteristic coefficient −ε≠0; Hitchin zero equation requires ε=0 | Correct negative control; unchanged |
| 8.1 BB headline | P¹ scaling; A¹ negative weight; elliptic reduced core | Attracting ranks 1,0 give q+1; negative-weight model lacks limit of 1; core affine rank 0 gives #Pic | Hypotheses and reduced core agree; unchanged |
| 8.2 Higgs integration | E/𝔽₂,P=3; rank1 and rank2 degree0 | I₁=6; I₂=12+8+6+4=30; plethystic remainder 30−18−6=6=Ω₂ | Adams and slope-zero check agree; unchanged |
| 8.2 genus normalization | g=2,q=2,r=1 | q^(1−g)q^gP/(q−1)=2P; reverse normalization gives 8P | Agrees; unchanged |
| 8.3 all-characteristic headline | E over 𝔽₂/𝔽₄; P¹ rank1/rank2 | Direct point enumeration 3,9; Higgs counts 6,36=qP; stack masses 6,12; P¹ counts 1,0 | q is field size, not characteristic; unchanged |
| 9.1 purity/BB headline | rank1,g=2; A¹ | H_c^n=H^(n−4)(Pic)(−2); A¹ contributes rank1 in degree2 with eigenvalue q, rank0 in degrees0,1 | Shifts and twists agree; unchanged |
| 9.2 positivity headline | rank1,g=1; g=2,r=2 | A(−α)=1+α₁+α₂+q; diagonal 1+2t+t²; D=5 gives top degree10 and top coefficient1 | Invariant class, not invariant representative; unchanged |
| 9.2 positive representative control | genus2 top class q⁵ | α₁⁵α₂⁵=α₃⁵α₄⁵ on cone; both diagonalize to t¹⁰; averaged free representative coefficients 1/2 | Correctly excludes stronger free-invariance claim |
| 9.3 compact polynomial headline | rank1,g=1,2 | Signed t²−2t³+t⁴ and t⁴−4t⁵+6t⁶−4t⁷+t⁸; unsigned all positive coefficients | Top degrees4,8 agree; unchanged |
| 9.3 spread-out rank control | elliptic Pic×A¹; two disjoint points | Compact dimensions (1,2,1) in degrees2,3,4; point H⁰ rank1 versus two-point rank2 | Lisse stratum requirement excludes rank jump |
| 9.4 cone headline | rank1,g=2; two exchanged components | q²∏(1−α⁻¹)=P; top degree4 dimension1; two-component top permutation matrix has dimension2, trace0 | Prefactor q^D and dimension/trace distinction agree |
| 10.1 Mellit kernel | g=1,q=2,a=−1/−2; empty partition | H₁=3(z+1),2(z+2); values at1 both6, at0 are3,4; Ω constant1,H constant0 | Reciprocal symmetry only at z=1; unchanged |
| 10.2 regular deformation | constant sequence; f₁=x,f₂=t(x+y−1),t=3,x=5 | 1=1; f₂(1,5)=15=f₁(15), versus wrong q=2 shift 10 | Variable exchange agrees; generic theorem remains uncertified |
| 10.3 Laurent integrality headline | rank1 above; 1/(1+z) | H₁ polynomial, H₁(1)=6; control value1/2 at1 but pole at−1 | Local regularity is insufficient; unchanged |
| 10.4 degree independence headline | P¹ r=0,1,2,d=−1,0,1; elliptic rank2 | Counts (0,0,0),(1,1,1),(0,0,0); elliptic parity values3,3; control (2+3z)/(1−z²) has 2,3 | Native statement matches; unchanged |
| 10.5 all-degree positivity | g=2,r=2,d=0,1 | gcd(2,1)=1; origin values2,2; no equality of the two stable moduli spaces is claimed | Transfers count only; unchanged |
| 11.1 quasi-parabolic carrier | rank1; O² with two/three flags over 𝔽₂ | Line flags unique; two coordinate flags leave 2-dimensional diagonal endomorphisms; third diagonal line reduces to scalars, dimension1 | Flagged indecomposability differs from bundle indecomposability |
| 11.2 parabolic universality | no marks; rank1; one two-step mark on P¹ | Counts P in first two cases; E_par=1−1=0 for step1→step2 and 1 for reverse; localized test (q−1)⁻¹=1 at2, undefined at1 | Hall direction and localized conclusion agree |
| 11.3 exact HN carrier | g=2,0→O(P)→E→O→0 | Ext¹ dimension1; nonsplit class stays nonzero; HN slopes1,0; lower-cut indicator at ν=1/2 is0 although average=1/2 | Distinguishes HN from mean; unchanged |
| 11.4 slope universality headline | rank1,d=−1,0,ν=0 and duals | Lower-cut counts0,P; upper-cut dual degrees1,0 give0,P | Both directions agree; unchanged |
| 11.5 constructible Hall headline | P¹_C,torsion degree1 and line degree d | Product at O(d+1) is χ(P¹)=2; reversed product0; commutator2; scalar unit primitive equation c=2c forces c=0 | Order and primitive controls agree; general theorem remains target |
| 11.6 conjecture formulations | rank1; split/nonsplit HN; q⁻¹ at origin | Proposed root multiplicity1 matches cone component1; same HN type can have indecomposable indicator0 or1; q⁻¹ has no origin value | Conjectures kept separate from theorems |

The residue arithmetic was also recomputed directly: `dz/z=−dh/(1−h)` gives the simple- and double-pole values in the table. For the origin formula the explicit power-series expansion provides a separate check beyond substituting the printed genus polynomials. The pole at −1 of the periodic negative control verifies why Mellit's global Laurent conclusion is needed.

### Pinned declarations and Lean acceptance test

The following 13 pinned-file entries were opened, by object as well as name:

| File at the pin | Declaration and what it supplies |
|---|---|
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:120` | `Matrix.card_GL_field`: finite-field unit-matrix cardinality; it is not the nilpotent count. |
| `Mathlib/RingTheory/Artinian/Ring.lean:54` | `IsArtinianRing.isNilpotent_jacobson_bot`: associative Ring plus IsArtinianRing, without an extra commutativity hypothesis. |
| `Mathlib/RingTheory/Artinian/Module.lean:641` | `IsArtinianRing.isSemisimpleRing_iff_jacobson`: Artinian radical criterion. |
| `Mathlib/RingTheory/LittleWedderburn.lean:176` | `Finite.isDomain_to_isField`: finite domain ring is a field. |
| `Mathlib/CategoryTheory/Limits/Shapes/BinaryBiproducts.lean:1096` | `Indecomposable`: explicitly includes nonzeroness and the binary-biproduct condition. |
| `Mathlib/CategoryTheory/Skeletal.lean:74` | `Skeleton`: objects modulo isomorphism via an induced category. |
| `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean:39` | `ObjectProperty.FullSubcategory`: retains ambient morphisms, so its skeleton counts bundle isomorphisms, not presentations. |
| `Mathlib/AlgebraicGeometry/Geometrically/Connected.lean:40` | `GeometricallyConnected`: geometrically ConnectedSpace, not merely PreconnectedSpace; empty fibres are excluded. |
| `TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean:69` and 104 | Constant-rank full subcategory and contravariant pullback functor. |
| `TauCeti/AlgebraicGeometry/Cohomology/EulerCharacteristic.lean:105` | `Scheme.Modules.eulerCharBelow`: truncated finrank sum, without finiteness/vanishing built into its definition. |
| `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:131` | `InvertibleSheaf.trivial`: the rank-one free sheaf. |
| `TauCeti/Combinatorics/Young/HookLength/Basic.lean:136` and 140 | Arm/leg lengths use natural subtraction; the roadmap correctly restricts products to actual cells. |
| `TauCeti/RepresentationTheory/Symmetric/FrobeniusCharacteristic.lean:45` | `frobeniusCharacteristic n d h`: finite-variable degree-n symmetric homogeneous polynomials, with n≤d; no stable Hall pairing in this declaration. |

A scratch copy printed `#check @name` for all five retained declarations in one elaboration. The three definitions keep k, Field k, X, its structure morphism, and their rank/bundle or degree arguments. The matrix theorem retains Field and Finite. The bundle theorem retains Finite k, properness, smooth relative dimension one and geometric connectedness, plus every rank and both integer degrees. No binder disappeared, and no signature change is required.

The two sorried theorems were tested separately with `simp`, `rfl` and `infer_instance` on scratch copies. Neither theorem closes: simp makes no progress, the sides are not definitionally equal, and neither goal is a typeclass. Object searches found no pinned one-lemma nilpotent enumeration or absolute bundle degree-independence theorem. The GL cardinality theorem has a different carrier and conclusion. Neither retained theorem is a definition, small-value Check or boundary-case substitute; there is no padding finding.

README headlines and their treatment:

| Headline | Acceptance-file treatment |
|---|---|
| Finite-field nilpotent matrix enumeration (§1.4) | Stated as `nilpotent_matrix_count`. |
| Absolute bundle count independent of degree (§10.4) | Stated on native sheaves as `absIndecCount_eq_of_degree`; rank zero is included without replacing the positive-rank theorem. |
| Nilpotent-pair exponential and Jordan fibre masses (§§2.3,2.7) | Named in docstring; missing coherent rank-degree/HN groupoids. |
| Green bialgebra, spherical HN membership (§§3.2,4.7) | Named; missing curve Hall algebra and completion. |
| Generic spherical form and universal counts (§§4.8–4.9) | Named; missing Hall carrier and reciprocal specialization. |
| Partition generating/residue formulas (§§6.1,6.3) | Named; missing compatible Adams series, kernels and universal counts. |
| Origin constant formula (§6.6) | Named; missing universal invariant and its regular affine-cone extension. |
| Stable canonical Higgs geometry and BB strata (§§7.3,8.1) | Named; missing actual coarse Higgs scheme and strata. |
| All-characteristic coprime Higgs count (§8.3) | Named; missing canonical stable coarse moduli. |
| Purity and compact Poincaré polynomial (§§9.1,9.3) | Named; missing actual Higgs cohomology/comparison carriers. |
| Nilpotent-cone trace/components (§9.4) | Named; missing reduced Hitchin fibre/cohomology/universal invariant. |
| Mellit Laurent integrality and universal identification (§§10.3–10.4) | Named; scalar degree-independence consequence is stated separately on native carriers. |
| Positivity in every degree (§10.5) | Named; missing universal invariant. |
| Parabolic and slope-cut universality (§§11.2,11.4) | Named; missing their curve-count and specialization carriers. |
| Constructible spherical Hopf/primitive Lie theorem (§11.5) | Named; missing constructible Euler pushforward and Hall carrier. |

No statable omitted headline or artificial replacement was found. The three real-bodied definitions serve the native degree-independence headline. There are no sorry-valued data definitions, set_option directives, extra examples or forbidden imports.

### Ownership and supplier audit

I used `roadmaps grep` and `roadmaps show` for object searches and supplier resolution, and inspected the corresponding main or supplied-head passages. Searches included nilpotent matrix counting, absolute indecomposables, coherent Higgs sheaves, Hall algebras, stable symmetric functions, Hall pairing, Macdonald functions and BB strata, together with pinned-library searches. Existing degree, bundle, partition, radical, GL-cardinality, HN, mass and cohomological infrastructure is imported rather than assigned a second construction. This roadmap's new objects are the curve-specific nilpotent/Jordan correspondences, Hall and shuffle counts and their Higgs applications. No duplicate fully qualified Lean name was found.

| Supplier citation | Resolved location and boundary |
|---|---|
| AlgebraicVectorBundles L0A–L2B | Main `TauCetiRoadmap/AlgebraicVectorBundles/README.md:215–369`; native sheaves, ranks, tensor/dual and pullback. |
| RepresentationTheory/SchurWeyl Layer 7 | Main `TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md:323–342`; finite-variable theory is present; stable ring/pairing mismatch is R01. |
| RepresentationTheory/QuiverRepresentations Layer 2 | Main module-level Krull–Schmidt owner, not a replacement for the categorical Hom-finite recognition theorem. |
| RepresentationTheory/ArtinAlgebras Layer 0 | Index resolution locates recognition and radical matrix criteria in a new roadmap; the brief provides no checkout for this open folder. Its independent open-work ownership is not certified here. |
| SchemeAndStackFoundations | Main §§1.18–1.21 at 2745–2967; §2.6 at 3437; §2.18 at 3959; §2.20 at 4275; §3.3 at 4713–4747; §§3.6–3.7 at 4905–4954; §§4.1,4.5 at 5066,5244; §4.14 at 5706–5723. Ext–Hom in §3.3 has locally free first input, so the explicit coherent-duality extension is meaningful. Quot carries Noetherian/projective hypotheses, satisfied by the field curves and chosen spread-outs. |
| GlobalShtukasAndFunctionFieldLanglands §§0.1,0.5–0.6,0.13 | Supplied head, `README.md:262–318,456–478`; coherent HN, hereditary Euler form, fixed-class boundedness, bundle/torsion masses. The rank-zero bundle convention and q^(−rl) torsion factor agree. |
| ClassicalGroupsPartII §§CG.0.4–0.5,CG.2.4–2.6 | Supplied head, `README.md:469–522,1143–1222`; reciprocal torus, full invariant/character ring. Positive tensor constituents are not substituted for the full ring. |
| FunctionFieldArithmetic §§0.2–0.3,5.1–5.4 | Supplied head, `README.md:482–541,1726–1864`; degree-one integer divisor, Picard points and zeta comparison. No rational point is inferred from degree surjectivity. |
| HabiroNahmSeries §5.1 | Supplied head, `README.md:1081–1176`; ordinary multivariate augmentation calculus and plethystic coefficient family over ℚ(q). The reciprocal-parameter extension remains a declared request. |
| QSeriesPartitionsAndMockModularForms §§2.4,3.5 | Supplied head, `README.md:303–322,482–503`; q-binomial/Euler identities and ordinary partition adapters. Modified Macdonald theory is not asserted to exist there. |
| WeilConjectures WC.1 | Index-resolved §1.7 at `README.md:376–412`; finite-groupoid mass and action cardinality, distinct from homotopy-fibre Fubini here. |
| EndoscopicTransferAndUnitaryTraceComparison §§3.6–3.7 | Index-resolved `README.md:1238–1297`; characteristic-restricted reductive stack and all-field coherent positive-rank presentation. The locally free comparison is separately requested; the discarded two-frame route is not needed by the retained Hall comparison. |
| AutomorphicSpectralTheory §§6.22c,6.24 | Index-resolved `README.md:3372–3390,3410–3459`; bundle Higgs HN and C(B,A), including strict-slope Ext² vanishing. The imported order is respected. |
| ReductiveGroupsPartII §RG2.3.7 | Main section at `README.md:5201`; Lang's geometric surjectivity/H¹, not H² neutrality. |
| SchemeKTheoryOperations §§6.2.1–6.2.2 | Index-resolved `README.md:2132–2163`; special λ-rings and Newton Adams, with binomial ψ₂(2)=2 rather than 4. |
| HabiroCyclotomicCompletions §1.1 | Index-resolved elementary q/series substitution and plethystic exponential; agreement is requested under Laurent specialization rather than by a second definition. |
| DeligneWeightsAndPurity §§0.10,0.12,0.16–0.18,1.7,7.12,7.15,8.8–8.11,10.5 | Index-resolved eigenvalue/weight interfaces and degree-fibre equidistribution, notably `README.md:730–849,3245`; no arithmetic semisimplicity or canonical same-weight splitting is imported. |
| ArithmeticStatisticsPartVIII §5.17 | Index-resolved `README.md:961–996,1029–1044`; odd-characteristic hyperelliptic monodromy, auxiliary ℓ≥5 avoids the genus-one mod-3 lifting exception. |
| AlgebraicModuliForArithmeticGeometry §§1.3,4.19 | Index-resolved `README.md:602–680,7357–7374`, coherent flags and affine-stabilizer/gerbe material; character GIT is an explicit extension request, not attributed to the existing §4.19. |
| EtaleDualityAndPerverseSheaves §§0.4,0.6–0.7 | Index-resolved `README.md:554–667,821–992`; trace and rational duality. The affine-bundle compact comparison remains an explicit extension. |
| CohomologicalPointCounting and its CompactSupport/EllAdicRealization/TraceFormula family | Combined endpoint `README.md:44–95`; CompactSupport layers at 253–315, EllAdicRealization at 290–347, TraceFormula at 381–425. The cited layers resolve; comparison uses a common lisse stratum, not unrelated fibres. |
| ComplexComparisonPartII §§C6.3–C6.6 | Index-resolved `README.md:4157–4355`; ordinary, compact and rational Artin comparison with the separated finite-type/ctf bounds used here. |

All `*Needs:*` lines were read. Local forward numbering at §4.9→§4.10 is acyclic: §4.10 only uses §0.1 and its external suppliers. The seven supplied plan gaps have named suppliers and precise mathematical content, but the retained-route registration needs R02. No mathematical gap is raised merely because its supplier has not implemented it.

## Not verifiable

- **M20:** Theorem 1.1, pp.302–303; Proposition 3.1, pp.310–312; §§4–5 and Theorem 5.2, pp.312–321. The supplied manifest settles this as uncertified/paywalled. I did not request it again. Rank-one kernels, pole controls and the other independent instance checks above do not certify its general regular-sequence theorem.
- **FH58:** Theorem 1, p.499, proof pp.499–503. Settled locator-only; the recorded prior Euclid response was access-protection HTML. The nilpotent count is independently stated at S16 lines 639–645 and was checked in small ranks here; the original FH58 proof was not read.
- **HES81:** Theorem 5.7, pp.55–89. Settled locator-only/paywalled. S16 lines 2933–2943 and 3057–3067 state the applications, and the BB controls above agree; the original general theorem was not independently inspected.
- **Open work without supplied files:** Ownership against open pull requests for which the brief gives no checkout was not independently checked. Index-resolved supplier text is distinguished above from main and the supplied heads; it is not a claim to have audited every unprovided open branch. In particular this limits the ArtinAlgebras ownership check. No additional checkout was fetched.
- No new legal-text request is pending. M20P was successfully obtained through the sources service. No finding depends on guessing an inaccessible source's contents.

## Source issues

Nine relevant printed pages were also visually inspected; the weighted Jordan exponent on p.332 is correctly printed and is not an erratum. For the p.333 prefactor, genus one and λ=(1) give printed P/(q(q−1)) versus required P/(q−1). The positivity and eigenvalue issues below are witnessed by the §9.2 rows and rank-one Higgs count qP, respectively.

- **Misprint** in S16 at Lemma 2.4, equation (2.1), printed p.309: the source says a repeated indecomposable contributes n copies of its radical; it should be the full n-by-n matrix radical block; affects the proof.
- **Misprint** in S16 at §4.2, formula preceding (4.1), printed p.316: the source says the torsion correction is q^(−l/2) regardless of bundle rank; it should be q^(−rl/2); affects a stated result.
- **Misprint** in S16 at §5.6, identity preceding (5.18), printed p.333: the source says the arm-zero volume prefactor is q^(−∑r_i²); it should be q^(−(g−1)∑r_i²); affects the proof.
- **Misprint** in S16 at Corollary 1.9, printed p.305: the source says the origin count is the positive Fourier sum of differential residues; it should be the negative sum with the displayed definition of A⁰; affects a stated result.
- **Misprint** in S16 at Corollary 1.4(i), printed p.301: the source says the reciprocal nilpotent-cone count has prefactor q^(2D); it should be q^D; affects a stated result.
- **Misprint** in S16 at Corollary 1.4(ii), printed p.301: the source says component multiplicity is read in cohomological degree D; it should be degree 2D; affects a stated result.
- **Misprint** in S16 at §6.11, equations (6.11)–(6.12), printed pp.351–352: the source says affine ranks D and b shift cohomological degree by D and b; it should be 2D and 2b, with the displayed twists unchanged; affects a stated result.
- **Error** in S16 at Corollary 1.5, printed pp.301–302: the source says positivity has a Weyl-invariant integral representative in the free polynomial ring; it should be positivity of a representative whose class is Weyl invariant on the paired cone; affects a stated result.
- **Misprint** in S16 at §6.10, paragraph after (6.10), printed p.350: the source says coefficients of A give multiplicities of unshifted eigenvalue monomials; it should include q^D and combine coincident specialized monomials; affects the proof.
- **Misprint** in S16 at §6.11, Hitchin equivariance paragraph, printed p.351: the source says scaling Higgs fields gives weight one on the Hitchin base; it should give weight i on the ith characteristic coefficient; affects the proof.
