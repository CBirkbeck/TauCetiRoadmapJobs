# Repair report

Section numbers below refer to the revised README unless explicitly called old numbers. The review was treated as mathematical claims, not as instructions. No source passages were copied.

## F01 (P1) — not actionable in this package: the pairing supplier must extend its perfectness theorem

Implicit perfectness input → gap:neron-pairing-perfect-finite-residue in Exact supplier contracts and the plan’s top-level gaps list. Section 2.11 names it and ReductiveGroupsPartII RG2.3.7 explicitly. NeronModelsAndSemistableAbelianVarieties §4.6 excludes perfectness beyond semistable reduction; only that owner can close this gap. Lorenzini’s attribution and deduction are verified at torsion_and_tamagawa_numbers line 1545 and line 1555.

## F02 (P2) — applied

Independent parametrization/determinant route → rational counting corollary of AbelianSchemesAndArithmeticModuliPartII B2.6 with b=0. Deleted old §§6.23–6.24; placed block containment before the corollary (§§6.17–6.18). Scope and both supplier/dependency summaries agree. Pila’s Theorem 3.5 gives the required singleton-block bound (on_the_algebraic_points_of_a_definable_set line 265). Kept the acceptance theorem pila_wilkie.

## F03 (P2) — applied

Missing headlines → nonpowers_diophantine (§4.31) and bounded_degree_counting (§6.20), with finite polynomial systems and explicit coordinatewise algebraicity, degree and absolute height. Added discriminating README Checks, including transcendental junk values. Named §4.26’s missing computable sentence adapter. Evidence: le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres line 568; on_the_algebraic_points_of_a_definable_set line 380; Mathlib/NumberTheory/Height/NumberField.lean:136.

## F04 (P3) — applied

Unused branches → deletion of old §§0.3–0.4, 0.7, 1.6, 1.8–1.9, 1.11–1.12, 1.17–1.18 and 6.10–6.15. Removed their exclusive scope claims, conventions, examples and supplier/dependency text, plus the wider-sector headline obstruction. No Dittmann–Pop endpoint or replacement theorem was added. Native ultraproduct inputs remain directly consumed by Ax–Kochen transfer.

## F05 (P3) — applied

Stale Layer 6 ownership and marked-path example → deletion; Layer 6 Dependencies now includes B2.6. Layer 5 Dependencies no longer lists unrelated §§4.12, 4.17 or 4.19. The same ownership correction is reflected in Scope, Exact supplier contracts and How to read the build. The retained semirational example describes the supplied theorem only.

## F06 (P3) — applied differently

Former declaration labels → explicit subsection references throughout Layers 2–5 and 7. Fixed §3.11’s sentence and the fixed-prime target’s own Needs line; moved trailing Checks before Needs. Deleted the parametrization paragraph with its entire duplicated target. Renumbered subsections consecutively, updated links, source cited_for fields and Lean locators; block containment precedes its counting corollary.

## F07 (P3) — applied

Ambiguous frontier convention → topological boundary, closure minus interior, in Conventions, §6.1 and IsOMinimalExpansion’s docstring. Section 6.5 separately identifies the closure remainder. Added the computed integer-set negative control: boundary(ℤ)=ℤ, whereas closure(ℤ)∖ℤ=∅. Mathlib/Topology/Defs/Basic.lean:129 defines the exact boundary used by the acceptance predicate.

## F08 (P3) — applied

Nonsquare locator 21(a) → Proposition 21(b), p.88; Denef’s single-theorem locator → Theorems 1.1–1.2, agreeing with §2.6. Verified the former at koenigsmann_defining_z line 712. The README’s broader Proposition 21(a)–(e) locator covers its several distinct assertions and remains appropriate.

## F09 (P3) — applied differently

Wrong Denef identity → corrected through the sources service under the same key and DOI 10.1007/BF01389133, retaining uncertified status. Fixed Lorenzini/BLR locators; CGH now consistently cites cached arXiv v2 pagination. Updated dependent citation ranges. F01 uses the supplier-gap alternative, so no direct McCallum citation or owned perfectness target was introduced; Lorenzini supports the gap specification.

## F10 (P3) — applied

Nonexistent/misplaced locators → van den Dries–Miller §2.5 plus the p.9 definition and 4.8, p.13. The analytic-decomposition sentence now asserts only R_an,exp, exactly as needed by §6.14. General G/M cites van den Dries (2.18), p.167; BKT’s narrower semisimple case is distinguished. Evidence: geometric_categories_and_o_minimal_structures line 370, line 509, line 530; bkt line 300 and line 322.

## F11 (P3) — applied

Roadmap-supplied rational height → pinned Rat.mulHeight₁_eq_max in Exact supplier contracts and §6.16, with its file and line 532. The rationalTupleHeight docstring identifies each coordinate term with Height.mulHeight₁. DiophantineApproximationAndTranscendence §§0.2–0.3 remains responsible for the nontrivial algebraic-height comparison and Northcott. Values −3/4↦4, 0↦1 and ()↦1 agree with both conventions.

## Validation outcomes

- Required acceptance-file elaboration, run from the content checkout on packages/LogicAndDefinabilityInNumberTheory/Suggested.lean: exit 0, exactly ten “declaration uses sorry” warnings, no errors. The individual Tau Ceti semialgebraic module’s object already exists; no build was necessary. The file has ten headline theorems and five real definitions, one import Mathlib and the single used Tau Ceti module, and no option overrides, examples or sorry-defined data.
- One scratch file containing the acceptance declarations followed by `#check @name` for all fifteen declarations elaborated with exit 0 and the same ten expected warnings. Every elaborated signature was compared with its README target. No section binder disappeared. In particular, nonpowers retains Field, NumberField and r>1; both counting statements retain the language structure, o-minimality, definability, ε>0 and T≥1; bounded-degree counting additionally retains k≥1 and all three coordinate conditions. No binder repair was required.
- The required dependency command exited 0 and printed exactly:

```text
depcheck: 50 roadmaps, 585 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line for this package.

- Citation resolution against main and the indexed open heads reports no missing cross-roadmap citations and no missing Lean names. Its remote-library inventory is unavailable on its host, so library evidence was checked directly in the provided pinned checkout. The initial Diophantine.mrdp lead is this roadmap’s own namespaced declaration, confirmed by the signature probe, rather than a claimed Mathlib theorem.
- All internal heading anchors resolve; all eight layers have consecutive subsection numbers. Each of the fifteen Lean names occurs in the README. sources.toml parses with 43 unique source keys. The new design/plan.json contains only the permitted top-level gaps list, with the matching slug, needs, supplier and section. No other plan field was created or altered.
- Supplied gate failure tex=2 → tex=0: enclosed the character-group expression in §2.11 and the indexed definable-family symbol in §6.18 in inline code spans. The installed scanners report latex=0 and tex=0 across the entire README. Removing the four added backticks recovers the preceding README exactly, so all mathematical statements and computed Checks are unchanged. Repeated acceptance elaboration exits 0 with exactly ten expected sorry warnings; repeated dependency checking prints the same zero-problem output above.
- `git diff --check` exits 0. Only the permitted package files and this required report were changed. metadata.toml is unchanged. No commits or network writes were made.

## Source and ownership evidence

The native library revisions match lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Mathlib/NumberTheory/Height/NumberField.lean:136 returns 1 off the algebraic domain despite its docstring saying 0; line 532 supplies Rat.mulHeight₁_eq_max. Mathlib/FieldTheory/Minpoly/Basic.lean:41 returns the zero polynomial off integral elements. Mathlib/ModelTheory/Encoding.lean:31 explicitly lists primitive computable term/formula encodings as missing. TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean:68 defines the Boolean-algebra predicate, without projection closure or a positive-dimension hypothesis. The acceptance definition supplies connectedness and two distinct points itself.

The finite-system interpretation of nonpowers is supported directly by le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres line 37 (closed affine presentation) and line 568 (the number-field theorem). The stronger bounded-degree family result is on_the_algebraic_points_of_a_definable_set line 380. Its coefficient-height convention is transported to absolute height with the explicitly imported Mahler comparison: H_coeff≤2^k T^k, so using a counting exponent η<ε/k gives a constant times T^(kη)≤T^ε. No same-field-degree assumption is imposed on a tuple.

All seventeen cited supplier roadmaps were resolved and their cited sections inspected. For existing roadmaps, the main copies were used, including SchemeAndStackFoundations §§0.7 and 2.20, DifferentialGeometry’s boundary interface, RealAlgebraicGeometry Layers 3 and 6, QuadraticFormInvariants Layer 2 and §6C, GlobalQuadraticForms §§4.1–4.4, 5.5 and 6.1, DiophantineApproximationAndTranscendence §§0.2–0.3, Chebotarev Layer 14 and ClassFieldTheory Layers 5 and 10–13. For new roadmap folders, the supplied open-head index was queried with roadmaps show: NeronModelsAndSemistableAbelianVarieties §§2.5 and 4.6, ReductiveGroupsPartII RG2.3.7, AbelianSchemesAndArithmeticModuliPartII B2.6/B2.7/B2.14/B2.15/B2.18, AdelicAlgebraicGroups §2.4, MotivesAndAlgebraicCycles §4.20, HeightsRationalPointsAndObstructions §§2.16b–2.21, ResolutionOfSingularitiesCharacteristicZero §6.2, WeilConjectures’ curve estimate, and ShimuraVarieties §§3.5a, 3.5d and 3.6. The supplier hypotheses were retained.

Ownership searches by object used roadmaps grep across indexed open heads and main, plus the board packages and both pinned libraries. The pairing and Lang theorem remain with their named owners; block-counting machinery remains with B2.6. No other owner was found for the number-field nonpowers or absolute-height counting corollary. The new declarations use this roadmap’s own namespace and native carriers, without another roadmap’s fully qualified names. The Mathlib Dioph source’s missing full MRDP and polynomial bridge remain this roadmap’s existing work, not new scope.

The style comparison used the main roadmaps ComplexTori, PadicMeasuresIwasawaAlgebras and AdicEtaleGeometry. The sources cache now contains OCR of Pas: pas_1989 line 166 records the equicharacteristic-zero setting; it is no longer an unread image-only source. Waived and uncertified sources retain their settled status. The corrected Denef source remains uncertified. A legal-source lookup for McCallum did not expose a readable text; the gap alternative does not cite or require that work as a source of a target here, so it leaves no outstanding reference request. No source text was stored in the repository.

## Adversarial mathematics pass

These are computed tests and short mathematical deductions, not claims of independent acceptance or proofs of the deep theorems. The rows cover retained target statements, their defining conventions and the changed acceptance signatures. Source-certified statements retain their full hypotheses; waived/uncertified citations remain such. Numerals for trivial finite groups below mean cardinalities, so a trivial group has order 1.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Quotient-interpretation convention | Fraction representatives; nonfunctional graph | (1,2) and (2,4): 1·4=2·2=4; outputs 0≠1 | Equality descends; bad graph rejected | Retained |
| Parameter and sort conventions | One named parameter; three tagged zeros | Parameter tuple retains length 1; VF-zero≠RF-zero as tags | Parameters/sorts remain explicit | Retained |
| Valuation/zero convention | t³(2+t), characteristic 0; same expression in characteristic 2 | Orders 3 and 4; angular components 2 and 1 | Zero/nonzero guards matter | Retained |
| Haar normalization | q=2, O, πO, O² | Masses 1, 1/2, 1; π has norm 1/2 | Scaling direction fixed | Retained |
| Tensor-density convention | π²(dx)⊗2 at q=2; zero section | Square root of 1/4 is 1/2; zero gives 0 | No extra tensor exponent | Retained |
| Base-first relative forms | a=xy on x≠0 | da∧(−dx/x)=dx∧dy; da∧(dx/x)=−dx∧dy | Negative sign required | Retained in §§2.13, 5.4 |
| Motivic denominator convention | q=2 and q=1 | (1−1/2)⁻¹=2; at q=1 denominator 0 | q>1 excludes junk division | Retained |
| Natural/integer polynomial convention | X−2Y at (1,3); no variables | −5=1−6; C(−7)=−7 | Signed coefficients retained | Retained |
| General ring versus sums of squares | ℂ, (1,i) | 1²+i²=0 although neither entry is 0 | Single equation requires formal reality | Retained |
| Restricted analytic convention | Constant-one representative, inputs 1 and 2 | Restricted values 1 and 0 | Closed-cube convention fixed | Retained |
| Chart direction convention | φ₁(u)=u and φ₂(u)=2u | φ₂⁻¹φ₁(2)=1, while φ₂φ₁⁻¹(2)=4 | Inverse direction distinguished | Retained |
| Boundary convention | ℤ⊂ℝ; line in ℝ² | Boundaries ℤ and the line; closure remainders both ∅ | Conventions distinguished | Repaired F07 |
| Rational tuple-height convention | −3/4, 0, empty tuple | max(3,4)=4; max(0,1)=1; max(1,0)=1 | Native and displayed heights agree | F11 locator/docstring |
| Algebraic degree convention | (√2,√3) | Individual degrees 2,2; joint degree 4 | Coordinatewise degree is essential | Added Check |
| Uniform constant convention | One-point family, T=1; empty fibre | Counts 1≤C and 0≤C | C≥1 suffices for degenerate fibres | Added Checks |
| §0.1 Quotient interpretation | ℤ fractions and a two-valued graph | Cross products 4=4; two output classes 0≠1 | Both quotient and uniqueness laws tested | Retained |
| §0.2 Semantic transport/composition | ∃y, 2y=1 in Frac ℤ; identity composition | Witness (1,2) gives 2·1=2; translated truth true=true | Witness stays in legal domain | Retained |
| §0.3 Fraction-field operations | (−1,2)+(1,2); denominator 0; field base | (0,4)~(0,1); (1,0) excluded; a/b=ab⁻¹ | Sum, equality and domain agree | Renumbered |
| §0.4 Arithmetic bridge | 2·(1/2)=1; denominator-zero candidate | 2a=b gives 2=2 at (1,2); (1,0) fails domain | Guards preserved | Renumbered |
| §1.1 Denef–Pas adapter | Value-sort residues 3 and 2 modulo 2 | 3≡1 true; 2≡1 false; ac(RF-variable) ill-sorted | Sort adapter discriminates | Retained |
| §1.2 Angular components | π′=επ; π and π³u | ac′(π)=res(ε)⁻¹; ac′(π³u)=res(ε)⁻³res(u) | Uniformizer dependence explicit | Retained |
| §1.3 Relative elimination | ℂ((t^ℚ)); ℚ₂ | Residue characteristics 0 and 2; value groups ℚ and ℤ | First meets characteristic-(0,0) hypothesis; second does not | Retained |
| §1.4 AKE | ℂ((t)) and its algebraic part over ℂ(t) | Both have residue ℂ and value group ℤ; same selected theories | No completeness hypothesis silently added | Retained |
| §1.5 Eventual transfer | ∃x, x²+1=0 at p=2,3,5 | At 2: false/true; at 3: false/false; at 5: true/true | A fixed exceptional set is necessary | Retained |
| §2.1 Cell definition | q=2 and q=3; ξ=0 | Fixed angular unit masses 1/2 and 1/3; q−1 pieces total 1−q⁻¹; ξ=0 rejected | Angular coordinate retained | Retained |
| §2.2 Uniform preparation | f=0 and f=1 in equicharacteristic zero | Zero piece has no finite order; constant-one piece has order 0 | Nonzero guards survive partition | Retained |
| §2.2 Fixed-prime preparation | x²+y² over ℚ₂; ℚ₂(√2) | Only zero (0,0), since −1 is not a square; ord(√2)=1, ord(2)=2 | Dyadic and ramified cases included | Independent Needs added |
| §2.3 Constructible functions | Ray q⁻ⁿ at q=3; constant 1 on F | Sum 3/2; Haar integral of 1 on F is ∞ | Algebra membership does not imply integrability | Retained |
| §2.4 Local integration | q=2, one-cell order 1; constant integrands 0 and 1 on F | Cell mass 2⁻²=1/4; integrals 0 and ∞ | Absolute integrability indispensable | CGH locators corrected |
| §2.5 Change of variables | x=πu, q=2 | μ(πO)=1/2=∫_O 1/2 | Jacobian uses q^(−ord), not its inverse | Retained |
| §2.6 Zeta/tail identity | f=0 and f=1 | Z=0,A=1/(1−T): 0=0; Z=1,A=1: T=T | Zero polynomial and level zero included | Locator repaired |
| §2.6 Congruence rationality | f=x; f=π | A=1/(1−q⁻¹T), Z=(1−q⁻¹)/(1−q⁻¹T); A=1+T,Z=T | TZ=1+(T−1)A in both cases | Retained |
| §2.7 Gauge measure | dx on O; π²(dx)⊗2; zero; unit multiple | Volumes 1, q⁻¹, 0, 1 | Density and gauge distinction tested | Retained |
| §2.8 Null loci | Point in A¹; point intrinsically; square-zero thickening | Ambient mass 0; intrinsic counting mass 1; nonreduced scheme excluded | Intrinsic/ambient measures distinguished | Retained |
| §2.9 Weil volume | G_a, G_m; GL₂ at q=2 | q/q=1; (q−1)/q; 6/2⁴=3/8 | Point-count denominator q^dimension fixed | Retained |
| §2.10 Finite quotients | Split degree-2 free cover; squaring over ℚ₃ | Upstairs mass 2v gives v; 2 mod 3 is nonsquare, no lift | Only rationally lifted image counted | Label repaired |
| §2.11(a) Prime-to-p extension | Degree 1; good supersingular special fibre of degree p | Identity differential 1; inseparable special-fibre differential 0 | Prime-to-p used for étaleness | Retained |
| §2.11(b) Connected counts/Lang | Kernel ℤ/3 with Frobenius −1 | Kernel of σ−1 has order 1; cokernel also order 1 | Isogenous connected point counts equal | Lang supplier named |
| §2.11(c) Dual component counts | Φ=ℤ/3, σ=−1; S₃ on 𝔽₃³/diagonal | Cyclic invariants/coinvariants 1=1; noncyclic example 1≠3 | Perfectness plus cyclicity, not geometric order alone | Explicit supplier gap |
| §2.11 Point-count consequence | Good reduction; split Tate curve n=3,q=5 | Component order 1; Tate count 3·(5−1)=12 on both dual sides | Product formula recomputed | Retained |
| Perfectness gap contract | Zero component groups; ℤ/3 with pairing rs/3 | Zero groups are mutual duals; pairing of (1,1)=1/3 detects nonzero class, zero pairing does not | Required perfectness excludes zero pairing | Supplier must prove general case |
| §2.12 Dual isogeny volume | ω=0; φ=id, good reduction | 0=0; #A(k)/q^g equals itself | No finite-flat assertion on whole model | Renumbered |
| §2.13 Relative Fubini | Product map a=xy, v(a)=1,q=2 | Relative form −dx/x; two shells each 1/2, total 1 | Sign and density agree | Renumbered |
| §3.1 Subassignments | ∀y y²≠−1 and ∃y y²=−1 over ℝ⊂ℂ | First {⋆},∅; second ∅,{⋆} | Quantified truth need not give subfunctor | Retained |
| §3.2 Scissor semiring | Residue line; two points over one point | L=(L−1)+1; direct image 1↦2, but 2²=4≠2 | Direct image additive, not multiplicative | Retained |
| §3.3 Coefficient ring/positive cone | L−2 at q=3/2; denominator at q=1 | −1/2<0; 1−1=0 | Positivity and denominator restrictions tested | Retained |
| §3.4 Presburger sums | Empty fibre; even nonnegative indices, q=2 | 0; ∑4⁻ᵐ=4/3=(1−1/4)⁻¹ | Empty and congruence cases agree | Retained |
| §3.5 Tensor motivic functions | Indicator in either tensor factor; empty base | Same indicator value 1; C(∅)={0} | Common-generator identification tested | Retained |
| §3.6 Dimension grading | Singleton; graph of a one-variable map | Counting grade 0 gives 1, ambient grade 1 gives 0; graph total/relative dimensions 1/0 | Support grading discriminates | Retained |
| §3.7 Motivic pushforward | One-cell α=0; disjoint two-point RF fibre | L⁻¹ specializes to 1/2 at q=2; RF pushforward 1↦2 | Volume and additivity agree | Retained |
| §3.8 Motivic substitution/Fubini | x↦tx on O; two independent O variables | ∫_(tO)1=L⁻¹=∫_O L⁻¹; either product order gives 1 | Jacobian direction and order checked | Retained |
| §3.9 Specialization | L⁻¹; (L−1)L⁻¹, q=3 | 1/3; 2/3 equal annulus/unit volumes | Coefficient maps agree | Retained |
| §3.10 Integral transfer | φ=ψ=1_O, equal residue sizes | Both universal identities reduce to 1=1 | No arbitrary parameter bijection used | Retained |
| §3.11 Motivic realization | G_m; P¹; Tate even shift | Images [ℚ(1)]−1 and 1+[ℚ(1)]; shift [2] contributes sign +1 | Scissor and sign conventions agree | Garbled sentence repaired |
| §4.1 Polynomial map | X₀−2X₁ at (1,3); constant −3 | Native values −5 and −3 equal polynomial values | Ring-map values correct | Retained |
| §4.2 Evaluation theorem | Same signed polynomial; empty variables | −5=−5; C(−7) gives −7=−7 | Full signed evaluation tested | Retained |
| §4.3 Surjectivity | Native constant −2 and projection | Preimages C(−2), X₀ give values −2,x₀ | No syntax algorithm inferred | Retained |
| §4.4 Injectivity | X(X−1) versus zero | Values at 0,1,2 are 0,0,2 versus 0,0,0 | Finite Boolean sampling insufficient | Label replaced |
| §4.5 Ring equivalence | Empty variables; X₀(X₀−1) at 2 | ℤ≃ℤ; both evaluation paths yield 2 | Inverse/evaluation compatible | Label replaced |
| §4.6 Renaming | Collapse X₀−X₁ to one variable | X−X=0; original evaluation on (2,2) also 0 | No injective-map assumption | Label replaced |
| §4.7 Finite support | X_inl(a)+3 with infinitely many possible witnesses | Witness support ∅; value x(a)+3 unchanged | Free coordinates fixed | Retained |
| §4.8 Witness enumeration | Empty witness support; two-element support | m=0; m=2 with bijective enumeration, same two coefficients | Enumeration preserves input block | Label replaced |
| §4.9 Root preservation | u−v−1; injective extension versus collapse | Root (1,0) gives 0; collapsed equation gives −1 | Both directions require injectivity for extension | Label replaced |
| §4.10 Finite normal form | x−2y; constant 1; empty witness block | x=4,y=2 gives 0; x=3 no natural root; 1 never 0 | Finite witnesses do not mean tautology | Labels replaced |
| §4.11 Syntax coding | Code X−2 at 0; empty tuple | Decoded/evaluated value −2=−2; exactly one empty assignment | Code and function not conflated | Retained |
| §4.12 Diophantine implies RE | Even-number relation x=2y | Input 4 has y=2; input 3 has no natural witness | Semidecision behavior matches set | Retained; Davis uncertified |
| §4.13 Sequence coding | List (1,2,3), y=6 | Moduli 7,13,19 have pairwise gcd 1; x=288 has remainders 1,2,3 | CRT coding computed | Label replaced |
| §4.14 Bounded universals | n=0; P(i) iff i=0, n=1 and 2 | Empty block true; one-index block true; two-index block false | Bound and indexing tested | Retained; Davis uncertified |
| §4.15 Computation graphs | Zero-step constant output; minimization after divergence | Constant-zero graph gives y=0; if evaluation at index 0 diverges, index 1 is not a valid least successful computation | Earlier termination not omitted | Retained |
| §4.16 MRDP | n=0, empty and full subsets | Constant equations 1=0 and 0=0 realize ∅ and {()}; both predicates RE | Arity-zero case correct | Retained |
| §4.17 H10 over integers | Natural value 7; integer negative input | 7=2²+1²+1²+1²; sums of squares cannot give −1 | Integer/natural reduction checked | Retained |
| §4.18 General-ring Diophantine sets | ℂ conjunction; ℤ/6 domain test; ℚ inverse | 1+i²=0; 2·3=0 with neither zero; xz=1 exactly x≠0 over ℚ | No domain/formal-reality assumptions smuggled | Retained |
| §4.19 Effective interpretation transfer | t=1/2 represented by coprime integers | 1·1+0·2=1 and denominator 2≠0 | Rational guard satisfiable, zero denominator rejected | Retained |
| §4.20 Quaternion trace | Norm-one point (1,0,0,0); real division algebra | Trace 2; real trace interval [−2,2] | Positivity guards constrain local trace | Retained |
| §4.21 Local trace theorem | Dyadic pair (6,15) | −6−15+90=69≡5 mod 8; −21≡3 mod 8 | Dyadic distinctions retained | Retained |
| §4.22 Semilocal rings | Class guard at 3; off-guard 5; (p,q)=(1,3) | R³₃=ℤ_(3); R³₅=ℤ_(2); R¹_(1,3)=ℚ | Dyadic correction and empty intersection tested | Retained |
| §4.23 Radical formulas | ℤ_(3); field ℚ | Jac=3ℤ_(3); Jac(ℚ)={0}, while empty prime intersection is ℚ | Empty-support branch separated | Retained |
| §4.24 Prime parameters | p=3,−3,1 | 3 positive and class 3; −3 fails positivity; 1≡1 rather than 3 mod 8 | Guards exclude wrong models | Retained |
| §4.25 Universal integer definition | Single support {3}; x=1/3,1/5,0 | Inverse 3 lies in 3ℤ_(3), inverse 5 does not; 0 has no inverse witness | Truth values false,true,true | Retained |
| §4.26 Rational theory fragment | Sentences with X²=4 and X²=2 | Rational roots ±2 in first; no rational roots in second | Distinct semantic answers; effective encoding still required | Obstruction named in Lean |
| §4.27 Square-detection union | p=17; p=17·41 | S₁₇=ℤ_(17); 1/17∈ℤ_(41), hence in union for product parameter | Union cannot become intersection | Retained |
| §4.28 Nonsquares/nonnorms | 0,−1,4; 2/11 | 0=0², 4=2² excluded; −1 included; odd valuations of 2/11 prevent squareness | Nonzero complement convention verified | Locator repaired |
| §4.29 One universal variable | t=0 versus t=1/2 | Integer predicate true at 0; false at 1/2, hence some universal assignment has no witness | Quantifier order not reversed | Retained |
| §4.30 Normic zero-cycles | p=3; symmetric degree 1 | 2p+1=7 and 7−2·3=1; Sym¹U=U | Coprime-degree argument computed | Renumbered |
| §4.31 Number-field nonpowers | ℚ,r=2 at −1,4,0; r=3 at 2,−8; r=1 | In,out,out; in,out since v₂(2)=1∉3ℤ and (−2)³=−8; r=1 complement ∅ | Zero and odd exponents handled | Headline/Checks added |
| §4.32 Existential closure/model completeness | Identity embedding; ℚ⊂ℝ | Identity preserves all existential truths; X²=2 is false/true | Proper embedding negative control | Renumbered |
| §4.33 Rational-model preservation | n=1; n=3 and 8 | K¹=K; 8=2³ already in K³ | Positive exponents include 1; no new roots inferred unconditionally | Renumbered |
| §4.34 Two universal variables | a=−1,u=(1,0,0,0); highest monomial | a+A=0; a²b²u₄⁸ has coefficient 1 and total degree 12 | Guard and degree conventions agree | Renumbered |
| §5.1 Normalized densities | Whole O^d; x∈πO; n=0 | q^(dn)·q^(−dn)=1; mass q⁻¹; quotient has one class | Raw counts not probabilities | Retained |
| §5.2 Uniform identities | Identical zero constructible expressions | 0=0 in each specialization | Universal identity, not unrelated pointwise comparison | Label replaced |
| §5.3 Zeta/local-factor interface | f=x,q=2,s=1 | (1−1/2)/(1−1/4)=2/3 equals ∫_O abs(x) | T=q^(−s) normalized | Retained |
| §5.4 Product-map fibre integral | q=2 and 3; v(a)=1 at q=2 | Residue counts 3 and 5; fibre mass 2·1/2=1; total 4·(1/4)·3=3 | Singular fibre not assigned smooth relative form | Retained |
| §6.1 O-minimality/boundary | (0,1), {0}, ℤ, ∅ | Boundaries {0,1}, {0}, ℤ, ∅ | ℤ rejected; finite interval unions accepted | Convention/Check repaired |
| §6.2 Analytic expansions | Constant-one restriction; unrestricted sin(πx) | Values at 1,2 are 1,0; sine zero set ℤ | Restricted symbols distinguished from global sine | Locator repaired |
| §6.3 Selected o-minimal structures | Ordered-field reduct of R_an,exp; exp(0) | Reduct unary sets remain finite interval unions; exp(0)=1 in common expansion | Reduct argument does not need R_an analytic decomposition | Restriction repaired |
| §6.4 Cell decomposition | Unit disk sliced in x; empty set | Interior fibres (−√(1−x²),√(1−x²)); endpoint fibres collapse to 0; empty set uses no cells | Cylindrical endpoint cases included | Page locator repaired |
| §6.5 Dimension/choice/topology | Closed line in ℝ²; map {0,1}→{0}; (0,1) | Closure remainder ∅ has dimension −∞<1; right inverse chooses 0, no left inverse; open simplex not compact | Boundary, inverse and triangulation claims separated | Terminology repaired |
| §6.6 Finite definable atlases | id and dilation 2; closed quadrant; infinite discrete charts | Transition at u=2 is 1; quadrant depth 2 at vertex; countably many singleton charts not a finite atlas | Mixed charts/finite atlas conditions discriminate | Retained |
| §6.7 Abstract boundary | Quadrant vertex; interior point | Fibres have sizes 2 and 0 | Boundary immersion need not be injective | Retained |
| §6.8 Compact corners | [0,1]; two overlapping rescaled analytic charts | Boundary {0,1}, two points; mixed coordinate affine maps remain restricted analytic | Compact finite refinement agrees | Retained |
| §6.9 Quotients | Diagonal ℝ; [0,1]²; two classes {0},ℝ∖{0} | Quotients ℝ and one point; (1,1/n)→(1,0) leaves third relation | Closed/proper relation hypotheses needed | General G/M locator repaired |
| §6.10 Algebraic definable structures | ℂ, P¹ and node xy=0 | ℂ becomes ℝ²; overlap sends 2↦1/2; node has two branches | Singular locus not a manifold | Renumbered |
| §6.11 Analytic closure | ℂ∖{0}; punctured node branch; E=Y | Closures ℂ, branch y=0, ∅ | Relative closedness/empty case agree | Checks moved, renumbered |
| §6.12 Definable Chow | {1}⊂ℂ×; ∅; whole Y | Ideals (z−1), (1), (0) | Closed analytic algebraic examples recovered | Checks moved, renumbered |
| §6.13 Dense continuous extension | f=0 on dense U; f=1/x on ℝ∖{0} | Extension 0; limits ±∞ give no real extension of second | Existence is a hypothesis | Renumbered |
| §6.14 Finite algebraic-union reduction | Two algebraic axes; rational points in ℂ | Union of two axes is already a finite subunion; countably many rational singleton members give ℚ, not definable | Definability and analytic-cell hypothesis used | Renumbered |
| §6.15 Algebraic part | Interval, singleton, two-point set, n=0 | Parts are interval, ∅, ∅, ∅ | Connectedness and positive dimension required | Renumbered |
| §6.16 Counting heights | −3/4; (−3,2); 0; () | Heights 4,3,1,1, equal native coordinate maxima | Rational normalization agrees | Mathlib supplier replaces roadmap |
| §6.17 Blocks | Interval; constant image; exp graph | Interval has dimension 1; constant image is one point of dimension 0; exp graph not a semialgebraic image map | Positive-dimensional images, not sources, contribute | Moved before corollary |
| §6.18 Rational counting | Interval fibre; rational singleton; empty tuple fibre | Counts outside algebraic part 0, at most 1, 1 | b=0 covering leaves only singleton blocks | Supplier route/Checks added |
| §6.19 Integral/image corollaries | (−3,2); constant and identity on interval | Height 3=max abs coordinate; image dimensions 0 and 1 | No height claim for arbitrary images | Renumbered |
| §6.20 Bounded-degree counting | √2; (√2,√3); transcendental x; n=0 | Degree 2, height √2≤2; degrees 2,2 versus joint 4; junk height 1 and minpoly degree 0; empty tuple count 1 | Algebraicity and coordinatewise bounds required | Headline/Checks added |
| §6.21 Orbit-count bridge | c=C=A=δ=1, counting constant 1, ε=1/2,D=100 | 100 lifts exceed 100^(1/2)=10 singleton blocks | Positive block forced | Renumbered |
| §7.1 Input datum | g=1,D=−3; global versus restricted uniformization | Re lift −1/2 has height 2≤3; Im lift root of 4X²−3; whole orbit fibre infinite | Fixed fundamental set and degree bound used | References updated |
| §7.2 Exceptional CM points | V={1728}; V=A₁ | Exceptional special-point sets have sizes 1 and 0 | Promotion/conjugation clauses applied to actual lifts | Labels replaced |
| §7.3 Dimension induction | Singleton CM versus singleton non-CM | Numbers of maximal special subvarieties 1 and 0 | Zero-dimensional induction base correct | References updated |
| §7.4 André–Oort consequence | V={0,1728}; empty V | Closures give two special points and ∅ | Finite union includes empty case | References updated |
| §7.5 CM pairs | Diagonal, j₁=1728, j₁=1 | Φ₁=j₁−j₂; infinitely many CM pairs in first two; zero in last | Both excluded special-curve types necessary | Retained |
| §7.6 Period codimension | dim X=2,dim Ď=3,dim U=1; dim U=0 | codim U=4<5≤sum of codimensions; point projects to a proper point | Positive-dimensional and point cases separated | Renumbered |
| §7.7 Mixed reduction | Special singleton; nontorsion singleton in CM fibre; pure case | Special-point counts 1 and 0; pure torsion order 1 | Density and pure-orbit hypotheses remain explicit | Checks moved, renumbered |
| ax_kochen_ring | Ring sentence x²+1=0, p=2 and 5 | False/true at 2; true/true at 5 | Eventual quantifier retained | Docstring/section title only |
| igusa_poincare_rationality | m=0,f=1; m=1,f=0; ramified O=ℤ₂[√2],f=x | Raw series 1, 1/(1−qT), 1/(1−T) | Level zero, zero polynomial and ramification included | Locator only |
| Diophantine.mrdp | n=0 | Empty/full predicates realized by 1=0/0=0 | Correct native finite-tuple statement | Unchanged |
| rationalIntegers | −7; 1/2 | Integer witness −7; no integer witness for 1/2 | Actual embedded subset | Unchanged |
| rationalDiophantine | ∅; nonzero rationals; empty witness tuple | Equation 1 gives ∅; xy−1 gives ℚ×; one empty assignment | Real-body definition determines normal form | Unchanged |
| universal_integers | t=0 and t=1/2 | Universal integer predicate true and false; complement existential predicate false and true | Negation direction correct | Unchanged |
| rational_nonintegers_diophantine | t=−1 and 1/2 | Complement membership false and true | Corollary agrees with universal definition | Unchanged |
| rational_nonsquares_diophantine | 0,−1,4 | Membership false,true,false | Nonzero nonsquares match Proposition 21(b) | Locator repaired |
| one_universal_variable | Integer 0 and noninteger 1/2 | All universal inputs have witnesses at 0; some lacks one at 1/2 | One universal variable, fixed existential arity | Unchanged |
| nonpowers_diophantine | ℚ,r=2 at −1,0,4; r=3 at 2,−8 | Truth true,false,false; true,false | System form and x≠0 agree | Added headline |
| IsOMinimalExpansion | Ordered real field; expansion naming ℤ | Unary interval boundary size 2; named ℤ boundary infinite | Predicate excludes wrong expansion | Docstring repaired |
| algebraicPart | (0,1),{0},{0,1},Fin 0 carrier | Interval,∅,∅,∅ | Non-subsingleton excludes dimension zero | Locator updated |
| rationalTupleHeight | ![−3/4],![0],![] | 4,1,1 | Cast terms agree with Rat.mulHeight₁_eq_max | Docstring repaired |
| pila_wilkie | Whole ℝ fibre; one rational point; n=0 | Counts outside algebraic part 0,1,1; C≥1 handles latter cases | Native family and supplier corollary agree | Route/locator updated |
| bounded_degree_counting | k=1 versus 2, x=√2; transcendental x; n=0 | Degree tests false/true; algebraicity false regardless of junk height 1; empty tuple count 1 | No unrestricted-real stand-in | Added headline |

## Maintainer consequences

The outstanding mathematical supply is gap:neron-pairing-perfect-finite-residue, assigned to NeronModelsAndSemistableAbelianVarieties §4.6. Its general pairing theorem is needed even when the application is an additively reduced, non-self-dual abelian surface. This package records the missing input honestly; it does not certify the supplier’s future repair. The plan file did not previously exist; only its authorized gaps list has been created.

No existing Lean declaration was removed or renamed. New names are TauCetiRoadmap.LogicAndDefinabilityInNumberTheory.nonpowers_diophantine and TauCetiRoadmap.LogicAndDefinabilityInNumberTheory.bounded_degree_counting. No other roadmap file was edited.

Consecutive numbering changes the retained locators as follows: old §§0.5–0.6→§§0.3–0.4; old §§2.10a–2.12→§§2.11–2.13; old §§4.29a–4.33→§§4.30–4.34; old §§6.16–6.22→§§6.10–6.16; old §6.26→§6.17, old §6.25→§6.18, old §§6.27–6.28→§§6.19–6.20, old §6.30→§6.21; old §§7.7–7.8→§§7.6–7.7. Removed subsections have no replacement locators.

The object-based consumer search found ComplexComparisonPartII still referring to “LogicAndDefinabilityInNumberTheory LD.6” for nonproper definable Chow. That reference is outside this package, and its earlier merge position cannot obtain supply here; ShimuraVarieties §3.5d is the existing smooth-ambient owner already consumed here. No cross-package change or merge-order decision was attempted. The required fresh independent review remains necessary.
