<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1314#issuecomment-6423437275 -->
Red team round 1 pass a (codex) of 3f76749

Verdict: needs_changes

1. **F01** (P2) Null-space geometry is statable but absent from the acceptance test

   **Location:** packages/ExceptionalThetaCorrespondencesForG2/Suggested.lean:7, “No headline theorem is statable at the pins”; packages/ExceptionalThetaCorrespondencesForG2/README.md:155–165.

   **Claim:** None of the package's deep targets can be stated using the pinned carriers and a few simple definitions.

   **Witness:** TauCeti/Algebra/Octonion/Basic.lean:123,345,589 supplies the octonions, trace and imaginary submodule. Mathlib supplies linear equivalences, submodule images and finrank. Null-subspace and incident-flag transitivity require no represented group carrier.

   **Exact repair text:** “The null-subspace dimension bound, transitivity on equal-dimensional null subspaces, and transitivity on incident null line-plane flags are acceptance targets of §0.2. Define Null(W) by W≤imaginary(F) and xy=0 for x,y∈W; define Aut(g) for a linear equivalence by g(1)=1 and g(xy)=g(x)g(y). Over every characteristic-zero field, state the bound finrank(W)≤2 and the existence of such a g carrying W to W′ whenever both are null of equal dimension. State the simultaneous version for two incident flags of dimensions 1 and 2.” Add these theorems with `sorry`, real-body predicates, explicit field/characteristic binders and the used TauCeti octonion import; name them in the README and amend the module docstring. Keep the represented Chevalley-group comparison among the unstatable targets.

   **Retest:** W=0 gives dimension 0≤2 and the identity witness. W=span(u₁,v₂) has dimension 2 and all four products zero; the identity transports its standard flag. The norm-zero idempotent has trace 1 and is excluded. These statements mention the actual pinned octonions and quantify all characteristic-zero fields, without a stand-in group.

2. **F02** (P1) The division-period Ext proof uses a later division-model theorem

   **Location:** packages/ExceptionalThetaCorrespondencesForG2/README.md:863–867, “identify the relevant quotient as a discrete-series module”; §5.1:959–963.

   **Claim:** The supplied smooth/Schwartz comparison and the earlier triality statements suffice for Ext¹_G₂(RD(E),π)=0.

   **Witness:** GS lines 635–642 first needs RD(E)|G₂ = πdeg[1] ⊕ a supercuspidal module. Section 4.2 gives Spin₈ constituents only. Section 5.1 first supplies the division lift calculation and depends on §4.8→§4.7→§4.3.

   **Exact repair text:** Insert before §4.3: “For cubic division D, prove independently from its minimal orbit model that ΘD(1)=πdeg[1], and that ΘD(τ) is supercuspidal for τ≠1, without assuming Howe duality or the cubic-period chain. For every embedded cubic field E, deduce RD(E)|G₂≅πdeg[1]⊕C_E with C_E supercuspidal.” Cite Sav Proposition 5.1, Corollary 5.2 and §6, pp. 398–400, and GS Proposition 7.1(i)–(ii), p. 23. Make §4.3 and §5.1 consume this earlier target; reserve irreducibility and injectivity for §5.1. Add the raw division Jacquet computation to Layer 3, whose present §3.3 treats split E₆ only.

   **Retest:** The trivial PD× summand contributes multiplicity dim(1^(PE×))=1 and hence exactly one πdeg[1]. Every other summand is supercuspidal. Its Ext contribution vanishes by compact-center cuspidal splitting; the πdeg[1] contribution vanishes by the declared Schwartz contract for irreducible tempered π. No edge from §4.3 to §5.1 remains. The coarse roadmap depcheck does not inspect this internal cycle.

3. **F03** (P1) AL.4 does not supply the spin representation

   **Location:** packages/ExceptionalThetaCorrespondencesForG2/README.md:103, “AL.4 for unramified L-group Euler factors and the degree-eight spin representation”.

   **Claim:** The named AL.4 supplier constructs both the determinant factor and its Spin₇ representation.

   **Witness:** TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2769 takes a finite-dimensional representation r as input; it never constructs Spin₇'s spin module. TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:665–687 supplies the spin construction on the exterior algebra.

   **Exact repair text:** Replace the first clause by: “Consume AutomorphicLFunctionsAndLocalFactors AL.4 for unramified L-group Euler factors, taking r to be the degree-eight spin representation supplied by RepresentationTheory/SpinRepresentations Layer 4 and compared with the exceptional inclusion in §0.6.”

   **Retest:** For dim(W)=3 the exterior module has dimension 1+3+3+1=8. AL.4 then forms det(1−T r(t)); at t=1 it gives (1−T)^8. Taking AL.4 alone with its equally permitted trivial representation instead gives 1−T, so it cannot select the required representation.

4. **F04** (P1) The prime-degree torus-distinction input has no supplier

   **Location:** packages/ExceptionalThetaCorrespondencesForG2/README.md:975–977, “applies the prime-degree torus-distinction theorem”.

   **Claim:** The degree-three universal nonvanishing proof may apply the general prime-degree theorem from LT.

   **Witness:** LT lines 309–357 gives the odd-prime-degree distinction formula. Section 5.2's only needs are §5.1 and §1.8; neither constructs that theorem or its admissible-pair input. No matching supplier gap exists in design/plan.json.

   **Exact repair text:** Add a declared contract, in both the README and plan's gaps, with supplier SmoothRepresentationsOfLocalGroupsPartII, section SRU.3 and slug prime-degree-torus-distinction: “For a characteristic-zero nonarchimedean F of residue characteristic p, every central division F-algebra D of odd prime degree ℓ≠p, and every irreducible smooth complex representation τ of D×/F×, prove that τ has a nonzero (E×/F×)-fixed vector for some maximal field E⊂D, including one-dimensional norm characters.” Cite LT Theorem 1.4.2, printed pp. 6–7, and make §5.2 consume this contract. Its proof belongs to that supplier; the exceptional consequence remains here.

   **Retest:** At ℓ=3, p=2, q=2 and conductor parameter m=1, LT's unramified-inducing/totally-ramified-test dimension is q^m=2>0. At p=3 the contract's ℓ≠p hypothesis fails, while τ=1 still has fixed-space dimension 1 by the separate trivial-input calculation. The contract adds no good-prime restriction to the local Howe theorems.

5. **F05** (P3) The odd-Weil negative control is false

   **Location:** packages/ExceptionalThetaCorrespondencesForG2/README.md:1101, “The omitted odd Weil case has nonzero split ternary first occurrence”; also §8.5:1366.

   **Claim:** An odd Weil representation is excluded by nonzero split SO₃ first occurrence.

   **Witness:** GG lines 745–747 and 762–772: for σ=ω⁻χ with nontrivial quadratic χ, its Whittaker square class excludes 1, hence θ_SO₃(σ)=0. GG lines 791–799 gives its nonzero division-ternary lift χ∘N.

   **Exact repair text:** Replace the Check by: “For ω⁻₁ the split SO₃ lift is Steinberg. For a nontrivial quadratic χ, ω⁻χ instead has zero split SO₃ lift and nonzero division-ternary lift χ∘Nrd; it is nevertheless excluded by the explicit not-odd-Weil hypothesis. The admitted non-odd σ with zero split SO₃ lift has Fourier–Jacobi module σ∨.” In §8.5 replace its last sentence by: “Odd Weil inputs are excluded because ρ is supercuspidal: their division-ternary partners correspond to quadratic twists of Steinberg on PGL₂, not supercuspidal ρ.”

   **Retest:** Over F=ℚ₅ choose the quadratic character associated to the nonsquare class 2. Its odd Weil representation has Whittaker support 2F×², so 1∉2F×² and the split ternary lift is 0. The division partner χ∘Nrd is one-dimensional; its Jacquet–Langlands antecedent is St⊗χ, which fails the supercuspidality condition in §8.5.


6. **F06** (P3) Two constructions lack discriminating Checks

   **Location:** packages/ExceptionalThetaCorrespondencesForG2/README.md:460, “inversion exchanges the last two and fixes the first”; §10.1:1563–1577.

   **Claim:** These Checks test the constructed depth-zero representations and global Albert group.

   **Witness:** Section 1.8's sole Check also holds after assigning the three labels to zero representations. Section 10.1 has one rank-comparison Check for its algebra, group and descent construction, fewer than the required three.

   **Exact repair text:** Add to §1.8: “For each finite cuspidal type σ, every proper finite-parabolic unipotent fixed space is zero; the trivial type instead has fixed-space dimension one. Functions supported on K in c-Ind_K^G σ recover a nonzero copy of σ under evaluation at 1. Since σ is a nontrivial irreducible finite type, σ^(K/K⁺)=0, whereas the trivial type has invariant dimension one.” Keep the label-inversion calculation as an additional Check. Add to §10.1: “Over a splitting field the Albert carrier has dimension 27 and the Koecher–Tits Lie algebra has dimension 133; the quaternionic Hermitian model has dimension 15 and is excluded. For diagonal frame elements, E₁∘E₁=E₁, E₁∘E₂=0 and N(diag(1,2,3))=6; replacing N by N² gives 36 and fails the cubic normalization.” Keep the existing rank comparison as the third independent Check.

   **Retest:** The falsely labeled zero modules fail the nonzero evaluation test. The trivial finite type fails the proper-unipotent and full-quotient invariant tests, with dimensions 1 instead of 0. The quaternionic carrier fails 15=27, and the squared norm fails 36=6; split/definite ranks remain 7 and 3.

## Headline acceptance coverage

| README headlines | Statable at the pins / acceptance-file disposition |
|---|---|
| §0.2 null dimension bound, null-subspace and flag transitivity | Statable on native octonions with simple real-body predicates; absent, R01. |
| §§0.1, 0.5–0.6, 2.1–2.3 exceptional group comparisons and rational stabilizers | The identified exceptional group schemes, embeddings and rational forms are missing. The docstring names the group-comparison obstruction. |
| §§1.1–1.13 reducibility and parameter labels | The required smooth exceptional representations, induction and named constituents are missing. The docstring includes these tables among the unstatable headlines. |
| §§2.4–2.6 minimal representations and outer normalization | No constructed smooth minimal modules at the pins; named in the docstring. |
| §§3.1–3.11 exceptional Jacquet filtrations and tempered compatibility | The minimal modules, normalized Jacquet functors and exceptional parabolics are missing; named in the docstring. |
| §§4.1–4.9 cubic periods and uniqueness | The triality minimal quotients and exceptional coefficient spaces are missing; these use the minimal-module obstruction in the docstring. |
| §§5.1–5.9 division and split-E₆ Howe duality | The actual smooth theta modules and disconnected partner are missing; named in the docstring. |
| §§6.1–7.8 finiteness, dichotomy, enhanced periods and tempered Howe duality | The exceptional theta modules, their oscillator comparisons and coefficient spaces are missing; named in the docstring. |
| §§8.1–8.8 full Howe duality, tables and discrete-series trichotomy | Same missing smooth carriers and constructions; named in the docstring. |
| §8.9 spin-pole/Shalika criterion and §8.10 finite-field comparison | The constructed local factor, Shalika model and finite-group types are missing; the docstring names the spin criterion and the lift tables collectively. |
| §§9.1–9.6 quaternion relative models | The identified forms, local theta modules and relative representation realizations are missing; named in the docstring. |
| §§10.1–10.7 global minimal kernel, nonvanishing, cuspidality and real central-character comparison | The global minimal automorphic module and real exceptional Harish–Chandra modules are missing; named in the docstring. |

No admitted stand-ins, API padding, boundary theorems or one-tactic theorem declarations occur in the present Lean file. The empty file is permissible for the unstatable headlines, but does not excuse R01.

## Computed statement ledger


All 96 numbered README targets, their attached API assertions and all 172 Check bullets were read. The table records calculations and negative controls; it does not purport to prove the analytic theorems by examples. “Compatible” means the listed test does not refute the target. Unless noted, the context is characteristic-zero nonarchimedean F, q≥2, complex smooth representations, normalized induction and nontrivial ψ. Algebraic statements retain their stated field hypotheses. Real and global rows override this context explicitly. Characteristic-p fields, the zero ring, q=1, nonlocal equal-characteristic fields and rank-zero replacements for the fixed exceptional groups are outside these theorem signatures; they are not used to invent counterexamples. Zero spaces, trivial representations, nonfield cubic algebras and small residue characteristics are inside the relevant signatures and are tested below.

| Suggested.lean item | Section, variables, instances | Computation | Result/change |
|---|---|---|---|
| No declarations (39 lines read) | Empty namespace; no variables, instances, definitions or admitted data | 0 declared theorems, 0 definitions, 0 binder checks, 0 padding declarations; 1 import | No elaboration needed or run. R01 supplies genuinely statable headlines. |

In the octonion tests uᵢ and vᵢ denote top and bottom Zorn basis vectors. e is the diagonal idempotent (1,0); all unspecified entries are zero.

| README statement | Context / instances tried | Computed values on the two sides or negative control | Result / change |
|---|---|---|---|
| Conventions, lines 23–31 | q=2; one-dimensional χ; theta scalar i | abs(ϖ)=1/2; regular action χ(a)/χ(b); WD scales N by 1/2 versus LP's 2; Θ(if,φ)=iΘ, Θ(f,iφ)=−iΘ | Compatible; retain both WD conversions |
| 0.1 automorphisms and group comparison | char 0; id, conjugation, diag(2,1/2,1), dual numbers | id(xy)=xy; conjugate(u₁u₂)=−v₃ but conjugate(u₁)conjugate(u₂)=v₃; 2·(1/2)=1; ε coefficient v₃−v₃=0; id+ε·id sends 1 to 1+ε | Compatible; infinitesimal test excludes pointwise-only comparison |
| 0.2 null dimension/transitivity/flags | W=0, span(u₁), span(u₁,v₂), F·1, F·e | Dimensions 0,1,2; all products in the plane 0; u₁v₁=e≠0; tr(1)=2, tr(e)=1, N(e)=0; id sends each standard flag to itself | Compatible mathematically; R01 missing acceptance theorems |
| 0.3 P,Q radicals/moduli | diag(ϖ,1), q=2 | Graded dimensions 4+1=5 and 2+1+2=5; radical-center dimensions 1,2; δP=1/8, δQ=1/32; square roots 2^(−3/2),2^(−5/2); U/Z(U) dimension3, U/[U,U] dimension2 | Compatible; distinct quotients essential |
| 0.4 cubic characters and dual spaces | xy(x−y), x³, zero, F³/F×K/field | Cubic discriminants 1,0,0; primitive idempotent counts 3,2,1; nontrivial ψ on trivial module gives (1−ζ)v=0 hence coefficient0 | Compatible; singular cubics excluded |
| 0.5 quadratic stabilizers | F×F, quadratic field, Zorn diagonal torus | Pointwise dimensions 8,8; setwise component count2; swap moves (1,0) to (0,1); u₁v₁ fixed since 2·1/2=1 | Compatible |
| 0.6 dual inclusions/centralizers | long SL₃, subregular SO₃, principal SL₂; S₃ | 7=1+3+3, 8=1+7; invariant dimensions1 versus0; centralizer orders6 versus1; cζc⁻¹=ζ²≠ζ; (−1,−1) acts1 | Compatible; abstract SO₃ label alone fails |
| 0.7 parameter/WD definitions | trivial, principal, GL₁ abs, q=3 identity SL₂, nonabelian inertia | Tempered/discrete trivial indicators (1,0) in positive semisimple rank, (1,1) on torus; principal (1,1); abs character unbounded 3^n; Ad(diag(1/√3,√3))E₁₂=E₁₂/3, LP gives3E₁₂; N=0 yields0=0; for a=(12), b=(123), (ab)⁻¹=(23)≠a⁻¹b⁻¹=(13) | Compatible; no elementwise inversion adapter |
| 0.8 component groups | principal SL₃, principal Spin₇, subregular G₂ | Raw orders3,2,6; split quotient orders1,1,6; G₂ center order1 | Compatible |
| 0.9 15-dimensional Jordan model | scalar z=2, diagonal(1,2,3), three parabolics | Scalar factor4·1/4=1; dimension15≠27; Pfaffian6 versus unit1; at q=2 moduli1/4,1/32,1/8 | Compatible |
| 0.10 Weyl chamber | s=(1,2,3),(3,2,1),(3,2,−1) | reflection→(6,−3,−2)→(1,2,3); Q=50=50; source alternative5≠195/4; nine wall values1,2,1;5,4,3;9,8,7; simple-coroot values3,1,1 at last vector | Compatible; source errors recorded |
| 1.1 P supercuspidals | selfdual det1, selfdual det≠1, nonselfdual | Real reducibility sets {−1/2,1/2}, {0}, empty; respective cardinalities2,1,0 | Compatible with GS Proposition3.1 |
| 1.2 P Steinberg | χ=1, quadratic≠1, cubic≠1 | Reducibility sets {±3/2,±1/2}, {±1/2}, {±1/2}; lengths at1/2:3,2,2; χ and χ⁻¹ cubic give same DS label | Compatible |
| 1.3 P characters | χ=1, quadratic/cubic nontrivial | At1/2 length3, at3/2 trivial top; final Q exponent1 differs from source1/2 by1/2; cubic middle character has GL₂ dimension1, Steinberg is infinite-dimensional | Compatible; corrected source table |
| 1.4 Q supercuspidals | determinant1, S₃-dihedral determinant≠1, other selfdual | Reducibility sets {±1/2}, {±1}, {0}; q=2 positive twist factors2^(−1/2) versus1/2 | Compatible |
| 1.5 Q Steinberg/characters | I_Q(1/2,st), I_Q(1/2,1) | Lengths3,3; socle lengths2,1; same length does not identify modules | Compatible |
| 1.6 Borel and opposite maps | distinct quadratic triple; s₁=2,s₂=1 | Triple product1, two summands and one generic; equal characters fail distinctness; opposite exponent −2+1/2=−3/2, wrong coordinate gives−1/2 | Compatible |
| 1.7 nontempered normal forms | (2,1), wall(1,0) | 2>1>0 true; 1>0>0 false; boundary has zero simple exponent | Compatible |
| 1.8 unipotent depth-zero labels | labels1,ω,ω² | Inversion permutation fixes1 and exchangesω,ω²; label count3; this calculation would also hold for arbitrary mislabeled representations | R06: Check cannot distinguish falsely labeled zero modules |
| 1.9 parameter labels | S₃ and principal SL₂ | Enhancement dimensions1,2,1; squares sum6; invariant seven-space dimensions1 versus0; principal component order1 | Compatible |
| 1.10 finite cubic models | π=1 versus infinite-dimensional nongeneric π | Trivial coefficient0 because 1−ψ(n)≠0; maximal subregular coefficient c=dim W_E≥1; regular coefficient0 | Compatible; infinite-dimensional hypothesis necessary |
| 1.11 P₂/P₁₃ series | selfdual supercuspidal τ, det1, s=1/2 | I₂ length2 versus I₁₃ length4 | Compatible |
| 1.12 Siegel | selfdual versus nonselfdual discrete series | Summand counts2 versus1; generic dimensions1,0 in split case | Compatible; not applied to contains-1 non-DS inputs |
| 1.13 P₁ and SK | nongeneric τρ and generic member of its parameter | Whittaker dimensions0 versus1; Plancherel scalar same; real reducibility points−1/2,+1/2 | Compatible with GT part(vi) |
| 2.1 Freudenthal–Jordan | dimensions1,3,9,15; scalar x=2 | Lie dimensions14,28,78,133; adjoint x#=4, double16=N(x)x, x·x#=8=N(x); T(1,1)=3; derivative dN₂(3)=36=T(4,3) | Compatible; zero norm/adjoint fail unit laws |
| 2.2 three dual pairs | M₃, cubic division D/Dop, Herm₃(M₂) | Partner dimensions8,8,21; ambient dimensions78,78,133; division invariants1/3,2/3; Jordan products both(xy+yx)/2 | Compatible |
| 2.3 triality see-saw | E=F³ or field; nonsquare ϖ | Res SL₂ dimension9, finite-quotient dimension9, kernel order2; common determinant square class of three diag(ϖ,1) is nontrivial, so no SL₂³ lift; PE× dimension2 | Compatible; rational quotient not point quotient |
| 2.4 minimal models | spherical E₆/E₇, zero module, division D | Spherical fixed dimensions1 versus0; open kernel omits nonzero zero-evaluation quotient; division D has no nonzero nilpotent, split M₃ has E₁₂²=0 | Compatible tests; A₁ principal-series parameter not certified |
| 2.5 big/small theta and see-saw | Π=χ for C₃, H=1; zero Hom family | dim Hom(χ,χ)=1, dim Hom(χ,χ∨)=0; multiplicity of π in π⊗τ isτ; if all quotient Homs0 then finite-length small lift length0 | Compatible; dual orientation correct |
| 2.6 outer normalization | T, −T, 2T; diag(2,3,5) | Spherical eigenvalues1,−1,2; squares1,1,4; inverse-transpose yields(1/5,1/3,1/2) and returns original on second application | Compatible |
| 3.1 ambient gradings | five maximal radicals | Derived-Levi dimensions66,38,78,66,48; 38=3+35 and48=3+45 | Compatible |
| 3.2 orbit kernels | (u₁,v₂), (u₁), zero | Span dimensions2,1,0; zero excluded; pairwise products0 in first two cases | Compatible |
| 3.3 raw split E₆ | det=ϖ, q=2 | Boundary factors2^(−3/2)≠2^(−1/2); both nonzero; raw division calculation not included | R02 |
| 3.4 G₂-P Jacquet | scalar z, z=ϖ | Sym³⊗det⁻¹ factor z³/z²=z; top factors abs(z),abs(z)^3; atq2:1/2,1/8 | Compatible |
| 3.5 G₂-Q Jacquet | lower diagonal(ϖ,1),(1,ϖ) | Middle factorsq^(−1/2),q^(−1); atq2 unequal; top determinant exponents3/2,2 | Compatible numerical factors; A₁ parameter not certified |
| 3.6 H-P₃ Jacquet | det=ϖ | Top E₆ extra factor1, trivial-line factorq⁻¹; layer count3 | Compatible |
| 3.7 H-P₁ Jacquet | Q₁(ϖ,I), Q₂(I,ϖ) | First ν=1, δ=q⁴; second ν=ϖ, δ=q⁻³; atq2:16 versus1/8 | Compatible |
| 3.8 H-P₂ Jacquet | (zI,z⁻¹I); nonconstant f | Determinant product1; atz2:4·1/4=1; translating f=1_K by element outside K changes f(1) from1 to0, unlike the other scalar action | Compatible; independent actions retained |
| 3.9 forward support | Q positive exponent1 versus0; P family | Two matching GL₂ real exponents for Q; P target has P₁₃ Levi; strict inequality1>0 true,0>0 false | Compatible |
| 3.10 reverse support | rank3 proper Levi subsets | 2³−1=7 cases; checking only P₂ leaves6 | Compatible; source omitted cases made targets |
| 3.11 tempered equivalence | occurring tempered/nontempered pairs | Allowed indicators(1,1),(0,0); mixed(1,0),(0,1) contradict the two support implications | Compatible |
| 4.1 triality induction | s=±1/2, detϖ; split E | Inducing values q^(−1/2),q^(1/2); atq2 product1 but unequal; nonfield division embedding count0 | Compatible |
| 4.2 triality sequences | cubic field, F×K, F³ | Lengths3,2,2; division terms possible,0,0; nonfield R15→I(1/2) cokernel0 | Compatible |
| 4.3 Ext obstruction | disjoint supports, tempered matching block | Ext dimensions0,0 only after RD=πdeg⊕supercuspidal is supplied; no nontempered projectivity follows | R02 missing prior decomposition |
| 4.4 Mackey restriction | three cubic types, s=1/2 | Boundary multiplicities3,1,0; P exponent1/2 and Q exponent3/2 | Compatible |
| 4.5 open orbit | allowed π at s=1/2 | Four boundary Hom and Ext terms0; open-restriction kernel0,cokernel0; omitted hypothesis gives no such values | Compatible |
| 4.6 cubic coefficient | E=F³ in divisionD, maximal field E⊂D | Embedding set empty versus containing inclusion; coefficient0 versus nonzero c-Ind; c-Ind has nonzero characteristic function on a compact-open quotient patch | Compatible |
| 4.7 cubic period chain | finite endpoint d=1, attempted intermediate2 | 1≤2≤1 false, 1≤1≤1 true; two separate1≤2 inequalities do not force2=1 | Compatible |
| 4.8 nongeneric uniqueness | two multiplicity copies, d=1 | Coefficient contribution2>1 | Compatible |
| 4.9 weak existence | split E versus cubic field | RD(split)=0, hence R15=I; nonzero Hom forces H indicator1; field case permits preliminary indicators(1,1) before dichotomy | Compatible |
| 5.1 division Howe | τ=1, τ≠1; nonfield E | Θ(1)=πdeg with generic indicator0; τ≠1 nonzero lift has proper Jacquet dimensions0; nonfield cubic coefficient0 | Compatible after R02 order repair |
| 5.2 universal division occurrence | p=2,3; q=2,m=1; τ=1 | gcd(3,2)=1,gcd(3,3)=3; LT dimension2¹=2; trivial fixed dimension1 at both primes | R04 general input unowned |
| 5.3 opposite division | noncommuting x,y | i(xy)=y⁻¹x⁻¹=i(x)·op i(y); Jordan products identical; inverse map to same group would reverse order | Compatible |
| 5.4 outer signs | orbit size2, fixed orbit; trivial representation | Induced restriction length2 versus two extensions each restriction length1; C₂ eigenvalues±1; trivial Whittaker dimension0 for both signs | Compatible; nongeneric sign requires model |
| 5.5 E₆ coefficient fibers | C₂ eigenvalues±1 | Invariant dimensions1,0 since2v=0 impliesv=0 overℂ | Compatible |
| 5.6 generic precursor | p=2 and p odd | Branch-label count2; atp2 precursor alone leaves(1,1) possible; later table excludes it | Compatible; no premature exclusivity |
| 5.7 minus lift | selfdual PGL₃ SC atp2; p odd; GL₂ st quotient | p odd input count0; atp2 minus Whittaker dimension0 but theta nonzero; adjacent-rank Hom dimension1, nonzero image=st; zero map image0 fails | Compatible |
| 5.8 E₆ table | St±; generic nontempered input | Outputs πgen andπsc with generic indicators1,0; genericity of whole standard module does not force generic quotient | Compatible; source unrestricted assertion corrected |
| 5.9 E₆ Howe | zero/nonzero lift | Cosocle lengths0/1; two distinct quotients would give length≥2 | Compatible |
| 6.1 Fourier–Jacobi | odd ω⁻₁, odd ω⁻χ χ≠1, admitted σ | Split ternary ω⁻₁→St nonzero; for χ from nonsquare2 overℚ₅, support2F×² excludes1, so split ternary output0; admitted FJ=σ∨ and double dualσ | R05 false odd-Weil Check |
| 6.2 orthogonal comparison | one-dimensional χ versus infinite-dimensional smooth module | χ∨(g)=χ(g)⁻¹; finite algebraic/smooth dual dimensions both1; infinite algebraic dual may include non-open stabilizers | Compatible; finiteness retained only under supplier hypotheses |
| 6.3 A₅ restriction | F⁶, F⁶−0, projective lines | Sp₆ orbit counts2,1,1; 0 is excluded from the homogeneous model | Orbit counts support the finite-length route; exact factor identification not certified |
| 6.4 noncuspidal length | two plus three maximal parabolics; sample lengths1,2,3 | Filtration count5; sample finite total6; knowing bottom1 alone leaves other terms unbounded | Compatible |
| 6.5 nongeneric length | noncuspidal length2 | 2+ε gives2 or3 forε∈{0,1}, never∞ | Compatible |
| 6.6 E₇ Whittaker fibers | trivial G₂ input; nontrivial ψ | Generic coefficient0 by(1−ψ(n))v=0; residual actions are on H and G₂ respectively | Compatible |
| 6.7 dichotomy | common cubic dimension1 | Simultaneous occurrence forces1=2, false; nonzero requirement excludes0=0 | Compatible |
| 7.1 enhanced period | two genuine signs, ψ versus conjugateψ | (−1)(−1)=1; center valuesζ versusζ⁻¹; U/Z dimension3 versus U/[U,U] dimension2 | Compatible |
| 7.2 Shalika definition | trivial π; anti-diagonal z=2 | Coefficient dimension0; determinant product4·1/4=1; diagonal stabilizer loses centralGm | Compatible |
| 7.3 root exchange | additive F₂ quotient; constant onF | Fourier sums1+(−1)=0,1+1=2; normalized transform squared gives reflection; integral of1 overF=∞ | Compatible compact-support control; exact character kernel must be retained |
| 7.4 enhanced multiplicity | s=−1/2,+1/2 | −1/2<1/2 true, +1/2<1/2 false; asserted dimension1 only first | Compatible |
| 7.5 Shalika fiber | genuine tensor, dual exponents | Central action1; fiber exponent+1/2, dual−1/2; q2 character values√2 versus1/√2 | Compatible |
| 7.6 generic chain | endpoints1 and1, or0 and0 | All intermediate dimensions1 in nonzero case; endpoints0 supply no generic occurrence | Compatible |
| 7.7 generic uniqueness | two generic quotients, nongeneric quotient | Whittaker lower bound2>1; nongeneric contributes0 and needs cubic argument | Compatible |
| 7.8 tempered Howe | zero/nonzero; length-only substitute | Cosocle lengths0/1; arbitrary length2 module can have cosocle2 | Compatible |
| 8.1 nontempered table | Q/P exponent1, boundary0 | Q→J₂, P→J₁₃; both strict hypotheses fail at0 | Compatible |
| 8.2 tempered Siegel table | selfdual contains1 versus selfdual DS | E₆ sign count1 versus2; corresponding Siegel lengths1 versus2 | Compatible; DS criterion not used in first case |
| 8.3 three Howe correspondences | division branch, H₃ branch | Division/H indicator sums1; H₃ branch full indicators(0,1,1), sum2 | Compatible |
| 8.4 tempered non-SC table | Steinberg; GL₂ SCdet1; GL₂ St negative control | St→StH; shifted Q/St socle has2 constituents, not1; division imageπdeg→1; supercuspidal hypothesis blocks false δ formula | Compatible; previous repair retained |
| 8.5 πρ family | SCρ versus St⊗χ | Proper Jacquet modules0 forSC; St⊗χ notSC; odd input's anisotropic partner is1-dimensionalχ∘Nrd | R05: clarify why odd inputs are excluded |
| 8.6 τρ and D₆ big lift | σρ classical first occurrence | Split SO₃ output0, SO₅ outputnonzero; generic dimension0 and proper Jacquet modules0 forτρ | Compatible first-occurrence test |
| 8.7 remaining SC inputs | πρ versus other residual family | Forπρ only P₁ top contributes; other family's three maximal Jacquet modules(0,0,0); δ₁ outputDSindicator1 | Compatible |
| 8.8 DS trichotomy | H₃ branch | Nonzero H lift indicator1 but its DSindicator0; exactly one DS branch versus two nonzero branches | Compatible |
| 8.9 spin-pole criterion | α∨(ϖ), q=2; simple pole | det₅₆=ϖ⁵⁶, sim=ϖ²; abs(det)^(3/28)=2⁻⁶=abs(sim)^3; δhalf=2⁻⁸; normalized exponent−1; generic quotients dimensions0 versus1; Lorder−1 givesγorder+1 | Compatible conditional on two declared spin gaps; R03 supplier attribution |
| 8.10 finite example | q=7, a order43; trivialtype negative control | 7²−7+1=43; diagonal exponent sum1−7+6=0; seven exponents0,1,42,36,7,6,37 distinct; Kfixed0 but K⁺fixednonzero | Compatible at stated p>5 |
| 9.1 quaternion stabilizers | split/division p-adic; Hamilton real; norm-one−1 | Stabilizerdimensions3,3,3; split noncompact versus divisioncompact; −1 fixesD and acts−1 onD⊥; setwise SO₄dimension6 | Compatible |
| 9.2 quaternion coefficients | ternary ranks3,0 | Open labelrank3 versus trivialrank0; Aut(D)dimension3 andGDdimension3, but PGL₂ versus SL₂ forsplitD (centers1 versusμ₂) | Compatible |
| 9.3 tempered relative quotient | ranks0,1,2 versus3 | 0,1,2<3; odd rank1 coveredcenter−1 incompatible with ordinarySp₆ center-cover action+1; rank0 trivial non-tempered | Compatible; pure-rank classification must include all three |
| 9.4 SC relative embedding | nonzero projective quotient | Split surjection q with sectioni givesqi=id; multiplicity≥1; zero map gives0≠id onnonzeroπ | Compatible only SCcompact-center scope |
| 9.5 Steinberg relative L² | compactGD, splitGD; N=1 and compactopenK | Normalized compact volume1, split volume∞; ∫Kχf=vol(K)>0; N=1 gives1; left translation byn₀ multipliesfunctionalχ(n₀) | Compatible; not deduced from generic character alone |
| 9.6 compact real branching | λ=(3,2,0), trivialλ | Interlacingμ=(2,2):3≥2≥2≥0 andSU₂weight0; λ0 givesμ0, invariantdimension1 | Compatible; standard SU₃branching supplies actual vectors |
| 10.1 global Albert pair | split O; totally definite O over totallyreal k | Albert dimension27; E₇ranks7 versus3, difference4; realG₂ compact only definite case | R06: construction has fewer than 3 independent Checks |
| 10.2 residual minimal module | r3,d8; s1,5,9 | Pole formula1+4j gives1,5,9; minimal5≠trivial9; zero section has zero residue, so poles describe family/nonzero choices, not every section | Compatible family reading; the pole is not claimed for every section |
| 10.3 global theta | f0,φ0,if,iφ; compact quotient | Θ(0,φ)=Θ(f,0)=0; scalar factorsi and−i; localzero factor forcesglobal0; positive measure rescalec multipliesΘbyc | Compatible |
| 10.4 period nonvanishing | chosen product of nonzero test factors; zero period | Product of nonzero complex factors≠0; replacingperiodby0 gives0; zero kernel still gives0 even whenperiodnonzero | Compatible existential test-data quantifier |
| 10.5 cuspidality | either alternative; allmaximalHparabolics | Three constantterms(0,0,0); twozeros alone leave thirdfree | Compatible; source supports sufficient alternatives |
| 10.6 split global genericity | nonzeroWhittaker input; oneSC-H place | Some unfoldedcoefficient≠0; threeproperlocalJacquetmodules(0,0,0); genericity alone doesnot implythesezeros | Compatible |
| 10.7 real central character | λ0 and large dominantλ; realcontext | λ+ρ=ρ versusλ0; wrongunshiftedparameter0≠ρ; multiplyingλbyn increasespositivecorootpairings linearly, but the actual exceptional matching polynomial is absent | HPS comparison waived; shifttest doesnot verify exceptionalformula |

## Verified sound

Read counts: **96 numbered README targets**, their attached API assertions, **172 Check bullets**, all **1,713 README lines**, and all **39 Suggested.lean lines**. The Lean inventory is **0 declarations, 0 variable/instance contexts and 0 padding declarations**. There was consequently no elaborated signature to inspect; no Lean command or build was run.

Source-locator count: **107 distinct inline source-line anchors** were resolved and their source passages read in **14 accessible manifest works**. This counts anchors, not 107 independently proved theorems. Printed page/theorem locators were compared with the stated source versions; discrepancies in the source mathematics are recorded below. The supplemental GS99 is Gordan Savin and Wee Teck Gan, *The Dual Pair G₂ × PU₃(D) (p-Adic Case)* (1999), [publisher DOI](https://doi.org/10.4153/CJM-1999-008-9). It was obtained through the sources service from the publisher open archive; Propositions 6.8 and 8.1, pp. 142–143 (GS99 lines 600–608 and 638–646), do not resolve the split A₁ parameter. The three settled inaccessible works are listed below.

| Source | Locators inspected |
|---|---|
| GS | §§1–15, including Propositions 3.1–3.2; Lemma 3.4; §5; §§6–8; §9 coordinates; §§10–14 filtrations and periods; Theorems 15.1–15.3, Lemmas 15.4–15.5, Proposition 15.6 and Corollary 15.7. The cache is arXiv v1, as cited. |
| HKT | Lemma 4.6; Appendix A.1–A.10, including orbit models and the global Whittaker calculation. |
| SW | §3 dichotomy qualification, Proposition 4.6, Theorem 5.3, Lemmas 5.4–5.5, Theorem 5.6 and §§5.2–5.3 integral normalizations. |
| MS | §1 and Theorem 1.1; Theorems 4.3 and 5.3, with their raw induction conventions. |
| GG | Odd Weil and ternary lifts in §6; Propositions 8.1, 8.3–8.4; Theorem 9.1 and §9.5. |
| Pra | Theorem 3 and proof, pp. 173–174. |
| LL | Main theorem and its p=3 qualification; §§1–2, 3.5, 5–6, 8.4 and 10. |
| GrS | Chapter 5 introduction, Lemma 3.4 and case (4), Proposition 4.5, Corollary 4.9; Chapter 6 Lemma 2.9. |
| HS | §4.1, the remark after Corollary 4.6, Proposition 6.3 and Theorem 6.4. The pole list is for the Eisenstein family, not every section. |
| Sav | Theorem 3.4, Proposition 5.1, Corollary 5.2 and §6. |
| GS04 | §§5–8 and §12, including the spherical normalization, raw Jacquet sequences and depth-zero example. |
| Li | Theorems 3.1 and 4.8 and their low-rank range; see the OCR limitation below. |
| G99 | Theorem 11.3 and the p>5 range. |
| LT | Theorem 1.4.2, printed pp. 6–7, including the odd prime degree distinct from residue characteristic. |

Sibling/supplier citations checked: **18 named supplier roadmap families**, at main or the current new-roadmap head, including the two Part II gap owners. The section resolutions are recorded below. Object searches used the roadmap service and local main, package and supplied-head files, for null subspaces, root exchange, minimal representations, low-rank unitary theory, Saito–Kurokawa inputs, quaternion stabilizers, finite-field types and torus distinction. No competing exceptional null-orbit/Howe owner or duplicate fully qualified Lean declaration was found; the latter count is automatically zero for this empty namespace. R03 and R04 identify the supply exceptions.

| Supplier | Resolved contract |
|---|---|
| ReductiveGroups | Layers 3, 3A.1 and 9; the centralizer extension remains an explicit gap. |
| ReductiveGroupsPartII | RG2.5.1–RG2.5.2, dual root data, dual groups and L-groups. |
| RepresentationTheory/LieHighestWeight | Layer 8, exceptional Lie models and split/positive Albert and octonion constructions. |
| RepresentationTheory/SpinRepresentations | Layers 4 and 8, spin construction and triality; the spin attribution in R03 must point here. |
| RepresentationTheory/ClassicalGroups | Layer 6, interlacing. For (3,2,0), (2,2) occurs and restricts to SU₂ weight zero. |
| RepresentationTheory/LieGroups | Layers 2 and 7, closed subgroups and compact complexifications. |
| RepresentationTheory/CompactGroups | Layers 3–5, matrix coefficients, orthogonality and Peter–Weyl. |
| ClassFieldTheory | Layer 9, Weil groups and arithmetic degree. |
| LanglandsParameterStacks | LP0.4–LP0.5 and LP1.11–LP1.12. Its geometric-degree convention is different; the package explicitly changes the diagonal twist, giving factors 2 versus 1/2 at q=2. |
| SmoothRepresentationsOfLocalGroups | SR.0.2, SR.0.4, SR.2.1–SR.2.3, SR.2a.1, SR.3.1–SR.3.4 and SR.5.1; the regular-isotypic and tempered-support targets exist. The supplied GL₂ Whittaker theorem is not used as a general quasi-split theorem. |
| SmoothRepresentationsOfLocalGroupsPartII | Named SRU sections and seven declared extensions; their present absence is not a finding. |
| MetaplecticAutomorphicForms | §§0.15–0.17, 1.1, 2.4a–2.7, 3.4–3.8, 3.34 and 3.37–3.40. The restricted oscillator and orthogonal/ternary inputs are owned there; §§6.1, 6.2 and 8.5 retain exceptional comparisons. |
| EndoscopicTransferAndUnitaryTraceComparison | §§4.7a, 10.30–10.31, general-linear LLC/Jacquet–Langlands and their compatibility. |
| ModularityAndLanglandsExtensions | §3.5, including the nongeneric-supercuspidal GSp₄ Plancherel comparison. |
| AutomorphicLFunctionsAndLocalFactors | AL.4 determinant factors for a supplied r, and the adjacent-rank normalized period input; R03 corrects the extra attribution. |
| AutomorphicLFunctionsAndLocalFactorsPartII | D.6 and the two explicit spin-factor/integral gaps. |
| AutomorphicFormsOnReductiveGroups | §§2.1–2.7, 3.1–3.5, 4.1–4.2, 5.4 and ALS.F.6 contract. The extra real-unitarity assertion remains a gap. |
| AutomorphicSpectralTheory | §§1.1–1.2, 2.4–2.6 and 4.4; the Eisenstein continuation and square-integrability interfaces are present. |

All **11 declared gap slugs** agree between the README and design/plan.json and have named suppliers. Their hypotheses retain characteristic zero, complex coefficients, admissibility/temperedness where needed, and the specified Fourier/modulus conventions. The related assertions within each are construction/comparison consequences of the same missing interface. Their absence today was not treated as a defect. The additional general torus-distinction input in R04 is not among them.

At the supplied Mathlib pin 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti pin a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, the named octonion, Albert, polarized-spin, smooth-discrete and integral matrix-carrier declarations were found. Reading their bodies confirms the package's distinctions: a linear equivalence imposes no multiplication law; imaginary means trace kernel; smooth-discrete means discrete topology and open stabilizers, not admissibility; the E₆/E₇/D₄ group schemes are the stated Kostant closures, not already the exceptional identifications. The finite-rank and characteristic hypotheses in the native contract are retained.

The package diff at the reviewed head contains **8 changed files, all inside packages/ExceptionalThetaCorrespondencesForG2/**. The README and Lean file contain no pull-request number, forbidden option, admitted data definition or computational algorithm. The single Lean import is `Mathlib`; its namespace is correct. Each numbered target has a source locator. The nine nodes explicitly classified as definitions in the plan each have at least three Check bullets; R06 concerns additional constructions and a vacuous Check rather than a missing bullet on those nine nodes.

The authorized dependency check returned:

```text
depcheck: 56 roadmaps, 652 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The current cross-roadmap resolver also reported no missing roadmap/Lean names. Its name-only success does not establish the statement attribution in R03, the unlisted prerequisite in R04, or the internal proof cycle in R02. Content main was f6e3d43f299489547d85900f1b18a976f3a32145; the reviewed package head was 3f7674945bc61448525795bd925676cadcb30dab.

## Not verifiable

- GS05 §§3–5 and HPS pp. 447–471 are settled as waived. Their minimal-model and real infinitesimal-character claims were not certified from text and were not requested again. In particular the exceptional real central-character polynomial is not certified by the elementary ρ-shift Check.
- Var's residual-characteristic-two theorem is settled as uncertified. The all-residue wavefront input is an explicit supplier contract; this review does not turn it into a verified theorem.
- Some displayed formulas in the Li, HS and GrS extractions have damaged OCR/font encoding. Readable theorem hypotheses and prose, and formulas independently present in the other cited sources, were compared; unreadable glyph-level identities were not guessed.
- The exact inducing parameter of the A₁ principal-series top factor in §§3.5 and 3.8 is not specified by GS lines 1552–1553 or 1784. The broader simply-laced normalization in §2.4 may be intended to determine it. GS99 Propositions 6.8 and 8.1 (GS99 lines 600–608 and 638–646) concern a nonsplit form and do not settle the split parameter. No guessed value or finding based on it is retained.
- The source texts named in the brief and the supplemental GS99 are available; there is no outstanding source request. GS05, HPS and Var retain their settled statuses.
- Ownership searches covered main, board packages and the supplied open-head material. Open heads not supplied in the brief were not individually audited. There are no Lean declarations for a fully qualified name collision or an elaborated binder check; no build result is asserted.

## Source issues

Effects below concern the source statement or proof. Many are already corrected or explicitly avoided in the package; they are not additional package findings.

- **Error** in GS at §2.1, p. 6 (GS lines 228–230): the source says a nonzero-norm octonion generates a separable quadratic algebra; it should be restricted to non-scalar elements with nonzero characteristic discriminant; affects a stated result.
- **Misprint** in GS at Proposition 3.1(i), p. 9 (GS line 303): the source says only the positive half-integer is a reducibility point for trivial central character; it should be both signs, with the displayed sequence at the positive point; affects a stated result.
- **Misprint** in GS at Proposition 3.1(iii), p. 9, and Proposition 3.2(iii), p. 11 (GS lines 332, 334, 376): the source says the final Q-induced principal-series quotient has exponent one-half; it should be exponent one in these character-induced cases; affects a stated result.
- **Misprint** in GS at Proposition 3.1(iii), p. 9 (GS line 334): the source says the middle cubic-character module is induced from twisted Steinberg; it should be induced from the one-dimensional character; affects a stated result.
- **Misprint** in GS at §3.4(4), p. 14 (GS line 495): the source says the centralizing short-root SL₂ is long-root; it should be short-root, as its notation indicates; affects nothing.
- **Misprint** in GS at §4.2, p. 15 (GS line 550): the source says both three-dimensional summands are the standard SL₃ module; it should be one standard module and one dual; affects a stated result.
- **Misprint** in GS at diagram (4.1), p. 16 (GS line 573): the source says the triality group is Spin₄; it should be Spin₈, consistently with the preceding construction; affects nothing.
- **Misprint** in GS at Theorem 7.2, p. 23 (GS line 844): the source says the third clause is numbered ii; it should be iii; affects nothing.
- **Error** in GS at §8.1, p. 24 (GS lines 888–891): the source says its half-exponent quotient family exhausts nongeneric selfdual PGL₃ representations; it should be enlarged to include the trivial representation, whose normalized exponents are 1,0,−1; affects a stated result.
- **Error** in GS at Theorem 8.5(iii), p. 27 (GS line 1023): the source says a generic plus input always has generic small lift; it should be restricted to tempered inputs, treating nontempered quotients separately; affects a stated result.
- **Error** in GS at §9, p. 30 (GS lines 1127–1128): the source says the six difference/sum walls exhaust the root hyperplanes; it should be supplemented by the three walls sᵢ+(s₁+s₂+s₃)=0, giving nine; affects a stated result.
- **Error** in GS at §9, p. 30 (GS lines 1129–1132): the source says the displayed negative-quarter quadratic form is Weyl invariant and gives third simple root (0,2,2); it should be Σsᵢ²+(Σsᵢ)² with third simple root (−1,1,1); affects a stated result.
- **Misprint** in GS at §§10.1–10.2, pp. 31–32 (GS lines 1174, 1201): the source says the parameterized P₂ and P₁₃ series are induced to G₂; it should be PGSp₆; affects a stated result.
- **Misprint** in GS at §11.2, p. 34 (GS line 1272): the source says the Heisenberg character acts through the center of U/[U,U]; it should be formulated on U/Z(U), whose center is the indicated root group; affects a stated result.
- **Misprint** in GS at §11.2, p. 36 (GS lines 1335–1339): the source says V′ uses the positive β root and later writes V/V′₂; it should be the negative β root and V′/V′₂; affects the proof.
- **Misprint** in GS at Lemma 11.4, p. 36 (GS lines 1346–1358): the source says the root-exchange functional is an unweighted integral; it should be weighted by the inverse target character, as the proof's intertwiner is; affects a stated result.
- **Misprint** in GS at Proposition 13.3 proof, p. 41 (GS line 1560): the source says the G₂-Q Jacquet quotient is a quotient of rP₂(Π); it should be a quotient of rQ(Π); affects the proof.
- **Misprint** in GS at Proposition 13.7, p. 47 (GS line 1785): the source says the two ambient factors belong to M₃; it should be a reference to the ambient M₂ Levi; affects nothing.
- **Misprint** in GS at Lemma 13.8 proof, p. 47 (GS lines 1818–1822): the source says the Borel in the third filtration piece belongs to the first GL₂ factor; it should be the second factor and the corresponding τ₂ Jacquet module, consistently with Proposition 13.7; affects the proof.
- **Misprint** in GS at Lemma 13.8 proof, p. 48 (GS lines 1848–1850): the source says the resulting quotient pair contains JP(τ₁); it should be JP(τ₂), the quotient just constructed; affects the proof.
- **Gap** in GS at Lemma 13.8 proof, p. 48 (GS lines 1851–1853): the source says the other proper-Levi cases are disposed of without details; it should be completed with their Jacquet-support and Ext vanishings, as well as the P₂ cases; affects the proof.
- **Misprint** in GS at §14.2, p. 50 (GS lines 1916–1918): the source says the theta multiplicity space is Hom over L×M₂ into an L-module; it should be Hom over L, retaining the commuting M₂ action; affects the proof.
- **Misprint** in GS at §15.1, p. 52 (GS line 2016): the source says tempered compatibility is Theorem 15.1(v); it should be a citation of Theorem 15.1(iv); affects nothing.
- **Misprint** in GS at §15.1, p. 54 (GS line 2071): the source says σρ is lifted from JL(τ); it should be lifted from JL(ρ); affects nothing.
- **Misprint** in Sav at Corollary 5.2 proof, p. 399 (Sav line 266): the source says both Jacquet descriptions use U₁ and L₁; it should be U₂ and L₂ for the trivial-module description; affects the proof.
- **Gap** in LL at Lemma 10.1 proof, p. 27 (LL lines 1136–1138): the source says absence of rank-three coefficients immediately gives rank two; it should be preceded by exclusions of rank zero and the odd-rank metaplectic case before applying the O(2) result; affects the proof.
- **Error** in HKT at Lemma 4.6 proof, p. 21 (HKT lines 905–908): the source says every nonzero spinor has G₂ stabilizer; it should be restricted to nonisotropic spinors, justifying such a fixed vector by complete reducibility; affects the proof.
- **Misprint** in HKT at Theorem A.5, p. 25 (HKT lines 1063–1067): the source says the spherical-value geometric sum stops at q^(3(n−1)); it should be a sum through q^(3n), giving value one for primitive rank-one elements; affects a stated result.
- **Misprint** in GrS at Chapter 5 §4, p. 202 (GrS line 6861): the source says Q(z) is a quaternion subalgebra; it should be the quadratic subalgebra generated by z; affects nothing.
- **Misprint** in SW at Lemma 5.5, Stage 2, p. 40 (SW line 2122): the source says the chosen additive-character value is nonzero; it should be different from one; affects the proof.
- **Gap** in SW at Lemma 5.5, Stage 2, pp. 40–41 (SW lines 2141–2152): the source says the product αβ belongs to the span of α,β,γ by isotropic dimension; it should be qualified by independence, treating (u₁,u₂,0) separately since u₁u₂=v₃ lies outside that span; affects the proof.
- **Misprint** in SW at §5.2, p. 43 (SW line 2314): the source says the intertwiner's spherical output still has parameter s; it should be the spherical vector at parameter 1−s; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3f7674945bc61448525795bd925676cadcb30dab", "job": "RT-ExceptionalThetaCorrespondencesForG2~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
