<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/175#issuecomment-6377481543 -->
Red team round 2 pass a (codex) of 87bc3ff

Verdict: needs_changes

1. **F01** (P1) The dual-number Dennis example drops the coefficient differential

   **Location:** packages/RefinedTraceMethods/README.md:2342: “For a characteristic-zero field k, a dual-number unit 1+aε maps under the relative Dennis trace to a dε.”

   **Claim:** This computes the absolute Dennis trace to HH₁(k[ε]/ℤ), used in §4.10.

   **Witness:** Take k=ℚ(t), a=t. In Ω¹_{k[ε]/ℤ}, d log(1+tε)=t dε+ε dt; ε dt≠0. The stated answer omits ε dt. This also contradicts the roadmap’s u↦u⁻¹du formula.

   **Exact repair text:** “For a characteristic-zero field k and a∈k, the absolute relative Dennis trace of 1+aε is a dε+ε da in Ω¹_{k[ε]/ℤ}. Its image in Ω¹_{k[ε]/k} is a dε. For k=ℚ(t), a=t, the additional term ε dt is nonzero.”

   **Retest:** (1−tε)d(1+tε)=t dε+ε dt, since ε²=ε dε=0; projection to differentials over k kills precisely ε dt.

2. **F02** (P1) Light solid spectral foundations have an earlier owner

   **Location:** packages/RefinedTraceMethods/README.md:2523, “Light condensed and solid spectra”; also the supplier contract at line 61.

   **Claim:** Construct the spectral sheaf category, discrete embedding, null test, reflection, compact generator and bounded-below p-complete tensor comparison here.

   **Witness:** TauCetiRoadmap/SolidAnalyticRings/README.md:91,117,169,269,311,633 already target these constructions in §§1–2 and 6.4. Its line 7 explicitly assigns this foundational block to that earlier roadmap.

   **Exact repair:** Replace this construction target and its proof/API with: “Supplied by SolidAnalyticRings §§1.1–1.4, 2.1–2.4 and 6.4: light condensed and solid spectra, the discrete embedding, null test, solidification, compact generator, and bounded-below p-complete tensor comparison with completed sphere unit.” Add that supplier contract; update Scope and the proof-input paragraph. Retain the trace-class, nuclearity and even-filtration targets here, pointing their foundational Needs to this supplier.

   **Retest:** Both interfaces give π₀(image of 𝕊₂)=ℤ₂, ambient-unit π₀=ℤ and unit map ℤ→ℤ₂. No mathematical generality is lost. The supplied order places SolidAnalyticRings before RefinedTraceMethods.

3. **F03** (P1) The empty-frame Check forgets the uncompleted pullback

   **Location:** packages/RefinedTraceMethods/README.md:3147, “for d = 0, F_tr is the h-adic filtration h^{max(i,0)}qdR”; the same inference occurs at line 3319.

   **Claim:** Étaleness makes the uncompleted q-Hodge filtration the h-adic filtration on animated qdR.

   **Witness:** A=ℚ, S=ℚ×ℚ, i=1: qdR=ℚ[[h]], qΩ=ℚ²[[h]]. The prescribed pullback has H⁰=hℚ[[h]], H¹=ℚ; h·qdR has H¹=0. See TauCetiRoadmap/HabiroCohomologyFoundations/README.md:1318,1611.

   **Exact repair:** Replace the Check with: “For d=0, the completed filtration is F̂_tr^i=h^{max(i,0)}S[[h]], and F_tr^i=qdR_{S/A}×_{S[[h]]}h^{max(i,0)}S[[h]]. Its Habiro–Hodge object is H_{S/A}. At A=ℚ, S=ℚ×ℚ and i=1, H¹(F_tr^1)=ℚ, whereas H¹(h·qdR)=0.” At line 3319 replace “its filtration is the h-adic one” by “its completed filtration is h-adic, and its uncompleted filtration is the derived pullback of that filtration”.

   **Retest:** The diagonal map ℚ[[h]]→ℚ²[[h]] followed by reduction modulo h has kernel hℚ[[h]] and cokernel ℚ. This agrees with §6.10's own pullback definition and the current supplier; the static Habiro–Hodge conclusion is unaffected.

4. **F04** (P1) Habiro supplier contracts use a missing section and obsolete export names

   **Location:** packages/RefinedTraceMethods/README.md:62: “HR.1 supplies perfectly covered Λ-rings (LambdaRing.IsPerfectlyCovered ...); such rings are torsion free (§1.2).” Lines 63, 2496, 3313 and 3323 also use obsolete named exports.

   **Claim:** HabiroRings §1.2 owns perfect coverage and the listed Habiro/Hodge identifiers are current supplier targets.

   **Witness:** HabiroRings has only §1.1 in Layer 1; its README:97 imports QWittVectors §2.4. QWittVectors/README.md:445 gives perfect coverage and torsion-freeness. The named Habiro/Hodge identifiers are absent from both supplied heads' README and Suggested.lean.

   **Exact repair:** Use “QWittVectors §§2.3–2.4 supplies arithmetic Λ-perfection, perfect coverage, its faithful-flatness criteria and torsion-freeness.” Replace the Habiro contract by “HabiroCohomologyFoundations §0.1 supplies algebraic Habiro completion and its monoidal reflection; HabiroRings §§2.6–2.9 and 2.12 supplies spherical and solid completion, unit idempotence and the bounded-below completed-discrete tensor comparison. HabiroRings §§5.6, 5.8 and 5.9 supplies completed base change, discriminant-localized étaleness and the number-field ring comparison.” Replace the unexported identifiers by these exact prose targets everywhere, including `QHodgeFiltration.ofUnderived` by HabiroCohomologyFoundations §4.1's smooth-underived-filtration pullback, and `HabiroHodgeDescent.etale` by §§4.21 and 4.28's marked étale comparison.

   The obsolete identifiers include `LambdaRing.IsPerfectlyCovered`, `habiroComplete.symmetricMonoidal`, `SpectralHabiroCompletion.tensor`, `SolidHabiroCompletion.unit_idempotent`, `SolidHabiroCompletion.boundedBelow_monoidal`, `HabiroRings.relativeHabiro.baseChangeEquiv`, `HabiroRings.relativeHabiro.numberFieldEquiv` and `etale_localization_away_discr`. This finding concerns contracts falsely presented as existing exports, not the declared gaps of the suppliers themselves.

   **Retest:** QWittVectors §2.4 gives ψ₂ on ℤ[T] finite free with basis 1,T, and excludes ℤ[ε]/ε² with ψ₂(ε)=2ε. HabiroRings §2.12 retains bounded-below hypotheses on both tensor factors; §5.6 retains completion for ℤ→ℤ[x]. All replacement owners precede this roadmap.

5. **F05** (P3) Definition Checks are missing or repeat the defining property

   **Location:** packages/RefinedTraceMethods/README.md:573, “The Tate construction for a Kan complex and the dualizing spectrum”; line 996, “Borel-complete genuine spectra”; line 211, “Every b-acyclic mixed complex is zero in D(Λ).”

   **Claim:** These definition blocks supply three discriminating Checks.

   **Witness:** §§2.5 and 2.13 have no three discriminating Checks. The remaining §1.3 acyclicity bullet repeats its definition: 0→M is inverted exactly when H_b(M)=0. The replacement two-term Check at line 212 does not repair this separate bullet.

   **Exact repair:** Add these three Checks to §2.5: “At S=*, assembly is the identity and parametrized Tate is zero. At S=BC₂ on trivial Hℤ, the norm on π₀ is multiplication by 2 and Tate π₀ is ℤ/2. At S=BT on trivial Hℤ, D_S=Σ𝕊 and the orbit term's first class lies in π₁=ℤ, excluding an unshifted norm.” Add these three to Borel completion: “For G=1, B_G is the identity. For G=C₂ and trivial Hℤ, (B_GHℤ)^G has π₀=ℤ and π₋₂=ℤ/2, so this is not ordinary fixed points of the underlying discrete module. For G=C₃ and Hℚ with trivial action, all nonzero-degree fixed-point homotopy vanishes, while the corresponding Hℤ object has π₋₂=ℤ/3.” Also replace the §1.3 acyclicity bullet with: “For k=ℚ, M₀=M₁=k, b=0 and B:M₀→M₁ the identity, HC⁻₁(M)=k and HC⁻₀(M)=0; replacing B by zero gives HC⁻₀=k.” Keep these in README only.

   **Retest:** In this mixed complex the negative-cyclic differential uB maps degree 0 isomorphically to degree −1, leaving the degree-one class; it distinguishes the mixed structure from B=0. The finite periodic resolution alternates 0 and multiplication by 2 or 3. Rationally these multiplications are invertible; the circle dualizing shift is +1. These values distinguish the proposed functors from zero, ordinary fixed points and the wrong norm shift.

6. **F06** (P3) A proof route still points to an undefined internal label

   **Location:** packages/RefinedTraceMethods/README.md:1350: “The spectral completion universal property is supplied by tr-cartier-comparison”.

   **Claim:** The label resolves to the roadmap's completion comparison.

   **Witness:** `tr-cartier-comparison` occurs only here; the actual target is “TR as V-complete topological Cartier modules”, README:1397. Suggested.lean contains no such declaration or alias.

   **Exact repair:** Replace “supplied by tr-cartier-comparison” with “proved in §3.4 (TR as V-complete topological Cartier modules)”. Keep only the predicate and towers in §3.3, as the current text already stipulates.

   **Retest:** On THH(𝔽₃), this target gives TR=Hℤ₃ and derived V-completion with V=3. The reference now reaches the theorem that constructs that completion; it does not turn the later theorem into an assumption of the predicate.

7. **F07** (P2) Parametrized Tate uniqueness drops vanishing of the functor

   **Location:** packages/RefinedTraceMethods/README.md:573: “p_* → p^T_* vanishes on compact objects”; “it is unique such that fib(p_* → p^T_*) preserves colimits”.

   **Claim:** Vanishing of the transformation on compacts and colimit preservation of its fiber characterize the Tate functor.

   **Witness:** At S=*, p_*=id. Both id→0 and the zero transformation id→id have colimit-preserving fibers, respectively id and id⊕Ωid, and vanish on compact inputs as transformations. Their targets differ. ns line 1218 requires functor-vanishing.

   **Exact repair:** Replace (ii)–(iii) by: “There is an initial functor p^T_* under p_* such that p^T_* itself vanishes on compact objects. Among functors F under p_* that vanish on compact objects, it is uniquely characterized by preservation of all colimits by fib(p_*→F).” Cite NS Theorem I.4.1(ii)–(iii), printed p.235, ns lines 1218–1222.

   **Retest:** At S=*, the correct target is zero. The competitor F=id is excluded because F(𝕊)=𝕊≠0, although its structure transformation is zero. Thus the missing condition distinguishes the two constructions.

8. **F08** (P3) The subdivision target mislabels Proposition B.5

   **Location:** packages/RefinedTraceMethods/README.md:612: “the classifying-space comparison in Corollary B.5”.

   **Claim:** The circle-equivariant realization input is NS Corollary B.5.

   **Witness:** ns line 7077, printed p.384, labels this statement Proposition B.5. It constructs cyclic realization with circle action; B.4 is the preceding corollary.

   **Exact repair:** Replace “Corollary B.5” by “Proposition B.5” at this occurrence. Keep the B.19–B.20 subdivision/Tate locators.

   **Retest:** At subdivision order r=1 the underlying realization is unchanged; Proposition B.5 supplies its circle action. This fixes the locator without changing the statement.

## Earlier findings: verification at this head

The IDs below are the earlier reports' F-identifiers, qualified by pass. “Not repaired—settled” means the requested change was correctly rejected, not that an outstanding defect remains. No settled finding is re-raised. Quotes in this table are from the repaired package; source evidence is paraphrased.

| Earlier ID | Status | Repaired passage and location | Verification witness |
| --- | --- | --- | --- |
| a:F01 | Repaired | README:1698, “Kcont(Mod_R)≃IK(Perf(R))” | The triangle ring has IK₋₁=ℤ, matching continuous K; connective K₋₁=0. e-cont lines 4425–4437. |
| a:F02 | Repaired | README:54, “KTheoryFiniteLocalFields §§2.1, 4.0, 4.2, 4.4 and 4.4a” | No `/pull/` URL or PR-number reference remains in README or Suggested.lean; suppliers are named. |
| a:F03 | Repaired by deletion | Suggested.lean:8, “None of the following headline theorems is statable at these pins.” | The former catalogue and undocumented example are absent; the file has zero declarations. |
| a:F04 | Repaired by importing the owner | README:43, “TauCeti.NodeAlgebra” and “supply the ordinary uv quotient” | TauCeti/RingTheory/Node/Basic.lean:37,51,65,75,97,138 supplies the quotient, maps and extensionality. No duplicate declaration remains. |
| a:F05 | Not repaired—settled | Suggested.lean:26, “they are not substitutes for these headline theorems” | The demand for Lean boundary mirrors conflicts with the binding acceptance-test rule. The ordinary examples belong in README; deleting their padding is correct. |
| a:F06 | Repaired | README:1929, “For a proper DG algebra” and “specified compact-generator Morita comparison” | TauCetiRoadmap/DGAInfinity/README.md:580–587 has exactly that restriction. k[t] is infinite-dimensional over k and excluded from this overlap. |
| a:F07 | Repaired | README:3521, “Torsion-free base change for finite coefficients” | The new comparison supplies the bridge: x⁴↦16 at p=2 and x²↦9 at p=3; mw lines 1304–1322. It no longer applies the torsion-free theorem directly to ℤ/16. |
| a:F08 | Repaired | README:680, “THH relative to an E_∞-ring”; README:2460, “Étale algebras lift uniquely” | Relative THH precedes the Bökstedt refinement at 718; étale lifting precedes the spherical-lift construction at 2472. |
| a:F09 | Repaired | README:4040, “After the motivic weight shift [2], its spectrum is Qₚ[1]” | Qₚ[−1] has H¹=π₋₁=Qₚ; applying [2] gives π₁=Qₚ, matching ΣHC. |
| a:F10 | Repaired | sources.toml:1, “tauceti-roadmap-sources/v1” | Parsed 50 unique work keys, covering 52 bibliography labels and 53 version records; the cited texts are legally cached. Shared work keys retain version distinctions. |
| a:F11 | Repaired for the listed labels | README:1397, “TR as V-complete topological Cartier modules” is the intended section target; README:63 uses numbered Habiro sections | The old item-49/item-033/L.4/HQ.3/sourceIssues labels are absent. A different unresolved label remains and is reported as S06; current Habiro drift is S04. |
| a:F12 | Repaired mathematically | README:2523, “unital symmetric monoidal into the bounded-below p-complete solid spectra” | The image unit has π₀=ℤ₂, whereas the ambient solid sphere has π₀=ℤ. New ownership overlap is S02, not a recurrence of the unit error. |
| a:F13 | Repaired | README:2378, “i≥1” | π₀BU=0 differs from K̃(S⁰)=ℤ; the positive-degree formula π₂ψ²=2 survives. |
| a:F14 | Repaired | README:3700, “commutative”; README:3778, “For an ordinary commutative ring A” | M₂(𝔽₂) cannot map unitally to its commutative HH₀ coefficient field; the repaired commutative-algebra clauses exclude it. bms lines 2091–2138. |
| a:F15 | Repaired | README: source labels now say “Proposition II.2.4”, “Remark 4.29”, and Keller “pp. 5–7” | ns line 1717; mw lines 674,681,698,869; bms line 1212; ke lines 226–245 confirm the corrected kinds and starting page. |
| a:F16 | Repaired for the specified Checks | README:212, “Its b-homology is zero”; README:3691, “φ(z)=z²” | The two-term identity complex is zero after b-localization but nonzero in outer degree zero. The Laurent comparison tests ξ=1, ξ=0 and z² versus z. Additional Check omissions are S05. |
| a:F17 | Repaired | README:2332, “their sum 3/2 does not”; README:2334, “fails idempotence” | The general target now assumes a flat idempotent ideal; the Banach example establishes the required colimit separately. ℂ fails addition closure; pℤₚ fails I²=I. |
| b:F01 | Repaired by deletion | Suggested.lean:24, “Ordinary Cartier operator calculations” remain README material | The non-elaborating example is absent. On (𝔽₂)², the chosen projection and shift have FV=0 and VF(1,0)=(0,1), retaining the mathematical control. |
| b:F02 | Repaired by deletion | Suggested.lean:24, “polynomial numerator identities” remain README material | No admitted q=1 specialization remains. N₂(3,1;1)=4=(3−1)²; this elementary specialization is padding, not a headline. |
| b:F03 | Not repaired—settled | README:1904, “Transport the latter by the sign change to the positive Dennis convention used here.” | blm lines 1888–1898 distinguish positive Bass–Heller–Swan from the negative source Dennis generator: t·d(t⁻¹)=−t⁻¹dt. The repair's rejection is correct. |
| b:F04 | Not repaired—settled | README:11, “SpinRepresentations Layers 0–2” | TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:316,353,427 exists on main and covers the named Clifford/Pin/Spin input. The old search used the wrong directory. |
| b:F05 | Repaired | README:54, “Supply Gabber rigidity with invertible coefficients” | The nine overlapping targets have been removed and are imported from KTheoryFiniteLocalFields. Its role is supplier; HabiroCohomologyFoundationsPartII remains downstream. The current depcheck has no upward edge or cycle. |

All package locations in this table have the prefix `packages/RefinedTraceMethods/`. The additions fixing torsion-free base change and the Banach input preserve their stated hypotheses. The repaired empty Lean file introduces no stand-in theorem or sorry'd datum.

## Verified sound

Read all 4,158 README lines and all 31 Suggested.lean lines. The mathematical inventory contains 200 bold targets. There are 98 explicit Checks blocks containing 347 bullets; every block has at least three bullets, which does not address definitions with no block (S05). Computed Check/target tests: 200 rows, one for every target, including positive, negative, degenerate and convention tests. The 347 explicit Check bullets were examined against their section formulas; the table groups the displayed computations by target. A compatible instance is evidence against a particular defect, not a proof of a general theorem.

The earlier-finding audit covers 22 findings: 19 repaired and three correctly rejected requests. The source ledger below records 48 target-bearing source-work anchors, with additional locators checked in the long NS, AN, BMS, MW and W developments. All 50 manifest works have legal cached texts; BM and May are background references. Ownership searches covered main, Completed, board packages, the roadmap index and all 27 explicitly supplied sibling folders. The dependency traversal covers 28 roadmap nodes and 251 edges. The 11 citation-resolver leads were treated as leads; actual stale Habiro names are S04.

The following distinctions survive the adversarial instances: derived versus ordinary Hochschild homology; antisymmetrization versus its factorial-scaled projection; genuine versus Borel fixed points; circle versus Prüfer actions before completion; FV=p versus an additional, false VF=p axiom; ordinary versus derived V-completion; connective versus nonconnective K; the positive Dennis convention versus Blumberg–Mandell's convention; the p=2 quotient-tower restrictions; finite coefficients versus rationalized p-completion; and completed versus uncompleted objects except for S03.

The committed diff is confined to six files under packages/RefinedTraceMethods (5,454 insertions). README and Suggested.lean contain no PR-number citation, set_option, computational algorithm, sorry'd data or admitted padding. No source or Lean file was edited during this review; no Lean command was run.

### Lean declaration and headline inventory

| File/section | Declarations | Variable, instance and universe context | Probe/result |
| --- | --- | --- | --- |
| packages/RefinedTraceMethods/Suggested.lean:1–31 | 0 definitions, 0 theorems, 0 instances, 0 examples | No variable, include or universe block; empty namespace TauCetiRoadmap.RefinedTraceMethods | One import Mathlib. The set of per-declaration #check probes is empty. There is no binder-loss, one-tactic-padding or duplicate-FQN candidate. |

| README headline family | Docstring coverage | Carrier test at the pins |
| --- | --- | --- |
| Cyclotomic t-structure, Cartier/TR equivalence and genuine comparison | Suggested.lean:10–11 | No cyclotomic-spectrum or topological-Cartier category. Algebraic Tate cohomology does not supply one. |
| Dennis/cyclotomic trace, DGM and henselian rigidity | Suggested.lean:11–13 | No K/THH/TC spectra of stable infinity categories or ring spectra. Ordinary K₀/K₁ and algebraic chain constructions cannot replace them. |
| Continuous localizing motives, their rigidity and refined invariants | Suggested.lean:13–15 | No dualizable-presentable-stable or nuclear-ind-category carriers. |
| Snaith, coherent Adams lifts and image-of-J trace comparisons | Suggested.lean:17–18 | No ku/KU ring-spectrum carriers. Existing vector-bundle invariants and ring spectra planned by suppliers are not pinned spectral objects. |
| Even and framed q-Hodge, finite-coefficient and Habiro–Hodge comparisons | Suggested.lean:18–20 | No solid-spectrum/filtered-TC/q-Hodge-pair carriers. Native polynomial, nodal and integer arithmetic are only Checks. |
| Arithmetic trace/prismatic/syntomic filtrations | Suggested.lean:20–21 | No trace spectra with these prismatic/syntomic complexes. Syntomic ring morphisms at the pin are a different object. |
| Associative and K-theoretic rational p-adic Beilinson squares | Suggested.lean:21–22 | No TC/K spectra or their comparison maps. No statable headline was found that the file omits. |

The pin search was by object as well as name: Hochschild/cyclotomic/Cartier spectra, spectrum and spectral-object definitions, ku/KU, prismatic/syntomic complexes and q-Hodge pairs. Algebraic spectra, spectral spaces and spectral sequences are not stable-homotopy spectrum carriers.

### Pinned APIs and supplier resolution

| Contract | Verified declaration or current owner | Boundary/hypothesis retained |
| --- | --- | --- |
| Simplicial chains and normalization | Mathlib/AlgebraicTopology/SimplicialObject/Basic.lean:48; Mathlib/AlgebraicTopology/AlternatingFaceMapComplex.lean:160; Mathlib/AlgebraicTopology/MooreComplex.lean:158 | Ordinary simplicial and normalized kernel constructions; not a cyclic or mixed enhancement. |
| Complex maps and totalization | Mathlib/Algebra/Homology/HomologicalComplex.lean:217; Mathlib/Algebra/Homology/TotalComplex.lean:265 | Chain-map commuting-square field; totalization needs its actual indexing/summability data. |
| Ordinary forms and divided powers | Mathlib/RingTheory/Kaehler/Basic.lean:148; Mathlib/RingTheory/DividedPowerAlgebra/Init.lean:99; Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:94 | Ordinary modules, not derived HKR. In characteristic two the factorial projection kills the degree-two exterior class. |
| Smooth/étale predicates | Mathlib/RingTheory/Smooth/Basic.lean:539; Mathlib/RingTheory/Etale/Basic.lean:205 | Commutative rings and algebra structures. These do not construct spectral étale lifts. |
| Factorization and Laurent coefficients | Mathlib/Data/Nat/Factorization/Defs.lean:50,183; Mathlib/Algebra/Polynomial/Laurent.lean:131,155 | factorization(0)=0 does not imply positivity; m=0 remains excluded. T has an integer exponent. |
| Witt operators | Mathlib/RingTheory/WittVector/Frobenius.lean:218; Mathlib/RingTheory/WittVector/Verschiebung.lean:109 | CommRing coefficient carrier; Verschiebung is additive. No noncommutative Witt claim is imported from this API. |
| Nodal algebra | TauCeti/RingTheory/Node/Basic.lean:37,51,65,75,97,138 | Quotient by uv−a over a commutative base, with native universal evaluation; no domain/nonzero assumption. Zero-ring specialization is allowed. |
| Algebraic cyclic Tate groups | TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean:167,200,346 | Finite cyclic group, chosen generator and parity hypotheses. Trivial integral coefficients give even ℤ/n and odd zero. |
| Ordinary DG HH and character | TauCetiRoadmap/DGAInfinity/README.md, Layers 6,8,9; character at 580–587 | Properness and specified generator retained for the character; ordinary HH/Morita imported. |
| Small stable K extension | TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:424,627,3188 | §§3.2,3.12–3.14 and 13.6 give concrete enhanced models. Arbitrary small stable infinity-category extension remains owned here. |
| Genuine/cyclic foundations, discrete Witt, Gabber | TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:364,604,639,666,693 | §§2.1,4.0,4.2,4.4,4.4a exist; the repaired imports retain bounded-below and invertible-coefficient restrictions. |
| General coherent and spectral operations | TauCetiRoadmap/EnhancedDerivedSheaves/README.md, E0,E1,E3,E5; TauCetiRoadmap/StableHomotopyKTheory/README.md:2520,2642 | E5:presentability.4 owns absolute symmetric dualizability/trace class/rigidity; ordered E₁ and relative motives are the extensions here. §7.32 owns quotient towers. |
| Classical and spectral topological K | TauCetiRoadmap/TopologicalKTheory/README.md T1–T5; CharacteristicClasses/README.md C3,C5,C6; GeneralizedCohomology/README.md G5.4 | Bundle Adams operations and ku/KU are supplied; Snaith E∞ comparison and coherent localized lifts are additional targets. β=[H]−1 is retained. |
| Finite Borel actions and Clifford input | TauCetiRoadmap/BordismFormalGroups/README.md F6.1,F6.5; OrthogonalSpinGroups/README.md Layers 0–1; RepresentationTheory/SpinRepresentations/README.md:316,353,427 | No reassignment of finite Borel norms or ordinary Clifford/Spin constructions. |
| Ordinary λ/K₂ and differential symbols | TauCetiRoadmap/KTheoryLowDegrees/README.md §§13.2–13.4; K2SymbolsBrauer/README.md:2913,3112,3372,3388 | Relative K₂ and its two-invertible specialization are supplied; ℤ[ε] retains the ℤ/2 obstruction. |
| De Rham and trace inputs | TauCetiRoadmap/DerivedDeRhamCohomology/README.md Layers 0,2,5; AInfCohomology/README.md:3815; CrystallineCohomology/README.md CR.4 | Quasisyntomic, perfectoid, Tate, Bökstedt and ordinary de Rham–Witt inputs remain with their owners. |
| Prismatic/q-PD/syntomic inputs | TauCetiRoadmap/PrismaticCohomologyPartII/README.md:1619–1781; PrismaticCohomologyPartIII/README.md:673,739,862; CohomologyComparisons/README.md:688 | §§5.1–5.8, §§6.28,6.31,7.0 and §3.7 exist. Commutative Beilinson square imported; associative and K-theoretic extensions stay here. |
| Solid and Habiro interfaces | TauCetiRoadmap/SolidAnalyticRings/README.md §§1–2,6.4; QWittVectors/README.md:443; HabiroRings/README.md §§2.6–2.12,5.6,5.8,5.9; HabiroCohomologyFoundations/README.md §§0.1,4.1,4.21,4.28,5.26 | S02 and S04 identify ownership/drift. The supplied heads distinguish algebraic completion, spectral completion, framed pullback and marked étale comparison. Declared gaps of those suppliers are not findings here. |

No additional owner was found in the other supplied open folders for ordered trace-class duality, continuous localizing motives, cyclotomic Cartier equivalence, spectral even filtrations or the trace-specific framed comparison. The algebraic framed objects are supplied by HabiroCohomologyFoundations, and this roadmap owns their trace comparison. No move to a later owner is proposed.

Exact dependency-check output at the reviewed head:

```text
depcheck: 28 roadmaps, 251 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. S02/S04's replacement owners are earlier in the supplied order. No merge-order or design file was changed.

### Source locator ledger

Each row supplies a directly checked anchor in the legally cached edition; multiple statements in the same work were also checked where used. Source passages are not reproduced.

| Source | Checked locator and extraction anchor | Scope or normalization verified |
| --- | --- | --- |
| ammn | Definition 2.14, line 492; Propositions 3.1–3.3, lines 697,710,742 | β composition direction, Cartier detection and graded truncation; source slips listed below. |
| an | Theorem 2.1, line 334; Theorem 3.21, line 1204; Proposition 3.22, line 1210; Theorems 6.1,6.14, lines 2809,2924 | Bounded-below Cartier equivalence, derived completion and cyclotomic heart. |
| ar | Definitions 2.55,2.61 and Constructions 2.58,2.63, lines 586,632,601,661 | Synthetic orbit/fixed-point adjunctions and shifted norm. |
| bgt | Theorems 7.13,8.7, lines 2235,2525; Corollary 10.4, line 3346; Proposition 10.8, line 3446 | Finitary motive restriction, sphere-class trace and finite TC stages. |
| bgt-mult | Corollary 3.8, line 647; Lemma 5.5 and Propositions 5.6–5.7, lines 983,999,1012 | Monoidal localization and contractible unit-algebra maps. |
| bms | Theorem 1.12, line 317; Construction 6.8, line 2091; Propositions 7.16–7.17, lines 2470,2485; Proposition 9.14, line 3668 | Twists, commutative perfectoid-base context, negative TC and Adams weights. |
| bs | Theorem 14.1 and Corollary 14.2, lines 3680,3685; Lemma 16.10, line 4148 | Sheafwise discreteness; complete flatness and completely regular-sequence hypotheses. |
| ba | §I.1, line 77 | Ordinary shuffle/AW versus cyclic coextension; leading shuffle is not asserted B-linear. |
| blm | §9, lines 1888–1898 | Distinct Bass–Heller–Swan and source Dennis signs. |
| cmm | Theorem A, line 96; Theorems 2.25,4.33,5.5, lines 628,1473,1655; Corollary 6.9, line 2273 | Henselian finite coefficients, smooth TR, excision and noetherian/F-finite continuity. |
| co | Main Theorem 0.1, line 33 | Birelative rational excision with an isomorphism on the ideal. |
| d-thesis | Theorems 6.1.4,6.4.1 and Notation 6.2.8, lines 9553,10032,9793 | Odd-prime assumptions, j and relative ku comparison. |
| dr | Notation 0.1.2, line 56; Theorem 0.1.4, line 72; Proposition 1.2.5, line 422 | Odd-prime cyclotomic comparison and β↦(ζp−1)u. |
| du | Main Theorem, line 40 | Nilpotent π₀-surjection and p-completed classical statement. |
| e-cont | Definition 8.5 and Propositions 8.6–8.7, lines 4425–4437 | Continuous extension agrees with the input nonconnective invariant on compactly generated categories. |
| e-mot | Proposition 1.1, line 565; Definition 1.2, line 729; Theorems 2.1,3.1, lines 937,1089; Definition 3.2, line 1107 | Ordered duals, compact unit, both trace-class directions and κ-finitary universal property. |
| ec2 | Theorem 6.5.1, line 9427 | Snaith equivalence is an E∞-ring equivalence. |
| g | Proposition 5.2.1 and Theorem 9.1.3, lines 989,2086 | Ordinary Morita/HKR background; not an unrestricted replacement for derived supplier inputs. |
| gs | §1.1, lines 18–30 | Bott localization and the classical Snaith motivation. |
| h | Theorem 2.1, line 188 | Circle realization agrees with cyclic, negative and periodic complexes. |
| ha | Propositions 1.2.1.19,1.4.4.11, lines 1764,6013 | Countable-product closure and left separation; presentability/extension closure for the connective aisle. |
| hkr | Theorem 5.2, line 548 | Regular affine algebra over a perfect field in the original theorem; general smooth input is imported separately. |
| h05 | §3.2, equation (3.8), line 355 | Representation grading and the diagonal circle action. |
| hm97 | Theorem 2.3, line 924 | Ordinary commutative ring, Wₙ₊₁ indexing and R,F,V compatibility. |
| hn | Theorem 1.4.1, line 1291 | Connective E₁ ring, p-completion, pointed Cₚ and suspension of p−1 orbit summands. |
| hrw | Definition 1.1.1 and Construction 2.1.3, lines 82,485 | Even-ring right Kan extension of double-speed Postnikov filtration. |
| he | Theorems B–C, lines 75,83 | Smooth perfect-field setting; restriction kills the positive polynomial generator in the limit. |
| kb | III.4.3.1, line 12195; IV.2.10, line 16472 | Tetrahedral negative K witness and invertible-coefficient Gabber rigidity; book/chapter paginations distinguished. |
| ke | §§2.2,2.4, lines 219,277 | Unbounded DG mixed localization and nonunital corners in the bimodule construction. |
| kn | Theorem 1.1, line 117 | THH(𝔽ₚ) free as an E₁ algebra on its degree-two generator, at every prime. |
| l20 | Examples 5,7, lines 40,53 | Ring-module spectra are local; rational localization detects rational homotopy groups. |
| lmmt | Remarks 3.9,3.11, lines 637,660 | Nilpotent/perfection warning and stable-K derivative; the latter's shift slip is listed below. |
| lq | Theorem 1.6, Corollary 1.7, Proposition 2.2 and Theorem 2.9, lines 200,209,280,338 | SBI degrees, Morita invariance, B/de Rham comparison and characteristic-zero hypothesis. |
| lt | Theorem 3.3, Corollaries 3.5–3.6 and Example 3.8, lines 1197,1204,1217,1231 | Truncating excision; nilpotent cannot be replaced by locally nilpotent. |
| mw | Theorems 2.4,2.21,3.14, lines 441,787,1551; §3.4, line 1304 | Compact-unit nuclearity, refined localization and torsion-free finite-coefficient bridge. |
| mcc | Main Theorem, line 40 | Nilpotent comparison after p-completion, including simplicial rings. |
| ns | Theorem I.4.1, line 1211; Proposition II.2.4, line 1717; Proposition B.5, line 7077 | Parametrized Tate characterization (S07), genuine fixed-point model and cyclic realization (S08). |
| p | Definition 2.2, line 317; Proposition 4.3, line 1286; Proposition 6.19, line 1904 | Perfect-even retract/extension closure and connectivity needed for the faithful-flat converse. |
| r-gal | Proposition 5.3.1, line 1027; §§5.5.1–5.5.2, lines 1438,1455 | KO fixed points at two and the separate odd-prime Adams fiber. |
| r | Theorem 1.1.1, line 20; Theorems 2.12.1–2.12.2, lines 449,458; Proposition 5.5.3, line 1453 | General connective nilpotent comparison, positive suspension derivative and convergence inputs. |
| pri | Remark 1.2 and Lemma 1.3, lines 101,111 | Toric Adams and λ-operation normalization for diagonal divided powers. |
| s-ber | §8, lines 1944–1960 | Almost-module colimit argument; addition closure is not supplied by arbitrary Banach norms. |
| stacks | Tag 07L7, Example 60.19.1, line 1728 | Explicit cosimplicial free-module contraction, not a general descent theorem. |
| w | Theorems 4.1,4.8,4.14,4.16,4.17,4.27, lines 1478,1598,1796,1802,1908,2143; Theorems 5.51,5.63,6.10, lines 3292,3556,3726 | E₂/E₁ alternatives, all-prime bridge, completed filtration, twisted and framed comparisons; source corrections below. |
| w-hab | Example 3.12 and Corollary 3.13, lines 1105,1174 | Coordinate filtration is pulled back from qΩ to qdR; étale Habiro conclusion. |
| wg | Theorem 0.1, line 57 | Étale Hochschild base change; no inference that Connes B is scalar-linear. |
| ram | Construction 4.79 and Theorem 4.81, lines 1737,1745 | Uncountable κ and rationally indexed trace-class telescopes. |
| hatcher | Theorem 2.20, line 2450 | Bundle Adams operations, rank and line powers; stable negative/localized extensions require the Snaith target. |

### Computed adversarial pass: every bold mathematical target

Locations below are line numbers in packages/RefinedTraceMethods/README.md. The section is the declaration context; there are no Lean variable or instance contexts to substitute. Non-applicable test classes (for example a characteristic-p sign test on an abstract presentable category) are not treated as successful checks. The concrete tests instantiate the relevant class instead.

| Location; statement | Instances | Computed values on both constructions | Result; change |
| --- | --- | --- | --- |
| 79; §1.1 Connes' cyclic category and cyclic objects | n=1,2 | τ₁(a,b)=(b,a), τ₁²(a,b)=(a,b); τ₂³(a,b,c)=(a,b,c) | Instance compatible; prose API. |
| 108; §1.1 The cyclic enhancement of supplied derived Hochschild chains | A=𝔽₂ over ℤ | HH₀=𝔽₂, HH₁=0, HH₂=𝔽₂; the underived self-base calculation would give HH₂=0 | Instance compatible; ordinary input imported. |
| 138; §1.2 Connes' operator B | A=ℤ[x] | B[x²]=[1⊗x²] maps to 2x dx; changing the signed rotation leaves a nonzero bB+Bb term | Instance compatible; sign retained. |
| 164; §1.2 Mixed complexes | M=(k→ᶦᵈk), B=0 | b-homology=(0,0); bB+Bb=0 and B²=0 | Instance compatible; unbounded carrier retained. |
| 194; §1.3 Derived category of mixed complexes | k≠0, M=(k→ᶦᵈk); also b=0,B=id on k in degrees 0,1 | First H_b(M)=0, outer H⁰(M[0])=M≠0. Second HC⁻₀=0, HC⁻₁=k; B=0 instead gives HC⁻₀=k | Old replacement sound; separate repetitive Check S05. |
| 216; §1.3 Functorial precyclic mixed cone | constant cyclic k in degrees 0,1 | b₁=0, b′₁=id, 1−t₀=0; the cone's b′ sign cancels the off-diagonal composite | Instance compatible; cone sign retained. |
| 241; §1.4 Cyclic, negative cyclic and periodic cyclic homology | M=k[0]; M₂ⱼ=k | CC₀=CN₀=k for k[0]; for the second M, CN₀=∏k whereas CC₀=k | Instance compatible; sum/product distinguished. |
| 272; §1.4 Connes' SBI exact sequence | M=k[0] | HH₀=k, HC₀=HC₂=k, S:HC₂→HC₀=id; HH₁=0 | Instance compatible; sequence degrees retained. |
| 286; §1.5 The mixed-complex comparison compatibility | identity of k[0] | fB=Bf=0; induced CC₀,CN₀,CP₀ maps send 1 to 1 | Instance compatible; compatibility checked. |
| 298; §1.6 Morita invariance of Hochschild and cyclic homology | M₂(𝔽₂) | tr(E₁₁)=1, tr(I₂)=0; HH₀(M₂(𝔽₂))≅𝔽₂ | Instance compatible; no division by matrix size. |
| 310; §1.6 Shuffle and external products | k[x], k[y] | sh(dx⊗dy)=[1⊗x⊗y−1⊗y⊗x]; projection gives 2dx∧dy | Instance compatible; cyclic correction retained. |
| 343; §1.7 Hochschild homology of a commutative ring is its tensor with the circle | A=R=ℤ | HH₀(ℤ/ℤ)=ℤ, HHᵢ=0 for i>0; tensor-with-circle algebra is ℤ | Instance compatible; identity base. |
| 357; §1.8 Base change and flat base change for Hochschild homology | ℤ→𝔽₂, A=ℤ | HH(ℤ/ℤ)⊗ᴸ𝔽₂=𝔽₂=HH(𝔽₂/𝔽₂); 𝔽₂⊗ᴸℤ𝔽₂ additionally has Tor₁=𝔽₂ | Instance compatible; derived tensor retained. |
| 369; §1.8 Étale base change (Weibel–Geller) | ℚ[x]→ℚ[x±¹] | HH₁=ℚ[x±¹]dx; d(x⁻¹)=−x⁻²dx, so B is not scalar-linear | Instance compatible; no cyclic tensor inference. |
| 383; §1.9 The antisymmetrisation map and the HKR projection | n=2; k=ℤ,𝔽₂ | πε(dx∧dy)=2dx∧dy over ℤ and 0 over 𝔽₂ | Instance compatible; factorial retained. |
| 410; §1.9 Connes' operator is the de Rham differential under HKR | A=ℚ[x], n=0 | Bε(x²)=2x dx=εd(x²); in degree one π₂B=2dπ₁ | Instance compatible; normalization retained. |
| 424; §1.11 The derived HKR filtration | A=R; A=𝔽₂/R=ℤ | first has gr⁰=R and higher gr=0; second has grⁿ=𝔽₂[2n] | Instance compatible; derived cotangent retained. |
| 436; §1.11 Hochschild homology of `𝔽_p` over ℤ | p=2,3 | u²=2γ₂(u)=0 at 2; u³=6γ₃(u)=0 at 3, unlike polynomial THH powers | Instance compatible; divided powers retained. |
| 464; §2.1 Spectra with an action of a group | G=1; G=S₃ | Fun(B1,Sp)=Sp; the regular action has six basis vectors and satisfies ρ(gh)=ρ(g)ρ(h) | Instance compatible; no abelian-group restriction. |
| 490; §2.1 Homotopy orbits and homotopy fixed points | G=T, trivial Hℤ | π₀(hT)=ℤ, π₋₂(hT)=ℤ; translation T₊ has homotopy orbits S | Instance compatible; continuous action retained. |
| 519; §2.2 Tate spectra of Eilenberg–Mac Lane spectra are Tate cohomology | C₂,C₃,S₃; trivial ℤ | Ĥ⁰=ℤ/2,ℤ/3,ℤ/6 respectively; Ĥ⁻¹=0; cyclic even/odd groups are ℤ/n,0 | Instance compatible; parity retained. |
| 533; §2.3 Tate endomorphisms in the finite-action Verdier quotient | R=H𝔽₂ | endomorphism spectrum in the quotient is H𝔽₂ᵗᶜ² with π₀=𝔽₂; induced objects map to zero | Instance compatible; finite-action specialization. |
| 547; §2.4 Tate constructions at `C_p:` convergence, vanishing and p-completeness | C₂, induced Hℤ | induced Tate groups are all 0; trivial Hℤ instead has even groups ℤ/2 | Instance compatible; induction control. |
| 559; §2.4 The Tate fixpoint lemma | X=H𝔽₂ with trivial C₄-action | the iterated hC₂/tC₂ norm double complex is acyclic; target homotopy groups are 0 | Instance compatible; bounded-above hypothesis retained. |
| 573; §2.5 The Tate construction for a Kan complex and the dualizing spectrum | S=∅,*; BC₂,BT with Hℤ | At ∅ assembly=0; at * norm=id and Tate=0. The competitor id→id with zero transformation has fiber id⊕Ωid. BC₂ norm π₀=2, Tate π₀=ℤ/2; BT norm source=ΣHℤ_hT | Uniqueness fails S07; missing Checks S05 |
| 587; §2.6 Geometric realisation of cyclic objects and the circle action | constant cyclic k; representable Λ[0] | realization is k with trivial action in the first case and T in the second | Instance compatible; action not discarded. |
| 612; §2.6 Edgewise subdivision and Tate constructions of realisations | r=1,2 | sd₁X₀=X₀, sd₂X₀=X₁; both realizations identify with the same cyclic realization | Mathematical instance compatible; locator correction S08. |
| 626; §2.7 Topological Hochschild homology of an `E_1-ring` | A=S,H𝔽₂ | THH(S)=S; π₂THH(𝔽₂)=𝔽₂ while HH₂(𝔽₂/𝔽₂)=0 | Instance compatible; associative extension. |
| 655; §2.7 The cyclotomic Frobenius of THH | A=S, p=2 | π₀φ sends 1∈ℤ to 1∈ℤ₂; this is completion, not a zero map | Instance compatible; Frobenius unit retained. |
| 680; §2.7 THH relative to an `E_∞-ring` | k=A=Hℤ; A=Hℤ[x] | relative THH is Hℤ in the first case; polynomial case has π₁=ℤ[x]dx | Instance compatible; moved before consumer. |
| 706; §2.7 THH relative to THH(ℤ) is Hochschild homology | A=ℤ | π₁THH(ℤ)=ℤ/1=0, π₃=ℤ/2; HH₃(ℤ/ℤ)=0 | Instance compatible; moved before consumer. |
| 718; §2.7 Bökstedt periodicity | p=2, u degree two | u²≠0 in π₄THH(𝔽₂), but divided-power u²=0 in HH₄(𝔽₂/ℤ) | Instance compatible; free E₁ refinement. |
| 742; §2.8 Mixed complexes model complexes with circle action | trivial T-action on k[0] | homotopy fixed π₋₂=k equals the u-column of CN; π₁=0 | Instance compatible; mixed realization retained. |
| 754; §2.8 The norm sequence for cyclic homology | A=k | ΣHC has π₁=k; HC⁻₁=0 and HP₂=k, with connecting HP₂→HC₀=id | Instance compatible; suspension retained. |
| 766; §2.8 Circle and finite Tate constructions for HZ-module spectra | X=Hℤ; n=1,2 | finite Tate gives 0 at n=1 and π₂ⱼ=ℤ/2 at n=2; odd groups are zero | Instance compatible; n=1 control. |
| 780; §2.9 Lax equalizers of ∞-categories | F=id,G=0 on a stable category | every x has the unique arrow x→0, so LEq≃C; at x=0 the mapping spectrum is 0 | Instance compatible; coherent equalizer. |
| 809; §2.9 THH is symmetric monoidal; THH of `E_∞-rings` | A=B=S | THH(S⊗S)=S=THH(S)⊗THH(S), and π₀ sends 1⊗1 to 1 | Instance compatible; unit comparison. |
| 823; §2.10 Negative topological cyclic and periodic topological cyclic homology | A=𝔽₂ | π₀TP=ℤ₂ versus HP₀(𝔽₂/𝔽₂)=𝔽₂; TC⁻(0)=TP(0)=0 | Instance compatible; completion retained. |
| 850; §2.10 The Nikolaus–Scholze formula for TC | X=Hℚ | all finite Tate terms vanish; π₋₂TC_T=ℚ, while the Prüfer version has π₋₂=0 | Instance compatible; uncompleted distinction. |
| 862; §2.10 TC is right adjoint to the trivial cyclotomic structure; Frobenius on connective covers | Y=S, X=THH(𝔽₂) | sphere unit 1 maps to 1∈π₀THH(𝔽₂)=𝔽₂; zero transformation maps it to 0 | Instance compatible; adjunction unit fixed. |
| 876; §2.11 THH and TC of spherical group rings and loop spaces | G=S₃ | LBG has three conjugacy components; HH₀(ℤ[S₃]) has rank 3, not 6 | Instance compatible; nonabelian control. |
| 888; §2.11 THH of spectral and stable ∞-categories | C=Perf(M₂(𝔽₂)) | Morita trace sends E₁₁↦1 and I₂↦0 in π₀THH=𝔽₂ | Instance compatible; ordinary Morita overlap. |
| 916; §2.12 Orthogonal spectra | orthogonal sphere, n=0,1,2 | levels S⁰,S¹,S²; iterated structure maps identify Sⁿ∧Sᵐ with Sⁿ⁺ᵐ | Instance compatible; model normalization. |
| 942; §2.12 Genuine G-spectra, genuine and geometric fixed points | G=1,C₂ | π₀ of genuine sphere fixed points is ℤ,ℤ² respectively | Instance compatible; finite-group refinement. |
| 969; §2.12 Geometric fixed points via complete universes | C₂ sign line V | Vᶜ²=0, hence Φᶜ²Sⱽ=S⁰; forgetting gives S¹ | Instance compatible; geometric convention. |
| 996; §2.13 Borel-complete genuine spectra | Borel-completed Hℤ | categorical fixed π₀=ℤ and π₋₂=ℤ/2 equal homotopy fixed values | Values compatible; Check coverage S05 |
| 1008; §2.13 Geometric fixed points as a localisation | H=1; H=C₂ on sign sphere | Φ¹Sⱽ=S¹ and Φᶜ²Sⱽ=S⁰ | Instance compatible; localization tests. |
| 1020; §2.13 Isotropy separation for cyclic p-groups | C₂ sphere | π₀ orbit-to-fixed sends 1 to [C₂/1] in A(C₂)=ℤ²; geometric quotient has π₀=ℤ | Instance compatible; restriction triangle. |
| 1034; §2.14 Genuine `C_{p^∞}-spectra` and F-genuine T-spectra | cofiber of E_F₊→S | finite geometric fixed points=0, full T-geometric fixed points=S; finite-family image=0 | Instance compatible; finite family retained. |
| 1060; §2.14 Orthogonal cyclotomic spectra model genuine ones | orthogonal sphere | ΦᶜⁿS=S; all root comparison maps send unit 1 to 1 | Instance compatible; supplied category used. |
| 1072; §2.14 TR and genuine TC | p=2, regular residual module ℤ[C₂] | FV(e₁)=e₁+e_g versus 2e₁; TR(𝔽₂) has π₋₁=0 versus π₋₁TC=ℤ₂ | Instance compatible; general tower differs from imported Witt case. |
| 1102; §2.14 Representation spheres and representation-graded TR | λ=ℂ(1),ℂ(2), subgroup C₂ | fixed complex dimensions are 0,1; sphere fixed dimensions are 0,2 | Instance compatible; weight direction retained. |
| 1137; §2.15 Coalgebras and fixed points of endofunctors | F=0,id | Fix₀={0}; CoAlg₀≃C; for F=id, (k,0) is not fixed but (k,id) is | Instance compatible; noninvertible arrow control. |
| 1164; §2.15 Genuine cyclotomic spectra coreflect | zero and cyclotomic sphere | coreflection values are 0 and S; underlying counit is 0→0 or unit 1↦1 | Instance compatible; coreflection boundary. |
| 1178; §2.16 The Bökstedt construction and classical THH | I-object [2] | End_I([2]) has 2 elements; End_ℕ(2) has 1; THH(S) has π₀=ℤ | Instance compatible; injection category retained. |
| 1204; §2.16 The two THH agree as cyclotomic spectra | A=H𝔽₂ | classical and modern π₂=𝔽₂ and unit coefficient 1 agrees | Instance compatible; supplied category comparison. |
| 1218; §2.17 The restriction pullback for genuine fixed points | C₂ sphere, n=1 | fixed π₀=A(C₂)=ℤ²; the restriction/Tate pullback has the same two Burnside coordinates | Instance compatible; pullback checked. |
| 1232; §2.18 Hesselholt’s de Rham–Witt comparison for TR | R=𝔽₃ | TRⁿ₀=Wₙ(𝔽₃)=ℤ/3ⁿ; positive R-limit groups vanish, leaving W(𝔽₃)=ℤ₃ | Instance compatible; discrete Witt input imported. |
| 1260; §3.1 Circle-equivariant p-typical cyclotomic spectra | X=Hℚ | circle version π₋₂=ℚ, Prüfer version π₋₂=0; after p-completion both vanish | Instance compatible; convention distinguished. |
| 1289; §3.2 Classical p-typical Cartier modules | M=ℤ; M=(𝔽₂)² | F=p,V=1 gives FV=p; projection/shift gives FV=0 and VF(1,0)=(0,1) | Instance compatible; no VF axiom. |
| 1315; §3.2 Topological Cartier modules | M=0; M=Hℤ | zero maps compose to zero; F=p,V=id compose to norm p on degree zero | Instance compatible; norm law retained. |
| 1344; §3.3 Derived V-completeness | V=id on 𝔽₂; V=p on Prüfer | first tower limit=𝔽₂≠0; second derived completion=ℤₚ[1], ordinary completion=0 | Instance compatible; completion distinction. |
| 1371; §3.4 The cyclotomic t-structure | X=THH(𝔽₂) | cyclotomic π₀ corresponds to ℤ₂, although underlying π₀ is 𝔽₂ | Instance compatible; t-structure not ordinary Postnikov. |
| 1397; §3.4 TR as V-complete topological Cartier modules | X=THH(𝔽₃) | TR(X)=Hℤ₃, π₀=ℤ₃, all other homotopy zero | Instance compatible; essential image test. |
| 1409; §3.4 The derived V-complete Cartier heart | M=ℤ₂, F=id,V=2 | Cartier heart coefficient is ℤ₂ while its cyclotomic realization has underlying degree-zero 𝔽₂ | Instance compatible; heart/carrier distinction. |
| 1423; §3.5 TR detects cyclotomic quasi-isogenies | multiplication by 2 on ℤ₂ | inverse with denominator 2 satisfies gf=fg=2; multiplying an additive inverse g by n gives composites n² | Instance compatible; isogeny criterion. |
| 1435; §3.5 TR with a null cyclotomic Frobenius | X=Hℚ, null Frobenius | each X_hCₚⁿ=Hℚ and TR=∏ₙHℚ; π₀=∏ₙℚ | Instance compatible; infinite product retained. |
| 1449; §3.6 Positively graded cyclotomic spectra | only weight 1 is H𝔽₂ | X₀=0; positive-weight Frobenius has target 0, so is zero; all other weight groups=0 | Instance compatible; positive convention. |
| 1475; §3.6 Graded cyclotomic torsion and connective convergence | same finite-support graded X | every group is killed by 2; high weights have connectivity ∞; each bounded truncation is 2-isogenous to 0 | Instance compatible; quasi-isogeny hypotheses. |
| 1503; §4.1 Relative dualizable presentable stable categories | E=Sp, C=Mod_k | relative dual is Mod_k with evaluation tensor over k; unit pair gives k⊗ₖk=k | Instance compatible; relative structure. |
| 1528; §4.2 Ordered trace-class morphisms and the symmetric comparison | k→k, scalar 2 | trace classifier 2 evaluates to the map x↦2x; 0 evaluates to the zero map | Instance compatible; ordered source/target. |
| 1554; §4.2 Functoriality and preduals of trace-class maps | k→k, scalar 2 and scalar extension k→L | predual still has scalar 2; base change gives 2∈L | Instance compatible; predual direction. |
| 1566; §4.3 E₁ rigidity extending the supplied symmetric notion | E=D(k) | unit k has Hom(k,⊕ᵢk)=⊕ᵢk; compactness holds | Instance compatible; rigidity unit. |
| 1589; §4.3 Nuclear objects | P=kⁿ, X=⊕ᵢk | every P→X has finite-dimensional image; id_X has infinite rank when the index set is infinite | Instance compatible; compact domain versus identity. |
| 1612; §4.3 Trace-class generation criterion for rigidity | E=∏ₙD(k) | Hom(1,⊕ₙeₙ)=∏ₙk while ⊕ₙHom(1,eₙ)=⊕ₙk; these differ | Instance compatible; compact-unit hypothesis. |
| 1622; §4.3 Closure and generation of nuclear objects | D(k), X=k,Y=k | X⊕Y=k², X⊗Y=k; both are nuclear, with scalar classifiers 1 | Instance compatible; closure tests. |
| 1634; §4.4 The continuous Calkin category | C=0 | Ind(0)=0 and Calk_cont(0)=0; the resulting loop invariant is 0 | Instance compatible; zero category. |
| 1657; §4.4 Accessible localizing invariants | triangle ring R | IK₋₁(R)=ℤ but K₋₁(R)=0; suspension sequence gives 0→ℤ on K₀ | Instance compatible; localizing distinction. |
| 1682; §4.5 Continuous extensions of localizing invariants | C=Mod_R, triangle ring | π₋₁Kcont=ℤ=π₋₁IK(Perf R), versus 0 for connective K | Instance compatible; comparison repaired. |
| 1705; §4.5 Uniqueness of continuous extension | C=Ind(Perf 𝔽₂) | Fcont(C)=F(Perf 𝔽₂); for IK, degree zero is ℤ on each side | Instance compatible; extension uniqueness. |
| 1717; §4.6 The category of relative localizing motives | E=Sp, unit motive and Perf 𝔽₂ | mapping invariant has π₀K(𝔽₂)=ℤ; Uloc(0)=0 | Instance compatible; concrete invariant retained. |
| 1742; §4.7 Nuclear E-modules | E as its own module; 0 | unit classifier is compact 1; zero classifier=0 and zero sequential colimit=0 | Instance compatible; categorical nuclearity. |
| 1765; §4.7 The nuclear resolution of length one | one-object A with End=k | Hom_B(n,m)=k for n≤m, 0 otherwise; Φ(hₙ)=k and Φ(fib(h₀→h₁))=0 | Instance compatible; quotient not equivalence. |
| 1790; §4.8 Enriched trace-class duality | one-dimensional k-duality | evaluation(2⊗3)=6 and both triangle composites send 1↦1 | Instance compatible; ordered duality. |
| 1800; §4.8 Rigidity of relative localizing motives | E=Sp | pairing on unit and Perf 𝔽₂ has π₀=ℤ; opposite of Sp is the same monoidal base | Instance compatible; dual-base convention. |
| 1812; §4.9 Connective K-theory of small stable ∞-categories | C=Perf 𝔽₂ and 0 | K₀=ℤ and 0; S₀ has only the zero diagram | Instance compatible; stable S-construction. |
| 1836; §4.9 Nonconnective K-theory by the suspension construction | finite-free complexes over k×k | K₀=ℤ maps diagonally into IK₀=ℤ² | Instance compatible; degree-zero idempotents. |
| 1864; §4.9 Localizing and truncating invariants | triangle ring; split product k×k | negative group ℤ detects failure for K; IK₀(k×k)=ℤ² respects products | Instance compatible; exact versus split-exact. |
| 1892; §4.10 K-theory units of finitary invariants | additive/localizing units | π₀K(𝔽₂)=π₀IK(𝔽₂)=ℤ; only IK has triangle-ring degree −1 equal to ℤ | Instance compatible; unit theories distinguished. |
| 1904; §4.10 The Dennis trace | A=ℤ[t±¹] | positive trace gives t⁻¹dt; source Dennis generator t·d(t⁻¹)=−t⁻¹dt; sum=0 | Instance compatible; review b sign claim disputed. |
| 1933; §4.11 The cyclotomic trace | A=𝔽₂, free module | trace sends rank 1∈ℤ to 1∈ℤ₂; zero category sends 0 to 0 | Instance compatible; trace normalization. |
| 1959; §4.11 Uniqueness and multiplicativity of the trace | sphere unit classification | π₀Nat(K,THH)=ℤ; required class is 1, zero map has class 0 | Instance compatible; uniqueness not vacuous. |
| 1973; §4.12 Relative K-theory, relative TC and `K^inv` | f=id_A | K(f)=IK(f)=TC(f)=0; absolute K₀(𝔽₂)=ℤ is nonzero | Instance compatible; relative/absolute distinction. |
| 2001; §4.13 THH with bimodule coefficients | A=S, M=S or 0 | THH(S;S)=S with π₀=ℤ; THH(S;0)=0 | Instance compatible; coefficient source/target. |
| 2026; §4.14 Connective bimodules and square-zero extensions | A=𝔽₂, square-zero M=𝔽₂ | (a,m)(b,n)=(ab,an+bm); (0,1)²=0 | Instance compatible; extension tied to bimodule. |
| 2050; §4.14 Goodwillie derivatives | F(M)=M and F(M)=M⊗M | derivatives are M and 0; quadratic cross-effect is M⊗N⊕N⊗M | Instance compatible; stabilization tests. |
| 2082; §4.15 Stable K-theory is THH (Dundas–McCarthy) | A=Hk, M=Hk | derivative ΣTHH(A;M) has π₁=k and π₋₁=0 | Instance compatible; suspension sign. |
| 2094; §4.15 Stable TC is THH, compatibly with the trace | A=Hk, M=Hk | derivative TC and derivative K both have π₁=k; derivative trace sends 1↦1 | Instance compatible; compatible trace derivative. |
| 2108; §4.16 Pseudo-extensible functors | zero reduced functor | cross-effect=0 and every suspension transition 0→0 | Instance compatible; extensibility boundary. |
| 2130; §4.16 Postnikov-convergent algebra functors | A=H𝔽₂ | lim_n τ≤n A=H𝔽₂; π₀ is 𝔽₂ at every stage | Instance compatible; actual Postnikov convergence. |
| 2152; §4.16 Infinitesimal sifted-colimit preservation | linear coefficient functor over k | colim kⁿ=k^(ℕ); THH(k;−) on this system has degree-zero colimit k^(ℕ) | Instance compatible; sifted-colimit input. |
| 2174; §4.16 Convergence: from derivatives to nilpotent extensions | identity extension | relative functor=0, derivative=0 and comparison=0→0 | Instance compatible; convergence boundary. |
| 2188; §4.17 The Dundas–Goodwillie–McCarthy theorem | 𝔽₂[ε]→𝔽₂ | (1+ε)²=1, so relative K₁=ℤ/2 and the relative 2-complete trace gives that same degree-one group | Instance compatible; general connective extension retained. |
| 2200; §4.17 Henselian rigidity of the trace with finite coefficients | 𝔽₂ versus strict henselian case | pointwise π₋₁TC/2=𝔽₂ but π₋₁K/2=0; I=0 gives relative 0 | Instance compatible; trace rigidity hypotheses. |
| 2225; §4.17 Goodwillie's rational theorem | ℚ[ε], I=(ε) | K₁,rel⊗ℚ=ℚ=HC₀,rel; K₂,rel=0=HC₁,rel | Instance compatible; ordinary supplier case imported. |
| 2239; §4.18 `K^inv` is truncating | A discrete 𝔽₂; identity truncation | Kinv(A)→Kinv(π₀A) is identity; its fiber=0 | Instance compatible; truncation boundary. |
| 2251; §4.18 The trace square for filtered towers | tower ℤ/2ⁿ | lim ℤ/2ⁿ=ℤ₂ and lim¹=0 by surjectivity; constant identity towers have identical limit squares | Instance compatible; derived-limit term retained. |
| 2263; §4.18 Continuity of K-theory modulo p | R=ℤ₃, degree-zero mod 3 | K₀(R)/3=ℤ/3; every finite quotient has the same ℤ/3 and identity transition | Instance compatible; finite coefficients retained. |
| 2275; §4.18 Truncating invariants: nil-invariance and excision | nilpotent dual numbers; node pullback | quotient kills ε²=0; k[x,y]/xy identifies with pairs (f,g) satisfying f(0)=g(0) | Instance compatible; nilpotence/excision tests. |
| 2289; §4.19 The TC assembly map for `C_p` | p=2,3 | nonidentity Cₚ components number p−1=1,2; each contributes one suspended orbit term | Instance compatible; pointed-group convention. |
| 2301; §4.19 Low-degree tests: dual numbers and truncated polynomials | k=ℚ and ℤ | dual-number K₁,rel=ℚ; K₂,rel(ℤ)=ℤ/2 whereas Ω¹ℤ/ℤ=0 | Instance compatible; invertibility control. |
| 2315; §4.20 Continuous K-theory of almost modules | ℂ; p-adic root example | 3/4+3/4=3/2; at p=2, ∣∣rᵢ∣∣=2^(−1/2ⁱ) and ∣∣aᵢ∣∣<1 | Ideal/colimit repair correct; absolute Dennis example following this target fails S01 |
| 2354; §5.1 Snaith construction of stable Adams operations | k=2,−1 | ψ²β=2β, inverse Bott would map to β⁻¹/2; ψ⁻¹β=−β and its square fixes β | Instance compatible; localization and sign. |
| 2378; §5.1 Coherent stable lifts of the supplied Adams operations | i=0,1; k=2 | π₀BU=0, K̃(S⁰)=ℤ; π₂ψ² multiplies by 2; rank on ℤ×BU stays 1 | Instance compatible; degree range repaired. |
| 2406; §5.2 Graded polynomial and Laurent HKR for ku and KU | rational β, β⁻¹ | Bβ²=2β dβ, Bβ⁻¹=−β⁻²dβ; dβ has total degree 3 and square 0 | Instance compatible; internal degree retained. |
| 2418; §5.2 THH relative to ku and KU | S_R=S | THH(ku/ku)=ku has π₃⊗ℚ=0; absolute THH(ku) has π₃⊗ℚ=ℚ | Instance compatible; relative base retained. |
| 2432; §5.3 ku and KU with circle and cyclic-group actions | p=2 | [2]_q=1+q, q=−1 gives 0; q−1=βt has degree 0 | Instance compatible; orientation normalization. |
| 2460; §6.1 Étale algebras lift uniquely to étale `E_∞-algebras` | A=S; R=ℤ[1/2] | identity étale lift is S; localization lift S[1/2] has π₀=ℤ[1/2] and cotangent 0 | Instance compatible; moved before constructors. |
| 2472; §6.1 Spherical lifts and the base hypotheses | A=R=ℤ_p | S_p⊗S_p Hℤ_p=Hℤ_p; ku-lift alone has extra β with ∣β∣=2 | Instance compatible; spherical versus ku lift. |
| 2498; §6.1 Compatible local and global spherical lifts | A=R=ℤ[1/2] | 2-adic completion=0; odd-prime completion=ℤ_p; arithmetic intersection recovers ℤ[1/2] | Instance compatible; gluing assumptions. |
| 2523; §6.2 Light condensed and solid spectra | p=2, source/ambient units | π₀(image S₂)=ℤ₂ versus π₀(S)=ℤ; unit map is completion | Unit repair correct; duplicate ownership S02 |
| 2549; §6.2 Trace-class maps and nuclear modules | one-dimensional module, scalar 2 | classifier 2 evaluates to scalar 2; infinite direct-sum identity is not finite rank | Instance compatible; trace-class control. |
| 2577; §6.3 Perfect even modules and the even site | R=Hℤ | R and Σ²R have even homotopy; ΣR has π₁=ℤ and is not even-perfect | Instance compatible; parity control. |
| 2602; §6.3 Homological evenness and even homotopy sheaves | M=R,ΣR over Hℤ | even sheaf at q=0 detects ℤ for R; proper half-weight q=1/2 detects ℤ for ΣR | Instance compatible; half-integer distinction. |
| 2629; §6.4 Even flat and solid even flat modules | R=Hℤ, M=H𝔽₂ | M⊗ᴸ_R M has π₁=𝔽₂ despite M itself being even | Instance compatible; even flatness not parity alone. |
| 2653; §6.4 Faithfully even flat ring maps | R→R and Hℤ→H𝔽₂ | identity cofiber=0; second has derived self-tensor Tor₁=𝔽₂ | Instance compatible; faithful even-flat hypotheses. |
| 2675; §6.4 Solid duality assumption R | R=M₂(ℤ) and R=0 | Left/right products E₁₂E₂₁=E₁₁ and E₂₁E₁₂=E₂₂ differ; the dual of the product generator on either side is ⊕_ℕR; at R=0 both duals=0 | Both-sided hypotheses retained |
| 2699; §6.5 Even filtrations (Hahn–Raksit–Wilson and Pstrągowski) | R=H𝔽₂ | τ≥0 R=R, τ≥2 R=0; gr⁰=R and gr¹=0 | Instance compatible; double-speed filtration. |
| 2727; §6.5 The solid even filtration | R=M=solid Hℤ | filtration degree 0 gives Hℤ and degree 1 gives 0; gr⁰ has π₀=ℤ | Instance compatible; solid normalization. |
| 2755; §6.6 Synthetic finite cyclic fixed points and Tate | n=1 | norm=id, synthetic Tate=cofib(id)=0 | Instance compatible; degenerate cyclic order. |
| 2785; §6.6 Even-filtered circle fixed points and Tate | k=Hℤ | fixed π₀=ℤ, π₋₂=ℤ; mod t leaves Hℤ | Instance compatible; orientation shift. |
| 2812; §6.7 Even filtrations on solid relative THH | R=A=ℤ | THH(ku/ku)=ku; τ≥2 ku has first π₂=ℤ and gr¹=Hℤ[2] | Instance compatible; coefficient filtration. |
| 2826; §6.8 The K(1)-local sphere and its Adams fixed points | p=3,r=2 | r−1=1 is a 3-adic unit, r²−1=3; π₁J₃=0 and π₃J₃=ℤ/3 | Instance compatible; Adams direction. |
| 2854; §6.8 The connective image-of-J spectrum j | p=3 | connective j has π₀=ℤ₃, π₃=ℤ/3 and negative groups 0 | Instance compatible; connective cover. |
| 2884; §6.8 Nikolaus's `E_1` comparison at all primes | p=2 | ζ₂=−1, source π₀=ℤ₂=target π₀ku₂ᵗᶜ²; comparison asserted E₁ | Instance compatible; no E∞ upgrade. |
| 2896; §6.8 `THH(ℤ_p)` and the image of J (Devalapurkar–Raksit) | p=3 | first positive THH(ℤ₃) group is π₅=ℤ/3; π₁=π₂=0 | Instance compatible; odd-prime range. |
| 2908; §6.8 Devalapurkar's comparison of `THH(ℤ_p[ζ_p])` with ku | p=3 | π₀=ℤ₃[q]/(q²+q+1), q↦ζ₃ on both sides | Instance compatible; equivariant normalization. |
| 2922; §6.9 The comparison map `ψ^0_R` and the q-Hodge filtration | R=A=ℤ₃ | pulled-back coefficient filtration has steps hⁱℤ₃[[h]], h=q−1; zeroth step is ℤ₃[[h]] | Instance compatible; base comparison. |
| 2947; §6.9 The p-complete q-Hodge comparison for p > 2 (Wagner Theorem 4.8) | p=3, identity base | coefficient steps for i=0,1 are ℤ₃[[h]], hℤ₃[[h]] | Instance compatible; local hypothesis witness. |
| 2959; §6.9 The p-complete q-Hodge comparison at p = 2 (Wagner Theorem 4.14) | p=2, identity base; ℤ/16 | steps are ℤ₂[[h]],hℤ₂[[h]]; 2·8=0 in ℤ/16 excludes direct use there | Instance compatible; torsion-free bridge required. |
| 2971; §6.9 q-Hodge filtrations of quasi-regular quotients (Wagner Theorem 4.17) | p=2,C/x⁴ | multiplication by 2 is injective before base change; x↦2 makes x⁴↦16 | Instance compatible; quotient theorem before specialization. |
| 2985; §6.10 Global even filtrations by profinite and rational gluing | A=R=ℤ | ℚ∩∏ₚℤₚ=ℤ inside finite adeles; coefficient arithmetic square recovers integral scalars | Instance compatible; arithmetic gluing. |
| 3010; §6.10 q-Hodge filtrations from THH over ku (Wagner Theorems 1.2 and 4.27) | R=A=ℤ[1/2] | fil¹=hA[[h]]; Rees reduction mod β gives fil¹/h fil⁰=0, the base Hodge step | Instance compatible; global specialization. |
| 3022; §6.10 Completeness, multiplicativity and the graded comparison | E∞ polynomial lift | Bott inversion changes β-polynomials to β±¹; gr¹ shearing shifts degree 2 back to 0 | Instance compatible; grading and multiplicativity. |
| 3034; §6.10 Framed smooth inputs (Wagner Examples 6.7–6.8) | d=0,1 | for S=A the degree-zero framing is the identity; x↦x² has differential 2x dx, nonunit at x=0 | Instance compatible; canonical étale input. |
| 3057; §6.10 q-divided powers on the diagonal (Wagner Lemma 6.11) | x=3,y=1,q=2; d=0,1,2 | N₀=1,N₁=2,N₂=2; shifted degree-two difference=20−2=18=3·3·2; classical error=3 | Instance compatible; normalization and d=0 range repaired. |
| 3083; §6.10 The framed Čech resolution (Wagner 6.12 and Lemma 6.13) | S=A,d=0; one-variable diagonal | constant Čech totalization=A; q-derivative of δ₂ is 18/(1·3·3)=2=x−y | Instance compatible; cancellation before specialization. |
| 3106; §6.10 The framed comparison (Raksit; Wagner Theorem 6.10) | S=A[x,y], i=1,3 | form-degree-two coefficients are h⁰dx∧dy and h¹dx∧dy respectively | Instance compatible; weight/form shift. |
| 3130; §6.10 The framed trace pair and its E∞-structure (Wagner Remark 6.14) | A=ℚ, S=ℚ×ℚ, d=0, i=1 | F̂¹=hS[[h]]; F¹ has H⁰=hℚ[[h]], H¹=ℚ; proposed h·qdR has H¹=0 | Fails S03; preserve derived pullback |
| 3155; §6.11 Cyclonic spectra | X=Σ∞(T/C₂)₊ | ΦC₂X is the circle quotient spectrum; ΦC₃X=0 | Instance compatible; cyclonic does not identify fixed points. |
| 3182; §6.11 Cyclonic ku and KU | m=1,2 | π₀kuᶜᵐ=ℤ[q]/(qᵐ−1), ranks 1,2 over ℤ | Instance compatible; genuine fixed coefficients. |
| 3208; §6.11 Cyclonic Adams lift coherence | A=ℤ,m=2 | coefficient Adams operation sends q to q²; on integer scalars sends 1 to 1 | Instance compatible; coherence tied to operations. |
| 3235; §6.12 The invariants `TC^{−(m)}` | m=1 | TC⁻⁽¹⁾ equals T-homotopy fixed points; coefficient π₀ for ku is ℤ[[q−1]] | Instance compatible; index-one comparison. |
| 3260; §6.12 Cyclonic even filtrations and the KU construction | finite norm order 1 | norm=id and filtered finite Tate term=0 | Instance compatible; finite synthetic boundary. |
| 3287; §6.13 `TC^{−(m)}` over ku and twisted q-Hodge filtrations (Wagner Theorem 5.51) | m=1 | qᵐ−1=h; twisted completion becomes h-completion, with same coefficient step hⁱ | Instance compatible; divisor normalization. |
| 3299; §6.13 The Habiro–Hodge complex from `TC^{−(m)}` over KU (Wagner Theorem 5.63) | R=A=ℤ[1/2] versus ℤ | 2·(1/2)=1 in the first ring; no integer solves 2x=1 in the second | Instance compatible; separate unit hypothesis. |
| 3313; §6.14 The Habiro ring of a number field from KU (Wagner Corollary 6.15) | F=ℚ, Δ=6,1 | first coefficient ring is Habiro(ℤ[1/6]); Δ=1 fails 6∣Δ | Endpoint retains its range; proof inference S03 and supplier names S04 need repair |
| 3343; §7.1 Rigidification of the target | D=D(k), X=unit | realization sends unit k to k, 1↦1; zero system realizes to 0 | Instance compatible; refined/realized distinction. |
| 3366; §7.1 The refined localizing invariant | T(unit)=unit | refined unit realizes by 1↦1; Tref(0)=0 | Instance compatible; canonical factor. |
| 3378; §7.2 Killing an idempotent pro-algebra | pro A=0,unit | killing 0 leaves unit 1; killing unit forces every M=M⊗1=0 | Instance compatible; both extreme cases. |
| 3404; §7.3 Smooth and proper E-linear categories | X=Mod_k,Mod_k[t] over Mod_k | unit diagonal has k-dimension 1; k[t] has infinite k-dimension, so is not proper | Instance compatible; smooth/proper distinction. |
| 3427; §7.3 Refined invariants of smooth proper categories | X=E | evaluation/coevaluation compose to id; Tref(E) is constant T(E), scalar unit 1 | Instance compatible; properness retained. |
| 3437; §7.3 Base change in the refined construction | E→X=id | restriction and extension are identity; base-changed unit 1 remains 1 | Instance compatible; no unrestricted base independence. |
| 3449; §7.4 The refined localization cofiber | Vᵣ=unit | orthogonal U=0 and killing unit=0; cofiber(unit→unit)=0 | Instance compatible; localization sign. |
| 3461; §7.5 Circle fixed points and oriented completion | k=Hℤ | complete fixed object has π₋₂=ℤ; reduction mod t has π₋₂=0 and π₀=ℤ | Instance compatible; completed tensor target. |
| 3471; §7.5 Refined THH and TC⁻ | smooth proper unit Mod_Hℤ | THHref is Hℤ, fixed refined value has π₀=ℤ and π₋₂=ℤ | Instance compatible; constant-ind comparison. |
| 3497; §7.6 High-powered positive integers | m=0,1,3,8,9,16,32,64 | admissible 1,9,16,64; excluded 0,3,8,32; v₂(32)=5 odd; 3⁴=81 has exponent 4 | Instance compatible; positivity retained. |
| 3521; §7.6 Torsion-free base change for finite coefficients | (p,a)=(2,4),(3,2) | x⁴↦16, x²↦9; C/x⁴ is 2-torsion free while 2·8=0 in ℤ/16 | Instance compatible; base-change bridge added. |
| 3539; §7.6 Finite-coefficient TC⁻ and q-Hodge complexes | m=1; reductions at m=9,16 | S/1=0, hence completed trace and q-Hodge objects=0; reducing the coefficient comparison by β,t gives ℤ/9 and ℤ/16 respectively | No claim that full TC⁻ π₀ is merely ℤ/m |
| 3551; §7.7 Filtered derived Hom of even spectra | M=N=Hℤ, t-complete unit | RHom(unit,unit)=unit; Extⁱ of the free unit is 0 for i≠0 | Instance compatible; derived Hom normalization. |
| 3561; §7.7 The dual finite-coefficient TC⁻ spectra | m=16 | Homℤ(ℤ/16,ℤ)=0; Ext¹ℤ(ℤ/16,ℤ)=ℤ/16 in homotopy degree −1 | Instance compatible; dual shift. |
| 3571; §7.7 The completed tensor filtration | M=N=Hℤ₂ | completed tensor is Hℤ₂; for mod-2 modules derived tensor additionally has Tor₁=𝔽₂ | Instance compatible; derived tensor retained. |
| 3583; §7.8 Pro-idempotence of the finite-coefficient q-Hodge system | m=9 | transition 729→81→9; Tor₁ contribution to the 9-stage is multiplied by 81≡0 mod 9 | Instance compatible; pro-, not termwise idempotence. |
| 3593; §7.8 Trace-class finite-coefficient transitions | m=9,1 | separated transition 729→9 has vanishing Tor₁ defect; at m=1 source and classifier are 0 | Instance compatible; source-specific factorization. |
| 3605; §7.9 Refined TC⁻ of rational ku | m=1 term in the ku system | F₁=0, Ext¹_B(F₁,B)=0; scalar unit B has 1≠0, whereas ordinary p-completion of rational input is 0 | Instance compatible; ind-object retained. |
| 3615; §7.9 Refined TC⁻ of rational KU | KU coefficient grading | ββ⁻¹=1, ∣β∣=2, ∣β⁻¹∣=−2; F₁=0 and Ext¹(F₁,B)=0 | Instance compatible; periodic calculation separate. |
| 3641; §8.1 Flat and quasisyntomic descent for trace spectra | split fpqc k→k×k | equalizer of the first two Čech maps consists of (a,a), hence k, not k² | Instance compatible; Čech descent. |
| 3651; §8.1 Even Hochschild homology on quasiregular covers | S=R perfectoid | cotangent M=0; Γ⁰_RM=R, Γⁱ_RM=0 for i>0; HH₀=R | Instance compatible; divided-power base ring. |
| 3661; §8.1 Negative and periodic cyclic homology from derived de Rham | A=R | LΩ=R, Hodge≥1=0; gr⁰HC⁻=R and grⁱHP=R[2i] | Instance compatible; Hodge truncation distinguished. |
| 3674; §8.2 The perfectoid trace coefficient presentation | ξ=1,0; A=ℤ[z],φ(z)=z² | ξ=1 gives Laurent isomorphism; ξ=0 can kills nonzero u; Frobenius product=z², not z | Instance compatible; native nodal carrier. |
| 3700; §8.3 THH as a deformation of Hochschild homology | R=A=𝔽₂ | F₂[u]/u=𝔽₂, so THH/u has only π₀=𝔽₂ | Instance compatible; cofiber shift. |
| 3710; §8.3 Antisymmetrization into THH | A=𝔽₂[x]; A=M₂(𝔽₂) | dx² in exterior sense is 0; matrix source has 16 elements and no unital injection into 2-element target | Instance compatible; commutativity repaired. |
| 3734; §8.3 The cotangent filtration of THH | A=R perfectoid | L_A/R=0; π₂ᵢTHH=R·uⁱ for i≥0 and odd groups 0 | Instance compatible; connective cotangent grading. |
| 3746; §8.4 Nygaard agrees with the AΩ décalage filtration | A=O_C, i=1,2 | coefficient Nygaard steps are ξA_inf, ξ²A_inf, matching the décalage filtration | Instance compatible; Frobenius twist retained. |
| 3756; §8.4 The Segal comparison over `O_C` | relative dimension d=0 | comparison on π₀ gives O_C→O_C, 1↦1; threshold n≥d starts at n=0 | Instance compatible; connectivity threshold. |
| 3768; §8.5 Derived convergence of the trace spectral sequences | perfectoid base, degree zero | E₂^(0,0)=R abuts to π₀THH=R; positive homotopy appears in even u-degrees | Instance compatible; no blanket strong convergence. |
| 3778; §8.5 The TC-internal negative-degree calculation | A=𝔽₂, algebraic closure | first has π₋₁TC=ℤ₂ and π₋₂=0; closure has coker(1−F)=0 | Instance compatible; pointwise/local distinction. |
| 3790; §8.6 The p-adic Adams operations on traces | γ=−1, weights 0,1 | actions are 1 and −1; squared action is 1 in both, also at p=2 | Instance compatible; twist sign. |
| 3816; §8.7 The even TC sheaf in characteristic p | A=𝔽₃, weights 0,1 | F=id on ℤ₃; ker(F−1)=ℤ₃, ker(F−3)=0 since 1−3=−2 is a unit | Instance compatible; weight-zero boundary. |
| 3826; §8.7 Syntomic complexes from sheafified even K-groups | A=𝔽₂; U=Spec ℤ₂ | K₀(𝔽₂;ℤ₂)=ℤ₂, positive even groups=0; −1 gives nonzero K₁(ℤ₂)[2] coefficient term | Instance compatible; finite-coefficient sheaf nuance. |
| 3864; §8.8 The coherent trace interface for Habiro cohomology | number-field input F=ℚ,Δ=6 | discriminant 1 divides 6, 6 divides 6; Δ=2 fails 6∣Δ | Instance compatible; spectral application range. |
| 3892; §9.1 `ℤ_p-` and `ℚ_p-coefficients:` p-complete first, then invert p | HZ and HQ_p | (HZ)^∧p[1/p]=HQ_p; (HQ_p)^∧p=0; rationalize first gives 0 | Instance compatible; completion order. |
| 3918; §9.1 `THH(𝔽_p)` versus ℤ with trivial cyclotomic structure | X=S, degree zero of cofiber | ℤ_p --p→ℤ_p has cokernel 𝔽_p=π₀THH(𝔽_p) | Instance compatible; trivial cyclotomic integers not THH integers. |
| 3932; §9.2 From R `⊗_S` `𝔽_p` to R/p: a quasi-isogeny | R=ℤ,p=2,3 | spectral reduction has first positive group in degrees 2,4 respectively, killed by p; ordinary reduction has 0 there | Instance compatible; spectral versus ordinary reduction. |
| 3946; §9.3 The comparison map β : TC(R/p; `ℚ_p)` → HP(R; `ℚ_p)` | R=ℤ_p | π₀β:ℚ_p→ℚ_p is identity; π₋₂ source=0 while target=ℚ_p | Instance compatible; β not unfiltered equivalence. |
| 3972; §9.3 The Beilinson square with the spectral reduction (AMMN Theorem 2.12) | R=0; R=ℤ_p rationally | first square has all groups 0; second total cofiber=0, with degree-zero right map ℚ_p→ℚ_p | Instance compatible; actual comparison square. |
| 3986; §9.4 The Beilinson fibre square (AMMN Corollary 3.9) | R=ℤ_p | relative TC fiber π₁=ℚ_p=HC₀(R;ℚ_p); its suspension comparison has the same value | Instance compatible; associative square retained. |
| 3998; §9.4 The K-theoretic Beilinson square (AMMN Theorem A) | R=ℤ versus ℤ_p, odd p | relative K₁(ℤ,(p);ℚ_p)=0 versus predicted HC₀=ℚ_p; for ℤ_p both are ℚ_p | Instance compatible; henselian condition essential. |
| 4010; §9.4 The Beilinson fibre sequence and its shift dictionary | weight one and cofiber | ℚ_p[−1] has π₋₁=ℚ_p; after [2], π₁=ℚ_p; cofiber shift gives π₂=ℚ_p | Instance compatible; weight shift repaired. |
| 4024; §9.5 Integral refinement of the graded Beilinson square | i=0,1; p=2,3 | quotient at i=0 is 0; at p=3,i=1 fiber is 3ℤ₃[−1]; p=2 permits only i=0 in the integral range | Instance compatible; integral weight range. |

## Not verifiable

- No Lean elaboration or build was run, as required by this read-only pass. The final file has no named declaration, so the required elaborated-signature inventory and scratch #check list are empty; no historical repair-worker build is claimed as a build performed here.
- The supplied text extractions contain damaged mathematical typography, especially in scanned LQ/WG and displayed diagrams. Exact typesetting of those damaged displays is not certified. The normalization findings use independently computed values and readable surrounding statements, not an OCR anomaly.
- BM and May are background bibliography entries, with no target-bearing locator to certify. No missing legal text was discovered and no additional reference request was made. Ownership claims here cover the supplied folders and accessible index; they make no claim about unpublished or unavailable work.
- The computed cases do not formally certify higher coherence, accessibility or spectral convergence proofs. These are construction targets, and the recorded witnesses check their stated hypotheses and source interfaces; they are not a completed implementation of those theories.

## Source issues

- **Misprint** in ammn at Definition 2.14, printed p.11 (ammn line 496): the source says the crystalline character composes trace after β; it should be β after trace, as their domains require; affects a stated result.
- **Misprint** in ammn at proof of Proposition 3.1, printed p.15 (ammn line 707): the source says the Verschiebung defect subtracts gF; it should be Vg−gV; affects the proof.
- **Misprint** in ammn at §3.1, printed p.15 (ammn line 721): the source says graded Day convolution uses multiplication of weights; it should be addition of weights, with degree-zero unit; affects a stated result.
- **Misprint** in ammn at proof of Proposition 3.3, printed p.16 (ammn line 748): the source says every retained degree j contains Xᵢ; it should be Xⱼ for j≤i; affects the proof.
- **Misprint** in an at proof of Proposition 3.22, printed p.26 (an line 1218): the source says the displayed equivalence for N holds for V-complete M; it should be for V-complete N; affects the proof.
- **Error** in w at §2.2, printed p.11 (w lines 461–462): the source says the bounded-below p-complete embedding into all solid spectra is symmetric monoidal; it should be unital into the p-complete subcategory, with lax-monoidal ambient inclusion; affects a stated result.
- **Misprint** in w at proof of Lemma 6.11, printed p.84 (w lines 3766–3771): the source says its Pochhammer-normalized γ̃_d equals λᵈ((x−y)/(q−1)); it should be (−1)ᵈ times that λ-operation; affects the proof.
- **Error** in w at proof of Theorem 6.10, printed p.86 (w line 3862): the source says the q-derivative of γ̃_d is γ̃_(d−1); it should be γ̃_(d−1)/(1−q), or use N_d/[d]_q! throughout; affects the proof.
- **Error** in w at §§6.12(c)–6.13, printed pp.85–86 (w lines 3800–3808): the source says the uncompleted étale tensor diagonal gives the relative TC coefficient algebra; it should be completed along the full étale diagonal before the divided-power comparison; affects the proof.
- **Misprint** in w at proof of Corollary 6.15, printed p.86 (w line 3888): the source says the étale Habiro identification is W-Hab Corollary 3.12; it should be Corollary 3.13; affects nothing.
- **Error** in mw at §3.5, printed p.31 (mw lines 1323–1329): the source says the prime-primary product directly supplies the global uncompleted q-Hodge pair; it should be glued with the rational corner before completion; affects a stated result.
- **Misprint** in lmmt at Remark 3.11, printed p.16 (lmmt line 672): the source says the linearized relative K functor on sphere-bimodules is ΩM; it should be ΣM, as the square-zero K₁ calculation shows; affects the proof.
- **Error** in s-ber at §8 before Proposition 8.7, printed p.46 (s-ber lines 1944–1948): the source says the open unit ball is a nonunital ring under the stated Banach assumptions; it should be stated with addition closure and the compatible ideal-colimit presentation; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "87bc3ff5cef726c6937e934f89f5b44052ce2c01", "job": "RT-RefinedTraceMethods~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
