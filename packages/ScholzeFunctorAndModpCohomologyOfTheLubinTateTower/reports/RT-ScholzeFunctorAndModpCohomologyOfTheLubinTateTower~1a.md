<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1702#issuecomment-6429338362 -->
Red team round 1 pass a (codex) of 90f788e

Verdict: needs_changes

1. **F01** (P1) Geometric height components need not split over K

   **Location:** packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:738: “two copies of the Drinfeld half-plane over K”. Read the geometric wording at lines 747 and 850 with this descent distinction.

   **Claim:** The level-zero arithmetic central quotient splits into two K-components for every finite K/ℚ_p.

   **Witness:** Take K=ℚ_p. Geometric Frobenius translates the height by −1 modulo 2, interchanging the two components. Thus H⁰ over K is k, whereas two K-copies would have H⁰=k² (CDN23 lines 176–184).

   **Exact repair text:** “At n=0 there are two geometric height components. Their Gal_K-action is translation by the residue degree f(K/ℚ_p) modulo 2. They split over K exactly when that degree is even; for K=ℚ_p Frobenius interchanges them. Retain this descent action in arithmetic cohomology.” Replace the arithmetic two-copy wording in the examples accordingly.

   **Repair test:** At K=ℚ_p the fixed vectors of the swap on k² are {(a,a)}, of dimension 1. Over the unramified quadratic extension both components are fixed and the dimension is 2.

2. **F02** (P2) Admissibility is sufficient, not necessary, for extending the Weil action

   **Location:** packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:380: “admissibility is necessary”.

   **Claim:** A continuous Gal_F-extension of the discrete Weil action requires admissibility of π.

   **Witness:** For r=1 and π=⊕ℕk with trivial Fˣ-action, S⁰=π and its Weil action extends trivially to Gal_F. Yet π^{O_Fˣ}=⊕ℕk is infinite-dimensional, so π is not admissible.

   **Exact repair text:** “Admissibility guarantees this extension. Without admissibility an extension need not exist: a continuous action of Gal_F on a discrete set has finite orbits, and the Laurent-polynomial example below has an infinite Frobenius orbit.”

   **Repair test:** The infinite trivial sum has singleton orbits and extends; k[t,t⁻¹] has the infinite orbit {tⁿ} and does not. Both are non-admissible, as the repaired statement allows.


3. **F03** (P3) The coefficient-prime comparison points to the wrong supplier sections

   **Location:** packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:164 and :610: “the coefficient-prime potentially semistable comparison”.

   **Claim:** AutomorphicGaloisRepresentations §§3.7, 3.10–3.11 are the specified source of the local comparison needed to make the selected supercuspidal point's local Galois representation irreducible.

   **Witness:** TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:1578 (§3.7) excludes the coefficient prime; §3.11 transports already established comparisons. The needed parallel-weight statement is TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:3842, R18.3.29(c); the full later theorem is AutomorphicGaloisRepresentations §4.7.

   **Exact repair text:** “AutomorphicGaloisRepresentations §§3.10–3.11 supply the Hilbert representation and normalization dictionary. HilbertModularVarietiesAndShimuraCurves R18.3.29(c) supplies the coefficient-prime potentially semistable parameter comparison in this parallel-weight application; its absolute residual irreducibility hypothesis is global, and follows from the prescribed SL₂(k) residual image.” Name R18.3.29(c) explicitly in §4.2's Needs line. Cite AutomorphicGaloisRepresentations §3.1 for the geometric quaternionic construction if that separate input is intended.

   **Repair test:** At the distinguished p-place, the selected supercuspidal parameter is irreducible of dimension two. R18.3.29(c) transfers this property through the potentially semistable comparison even when the local residual representation has an invariant line. The global residual representation has no invariant line because its image contains SL₂(k). The package already cites the supplying Hilbert roadmap's R18.3 layer, so this is a locator correction, not an unowned prerequisite.

4. **F04** (P1) The general-F cosocle/Hom equivalence is false

   **Location:** packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:668–670 and :677: “using finite residue endomorphism fields”; “every irreducible smooth π”.

   **Claim:** Under the standing arbitrary finite F/ℚ_p convention, finite-length cosocle is equivalent to finite image of the Hom family; in particular every finite-length W gives finite image. All irreducible pro-p Iwahori fixed spaces are also claimed finite-dimensional.

   **Witness:** LE19 lines 269–271 and 370–374 construct a smooth irreducible k[G′]-module π, for F=ℚ₂₇,k=𝔽₂₇, with End(π) containing 𝔽̄₃. Take W=π: cosocle length=1, but dim_k Hom(W,π)=∞. Its I₁-fixed space is infinite-dimensional too.

   **Exact repair text:** “The definition of a finite-image family and its pointwise closure and cohomology properties apply over every finite F/ℚ_p. In the representation-specific cosocle/Hom assertions and the pro-p Iwahori Check below, assume F=ℚ_p; alternatively impose admissibility on each irreducible input and on the constituents of W where used.” Keep the general-F statements of §§6.1–6.2 unchanged.

   **Repair test:** In Le's construction choose λ₀=1 and enumerate 𝔽̄₃ˣ∖{1} with the other λ_i; their 𝔽₂₇-span is 𝔽̄₃. The resulting representation restricted to k is irreducible (hence cyclic and of finite type), and pI₂=Π² acts trivially (LE19 lines 165–173, 231–251). Thus it really is a G′-module. Its simple cosocle has length 1 while End contains an infinite-dimensional k-space. The embedded direct-sum diagram supplies infinitely many independent I₁-fixed vectors. Over F=ℚ_p, admissibility excludes this model and the finite-field endomorphism theorem applies. The cited supplier itself explicitly requires admissibility at packages/ModpRepresentationsOfGL2OverLocalFields/design/README.md:344–346; MP.1 is restricted to ℚ_p.

5. **F05** (P3) A Galois-trivial twist need not preserve a fixed tower level's support

   **Location:** packages/ScholzeFunctorAndModpCohomologyOfTheLubinTateTower/README.md:722: “Twists by characters … permute the relevant supports”.

   **Claim:** Triviality on the norm group of K suffices for twisting to preserve the multiplicity support at the fixed level n, including n=0.

   **Witness:** Set p=5,n=0,K=ℚ₅(ζ₅),k=𝔽₅ and δ(x)=the unit residue of x. Then δ(N_K Kˣ)=1, but δ(det(2I₂))=4. Scalar units act trivially on the level-zero tower, so this twist cannot preserve its support.

   **Exact repair text:** “At fixed level n, twists by δ:ℚ_pˣ/p²ℤ→k̄ˣ preserve the relevant supports when δ is trivial on N_{K/ℚ_p}Kˣ **and** δ∘Nrd is trivial on Ǧ_n. The latter condition is automatic for n≥1; at n=0 it requires δ to be unramified. Without it the twist formula changes the Ǧ_n-character space.”

   **Repair test:** For the displayed K, δ has order 4 and is Gal_K-trivial. The trivial representation occurs in level-zero arithmetic H¹: the unramified H¹(Gal_K,k) class injects through the constant summand of geometric H⁰=k² (2 is invertible). Its δ∘det twist has central scalar 4 at 2I₂, whereas cohomology has scalar 1, so its multiplicity is zero. The extra condition excludes this δ at n=0 and permits it at n≥1, where Nrd(Ǧ_n) is pro-p. This is a false README Check, not a requested new Lean declaration.

## Verified sound

Read all 871 README lines and all 116 Suggested.lean lines, the repository README and CONTRIBUTING, the package source manifest and gap list, and the supplied elaborated-signature record. Coverage: **4 Lean declarations (1 definition, 3 theorems), 28 numbered target sections, 149 README Check bullets, 69 distinct explicitly keyed source-line anchors, and 28 cross-roadmap supplier subsections**. There are no bold mathematical target labels apart from the summary; the bibliography's 12 bold keys identify sources. All 69 keyed anchors were located in the legal extractions and read in context. The tables retain all declaration checks, 35 sampled adversarial computations, and source-certification scope; the exhaustive ledgers are omitted for the comment limit.

The existing repair report marks F01–F05 applied; none is marked not actionable. This review does not reopen a settled finding. The seven declared gaps have matching slugs in design/plan.json and the README, named suppliers, and explicit domains. Their absence upstream is not reported as a defect. The additional primary source LE19 was fetched legally through the sources service to make R04 explicit; its initial title-only lookup failed, its arXiv lookup succeeded, and that missing-source entry is resolved. BW00 remains uncertified as instructed.

The requested mechanical dependency check returned exactly:

```text
depcheck: 56 roadmaps, 665 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The pull-request diff contains seven files, all under this package. No package implementation file was edited, no Lean build/elaboration was run, and no git mutation or external write was performed. Only this report and scratch notes were written.

### Acceptance-test inventory and binder audit

All four declarations are in namespace `TauCetiRoadmap.ScholzeFunctorAndModpCohomologyOfTheLubinTateTower`. There are no standing section variables: all mathematical hypotheses are explicit in each declaration. I compared all four supplied elaborated types against the README; **zero lost binders and zero signature changes**. The two `Type u` carriers use one universe; larger concrete carriers can share their maximum universe. The native `trivialFp` lift changes the coefficient carrier without changing its cohomology. No new scratch elaboration was needed or permitted by the read-only instruction.

| Declaration; section; line | Variables and instance context | Computed positive and negative instances | Result / change |
|---|---|---|---|
| `AdmissibleCompactInvariants`; §0.3; Suggested.lean:52 | A commutative topological ring; H a topological group carrier; X : TopRep A H. This definition itself assumes neither smoothness nor boundedness. | H=1,A=k,X=k: sole invariant module=k, dimension 1, predicate true. X=⊕ℕk: dimension ∞, predicate false. X=0: dimension 0, true. For bounded m^jX=0 the README truncated invariants at exponent j are exactly X^K. | Correct auxiliary predicate for the kept bounded theorem; no hidden topological-group hypothesis is being used in the definition. |
| `compactLie_cohomology_finite`; §0.3; :64 | Prime p; finite dimension d; Hausdorff compact topological group H with analytic p-adic Lie charts; complete noetherian local A with finite characteristic-p residue field, discrete scalar topology; smooth discrete X; admissibility; explicit j>0 and m^jX=0; every i. | H=1,d=0,X=k: H⁰=k, Hⁱ=0 for i>0, cardinalities p^f and 1. H=C_p,d=0,trivial k: dim Hⁱ=1 in every degree. H=ℤ_p,trivial k: dimensions (1,1,0,…). X=0 gives 0 in all degrees. X=ℚ_p/ℤ_p has infinite H⁰ and fails hkill. | Nontrivial headline, agrees with bounded README statement. Finite p-torsion in H is permitted; no erroneous high-degree vanishing. |
| `continuousCohomology_coind_iso`; §2.1; :91 | Topological commutative ring R; Hausdorff locally compact totally disconnected topological group H; closed J; X : TopRep R J with jointly continuous action; continuous right inverse to right-coset quotient; all i. | H=C₂,J=1,R=𝔽₂,X=k: coinduced dimension 2, H⁰ dimension 1 and Hⁱ dimension 0 for i>0, equal to J side. H=S₃,J=1: coinduced dimension 6, invariants dimension 1. J=H gives X on both sides. H=ℤ discrete,J=1 gives functions ℤ→k; shift−1 is surjective by recursion, so H¹=0=H¹(1,k). | Noncompact statement is stronger than pinned profinite Shapiro. `rightRel` is left multiplication by J, hence precisely J\H, matching f(jh)=j f(h). Isomorphism is in TopModuleCat, not merely abstract modules. |
| `moore_sl2_h2_vanishes`; §2.2; :110 | Prime p and 2<p; native SL₂(ℚ_p) topology and trivial discrete ZMod p. | p=3: Hom(C₂,C₃)=0. p=5: Hom(C₄,C₅)=0. p=2, excluded: Hom(C₂,C₂) has two elements, giving the metaplectic obstruction. In a ramified field containing ζ₃, Hom(μ₆,𝔽₃) has dimension 1, so replacing ℚ_p by arbitrary F would fail. | Correct headline and prime/base-field restrictions; no padding. |

The README's end theorems are §§5.3–5.4 (arithmetic support/length), 6.1 (general-F geometric multiplicities), 6.2 (Galois-multiplicity finite presentation), 6.3 (length, higher-dimensional vanishing and supersingular support), and 6.4 (smooth vectors). Its other deep milestones are equivariant descent/components, compact cohomology, Scholze finiteness/action, strict-image and Frobenius rigidity, Fust comparison, noncompact Shapiro, Moore vanishing, Cartan–Leray and multiplicity comparison, Ludwig vanishing, globalisation/occurrence, and the generic Galois criterion. The three directly statable cohomology headlines are present. The module docstring names the other families and their missing geometric/derived carriers. No replacement by arbitrary predicates, sorry'd data, tautological headlines or boundary-case theorems was found. The auxiliary admissibility definition is needed by the first theorem. There are no `lemma` declarations, forbidden commands, additional Mathlib imports or `set_option` in Suggested.lean.

### Pinned and supplier audit

The native bodies inspected include Mathlib/RepresentationTheory/Continuous/Basic.lean:533 (the equivariance condition defining coindV), :550 (right translation); Mathlib/GroupTheory/Coset/Defs.lean:106 (rightRel); Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:113 and :131 (homogeneous cochains and their homology); TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:236 and :272 (discrete module and smoothness); TauCeti/RepresentationTheory/Homological/ContCohomology/TrivialFp.lean:73; TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro/AllDegrees.lean:235, :244 and :454; and TauCeti/RepresentationTheory/Homological/ContCohomology/Finiteness.lean:155. These do not provide noncompact Shapiro or admissible infinite-coefficient finiteness for free. In particular, TopRep only bundles continuous individual operators; the kept Shapiro theorem separately requires joint continuity. The existing finite-coefficient reduction retains its open normal subgroup and trivial-action hypotheses. The named Mathlib module paths exist at the pin, including Mathlib/Basic/Finite/Defs.lean.

Searches by object covered main active/completed roadmaps, board packages, and the supplied sibling checkouts, using both `roadmaps grep/show` and local `rg`. Searches included the associated torsor/sheaf, almost/Frobenius estimates, continuous cohomology/induction, components, Moore covering, Borel quotient, arithmetic/geometric tower multiplicities and compact duals. No duplicate fully qualified Lean name was found at the pins or in the sibling Lean files. The named earlier suppliers cover the generic constructions; the package's remaining ownership is the indicated coefficient extension, cochain refinement or tower application. A search hit mentioning Ludwig in the existing local–global comparison is a use of that comparison, not a second Borel-quotient construction. Frobenius rigidity for log PD deformations is a different object from §1.4's valuation-ring module systems.

### Sampled adversarial computations

Here k=𝔽_{p^f} unless specified; dimensions are over k. A zero module has dimension 0 and underlying cardinality 1. “Pass” refers to the displayed instance and its source/contract check, not a formal proof. The sample retains the counterexamples behind all five findings and boundary tests across the roadmap; the exhaustive per-target and Check ledgers are omitted.

| Statement / convention | Instances and values on the two sides | Result / change |
|---|---|---|
| Rank and level conventions, README:19 | r=1 gives dimension 0 and scalar height 1; r=2 gives dimension 1 and scalar height 2. n=0 gives GL₂(O), whereas 1+M₂(O) contains 0 and is not a group. | Pass; r=0 excluded, not silently assigned a tower. |
| Coefficient-ring convention, :25 | k, O/(ϖ²), k[ε]/ε² have residue cardinality p^f and maximal ideals 0,(ϖ),(ε). The zero ring has 1=0 and no proper maximal ideal. | Pass; equal-characteristic and nonreduced coefficients included, zero ring excluded. |
| Right torsor equivariance and left D action, :23 | r=1,δ(2)=2∈𝔽₅: f(2)=3v; (2f)(1)=f(1/2)=2v. Replacing the inverse convention gives respectively 2v and 3v. | Pass at the rank-one witness made explicit in :848. |
| Weil normalization | δ(ϖ)=2 gives Φ_geo scalar 2⁻¹=3; Φ_arith scalar 2. Their composite is 6=1 mod 5. | Pass; geometric reciprocity is inverse to the supplier's arithmetic convention. |
| Tate twist and trace | On ℙ¹, tr(c₁(O(1)))=1; tr(c₁(O(2)))=2; modulo 2 the latter is 0 while the former is 1. | Pass; no division by 2. |
| Coefficient duals | For u=2 on O=ℤ₅, dual scalar=1/2 and paired scalar=1. Hom_O(O,O)⊗L/O=L/O; (L/O)⊗(L/O)=0 since every torsion element can be divided arbitrarily in the other factor. | Pass; distinguishes lattice from torsion dual. |
| Unnormalised principal series and genericity | For χ₁χ₂⁻¹=1,ε,ε⁻¹ genericity is false; at p=2, ε=1, so three written exceptions collapse to one. No q^{1/2} is required. | Pass; q=1 is not a residue-field size. |
| Torsor diagonal and simultaneous translation | (x,h)↦(x,xh); translating both by g gives (xg,g⁻¹hg). In S₃, (12)⁻¹(23)(12)=(13), whereas h=(23). | Pass; translation-only wrong model rejected. |
| §0.1 compact Hochschild–Serre | G=1 has only column a=0. G=C_p acting trivially on a point has E₂^{a,0}=k for every a, all other rows 0. | Pass; compact p-torsion does not force positive-degree vanishing. |
| §0.2 connected component labels | Rank-one geometric level m has #(O_F/ϖ^m)ˣ labels per height. F=ℚ₂ gives counts 1 at m=1 and 2 at m=2; m=0 height-zero open ball has one component. Full m=0 tower has ℤ heights. | Pass geometrically; arithmetic splitting is R01. |
| §0.3 compact dual finite generation iff bounded admissibility | C⁰(ℤ_p,k) dual=k[[ℤ_p]], one generator; its invariants under p^nℤ_p have dimension p^n. Infinite trivial ⊕ℕk dual=∏ℕk with trivial action, whose augmentation quotient has infinite dimension. | Pass in both directions on separating models. |
| §1.1 sheaf construction and stalks | r=1 over ℙ⁰: evaluation identifies stalk with π; π=k and 0 give dimensions 1 and 0. A changed lift by 2 multiplies by 3. | Pass; lift-dependent identification is explicitly marked. |
| §1.2 long exactness versus exact S¹ | 0→k→Ind_B^G1→St→0, with S¹(k)=0 and S²(Ind 1)=0, yields a surjection S¹(St)→k(−1). An exact functor would incorrectly erase this connecting term. | Pass. |
| §1.3 strict valuative containment | Proper U=V satisfies the valuative condition. The closed unit disc embedded in itself fails because of its exterior rank-two specialization. A smaller closed disc of radius |p| lies strictly inside the unit disc. Empty U has image dimension 0. | Pass; ordinary open inclusion alone is insufficient. |
| §1.4 middle exactness and Frobenius | In 0→O/π→O/π²→O/π→0 the first map sends 1 to π and its image equals kernel. Frobenius scales (k,…,k) to (pk,…,pk). A constant O/π system instead gives (1)≠(p). | Pass; wrong constant system is rejected. |
| §1.5 almost comparison/general A | A=k[ε]/ε²,π=A trivial,r=2: S²=A(−1), k-dimension 2, ε acts nontrivially with square 0. Replacing A by its residue would wrongly give dimension 1. | Pass; nilpotents not discarded. |
| §1.6 extension of Weil action | Infinite trivial ⊕ℕk has singleton orbits and a Gal extension; k[t,t⁻¹] with Frobenius multiplication by t has infinite orbit of 1; quotient by t^m−1 has dimension m and finite orbits. | R02: admissibility guarantees, but is not necessary for, extension. |
| §2.1 noncompact Shapiro | H=ℤ,J=1: all functions are coinduction, shift−1 surjective so H¹=0; compactly supported functions would give a nonzero cokernel. H=S₃,J=1: invariants of k⁶ are constant functions, dimension 1. | Pass; excludes compact-support substitution. |
| §2.3 prodiscrete/product comparison | S={0,1}: Hʲ(U×S,π)=Hʲ(U,π)²=C⁰(S,Hʲ(U,π)); S=∅ gives 0=0. | Pass; finite-set approximations keep p-primary coefficients. |
| §2.5 exact degree-one comparison | For π=1, S¹=0; the outer SL₂ H¹ is 0, and SL₂ H² is 0 for odd p but dimension 1 for p=2. | Pass; finite errors are not declared universally zero. |
| §3.2 Steinberg and ordinary dévissage | 0→k→Ind 1→St→0 gives S²(St)=0 and a surjection S¹(St)→k(−1). For an extension of two S²-vanishing modules, the degree-two exact segment forces S²=0. | Pass for all p, including p=2. |
| §4.1 reducible local data | A global image containing SL₂(k) is globally absolutely irreducible, but a decomposition subgroup can act upper triangularly, with an invariant line of dimension 1. | Pass; local irreducibility is not imposed. |
| §4.2 auxiliary place | p=3,k=𝔽₂₇: #kˣ=26; primitive ξ has ξ² of order 13, outside 𝔽₃ˣ of order 2. Thus ratio is neither 1 nor N(w)^{±1}. | Pass; residue degree ≥3 used here, not silently ≥2. |
| §4.2 residual fibre and occurrence | M=S[m_A] has m_AM=0; a scalar in m_A has zero action on M but need not vanish on S. A one-object supersingular block gives only that simple constituent; a generic reducible block gives two. | Fibre/block claims agree with sources; coefficient-prime locator needs R03. |
| §4.3 ideal-torsion comparison | I=0 gives S[I]=S and the identity comparison. I=T gives S[I]=0 and Ĥ¹[I]=0. Multiplication by 0 has full kernel; multiplication by 1 has zero kernel. | Pass; zero and unit ideals handled. |
| §4.4 non-Galois character quotient | For a cyclic abelian quotient of order m=p^a m′, characters into k̄ˣ kill its p-part; exactly m′ possible roots. For m=p there is only the trivial character. | Pass; use restriction to Gal_K and norm quotient, not Gal(K/ℚ_p) for nonnormal K. |
| §5.1 finite-image definition | Zero family: (support size,max dimension)=(0,0). One k value: (1,1). One ⊕ℕk value: (1,∞), hence false. | Pass; finite support alone is insufficient. |
| §5.1 Hom/cosocle equivalence | Over ℚ_p a simple cosocle π contributes finite Hom dimension [End(π):k]. Le's general-F simple π has cosocle length 1 but Hom dimension ∞ (End contains 𝔽̄₃). | Requires R04's stated field/admissibility restriction. |
| §5.2 arithmetic Hochschild–Serre | For zero coefficients all terms 0. For n=0,K=ℚ_p geometric H⁰=k² has Frobenius swap; H⁰ invariants have dimension 1, not 2. | Exact-sequence shape passes; R01 corrects the arithmetic example. |
| §5.3 twist compatibility | A Gal_K-trivial twist acts by 1 there. At p=5,n=0,K=ℚ₅(ζ₅), δ(2)=2 nevertheless changes central G scalar 1→δ(4)=4; trivial multiplicity is nonzero, twisted multiplicity is zero. | R05: also require δ∘Nrd trivial on D_n. |
| §5.4 arithmetic finite length and coefficient dévissage | Exponent 1 gives k. Exponent 2 gives two successive k pieces ϖO/ϖ² and O/ϖ, each dimension 1. Finite extensions/subquotients preserve finite length. | Pass; finite-presentation supplier is needed before the cosocle criterion. |
| §6.1 dyadic boundary | p=2 supplies an outer Moore H² of dimension 1, still finite; finiteness of multiplicity does not need this group to be 0. | Pass. |
| §6.2 finite-group coinvariant formula | H=C_p on k² by [[1,1],[0,1]]: invariants=k e₁, coinvariants=k[e₂]. The natural invariants→coinvariants map sends e₁ to 0, although both dimensions are 1. | Pass; invariants cannot replace coinvariants. |
| §6.3 finite length and dimension >2 vanishing | ρ absolutely irreducible of dimension 3 cannot be a subquotient of 2-dimensional isotypic Galois pieces or character pieces; Hom=0 and dual=0. ρ=0 also gives 0. | Pass; reducible dimension-three sums of characters are not covered by the vanishing. |
| §6.4 smooth-vector finiteness | Geometric LT n=0 consists of two discs, not two half-planes. At odd p the required SL₂ H¹ and H² are both 0; at p=2 H² has dimension 1, outside this theorem. | Pass with arithmetic height descent distinguished as in R01. |

### Source-locator register

The following locators were checked in the supplied legal texts, with the explicitly identified preprint versions used for their page numbers. Repeated uses of an identical locator were counted once in the 69 keyed-anchor count. Further unprefixed line continuations and nearby proof steps were read in context; they are not counted as extra certified sources. The bibliography's journal pagination is not confused with the preprint pagination.

| Source | Located text and scope verification | Outcome |
|---|---|---|
| SCH18 | Propositions 2.8–2.13 (lines 318–414), Proposition 3.1 and Theorem 3.2 (440–489), strict-image/Temkin proof (511–577), Lemmas 3.12–3.13 and comparison (717–769), Definition 4.1/Theorems 4.3–4.4/Proposition 4.7 (792–905), Proposition 7.7 proof (1278–1297) | Equivariant refinements, local-coefficient hypotheses, compact finiteness and ideal-torsion proof have the required scope. R02 is the package's unnecessary necessity assertion, not the source theorem. |
| SCH13 | Proposition 2.11 and Lemmas 2.12–2.13, pp.10–13 (lines 462–574) | Elementary-divisor inequalities, middle exactness and Frobenius scaling agree. Source kernel/cokernel typo recorded below. |
| LUD17 | Theorem 3.11, Corollary 3.13, Theorem 3.14 (862–935); Proposition 3.15 and Borel intermediates (958–987); Lemma 3.22/Proposition 3.23 (1099–1182); Proposition 4.4/Lemma 4.5/Theorem 4.6/Corollary 4.7 (1230–1340) | Perfectoid quotient, compact fibre, sheaf pushforward and all-prime principal-series/Steinberg vanishing agree. The higher-rank valuation input is present. |
| FUST22 | Continuous induction and Shapiro notation (lines 100–135); Corollary 4.4, Proposition 5.1, Corollary 5.2 (358–454); Lemmas 6.2–6.6 (478–657) | Discrete smooth Ext comparison, exceptional block restrictions, compact/reductive cohomological finiteness checked. Does not alone certify all arbitrary topological coefficient details of BW00. |
| MOO68 | Chapter III, Theorem 10.3, printed p.51, and adjoining Theorem 10.4 (lines 2054–2085); the rank-two statement is used, not stable K₂ | Trivial separable locally compact abelian coefficients are the classification's scope; finite discrete 𝔽_p qualifies. Root-of-unity calculation gives the stated rational odd-prime corollary. |
| STR08 | Theorems 4.3–4.4, preprint pp.11–13 (lines 337–401) | Finite-level **geometric** component labels and determinant/inverse-action dictionary checked. Original finite-level space over F̆ versus geometric components must be distinguished; R01 uses this distinction. |
| DPS23 | Compact-dual definition/Lemmas 7.1–7.2 (1330–1375); Lemmas 7.3–7.4 (1387–1430); Proposition 8.1/Lemma 8.2 (1748–1807); Proposition 8.4 (1852–1873); Lemma 8.6/footnote 15 (1889–1926) | Central/twist transport, coefficient degree ≥2 for globalization versus ≥3 for the auxiliary place, and lattice-dual correction checked. |
| GK14 | Appendix A, Proposition A.1, Theorem A.2 and Corollary A.3, pp.36–37 (lines 1689–1746) | p>2, potentially Barsotti–Tate input, prescribed local representations and totally real globalization checked. Reducible local residual data are allowed. |
| PAS22 | Equation (26), p.17 (lines 744–752); Lemmas 6.1–6.2 and Theorem 6.5, pp.27–30 (1225–1340), with its type-selection continuation | Fixed-character/λ-typical comparison and nonzero characteristic-zero argument checked. Equation (26)'s dual error is already corrected by the package. |
| ECD17 | Propositions 14.8–14.9, pp.85–86 (lines 3532–3571); Lemma 23.6, p.144 (6017–6023), checked against Proposition 22.11 (5518–5522) | Arbitrary-abelian-sheaf continuity supports the package's p-primary product argument. The source's alternate projection-formula proof has the coefficient-scope gap recorded below. |
| CDN23 | Tower/actions/descent §0.2.1 (166–184); Theorem 2.1 (923–928); Corollary 2.12 and Theorem 2.13 (1280–1325); §§3–4 comparisons and global applications (1452–1788); finite-image/ascent and end theorems (1814–2065) | Theorem 4.22 is general F/all p; arithmetic length and higher residual-dimension/smooth-vector results keep F=ℚ_p,p>2. The package correctly repairs the scalar-square and dual mistakes listed below. R01 and R05 are additional errors in its Checks. |
| BW00 | Chapter IX, Proposition 2.3 | Uncertified by prior settlement; no text requested. The cochain comparison was additionally tested on compact, noncompact and nonabelian examples, but that is not a source certification. |
| LE19 (additional review source) | Daniel Le, *On some nonadmissible smooth irreducible representations for GL₂*, arXiv:1809.10247v3, Theorems 1.1–1.2 and 3.2–3.4, pp.1–2,5–8; LE19 lines 30–50, 165–173, 231–271, 370–374 | [Legal arXiv version](https://arxiv.org/abs/1809.10247v3), fetched through the sources service. The bar in 𝔽̄_p is lost in plain extraction in places; §1.2 explicitly fixes this algebraic closure. The construction kills pI₂ and supplies the exact finite-coefficient G′ counterexample in R04. This review-only source was not added to the read-only package manifest. |

### Domain exclusions and tests that do not create extra hypotheses

A finite extension of ℚ_p is separable and characteristic zero, so an inseparable local-field extension or equal-characteristic field is not an instance of the tower targets. Equal-characteristic fields were tested only in Moore's general local-field comparison. The residue fields have size p^f≥2; q=1 is excluded. Tower rank zero is excluded, whereas zero coefficient modules and rank-zero almost-free modules are included and tested. In §1.4, exponent zero is not part of the positive-exponent inverse system. In the compact Lean theorem, j=0 would force 1·x=0 and hence X=0, but the advertised positive-exponent statement explicitly excludes that junk case. No displayed denominator is evaluated at zero: character values are units, the lattice scalar 2 lies in ℚ₅ˣ, and algebraic trace normalization never divides by p.

The adic limit targets retain qcqs hypotheses and the strict-image target retains separated smooth charts. A non-quasi-separated space is therefore not a legal test object for those conclusions. Arbitrary topological carriers are allowed only where the declaration says so: the topological Shapiro statement has the closed-subgroup, locally profinite and joint-continuity hypotheses plus an actual continuous section. The zero ring is possible in that general coinduction theorem and gives only zero unital modules, hence zero cohomology on both sides; it is excluded by `IsLocalRing` in compact finiteness. No algorithm or computational route is proposed by the package.

## Not verifiable

- BW00 Chapter IX, Proposition 2.3 remains **uncertified**, as settled in the brief. No inference about its exact unquoted topological-category hypotheses is presented as a text verification.
- This is a read-only mathematical and signature review. I used the supplied elaborated signatures for all four declarations and did not run `#check`, Lean, a build or a proof. Truth checks and source comparison do not certify future elaboration or implementation.
- The seven declared supplier gaps remain conditional contracts: arithmetic finite presentation; good germs; analytic-topology dimension; strict arithmetic Stein Hochschild–Serre; height-zero modular uniformisation; potentially Barsotti–Tate lift existence; and Lubin–Tate arithmetic descent. Their precise matching declarations were checked; their future proofs were not treated as available.
- For global existence/occurrence Checks, the concrete arithmetic invariants and local constraints were computed and the existence statements matched to source theorems. No explicit global field, eigenform or Hecke algebra was constructed in this pass.
- Ownership checks used the provided sibling files, main/completed roadmaps, board packages and the current named supplier texts returned by the roadmap tooling. Other authors' open pull requests without supplied files were not independently checked beyond search results; no claim of exhaustive ownership certification of unseen files is made.
- The broad auxiliary-source citations in the supplier roadmaps were checked as supplier contracts, not recursively re-proved. Source certification above concerns this package's cited passages. No currently missing source request remains after resolving LE19.

## Source issues

- **Misprint** in SCH13 at Lemma 2.13 proof, printed p.12 (SCH13 line 556): the source says the chosen approximation has almost-annihilated kernel; it should be an almost-annihilated cokernel; affects the proof.
- **Misprint** in PAS22 at Lemma 5.1, equation (26), printed preprint p.17 (PAS22 lines 748–751): the source says the lattice factor is its Pontryagin dual; it should be Hom_O(λ,O) before tensoring with the torsion coefficient; affects the proof; corrected in print at DPS23, footnote 15, preprint p.40 (DPS23 line 1896).
- **Misprint** in CDN23 at Corollary 2.12 proof, printed p.30 (CDN23 line 1284): the source says the dual multiplicity equals the undualized finite-group Hom; it should be the dual of that Hom; affects the proof.
- **Misprint** in CDN23 at Theorem 4.3 and its proof, printed pp.37,42 (CDN23 lines 1575,1774): the source says characters factor through Gal(K/ℚ_p) for arbitrary finite K; it should say their restrictions to Gal_K are trivial; affects a stated result.
- **Misprint** in CDN23 at proof of Theorem 4.1, printed p.42 (CDN23 line 1779): the source says degree-zero cohomology with L coefficients is a finite group; it should use k_L coefficients for that finiteness assertion; affects the proof.
- **Misprint** in CDN23 at equation (4.15), printed p.44 (CDN23 lines 1852–1853): the source says scalar-p quotient component labels are ℚ_pˣ/p^ℤ; it should use ℚ_pˣ/p^{2ℤ}, since det(pI₂)=p²; affects the proof.
- **Error** in CDN23 at proof of Lemma 4.13, printed p.44 (CDN23 line 1855): the source says the compact level groups are torsion-free, including level zero; it should use compact p-adic Lie finiteness without torsion-freeness, since O_Dˣ contains roots of unity; affects the proof.
- **Misprint** in LUD17 at proof of Theorem 4.6, printed preprint p.31 (LUD17 line 1322): the source says the affinoid-fibre input is Lemma 3.23; it should refer to Proposition 3.23; affects nothing.
- **Gap** in ECD17 at proof of Lemma 23.6, printed p.144 (ECD17 lines 6017–6023): the source says Proposition 22.11 proves the formula for any ring; it should first justify the arbitrary-coefficient case by finite-set continuity, since Proposition 22.11 assumes prime-to-p torsion; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "90f788ef9bfe76ee45970c3c1ebcc9f6a16c2c4d", "job": "RT-ScholzeFunctorAndModpCohomologyOfTheLubinTateTower~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
