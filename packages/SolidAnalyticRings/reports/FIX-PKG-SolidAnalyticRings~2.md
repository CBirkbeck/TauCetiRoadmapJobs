# SolidAnalyticRings repair report

## F01 (P2) — applied

“Not statable” → two universe-zero headline theorems, supported by five definitions with real bodies. README §1.5 names all seven declarations; the module documentation now distinguishes ordinary reflection from the unavailable enhanced tensor. Evidence: RC line 732 and RC line 757–776; the pinned internal Hom and ordinary derived cohomology APIs elaborate the statements.

## F02 (P2) — applied

Ordinary-ring comparison applied to condensed B → module-object transport through §2.3, followed by the enhanced derived comparison for solid B-modules. Added the necessary light flatness target in §1.5 (RC line 787). Restricted the ordinary comparison to B(*) in the supplier contract, §2.3 and §7.4. Recomputed the topological and Tor Checks.

## F03 (P2) — applied differently

Denial of Huber-pair supply → explicit §7.3 identification, scope statement and consumer contract, including generating sets and unchanged discrete animated coefficients. Added polynomial and square-zero Checks. Qualified polynomial pair notation by integral closure: εT is integral over 𝔽₂[ε]/ε² but is not constant. Evidence: MW line 1764–1775; RC line 3236 and RC line 3265–3305.

## F04 (P3) — applied

§6.1’s unused §4.1 dependency → no interchange prerequisite for free resolutions. The arbitrary-coproduct passage is now explicit in §6.4 and its Needs line; RefinedTraceMethods’ contract states the cardinal-interchange condition. Constant resolutions of uncountable free sums provide the boundary Check. Evidence: Bosco line 3462–3471 and Q line 3688–3692 distinguish these steps.

## F05 (P3) — applied

Unlabelled unequal outputs → an explicit negative control outside the theorem’s hypotheses. At stage n the product is ℤⁿ; its colimit is the finite-support subgroup, while the product of coordinate colimits is ℤ^ℕ. The all-one vector separates them. ℕ has no upper bound for its countable subset ℕ, so it is not ω₁-filtered (HTT line 18705–18708).

## F06 (P3) — applied

An unused algebra-pushout condition → any coherently commuting square of analytic morphisms. Updated §7.2’s statement, API and Checks, and the Lean module’s headline description. The non-pushout square with terminal H𝔽₂ gives H𝔽₂ along both paths. The genuine derived pushout example remains a Check; §3.4’s distinct supplied ordinary base-change interface is unchanged (RC line 1491–1521).

## Verification outcomes

- Elaborated `packages/SolidAnalyticRings/Suggested.lean` with `lake env lean`, from the pinned content checkout: **exit 0**; exactly two warnings, both “declaration uses `sorry`”, at the two headline theorems. No errors. No Tau Ceti import is used, so no targeted module build was necessary.
- In one scratch Lean file, appended `#check @name` for **all seven declarations**, and elaborated it once: **exit 0**, with the same two expected warnings and all seven signatures printed. `natShift` and `inftyPoint` use the native universe-zero convergent sequence; `nullSeq` has type LightCondAb; `nullShift` is its endomorphism; `IsLightSolid` is a genuine object property. The first theorem has the actual inclusion and the countable product of discrete integers. The second retains its explicit `[HasDerivedCategory LightCondAb]` binder and quantifies over every integer cohomology degree. No standing hypothesis disappeared; README generality was made explicit rather than changing any binder after this check.
- The supplied preliminary signature-extraction error, “Unknown identifier `lack`”, did not recur. The inaccurate module documentation was narrowed for F01 and the statable declarations were added; no further parser repair was needed.
- The supplied `tex=2` failure identified two braced subscripts in the polynomial-structure Check of README §7.3. Both now use D_F with F={T} explicitly fixed. Matching notation in this report’s two §7.3 rows uses the same convention; its §6.4 row uses parenthesized sum indices. The mathematical statements are unchanged. The gate’s exact `scan_latex` and `scan_tex_residue` scanners both return zero hits for the README and report: `latex=0 tex=0`, exit 0.
- Ran the required `gate --depcheck` with name SolidAnalyticRings, the board merge order and `--movable`: **exit 0**, exact output:

```text
depcheck: 27 roadmaps, 234 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Neither tooling nor merge order was edited.

- Parsed `sources.toml` successfully. Existing source keys and certified cache records were reused; only RC’s locator list was extended. No missing reference, new source key or source download was needed.
- Checked the two gap sentences against the top-level design gap entries: both remain verbatim matches, with their original supplier, section and slug. No new supplier gap is needed for these repairs.
- Searched every occurrence of the repaired constructions: F01 also changes How to read the build and the Mathlib contract; F02 changes the EnhancedDerivedSheaves contract, §§1.5, 2.3 and 7.4; F03 changes Scope, §7.3 and Downstream consumers; F04 changes §§6.1 and 6.4 and the RefinedTraceMethods contract; F05’s analogous profile negative control already says it is not ω₁-filtered; F06 changes both §7.2 formulations, its examples and the Lean documentation.
- The local Needs closure no longer reaches §4.1 from §6.1 or §6.3; it does from §6.4. The closures of §§7.2–7.4 do not reach §4.1. The distinct independent-union gap in §§4.2 and 5.3–5.4 is unchanged.
- `git diff --check`: **exit 0**. Only the allowed README, Suggested.lean, source manifest and this requested report are changed. Metadata and the design plan are untouched; non-gap design text is outside the authorized edit boundary.

## Source and ownership evidence

Read the main-branch shapes of GeneralizedCohomology and EnhancedDerivedSheaves before editing. The content checkout identifies itself as `origin/main` at a4a8652e; its manifest fixes Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Cached citation-index output labels an older main revision; direct reads of the actual content checkout settle its supplier citations.

| Source | Passages read and use |
| --- | --- |
| RC | RC line 537–540: light exactness model; RC line 732–787 and RC line 795–896: null-test, reflection, cohomology, generation, tensor and flatness; RC line 1392–1459: light spectra and analytic structures; RC line 1489–1521: tensor and scalar extension; RC line 2114–2145: polynomial summability; RC line 3236–3305: discrete animated pairs, generators and integral closure. |
| MW | MW line 1748–1775: sphere-valued solidity and f-solidity for the actual condensed coefficient ring. |
| W | W line 437–475: discrete embedding, reflection, p-complete comparison and compact spectral generator. |
| Q | Q line 3643–3710: null test, the split-tower arithmetic model and the separate ω₁-filtered reduction to countable sums. No arithmetic theorem is promoted to a general theorem without the roadmap’s hypotheses. |
| Bosco | Bosco line 3459–3525: p-complete solid ordinary coefficients, free resolutions, arbitrary block sums, null-family calculation and flatness. Its ordinary integer setting is retained as a model. |
| HTT | HTT line 18705–18735: κ-filtered colimits and κ-small limits in spaces; stabilization is the separate supplier contract. |
| AG | AG line 1361–1405 and AG line 3010–3065: measures on condensed rings, complete modules and derived realization. These do not identify a topological ring with a discrete ring. |
| CS | CS line 1243–1257: compact-Hausdorff integer reflection and its derived category, consumed through VS2.1. |
| AS | AS line 9–18 and AS line 39–44 identify the lectures and the transcript’s status. It remains contextual, never the sole support for a target. |

| Supplier citation | Directly resolved location and mathematical boundary |
| --- | --- |
| GeneralizedCohomology G2.1–G2.7; G3.8–G3.9 | Main README, G2 items 1–7 beginning at lines 213–405; G3 items 8 and 9 at lines 785 and 878. Concrete spectra, their module adapters and actual coherent prime-power towers. |
| StableHomotopyKTheory §§5.13–5.18 | Indexed open-head README, headings at lines 1998–2098; operadic models, HR modules, chain/spectrum grading and cellular/connective comparisons. |
| EnhancedDerivedSheaves §§0.1–0.3; E1.3 | Main README lines 429–491 and 549 onward: enhanced module sheaves, replacements and derived tensor/Hom on ringed sites. |
| EnhancedDerivedSheaves E0.4; E0.8; E2.6–E2.7 | Main README lines 211, 376–414, 2293 and 2375 onward: stability, cardinal definitions and hypercomplete-space-sheaf localization. E0.8 does not contain the required full cardinal interchange. |
| EnhancedDerivedSheaves E2:towers; E2.1–E2.3 | Main README lines 1294, 1401, 2035, 2083 and 2125 onward: coherent fiber-of-difference limits, replete epimorphisms, Milnor and Postnikov comparison. `IsReplete.countableProduct_epi` and `IsReplete.milnor` occur at lines 2071 and 2097: the supplied citation-index leads are not missing suppliers. |
| EnhancedDerivedSheaves E3.2–E3.3; E4.1; E4.4 | Main README lines 1153, 1203, 2569 and 2703 onward: localizations, generation and integer completion. E4.4 itself distinguishes completion of a tensor from closure of complete objects under ambient tensor. |
| EnhancedDerivedSheaves E5:abstract.2–.5; E5:presentability.1–.2 | Main README lines 1456–1648: module objects, bar scalar extension, monoidal localization, monadicity, compactness and stabilization. Their application to the light solid category stays here. |
| EnhancedDerivedSheaves E5:spectra-comparison; E5:animation.4 | Main README lines 1842–1889 and 1994–2025. `symmetricSpectra_towerComparison` at line 1876 fixes (p,id); `animatedModules_discrete` at line 2012 is an ordinary-ring assertion. |
| VStackSheavesAndLisseCategories VS2.1–VS2.2 | Indexed open-head README: compact-Hausdorff solidity at lines 653–706, measures at lines 713–715, and formal complements at the named VS2.2 subsection. Light common-presentation transport is supplied there, not an unrestricted equivalence of universes. |
| HabiroRings §§2.6–2.12 | Indexed open-head README, named subsections in Layer 2 and its explicit light-solid-spectra gap. Its factorial filtration and arithmetic idempotence remain consumer targets, not inputs here. |

Used the prescribed `roadmaps grep` and `roadmaps show` interfaces, and `rg` on board packages and pinned files. Object searches included null sequences, light solid objects, f-solid modules, solid abelian categories, cardinal interchange and countable AB6. They distinguish VS2.1’s compact-Hausdorff object from §1.5’s light null-test object, and show HabiroRings consuming the latter spectral foundations. No earlier owner of the new light signatures or the static solid-module transport was found. The full names added here are in TauCetiRoadmap.SolidAnalyticRings and do not duplicate a supplier declaration.

The provided indexed open heads were searched; no additional head was fetched for named open pull requests without files in the brief. Ownership against such unavailable files was not independently checked. HigherHidaAndColemanTheory and RefinedTraceMethods’ consumer requirements were treated as contracts in the brief; their folders here do not expose the README heads cited in the review. No claim that either consumer has already made a corresponding edit is made.

At the pins, `LightCondAb := LightCondMod ℤ` (Mathlib/Condensed/Light/Module.lean:85) is ordinary ModuleCat-valued light sheaves, not spectra. The definition of LightProfinite in Mathlib/Topology/Category/LightProfinite/Basic.lean:42 includes total disconnectedness and second countability, while compactness and Hausdorffness come from CompHausLike. The native convergent sequence is Mathlib/Topology/Category/LightProfinite/Sequence.lean:53 and its internal-projectivity universe restriction is Mathlib/Condensed/Light/Sequence.lean:20–22, 302. The new statements use the ordinary closed tensor in Light/Monoidal.lean:41–62 and contravariant `MonoidalClosed.pre` in Mathlib/CategoryTheory/Monoidal/Closed/Basic.lean:242. The ordinary derived category and cohomology are Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74 and HomologySequence.lean:33. Compactness is `IsFinitelyPresentable` at Mathlib/CategoryTheory/Presentable/Finite.lean:49; separation is Mathlib/CategoryTheory/Generator/Basic.lean:545. None supplies the enhanced light solid derived tensor. Searches by these objects found no duplicate light reflection theorem or spectral carrier at either pin.

## Adversarial mathematics pass

These are independently recomputed mathematical instances, not claims of formal proofs. A “retained” result means the instance agrees with the stated hypotheses and the cited route, including declared supplier gaps. The table separates the newly introduced maps and claims as well as covering the existing targets and API identities.

| Statement | Instances tried | Computed values on the compared sides | Result | Change |
| --- | --- | --- | --- | --- |
| Site and empty-value convention | Empty space; discrete two-point space | M(∅)=0; M(2)=M(*)²; the free ranks are 0 and 2 | Retained | None |
| Universe restriction of native null object | Native OnePoint ℕ | Carrier in LightProfinite at universe 0; no parameter for a larger site in its type | Native signature has the claimed bound | F01 documents the remaining transport target |
| Left-module/right-endomorphism convention | φ=(1,0), e₁₂,e₂₁ | (φe₁₂)e₂₁=(1,0)=φe₁₁; φe₂₂=0 | Order agrees in §§2.4 and 7.3 | None |
| Integer/spectral grading | ΣHℤ; ℤ in cochain degree 2 | π₁=ℤ, π₀=0; respectively π₋₂=ℤ | Grading agrees | None |
| Tensor sign | Two suspended rank-one spheres; two unsuspended coordinates | Braiding acts by −1; respectively +1 | Signs agree in Layer 3 | None |
| Shift-precomposition sign | e₁ and e₀ | σ*e₁=e₀; σ*e₀=0; (1−σ*)(e₁+e₀)=e₁ | Excludes opposite shift | F01 retains this law in the real definitions |
| Condensed product versus discrete product | Coordinate vectors e_n on C | Coordinatewise e_n→0; in the discrete product e_n is never eventually 0 | Distinct objects | None |
| Scalar-quotient convention | a=1; a=0 | cofib(id)=0, fiber(A→0)=A; cofib(0)=A⊕ΣA | Both derived terms retained | None |
| Prime-power transition convention | M=H𝔽₂ and H𝔽₃ | M/pʳ=M⊕ΣM; transition (id,0); limit=M | No spurious suspended limit | None |
| Profile arrow direction | t^(j+1)→t^j | t^(j+1)x has the same image in t^jA; t^j is not in t^(j+1)A | Descending arrows agree | None |
| Completed-unit convention | p=2 and p=3 | π₀ of units ℤ₂, ℤ₃; ambient sphere has π₀=ℤ | Units differ as required | None |
| §1.1 spectral hypersheaves | ∅, 2, C | Free point values 0, ℤ², ⊕_Cℤ in π₀; at 2, free C has (⊕_Cℤ)² | Free object is not a product measure | None |
| §1.1 free tensor law | Sizes 2 and 3; empty second input | Rank 2·3=6; rank 2·0=0 | Product indexing correct | None |
| §1.1 descent/detection | Split cover 2→*; zero object | Descent glues two equal components to one value; all zero values give zero sheaf | Actual sheaf condition used | None |
| §1.2 discrete adjunction | X=0; X=𝕊⊕Σ𝕊 | Point value 0; π₀=ℤ and π₁=(ℤ/2)⊕ℤ on both sides of unit | Higher sphere stem retained | None |
| §1.2 functor/monoidal laws | Identity, zero, rank-two free inputs | Identity sends (1,0) to (1,0); zero sends it to 0; tensor unit has rank 1 | Coherences have correct components | None |
| §1.2 inverse-limit comparison | Tower ℤ/pʳ, T=ℤ_p | Limit contains the identity function on ℤ_p; discrete ℤ_p only gives locally constant functions | General equivalence correctly absent | None |
| §1.3 marked cofiber | Singleton marked space | coker(id_ℤ)=0; spectral cofib(id)=0 | Reduction kills marked point | None |
| natShift | 0,1,∞ | Images 1,2,∞; constant-to-0 instead gives 0,0,0 | Correct continuous marked shift | F01 definition and Check |
| inftyPoint | Unique point; composite with natShift | Both composites have value ∞; constant-to-0 followed by shift has value 1≠0 | Marked compatibility fixes descent | F01 definition and Check |
| nullSeq | Point sections and finite quotient with n isolated points | P(*)=⊕_ℕℤ; reduced finite quotient has rank n, not n+1 | Unreduced free object excluded | F01 definition |
| nullShift | e₀,e₁ as basis vectors of P(*) | σ(e₀)=e₁, σ(e₁)=e₂; induced Hom action sends e₁ to e₀ | Covariance and contravariance distinguished | F01 definition |
| §1.3 internal Hom fiber | Discrete ℤ; zero target | Kernel of evaluation at ∞ is ⊕_ℕℤ; zero target gives 0 | Null rather than arbitrary sequences | None |
| IsLightSolid | ℤ; 0; topological ℝ | Tail-sum inverse sends e₁ to e₀+e₁; zero Hom map is invertible; harmonic partial sums diverge so no null inverse in ℝ | Positive and negative instances | F01 predicate |
| §1.4 spectral test/orthogonality | δHℤ; free null object N | First test has finite-support inverse; π₀N(*)=⊕ℤ versus π₀L■N(*)=∏ℤ | N is excluded | None |
| §1.4 equivalence invariance | Identity on δ𝕊 | π₀=ℤ and π₁=ℤ/2 remain unchanged | Spectral object named in target | None |
| §1.5 abelian reflection | B=0, ℤ, ℝ | Reflections 0, ℤ, 0; units are zero, identity, and ℝ→0 | Correct image and Archimedean boundary | F01 headline |
| §1.5 compact projective separator | G=∏_ℕℤ; finite replacement ℤ | Hom(G,−) preserves filtered colimits and lifts epimorphisms; ℤ has Hom(ℤ,Q)=Q(*)=0 for Q=ℤ_p/δℤ_p≠0 | Finite replacement cannot be the generator | F01 headline |
| §1.5 generator’s nonzero witness | Q above on C | Sequence p^n gives a nonzero class at C, but Q(*)=0 | Separator condition is substantive | None |
| §1.5 limits, extensions and Hom closure | Zero diagram; extension 0→ℤ→ℤ²→ℤ→0 | Zero limit/colimit=0; middle group ℤ² has two finite-support inverses; Hom(ℤ,ℤ)=ℤ | Tests stable in these instances | None |
| §1.5 free solid measures | S=∅,*,2,C | 0, ℤ, ℤ², and ℤ×∏_ℕℤ; reduced C gives ∏_ℕℤ | All-one family appears only after reflection | None |
| §1.5 ordinary derived reflection | ℤ[1]; ℝ[0]; zero complex | Cohomology ℤ in degree −1; reflected ℝ is 0; zero remains 0 | Cohomology test selects stated image | F01 second headline |
| §1.5 derived inclusion and tensor | ℤ[1], ℤ[0] | Only H⁻¹=ℤ; tensor with the unit leaves ℤ[1] | Enhanced assertion remains distinct from ordinary signature | None |
| §1.5 integer product tensor | 2×3; ∅×ℕ; ℕ×ℕ | ℤ⁶; 0; ∏_(ℕ²)ℤ, all with higher Tor=0 | Product theorem agrees | None |
| §1.5 light flatness | B=0,ℤ/2; contrast ℤ/2 twice | 0; (∏ℤ)/2=∏𝔽₂ with Tor₁=0; Tor₁(ℤ/2,ℤ/2)=𝔽₂ | Flat generator does not imply all objects flat | F02 adds RC(14) |
| §2.1 homotopy test and truncation | ΣHℤ; square-zero 𝕊⊕Σ𝕊 | π₁=ℤ; respectively (ℤ/2)⊕ℤ; π₀=ℤ in square-zero example | Heart alone does not reconstruct spectrum | None |
| §2.1 suspension and zero bounds | Hℤ, shift 1; zero | Bound 0 becomes 1; zero has π_k=0 for every k | Bounds correct | None |
| §2.2 reflection and tensor compatibility | 0; δ𝕊; solid M | L■0=0; L■δ𝕊=δ𝕊; L■(δ𝕊⊗M)=M | Unit/counit components correct | None |
| §2.2 idempotent reflection units | M=δHℤ | Both units M→L■M→L■²M are identities on ℤ | Same marked unit | None |
| §2.2 internal Hom | G and δH𝔽₂ | Point Hom=⊕_ℕ𝔽₂, countable; abstract Hom(∏ℤ,𝔽₂) has cardinal 2^(2^ℵ₀) | Abstract-group substitute excluded | None |
| §2.2 free-measure naturality | Finite map 2→* | Coordinate classes both map to 1, so (a,b) maps to a+b | Unit fixes comparison direction | None |
| §2.2 module tensor bound | Σ^bA, Σ^cA | Relative tensor Σ^(b+c)A, lower bound b+c | Connectivity normalization correct | None |
| §2.3 Hℤ-linear equivalence | Unit; H𝔽_p⊗_HℤH𝔽_p, p=2,3 | ℤ[0]; π₀=π₁=𝔽_p, remaining π_k=0 | Derived tensor retained | None |
| §2.3 bottom-homotopy detection | X=Σ^b𝕊 | π_bX=ℤ=π_b(Hℤ⊗X); cofib(𝕊→Hℤ) has π₀=π₁=0 | Claimed first-degree isomorphism | None |
| §2.3 ordinary θ comparison | Polynomial 𝔽₂[x]; free CAlg generator | θ polynomial static; symmetric-power degree 2 has H_i(BΣ₂;𝔽₂)=𝔽₂ for every i≥0 | No identification of all spectral algebras | F02 restricts supplier setting |
| §2.4 generator, homotopy and free adjunction | G; A=0 | π₀G(*)=∏ℤ, π₁G(*)=∏ℤ/2; G_0=0 with zero module category | Sphere data and zero case retained | None |
| §2.4 continuity model | e_n into ∏ℤ | Every fixed coordinate eventually 0, while e_n≠0 for all n | Product topology required | None |
| §3.1 product tensor | Empty I; cardinalities 2 and 3 | 0⊗■G=0; six spheres with coordinate projections | Comparison has stated rank | None |
| §3.2 split tower definition | Ranks n+1; ×2 on rank one | Ranks 1,2,3 and kernel ranks 1; equation 2b=1 has no b∈ℤ | Split/non-split cases separated | None |
| §3.2 decomposition and independence | Projection ℤ²→ℤ with sections (x,0),(x,x) | Both kernels rank 1; (x,y) has second coordinate y or y−x, while stage projection stays x | Same limit under changed sections | None |
| §3.2 zero/constant tower | Zero; sphere with identity transition | Limits 0 and 𝕊, with all split kernels 0 | Initial term retained | None |
| §3.3 independent/diagonal tensor | Constant rank one; growing towers m=1,n=2 | 𝕊; independent finite stage has 2·3=6 terms; diagonal is cofinal since max(m,n) dominates both | Index direction correct | None |
| §3.3 linearity boundary | Constant-polynomial section of A→A/(t) | s(t·1)=0 but t·s(1)=t | Only sphere-linear splitting used | None |
| §3.4 balancing identity | A=𝕊; A=𝕊[t], X=Y=A | X⊗Y; ℤ[t₁,t₂]→ℤ[t] sends t₁,t₂ to t | Multiplication action is fixed | None |
| §3.4 scalar transitivity/base change | Identity algebras; H𝔽₂ span over Hℤ | M; genuine pushout has π₀=π₁=𝔽₂ | Supplied ordinary comparison distinct from F06 | None |
| §3.4 dualizable limit hypothesis | Finite free B; rationalization of ∏ℤ | Finite direct sums commute with the product; (2⁻ⁿ) is absent from (∏ℤ)⊗ℚ but present in ∏ℚ | General scalar-limit exchange excluded | None |
| §4.1 interchange | Empty K; point J; point K | Both 0; both lim_KF; both colim_JF | Degenerate comparisons correct | None |
| §4.1 filtered negative control | J=ℕ, F(n,k)=Hℤ for k<n | π₀ left=⊕ℤ, right=∏ℤ; (1,1,…) lies only on right | Failure lies outside ω₁ hypothesis | F05 labels it |
| §4.2 independent-union law | B_j=ℚ, subgroups (1/n!)ℤ | Independent choices include (1/(j+1)!)_j; uniform n cannot include it | Independent bounds are essential | Gap retained |
| §4.2 zero family and split lim¹ | B_j=0; truncations ℤ^(n+1) | Product 0; limit ℤ^ℕ, projections onto ℤ^(n+1), lim¹=0 | Exactness used with correct hypotheses | None |
| §5.1 complete split datum | A=𝕊[[t]]; A=0; sphere/p | B_r has rank r, including 0,1,2; zero data all 0; π₀(𝕊/p)=ℤ/p | Moore spectrum fails finite-free requirement | None |
| §5.1 marked ideals | a_r=tʳ | J_r≃A but marked map multiplies by tʳ; J_0→A=id | Unmarked isomorphism does not erase filtration | None |
| §5.1 quotient/completion naturality | M=A; zero map; even-index tower | A⊗_AB_r=B_r; induced zero map stays 0; t^(2r) gives the same limit A | Coherent tower and unit retained | None |
| §5.2 proper profile definition | f(j)=j; f(j)=0 | First sublevel has r elements; second has infinitely many for r=1 | Proper/nonproper separated | None |
| §5.2 filtered order and non-ω₁ bound | f_k(j)=max(j−k,0) | Pairwise minimum is proper; inf_k f_k(j)=0 for every j, not proper | Cannot invoke §4.1 | None |
| §5.2 block modules/finite-output maps | Empty I_j; identity; zero; duplication twice | V_f=0; support {j}; support ∅; support {4j,4j+1,4j+2,4j+3} | Finite-output condition composes | None |
| §5.2 compact block model | Countably infinite I and product model for A | A⊗■∏_I𝕊=∏_IA, a copy of G_A; maps to a sum factor through a finite subsum | Actual generator supplies compactness | None |
| §5.3 null-family comparison | A=𝕊[[t]], singleton blocks | (t^j) reduces to j<r; (1)_j has infinitely many nonzero residues mod t | Decay condition discriminates | None |
| §5.3 finite and infinite block edges | Two singleton blocks; only I₀=ℕ | A² on both sides by f(0)=f(1)=0; ∏_ℕA on both sides with f(0)=0 | No decay imposed inside a block | None |
| §5.4 homotopy in every degree | k<0; k=1 for formal spheres | 0; π₁A=(ℤ/2)[[t]], and ηt^j has residues η,ηt modulo t² | Spectrum rather than π₀ theorem | None |
| §5.4 block naturality | Duplication; fold | Mod t² outputs 0–3; fold Σt^j=(1−t)⁻¹≡1+t, with (1−t)(1+t)≡1 | Denominator is a unit | None |
| §6.1 uniform free resolution | 0; Σ^bG_A; ⊕_IΣ^bG_A for uncountable u-small I | Constant resolutions realize to 0, Σ^bG_A, and that same coproduct; all π_k vanish for k<b | No cardinal-interchange step | F04 removes the edge |
| §6.1 lower-bound exclusion | Σ^(−n)G_A with G_A≠0 | Nonzero degrees extend below every fixed b | Uniform bound necessary for the route | None |
| §6.2 exactness/connectivity | a_r=1; zero scalar | Completion 0; one quotient M⊕ΣM, still ≥b | No underived quotient substituted | None |
| §6.2 bottom quotient and lim¹ | M=Hℤ, a_r=2ʳ | Bottom quotients ℤ/2ʳ are onto, limit ℤ₂, lim¹=0; ideal tower instead has lim¹=ℤ₂/ℤ | Quotient and ideal towers distinguished | None |
| §6.3 realization comparison | Constant M; normalized degree 1 | Identity on ΛM; layer ΣM has bound b+1 before and after completion | Finite-skeleton estimate agrees | None |
| §6.3 skeletal tail | Uniform b; normalized Σ^(−n)A | First omitted layer bound b+d+1; counterexample layers ΣⁿΣ^(−n)A=A | No claim for unbounded inputs | None |
| §6.4 completed embedding | X=H𝔽₂,H𝔽₃ | Point evaluation of limit of (id,0) quotient towers equals X; unit is id | Full-faithfulness boundary agrees | None |
| §6.4 arbitrary-coproduct passage | Countable subsets I_n of any I | Their union is countable and is an upper bound; every element lies in a singleton; colim_J⊕_(i∈J)G=⊕_(i∈I)G | Exactly ω₁-filtered comparison is needed | F04 places the edge here |
| §6.4 p-complete tensor and units | Hℤ_p; p=2,3 | Hℤ_p⊗■_HℤHℤ_p=Hℤ_p; unit π₀=ℤ_p, not ℤ | Completed coefficient normalization | None |
| §6.4 relative derived tensor | H𝔽_p over Hℤ_p | Tor₀=Tor₁=𝔽_p | Absolute and relative tensors kept distinct | None |
| §7.1 reflective structure definition | Full modules; {0}; perfect Hℤ modules | Reflectors id and 0; L(A)=0 equals A iff A=0; ⊕_ℕHℤ not perfect | Wrong finite/perfect model excluded | None |
| §7.1 morphisms and marked units | Identity analytic map; zero target | Composite identity remains identity; A→0 has zero unit | Actual inclusion/unit used | None |
| §7.2 complete tensor and Hom | D=all; D={0}, A=Hℤ | Unit A; respectively unit 0 and Hom(0,0)=0 | Uncompleted coefficient not substituted | None |
| §7.2 adjunction/transitivity | Identity algebra and structure | Both sides Map(M,N); iterated scalar extension equals M | Source and target agree | None |
| §7.2 commuting-square identity | A=A′=B=Hℤ, B′=H𝔽₂, M=A | Both completed paths H𝔽₂; algebra pushout would be Hℤ | Pushout unnecessary | F06 generalized hypothesis |
| §7.2 genuine derived pushout Check | A=Hℤ, B=A′=H𝔽₂, M=A | B′=B⊗ᴸ_AA′ has π₀=π₁=𝔽₂ | Still a valid special square | F06 rewrites Check |
| §7.2 stronger target completion | All four algebras Hℤ; target D={0} | Both paths 0; intermediate kernels 0, terminal kernel all modules | No kernel-generation condition needed | None |
| §7.3 summability definition | F=∅,{0},{1} | All modules; map id; map already invertible by solidity | Degenerate tests agree | None |
| §7.3 shift/scalar inverse witness | e₁, any scalar f | (1−fσ*)(e₁+fe₀)=e₁+fe₀−fe₀=e₁ | Sign fixed for scalar action | None |
| §7.3 noncomplete coefficient | Topological ℚ₂,ℚ₃, f=1/p | pⁿ−p⁻¹p^(n+1)=0; initial value 1≠0 | Coefficient is not local in this example | None |
| §7.3 nilpotent tests | ε²=0 in characteristic 2 | (1−εσ*)(1+εσ*)=1; inverse has two terms | Nonreduced case allowed | None |
| §7.3 monotonicity/free local objects | F={T}, ∅⊆F; zero module | D_F⊆D_∅; L_FL_∅=L_F; L_F0=0 | Localization direction agrees | F03 exposes its consumer instance |
| §7.3 discrete Huber-pair identification | (ℤ[T],ℤ), (ℤ[T],ℤ[T]) | F=∅ and F={T}; both have coefficient δHℤ[T], but different complete subcategories | Coefficients alone do not determine analytic structure | F03 states target |
| §7.3 generator-set boundary | F={T}; ℚ₂ and ℚ₃ with T acting by 1/p | Lies in D_∅; for p=2, 2ⁿ−(1/2)2ⁿ⁺¹=0; for p=3, 3ⁿ−(1/3)3ⁿ⁺¹=0; initial value 1≠0, so outside D_F | Two polynomial structures differ | F03 adds Check; notation uses the fixed F |
| §7.3 integral-closure convention | R=𝔽₂[ε]/ε² | (εT)²=0, εT∉R; inverse test 1+εTσ* | Literal constant subring need not be integrally closed | F03 qualifies notation |
| §7.4 static coefficient comparison | B=ℚ_p; zero ring | π₀HB=B, π_k=0 for k≠0; zero ring has zero module category | Static does not imply discrete | F02 states actual target |
| §7.4 free B-module generators | B=ℤ/2; B=0 | B⊗ᴸ■∏ℤ=∏𝔽₂ in degree 0; respectively 0 | RC flatness supplies static free objects | F02 corrects route |
| §7.4 derived tensor boundary | B=ℤ/2 in Mod_ℤ(SolidAb_light) | Tor₁(B,B)=𝔽₂ while underived tensor has only degree 0 | Module comparison must be derived | F02 adds Check |
| §7.4 discrete/topological boundary | Section pⁿ of ℚ_p on C | pⁿ→0 and infinitely many distinct values; not locally constant at ∞ | H(B(*)) cannot replace HB | F02 adds Check |
| §7.4 measures and completed coefficient | S=∅,*,2 for integer measures | Free objects 0,ℤ,ℤ²; coefficient μ[*]=ℤ and Dirac unit=id | Unit criterion agrees | None |
| §7.4 E-measures and scalar change | Countable I and E/ℚ_p | (p⁻ⁿ) has unbounded denominators and is absent from (∏O_E)[1/p] | Unrestricted ∏E excluded | None |
| §7.4 animation boundary | Characteristic 2 polynomial input | θ gives static polynomial; free spectral symmetric degree 2 has H₁(BΣ₂;𝔽₂)=𝔽₂ | Ordinary comparison cannot be surjectivity onto all CAlg | None |
| gap:cardinal-interchange | κ=ω₁; filtered ℕ as control | Countable subsets have union upper bounds; ℕ itself has no upper bound in ℕ | Hypotheses match HTT; gap remains explicit | F04 changes only its consumer edge |
| gap:light-countable-ab6 | Independent denominators above | (1/(j+1)!) belongs to independent union but not diagonal union | Exact products do not replace AB6 | No gap edit |

The new maps have specified domains and targets and actual bodies; none is arbitrary data constrained only by its desired conclusion. The only admitted declarations are the two reflection/generation headlines. Their specialized reflection and generator conclusions are not definitions, boundary controls or direct restatements of a pinned theorem. The derived binder was checked explicitly. No new theorem about scalars or bare functions substitutes for an unavailable spectral theorem.

## Maintainer consequences

Added Lean names: `natShift`, `inftyPoint`, `nullSeq`, `nullShift`, `IsLightSolid`, `isLightSolid_reflective_and_generator`, and `derivedLightSolid_isRightAdjoint`. All occur in README §1.5. No existing Lean name was renamed or deleted.

HigherHidaAndColemanTheory can consume §7.3’s Huber-pair coefficient structures and further localization through §7.2; its idempotent-kernel, localization-triangle, topologically nilpotent and larger-universe requirements remain additional work, not prerequisites of this package. RefinedTraceMethods’ §6.4 input explicitly depends on gap:cardinal-interchange. No consumer file, non-gap design field, merge-order entry, issue or pull-request text was edited. No commit or network write was made.
