# Review of ProfiniteCohomology (pull request #616 at 98bf9c1)

**Verdict:** needs changes

:robot: Independent AI review using Codex. No approval or merge action is taken.

## R01 (P2) — Replace admitted constructions with headline propositions

**Location:** `TauCetiRoadmap/ProfiniteCohomology/CohomologyUniverseComparison.lean:46`, also lines 77, 144, 149, 188 and 195. The first declaration is `noncomputable def resolutionTermEquiv ... := by sorry`.

**Claim:** These six admissions construct continuous linear equivalences, cochain isomorphisms, cycle equivalences and canonical homology presentations. They are data, not theorem statements. The subsequent composite and the dimension-normalization proofs depend on this admitted data. This violates the acceptance-test rule even though Lean can elaborate the files and the README specifies sensible intended maps.

**Witness:** The six bodies are `sorry`; `canonicalCohomologyAddEquiv` at line 218 composes two of them. `DimensionNormalization.lean:22` then uses the resulting vanishing equivalence. Elaborating the combined helper probe produced 19 admission warnings.

**Repair:** Keep the recursive construction, inclusion squares and class-map specifications in the README. Remove admitted data and declarations depending on it from the acceptance files. State the remaining headline comparison as a theorem asserting existence of the appropriate equivalence on the native carriers, with its normalization/naturality conditions in the same proposition. State dimension transport separately as a headline proposition if retained. Do not replace it with an arbitrary equivalence hypothesis. If a sufficiently short faithful statement cannot be given, name the missing construction in the module docstring instead.

**Repair check:** For the trivial group and coefficient ℤ, degree-zero comparison must send 1 to 1; multiplication by −1 is excluded. For C₂ with trivial 𝔽₂ coefficients, the degree-one comparison must preserve the nonzero class, excluding the zero map. These checks keep the mathematical contract without introducing an admitted producer.

## R02 (P2) — State the class-module end theorems on the native action and class

**Location:** `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:132`; `TauCetiRoadmap/ProfiniteCohomology/README.md:2035`. The docstring excludes the class-module theorems because continuity is missing for “this file's `abelianizationProPAction`”.

**Claim:** This is an artificial obstruction created by a local copy. The README's end theorems—vanishing of H¹ and the marked cyclic description of H² under `scd_p G ≤ 2`—are statable at the pins. Listing them as unavailable does not satisfy the headline requirement.

**Witness:** `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/ClassModule/Basic.lean:116` supplies `abelianizationProP_continuousSMul`; line 166 supplies `abelianizationProPClass`. Scratch statements of both end theorems elaborated with only their two `sorry` warnings.

**Repair:** Use `TauCeti.abelianizationProP`, its native action, and its native class. State H¹ vanishing and existence of an additive equivalence
`H²(G/V, V^ab(p)) ≃+ ZMod (p ^ V.index.factorization p)` sending the extension class to 1, for prime p, profinite G, open normal V, and `scd_p G ≤ 2`. The scratch probe states exactly these signatures using the native strict-dimension invariant at extra coefficient universe zero. Remove the local-action excuse from the docstring; import the individual native modules used.

**Repair check:** For G = ℤₚ and V = pℤₚ, H¹ = 0, H² = pℤₚ/p²ℤₚ, and the carry factor set represents p, sent to 1 modulo p. For p = 2 and 3 the orders are respectively 2 and 3. For G = Cₚ and V = 1, the claimed order would fail, but the strict-dimension hypothesis excludes that example.

## R03 (P2) — Consume the pinned cup and index-two packages instead of planning them again

**Location:** `TauCetiRoadmap/ProfiniteCohomology/README.md:2231`, `README.md:2351`, `README.md:2409`; `Suggested.lean:3143` and `Suggested.lean:3711`.

**Claim:** Layer 12 constructs a second `TopPairing` and plans the native graded product again. Layer 13 rebuilds the native dihedral extension/pullback calculation and plans index-two graph identities already proved at the pin. These are not new variants. The docstring's distinction between “this roadmap's” and Tau Ceti's pairing is the duplicated carrier, not a mathematical difference. This also makes the description of unavailable cup-related headlines inaccurate.

**Witness:** At the pinned Tau Ceti, `Cup/Graded/Basic.lean:120` has the same three pairing fields; `Cup/Cohomology.lean:167` defines its cup. `Evens/DihedralPullback.lean:285` proves the stated pullback identity, and `Evens/Identities.lean:139` proves polarization.

The full paths of those relative module names start with `TauCeti/RepresentationTheory/Homological/ContCohomology/`. Additional checked owners are `Cup/Assoc.lean:214` (`cup_assoc`), `Cup/Graded/Comm.lean:447` (`cup_gradedComm`), `Cup/ProjectionFormula.lean:293` (`cup_projection`, with its smooth-discrete hypotheses), and `TauCeti/GroupTheory/GroupExtension/DihedralSixteen.lean:344` and line 374 (the section and factor set). The section table agrees entry by entry with the local one. The two continuity admissions at `Suggested.lean:4164` and line 4173 likewise have native counterparts at `Evens/DihedralPullback.lean:310` and line 319.

**Repair:** Move these existing results into exact supplier contracts with native names and hypotheses; delete the duplicate carrier, constructions and planned proofs. Preserve genuinely new work, notably the general-index/all-degree Evens construction and its comparison with the existing index-two graph class. Do not retain completed native constructions as a second local API. Similarly update the claim at `README.md:1695` that all-degree Shapiro landed after the pin: `Shapiro/AllDegrees.lean:410` and line 446 already provide the TopRep isomorphism and quasi-isomorphism results at this pin.

**Repair check:** The native and local dihedral sections give the same eight lifts. On `(u,v)`, the graph cocycle, factor set and boundary have values `(1,1,0)`; on `(s,u)`, they have `(0,1,1)`. All 64 pairs satisfy the same identity. For C₂, the native mod-2 cup has the required nonzero square in degree two. Consuming these objects preserves the intended conventions.

## R04 (P2) — Keep the general coefficient-ring norm, not only the consumer's mod-2 case

**Location:** `TauCetiRoadmap/ProfiniteCohomology/README.md:2468`. The scope says “the mod-2 all-degree form is the one built here, since Kozlowski's formula consumes it”.

**Claim:** The source-supported even-degree norm over a general commutative G-ring is acknowledged and then excluded solely because a consumer needs 𝔽₂. This is a route-specific narrowing of the planned library. Constructing the norm for every subgroup index does not repair the missing coefficient generality.

**Witness:** `Evens line 345`, Theorem 1, printed p. 63, takes a commutative G-ring k and even-degree input. The target at `README.md:2507` instead fixes 𝔽₂ in both source and target.

**Repair:** Include the continuous norm for a discrete commutative G-ring A with continuous action, an open subgroup U of finite index l, and even-degree input: `H^{2q}(U,A) → H^{2lq}(G,A)`, with its source-supported multiplicativity, transitivity, restriction/double-coset and inflation laws and expansion. Retain the characteristic-two construction in every degree and prove compatibility with the even-degree construction. The 𝔽₂/index-two graph formula remains its application and comparison target. Keep these constructions owned here; do not push them to a consumer or another library.

**Repair check:** Take G=C₃×C₂, U=C₃ and A=𝔽₃ with trivial action. Restriction is an isomorphism in positive degree, and for a nonzero generator a of H²(C₃,𝔽₃), restriction of N(a) is a²≠0 in H⁴. N(2a)=4N(a)=N(a), whereas 2N(a)≠N(a). The general target expresses this nonzero odd-characteristic norm; a 𝔽₂-only operation cannot. At index one the repaired target is the identity for every such coefficient ring.

## R05 (P3) — Delete acceptance-test padding

**Location:** `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:1392`, also lines 2656, 2662 and 4324.

**Claim:** `continuousCohomology_preservesFilteredColimits` is an admitted restatement of a pinned theorem. Other declarations merely forward a native theorem or restate a definition. They do not test unfinished headline mathematics.

**Witness:** A scratch copy of the filtered-colimit statement closes with one tactic:

```lean
exact TauCeti.ContinuousCohomology.continuousCohomology_preservesFilteredColimits
  (k := ℤ) (G := G) n
```

Its owner is `TauCeti/RepresentationTheory/Homological/ContCohomology/FilteredColimits.lean:368`. The small probe exits successfully with no diagnostics. `leastENatBound_le_iff` and `leastENatBound_eq_top` already have one-library-theorem bodies. The equation `res_corestriction_eq_add_evensConj` is algebra on the definition `evensConj = res ∘ cor − id`.

**Repair:** Delete these declarations from `Suggested.lean`; retain useful mathematics as README statements/Checks or native supplier citations. Apply the same rule to the long catalogue of aliases, boundary facts and finite coordinate computations, retaining only simple definitions necessary to state genuinely unfinished headlines. Do not replace these admissions with proofs in place.

**Repair check:** For the constant filtered diagram 𝔽₂ with trivial group, both degree-zero colimits are 𝔽₂ and both maps send 1 to 1. For an empty set of dimension bounds the least bound is ⊤ on both sides. Deleting these local declarations loses no new theorem. The bounded-exponent admission was also tested against its native counterpart, but a hidden cohomology-universe mismatch prevented direct application; it is not included in this one-tactic finding.

## R06 (P3) — Apply Lean form rules to both auxiliary files

**Location:** `TauCetiRoadmap/ProfiniteCohomology/CohomologyUniverseComparison.lean:1`, line 16; `TauCetiRoadmap/ProfiniteCohomology/DimensionNormalization.lean:1`, line 12.

**Claim:** Both helpers import another roadmap module and use `set_option autoImplicit false`; the comparison helper additionally imports a Mathlib submodule instead of the required `import Mathlib`. Their docstrings contain process history rather than the required target-signature description. The supplied gate's zero counts did not inspect these violations effectively.

**Witness:** The comparison file starts with an import of `TauCetiRoadmap.ProfiniteCohomology.Suggested`; the normalization file imports that helper. Both contain the literal `set_option` line. The comparison docstring says “The failed predecessor”.

**Repair:** After R01, consolidate any retained headline propositions into the acceptance file or give each retained Lean file the permitted imports and module form: `import Mathlib`, only used `TauCeti.*` modules, no options, a timeless target-signature docstring, and documented declarations. Remove process commentary from the README and docstrings. Re-run the scans over all three Lean files. The combined-helper scratch elaboration also reports two `letI` linter suggestions; retained files must emit only admission warnings.

**Repair check:** The main `Suggested.lean` already elaborates without any `set_option`. The statability probes for R02 also use ordinary defaults. No option override is required for their statements.

## R07 (P3) — Correct the Kozlowski and Serre locators

**Location:** `TauCetiRoadmap/ProfiniteCohomology/README.md:2352`, line 2750 and line 2759.

**Claim:** Kozlowski Lemma 2.4 is presented as the source for four general index-two identities, and Serre Theorem 1′ is described as the identification of the D₁₆ class with the signed-permutation w₂. Those are not the statements at the cited locators.

**Witness:** `Kozlowski line 126` specializes to the universal double cover crossed with X and gives Steenrod-square formulas. `SerreWitt line 560` gives an arithmetic trace-form formula containing `(2)(d_E)`; the universal class is introduced before it, at line 550.

**Repair:** Cite Kozlowski Lemma 2.4, printed p. 311, only for its actual special-cover formulas, and identify separate inputs or the direct graph proof for the general identities. Cite Serre §4.1, printed pp. 667–668, for the signed-permutation class, and give the dihedral identification via the checked extension/Clifford convention; do not attribute it to Theorem 1′ alone. Retain Kahn I.4.2, printed p. 239, for the rank-one induced-representation interpretation, explaining the specialization.

**Repair check:** For the universal double cover and x in degree one, Kozlowski's formula gives `N(x) = x² + t x`, not a list of the four asserted general identities. For E = ℚ(√3), the trace form is ⟨2,6⟩: its w₂ is `(2,3)`, whereas the permutation representation's w₂ is 0. The correction `(2)(d_E) = (2,3)` is nonzero at 3: ℚ₃(√2) is unramified quadratic and 3 has odd valuation, so 3 is not a norm. The corrected locator distinguishes the two statements.

## R08 (P3) — Restore per-target dependencies and discriminating Checks

**Location:** `TauCetiRoadmap/ProfiniteCohomology/README.md:582`, line 753, line 1891 and line 2679.

**Claim:** The README uses layer-wide `Prerequisites` and paragraph-form API field lists, rather than the requested per-target dependency/API/Check structure. Most definitions do not have three discriminating Checks. The new universe-comparison construction has one explicit universe-zero regression, but no such list. The single coarse layer table also places connecting-map comparisons at “5 with 10” and puts the field-extension bridge in Layer 9 despite its dependence on Layer 13.

**Witness:** The carrier API at line 753 is a `Constructors: ... Morphisms: ...` paragraph. The new comparison's stated regression at line 1922 is `u=0`. The dependency table and `README.md:2698` explicitly acknowledge the forward field-bridge dependency.

**Repair:** Use the requested Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, and ordered layer headings. Give each retained target its own dependencies and exact locator; use prose API bullets and at least three discriminating Checks for every retained definition. Move integration targets after all their inputs, rather than making an entire layer depend both ways. Each layer should finish with Examples and Dependencies. Delete completed-native targets under R03 rather than expanding their redundant API.

**Repair check:** For the new comparison, use (i) G = 1, M = ℤ, n = 0, class 1 maps to 1; (ii) G = C₂, M = 𝔽₂, n = 1, nonzero class maps to nonzero class; (iii) the degree-zero coefficient map ℤ → ℤ, x ↦ 2x, where both paths send 1 to 2. The first two exclude sign/zero substitutions, and the third tests the requested naturality square. The general supplier check itself reports no upward edge or cycle; this finding concerns the internal presentation, not an invented cross-roadmap cycle.

## Verified sound

The scope is this existing roadmap's four named files. I read the normative repository README and CONTRIBUTING, compared the head with the requested hash, and checked the outside-folder diff: no changes outside `TauCetiRoadmap/ProfiniteCohomology`. No previous AI review was supplied. This is repairable within the existing owner; it is not a proposal to replace an existing roadmap with a new competing roadmap.

**Build and signatures.** The worker gate reports every check passing. I independently ran the targeted build `lake build TauCetiRoadmap.ProfiniteCohomology.Suggested`: it completed successfully, with 9,148 jobs and 42 admission warnings. The direct `lake env lean` elaboration of the owner file also succeeded. A scratch file elaborated `#check @...` for 366 named declarations from `Suggested.lean`; a combined scratch copy checked 34 helper declarations. The latter reports the 19 admissions and two linter suggestions discussed above. Anonymous examples and private implementation names are not included in the 366 count.

The expanded signatures retain the prime, compactness, total-disconnectedness, openness, coefficient-action and smooth-discrete hypotheses on the admitted dimension/corestriction targets where needed. In particular `cd_p_le_iff_finite_pPrimary` retains `Fact p.Prime`, and the transfer range theorem retains both normality and `scd_p G ≤ 2`. No missing standing-hypothesis finding is asserted. The helper carriers really distinguish `continuousCohomology.{0,u,u}` from `continuousCohomology.{0,u,0}`; equality of the carrier universe expressions alone does not identify the chosen canonical homology objects. I did not treat a failed `rfl` or the failed bounded-exponent direct application as mathematical falsity.

Every one of the 42 main admissions was tried with `simp`, `rfl` and `infer_instance` in a scratch copy, falling back to the original admission on failure. None closed with those three probes. The native-lemma probe for the filtered-colimit statement succeeds, as R05 records. The two missing class-module headline signatures independently elaborate on native objects with only their intended admissions. These are statability tests, not proofs of the two theorems.

**Headline inventory.** The README's end results are the canonical/explicit comparisons and finite-quotient colimit; the long exact and five-term sequences; Shapiro, dimension shifting, corestriction and Mackey; Hilbert 90 and Kummer compatibility; ordinary/strict dimension criteria and the class-module theorem; the graded cup package; the general Evens norm, its index-two graph identities, exact sequence, and D₁₆ pullback; and the same-coefficient-universe comparison with dimension transport. Many early headlines are already native and should be consumed. The class-module end statements are absent despite being statable. The new universe headline occurs through forbidden admitted constructions. The module docstring does identify the genuinely unfinished general tensor-induction norm and several comparison maps; its claims of missing cup/class-module carriers need R02–R03.

**Computed adversarial pass (91 rows).** The following rows give explicit values, not claims that an admission is proved. Native aliases of the same operation are grouped by mathematical object; the 42 admitted targets of the main file have separate rows, marked A01–A42 in file order. The remaining rows cover conventions, headline results, sampled API objects and every mathematical object used by a finding. `0` denotes the zero group or zero class as appropriate; cardinalities are stated explicitly when used. Coefficients have the trivial action unless another action is specified. Finite groups have the discrete topology. No changes were made to the roadmap.

| Target | Instances and computed values on the two sides | Result / required change |
|---|---|---|
| TopRep versus smooth discrete coefficients | G = C₂ with indiscrete topology, M = ℤ with sign action: each group element acts continuously on discrete M, but the orbit of 1 has preimage {1}, which is not open. The raw TopRep exists; the smooth condition is false. | The smooth-discrete restriction is essential; native TopRep alone does not assert continuity in G. |
| Zero coefficients and zero coefficient ring | M = 0 gives Cⁿ = 0, Zⁿ = Bⁿ = 0 and Hⁿ = 0. Over the zero ring the only unital module is 0; cup and unit both have value 0 = 1. | No nontriviality hypothesis needed for these constructions. |
| Invariant coefficients and quotient action | C₂ acting by −1 on ℤ: M^{C₂} = 0, M^{1} = ℤ; trivial action instead gives ℤ in both cases. The zero module gives 0. | The action and the subgroup distinguish the definition. |
| Internal Hom and evaluation | For C₂ sign actions on M = N = ℤ, conjugation acts trivially on multiplication-by-2; evaluation at 1 is 2, and evaluation at −1 is −2. For finite M = C₂, N = C₂, evaluation at (id,1) is 1. | Equivariance has the stated inverse in the source action; finite-source discrete continuity is justified. |
| Sections and extensions | C₄ → C₂ admits normalized section 0↦0, 1↦1; its multiplicativity defect at (1,1) is 2, not 0. Empty closed subset into a nonempty two-point set extends by either constant; into an empty target from a nonempty space no extension exists. | A continuous section is not asserted to be a homomorphism; nonempty extension target matters. |
| C⁰,C¹,C²; d⁰,d¹,d² and low-degree quotients | G = 1, M = ℤ: d⁰ = 0, d¹ = id, d² = 0, hence H⁰ = ℤ and H¹ = H² = 0. A constant unnormalized 2-cocycle 1 is d¹ of constant 1. | Do not silently normalize all representatives. |
| Sign of d⁰ and cocycle equation | C₂ sign module ℤ: d⁰(1)(s) = −2. For f(s)=1, f(1)=0, d¹f(s,s)=−1−0+1=0; B¹ evaluates to 2ℤ, so H¹=ℤ/2. | Confirms the stated left-action convention. |
| Compatible pairs, identities and composition | G = 1, M = ℤ: pullback by the identity sends 3↦3; coefficient maps ×2 then ×3 send 1↦6, equal to ×6. Zero coefficient map sends every class to 0. | Identity/composition and coefficient variance agree. |
| Conjugation and its trivial action on classes | S₃ with 𝔽₂: the sign character takes both (12) and its conjugate (23) to 1; every inner conjugation acts as 1 on H¹≅𝔽₂. C₂ gives the identity as well. | Nonabelian control for the compatible-pair convention. |
| Explicit/canonical/discrete comparison | C₂ with 𝔽₂: H⁰,H¹,H² each have two elements in the explicit and discrete models; the class with f(s)=1 maps to the nonzero degree-one class. G=1 gives (ℤ,0,0) on both sides. | Finite-group comparisons and degree normalization agree. |
| Currying and resolution conventions | G=1: C(G,C(G,M))=M=C(G×G,M). For finite C₂, a two-variable scalar cochain has four independent values on either presentation. | The checked compact instances support currying; no claim made without the library local-compactness hypotheses. |
| Finite-quotient transition direction | G=C₄, V=1≤U=C₂, M=𝔽₂: the nonzero H¹(C₂,𝔽₂) character inflates to the C₄ parity character, value 1 at its generator. At U=G, H¹(1,M)=0. | Arrows go from the coarser quotient to the finer quotient. |
| Finite-quotient colimit headline | G=ℤₚ, M=𝔽ₚ: continuous H¹ is 𝔽ₚ; the generator already factors through G/pG and evaluates to 1 there and in the colimit. For M=0 every term and the colimit are 0. | Checks both descent and the zero case. |
| A01 continuousCohomology_preservesFilteredColimits | Constant filtered diagram 𝔽₂, G=1: H⁰(colim)=𝔽₂=colim H⁰, 1↦1; positive degrees are 0=0. | One native lemma proves the full statement; delete local padding (R05). |
| A02 DiscreteShortExact.toShortComplex_shortExact | 0→𝔽₂→ℤ/4→𝔽₂→0 with first map 1↦2: image={0,2}=kernel of reduction, and both end kernels/cokernels are 0. | Correct algebraic short-exactness signature. |
| A03 delta_naturality | C₂, the preceding coefficient sequence: δ of the nonzero H¹ character has representative value 1 at (s,s). Identity sequence morphism gives 1=1; zero sequence morphism gives 0=0. | The square involves the actual sequence maps. |
| Long exact sequence and Bockstein sign | For C₂, βx=x², with x²(s,s)=1. β(βx)=β(x²)=0. At G=1 the same connecting maps have zero target, hence value 0. | Exactness and successive connecting maps agree. |
| Five-term sequence and transgression | C₄⊇C₂, M=𝔽₂: H¹(C₂ quotient)→H¹(C₄) is an isomorphism; restriction H¹(C₄)→H¹(C₂ subgroup) is 0; transgression is an isomorphism, sending 1 to the carry class in H²(C₂). | Images and kernels at the three central terms have dimensions 1/1, 0/0, 1/1. |
| Transversal corestriction correction | C₄ sign module ℤ, U=C₂, transversal {1,s}, f(s)=1: cor(res f)(s)=0, while 2f(s)=2. The correcting d⁰ of the transversal sum is −2, giving 2+(−2)=0. | Confirms the cochain correction; a bare cochain index formula is false. |
| Mackey double-coset formula | S₃, U=V=C₂, H⁰ with ℤ: double cosets have sizes 2 and 4; the two Mackey contributions are 1 and 2. res∘cor is multiplication by 3=1+2. | Nonabelian and unequal-intersection control. |
| Coinduction and its counit/adjunction | G=C₂,H=1,A=𝔽₂: Coind has four elements; invariant functions are (0,0),(1,1); evaluation at 1 maps (1,1)↦1. Thus H⁰(Coind)=𝔽₂=H⁰(H,A). | Right translation and evaluation direction agree. |
| A04 coindFunctor_preservesEpimorphisms | C₂/1, coefficient reduction ℤ/4→𝔽₂: coinduced map is componentwise reduction from 16 elements onto four; (1,0) has lift (1,0). | Closed-subgroup hypothesis present. |
| A05 coindFunctor_preservesMonomorphisms | C₂/1, 𝔽₂→ℤ/4, 1↦2: (a,b)↦(2a,2b) has kernel {(0,0)}. | Injection is preserved; the test does not need closedness. |
| A06 isIso_shapiroMap | C₂/1,A=𝔽₂: degree zero gives the bijection (a,a)↦a; in degrees 1 and 2 both cohomologies are 0. Cochain degree zero instead has orders 4 and 2. | Shapiro is a quasi-isomorphism, not an isomorphism of complexes. |
| A07 coindAcyclic | Same example: H¹=H²=0, while H⁰=𝔽₂ has two elements. | The hypothesis n>0 excludes the false boundary case. |
| Dimension shifting headline | C₂ sign ℤ: embed m↦(m,−m); quotient ℤ²/image≅ℤ via sum. Invariants (a,a) map to 2a, so the degree-zero cokernel is ℤ/2=H¹. The quotient invariants themselves are ℤ, not ℤ/2. | The stated i≥1 range and degree-zero cokernel are necessary. |
| A08 corestriction_naturality | C₄⊇C₂, H⁰(−,ℤ), coefficient map ×2: cor sends 1↦2, so either composite sends 1↦4. | Both paths use the same coefficient map. |
| A09 corestriction_comp_res | C₄⊇C₂, H¹(−,𝔽₂): restriction of parity is 0, so cor∘res=0=2x. H⁰ with ℤ gives 2=2·1. | Distinguishes torsion and non-torsion coefficients. |
| A10 exists_openSubgroup_res_eq_zero_of_res_eq_zero | G=ℤₚ,H=1,x:ℤₚ→𝔽ₚ the quotient character: res_H x=0 and res_{pℤₚ} x=0; x(1)=1. In degree zero, restriction with unchanged coefficients is injective, so only x=0 qualifies. | The open subgroup can depend on the class; n=0 is sound. |
| A11 delta_corestriction | C₄⊇C₂, sequence 0→𝔽₂→ℤ/4→𝔽₂→0: cor¹ sends the generator to parity x; βx=x²=0 in H²(C₄). cor² of β of the subgroup generator is also 0. | Both sides are 0; the restriction coefficient identifications are required. |
| A12 explicitIso_cor0 | C₄⊇C₂, ℤ: explicit sum over two cosets sends 1↦2; canonical trace sends 1↦2. | Degree-zero comparison has the correct factor. |
| A13 explicitIso_cor | C₄⊇C₂, 𝔽₂: the subgroup generator character corestricts to the parity character, value 1 at s, in both models. | Degree-one comparison agrees on a nonzero class. |
| A14 explicitIso_cor2 | C₄⊇C₂, 𝔽₂: restriction in H² is an isomorphism and res∘cor=2=0, so both explicit and canonical cor² send the generator to 0. | Confirms the second-degree direction. |
| Cup formulas, Leibniz and graded signs | C₂,𝔽₂: x(s)=1 gives (x⌣x)(s,s)=1 and a nonzero class. C₃,𝔽₃: h(g)=g² has d¹h(1,1)=1=x(1)x(1), so x² is a boundary; the odd-odd sign is −1=2. | Characteristic two does not imply odd squares vanish. Consume native cup (R03). |
| Cup units and associativity | G=1, coefficients ℤ, degrees 0: 1⌣3=3=3⌣1 and (2⌣3)⌣5=30=2⌣(3⌣5). Degree transports are between 0 and 0. | Nonzero normalization; native owners checked. |
| Projection formula | C₄⊇C₂, degree-zero ℤ coefficients, a=3,b=5: cor(res a⌣b)=2·15=30 and a⌣cor b=3·10=30. | Index and direction agree; keep the native smooth-discrete assumptions. |
| Hilbert 90 | ℂ/ℝ, conjugation: the cocycle value −1 is the coboundary of i because conjugate(i)/i=−1. For a separably closed field the group is trivial and H¹=0. | Multiplicative coboundary convention agrees. |
| Kummer isomorphism and invertibility | K=ℝ,n=2: both square classes and H¹(G_K,μ₂) have order 2, with −1 nonzero. K=ℂ gives order 1. In characteristic 2, K=𝔽₂(t), μ₂ is trivial but t is not a square. | The IsUnit(n:K) hypothesis excludes the inseparable false neighbor. |
| Kummer restriction, norm and H²-torsion image | ℂ/ℝ,n=2: norm z is positive, so its square class is 0; the source H¹(G_ℂ,μ₂) is 0, giving cor=0. Over ℝ, Br(ℝ)[2] and the image of H²(μ₂) both have order 2. | Names both maps; characteristic restriction is retained. |
| Finite-field H² example | 𝔽₄/𝔽₂: norm ω=ω³=1 generates the one-element target. 𝔽₉/𝔽₃: for a generator g, N(g)=g⁴=−1 generates the two-element target. In both cases invariants/norm=0. | No q=1 field is admitted by the hypotheses. |
| Dimension definitions and least bound | Trivial group: cdₚ=scdₚ=0. ℤₚ: cdₚ=1, scdₚ=2. Cₚ: cdₚ=scdₚ=⊤. Empty bound predicate has infimum ⊤; an always-true predicate has least bound 0. | The ordinary/strict predicates and ENat boundary values are distinguished. |
| A15 subsingleton_H1_of_isCyclic | C₂ sign ℤ: ker N=ℤ but (s−1)ℤ=2ℤ, so the hypothesis fails and H¹=ℤ/2. C₂ trivial ℤ: ker N=0=(s−1)ℤ and H¹=0. | The norm-kernel hypothesis discriminates the cases. |
| A16 sum_cocycle_mem_H0 | C₂ trivial ℤ, carry 2-cocycle f(s,s)=1: sum over τ at σ=s is 1, invariant. C₂ sign ℤ, f=d¹b with b(1)=0,b(s)=1: the sum is 0, the only invariant. | The summed cocycle identity cancels the translated sums; cyclicity is not required. |
| A17 cohomologicalDimensionLE_iff_torsion | G=ℤₚ,n=1: p-primary cohomology above 1 vanishes and the p-part above 1 of every torsion coefficient group vanishes. Dropping torsion allows M=ℤ with H²=ℚₚ/ℤₚ≠0. | The torsion qualification distinguishes ordinary from strict dimension. |
| A18 cd_p_le_iff_finite_pPrimary | G=ℤₚ: at n=0 both sides fail since H¹(𝔽ₚ)=𝔽ₚ; at n=1 both hold since H² of finite p-primary coefficients is 0. G=Cₚ has H^{n+1}(𝔽ₚ)=𝔽ₚ for every n. | Tests both directions and every finite n for the finite cyclic countermodel. |
| A19 cd_p_le_iff_boundedExponent | ℤₚ,n=1: both criteria give true; Cₚ gives false already for exponent-p module 𝔽ₚ. ℚₚ/ℤₚ is the union of its p^k-torsion groups, each of exponent p^k, but has no uniform exponent. | The exponent is allowed to depend on the module; direct native proof requires universe care. |
| A20 scd_p_le_cd_p_add_one | ℤₚ gives 2≤1+1=2; trivial group gives 0≤1; Cₚ gives ⊤≤⊤+1=⊤. | Checks equality, strict inequality and infinity. |
| A21 cd_p_le_of_isClosed | 1≤ℤₚ gives 0≤1; pℤₚ≤ℤₚ gives 1≤1. The dense copy ℤ⊂ℤₚ is not closed and is outside the claim. | Closedness is explicit. |
| A22 cd_p_eq_of_index_not_dvd | G=ℤₚ,U=G: index 1, dimensions 1=1. G=Cₚ,U=1: dimensions 0 and ⊤ differ, but p divides the index p. | The prime-to-p hypothesis rejects the false equality. |
| A23 strictCohomologicalDimensionAt_openSubgroup_le | pℤₚ≤ℤₚ gives 2≤2; 1≤Cₚ gives 0≤⊤. | Open-subgroup monotonicity has the intended direction. |
| A24 strictCohomologicalDimensionAt_le_iff_forall_openSubgroup | ℤₚ,n=1: left false; right false because H²(ℤₚ,ℤ)(p)=ℚₚ/ℤₚ. At n=2 left true and H³(U,ℤ)(p)=0 for every open U≅ℤₚ. | Tests both directions and the n+1 indexing. |
| A25 abelianizationProPFactorSet_mem_Z2 | G=ℤₚ,V=pℤₚ, using representatives 0,…,p−1: f(i,j)=p·floor((i+j)/p). At (p−1,1), f=p; its cocycle differential is 0. For p=2 the nonzero carry is 2; for p=3 it is 3. | Finite quotient makes continuity automatic, although the coefficients are profinite. |
| Class-module H¹/H² end theorem | ℤₚ/V=pℤₚ: H¹=V[p]=0; H²=V/pV has p elements and class p generates. ℤₚ²/pℤₚ² gives ∣H²∣=p⁴, whereas ∣G/V∣=p²; there scdₚ=3. | Strict dimension, rather than cdₚ≤2, excludes the counterexample; add native headline statements (R02). |
| A26 corestriction_surjective_primaryComponent | G=ℤₚ,U=pℤₚ,M=ℤ,n=2: identify both H² with ℚₚ/ℤₚ via characters. Transfer sends 1↦p, so cor sends the character value 1/p at p to value 1/p at 1. | A nonzero target class has a preimage; the top-degree bound holds. |
| A27 continuous_abelianizationProPTransfer | ℤₚ→pℤₚ is multiplication by p. The preimage of p^kℤₚ, k≥1, is p^{k−1}ℤₚ; both are open. | Continuity is visible on a neighborhood basis. |
| A28 abelianizationProPTransfer_eq_prod_lWord | ℤₚ,V=pℤₚ, representatives 0,…,p−1: transfer of 1 is p; the sum of additive Schreier factors is p (2 for p=2, 3 for p=3). | Matches the ordered transversal convention. |
| A29 abelianizationProPTransfer_apply_of_mem | Same pair, v=p: transfer is p²; the quotient action is trivial and the sum of p translates is p·p=p². | Value 4 at p=2 and 9 at p=3 on both sides. |
| A30 abelianizationProPTransfer_out | For σ=1 modulo p and the standard representative, transfer is p; sum_τ f(τ,σ)=p. At σ=0 both are 0 with normalized representatives. | Matches the factor-set sum, not its negative. |
| A31 exists_continuous_zmodChar_of_notMem | Y=ℤₚ,I=p^kℤₚ,k≥1,y=1: reduction modulo p^k vanishes on I and takes y to 1≠0. k=0 has a one-element target and cannot separate y. | Existence chooses an adequate exponent; no fixed exponent is claimed. |
| A32 zmodChar_eq_one_of_transfer_eq_one | ℤₚ→pℤₚ has kernel {0}; every continuous character maps 0 to 0 (multiplicative 1). For g=1, transfer=p≠0, so the implication makes no false claim. | Kernel hypothesis is used. |
| A33 zmodChar_eq_one_of_comp_transfer_eq_one | Transfer ℤₚ→pℤₚ is onto. Thus a character killing its image is zero on every invariant. The character ψ(p)=1 modulo p fails the premise since ψ(Ver(1))=1. | A nontrivial character is explicitly rejected. |
| A34 abelianizationProPTransfer_eq_one_iff | ℤₚ,V=pℤₚ: g=0 gives 0=0 on both kernels; g=1 gives p≠0 and 1≠0. | Both directions hold on zero and nonzero elements. |
| A35 abelianizationProPTransfer_range | Same pair: range=pℤₚ and quotient action is trivial, so invariants=pℤₚ. With V=G, transfer and invariant inclusion are both identities. | Tests a proper subgroup and index one. |
| A36 abelianizationProPMk_eq_smul_div_of_mk_eq_one | D₈=⟨r,s⟩, V=⟨r⟩=C₄, p=2: v=r² dies in G^ab; choose b=r. Then (s·b)/b=r⁻¹/r=r²=v. | Nonabelian, nonzero witness for the quotient-action orientation. |
| A37 abelianizationProP_pow_bijective | Abelian pro-2 group ℤ₂, m=3: inverse is multiplication by 1/3. Dense ℤ in ℤ₂ instead misses 1 under ×3. For m=1 the map is the identity. | Openness/compactness excludes the dense-subgroup failure. |
| Compactness in p-primary cohomology | Discrete ⊕ℕℤ with coefficients ℚₚ/ℤₚ: the character with kth value 1/p^k is not killed by any p^r, because its (r+1)st value remains 1/p. Compact G forces a finite image and hence a bound. | The README negative control is valid. |
| Monomial homomorphism and permutation wreath convention | S₃,U=1: all Schreier factors=1; (12)(23)=(123), but inverse-translation composition gives (132). C₄/U=C₂: factors of s are (s²,1). For U=G=ℤₚ the only base factor is γ itself. | Left translation is essential; a continuous base factor need not be locally constant. |
| Graph components b₁ and b_s | C₄ with generator s: b₁=[0,1,1,0], b_s=[0,0,1,1], sum=[0,1,0,1]. b₁(s²)=1≠b₁(s)+b₁(s)=0. | Only the sum is a degree-one cocycle. |
| Graph cocycle and representative change | Same C₄: ν(s,s)=1 and ν(s²,s²)=1; all 64 cocycle triples give dν=0. Changing s to s³ changes the cochain by the stated coboundary, not its class. | The nonzero restriction class detects the nontrivial norm. |
| Index-two norm restriction and polarization | C₄⊇C₂, nonzero α: res Nα=α²≠0. Taking β=α gives N(0)−Nα−Nα=0; cor(α²)=0, so both polarization sides are 0. | Checks the square and the mod-2 cancellation; native owners exist (R03). |
| Norm of a restricted class | C₄⊇C₂: y=parity restricts to 0; N(0)=0=y²+χy because χ=y and y²=0. For G=C₂×C₂,U=first factor,y=x: N(x)=x²+χx, nonzero. | The χ term is necessary; the C₄ case alone would not determine it. |
| D₁₆ section, central kernel and factor set | The eight section lifts match the native table. Kernel={1,r⁴}, of order 2. For (u,v), (ν,c_D,δw)=(1,1,0); for (s,u), (ν,c_D,δw)=(0,1,1). | All 64 pairs satisfy ν=c_D+δw; all 512 triples satisfy dν=0. Consume the existing construction (R03). |
| Induced homomorphism and pulled-back character | Universal WreathC2 case: Ind α sends (a,b,c) to (a,b,c); comap of {c=0} is exactly {c=0}, and the restricted character has value a on both sides. In C₄, Ind α(s)=(1,0,1). | Pins both subgroup and character, not just an unmarked isomorphism. |
| A38 continuous_wreathD16Cocycle_indexTwoInd | Finite C₄: all 16 pairs form a discrete domain; each factor-set fiber is open. At (s,s) its value is determined by the same finite section table. | Native theorem proves the full continuity result; remove the duplicate target (R03). |
| A39 continuous_wreathWitness_indexTwoInd | C₄: w=a+c along Ind has values [0,0,1,1]; both fibers are finite unions of open singletons. For general open U the coordinates factor through clopen character fibers. | Native theorem supplies the same statement (R03). |
| A40 indexTwo_exact_res1_cor1 | C₄⊇C₂,𝔽₂: res¹=0, cor¹ is an isomorphism, so image res={0}=kernel cor. S₃⊇C₂ has index 3: both maps are isomorphisms, giving image=𝔽₂ but kernel=0. | Index exactly two excludes the negative control. |
| A41 indexTwo_exact_res2_cor2 | C₄⊇C₂,𝔽₂: res² is an isomorphism and cor²=0, so image res=𝔽₂=kernel cor. For U=G index one, both maps are identities and exactness would fail. | Index hypothesis and degree-two direction are correct. |
| Remaining index-two exactness and cup kernel | C₄: ker res¹=H¹={0,χ}; χ⌣H¹=0=ker res². C₂ with U=1: χ²≠0 and res²=0, so cup image=H²=ker res². | Two different cup-square behaviors confirm the sequence. |
| A42 galoisSubgroup_conj | ℚ(√2)/ℚ: the two embeddings have the same normal stabilizer. In the S₃ splitting field of x³−2, embeddings have order-two point stabilizers; (123)(12)(132)=(23). | Normal and nonnormal examples give the claimed conjugacy, not equality in general. |
| General Evens norm degree and transitivity | Index l=1: H^q→H^q and N=id. At l=2,q=0 over 𝔽₂, 0↦0,1↦1; at q=1 the target is degree 2. A tower of indices 2 and 3 multiplies degree q to 6q on either route. | The unfinished general construction remains an owned target, not replaced by its index-two check. |
| General coefficient-ring norm | G=C₃×C₂, U=C₃, A=𝔽₃, a∈H²(U,A) a generator: res N(a)=a²≠0; res N(2a)=4a²=a², while res(2N(a))=2a²≠a². Index one gives N(a)=a. | Add the source-supported even-degree coefficient generality (R04). |
| Evens expansion, Source block | Degree-zero commutative coefficient ring ℤ, index 2, x=2: N(1+x)=9 and 1+tr(x)+N(x)=1+4+4=9. N(1+1)=4≠N(1)+N(1)=2. | Norm is multiplicative, not additive; even-degree/general-ring restriction is retained. |
| Kahn induced rank-one interpretation | H=C₂ inside C₂×C₂, character x on H and quotient character χ: induced real representation splits into characters x and x+χ, so w₂=x(x+χ)=x²+χx. | Matches the index-two norm-of-restriction formula and Kahn I.4.2. |
| Kozlowski special-cover formula | Universal double cover crossed with X, x∈H¹(X,𝔽₂): Sq¹x=x² and Sq⁰x=x, hence N(x)=x²+t x. Setting x=0 gives 0; at t=0 it becomes x². | Supports this special formula; correct the broader locator claim (R07). |
| Serre arithmetic correction | E=ℚ(√3): Tr(x²)=⟨2,6⟩, w₂=(2,3)≠0 at 3; the permutation representation has w₂=0, and (2)(d_E)=(2,3). | Theorem 1′ is not the universal D₁₆ identification; keep the correction (R07). |
| Shared/native resolution comparison, including inverse | G=1,M=ℤ: degree-zero map and inverse send 7↦7; all nested constant evaluations remain 7 in either resolution. A sign-reversed map sends 7↦−7 and violates the zero-degree law. | The intended recursive normalization is discriminating; admitted data must be removed (R01). |
| Cochain components, equivariance and differential square | G=1,M=ℤ: degree-one differential is id, so either side applied to 7 is 7; degree-zero differential gives 0=0. C₂ sign action applied to 1 gives −1 on both equivariance paths. | The intended cochain square is consistent, not a proof of the arbitrary-universe construction. |
| Compatible-pair naturality of comparison | G=H=1, coefficient map ×2: comparison then map and map then comparison both send 1↦2. Identity pair sends 1↦1. | Concrete normalization/naturality checks required by R01 and R08. |
| Cycles, boundaries and common quotient | G=1,M=ℤ: in degree 0, cycles=ℤ, incoming range=0 and quotient=ℤ; in degree 1, cycles=0 and homology=0. C₂,𝔽₂ in degree 1 has cycle generator x and B¹=0. | Use the actual range, without closure, and the special zero-degree incoming map. |
| Canonical presentations and class equations | C₂,𝔽₂: both degree-one presentations send the class x(s)=1 to the nonzero quotient class. G=1,M=ℤ,n=0: both send [1]↦1. | The zero map fails the nonzero-class check; an arbitrary presentation is not enough. |
| Vanishing and dimension normalization across the two universe choices | Same mathematical modules: G=1 gives vanishing above 0 and cdₚ=0 on both sides; G=ℤₚ gives first bound 1 on both; Cₚ has no finite bound on either side. | The transport is mathematically consistent but remains conditional on constructing the actual comparison (R01). |

The finite group checks were recomputed independently, including the eight dihedral section lifts, all 64 wreath-product pairs, all 512 wreath-product cocycle triples, and all 64 C₄ graph-cocycle triples. The other displayed values follow from the written cyclic cochain/norm formulas, explicit short exact sequences, or the stated finite-field norm exponents. These tests do not certify arbitrary groups by finite enumeration. The direct native-source proofs, the locators and the limitations below are separate evidence.

**Pinned declarations opened.** The pins inspected were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, not newer online versions. In addition to the exact owners in R02–R05, the following representative definitions/theorems were opened and compared with their use:

| Pinned file | Declaration / inspected content |
|---|---|
| `Mathlib/RepresentationTheory/Continuous/TopRep.lean:31` | `TopRep`: independent carrier universe, topological module and `ContRepresentation`; it does not itself require a topology on G or a jointly continuous G-action. |
| `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:56` | `TopRep.resolutionX`, followed by the recursive differential at line 62; iterated continuous maps, rather than an assumed uncurried complex. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean:131` | `CohomologicalDimensionLE`: quantification over discrete primary-torsion modules; the following strict predicate changes both the coefficient class and the vanishing condition. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/BoundedExponent.lean:62` | `cohomologicalDimensionAt_le_iff_boundedExponent`; native result exists, but direct substitution into the local signature exposes the hidden cohomology-universe choice. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/ClosedSubgroup.lean:80` | `cohomologicalDimensionAt_le_of_isClosed`, with its native universe choices; not declared identical by reflexivity to the local target. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro/AllDegrees.lean:410` | `isIso_shapiroMapTopRep`; line 446 gives the corresponding quasi-isomorphism. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/AllDegrees.lean:152` | `res_comp_corestriction`; line 234 gives naturality. The direction is restriction followed by corestriction. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Unit.lean:99` | `cup_one_right`, with its invariant coefficient and unit law; line 146 supplies the left-unit form. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/Identities.lean:74` | `graphClass_comp_subtype`; line 105 gives restriction and line 139 polarization on canonical classes. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Evens/DihedralPullback.lean:137` | `wreathWitness = coordA + coordC`, exactly the indicator of the four elements used in the README. |

**Source sample.** The fifteen supplied sample labels repeat only “API”, “Prerequisites” and “Source”, without distinct section IDs. I therefore inspected all 12 labelled API blocks, all 14 Prerequisites blocks, and all 20 Source blocks, instead of choosing fifteen favorable occurrences. No README locator was separately marked unverified. All eleven referenced works were submitted to the source service. Five yielded legal full text; six yielded publisher-only uncertified results. No source manifest was edited.

| Readable source and locator | Text examined and outcome |
|---|---|
| Milne, *Arithmetic Duality Theorems*, second edition, I §0, printed pp. 2–3 | `Milne line 291` and following: cup/connecting-map signs and functoriality. The sign in the second variable depends on the first degree. |
| Milne, I Remarks 0.10–0.11, printed p. 8 | `Milne line 445`: the Ext-colimit statement assumes finite generation of the first argument. `Milne line 449` through line 461: closed subgroup, continuous equivariant functions, right translation, exact adjunction, and all-degree Shapiro. One misprint is recorded below. |
| Milne, I Proposition 0.15, printed p. 11 | `Milne line 542` and following: inner conjugation with the compatible coefficient map acts trivially on cohomology. The coefficient action cannot be silently omitted. |
| Evens, §6 Propositions 1–4, printed pp. 60–62 | `Evens line 249`, line 274, line 301 and line 313: transitivity, double cosets, index-preserving naturality and multiplicativity. Their finite-index conditions match the intended finite-level norm route. |
| Evens, §7 Theorem 1, printed p. 63 | `Evens line 345` through line 359: even-degree input over a commutative G-ring; constant and linear terms are 1 and transfer. The README correctly keeps the even-degree qualification before specializing to characteristic two. |
| Kozlowski, Theorem 1.1, printed p. 309, and Lemma 2.4, printed p. 311 | `Kozlowski line 34` and following; line 126 through line 131. The total-class transfer theorem and the special-cover Steenrod formulas were distinguished; R07 corrects the overbroad locator. The proof delegated to [7] is not supplied in Lemma 2.4 itself. |
| Kahn, Theorem I.4.2, printed p. 239; Remark II.2.3, printed pp. 242–243 | `Kahn line 674` through line 683 supports the index-two induced real representation formula. `Kahn line 812` through line 832 gives the dihedral counterexample to a different generalization; it is not itself a D₁₆ factor-set computation. |
| Serre, §4.1 and Theorem 1′, printed pp. 667–668 | `SerreWitt line 519` through line 562: signed permutations, the universal class, and the separate arithmetic correction. R07 distinguishes their roles. |

The five legal copies came from Milne's author site, Kahn's institutional author page, the Collège de France institutional collection for Serre, and the AMS publisher archives for Evens and Kozlowski. Their source-service keys are respectively `Milne`, `Kahn`, `SerreWitt`, `Evens`, and `Kozlowski`. Source references above refer to the service's numbered extractions. The Milne misprint was additionally checked on a rendered image of printed page 8, not inferred from extraction alone.

**Ownership and supplier direction.** Object searches used `roadmaps grep`, `roadmaps show` and local searches of the main roadmaps, the supplied open heads and available board packages for continuous cohomology, cohomological dimension, Shapiro, cups, class modules and the Evens norm. I read the main `RepresentationTheory/InductionRestriction` roadmap and the completed `ProfiniteProPGroups` and `LocalGaloisGroups` roadmaps as shape/ownership context. The open `ProfiniteProPGroups` head supplied in the brief was read separately, rather than treating its changes as an available supplier.

The sole external roadmap supplier named as such here is `RepresentationTheory/InductionRestriction`, for its algebraic finite-index comparison. Its main README, `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:102`, lists restriction and induction; the coinduction/finite-index contract at lines 111–118 supplies `Rep.indCoindIso` and the algebraic adjunctions. This supports the mathematical object cited at the target's lines 194, 1239, 1296 and 1322. The target should give the precise section in its reorganized contracts. It does not import a sibling Lean module in `Suggested.lean`.

`Completed/ProfiniteProPGroups/README.md:36` assigns continuous cohomology to this owner and consumes it; the same document's frozen-interface table distinguishes the abstract pro-p group carriers. `LocalGaloisGroups` consumes the dimension/class-module interface; it is not a supplier of those theorems. The target's `QuadraticFormInvariants` references concern the downstream interpretation as Stiefel–Whitney classes, rather than a prerequisite for the cohomological graph construction. `TauCetiRoadmap/QuadraticFormInvariants/README.md:529` assigns continuous cohomology and the norm to this owner; its contract at line 693 records the field-extension application. `Completed/LocalGaloisGroups/README.md:133` records the class-module consumption, and `TauCetiRoadmap/ClassFieldTheory/README.md:1295` supplies the downstream arithmetic instance `scd_p_absoluteGaloisGroup_eq_two`. The board object searches likewise found consumers, not a competing owner of the general continuous-cohomology construction. The substantial duplication found is with the pinned library, as R03 records. No new ownership move to a later roadmap is needed.

The mechanical dependency check, run with the requested `--movable` option, returned:

```text
depcheck: 162 roadmaps, 1170 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No declared supplier gaps were supplied. No external prerequisite was established to be unowned. The internal integration-order corrections in R08 do not change this output. There are no findings of copied source passages or a computational algorithm as a deliverable. R04 identifies a consumer-driven restriction of the norm to mod-2 coefficients. The finite computations above are review witnesses and README-style Checks, not an algorithmic replacement for the general norm theorem.

## Not verifiable

- **NSW**, *Cohomology of Number Fields*, second edition: the service resolved the work to the paywalled Springer publisher and returned `uncertified`. The detailed I §§2–7, III §§3 and 6, and VI §2 locators, including the proof steps for the single-prime class-module refinement, were not checked against the book's text. The refinement has been tested on the displayed examples and its signatures inspected; it has not thereby been certified from NSW.
- **RZ**, *Profinite Groups*, second edition: publisher-only `uncertified`; Proposition 2.2.2, Corollary 6.5.6(a), Theorem 6.10.5 and the other cited section/number matches were not text-verified. Native implementations and Milne provide independent evidence for several corresponding statements.
- **SerreGC**, *Galois Cohomology* (1997): publisher-only `uncertified`; I §2.2 Proposition 8 and the other chapter references were not read in that edition.
- **SerreLF**, *Local Fields* (1979): publisher-only `uncertified`; VII §7 Proposition 6, XIII §1 and the other numbered locators were not text-verified.
- **Koch**, *Galois Theory of p-Extensions* (2002): publisher-only `uncertified`; Theorems 3.9, 3.10, 3.14, 3.16 and the chapter 5/6 references were not text-verified.
- **Brown**, *Cohomology of Groups* (1982): title search did not yield a readable copy; the DOI `10.1007/978-1-4684-9327-6` resolved as publisher-only `uncertified`. III §§9–10 and V §3, including their precise proposition numbers, were not read. Native cochain formulas were checked separately.
- **Kozlowski's delegated proof:** Lemma 2.4 points to his separate paper *The transfer in Segal's cohomology*. The cited lemma's statement was read, but its delegated proof was not reconstructed from that other paper. No claim that the missing proof is a gap in Kozlowski is made.
- **Ownership coverage limit:** locally readable main roadmaps, supplied open heads and locally available board packages were searched. This is not a certification of private or unavailable board-PR contents. No absence finding depends on an inaccessible checkout. The non-unique seeded labels also do not permit reconstructing which fifteen individual blocks the worker originally selected; the broader block inspection above states the coverage actually achieved.

These are verification limits, not renewed requests for settled paywalled texts. The scratch missing-reference list contains no outstanding request after the five legal copies and six uncertified outcomes were resolved. The verdict is already determined by R01–R04, independently of unavailable books.

## Source issues

- **Misprint** in Milne at I Remark 0.11, printed p. 8: the source says the adjunction target has arguments H and N; it should be Hom_H(Res_H N, M); affects a stated result.
