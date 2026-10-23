# Port: OverconvergentAutomorphicForms

- Branch: `roadmap/overconvergent-automorphic-forms`.
- Head commit: `5eb7d1bb767ea11556659a2164ccb0c57b65641f`.
- Starting checkout: clean, `a07e202`; target files are confined to `TauCetiRoadmap/OverconvergentAutomorphicForms/`.
- Build exit: 0. Exact outcome: `Build completed successfully (8976 jobs).`
- Module outcome: `✔ [8976/8976] Built TauCetiRoadmap.OverconvergentAutomorphicForms.Suggested (2.5s)`.
- Warnings: 0, including 0 sorry warnings. The accepted acceptance file has no declarations.
- Gate: `gate OverconvergentAutomorphicForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`.

## Draft pull request body

Build analytic automorphic coefficient sheaves from Hodge–Tate and differential-frame torsors, compare the geometric and arithmetic Hilbert presentations with AIP coefficients, and develop their integral lattices, Fourier expansions, compact cuspidal Hecke operators and completed ordinary comparison. The same coefficient theory covers Siegel and general toroidal/Bruhat families in every cohomological degree, together with definite unitary Jacquet eigenvarieties, while retaining ramified and dyadic inputs and the distinctions between geometric, formal and Gauss lattices.

AI assistance: Codex (GPT-6). The port includes an independent mathematical and supplier audit; the compiling signature module does not assert proofs of the roadmap targets.

## Dependencies that are new roadmaps in open work

AutomorphicBundles; CompletedCohomologyPartII; HodgeTateAndCanonicalSubgroups; LocallyAnalyticDistributions; PadicFamilies; PadicLocalLanglandsForGL2Qp; PerfectoidShimuraVarieties; PerfectoidTowers; PhiGammaModulesAndIwasawaCohomology.

The other direct roadmap contracts are AlgebraicVectorBundles, AdicSpacesPartII, AdicSpacesPartIII, AdicSpacesPartIV and PadicMeasuresIwasawaAlgebras on main. No revision to a main-branch roadmap is treated as a dependency.

## Port and review dispositions

The accepted package already uses the required title, Summary, ownership, conventions, supplier contracts, nine numbered layers, Examples, Dependencies and References. All 44 numbered subsections and all 74 Check groups remain. The port adds explicit basic-theory bullet lists for 35 definition groups and direct statement/route dependencies for every numbered subsection; it preserves the original hypotheses, targets, worked examples and source locators.

The accepted review decisions and both repair reports were checked against the actual package, supplier heads and pinned sources. The nonblocking locator, naming, acceptance-file and process-language notes are incorporated in the accepted text and retained here. The source metadata validates with 0 problems; all thirteen PDF hashes match their certified manifest entries. No source passage is copied into the roadmap.

The following corrections or clarifications resulted from the port's mathematical reread:

1. Completed Banach module tensors consume AdicSpacesPartII R0.5, not R0.3. R0.3 is the completed Huber-pair tensor product; the distinction matters for arbitrary affinoid coefficient modules. The exact contract and both occurrences in §0.4 now use R0.5.
2. Tau Ceti's highest-weight module file is a Lie-algebra development, not a construction of algebraic group representations. Scope and contracts now take the algebraic representation from AutomorphicBundles B2 and identify the Lie-algebra API separately.
3. The torus induction Check now distinguishes the inverse character in the function argument from the positive character of the left translation action: if κ(h)=2 and f(1)=1, then f(h)=1/2 but (h·f)(1)=2. The distribution has dual action 1/2. This makes the existing convention unambiguous without narrowing the induction theorem.
4. The classical accumulation route now states its quantifiers: for each fixed bounded slope chart, there is C≥0, chosen before the dominant algebraic weight, such that all embeddingwise successive gaps greater than C give the stated classical analytic eigenvectors. The normalized index-character coordinate remains part of this choice. This makes “sufficiently dominant” an actual uniform-on-chart target.
5. The classical refined-unitary criterion is related directly to the finite-level algebraic automorphic functions already constructed in §0.7; an unspecified “supplied classical automorphic realization” is no longer a phantom input.
6. Prime-to-p class representatives now cite the exact pinned `NumberField.NarrowClassGroup.exists_mk0_eq_and_isCoprime_absNorm`, with nonzero modulus p. Its nonzero-ideal and coprimality hypotheses are retained.
7. Six flagged future supplier names are cited by their actual sections and mathematical contracts: PadicLocalLanglandsForGL2Qp §0.1's coadmissibility, PerfectoidTowers P9.11's two sheaf equalizers and P9.13's invariant subsheaf, and PerfectoidShimuraVarieties §3.4's row action and quotient-frame law. These are real roadmap contracts, not missing pinned imports or new local declarations.
8. Corrected the malformed double-dual evaluation wording, the Jacquet M-action wording, the duplicate tame-Hecke words, the duplicate finite-Siegel adjective and the missing character-space dual mark. These edits change no mathematical assertion.
9. The ordinary finite Igusa covers and finite étale formal models used in §7.1 are now expressly supplied by HodgeTateAndCanonicalSubgroups §5.1. The tower comparison in PerfectoidShimuraVarieties §§5.4–5.10 does not itself supply those formal models. Scope and the exact contract make this ownership explicit.

The port retains the accepted stronger/conditional distinctions: all-prime coefficient sheaves versus the separate p>2g Siegel canonical-range theorem; the closed odd-prime period endpoint versus the supplier's strict range; arbitrary-affinoid defining norms versus spectral norms; geometric O⁺ comparison versus formal-model invertibility; and actual analytic/formal unit coboundaries versus freeness only after a splitting cover. In particular the annulus sign-line counterexample remains.

## Acceptance file and elaborated signatures

`TauCetiRoadmap/OverconvergentAutomorphicForms/Suggested.lean` is byte-for-byte the accepted file. Its sole import is `import Mathlib`, and its namespace is empty. Its module docstring identifies the unavailable headline theorem carriers: general analytic Jacquet/coherent duality, Hilbert and AIP coefficient geometry, family boundary/Fourier theory, cuspidal Banach Hecke modules, ordinary Igusa completions, definite-unitary eigenvarieties, Siegel coefficients and general toroidal/Bruhat cohomology.

No mathematics moved from the accepted Lean file during this port. The earlier package repair had already moved the tensor/norm/weight, cocycle, lower-row denominator, antidiagonal, determinant-line and Atkin–Lehner preliminary formulas and their examples to the README. They remain there with their APIs and Checks. None is an automorphic headline on native carriers, so none is reintroduced as Lean padding.

The mechanical declaration inventory has 0 definitions, 0 instances and 0 theorem declarations. Thus the requested `#check @name` comparison is vacuous: there is no name or elaborated binder list to inspect, and no binder changed. A scratch signature-audit record records this fact. Searches of both pinned libraries by object found no native coefficient, Jacquet, Igusa, or eigenvariety carrier making an omitted headline statable. The named module build elaborates the complete accepted signature file against the pins.

## Supplier and ownership evidence

The manifest pins were confirmed from both checkout HEADs: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Pinned declarations and their relevant limits were read directly:

- `Mathlib/RingTheory/Norm/Defs.lean` line 61 defines the norm as the determinant of multiplication; line 76 makes it 1 without module finiteness. The README's number-field finite-free assumption excludes that junk case.
- `Mathlib/Topology/Algebra/Module/ModuleTopology.lean` line 129 defines the finest module topology; it does not supply compactness by definition. Line 340 gives linear-map continuity, and line 696 the algebra ring-topology result. Compactness also uses `Mathlib/NumberTheory/Padics/ProperSpace.lean` line 57 and a finite basis.
- `Mathlib/NumberTheory/NumberField/Basic.lean` line 415 gives the integral rank; `Mathlib/LinearAlgebra/Dimension/Constructions.lean` line 376 gives rank base change; `Mathlib/LinearAlgebra/Charpoly/BaseChange.lean` line 40 gives determinant base change.
- `Mathlib/RingTheory/Norm/Transitivity.lean` line 261 gives the embedding product with finite-dimensional/separability and algebraically closed splitting-field hypotheses; it gives no integral product at a ramified prime.
- `Mathlib/RepresentationTheory/Basic.lean` line 48 is an algebraic monoid representation, without continuity or analytic orbit maps. `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean` line 31 is a sheaf of modules, without analytic Banach descent, coherence or finite local freeness. Those extra assertions retain their own inputs.
- `TauCeti/Topology/Algebra/Algebra/Norm.lean` line 29 supplies norm continuity for finite free algebras with module topology, including ramification; `TauCeti/RingTheory/Norm/Units.lean` line 40 packages the units norm, and `Mathlib/Topology/Algebra/Monoid.lean` line 918 transfers continuity to units.
- `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Finite.lean` line 38 supplies finiteness; `TauCeti/NumberTheory/NumberField/NarrowClassGroup/CoprimeRepresentative.lean` line 162 supplies the nonzero-modulus coprime-norm representative.

Every cited supplier section was resolved at main or the supplied open-head provider. In particular, the checked contracts include HodgeTateAndCanonicalSubgroups §§2.10, 3.6–3.8, 3.12, 4.6–4.8, 5.1, 5.8, 5.10–5.12, 7.29–7.30; PerfectoidShimuraVarieties §§1.30, 3.4, 5.4–5.10, 6.1a–6.3, 6.12–6.15; PerfectoidTowers P9.6–P9.13; AutomorphicBundles B0–B5 and its general-data extensions; LocallyAnalyticDistributions Layers 0 and 4, §§3.3, 4.15; PhiGammaModulesAndIwasawaCohomology §4.0; PadicLocalLanglandsForGL2Qp §0.1; CompletedCohomologyPartII F.1/F.4, Layers 1–3 and §8.5; PadicFamilies §§2a.1–2a.14 and 2a.17; the three adic roadmaps' named R0/R3/R5 contracts; AlgebraicVectorBundles L0A–L0C and L2B; and PadicMeasuresIwasawaAlgebras §3a.1.

The final citation resolver reports no unresolved cross-roadmap citation or Lean name. Its pinned-package discovery does not follow this checkout's package symlink, so its library-name result was supplemented by the direct pinned-file audit above rather than treated as proof of library availability.

The ownership sweep used the roadmap provider over its full 319-head index and main, direct object searches on main and Completed, the board packages, and all eighteen named sibling folders. The sibling matches concern smooth Jacquet theory, Galois/cohomological comparisons or unrelated uses of the words; no sibling supplies these analytic coefficient comparisons. The report does not claim that unnamed inaccessible heads were separately inspected beyond the provider's indexed sweep.

The accepted supplier replacements are retained in Scope and ownership: general distributions/coadmissibility/admissibility and Banach/Schikhof duality from PadicLocalLanglandsForGL2Qp §0.1; analytic vectors/completion from CompletedCohomologyPartII; compact character spaces from PhiGammaModulesAndIwasawaCohomology through LocallyAnalyticDistributions; unsplit ramified generators/lattices and frame transformations from HodgeTateAndCanonicalSubgroups; graph geometry/towers/reductions from PerfectoidShimuraVarieties; finite descent from PerfectoidTowers; algebraic bundles and classical Fourier theory from AutomorphicBundles; and spectral theory from PadicFamilies. No duplicated local Lean declaration remains and no additional mathematical target was deleted during this port.

ModularityAndLanglandsExtensions §4.3 also describes the general Jacquet construction. It is later in the merge order (position 182 versus this roadmap at 168) and is not consumed here. The accepted general Jacquet foundation stays here as the earlier owner; the later application should consume this foundation. Its trianguline and symmetric-power comparison is a different downstream target. IgusaVarietiesAndTorsionConcentration is likewise later and concerns different Igusa/cohomological constructions; no general Igusa tower is reconstructed by Layer 7, which starts with the supplied ordinary covers and constructs their coefficient completion comparison. No later roadmap was added as a supplier.

## Source checks

The source IDs and exact editions are those of `packages/OverconvergentAutomorphicForms/sources.toml`. The following anchors were read in the legal cached texts, not reconstructed from memory:

| Source | Anchors and checked mathematical use |
| --- | --- |
| bhw | bhw line 1639: closed period endpoint; bhw line 1919: algebraic-weight convention; bhw line 2135: AIP comparison and its proof's invariant-function input; bhw line 2917: Weil-pairing transformation; bhw line 3014: arithmetic comparison; bhw line 3075: tame trace normalization; bhw line 3111: wild coefficient map; bhw line 3174: Hecke comparison. |
| aip-adic | aip-adic line 671: actual analytic/formal torsor, not a nonexistent Proposition 4.2; aip-adic line 683: odd/dyadic interval inequalities; aip-adic line 698: small universal formal line; aip-adic line 1222: finite factor and coherent full coefficient; aip-adic line 1467: higher vanishing; aip-adic line 1470: torsion-line extension inside the proof; aip-adic line 1513: family Koecher theorem. |
| aip-cusp | aip-cusp line 649: positive-radius construction; aip-cusp line 715: Theorem 3.16; aip-cusp line 1288: monomial equivariant splitting; aip-cusp line 1292: negative boundary divisor sign; aip-cusp line 1328: all positive-degree boundary vanishing. |
| bp | bp line 6910: uniform coefficient stages; bp line 7059: the unrestricted closed-disc strong dual is not projective in general; bp line 7078: bounded-open-disc dual and topology; bp line 7122: arbitrary finite-type Tate-pair families; bp line 7131: distribution shift; bp line 7140: finite-flat/finite-group projectivity route; bp line 7147: derived comparison; bp line 7159: algebraic maps; bp line 7169: finite-character conductor range. |
| drw | drw line 1901: second canonical graph chart; drw line 1949: Atkin–Lehner and radius shift; drw line 2093: p>2g hypothesis; drw line 2101: level-n numerical canonical range. Its pointwise bounds are not silently promoted to a uniform bound. The version date and DOI were independently confirmed on the arXiv version page. |
| ding | ding line 2930: completed other-place coefficient functions; ding line 2947: full-character Jacquet spectrum and point criterion; ding line 2960: dimension, Cohen–Macaulay and reducedness statements, with local regularity in the proof. |
| heuer | heuer line 88 and heuer line 651 through heuer line 675 retain respectively the smooth rigid base and formal-unit/effective-reduction hypotheses used in §§1.3 and 7.3. |
| emerton-analytic | emerton-analytic line 6234 and emerton-analytic line 6445 through emerton-analytic line 6485: full character representative and essential-admissibility/coherent duality, with the analytic field, central agreement and Fréchet–Stein hypotheses retained. |
| emerton-jacquet | emerton-jacquet line 1562: finite-slope invariant construction; emerton-jacquet line 3095: smooth comparison; emerton-jacquet line 3117: finite algebraic W and admissible smooth B-representation X; emerton-jacquet line 3246: normalized index and root-action slope shift. |
| breuil-ding | breuil-ding line 3282 through breuil-ding line 3302: general-n integral regularity proof, with nonempty small-level and other-place coefficient hypotheses. |
| bhs-modulaire | bhs-modulaire line 1013, bhs-modulaire line 1091, bhs-modulaire line 1113, bhs-modulaire line 1310, bhs-modulaire line 1422 and bhs-modulaire line 2017: actual linked stages, projective charts, classical accumulation and reducedness, without patching variables. |
| bhs-smooth | bhs-smooth line 1025: finite-projective depth/Cohen–Macaulay argument. |
| chenevier | chenevier line 829 and chenevier line 866: semisimple fibres, density and no embedded components; no claim that unchanged point sets imply reducedness. |

## Dependency check

Exact output:

```text
depcheck: 19 roadmaps, 137 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The merge-order file and tooling were not edited.

## Unresolved items and limits

No unresolved port defect, missing reference, forbidden supplier or remaining build process. The geometric and representation-theoretic proofs remain roadmap work; the table below records falsification checks and conventions, not proofs of those targets. No source attempted to induce a credential access, network write or outside-scope mutation. No helper agent, push, pull-request write or issue/comment write was used.


## Adversarial mathematics pass

These are computations and countermodels for the definitions, conventions and assertions, including their stated API laws; they are not proofs of the geometric targets. Repeated statements in prose and interface bullets share their mathematical row. Functoriality is computed on the indicated actual local trivialization, without inferring global effectivity. A “retained” result means that these instances agree with the stated hypotheses and conclusion. The rational finite computations were independently recomputed, including enumeration of projective lines modulo 2, 3 and 5 and their squares.

| Statement | Instances tried | Values computed on the two sides, or object and negative control | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: finite number field | F=ℚ, quadratic F, excluded infinite extension | ranks 1,2; unbounded finite-subextension ranks have no finite determinant; nonfinite native norm(0)=1 | Finite hypothesis necessary | Retained number-field scope |
| Conventions: tensor scalars on left | 2⊗3 over ℤ₅ | 2⊗3=6⊗1, scalar value 6 | Consistent | None |
| Conventions: ramified integral algebra | ℚ₂(√2), reduction mod 2 | O⊗𝔽₂ has nonzero ε with ε²=0; 𝔽₂×𝔽₂ has no such ε | Integral splitting fails | Retained unsplit algebra |
| Conventions: geometric weight | w=t=x, x=2 at p=5 | 2²/2=2; noninverse convention gives 8 | Inverse norm fixed | None |
| Conventions: quotient stabilizers | C₂ acting by −1 on a line, char 0 | fixed line dimension 0, putative unrestricted descended line dimension 1 | Coarse effectivity needs fibre condition | Retained stack/free-locus choice |
| Conventions: smooth versus nonreduced families | E[ε]/ε² | ε≠0, spectral seminorm 0, defining norm 1 | Distinct norm regimes necessary | Retained both regimes |
| Conventions: ordinary radius | indices 0 and 1/100 | 0 ordinary, 1/100 positive; terminal index 0 collapses a positive-only system | Distinct objects | None |
| Conventions: complete continuity | identity on c₀, diag(pʲ) | identity tail norm 1; diagonal tail norm p^(−N)→0 | Strict decay essential | None |
| §0.1 integral tensor algebra | F=ℚ and quadratic F | ranks 1 and 2, including ramified p=2 | Consistent | None |
| §0.1 compactness | rank d=1,2 over ℤ₃, depth r | quotient cardinalities 3ʳ,3²ʳ; finite products of compact ℤ₃ | Consistent | None |
| §0.1 rank formula | scalar multiplication by 2, d=1,2,3 | matrix dimensions 1,2,3; determinants 2,4,8 | Degree retained | None |
| §0.1 module topology | x_j=pʲ, d=1,2 | coordinates pʲ→0; discrete distance to zero stays 1 | Discrete replacement fails | None |
| §0.1 multiplication continuity | x_j=3ʲ,y_j=3ʲ | product 3²ʲ→0 on both tensor and coordinate models | Consistent local polynomial model | None |
| §0.1 linear-map continuity | matrix diag(2,3), x_j=(3ʲ,0) | image (2·3ʲ,0)→(0,0) | Consistent | None |
| §0.1 determinant norm | d=1,2,3, x=0,1,−1,2 | respectively (0,1,−1,2), (0,1,1,4), (0,1,−1,8) | Sign and zero correct | None |
| §0.1 norm on units | scalar 2 at p=5, d=1,2 | values 2,4 units; scalar p has norm pᵈ and is excluded | Correct carrier | None |
| §0.1 global unit inclusion | η=−1 and ηη⁻¹ | tensor images −1 and 1; norm(−1)=(−1)ᵈ | Inclusion differs from norm | None |
| §0.1 norm base change | quadratic scalar 2 | integral determinant 4 maps to 4 in ℤ₂ | Consistent at ramified prime | None |
| §0.1 product over embeddings | split generic point (2,3) | det diag(2,3)=6=2·3, single factor 2≠6 | Generic splitting only | None |
| §0.1 norm continuity | scalar sequence pʲ, degree d | norm p^(dj)→0 | Supplied finite-free theorem applies | Native supplier retained |
| §0.1 principal units | p=3,u=4,r=0,1,2 | u−1=3: membership yes,yes,no | Correct kernel and order | None |
| §0.1 filtration antitonicity | p=3,u=10 | u−1=9 lies in 9ℤ₃ and 3ℤ₃ | H₂⊆H₁ | None |
| §0.1 openness and finite index | p=2,3,5, r=0,1,2 | indices (1,1,2),(1,2,6),(1,4,20) | Includes depth zero and dyadic case | None |
| §0.1 filtration separatedness | u=−1 at p=2 | u−1=−2, in H₁ and outside H₂; 1−1=0 at every depth | Correct intersection test | None |
| §0.2 geometric weights | trivial and identity, x=2,3 | values (1,1),(2,3); at 6 values 1,6 | Multiplicative characters | None |
| §0.2 arithmetic weights | w=t=x, (x,y)=(2,3) | w(2)t(3)=6, not 2 or 3 | Both coordinates retained | None |
| §0.2 coordinate constructor | w=1,t=x | at (2,3) value 3, at (2,1) value 1 | Correct coordinate | None |
| §0.2 first restriction | w=t=x, (2,1) | value 2=w(2) | Consistent | None |
| §0.2 second restriction | w=t=x, (1,3) | value 3=t(3) | Consistent | None |
| §0.2 uniqueness | (2,3)=(2,1)(1,3) | 6=2·3; trivial pair gives 1 | Both restrictions determine character | None |
| §0.2 character coefficient change | E→E[ε]/ε², character value 2 | image 2+0ε on both paths; identity keeps 2 | Consistent | None |
| §0.2 Hilbert weight space | F=ℚ and degree 2 | disc dimensions 1,2; dyadic sign at −1 is −1 versus 1 | Finite components retained | None |
| §0.2 arithmetic weight space | degrees 1,2 | dimensions 2,3, one more compact coordinate | Not a coordinate projection | None |
| §0.2 universal evaluation | points χ=x and χ=1, u=2 | specializations 2 and 1, not 1/2 and 1 | Correct universal sign | None |
| §0.2 inverse norm group map | x=2,3,6, F=ℚ | (4,1/2)(9,1/3)=(36,1/6) | Group law | None |
| §0.2 inverse norm identity and sign | x=1,−1, degree d | (1,1),(1,(−1)ᵈ) | Correct inverse at sign | None |
| §0.2 continuity of inverse norm map | x_j=1+5ʲ | x_j²→1 and x_j⁻¹→1 | Consistent | None |
| §0.2 weight pullback formula | w=t=x,x=2 | 4·1/2=2 on both formulas | Sign fixed | None |
| §0.2 pure norm character | w=1,t=x, degree 2, x=2 | norm 4; κ(2)=1/4 | Inverse retained | None |
| §0.2 algebraic exponents | (a,v)=(1,0),(0,1),(1,1) | exponents 2,−1,1 | Product adds exponents | None |
| §0.2 totally positive unit evaluation | quadratic η=3+2√2 | Nη=9−8=1; κ(η)=w(η)² | Consistent | None |
| §0.2 congruence-unit norm | N=4 versus N=2, η=−1 over ℚ | −1≢1 mod4, but −1≡1 mod 2 and norm −1 | N≥4 excludes failure | None |
| §0.2 central weight cancellation | Nη=1 | κ(η)⁻¹w(η)²=t(1)=1 | Full congruence group allowed | None |
| §0.3 principal character radius | p=3,κ=x,x³,1 | radii 1/3,1/9,0 | Strict bound and trivial case correct | None |
| §0.3 dyadic principal stage | κ=sign, H₃ | κ(−1)=−1 but κ(H₃)=1, radius 0 | Principal and full-unit suprema differ | None |
| §0.3 finite-twist invariance | Teichmüller twist on H₁ at p=3 | twist values 1 on H₁, both radii 1/3 for κ=x | Correct scope | None |
| §0.3 eventual analyticity | trivial weight and finite conductor b | constant 1 extends to every disc; finite character becomes 1 on sufficiently deep stage | No zero-radius formula | None |
| §0.3 bounded family | constant map from a disc | image one point, derivative 0, extension 1 at trivial weight | Bounded does not mean smooth map | None |
| §0.3 restriction and pullback | scalar coefficient 3, two identity chart maps | 3↦3↦3=3; extension restriction retains 1 | Identity and composition | None |
| §0.4 finite analytic coefficient | zero, trivial line, χ₁⊕χ₂ | ranks 0,1,2; characters retained separately | Correct representation carrier | Lie/group ownership clarified |
| §0.4 analytic action restriction | χ=x on an admitted smaller chart | action at u=1+5² is 26 before/after restriction | Same actual representation | None |
| §0.4 coefficient tensor | ranks 2,3 and two action-2 lines | rank 6; tensor eigenvalue 4, not 2 | Diagonal action | None |
| §0.4 coefficient dual | line action 2 | dual action 1/2; pairing (2v)(φ/2)=φ(v) | Contragredient fixed | None |
| §0.4 double dual | line action 2 | dual twice has action (1/2)⁻¹=2 | Evaluation isomorphism equivariant | Typo repaired |
| §0.4 coefficient extension | idempotent diag(1,0) over E→A | image projector diag(1,0), rank 1 on either path | Summand preserved | None |
| §0.4 extension composition | E→A→B, scalar 2 | image 2 in B by either composite | Identity/composition | None |
| §0.4 analytic induction | torus κ(h)=2, f(1)=1 | f(h)=1/2; (h·f)(1)=f(h⁻¹)=2 | Argument and action characters differ | Explicit positive-action witness |
| §0.4 Iwahori chart | SL₂, algebraic weight k=1 | functions 1,z,z² analytic; algebraic span {1,z}, z² outside | Analytic induction not finite bundle | None |
| §0.4 left action composition | noncommuting A,B from §1.1 | argument B⁻¹A⁻¹=(AB)⁻¹ versus A⁻¹B⁻¹≠(AB)⁻¹ | Correct order | None |
| §0.4 analytic radius restriction | normalized monomial z², contraction 1/3 | norm ratio 1/9; identity ratio 1 | Restriction differs from extension | None |
| §0.4 positive torus action | z↦3z on one coordinate | zʲ↦3ʲzʲ; tail norm 3^(−N)→0 | Compact on admitted field stage | None |
| §0.4 locally analytic colimit | constant and z germ | 1 stays 1, z has value 9 at admitted point 9 | Colimit does not kill every germ | None |
| §0.4 compact type over field | radius ratio 1/3 | monomial norms 1,1/3,1/9→0 | Field compact type consistent | None |
| §0.4 affinoid relative compactness | torus A=E⟨T⟩ | distance(Tⁱ,Tʲ)=1 for i≠j; transition id_A | Not compact type over E | Retained relative assertion |
| §0.4 bounded open-disc distribution | evaluations at 0,9 for p=3,n=1 | constant moments 1,1; linear moments 0,9 | Both points admitted, 1 excluded | None |
| §0.4 distribution projective model | torus over A | continuous A-dual of A is A, rank 1 | Correct bounded-open model | None |
| §0.4 distribution inverse limit | fixed evaluation at 0 | moments (1,0,0,…) at every stage | Compatible family; moving to 9 changes linear moment | None |
| §0.4 distribution pairing | torus action κ=2 | function action 2, left dual action 1/2, paired scalar 1 | Opposite action retained | None |
| §0.4 nonreduced extension | A=E[ε]/ε² | dimension 2, ε norm 1; reduction dimension 1 | Nilpotents retained | None |
| §0.4 norm independence | norm max(∣a∣,∣b∣) and max(∣a∣,2∣b∣) | norm ε=1 versus 2, equivalent topology | Not an isometry claim | None |
| §0.4 presentation independence | E⟨T⟩/(T²)→A, T↦ε | 1,T map to independent 1,ε; both squares zero | Same topological module | None |
| §0.4 nonreduced coefficient maps | function εz at z=9 | value 9ε≠0; reduction maps it to 0 | Identity and reduction differ | None |
| §0.4 algebraic restriction | SL₂,k=1 | 1,z independent after restriction; z² remains outside | Injection, not surjection | None |
| §0.4 finite-character comparison | χ(m)=ζ, ζ³=1≠ζ | multiplication sends value 1 to ζ²; finite positive-torus factor 1 | Extension/action hypotheses essential | None |
| §0.4 induction multiplication | z⊗z² and 1⊗z−z⊗1 | values z³ and 0; evaluating factors at 0,9 gives kernel tensor value 9 | Not injective in positive dimension | None |
| §0.4 multiplication laws | monomials z,z²,z³ | (z·z²)z³=z(z²·z³)=z⁶; 1·z=z | Associativity/unit in correct weight | None |
| §0.5 normalized Siegel coefficient | genus 1,2 | unipotent dimensions 0,1; line versus infinite power series | Higher-rank coefficient retained | None |
| §0.5 Gauss integral lattice | p=3,(T³−T)/3 | coefficients ±1/3, Gauss norm 3; integral on ℤ₃ | Rational-point criterion fails | None |
| §0.5 stage r+1 | r=3, pole with valuation 5/2 | p^(−3)<p^(−5/2)<p^(−2) | Analytic on small, pole on larger disc | None |
| §0.5 transpose action | diagonal h, κ(h)=2 | ρ_D(h)f=2f, inverse pullback would give f/2 | Sign fixed | None |
| §0.5 transpose product law | A,B noncommuting | (AB)ᵀ=BᵀAᵀ; successive pullbacks evaluate at BᵀAᵀℓ | Correct representation order | None |
| §0.5 isometry/integrality | admitted action and its inverse on unit constant | norm 1→1→1; outside two-sided bound a factor 1/p has norm p | Hypothesis retained | None |
| §0.5 radius compatibility | monomial z², ratio 1/3 | coefficients map to z²/9 on both action-compatible charts | Consistent | None |
| §0.5 product/norm/associativity | z,z²,0,1 | product z³,0,z; norm product bound 1; triple z⁶ | Consistent | None |
| §0.5 BP–Siegel dictionary | torus κ_D=x | κ_BP=x⁻¹, τ(h)=h⁻¹, resulting action 2 at h=2 | Both inversions necessary | None |
| §0.6 supplied convolution | H=1, ℤ₅, nonabelian matrices A,B | δ₁ unit; δ₂δ₃=δ₅ has linear moment 5≠6; AB≠BA | Shared supplier, not a second object | Retained ownership |
| §0.6 supplied flat stages | E constant; E⟨T⟩→E at T=0 | id tensor keeps E; multiplication by T becomes zero under nonflat quotient | Flatness cannot be dropped | None |
| §0.6 supplied coadmissibility | H=1 | dimensions 0,1,2 allowed; infinite direct sum not finite | Correct finite stages | Section citation |
| §0.6 supplied analytic vectors | character line and f(x)=x in C(ℤ₅,E) | dimension 1; translated function x+a analytic in a | Compatible topology | None |
| §0.6 analytic-vector functoriality | identity and open subgroup, vector 3 | 3χ(h) unchanged on restricted h | Same vector/action | None |
| §0.6 supplied Banach regular embedding | C(H,E)^a, H=1 | dual measure rank a; trivial-group admissibility finite dimension | Closedness retained | None |
| §0.6 supplied analytic duality | projection E²→E | dual injection E→E², dimensions 2→1 versus 1→2 | Contravariant | None |
| §0.6 full character space | Z=1,ℤ,Kˣ | point; G_m with generator values 2 or 3; uniformizer values independent of compact units | Noncompact coordinate necessary | None |
| §0.6 product/naturality | Z=ℤ₅ˣ×ℤ | one compact-disc plus one G_m coordinate; point (χ,2) evaluates uniformizer to 2 | Correct decomposition | None |
| §0.6 analytic-field dimension | T(K)=(Kˣ)²,[K:ℚₚ]=2 | locally ℚₚ-analytic dimension 6, compact part dimension 4; locally K-analytic total dimension 4 | Analytic field cannot be omitted | None |
| §0.6 Mellin map | δ_0,δ_a on additive compact group | transforms 1 and χ(a), evaluation at trivial χ gives 1 in both | Correct transform, distinct nontrivial characters | None |
| §0.6 L-linearity quotient | embedding σ≠chosen inclusion | derivative σ is ℚₚ-linear but not L-linear | Quotient excludes unwanted direction | None |
| §0.6 essential admissibility | G=ℤ, punctual versus doubled support | E[T,T⁻¹]/(T−2) length 1; /(T−2)² length 2 | Support alone insufficient | None |
| §0.6 independence of compact open | line χ on H and H′ | restricted action χ(h) on both; dimensions 1 | Consistent | None |
| §0.6 admissible inclusion | finite analytic character | strong-dual rank 1; agreeing central action χ | Essential category contains it | None |
| §0.6 abelian category and coherent dual | E²→E, skyscraper at 2 | kernel dimension 1; dual arrows reverse; length-one module has eigenvalue 2 under stated relabeling | Correct direction and length | None |
| §0.6 finite-slope part | actions 0,2 and diag(0,2) | retained dimensions 0,1,1, latter span e₂ | Removes zero eigenvalue | None |
| §0.6 evaluation/eigenspace | nonzero action 2 on a line | evaluation at 1 has one-dimensional image and kernel 0 | Correct universal-model test | None |
| §0.6 finite-slope universal property | generator 2 versus 0 | action 2 extends to ℤ by 1/2, action 0 has no inverse | Universal extension distinguishes objects | None |
| §0.6 finite-slope left exactness | second-line inclusion in diag(0,2) | retained map E→Ee₂ is injective, kernel 0 | Consistent | None |
| §0.6 normalized Jacquet operator | GL₂(ℚ₂),diag(2,1),constants | two terms, normalized sum 2/2=1; unnormalized 2 | Index normalization essential | None |
| §0.6 representative independence | n replaced by nh, h in mN₀m⁻¹ | hmv=mv for v∈V^N₀; same summand mv | Needs invariant vector | None |
| §0.6 positive semigroup law | indices 2 then 2 | constants (2/2)(2/2)=4/4=1 | Normalized order consistent | None |
| §0.6 Jacquet construction | P=G; torus | N₀=1, finite-slope dimension dim V; uniformizer action 2 retained | General parabolic scope | None |
| §0.6 M-action and N₀ independence | trivial line, two compact subgroups | both models have action 1 and dimension 1 | Consistent | None |
| §0.6 Jacquet left exactness | zero and line injection | 0 maps to 0, retained inclusion kernel 0 | Consistent | None |
| §0.6 Jacquet essential admissibility | torus character 2 | coherent support one point, length 1 | Same full character | None |
| §0.6 smooth comparison | trivial smooth line | V_N=E, normalized Jacquet E, action 1 | Consistent | None |
| §0.6 locally algebraic comparison | standard GL₂ algebraic W, X=E | W^N=Ee₁ has character a; W_N=Ee₂ has character d at diag(a,d) | Invariants differ from coinvariants | None |
| §0.7 completed unitary coefficient | local multiplicity s=2 | lattice two copies O_E, reduction two torsion coordinates, rational fibre E² | Other-place coefficient rank retained | None |
| §0.7 order of completion | identity function on ℤ₃ | mod 3ᵐ factors at level m; no integral finite-level representative | Limits cannot interchange | None |
| §0.7 local/tame actions | translation by a, scalar Hecke 2 | (2f)(x+a)=2f(x+a) on both orders | Commuting actions | None |
| §0.7 integral lattice | line O_E⊂E | p integral, p⁻¹ not integral | Lattice fixed by construction | None |
| §0.7 local regularity | H=1, multiplicities 1,2; empty countermodel | C(1,E)^s=Eˢ, dimensions 1,2; zero dimension 0 excluded by s≥1 | Nonempty arithmetic hypothesis | None |
| §0.7 unitary Jacquet sheaf | δ equal on units, uniformizer values 2,3 | two distinct support points with those values | Full character retained | None |
| §0.7 Hecke and character fibres | eigenvalue pairs (δ,2),(δ,3) | distinct Hecke characters; zero Jacquet fibre dimension 0 gives no point | Correct point criterion | None |
| §0.7 classical refined points | nonzero algebraic vector, zero vector | Hom dimension 1 versus 0 for chosen eigenline | Zero vector gives no point | None |
| §0.7 global twist | local unramified parameter 2→3 | same compact algebraic character, different uniformizer eigenvalue | Arithmetic point requires global map | Removed unspecified supplied realization |
| §0.7 Fredholm normalization | GL₂(ℚ₂),c_z=2 | normalized eigenvalue a maps to 2a; constant 1→2 | Rational invertible, not integral unit | None |
| §0.7 linked-stage equations | one-dimensional α=2,β=3 | βα=αβ=6, adjacent operators 6 | Correct linking model | None |
| §0.7 finite projective charts | M=A² over regular A | rank 2, faithful scalar algebra A; A/(f) instead has rank 0 generically | Coherence alone insufficient | None |
| §0.7 dimension/equidimensionality | n=2,[K:ℚₚ]=1,2 | dimensions 2 and 4, not 4 and 6 from full character dimension | Correct compact-weight count | None |
| §0.7 Cohen–Macaulay sheaf | regular A dimension d, M=A² | depth M=d=dimension support; zero module has empty support | Correct projective local model | None |
| §0.7 noncritical accumulation | gap threshold C on fixed slope chart | gaps C+1 exceed C; gap C fails strict inequality; bound chosen before weight | Quantifier order matters | Made ∀chart ∃C ∀weight explicit |
| §0.7 semisimplicity | A[ε]/ε² acting regularly | ε²=0 but ε·1=ε≠0; nonsemisimple fibres | Nilpotent control necessary | None |
| §0.7 reducedness | dense semisimple scalar fibres versus dual numbers | scalar nilpotent 0; dual-number nilpotent ε≠0 | Faithful projective/density inputs retained | None |
| §1.1 left-to-right inversion | Kγ=γ,scalar γ=2 | J₂=(K_(1/2))⁻¹=2; no factor inversion gives 1/2 | Correct conversion | None |
| §1.1 right cocycle | A=[1,1;0,1],B=[1,0;1,1] | AB=[2,1;1,1],BA=[1,1;1,2] | Nonabelian order fixed | None |
| §1.1 inverse law | same A,B | (AB)⁻¹=[1,−1;−1,2], A⁻¹B⁻¹=[2,−1;−1,1] | Opposite product necessary | None |
| §1.1 identity | trivial group | J₁=1, f unchanged | Degenerate case | None |
| §1.1 change of frame | scalar b=2, line f=6 | f′=3, inverse gauge returns 6 | Inverse gauge fixed | None |
| §1.1 gauge composition | b=2 then 3, f=6 | 6/2/3=1=6/(2·3) | Composition | None |
| §1.2 coefficient equalizer | identity torsor, ranks 0,1,2 | equalizers 0,O,O² | Correct local carrier | None |
| §1.2 section criterion | torus torsor χ(2)=2 | section values f(1)=1,f(2)=1/2, not constant 1 | Actual equivariance | None |
| §1.2 restriction/intertwiner/pullback | scalar section 3, multiplier 2 | restriction keeps 3; intertwiner gives 6 by both paths | Functorial local model | None |
| §1.2 gauge/site comparison | split torsor, unit frame 1 | analytic and v descriptions evaluate 1↦1; Gauss norm 1 in both | Conditional site input retained | None |
| §1.2 rank preservation | trivial rank 2 representation | descended local rank 2; determinant rank 1 is different | Correct finite effectivity | None |
| §1.2 tensor descent | two character lines values 2,3 | product action 6, descended tensor multiplier 1/6 | Consistent | None |
| §1.2 dual descent | character action 2 | dual action 1/2; evaluation multiplier 1 | Consistent | None |
| §1.2 coarse/integral descent | order2 stabilizer char0 and char2 | sign invariants 0 in char0; 1/2 undefined in char2 | No integral averaging | None |
| §1.3 dense-open line effectivity | trivial line on a disc and dense open | rank 1 on both; restriction transition 1 | Smooth-base local test | None |
| §1.3 formal unit-cocycle effectivity | cocycle 1 mod pᵐ all m | formal line O, generic line O, transition 1 | Compatible reductions essential | None |
| §2.1 admitted domain bounds | p=3,m=1 and p=2,m=1 | 1/12<1/9; endpoint 1/9 separate; dyadic endpoint 1/8 included | No accidental strict/closed change | None |
| §2.1 domain restriction/level forgetting | ε=1/100→1/200 | both <1/10 at p=5,m=1; restrictions compose | Common domain retained | None |
| §2.1 AL transport | p=5,n=1,ε=1/100 | source radius 1/20, target 1/100 | Scaling necessary | None |
| §2.1 level zero | p=5,ε=1/100 | AL₁ still uses 1/20, not unscaled 1/100 | Separate definition | None |
| §2.1 closed odd endpoint | p=3,m=1 | ε=1/9 is equality, not <1/9 | Additional theorem retained | None |
| §2.2 Hilbert denominator | identity,upper,diag(a,d),lower(c) | values 1,1,d,1+cz; c=25,z=5 gives126 | Coordinate dependence | None |
| §2.2 denominator invertibility | Weyl matrix,z=0 outside subgroup | denominator 0, not a unit; dyadic lower c=2,z=1 gives3 unit | Domain required | None |
| §2.2 denominator analyticity | lower unipotent | j(z)=1+25z, linear coefficient25 | Polynomial local model | None |
| §2.2 cocycle law | lower c=2 then c=3,z=1 | j_product=6; j_first(transformed)·j_second=(3/2)·4=6 | Actual transformed argument | None |
| §2.2 inverse character factor | κ=x,d=2,3 | 1/2·1/3=1/6; κ=x⁻¹ gives2 | Correct inverse | None |
| §2.2 geometric Hilbert line | κ=1,x,x⁻¹ | O, differential line, dual line; multipliers1,1/2,2 at d=2 | Distinct weights | None |
| §2.2 finite/infinite effectivity | rank1 finite line,pullback | local ranks1,1; unit frame stays1 | No smoothness inferred upstairs | None |
| §2.2 level/radius composition | section value3, two restrictions | 3→3→3 equals3 | Compatible local section | None |
| §2.3 algebraic specialization | k=1,−1,d=2 | coefficient/frame products (1/2)·2=1 and2·(1/2)=1 | Hodge and dual conventions | None |
| §2.3 nonparallel weights | split degree2,weights(1,2),x=(2,3) | value18, determinant powers give6ᵏ | Full tuple necessary | None |
| §3.1 integral coefficient | κ=1 over ℚ₅ | lattice ℤ₅, 1 in,1/5 out | Geometric bound | None |
| §3.1 inclusion/restriction | elements0,5 | inject into ℚ₅ as0,5; restriction does not change either | Torsion-free hypothesis | None |
| §3.1 two-sided action stability | factor5 | norm5=1/5, inverse norm5>1 | Rational unit not integral automorphism | None |
| §3.1 sheaf rationalization | lattices ℤ₅ and5ℤ₅ | both invert5 toℚ₅; inclusions remain different | No lattice recovery from rational line | None |
| §3.1 global denominator countermodel | disjoint components with section5^(−i) | required denominators i unbounded; locally each finite | Sheaf conclusion only | None |
| §3.1 conditional integral freeness | unit frame1 versus frame5 | inverse norms1 versus5 | Unit-coboundary needed | None |
| §3.2 rational weight pullback | κ=x at a point,d=2 | multiplier1/2 before/after specialization | Same character | None |
| §3.2 pullback identity/composition | identity,then extension of scalar3 | value3 by either path | Consistent | None |
| §3.2 integral weight pullback | flat identity versus mod 5 | frame1 remains1; multiplication by5 becomes0 mod 5 | Nonflat change excluded | None |
| §3.2 fixed-radius forms | trivial weight on affinoid | H⁰(O_X), not forced dimension1; constants0,1 allowed | Actual section object | None |
| §3.2 integral fixed-radius forms | bounded local function1 versus1/5 | norms1 and5; latter outside lattice | Integral inclusion consistent | None |
| §3.2 arithmetic variant | w=t=x,d=2 | κ(d)⁻¹w(d)=1; geometric multiplier1/2 | Independent arithmetic relation | None |
| §3.3 overconvergent colimit | constant A and zero system | colimits A and0 | Correct filtered construction | None |
| §3.3 representative/eventual equality | representative3,its restrictions | all map to class[3]; representatives agreeing only after restriction coincide | Correct relation | None |
| §3.3 universal property | constant maps a↦2a | colimit class[3] maps6 by every representative | Well-defined local model | None |
| §3.3 cofinal independence | constant system,subsequence of positive radii | both colimits A, class[1] unchanged | Correct | None |
| §3.3 ordinary-only exclusion | system all zero at positive radii,ordinary A≠0 | positive colimit0; adjoining terminal ordinary index givesA | Cannot insert ε=0 | None |
| §3.3 integral colimit | constant ℤ₅ lattice | colimit ℤ₅, rationalization ℚ₅ | Integral first | None |
| §3.4 modified coefficient | ordinary Hdg=1,degree2 | ideal bound1, lattice ranks1 over Oₚ⊗O⁺ and2 over O⁺ | Correct unsplit ranks | None |
| §3.4 Hodge inclusion | local full lattice pO⊂O | cokernel O/p, rational fibres equal | Ideal bound carries information | None |
| §3.4 ordinary comparison | Hdg unit | modified lattice equals original, quotient0 | Consistent | None |
| §4.1 small geometric coefficient | κ=x,d=2 | multiplier1/2; κ=1 gives own-base O | Correct small cover | None |
| §4.1 full geometric coefficient | scalar zI,z=2 | multiplierκ(2)⁻¹=1/2, notκ(4)⁻¹=1/4 | Distinct cover/action | None |
| §4.1 intermediate arithmetic coefficient | w=t=x,(1,x̄=2) | multiplier2; (γ=diag(1,2),1) gives1/2 | Both coordinates needed | None |
| §4.1 full arithmetic coefficient | diag(1,2),w=t=x | multiplier(1/2)·2=1 | Not geometric action | None |
| §4.1 section/radius/level/weight maps | zero and identity map on each cover | all four zeros map0; multiplier at identity1 | Four independent equalizers retained | None |
| §4.1 central cancellation | scalar z=2, formal N(z) coordinate | κ(z)⁻¹w(z²)=t(Nz); norm-one global unit gives1 | Determinant z² essential | None |
| §4.1 closure independence | sequence of norm-one global units | every factor1, continuous limit1 | Full closure required | None |
| §4.2 mixed-cover comparison | additional diag(ε,1) | j=1, coefficient extra multiplier1 | Pullback along actual span | None |
| §4.2 twisted polarization action | w(ε)=2,w(η)=3 | combined factor6=w(εη); trivial w gives1 | Correct inverse geometric pullback | None |
| §4.2 finite quotient factorization | kernel unit in Δ(N) | descended action1; arbitrary local unit has no prescribed global transport | Geometric quotient required | None |
| §4.2 finite descent/intermediate comparison | split C₂ torsor | equalizer values determined by one coordinate; order2 averaging undefined mod 2 | Equalizer works without division | None |
| §4.3 pairing transformation | detγ=3,x=1;detγ=1,x=3 | multipliers3 and1/3 | Coordinates correctly oriented | None |
| §4.3 Weil-pairing coefficient map | w=x,eβ=2 | forward1/2,inverse2,composite1 | Inverse factor necessary | None |
| §4.3 integral pairing bound | unit2 at p=5 | norms of2 and1/2 both1 | Integral map/inverse | None |
| §4.4 class form quotient | F=ℚ | one narrow class, chosen representative gives one module | Finite reduction | Named coprime representative theorem |
| §4.4 principal transport | x=1 and x=2,y=3 positive | P₁=id,P₂P₃=P₆ | Correct relation | None |
| §4.4 choice independence | change by2 then inverse1/2 | composite P₁=id, scalar factor1 | Stabilizer cancellation retained | None |
| §5.1 AIP analytic coefficient | κ=x,frame scale2 | eigenfunction value1/2; trivial weight invariant1 | Actual inverse eigencondition | None |
| §5.1 AIP integral coefficient | constant1 and1/5 | norms1,5; second excluded | Geometric O⁺ lattice | None |
| §5.1 chart/weight/unit maps | χ(λ)=ζ³=1,λ finite order3 | inverse character valueζ², norm1 | Finite factor not erased | None |
| §5.1 formal interval inequalities | k=1,k′=1,r=3 | odd n in[3,4],n′=n−3; dyadic requires n≥5 so no such n | Prime-dependent bound necessary | None |
| §5.1 universal formal line | trivial universal character | local generator1,transition1,rank1 | Full sign twist separate | None |
| §5.1 translation valuation units | ζ root of unity versus5 | valuations0,0 forζ,ζ⁻¹; valuations1,−1 for5,5⁻¹ | Two-sided units essential | None |
| §5.2 AIP invariants | trivialized analytic torsor | invariant constant3 descends3, not arbitrary nonconstant frame coordinate | Analytic torsor, not profinite | None |
| §5.2 valued-point lifting | split torsor over complete fieldC | base point lifts by identity section; value3 remains3 | Correct local lifting model | None |
| §5.2 reflection of bounds | descended1,1/p | upstairs norms1,p, same downstairs | All-valued-point condition | None |
| §5.3 finite AIP character factor | trivial and dyadic sign | fibre values(1,1) and(1,−1) | Finite factor retained | None |
| §5.3 finite factor ordinary line/rational pullback | split finite torsor | evaluation gives rank1; rational fibreE, integral boundO_E | No arbitrary tensor interchange | None |
| §5.3 split generator | χ(a)=ζ,ζ³=1 | e(σ)=1,e(σa)=ζ² | Inverse character detected | None |
| §5.3 change of section | replaceσ byσa | e_new(σa)=1=ζ·ζ²; scalar factorζ | Correct direction | None |
| §5.3 full Čech descent | overlap elementa,χ(a)=ζ | g₂=ζ²g₁; checking only identity subgroup would imposeg₂=g₁ | Full relation necessary | None |
| §5.3 full formal coefficient | trivial universal versus trivial finite factor | products1·finite and universal·1; ordinary rank1 | Both factors survive | None |
| §5.3 formal gluing/specialization | transitionζ thenζ² | cocycle product1; trivial-character specialization transition1 | Consistent | None |
| §5.3 analytic unit coboundary | b=1 versusb=p | inverse norms1 versusp; only first unit-bounded pair | Fixed-open hypothesis necessary | None |
| §5.3 conditional integral generator | split unit framee | a↦ae↦a, at a=3 both composites3 | Hypothesis gives conclusion constructively | None |
| §5.3 completed specialization pullback | formal free lineO | completed pullbackO_X⁺,1↦1 | Sites/functor specified | None |
| §5.3 formal/geometric integral comparison | same unit framee on both sites | forwarde↦e,inversee↦e; replacing framebye changes lattice unless multiplier unit | Canonical evaluation fixed | None |
| §5.3 annulus countermodel | ∣T∣=3^(−α),irrationalα∈(0,1),y²=T | ∣y∣=3^(−α/2); norm-one frame would need ∣a∣=3^(α/2), not3^(q−kα) with q rational,k integer | Split-cover freeness insufficient | None |
| §5.4 geometric rational AIP comparison | κ=x,frame denominator2 | AIP and perfectoid multipliers both1/2 | Same frame evaluation | None |
| §5.4 geometric integral comparison | valued-point unit2 at p=5 | both lattices preserve norm1; rational rescalingby5 changes inverse boundto5 | Bound reflection necessary | None |
| §5.4 common comparison range | p=5,m=1 | comparison1/25<period1/10 | Stronger common range retained | None |
| §5.4 arithmetic comparison | w=t=x,d=2 | AIPν=w,w_AIP=t⁻¹ gives geometric2; full multiplier1 | Dictionary consistent | None |
| §5.4 naturality and uniqueness | actual unit frame1,restrictiontwice | images1,1,1; any evaluation-compatible scalar mapmust send1to1 | Correct uniqueness condition | None |
| §5.5 Frobenius frame map | algebraic weightk=1 | frame scales byp, not1; tensor weightk producespᵏ | Isogeny normalization essential | None |
| §5.5 Frobenius iterates | two steps,k=1 | p·p=p²; weight0 gives1 | Iteration/weight compatibility | None |
| §6.1 cusp coefficient | boundary ideal(q) versus(q²),trivial weight | q∈(q),q∉(q²),1∉(q) | Correct boundary order | None |
| §6.1 fixed-radius cusp kernel | local1+q,q | boundary values1,0 | Kernel criterion both directions | None |
| §6.1 positive-radius cusp colimit | q andits restrictions | same class[q]; zero systemcolimit0 | Ordinary-only sections excluded | None |
| §6.1 integral cusp variants | q,p⁻¹q | coefficient norms1,p | Vanishing does not imply boundedness | None |
| §6.1 cusp radius/weight/class maps | unit-frame change2 | coefficientq/2 paired withframe2 givesq; constant term0 | Cusp condition retained | None |
| §6.1 family Koecher | d=1 puncture versusd>1 normal codim≥2 | q⁻¹ haspole atq=0; constant1 extendsbutboundaryvalue1 | No dimension-one or cuspidal conclusion | None |
| §6.2 torsion-line higher vanishing | identity map,L=O ororder p | Rⁱid_*L(−D)=0 for i>0 | Includesp-torsion order | None |
| §6.2 monomial power splitting | char2,degree2 | projectionT^(2j)↦Tʲ,T^(2j+1)↦0; compositeon1=1 | Trace/2 unavailable | None |
| §6.2 floor divisor formula | coefficienta=3,ℓ=4 | floor(−3/4)=−1 | Correctboundarysign | None |
| §6.2 cuspidal coefficient vanishing | identity map,anyq>0 | R^q=0; degree 0 retains the cusp module | Allhigherdegrees,notH⁰vanishing | None |
| §6.3 tame operator at unit ideal | a=O_F | degree1,q_a=1,constant1↦1 | Empty product correct | None |
| §6.3 tame prime constant | residue q=2,3,5 | degrees 3,4,6; ratios 3/2,4/3,6/5 | Norm normalization differs from degree | None |
| §6.3 tame prime-square constant | residue q=2,3,5 | enumerated degrees 6,12,30; ratios 3/2,4/3,6/5 | Differs from 1+1/q² | None |
| §6.3 trace and coefficient direction | coefficient 1 on ca | π₂ pullback 1, θ(1)=1, trace degree; output degree/q | Correct source and target | None |
| §6.3 integral and cusp stability | p=5, tame q=2, boundary section q_cusp | denominator 2 is a unit; boundary value 0 stays 0 | Correct prime-to-p input | None |
| §6.3 radius, weight, level and class compatibility | identity section 1, trivial weight | same degree/q on either commuting path | Actual correspondence maps retained | None |
| §6.4 lower-row denominator | identity, diag(2,3), lower c=25 at z=5 | 1,3,126; determinants 1,6,1 differ | Lower row essential | None |
| §6.4 wild conjugation | ϖ=5,γ=[1,0;25,1],z=5 | new c=5, new z=25, denominator 126=126 | Correct conjugation | None |
| §6.4 reversed-conjugation countermodel | same γ | new c=125, new z=25, denominator 3126≠126 | Negative control detects order | None |
| §6.4 coefficient integrality | correct denominator 126 at p=5 | 126≡1mod 5,characterand inverseunit-valued | Integral map before normalization | None |
| §6.4 uniformizer change | ϖ→uϖ, torus unit u=2 | intermediate coordinate 2ϖz; unit transport undoes 2 | Only descended comparison independent | None |
| §6.4 ramified wild level | n=1,e=2 | l=3, not 2 | Ramification retained | None |
| §6.4 partial radius improvement | F=ℚ,p=5,ε=1/100 | ε/p=1/500; in product other coordinate ε unchanged | Partial improvement does not give all-directions compactness | None |
| §6.4 wild constant | q_pfr=2 or 3 | normalized 2/2=1 or 3/3=1 | Trace normalization | None |
| §6.4 level zero and infinite level | n=0 versus n=1, e=2 | finite correspondence formula expects n≥1, l=3; level zero uses AL₁ | No erased hypothesis | None |
| §6.4 diamond identity, product and inverse | order 3 nebentype ζ | ζ·ζ²=1, identity value 1; ζ≠ζ² | Inverse convention observable | None |
| §6.4 diamond cusp and coefficient comparison | boundary value 0, character ζ | ζ·0=0 on both coefficient models | Consistent | None |
| §6.4 Hecke–AIP equivariance | trivial weight, prime q=2 | tame both 3/2, wild both 1 | Same directions and constants | None |
| §6.5 q-expansion | 1,q,1+q | constant terms 1,0,1 | Full and cuspidal criterion | None |
| §6.5 frame change | κ=x,λ=2 | coefficient 1→1/2; frame 2 restores 1 | Coefficient line essential | None |
| §6.5 support and positive-unit relation | exponent ξ→uξ, unit u | monomial q^ξ relabels q^(uξ), constant term remains 0 for ξ>0 | Actual exponent lattice retained | None |
| §6.5 radius, level, weight and fan maps | monomial q, compatible Tate object | q↦q on each path; algebraic character x specializes x | Consistent local model | None |
| §6.5 injectivity coverage | two disjoint Igusa components, only first sampled | function (0,1) has sampled expansion 0 but is nonzero | Hypothesis needed; no weighted-section existence claim | None |
| §6.5 cuspidality equivalence and AIP comparison | q and 1+q on covered components | constant 0 iff q vanishes at boundary; independent comparison retains q | Both directions and frame hypotheses retained | None |
| §6.6 cusp Banach module | zero and c₀(ℕ,A) | ranks 0 and infinite; both (Pr), second not finite projective | Correct property | None |
| §6.6 field specialization | c₀(ℕ,A)→c₀(ℕ,E) at allowed point | basis vector e₀ lifts to e₀; zero to zero | Surjective model | None |
| §6.6 bounded family base change | split projector P=diag(1,0) | completed extension retains P, rank 1 | No arbitrary cohomology commutation | None |
| §6.6 radius restriction | R=1,r=1/3 | degree j bound 3^(−j), tail 3^(−N)→0 | Strict containment | None |
| §6.6 identity noncompact control | r=R=1 | every monomial bound 1, tail norm 1 | Identity not compact in infinite rank | None |
| §6.6 restriction composition | ratios 1/3 then 1/3 | monomial zʲ scales 3^(−2j), same as ratio 1/9 | Correct composition | None |
| §6.7 controlling product | F=ℚ, split quadratic, totally ramified degree 2 | U_p; U₁U₂; U_pfr², respective normalizations p⁻¹,p⁻²,p⁻² | Ramification exponents needed | None |
| §6.7 normalization identity | split (e,f)=(1,1),(1,1); inert (1,2); ramified (2,1) | ∑ef=2 in all three; product q^(−e)=p⁻² | All prime patterns | None |
| §6.7 factorization and compactness | each normalized chart contracts by 1/p | monomial tail p^(−N)→0 in every direction | Full product requires every direction | None |
| §6.7 partial integral renormalization | q=2, trace of 1=2 | qU(1)=2integral,divisionby2unavailablemod 2 | Integral map before division | None |
| §6.7 controlling integral renormalization | d=2,p=3 | pᵈU(1)=9 on full forms; constant absent on cusps | Sufficient denominator bound | None |
| §7.1 supplied finite ordinary Igusa torsors | F=ℚ,p=2,m=1,2 | degrees #(ℤ/2)ˣ=1 and #(ℤ/4)ˣ=2; full level GL₂(𝔽₂) has 6 elements | Igusa cover differs from full level | Exact ordinary supplier specified |
| §7.1 integral completed functions | constant complete ℤ₃ and zero | inverse-limit rings ℤ₃ and 0 | Degenerate cases | None |
| §7.1 torsion colimit order | x↦x mod 3ᵐ | factor through level m, no fixed level over ℤ₃ | Correct order | None |
| §7.1 projections and completeness | compatible integers 1 mod 3ᵐ | limit 1; projection at precision m returns 1 | Actual compatible family | None |
| §7.1 separatedness and torsion freedom | element 3 in ℤ₃ | 3≠0, 3·3=9≠0; all residues zero implies element 0 | Torsion-free patch hypothesis | None |
| §7.1 rational completed functions | ℤ₃→ℚ₃ | 1/3 present only after localization; zero remains 0 | Integral first | None |
| §7.1 local action | translation by 3 on identity function | f(x+3)=x+3, not x | Action not finite-level trivial | None |
| §7.1 sheafification | disjoint components needing levels i | component i identity mod 3ⁱ needs level i; no uniform i | Global colimit identity excluded | None |
| §7.2 integral ordinary weights | κ=x,u=2,p=5 | coordinate 1→1/2, norm 1; κ=1 gives invariants | Correct equalizer | None |
| §7.2 rational ordinary weights | integral weighted section e | e/5 rational, norm 5, outside integral lattice | Lattice retained | None |
| §7.2 finite-character completion | χ of conductor 3ᵇ | trivial on 1+3ᵇ, nontrivial at shallower stage | Depth survives completion | None |
| §7.2 arithmetic ordinary comparison | w=t=x,d=2 | full arithmetic factor 1 versus geometric 1/2 | Pairing twist retained | None |
| §7.2 weight and level maps | split frame 1, identity and composite | 1↦1↦1 | Same completed coefficient hypotheses | None |
| §7.3 Igusa completion comparison | R=ℤ₅,A=ℚ₅ | lim_m R/5ᵐ=ℤ₅=A°, localization ℚ₅=A | Correct basic model | None |
| §7.3 isometry and density | difference 5ᵐ | norm 5^(−m), same as torsion precision m | Isometric transition hypothesis | None |
| §7.3 nondiscrete power-bounded model | x∈O_C,v_p(x)=1/2 | x mod p≠0, (x mod p)²=0 | Reduced special-fibre argument fails | None |
| §7.3 weighted lattice comparison | split finite character ζ | generator and inverse both norm 1; rescaling by p gives inverse norm p | Extra weighted model required | None |
| §7.3 restriction and equivariance | identity function translated by 1 | x+1 on either tower/completion path | Consistent | None |
| §7.4 ordinary restriction | constant 1, trivial weight | restricts 1→1; nontrivial weight retains 1/2 at unit 2 | Actual weighted evaluation | None |
| §7.4 independence of representatives | q and its positive-radius restrictions | all ordinary expansions q | Factors through colimit | None |
| §7.4 integral, cusp, level and weight maps | integral cusp q and q/p | q bounded with constant 0; q/p not necessarily bounded | Distinct integral and rational objects | None |
| §7.4 ordinary AIP comparison | split unit frame 1 | formal, analytic and perfectoid images all 1 | Model and cocycle hypotheses retained | None |
| §7.4 Hecke, expansion and diamond transport | constant 1 at weight 0, tame q=2; order 3 character | Hecke 3/2 on either path; diamond ζ on both; expansion constant 3/2 | Same correspondences | None |
| §8.1 antidiagonal dual factor | W swap,Z=[0,1;0,0],C=[0,0;3,0],A=I | correct diag(1,4), reversed diag(4,1) | Noncommuting order essential | None |
| §8.1 expanded-sum identity | W=0 and W=1, rank 1,A=2,Z=3,C=5 | zero on two sides for W=0; 2+15=17 for W=1 | Definition is more general than frame change | None |
| §8.1 reversal basis conversion | W²=I | (ZW)(WC)=ZC; sample ZC=diag(3,0) | Both W factors needed | None |
| §8.1 empty index | rank 0 | unique matrix, determinant 1 | No genus-zero moduli claim | None |
| §8.2 Siegel coefficient domain | g=1,p=2,c=2,Z=1 | J=3 unit; Weyl at Z=0 gives J=0 nonunit | All-prime coefficient domain | None |
| §8.2 factor neighborhood | p=2,w=1,Z₀=0,E=2,C=2,A=1 | J₀=1, J=5, ∣J−J₀∣=1/4=2^(−(w+1)) | Quantitative bound correct | None |
| §8.2 integral determinant | previous sample | J≡1 mod 2, det J=5 unit | Unit statement requires congruences | None |
| §8.2 canonical range at level 1 | g=1,p=3,n=1 | c_g=3/4, 7/8 admitted, 3/4 excluded | Strict lower bound | None |
| §8.2 canonical range at level 2 | g=1,p=3,n=2 | 7/4<15/8≤2, Hodge height <1/6 | Correct level scaling | None |
| §8.2 first and second chart transport | n=2,w=15/8 | u=7/8, [1,0]a=[0,1]; n=1,w=7/8 gives u=−1/8 outside positive first-chart domain | Domain distinction matters | Retained correct chart shift |
| §8.2 dyadic canonical range | p=2,g=1 | p>2g reads 2>2, false; coefficient factor 3 still unit | Coefficient construction survives | None |
| §8.2 quotient versus dual frame | γ=diag(I,2I),p=5 | J=I, c=2, quotient factor 1, dual-frame factor 1/2; pairing factor 2 restores 1 | Tate factor necessary | None |
| §8.3 scalar Siegel coefficient | χ=x,det J=6 | multiplier 1/6; trivial χ multiplier 1 | Correct determinant relation | None |
| §8.3 scalar integral lattice | det J=2 at p=5 | character and inverse unit norm 1; scalar 1/5 not bounded | Two-sided condition | None |
| §8.3 determinant Hodge specialization | m=1,−1,det J=6 | products (1/6)·6=1 and 6·(1/6)=1 | Dual weight correct | None |
| §8.3 finite algebraic coefficient | zero, trivial line, standard g=2 | ranks 0,1,2; determinant line has rank 1 | Full representation retained | None |
| §8.3 extra similitude | diag(I,2I) | J=I but c=2; coefficient with similitude character 2 differs from trivial 1 | No character discarded | None |
| §8.3 tensor, dual and restriction comparison | χ and χ⁻¹ at determinant 2 | 2·1/2=1; restricted action stays 2 | Correct associated-bundle convention | None |
| §8.4 determinant eigenline map | R=S=ℚ,g=2,diag(2,3),a=1 | value 6, evaluation at I gives 1 | Distinguishes determinant from entry | None |
| §8.4 linearity and injectivity | a=0,3, evaluation at I | 0,3; kernel only 0 | Zero ring and zero element valid | None |
| §8.4 transpose translation | h=diag(2,3),ℓ=I,a=1 | left 6, right χ(det h)·1=6 | Correct character | None |
| §8.4 unipotent determinant test | h=[1,7;0,1] | det 1, eigenfunction value a | Different from individual matrix entry | None |
| §8.4 analytic Siegel sheaf | g=1,2, trivial weight | line versus functions 1,z,z²,…; determinant line only constants | Injection need not be surjection | None |
| §8.4 integral Gauss sheaf | p=3,(T³−T)/3 | Gauss norm 3, excluded despite integral rational values | Same correct lattice | None |
| §8.4 radius, weight and coefficient maps | monomial z², ratio 1/3 | image z²/9, coefficient norm ≤1 | Consistent | None |
| §8.4 finite algebraic injection | g=2, degree bound k | z^(k+1) outside finite polynomial coefficient | Full analytic carrier larger | None |
| §8.5 Atkin–Lehner block and chart | g=1,q=2,Z=3 | [1,3][0,1;−2,0]=[−6,1] | Signed second chart | None |
| §8.5 singular Z and q | Z=0,q=2;q=0,Z=3 | rows [0,1],[0,1]; second block determinant 0, no invertible action | No Z inverse needed; unit q needed for action | None |
| §8.5 empty and characteristic 2 cases | rank 0; characteristic 2,q=1,Z=1 | empty determinant 1; row [1,1] since −1=1 | Both degenerate cases correct | None |
| §8.5 geometric transport | q=p, over ℚₚ versus ℤₚ | determinant pᵍ nonzero in fraction field, nonunit integrally for g≥1 | Tower domain requirement | None |
| §8.6 toroidal coefficient | zero, trivial line, rank-two diagonal | ranks 0,1,2; separate weights retained | Actual reduction required | None |
| §8.6 ineffective centre | cubic norm-one torus, unit u≠1 | Z_s=1, Zʳ=T, action u≠1 versus trivial Tʳ action 1 | Rank quotient necessary | None |
| §8.6 Tate graded comparison | central weights j=0,1 | twist ℚₚ(0) trivial; ℚₚ(1) cyclotomic action 2 at χ_cycl=2 | Cannot erase weight-one twist | None |
| §8.6 dual, tensor and refinement compatibility | character 2 and dual 1/2; two refinements | tensor character 1; both pullback composites carry frame 1 to 1 | Compatible torsor diagrams required | None |
| §8.6 reduced-period coefficient | identity or split H-torsor, χ(h)=2 | evaluation recovers V; coefficient at second frame 1/2 | No ordinary interpretation required | None |
| §8.6 change of reduction | intertwiner identity versus zero map | identity keeps 1; zero maps 1 to 0 and is no comparison isomorphism | Actual representation diagram required | None |
| §8.7 Bruhat families | dual-number A, torus M=T | coefficient and distribution dimension 2, ε≠0; reduction dimension 1 | General Tate pair retained | None |
| §8.7 precursor parameters | m′=1,m=0,n=1 versus m=n=1 | differences −1 and 0; only second in [0,0] | Actual reduction range | None |
| §8.7 Weyl root correction | GL₂,M=T,ν=0,w=1 or s | κ=−2ρ or 0 since w₀,M=1 | Full-group longest element reverses values | None |
| §8.7 distribution weight | same GL₂, 2ρ_nc=α | κ+α=0 or α; differs from −α or 0 | Shift essential | None |
| §8.7 radius, level and coefficient maps | εz, restriction ratio 1/3 | εz→εz/3; reduction gives 0 by both paths | Compatible; nilpotents retained | None |
| §8.7 algebraic injection | dominant κ,k=1 local chart | finite 1,z inside analytic 1,z,z²,… | Injection, not equality with whole family | None |
| §8.7 distribution algebraic map | zero-unipotent dual line, shift α | dual character inverts κ+α; at κ=0 gives −α, not 0 | Comparison keeps shift | None |
| §8.7 finite-character twist | b=1,m′=n=1 versus b=2 | inequalities 1≤1 true, 2≤1 false | Actual depth required | None |
| §8.7 projective Banach descent | rational C₂ action versus characteristic 2 | idempotent (1+g)/2 defined over E; undefined mod 2 | No integral extension by averaging | None |
| §8.7 all-degree cohomology comparison | split geometric point, finite coefficient A | H⁰_et=H⁰_an=A, Hⁱ=0 for i>0 | Includes degree zero and higher degrees | None |


Pull request: #1422 (roadmap/overconvergent-automorphic-forms at 5eb7d1b)
