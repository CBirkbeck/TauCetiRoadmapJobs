# HabiroCohomologyFoundationsPartII port

Branch: `roadmap/habiro-cohomology-foundations-part-ii`.
Head commit: `1b1ebd590eed52d93ba8f550b9521b68ecd117c6`.
Base: `edbb842`; initial status was empty. Only the three files under `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/` are committed. The report is the requested board artifact.

## Validation

Command: `lake build TauCetiRoadmap.HabiroCohomologyFoundationsPartII.Suggested`.

```text
✔ [8976/8976] Built TauCetiRoadmap.HabiroCohomologyFoundationsPartII.Suggested (2.1s)
Build completed successfully (8976 jobs).
```

Exit 0; **0 warnings**, 0 errors. No Lean process remains running. The acceptance file has zero declarations and zero section variables. I mechanically enumerated every declaration kind and therefore obtained an empty list of `#check @name` probes: there is no elaborated type that could drop a binder. The required module build elaborated the entire import/docstring/namespace file. No signatures, hypotheses, definitions or instances changed; the only Lean edit updates the local framed-comparison locator from §3.3 to §3.1. No other Lean command was needed or run.

Push gate: exit 0. Exact summary:

```text
gate HabiroCohomologyFoundationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate requires a clean working tree: its preliminary runs reported only `dirty` for the new folder and then the staged files. Its content counters were all zero. The passing run is on the committed head. `git diff --check` passes. Metadata retains `topic = "math.AT"`, the same one-key form as the main-branch folders.

The required dependency check, using the supplied order and `--movable`, prints:

```text
depcheck: 29 roadmaps, 263 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurs. No merge-order file or tooling was edited.

## Draft pull request body

Builds trace q-Hodge pairs and their Habiro descent from the algebraic q-Hodge formalism and spherical trace comparisons. The roadmap identifies trace pairs with the canonical quasi-regular and framed smooth pairs, proves the spherical-lift criterion for the naive filtration, and transports cyclotomic and Taylor specialisations of number-field Habiro rings to their genuine-fixed-point realisation.

AI-assisted port and mathematical self-review by Codex (GPT-6). The acceptance file documents the six headline results and the enhanced or spectral carriers each needs at the pinned APIs.

## Dependencies still represented by new-roadmap pull requests

By name: AInfCohomology; PrismaticCohomology; PrismaticCohomologyPartII; PrismaticCohomologyPartIII; StableHomotopyKTheory; HabiroCyclotomicCompletions; QWittVectors; HabiroCohomologyFoundations; HabiroRings. These were resolved against the indexed new-roadmap heads, not progress revisions of existing roadmaps. RefinedTraceMethods is also an earlier named supplier in the accepted design, but has no readable roadmap on main or in the indexed open heads; its contracts remain explicit and uncertified, as detailed below.

## What moved from Lean to the README

Nothing moved during this port. The supplied `packages/HabiroCohomologyFoundationsPartII/Suggested.lean` is already the 28-line acceptance form, with no declarations. The accepted-review metadata describes an older 111-line file with three predicates and elementary examples; that description does not match the supplied file and was not used to recreate padding. The exponent predicates, trace inversion condition, unit consequences, API laws and value examples remain in the README. All six headlines remain in the module docstring; no native carrier at either pin supports a genuine signature for them. No stand-in, sorry'd data, empty condition, example or option was introduced.

## Supplier replacements and duplication sweep

Searches used the roadmap service's complete main/open-head index, direct searches of main and Completed, the board packages, the pinned source trees and the supplied sibling checkouts. Objects searched included chosen q-Hodge pairs, filtration completion and pullback, animated q-de Rham, Habiro-complete modules, ordinary/derived polynomial completion, relative Habiro coefficients, full Taylor tensors and equalizers, spherical and perfection lifts, Tate-valued Frobenius, cyclonic spectra and genuine fixed points, Moore towers, q-PD diagonals and Nygaard filtrations. Additional searches covered the six local headline names in Lean; there was no match in any supplier namespace. There are no local Lean declarations that could collide with supplied names.

- HabiroCohomologyFoundations §§0.1, 2.1–2.10, 4.1, 4.4, 4.8, 4.12–4.28, 5.2–5.8, 5.13, 5.15–5.23 and 5.26 retain ownership of algebraic carriers, filtrations, descent and canonical sections. Its §§8.18–8.19 are scope boundaries. The relative étale object and ordinary ring comparison use §§4.21 and 4.28.
- HabiroRings §§2.1, 2.4–2.5, 5.1–5.9 and 7.3 supply the ordinary models, arbitrary coefficient-module completion, full Taylor equalizer, completed base change and arithmetic coefficients. Absolute étaleness is not a second target here.
- StableHomotopyKTheory §§7.32 and 7.34 own the v-compatible quotient towers and Moore structures. The local finite-sequence quotient application constructs trace inputs over arbitrary connective E∞ coefficients; it does not introduce a second Moore existence theorem. The supplied stronger S/8 and S/32 cases remain negative controls for necessity of this roadmap's sufficient even-exponent conditions.
- QWittVectors §§2.1–2.5 supply the arithmetic structures, including faithful-flat perfection and relative linearized Adams maps. Generic Nygaard and trace filtrations retain their prismatic and AInf owners. Genuine cyclotomic foundations found in KTheoryFiniteLocalFields concern the generic cyclotomic/TR construction, not the cyclonic KU/TC⁻ comparison owned by RefinedTraceMethods. No second generic spectral foundation is planned here.
- Unverified RefinedTraceMethods declaration aliases were replaced by the exact mathematical descriptions at its accepted contract sections: cyclotomic base data; spherical, étale and arithmetic-glued lifts; compatible lift choices; global even filtration/comparison; framed E₂ input, prime-two comparison, completed and pair comparisons, E∞ refinement and full-diagonal Čech model; cyclonic coherence; and the ku-lift, unit, non-h-adic and non-TR Checks. This includes all ten name leads in the supplied citations artifact. The contracts are preserved in full; the prose no longer asserts that those spellings are exported declarations.
- The alleged `Prismatic.Nygaard.fil` spelling is not exported verbatim by the readable §3.1. It was replaced by the actual ideal-filtration description there. The actual `Prismatic.Nygaard.relativeFrobenius` and `Prismatic.Trace.gradedTCMinus`, `Prismatic.Trace.gradedTP`, `Prismatic.Trace.gradedTC` names were resolved and qualified.

No mathematical target was deleted in this port, no ownership moved to a later roadmap, and no theorem was narrowed to selected primes. Existing ownership deferrals remain only in Scope and ownership. Broader supplier contracts are applications, not repeat targets. The sole subsection in Layer 3 is now §3.1, with every local reference and the Lean docstring updated; source paragraph numbers are unchanged.

## Upstream reviewer pass and mathematical fixes

Read the completed arithmetic-bound roadmap and main-branch examples of supplier boundaries, conventions, layers, examples and references, including DerivedModuleAlgebra. The port retains the full package detail: 62 Check bullets, every API list, exact hypotheses, source versions, worked examples and per-layer dependencies.

1. Restricted the Summary's opening trace assertion to §1.1's actual spherical hypotheses, including the separate prime-two branch, instead of suggesting that any lift suffices.
2. Retained the base supplier's enhanced derived commutative contract in both the export description and the quasi-regular comparison. The unconditional filtered E∞ statement is unchanged; no conditional supplier theorem is silently strengthened.
3. Corrected the separate uncompleted framed Habiro comparison locator from the base §4.8 to its actual §4.17a.
4. Replaced ambiguous qHdg notation in the cyclonic supplier formula with H(R,F_tr), the Habiro–Hodge object. Its full-root limit differs from its h-completion. Specified degreewise completion of the periodic object.
5. Clarified integral Jackson quotients and q-PD divided powers so that the displayed denominators do not request inversion of a coordinate, h, or a nonunit factorial. Added the 1,x,x² Check at q=1 and x=0. Monomial formulas containing x^(r−1) explicitly have r≥1, and the nonzero Bockstein classes are likewise scoped to r≥1.
6. Gave the exponent predicates literal total definitions using the p=2 branch, matching their arithmetic Checks at nonprime natural inputs. The prime ranges and all spherical theorem hypotheses are unchanged.
7. Made universe/coefficient conventions explicit and supplied the actual pinned file/line locations of native contracts; étale/smooth include finite presentation, not module finiteness. Restricted background BMS formulas to quasisyntomic inputs and spelled out the mixed-characteristic DVR/perfect-residue-field domain of the relative Breuil–Kisin contract.
8. Added zero-realisation, full Gaussian coefficient tensor/idempotent, and root-difference re-expansion Checks. They distinguish zero maps, lost factors and the reversed Taylor substitution.

The accepted review's mathematical decisions remain: sufficient rather than necessary exponent ranges; n=max(d,1) in the canonical framed comparison; no repeated Moore tower; no backward HabiroNumberFields consumer; inverse arithmetic Frobenius for abelian coefficient families; and the uncompleted étale pair as a derived pullback, including the ℚ(i)/ℚ positive-step cohomology. Its unused-reference and proper-name notes were already reflected in the supplied files and were preserved.

## Citations and pinned-source audit

The actual checkout HEADs equal the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches in both trees found no Habiro/q-Hodge, spherical-lift, cyclonic THH/KU, connective ring-spectrum or Nygaard carrier for the six headlines. The native discriminant, integer ring, localization-unit, divisibility, commuting-unit and smooth/étale declarations were read at the file and line locations now in the README. Neither native smoothness nor étaleness includes module finiteness or a non-finitely-presented perfection map. Searches of public Mathlib development and Lean Zulip did not identify an alternative q-Hodge/Habiro carrier to adopt; this is a search result, not a completeness claim about all external work.

The final resolver reports **no unresolved Lean names**. Its warning that it could not inspect the local pinned packages was addressed by the direct inspections above. Its sole cross-roadmap lead is RefinedTraceMethods §6.10, independently confirmed absent on main and in the complete indexed open-head list. Only its reports directory exists in the board package. No absent declaration was invented or imported.

The eight fixed public source versions in the package were reopened. Source line locators below use the web text extraction of those exact PDFs; the README retains the authoritative statement numbers and printed pages.

| Source | Decisive passages read and applied |
| --- | --- |
| QH | QH line 6653 (static naive preimage), QH line 6738 (odd/2-primary quotient argument), QH line 6902 (toric x−1), QH line 6951 (completed flat base change), QH line 7023 (faithfully flat reduction in the criterion proof). |
| KU | KU line 277 (ku-lift obstruction), KU line 3625 (E₁ at 2), KU line 3827 (identity-cover hypotheses) and KU line 3863 (preimage proof), KU line 7477 (Habiro periodic comparison), KU line 7879 (full framed theorem), KU line 7913 (q-PD lemma), KU line 8257 (Čech proof), KU line 8323 (commutative refinement), KU line 8345 (étale ring realization proof), KU line 8361 (spherical perfection). |
| TC | TC line 2393 locates the finite-coefficient argument's conclusion and its relation to Paragraph 3.3; the fixed version's Paragraphs 3.3–3.8 remain the source for chosen high-powered towers and the completed comparison, with the rational-corner correction retained from the accepted package. |
| GSWZ | GSWZ line 349 (prime-edge Frobenius convention) and GSWZ line 405 (localized order components). The order-three witness recomputes the required inverse direction rather than trusting the general constant-family display. |
| Bu | Bu line 660 (Cartan square argument), Bu line 678 (v=4 tower), with the stronger S/8 and S/32 range in the opening theorem. |
| BS | BS line 6332 (bounded-prism, smooth formal scheme and Frobenius-twist domain), with the relative sphere-polynomial comparison in Proposition 15.7. |
| BMS2 | BMS2 line 306 (quasisyntomic domain and locally even descent), keeping Nygaard completion and Breuil–Kisin twists. |
| HA | HA line 91926 (étale-algebra equivalence, k≥2), applied with E∞ structure; does not supply the non-finitely-presented perfection map. |

All quoted source text was treated as data. No suspicious instruction-bearing passage requiring a change of task, credential, external write or command execution was encountered. No credential was read, network code run, GitHub write made, or branch pushed.

## Unresolved supplier availability and limits

RefinedTraceMethods remains the one unavailable supplier. Its fourteen explicit accepted contracts at §§6.1, 6.9–6.14, 7.6 and 8.8 remain required: spherical base/lift data, perfect δ-ring lifts, spherical perfection map, local comparisons, global pair, full framed theorem, framed proof exports, cyclonic comparison, number-field realization, coherent trace interface, prime-two resolution agreement, derived commutative refinement, finite-coefficient trace comparison and pair coherences. Their availability and exact exported Lean spellings cannot be certified. This port preserves the accepted ownership decision; it does not claim those contracts have been delivered. The worker must include this supplier in the dependency/merge-order description and ensure its contracts are supplied before this consumer.

No other unresolved port defect was found. Ownership against all indexed open roadmap heads was searched by object; the explicitly supplied sibling heads were also inspected where relevant. This report makes no claim about work outside that index. The computed audit tests truth, domains and conventions on examples; it is not a proof of the enhanced functoriality, coherence or naturality targets. Those remain the roadmap's library work.

## Adversarial mathematics pass

One row per mathematical statement or API law below, including supplier interfaces, conventions, all Check families and worked examples. Repeated occurrences share the same row and were compared against the statements they exercise. Native arithmetic checks were also recomputed by an independent rational/integer script (40 exponent cases, cyclotomic order-three exponents, cubic factorization and unit inverses). The rest are exact hand calculations in the displayed modules, filtrations and rings; no assertion of source availability is inferred from an example.

The zero ring, empty sequence, unit relation, dimensions 0/1/2, p=2/3, q=1, characteristic-2 reduction, nonreduced square-zero algebra, split and nonsplit étale algebras, and a non-Galois cubic field occur. A nontrivial purely inseparable extension fails étaleness. S₃/Q₈ and noncompact groups do not instantiate the fixed finite cyclic spectral subgroup parameter C_m; no theorem quantifies over arbitrary groups. Ramified/equal-characteristic DVRs do not enter the narrowed background Breuil–Kisin supplier domain. No out-of-range index, total polynomial degree or division by zero appears in the declaration-free acceptance file.

| Statement | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| Universe and coefficients | Unit ℤ, zero ring, finite diagram 2→1 | Objects ℤ and 0 lie in the fixed universe; two indices and one arrow form a small diagram | Explicit conventions added; no cardinality restriction on rings. |
| h and q-integers | n=0,1,2; q=1,2 | At 1: 0,1,2; at 2: 0,1,3; h=0,1 | Preserved. |
| Descending filtration | B=ℤ[[h]], steps −1,0,1,2 | B,B,hB,h²B; maps h²B→hB→B are inclusions | Preserved. |
| Rees degrees and Bott shift | Unit; β-degree 1, t-degree −1 | 1+(−1)=0; βt=h, q=1+h; Σ⁻²π₂ku sits in degree 0 | Preserved; distinguishes swapped weights. |
| Filtered quotient | Unit, i=0,1,2 | cofib(h:B→B)=ℤ; cofib(h:B→hB)=0; cofib(h:hB→h²B)=0 | Same-index quotient gives ℤ instead of 0 in step 1. |
| Derived quotient | ℤ/2 with h acting by zero | Cone(0) has H⁻¹=ℤ/2 and H⁰=ℤ/2; ordinary quotient has only H⁰ | Preserved enhanced convention. |
| Chosen pair clauses (a),(b) | Unit and R=0 over ℤ | Unit F⁰=ℤ[[h]], F/β=ℤ in nonpositive steps; zero-ring F⁰=ℚ[[h]], F/β=constant ℚ | No substitution of completion for pair. |
| Chosen pair rational clause (c) | A=ℚ,R=ℚ(i), step 1 | H⁰=hℚ[[h]], H¹=(ℚ(i)/ℚ)[[h]]/h on both pullback sides | Positive steps need not be static. |
| Chosen pair local clause (c_p) | A=R=ℤ; p=2,3 | Complete first: ℤ_p→ℚ_p; invert p first then complete: 0 | Completion order preserved. |
| q-Hodge modification | Unit; constant zero-ring filtration | h:hⁱB→hⁱ⁺¹B identifies with id_B, so modification B; constant ℚ[[h]] localizes to ℚ((h)) and completes to 0 | Colimit before completion retained. |
| Habiro and partial notation | Unit over ℚ, m=1,2 | T₁=ℚ[[h]]; T₂=ℚ[[q−1]]×ℚ[[q+1]]; h-completion kills second factor | No replacement of Habiro descent by h-completion. |
| Positive cyclonic indices | m=1,2,0 | C₁={1}; term 1=X^hS¹; edge 2→1; no finite group of order 0 | Preserved. |
| Relative semiperfectness | Unit 𝔽_p; 𝔽_p[x] over 𝔽_p | Unit Frobenius image=𝔽_p; polynomial image=𝔽_p[xᵖ], missing x | Identity cover excludes polynomial ring. |
| p-quasi-lci | Unit and regular quotient by y² | Cotangent 0 and R[1], amplitudes empty and {1} ⊂ [0,1] | Preserved; separate global condition. |
| Native arithmetic definitions | ℚ discriminant; Gaussian at 2 | disc(ℚ)=1; disc(ℚ(i))=−4; derivative of i²+1 at 2 is 2i=0 | Native definitions retained, no redundant predicate added to Lean. |
| Native étale/smooth meanings | ℤ→ℤ[1/6]; perfection 𝔽_p[x]→𝔽_p[x^(1/p∞)] | Localization has finite presentation by 6t−1; finite generators through p⁻ᴺ omit x^(1/p^(N+1)) | Finite presentation does not mean module finiteness or cover perfection. |
| Supplier Habiro-complete category | A=0; noncomplete ℚ(q) | Complete category over 0 has only 0; all cyclotomic reductions of ℚ(q) are 0 and reflection=0 | Owned by base §0.1. |
| Supplier ordinary/derived completion | M=𝔽₂; P₁,P₂ | Quotient dimensions 1 and 3; multiplication by qᵐ−1 retains highest coefficient 1 | Owned by HabiroRings §2.4, no flatness added. |
| Supplier arithmetic perfection | Toric x; identity base ℤ_p | ψᵖ(x)=xᵖ; perfection adds x^(1/p); identity φ on ℤ_p has perfection ℤ_p | QWittVectors §§2.1–2.5 retained. |
| Supplier spherical base | A=ℤ_p and A=0 | Reductions S_p⊗ℤ_p=ℤ_p and 0⊗ℤ_p=0; base identity sends 1→1 | RefinedTraceMethods contract retained; not certified as available. |
| Supplier perfect δ-lifts | ℤ_p,0; x↦0,p | Lift reductions ℤ_p,0; evaluation of x is 0 versus p≠0 | Contract retained; detects wrong spectral specialization. |
| Supplier spherical perfection map | ℤ_p and toric ℤ_p⟨x⟩ | First map=id; second sends x to x and admits all p-power roots after reduction | Separate non-finite-presentation contract retained. |
| Supplier local trace comparison | Identity base, p=2,3 | Step 1=hℤ_p[[h]], quotient by β=0; step 0 quotient=ℤ_p | E₁ at 2 retained; no odd-only route. |
| Supplier global trace pair | Unit arithmetic gluing | Local coefficients ∏ℤ_p, rational ℚ, common-overlap pullback ℤ | Pair is pullback, not product of local factors. |
| Supplier full framed comparison | Line, i=1,2 | Two terms (hB,Bdx) and (h²B,hBdx), respectively | All dimensions retained in supplier contract. |
| Supplier framed diagonal/Čech model | S=ℚ×ℚ, empty frame | S⊗S=ℚ⁴; diagonal quotient=ℚ²; zero coordinate ideal alone leaves ℚ⁴ | Full diagonal contract preserved. |
| Supplier framed multiplicative refinement | Static commutative unit; polynomial line | Unit 1·1=1; Jackson x² coefficient=1+q, ordinary Leibniz coefficient=2 | Enhanced product required; fixed framing retained. |
| Supplier cyclonic Habiro comparison | R=ℤ[1/6], orders 1 and 2 | Nonzero component idempotent e₂ has order-one Taylor image 0; e₂ remains in full Habiro ring | Corrected ambiguous qHdg notation to H(R,F_tr), retaining full-root object. |
| Supplier number-field realization | ℚ,Δ=6; ℚ,Δ=1 | 6 divides 6, not 1; h-completion in admissible case=ℤ[1/6][[h]] | Factor 6 retained, ring theorem kept with RefinedTraceMethods. |
| Supplier coherent divisor interface | Unit, 6→2→1 and 6→3→1 | Both composites send 1→1; changing one edge sign gives −1 | Coherence contract retained. |
| Supplier finite-coefficient comparison | m=1,9,16 | Valuations empty, v₃=2, v₂=4; all high-powered; completed zero-ring filtration=0 | Uncompleted rational corner not dropped. |
| Supplier Nygaard and motivic filtrations | Perfect base ℤ_p, indices 0,1 | N⁰=ℤ_p, N¹=pℤ_p; π₀TC⁻=ℤ_p, shift [2] puts grade 1 at homotopy 2 | Independent constructions, twists and completion retained. |
| TraceInput objects | ℤ[1/2][x], ℤ[x] | First 2-completion=0; second 2-completion=ℤ₂⟨x⟩≠0 | Separate E₁ branch at 2 preserved. |
| TraceInput morphisms | Identity with same branches; identity with changed odd branch | First lifts id_R and comp(id,id)=id; second has branch E₂≠E₁ | Bare ring identity is not a mixed-branch morphism. |
| TraceInput.forget | Unit and zero inputs | Images ℤ and 0; forget(id_ℤ)=id_ℤ | Preserved. |
| TraceInput.lifts | Polynomial input at 2 and 3 | Branches E₁ at 2, E₂ at 3 | Preserved local choice data. |
| TraceInput.ofSpherical | ℤ[1/2][x] and ℤ[x] | 2*(1/2)=1 in first; no integer polynomial f with 2f=1 in second | Constructor hypothesis substantive. |
| TraceInput.ofEtale | A→A×A; ℚ→ℚ(i) | Relative cotangent=0; relative Frobenius linearization is iso; ranks 2 and 2 | Includes split and nonsplit cases. |
| TraceInput.ofFramed | ℤ[x], p=2 | Cover mod 2 adds x^(1/2), whose square=x; x not a square before cover | E₁ cover at 2 retained. |
| TraceInput.ofIdentityCover | Unit; rational square-zero algebra ℚ[u,v]/(u,v)² | Unit L=0; square-zero ideal has height 2 and minimal generators 3, so is not regular | Global amplitude condition not replaced by zero p-completions. |
| TraceInput.unit | A=ℤ and 0 | L_(A/A)=0, relative Frobenius=id; inputs reduce to A | Preserved. |
| TraceInput ku negative control | ℤ_p{x}_∞/x | Ordinary divided-power class xᵖ/p has naive-step image absent; ku E₁ lift exists | ku lift excluded, source obstruction retained. |
| tracePair | Unit and zero ring | F⁰=ℤ[[h]] and ℚ[[h]]; completions ℤ[[h]] and 0 | No false complete-pair identification. |
| tracePair_map | Identity unit and x↦x² on polynomial lifts | 1↦1, x↦x² on rings; mod β, dx↦2x dx | Morphism carries actual pair data. |
| tracePair_map_id | Unit | 1→1→1, h→h→h | Identity law target preserved. |
| tracePair_map_comp | Polynomial maps x↦x², x↦x³ | Composite x↦x⁶ on rings and lifts | Composition law target preserved. |
| tracePair_completion | ℚ→ℚ(i), step 0 | Uncompleted H⁰=ℚ[[h]], completed H⁰=ℚ(i)[[h]] | Distinction preserved. |
| tracePair_modBeta | Unit, steps 0,1 | ℤ and 0, respectively | Correct degree-one quotient. |
| tracePair_rational | ℤ base, unit | ℤ[[h]]⊗ℚ then h-completion=ℚ[[h]] | Completed rationalization retained. |
| tracePair_pRational | Unit, p=2,3 | (ℤ_p[[h]][1/p])^∧_h=ℚ_p[[h]] | Completion before inversion retained. |
| tracePair_multiplicative | n=2,∞ | n−1=1,∞, respectively | No E∞ conclusion from bare E₂ datum. |
| tracePair_etale | ℚ→ℚ(i), k=1,2 | H⁰=hᵏℚ[[h]], H¹=(ℚ(i)/ℚ)[[h]]/hᵏ | Pullback pair preserved. |
| tracePair polynomial Check | ℤ[x], i=1,2 | dx∈F¹, h dx∈F²; 1∉F¹ | Not h-adic filtration of qΩ. |
| traceHabiro definition | Unit, zero | H_(ℤ/ℤ),0; h-completions ℤ[[h]],0 | Supplied H applied to trace pair, no second completion theory. |
| traceHabiro_map | Identity unit | All finite projections of 1 are 1, so image=1 | Map defined on actual trace inputs. |
| traceHabiro_hCompletion | ℤ[x], monomials x,x² | Differential h dx,(q²−1)x dx; at q=1 both 0 | Returning qΩ gives dx,2x dx and fails. |
| traceHabiro_partialCompletion | Rational unit, m=2,n=1 | T₂ has two factors, h-completion=T₁ with one factor | Divisor direction preserved. |
| traceHabiro_qWittGraded | ℤ[x], m=1 | Graded terms ℤ[x], ℤ[x]dx[−1], then 0 | Shift −1 gives H¹, not H⁻¹. |
| traceHabiro_smooth | ℤ[x], m=1 | Reduction H⁰=ℤ[x], H¹=ℤ[x]dx; Bockstein x↦dx | Ordinary de Rham H¹ instead has ⊕ℤ/r torsion. |
| traceHabiro_multiplicative | n=2,∞ | Structures E₁,E∞; 1·1=1 | Multiplicative levels preserved. |
| traceHabiro_pairEquiv | Identity pair equivalence | Completion and every finite projection send 1→1 | Does not claim arbitrary lift independence. |
| traceHabiro_periodic | Unit β-degrees 0,1 | Each component ℤ[[h]], β sends 1 in degree 0 to β in degree 1 | Added degreewise completion qualification. |
| traceHabiro_cyclonic | ℤ[1/6], β-degree 0, m=1 completion | Both completions ℤ[1/6][[h]], 1↦1; full object retains e₂≠0 | Module comparison only. |
| traceHabiro étale/zero Checks | Unit; R=0 over ℤ | Reduction at m=1 is ℤ or 0, all positive q-Witt forms=0 | Preserved. |
| E1QuotientExponent | p=2,3; α=0,…,7 | At 2: 0,0,0,0,1,0,1,0; at 3: 0,0,1,1,1,1,1,1 | Arithmetic values recomputed in scratch. |
| E2QuotientExponent | p=2,3; α=0,…,7 | At 2: 0,0,0,0,0,0,1,0; at 3: 0,0,0,1,1,1,1,1 | Distinguishes E₁ and E₂ ranges. |
| E₂ implies E₁ | Natural p=0,1,2,3,5; α=0,…,7 | All 40 values of implication true; p≠2 uses bounds 3≥2 | Nonprime predicate values are not spectral assertions. |
| quotientLift | Empty sequence, y=0, y=1 | Quotients T, T⊕ΣT,0; tensor of empty list=T | No regularity assumed for spectral cofibers. |
| quotientLift odd bound | p=3, α=2,3 | q=2>1, q=3>2 | General T and finite sequences retained as trace-input application of supplied tower. |
| quotientLift prime-two bound | α=4,6 | Relative to y², q=2,3 and q>1,2 | y² compatibility retained; α=5 has no integer tower exponent. |
| quotientLift_framed | S=ℤ[x], y=x, α=4 | R basis 1,x,x²,x³; no p-torsion; p=2 E₁, p=3 E₂ | Global input hypotheses retained. |
| quotientLift_identityCover | B=ℤ[x^r:r∈ℚ≥0], R=B/x⁴ | Exponents 0≤r<4 give ℤ-basis, so torsion-free; at 2 q=2, at odd primes α=4≥2 | Trace-input construction differs from bare Moore existence. |
| quotientLift_perfected | B=ℤ₃,x=3,α=2 | Lift cofiber S₃/9; 3·3=0 in ℤ/9, 3≠0 | Spherical lift needs no torsion-freeness, criterion does. |
| Moore compatibility Check | p=3,α=2; p=2,α=4,6 | S/9 E₁, S/16 E₁, S/64 E₂; chosen v=3,4,4 | Imports supplied towers; no second Moore target. |
| Sufficiency versus necessity | S/8 and S/32 | Exponents 3,5 fail evenness, but supplier gives E₁,E₂ | No iff on existence asserted. |
| High-powered condition | 1,9,16,64,8,32,12 | Valuations ∅,2,4,6,3,5,(2,1); truth 1,1,1,1,0,0,0 | Preserved. |
| perfectedLiftNaive | A=R=ℤ_p, p=2,3 | F⁰=B,F¹=hB; quotient steps ℤ_p,0=Hodge steps | All-prime criterion preserved. |
| Criterion base change | A=ℤ_p⟨x⟩→A∞ | Mod p adds x^(1/p); identity-base step hB extends to hB∞ | Tensor completed at (p,h). |
| Criterion injectivity route | Unit and exponent-one free δ quotient | Unit step-1 cokernel 0; exponent-one class xᵖ/p not in image | Surjectivity is additional content, not definition. |
| perfectedLiftNaive_qReg | Rational algebra R=ℚ and R=0 | All local factors 0; rational pairs have qdR ℚ[[h]], completion ℚ[[h]] or 0 | Rational corner retained. |
| perfectedLiftNaive_higherPowers | p=2,α=2,4; p=3,α=2 | Spherical sufficient condition 0,1,1; algebraic square theorem applies at 2 | Application after criterion, no internal cycle. |
| Toric x−1 and q-PD denominators | n=0,1,2 | 1,x−1,(x−1)(x−q)/(1+q); at q=1: 1,x−1,(x−1)²/2 | Divided powers interpreted in envelope, not division in ℤ₂. |
| Exponent-one obstruction | p=2 and 3, R=ℤ_p{x}/x | Missing class x²/2 or x³/3 in naive step; ku lift exists | No spherical E₁ lift by contrapositive. |
| tracePair_quasiRegular membership | Unit and toric x−1 quotient | Identity base lifts=id; toric reduction x↦1 has image 𝔽_p | Perfection-map contract explicit. |
| tracePair_quasiRegular pair equality | Unit, steps 0,1,2 | Both ℤ[[h]],hℤ[[h]],h²ℤ[[h]] | Comparison carries all four clauses; derived commutativity qualified by supplier contract. |
| tracePair_quasiRegular naturality | Identity unit, same branch | Pair map sends 1→1 and h→h on both routes | Target retained. |
| tracePair_quasiRegular lift independence | Unit, two identity-cover presentations | Both ordinary-preimage step 1=hℤ[[h]] | Only identity-cover domain asserted. |
| tracePair_quasiRegular Habiro equality | Unit and zero | Both descents H_(ℤ/ℤ) and 0 | Preserved. |
| Finite-coefficient exclusion | m=9,1 | For 9, kernel of ×3 contains 3≠0; for 1, ring=0 and ×p injective | m>1 exclusion and zero-ring exception retained. |
| Jackson integral quotient | 1,x,x²; q=1,2; x=0 | 0,1,(1+q)x; at q=1:0,1,2x; at x=0 last 0 | Integral interpretation and negative control added. |
| Coordinate filtration | d=0,1,2; i=1,2 | d=1 steps (h,1),(h²,h); d=2, i=1 steps (h,1,1) | Uses supplied coordinate pair, not another construction. |
| canonicalFramedTrace domain | d=0,1,2 | n=max(d,1)=1,1,2; inverted prime sets ∅,∅,{2} | Bound 0 never invoked. |
| canonicalFramedTrace pair | ℤ[x], first two steps | Both (hB,Bdx), (h²B,hBdx) | Full integral line preserved. |
| Canonical counit comparison | Unit, specified versus zero map | Specified mod-β map sends 1→1; zero sends 1→0 | Completeness alone not treated as equivalence criterion. |
| canonicalFramedTrace_habiro | ℤ[x] and étale ℚ(i)/ℚ | h-completions differential h∇_q and ℚ(i)[[h]] | Pullback to animated qdR preserved. |
| canonicalFramedTrace_einfty | Polynomial line | ∇_q(x²)=(1+q)x dx versus ordinary Leibniz 2x dx | Enhanced E∞ product, no ordinary untwisted DGA claim. |
| Canonical derived-reduction Check | Monomials x,x² | H⁰(M)/h=ℤ; H⁰(M/h)=ℤ[x]; Bockstein x↦[dx], x²↦[(1+q)x dx] | Derived reduction retained; classes refer to positive exponents. |
| Canonical empty/Laurent Checks | ℚ(i), ℚ[x±¹] | qdR H⁰=ℚ[[h]]; completed H⁰=ℚ(i)[[h]] in first, completed H¹=ℚ[[h]]dx/x in second | Does not equate qdR with qΩ. |
| Canonical tensor-domain Check | ℤ[x]⊗ℤ[x] | Relative dimension 1+1=2; 2 is nonunit in ℤ[x,y] | No claimed tensor closure; over ℤ[1/2] domain holds. |
| TraceInversion | ℚ,Δ=6,1,0,−6 | Truth 1,0,0,0; at 0,−6 divisibilities true but positivity false | Preserved exact chosen-integer condition. |
| TraceInversion Gaussian/cubic | ℚ(i),Δ=6,12; ℚ(∛2),Δ=108 | −4∤6, −4 divides 12; −108 divides 108; truth 0,1,1 | Same localized ring can have different admissibility witnesses. |
| TraceInversion units | ℚ,Δ=6 | 2*(3/6)=1, 3*(2/6)=1 | Native unit lemmas imported, elementary target remains prose. |
| TraceInversion.finiteEtale | ℚ,Δ=6; ℚ(i),Δ=12; Gaussian Δ=1 | Ranks 1,2; −4 unit at 12; Ω modulo 2 has nonzero di at 1 | Absolute étaleness stays with HabiroRings; localized finite consequence retained. |
| genuineRealisation | R=0, m=1,2 | Every term 0; π₀lim=0; admissible rational unit sends 1→1 in order-one completion | Auxiliary zero-datum Check added, not a number-field input. |
| genuineRealisation.epsilon | ℚ,Δ=6 | h-completion maps q→1+h and 1→1 on both sides | Imported ring theorem; no duplicate fixed-point construction. |
| Fixed-point order | m=1 and homotopy replacement | C₁-fixed stage=X; residual hS¹ gives X^hS¹; homotopy replacement gives X^hS¹ at every m | Full object contains e₂≠0 with τ₁(e₂)=0; cannot collapse to order-one object. |
| numberFieldTraceExports | m=1,q,1 | ρ₁(q)=1, τ₁(q)=1+h; ρ₁(1)=τ₁(1)=1 | Defines maps on P_R via ε⁻¹, no arbitrary map stand-in. |
| Base-convention equivalence | Δ=6; primes 2,3,5 | Constant 1/6 glues: at 2,3 overlaps=0; at 5 Frobenius(1/6)=1/6 | Δ unit in Habiro ring, completed base change justified. |
| Cyclotomic export | F=ℚ,Δ=6,m=2 | q²−1↦0 under ρ₂; q mod(q²−1) retained | Quotient distinct from completion. |
| Taylor export | q, m=1,4 | τ_m(q)=ζ_m+X; m=1 constant=1; m=4 constant=ζ₄ | Map source P_R and full target explicit. |
| Taylor full tensor | Gaussian R, m=4 | C₄=R×R; e=(1−i⊗i)/2 has values 1,0 | Added factor-retention Check. |
| Prime-edge transition | p=2,m=1 before localization; p=5 after Δ=6 | q+1→h+2; q−ζ₅→h+(1−ζ₅) | Added root-difference sign witness. |
| Taylor equalizer | F=ℚ,Δ=6, family (1,0,…) | At p=5,m=1, can(1)=1, φ(0)=0 | Excludes unrestricted product, inverse reconstruction unique by supplied equalizer. |
| Export h-completion | Rational coefficients, q,h | τ₁(q)=1+h, τ₁(h)=h | Full P_R not identified with R. |
| Export naturality | Identity field map; ℚ→ℚ(i),Δ=12 | 1↦1, q↦q; both τ₁ paths send q→1+h | Naturality is target, not attributed wholesale to objectwise corollary. |
| Taylor m=1 kernel | Δ=6, component e₂ | e₂≠0, τ₁(e₂)=0, τ₂(e₂)=1 | No false injectivity after localization. |
| Gaussian Frobenius | p=7,i | Constant: i versus i⁷=−i; twisted f₇=−i gives φ₇(−i)=i | Inverse convention retained. |
| Order-three Frobenius | ζ₇=a,p=11 | 4²=2,4³=1 mod 7; φ(a²)=a, φ(a⁴)=a²≠a | Distinguishes inverse from forward Frobenius. |
| Cubic non-Galois Check | x³−2 mod5 | (x−3)(x²+3x+4)=x³−5x−12≡x³−2; quadratic discriminant 3 nonsquare; a⁵=2−a≠a | Local Frobenius cannot be replaced by global field automorphism. |
| q-PD source sign caution | d=1,2; h=q−1 | hγ̃¹=−(x−y); h²γ̃²=δ²; ∇_qδ²=x−y | Sign (−1)^d preserved; generated ideals unchanged. |
| TC rational-corner caution | m=1 | Product of local factors=0; qdR_(0/ℤ)=ℚ[[h]]; completion and modification=0 | Uncompleted pair retains rational corner. |
| Framed resolution caution | Empty frame and line at 2 | Diagonal quotient ℚ⁴→ℚ² in split case; line perfect-root cover adds x^(1/2) | Unproved coherent comparison remains explicit supplier contract. |


Pull request: #1466 (roadmap/habiro-cohomology-foundations-part-ii at 1b1ebd5)
