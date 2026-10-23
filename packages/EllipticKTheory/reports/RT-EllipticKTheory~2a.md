<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/138#issuecomment-6375922249 -->
Red team round 2 pass a (codex) of fd76424

Verdict: needs_changes

1. **F01** (P2) Minimal-model headlines are statable but absent

   **Location:** `packages/EllipticKTheory/Suggested.lean:20`: “Minimal regular-model existence and uniqueness also require a generic curve genus interface.”

   **Claim:** The Layer 6 existence, terminal-property and marked-uniqueness headlines cannot be stated against the pins.

   **Witness:** `TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/ProjModel.lean:75` supplies W.projModel. The former model bundle uses only schemes, properness, flatness, regular stalks and a marked pullback. None needs genus in its signature; W.IsElliptic specifies the generic curve.

   **Exact repair text:** “Minimal regular-model existence, terminality and uniqueness are statable for an elliptic Weierstrass curve. Keep a real-bodied RegularProperModel bundle and marked morphism type as in §§6.1 and 6.3, together with the outgoing-minimality predicate. State exists_minimalRegularProperModel for every number field F, finite S and elliptic W/F, asserting a minimal regular proper model over O_(F,S); state locallyMinimal_terminal in its equivalent minimal-model form, asserting a unique marked morphism from each regular proper model; state minimal_unique, asserting a unique marked isomorphism between two minimal models. Give these three headline theorems sorry bodies and Layer 6 docstrings; add no category-law or boundary-case admissions. Remove the unavailable-genus explanation.”

   The source and target of the marking are native schemes. These requested statements cover the number-field domain explicitly promised in §6.1; keep the broader excellent-Dedekind and function-field statements in the README, and separately name any genuinely unavailable hypotheses needed for those broader Lean signatures. Test: the smooth 37a1 model over ℤ[1/37] is a permitted model; its point blow-up maps uniquely back and is excluded by outgoing minimality. The elliptic involution fails the identity marking. These are exactly the README's models, without a generic-genus stand-in. The pinned `SchemeWeilDivisor` genus-one API also already refers to X.genus k (`TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/GenusOne.lean:83`), so the broader claim that a genus interface is missing is inaccurate.

2. **F02** (P2) Geisser–Levine is already owned by an earlier supplier

   **Location:** `packages/EllipticKTheory/README.md:34`: “five arithmetic inputs over finite fields that no supplier states”; `:1343`: “geisserLevine: for a field k of characteristic p”.

   **Claim:** This package constructs the general characteristic-p Milnor/Quillen comparison and its passage to arbitrary fields.

   **Witness:** `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:1198`, §5.17, geisserLevine_fieldComparison, states the same comparison for every characteristic-p field, all n≥0 and ν≥1, including p-torsion freeness and uniquely p-divisible kernel/cokernel.

   **Exact repair text:** “Import KTheoryFiniteLocalFields §5.17, geisserLevine_fieldComparison, for every field of characteristic p, including its field-map and coefficient naturality. Its motivic input is that section's geisserLevine_motivicConcentration. The arithmetic targets owned here are BMS_functionField, curveFiniteGeneration, reciprocitySequence_exact and tameKernel_finite, together with the degree-one zero-cycle construction.” Delete the independently owned geisserLevine and geisserLevine_filteredColimit targets and their proof plans; replace their consumers in §5.6 by the exact supplier citation.

   Test: for F=𝔽₂, n=0 both coefficient groups are ℤ/2^ν; for F=𝔽₂(s,t), n=2 the supplier retains the nonzero logarithmic symbol {s,t}. No perfect-field restriction or loss of the general theorem is introduced. KTheoryFiniteLocalFields precedes this roadmap in the supplied merge order.

3. **F03** (P2) Two declared gaps request contracts now supplied in full

   **Location:** `packages/EllipticKTheory/README.md:350–352`: “What K3BlochGroups must provide” and “What ArithmeticKTheory must provide”; matching entries in `packages/EllipticKTheory/design/plan.json:4–13`.

   **Claim:** The field-K₃ and arithmetic-Dedekind packages remain missing supplier obligations.

   **Witness:** `TauCetiRoadmap/K3BlochGroups/README.md:326–370,489–491` supplies the quotient, integral injectivity and rational rank. `TauCetiRoadmap/ArithmeticKTheory/README.md:388–407,666–674,861–878,905–914,950–994` supplies the requested localization, criterion, finite generation and even finiteness.

   **Re-raised: F04.** The repair report's reason was that these suppliers had no available main/open-head roadmap. Both heads are explicitly supplied for this round, and their statements cover these two complete requests. This is redundancy of declared contracts, not a finding that an unfulfilled gap is absent from its supplier.

   **Exact repair text:** “From K3BlochGroups §§2.1–2.2 and 2.5: the indecomposable quotient, integral Milnor K₃ injectivity and number-field rational rank. From ArithmeticKTheory §§1.1, 2.1, 2.4 and 3.2–3.4: S-integer localization, arithmetic K₂ injectivity, the Dedekind finite-generation criterion and number-field finite generation with positive even groups finite.” Remove gap:k3-field-inputs and gap:arithmetic-dedekind-inputs from README and plan gaps, retaining these direct contracts and the distinct gap:function-field-steinberg-homology.

   Tests: ℚ has K₃⊗ℚ=0 and r₂=0; ℚ(i) has dimension one and r₂=1. At S=∅ the ring is O_F; for F=ℚ and S={2,3} it is ℤ[1/6]. The supplier's general Dedekind criterion still requires finite Picard group and finitely generated Steinberg-coefficient homology, so this repair does not discharge the separate function-field homology gap.

4. **F04** (P2) Motivic gaps duplicate an earlier owner's constructions

   **Location:** `packages/EllipticKTheory/README.md:342–356`: “What MotivesAndAlgebraicCycles must provide” and “What SchemeKTheoryOperations must provide”.

   **Claim:** The shared cycle, field-diagonal, characteristic-p and motivic-tower foundations are to be supplied through these new compound requests.

   **Witness:** `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:466,478–512,1190–1198` owns Bloch–Gabber–Kato, shared cycles, field diagonal, norm-residue comparison, convergent integral/coefficient tower and Geisser–Levine concentration. `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:677,692` expressly imports that owner.

   **Exact repair text:** “Import KTheoryFiniteLocalFields §3.0 (blochGabberKato and milnor_no_p_torsion), §3.0a (motivicCycles and motivicToK), and §5.17 (geisserLevine_motivicConcentration and geisserLevine_fieldComparison). MotivesAndAlgebraicCycles §§4.7–4.8 consumes these same complexes and maps. The remaining supplier requests specify only the weight-one comparison on these same Bloch complexes, Adams compatibility, rational comparison and limit/descent compatibility not already in those exports, with each requested map's domain and hypotheses. MotivesAndAlgebraicCycles §4.4 already supplies the Suslin–Tate weight-one complex; any residual weight-one request is its identification with the imported Bloch model, not a second construction.” For the field-comparison residual request use: “On the imported Bloch complexes for every field F, identify weight one with the supplied units complex, and prove that the diagonal and characteristic-p comparisons commute with filtered unions of finitely generated subfields.” Vanishing H^a(F,ℤ(i))=0 for a>i follows from the imported field cycle complex: its simplicial degree 2i−a is less than i and has no codimension-i generators. For the motivic-K residual requests retain the additional Adams/rational and étale-descent compatibilities on smooth schemes over perfect fields, with positive coefficients prime to the characteristic for the étale comparison. Delete the already supplied tower, coefficient and norm-residue clauses from README and the matching plan entries. Cite the earlier owner directly for all provided clauses. Keep the regular imperfect-field curve extension of §4.5 as the additional target here.

   Tests: the existing field diagonal includes the inseparable extension 𝔽ₚ(t)/𝔽ₚ(tᵖ), with norm t↦tᵖ; the existing coefficient comparison retains the nonzero dlog(s)∧dlog(t) for 𝔽ₚ(s,t). These cases are not narrowed by importing the owner. This finding does not claim that every requested compatibility is supplied: those residual contracts must stay explicit.

5. **F05** (P2) Global regular-model existence has an earlier owner

   **Location:** `packages/EllipticKTheory/README.md:1677`: “Prove exists_regularProperModel: E has a regular proper flat model over O_(F,S)”.

   **Claim:** This package owns global existence, alongside the added surface-resolution construction.

   **Witness:** `TauCetiRoadmap/RelativeJacobiansAndIntegralCurveModels/README.md:767–790`, §5.1, already states exists_regularProperModel for every smooth proper geometrically connected curve over an excellent Dedekind base, with generic marking and the global normalization/resolution argument.

   **Exact repair text:** “Use RelativeJacobiansAndIntegralCurveModels §5.1, exists_regularProperModel, for existence over Spec O_(F,S). The additional target here is the resolution of the specified integral Weierstrass equation, with an isomorphism over its regular locus and the comparison to that supplier's marked model; minimality and the K-theoretic integral part remain targets here.” Update the scope and supplier contracts accordingly; do not reconstruct the supplied general existence theorem. Retain excellentSurfaceResolution only as the explicit general surface extension needed for the specified-model and §8.3 comparisons, with its ownership boundary stated.

   Test: 37a1 over ℤ and its fixed generic marking meet the supplier's hypotheses; 11a1 also does, while the additional equation-specific target distinguishes their zero versus nonzero modifications. The supplier occurs before this roadmap in the supplied merge order. This is a new ownership issue in the F09 repair, not a request to return to the incorrect DVR-only citation.

6. **F06** (P2) The elliptic K₀ decomposition is already supplied

   **Location:** `packages/EllipticKTheory/README.md:745`: “This roadmap owns the combination; KTheoryLowDegrees §12.2 supplies only the rank–determinant ring isomorphism”.

   **Claim:** K0Elliptic.addEquiv is a new owned theorem.

   **Witness:** `TauCetiRoadmap/KTheoryLowDegrees/README.md:1171`, §12.4, already states K₀(E)≃ℤ⊕ℤ⊕E(k) for an elliptic curve with rational origin, using JacobianChallenge's pointed Picard identification. Its Checks include the identical eight-point curve over 𝔽₅.

   **Exact repair text:** “Import KTheoryLowDegrees §12.4 for the pointed elliptic K₀ decomposition, together with §12.2 for its rank–determinant product. The additional assertion here identifies its point coordinate with the concrete Weierstrass point/divisor equivalence of §1.5 and proves the resulting diagram commutes.” Replace the ownership assertion and the independently planned decomposition by this compatibility target; add §12.4 to the supplier contract.

   Test: on y²=x³−x over 𝔽₅, both supplier and target give ℤ²⊕ℤ/4⊕ℤ/2; O_P−O_O maps to (0,0,P). The remaining compatibility distinguishes P from −P for P=(2,1) of order four. The supplier is a new roadmap absent from main and earlier in the merge order; its indexed head is the permitted supplier version.

7. **F07** (P3) A higher-dimensional example is used to justify restricting curves

   **Location:** `packages/EllipticKTheory/README.md:607`: “Separatedness matters: Weibel's Example II.8.2.4 is a regular non-separated scheme with K_0 ≠ G_0.”

   **Claim:** The rank–determinant curve theorem requires separatedness.

   **Witness:** weibel lines 8197–8206 explicitly require dimension n≥2. The doubled affine line has Pic=ℤ and K₀=G₀=ℤ²; `TauCetiRoadmap/KTheoryLowDegrees/README.md:1115–1147` supplies the regular-curve theorem without separatedness.

   **Exact repair text:** “The imported rank–determinant theorem holds for every connected nonempty noetherian regular scheme of dimension at most one, without separatedness (KTheoryLowDegrees §§12.1–12.2). Weibel II.8.2.4 concerns doubled affine n-space with n≥2 and does not obstruct the curve theorem. Subsequent proper-curve and function-field constructions retain their own hypotheses.” Use that general supplied statement in §2.1. Add the Check: “On the affine line with doubled origin, div(t)=0′+0″, so the origin classes are opposite and K₀=G₀=ℤ².”

   Test: doubled line gives (rank,Pic)=(ℤ,ℤ); doubled plane gives K₀=ℤ and G₀=ℤ². The repaired scope separates these dimensions and leaves the cited source intact.

8. **F08** (P3) The missing-bar erratum points to the wrong passage

   **Location:** `packages/EllipticKTheory/README.md:1442`: “The coefficient table in the K-book has a missing bar”.

   **Claim:** The cited coefficient table writes the arithmetic curve instead of its geometric base change.

   **Witness:** weibel lines 30699–30704 have bars on both K-groups. The missing bar is in the proof's e-invariant source at weibel line 30724, not the table. The source manifest selects this combined author PDF.

   **Exact repair text:** “The coefficient table in Theorem VI.6.4, p. 503, uses X̄ correctly. In its proof, p. 504, the e-invariant source must read K_{2i}(X̄;ℚ_ℓ/ℤ_ℓ). The arithmetic and geometric groups cannot be interchanged.” Keep the ℙ¹/𝔽₂ negative control.

   Test: K₁(ℙ¹/𝔽₂)=0, whereas K₂(ℙ¹/𝔽̄₂;ℚ₃/ℤ₃)=(ℚ₃/ℤ₃)². The corrected locator supports the same mathematical warning.

9. **F09** (P3) Several Checks still repeat the uninstantiated target

   **Location:** `packages/EllipticKTheory/README.md:863`: “the diagram of the sequences for X and U commutes”; `:1746`: “the morphisms X → 𝓔_i respect the generic-fibre marking”.

   **Claim:** These are discriminating Checks for naturality and marked common resolution; the same issue occurs at `:710`, `:1201` and `:2230`.

   **Witness:** The first is the assertion at `:851–859`; the second is part of the definition of model morphisms at `:1700–1703`. The other three repeat, respectively, Picard descent, the projection formula and the transfer composite.

   **Exact repair text:** Replace those five bullets, respectively, by:

   - “On ℙ¹_ℚ, restriction to 𝔸¹ sends div(t)=[0]−[∞] to [0]; restricting again to 𝔾_m sends it to zero.”
   - “Blow up (0,0) on the fibre at 2 of the smooth 37a1 model. The blow-down has identity generic marking; composing it with (x,y)↦(x,−y−1) fails that marking.”
   - “For y²=x³−x over ℝ, O((0,0)−O) is a nontrivial real line class of order two, fixed after complexification, and its descended class is the same nonzero point.”
   - “For [3] over ℚ, the input (1,0,O) has output (9,0,O); for the separable degree-two isogeny of §5.3 the output is (2,0,P_f) with P_f≠O.”
   - “For ℚ(√2)/ℚ, res(2)=2 and N(2)=4 on K₁; for β={x−√2,y}, res(Nβ)={x²−2,y}.”

   Each replacement specifies an input and a value and rejects a wrong projection, marking, zero Picard map, degree-only integral formula or transfer. Retain the mathematical laws as targets. The repaired examples are computed in the audit tables below.

10. **F10** (P2) Procyclic H¹ loses the supplier's coefficient hypotheses

   **Location:** `packages/EllipticKTheory/README.md:375–376`: “H¹(Ẑ, M) = M/(F − 1)M by evaluation at the generator”; the same unrestricted formula occurs at `:136`.

   **Claim:** The Frobenius coinvariant formula applies to an unspecified module M.

   **Witness:** Take the discrete trivial module M=ℤ. Continuous maps from compact Ẑ to ℤ have finite image, hence H¹=0, whereas ℤ/(1−1)ℤ=ℤ. SelmerIwasawaCohomology §2.7 explicitly excludes discrete nontorsion coefficients.

   **Exact repair text:** “SelmerIwasawaCohomology §2.7 supplies H¹(Ẑ,M)≅M/(F−1)M for a discrete torsion module with continuous action, a finitely generated ℤ_ℓ-module with its ℓ-adic topology, or a finite-dimensional ℚ_ℓ-space with continuous action. Evaluation is at the chosen arithmetic Frobenius generator. It is not a formula for arbitrary discrete coefficients.” Apply this qualification both in the scope list and the supplier contract.

   Test: M=ℤ/3 with trivial action gives H¹=ℤ/3=coinvariants; M=ℤ_ℓ gives ℤ_ℓ with its compact topology; discrete M=ℤ is excluded. All actual Layer 5 consumers are within the repaired coefficient classes, so their conclusions need not be weakened. Supplier witness: `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:493–497`.

## Verification of the first-round findings

The IDs below distinguish review a from review b. Each quoted replacement is from this head. “Repaired” assesses the earlier defect, not the whole package. F04 is reconsidered only for the changed supplier evidence stated in S03.

| Earlier finding | Status | Repaired passage and location | Witness at this head |
| --- | --- | --- | --- |
| a F01, Frobenius dual | repaired | packages/EllipticKTheory/README.md:373: “arithmetic Frobenius acts by (π⁻¹)ᵗ and geometric Frobenius by πᵗ” | q=3, trace 0: determinants on T, arithmetic H¹, geometric H¹ are 3, 1/3, 3; twisting arithmetic H¹ twice gives determinant 27. |
| a F02, inseparable norms | repaired | packages/EllipticKTheory/README.md:2049: “each embedding value is raised to `[L:k]_insep`” | Over 𝔽₂(s), {s,t²−s} gives s and s⁻²; the degree-two norm gives s², product 1. Counting its sole embedding once gives s⁻¹. |
| a F03, supplied projective cubic | repaired | packages/EllipticKTheory/Suggested.lean:33: “theorem EllipticScheme.geometricallyIntegral”; packages/EllipticKTheory/README.md:446: “ellipticity is not needed” | TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/ProjModel.lean:75 supplies the scheme; TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Integral.lean:60 supplies its integrality. The cusp remains integral after field extension. The new missing model headlines are S01. |
| a F04, supplier ownership | partly repaired | packages/EllipticKTheory/README.md:348: “A gap records a prerequisite the named supplier must state” | All six slugs match plan.json. K₃ and arithmetic heads now supply two entire contracts (S03); motivic ownership also overlaps (S04). No undeclared missing supplier is silently treated as implemented. |
| a F05, scheme isogeny owner | repaired | packages/EllipticKTheory/README.md:545: “Use AlgebraicCurves Layer 12C’s isogeny-to-scheme-morphism correspondence” | Main TauCetiRoadmap/AlgebraicCurves/README.md:1128–1147 includes its Weierstrass specialization. Identity degree 1, [2] degree 4, and the zero map outside the field-embedding category distinguish the retained comparisons. |
| a F06, geometric splitting | repaired | packages/EllipticKTheory/README.md:1406–1410 names “curveEInvariant”, “curveCoefficientEdge” and “curveEInvariant_naturality” | Both maps and their section are explicit targets. For q=3, the element 1/4 of ℚ₂/ℤ₂ goes to 3/4 under Frobenius, so an unmarked abstract splitting is insufficient. weibel lines 30656–30661, 30723–30727 support this construction. |
| a F07, quotient versus lift | repaired | packages/EllipticKTheory/README.md:2239: “choose lifts to the rational tame kernel, then average the lift over G” | For a quadratic extension res∘N=1+σ, N∘res=2. Two lifts differing by {s,t} over ℚ(s,t) differ nontrivially rationally, but have the same constant-quotient class. |
| a F08, base change and weights | repaired | packages/EllipticKTheory/README.md:1089: “The decomposition, finite weight bound and cycle-complex comparison require regularity” | (y−x)²=t over 𝔽₂(t) becomes a square-zero thickening after adjoining √t. Pullback of eigenspaces remains meaningful; regular comparison is not applied there. The ℤ/25 action has (12−2)²=0 but 12−2≠0. |
| a F09, global surface input | partly repaired | packages/EllipticKTheory/README.md:1669: “for an integral excellent noetherian scheme Y of dimension two”; :1739: “global common-resolution target” | Stacks 54.14.5, 54.16.9 and 54.17.2 cover the nonlocal base. Existence itself duplicates an earlier supplier (S05); the DVR-only proof defect is repaired. |
| a F10, stale pinned names | repaired | packages/EllipticKTheory/README.md:214: “exists_principal_eq_zsmul_ofPoint_sub_infinity”; :221: “a commutative group” | TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/TorsionDivisor.lean:42 has n:ℤ and nP=0; TauCeti/AlgebraicGeometry/LineBundle/Class.lean:142 gives CommGroup. At a nonzero two-torsion P, 2(P−O) is principal while P−O is not. |
| a F11, boundary tests | repaired | packages/EllipticKTheory/README.md:1541–1543 and :2001 supply nonzero torsion and rejected-singleton controls; :2194–2198 gives the coefficients “1, 1/3” | Over 𝔽₃ a rational two-torsion point satisfies 3P=P. A characteristic-two point of order two fails prime-to-p torsion. A singleton with residue 2 fails certification. A/3 has coefficients 1,1/3, not 3,1. Lean padding was deleted as required. |
| a F12, infinite S | repaired | packages/EllipticKTheory/README.md:1832: “finite_S_exhaustion” | S=∅ gives O_F; S={2,3} over ℚ gives ℤ[1/6]. The denominator-three obstruction forces 3 into a term containing it. SchemeKTheoryOperations §1.7 and GeneralAlgebraicKTheory §3.2 supply finite descent and continuity. |
| a F13, sources manifest | repaired | packages/EllipticKTheory/sources.toml:1: “tauceti-roadmap-sources/v1” | Fourteen lifetime keys: ten certified legal extractions, two waived, two uncertified. No settled text was requested again. |
| a F14, weak Checks | repaired for the listed sections | packages/EllipticKTheory/README.md:799: “tame values … 1, i and 1”; :1906: “residue 1/w̄” | Norm(i)=1 but i≠1; θ∈𝔽₄ has order 3 and norm 1; a vertical 1/w has nonzero divisor and infinite order. Other uninstantiated Checks remain (S09), outside the previously listed replacements. |
| a F15, mixed Needs/circular finiteness | repaired | packages/EllipticKTheory/README.md:344: “independently of Harder finiteness”; §5.5 has separate Needs for each arithmetic input | harder lines 1589–1594 assume Quillen finite generation. The new homology gap explicitly avoids that circular route and quantifies over every positive-rank projective P and q≥0. |
| a F16, Kummer characteristic | repaired | packages/EllipticKTheory/README.md:370: “every positive integer n invertible in that field” | Over 𝔽̄₂, μ₂ as an étale sheaf is zero, so H²=0≠ℤ/2; μ₃ gives trace ℤ/3. n=0 is excluded. |
| a F17, Harder constant field | repaired | packages/EllipticKTheory/README.md:1374: “constantFieldReduction” | ℙ¹_𝔽₄ has K₁=(ℤ/3)² even when regarded over 𝔽₂; the union with ℙ¹_𝔽₂ has the same positive K₁. The geometric formulas explicitly use the exact constants. |
| a F18, acceptance-file order | repaired in order; regression in coverage | packages/EllipticKTheory/Suggested.lean:29, :38, :78: “Layer 1”, “Layer 5”, “Layer 7” | Eight declarations occur in README order with four real-bodied definitions. Removing the model declarations also removed statable deep headlines (S01); no replacement API catalogue is requested. |
| b F01, SK₁ supplier section | repaired | packages/EllipticKTheory/README.md:305: “§11.2: SK_1(O_{F,S}) = 0” | KTheoryLowDegrees §11.2 contains number-field S-integer SK₁ vanishing. §5.5 here treats the additional function-field case, including R=𝔽_q[t,t⁻¹] with K₁=𝔽_q××ℤ. |
| b F02, Gersten page | repaired | packages/EllipticKTheory/README.md:1021 and :1896: “p. 438” | weibel line 26555 is V.9.5 on printed p. 438 (combined-PDF p. 446). |
| b F03, title | repaired | packages/EllipticKTheory/README.md:1: “K-theory of curves and elliptic curves” | Subject capitalization is K; no replacement heading changes the target mathematics. |
| b F04, process narrative | repaired | packages/EllipticKTheory/README.md:228: “The same Tau Ceti contract includes”; :65: “Tau Ceti also supplies” | These are timeless pin contracts. No pull-request number, progress claim or forbidden set_option occurs in README/Suggested.lean. The claim about unavailable genus is separately false (S01). |

## Declaration contexts and headline coverage

I read all 146 lines of Suggested.lean and compared all eight declarations with the supplied elaborated signatures. I did not run Lean or regenerate signatures: this review's read-only/no-build instruction takes precedence. All type-mentioned variables, instances and hypotheses listed below occur in those signatures; none disappeared. The four theorem bodies are sorry, and the four supporting definitions have real bodies. All have docstrings and the required namespace. All seven imports exist at the pins: one Mathlib root plus six individual Tau Ceti modules.

| Declaration and section | Variable/instance context retained | Instantiated values and result | Change |
| --- | --- | --- | --- |
| EllipticScheme.geometricallyIntegral, §1.2, line 33 | Arbitrary universe F; Field F; W:WeierstrassCurve F; no ellipticity assumed | y²=x³ over 𝔽₅ has six scheme points and a singular point, but its affine polynomial and homogeneous cubic remain irreducible after scalar extension. Geometric integrality=true, smoothness=false. | None to this statement. |
| twistedFrobeniusKernel, §5.10, line 50 | k,L in arbitrary universes; Field/Fintype k; Field/DecidableEq L; Algebra k L; W; i:ℕ. No IsElliptic is needed for this subgroup definition. | q=3,i=1,P=(0,0) of order 2: 3πP=P. Ordinary characteristic-two order-two P has no prime-to-2 annihilator. P=0 has witness m=1. Adding points killed by m,n is killed by mn. | None. |
| card_twistedFrobeniusKernel, §5.11, line 71 | Field/Fintype/DecidableEq k; W.IsElliptic; DecidableEq algebraic closure; i≥1; integer-valued RHS | (q,a,i)=(2,−2,1),(2,2,1),(3,0,1) give 13,5,28. For the ordinary q=2 trace−1 curve, i=0 gives prime-to-2 B₀ of order 1 but #E=4; the excluded boundary would fail. Nat.card's infinite-type junk value 0 is incompatible with the positive RHS, so the theorem asserts finiteness too. | None. |
| tameValue, §7.1, line 88 | k,K arbitrary universes; two Fields and Algebra; P:Place k K; f,g:Kˣ; no function-field hypothesis needed locally | f=2t²,g=3t³ gives order 2·3−3·2=0 and value 8/9; swap gives 9/8. {t,t} gives −1, characteristic two gives 1. No division by zero is admitted. | None. |
| SymbolCandidate, §7.1, line 98 | K:Type*, Field K only; k and Algebra do not occur and are correctly absent | Zero has empty support. A singleton coefficient 1 remains nonzero as a formal sum even for {f,1−f}; its intended K₂ image is zero. | None. |
| SymbolCandidate.tame, §7.1, line 101 | Fields k,K; Algebra k K; P and α; integer coefficients | Two terms of values 2 and 3, coefficients 1,−1, give 2/3; equal terms cancel to zero candidate and value 1. | None. |
| tame_last_point, §7.4, line 111 | Fields k,K; Algebra; explicit IsFunctionField proof; α; P₀; degree=1; trivial values at every other place | Last rational residue has norm equal to itself, hence 1. At x=1 on y²=x³+1 the residue −1 in ℚ(√2) has norm 1 but is not 1; degree one cannot be dropped. | None. |
| blochCorrection, §7.6, line 122 | Field/DecidableEq F; affine W and IsElliptic; subgroup T; exact finite enumeration S=T∖{0}; positive C annihilating T; units f,g; support condition; principal-divisor equations; residue identifications in Fˣ | At P, c^C·c^(−C)=1; with C=3,c=2 this is 8/8=1, while reversing correction entries gives 64. At O, reciprocity supplies 1. T={0}, C=1 gives S=∅ and constant symbols with all values 1. The empty set does not silently enumerate a nontrivial T. | None. |

The README's headlines are: geometric integrality and the curve/scheme comparison; pointed elliptic K₀ and its ring; closed-point localization and its boundary; SK₁ and the K₃ coniveau extension; Adams/motivic weights and the indecomposable field K₃ comparison; isogeny transfer with determinant obstruction; Harder finiteness and the finite-field K-group classification; regular/minimal models and marked uniqueness; model-independent integral K₂ and vertical residues; finite symbol certificates, last-place reciprocity, Bloch correction/classes, transfer and quotient descent. The existing four Lean theorems cover the geometric-integrality, kernel-order and symbol headlines that they name. Scheme/field higher K-groups, motivic towers and étale cohomology have no native carriers suitable for the remaining K-theoretic headlines, which the docstring names. Model existence/terminality/uniqueness are the exception (S01). The genus carrier does exist: `TauCeti/AlgebraicGeometry/Cohomology/Genus.lean:64` defines Scheme.genus with a finite-dimensionality guard.

The one-tactic probe found no padding among the four kept theorems. Geometric integrality still needs a base-change comparison; the kernel cardinality needs the separable endomorphism degree; reciprocity needs the norm product; correction needs the divisor/residue calculation and reciprocity. None is merely a native lemma applied once. The definitions are used by these headlines, rather than retained as API catalogues.

## Computed adversarial pass

All 2,423 README lines were read. The 60 numbered target sections are expanded below into their constructions, identities and comparison assertions; the eight Lean declarations have their own context table above. Tests are falsification attempts, not proofs. A field excludes the zero ring; a finite field has q≥2; symbols use units, so f=0 or a zero denominator is not an admitted input. Regular curves exclude nonreduced schemes, but base-change and model definitions were separately tested on them. S₃/Q₈ are not point groups of elliptic curves or K-groups: the native carriers are commutative, so replacing them by arbitrary nonabelian groups would change the statement. Empty supports, rank zero, characteristic two, inseparable extensions and identity maps are admitted and tested where applicable.

| Statement / location | Instances and computed values on the two sides | Result / change |
| --- | --- | --- |
| Curve convention, packages/EllipticKTheory/README.md:145 | Over k=𝔽₂(t), (y−x)²=t gives a regular ring k(√t)[x]; over k(√t), its base change is k(√t)[x,ε]/ε². Regular=true before, false after. | Regular is not smooth/geometrically regular; retained. |
| Closed-point convention, :151 | On ℙ¹_ℚ, div((t²+1)/(t²+2)) has coefficients +1,−1 at two degree-two points and 0 at every rational point. | Full closed-point support is essential. |
| K versus G, :155 | On Spec k, rank-one class has G-length 1; on Spec k[ε]/ε² it has G-length 2. | No singular Cartan inversion is used. |
| Tame sign, :163 | ∂{2,t}=2, ∂{t,2}=1/2, ∂{t,t}=−1; the inverse convention gives 1/2,2,−1. In characteristic two the last value is 1. | Orientation and parity agree with the stated inverse-to-Weibel convention. |
| Tate/roots-of-unity convention, :171 | q=3 on 1/4∈ℚ₂/ℤ₂ gives 3/4 in twist one and 1/4 in twist two; an extra twist would give 3/4 again. | Twist indexing distinguishes μ(i) from μ⊗(i+1). |
| S-integers/coefficient conventions, :179 | S=∅ gives O_F, S={2,3} over ℚ gives ℤ[1/6]; integral K₁(ℙ¹_𝔽₂)=0, geometric K₂ with ℚ₃/ℤ₃ coefficients is (ℚ₃/ℤ₃)². | Finite S and coefficient distinctions retained. |
| §1.1 charts | Z=1 gives the affine Weierstrass equation; O=[0:1:0] has Z=0,Y=1. Thus O is absent from the affine chart and present in the second. | Correct two-chart object; imported construction. |
| §1.1 covering / zero section | Y=Z=0 implies X³=0, hence X=0 at a geometric point, excluded by Proj. At O, Y is invertible and Z is not. | Both characteristics 2 and 3 give the same cover. |
| §1.1 base change / variable change | Identity coefficients give the identity chart map. Scaling x=u²x′,y=u³y′ preserves O; u=3 changes the discriminant by 3¹². | The marking and projective extension are required. |
| §1.1 finite point comparison | For y²=x³−x/𝔽₅ there are seven affine points plus O, and 2(2,1)=(0,0), giving C₄×C₂. The cusp has five affine scheme points plus O but only five nonsingular group points. | Cardinalities 8=8 in the elliptic case, 6≠5 in the singular case. |
| §1.2 geometric integrality | For any field extension, a polynomial root g(x) of the monic quadratic in y would give degree 2deg g≥4 or degree≤2, never 3; at Z=0 the cubic is −X³. | Irreducibility survives characteristic 2 and singular cubics. |
| §1.2 dimension | A nonzero irreducible homogeneous cubic cuts dimension 2 to 1. The degree 3 is not the dimension. | Correct. |
| §1.2 H⁰ / H¹ | Plane cubic: dim H⁰=1, arithmetic genus=(3−1)(3−2)/2=1, χ=1−1=0, including the cusp. Its normalization ℙ¹ instead has H¹=0. | Arithmetic genus is the relevant genus; no normalization substitution. |
| §1.3 regularity / noetherianness | Smooth elliptic closed stalk: dimension=embedding dimension=1; cusp stalk: dimension 1, embedding dimension 2. | Ellipticity retained for regularity. |
| §1.3 codimension-one DVR interface | Closed t=0 on ℙ¹ has ord(t)=1 and stalk dimension 1; the generic stalk is a field of dimension 0. | A generic field is not incorrectly called a DVR. |
| §1.4 function field / closed point equivalence | At x²+2x+4=0,y=3 on y²=x³+1, x³=8 and y²=9, residue degree 2. Infinity has degree 1 and ord(x)=−2. | Residue fields, degree and valuations match. |
| §1.4 divisor transport | On ℙ¹, div(t)=[0]−[∞]; both transported coefficients are +1,−1 and the degree is 0. | Sign-preserving dictionary. |
| §1.5 point / Picard diagram | O↦O−O=0; P=(0,0) on y²=x³−x gives nonzero P−O with twice its class zero. P=(2,1)/𝔽₅ has class of order 4. | Zero and inverse dictionaries are distinguished. |
| §1.5 group and base-change compatibility | (2,1)+(2,1)=(0,0) over 𝔽₅ on both sides; extension to 𝔽₂₅ preserves that equality and O. | Correct pointed group comparison. |
| §1.6 isogeny scheme map | id has degree 1; [2] in characteristic zero has degree 4; the zero map has one-point image and no function-field embedding. | Imported from AlgebraicCurves; no zero-isogeny coercion. |
| §1.6 degree / differential | [3]/ℚ has degree 9 and pulls ω to 3ω; characteristic-three Frobenius has degree 3 and pulls ω to 0. | Degree and separability statements discriminate inseparability. |
| §1.6 kernel comparison | [2] in characteristic zero: kernel scheme rank and geometric point count both 4. Pure Frobenius: scheme rank p, geometric point count 1. | The scheme kernel is not replaced by rational points. |
| §1.6 divisor conorm | For t=s² at zero, e=2,f=1; the pullback divisor is 2[0], with e·f=2. | Ramification retained. |
| §1.6 zeroHom | The constant map to O pulls each line bundle back to a trivial line: Picard class 0. A constant map to P≠O fails preservation of O. | Correct defined zero map; finite-map formulas excluded. |
| §2.1 rank–determinant and naturality | [O]↦(1,O), [O_x]↦(0,O(x)); t=s² pulls O(1) to O(2), giving (1,1)↦(1,2). | Correct; broader supplied scope and ownership repaired by S07. |
| §2.1 nonseparated boundary | Doubled affine line: Pic=ℤ, K₀=G₀=ℤ²; doubled affine plane: K₀=ℤ,G₀=ℤ². | S07. |
| §2.2 Euler definition / additivity | On ℙ¹, χ(O(−1))=0, χ(O)=1, χ(O_∞)=1; the point exact sequence gives 0+1=1. | Finite-dimensional cohomology and vanishing above degree one suffice. |
| §2.2 pushforward / Riemann–Roch | ℙ¹: χ(O(2))=3=deg 2+χ(O)1; elliptic: χ(O)=0=1−1. | Pushforward is Euler characteristic, not rank or degree alone. |
| §2.2 constants / residue degree | ℙ¹_𝔽₄ over 𝔽₂ has χ(O)=2, not 1. On ℙ¹_ℚ the degree-two point has χ(O_x)=2=deg(x). | The H⁰=F assumption for 1−g is necessary. |
| §2.3 class group / Picard | div(t) maps to O(0−∞)≅O. On ℙ¹, [∞] has degree +1; on 𝔸¹ it is absent and Cl=0. | Proper/full-place and affine dictionaries kept distinct. |
| §2.4 pointed Picard decomposition | O(P)↦(1,P), O(O)↦(1,0), O(P−O)↦(0,P); inverse at (d,P) is O(P+(d−1)O). | Both inverse composites return (d,P), including d=0,−1. |
| §2.4 absent rational origin | Real conic has degree image 2ℤ; over ℂ its Picard degree image is ℤ. | Surjectivity requires the specified rational origin. |
| §2.5 Picard descent | Real elliptic two-torsion P gives a nonzero invariant class O(P−O) with real descent. The real conic's invariant geometric degree-one class has no descent. | Correct pointed descent; replace generic Check by S09. |
| §2.5 injectivity | If O(P−Q) becomes trivial on the elliptic curve, P−Q=0 so P=Q. The zero class goes to zero. | Injectivity is not confused with the conic's failed surjectivity. |
| §2.6 multiplication | (r,d,P)(s,e,Q)=(rs,re+sd,rQ+sP). (1,0,O) is a unit; (0,1,O)²=(0,0,O), versus degree 1 for the wrong componentwise product. | Correct square-zero ring. |
| §2.6 square-zero ideal | ([L]−1)([M]−1)=0; the rank-zero skyscraper product is 0, including x=y. | Product includes derived Tor cancellation. |
| §2.7 elliptic K₀ | E/𝔽₅ above gives ℤ²⊕C₄⊕C₂; [O_P] maps to (0,1,P), [O_P]−[O_O] to (0,0,P). | True but supplied already: S06. |
| §3.1 localization / adjacent composites | div(t²+1)=[x]−2[∞] gives degree 2−2=0 and a zero Picard class. The generic image of [O] is 1; that of [O_x] is 0. | Exact tail has the stated direction. |
| §3.1 all closed points | {t,t²+1} has values (1,i,1) at 0,x,∞; i≠1 but N(i)=1. Ignoring x discards a nontrivial boundary. | Correct full residue sum. |
| §3.2 boundary normalization | At a uniformizer, {2,t} gives 2 and {t,2} gives 1/2. At x=t²+1, swapping {t,t²+1} changes i to −i. | Inversion changes values, not kernel/image. |
| §3.3 divisor / rank | t has orders +1 at 0 and −1 at ∞; rank([O])=1 but degree(det O)=0. | Replacing rank by degree would destroy surjectivity. |
| §3.4 open naturality | ℙ¹→𝔸¹ restriction sends [0]−[∞] to [0]; further restriction to 𝔾_m sends it to 0. Empty removed set gives the identity. | Correct; numerical Check replaces restatement in S09. |
| §3.5 finite pullback | t=s² pulls {2,t} to {2,s²}; tame values are 2 and 4=2². Divisor [0] pulls to 2[0]. | Ramification exponent appears in both descriptions. |
| §3.6 finite transfer | For ℚ(√2)/ℚ, N(√2)=−2 and N(2)=4; for an identity extension N(2)=2. N∘res is degree 2 on K₁. | Residue norms and degree-zero residue degree agree. |
| §3.7 rational K₂ injection | On ℙ¹_ℚ the class ∞_*{−1,−1} is nonzero of order 2, generically zero and rationally zero. K₂(ℙ¹_ℚ)⊗ℚ=0 from its two torsion constant summands. | Integral injectivity would be false; rational statement correct. |
| §3.7 affine contrast | K₂(𝔸¹_ℚ)=K₂(ℚ), with its constant inclusion in K₂(ℚ(t)); the extra projective support summand is absent. | Distinguishes the kernel's source. |
| §3.8 finite-field K₂ injection | K₂(ℙ¹_𝔽₂)=0; {t,t²+t+1} has degree-two residue θ∈𝔽₄× of order 3 and N(θ)=θ³=1. | K₂ residue support groups vanish, K₁ residue groups do not. |
| §4.1 SK₁ definition / tame cokernel | SK₁(ℙ¹_F)=F×, SK₁(𝔸¹_F)=0. Over F=𝔽₃ these have orders 2 and 1; each affine chart has SK₁=0 but the proper curve does not. | Global SK₁ cannot be computed chartwise without gluing. |
| §4.1 determinant splitting | Constant unit 2 over ℚ pulls back to det 2, while an infinity-supported unit has generic determinant 1. | The two F× summands differ. |
| §4.2 base-point splitting / V(X) | ℙ¹: V=0 and π^*F×⊕∞_*F×. P^*P_* is multiplied by 1−[normal line]=0. At a degree-two point, π_*i_*i=N(i)=1. | All three maps have specified normalization. |
| §4.3 coniveau columns | Spec F has column p=0 only and F¹=0; a regular curve has p=0,1 and d_r=0 for r≥2 by index range. | No nonexistent higher column is used. |
| §4.3 coniveau extension | ℙ¹_ℚ: F¹K₃=ℤ/48 and quotient ℤ/48; K₃=(ℤ/48)². On 𝔸¹_ℚ, F¹=0 and K₃=ℤ/48. | Associated graded is not asserted to split for arbitrary curves. |
| §4.4 K₃ of a pointed elliptic curve | For 37a1, P^*π^*=id, π_*P_*=id, P^*P_*=0 and π_*π^*=χ(O)=0. Thus the two K₃(ℚ)=ℤ/48 summands are independent. | The generic map is not injective. |
| §4.5 motivic tower indexing | Weight j in K_n corresponds to CH^j(X,n); on a curve j>n+1 forces cycles to have negative dimension and group 0. n=0 permits j=0,1. | Weight bound matches dimensions. |
| §4.5 regular imperfect-field adapter | (y−x)²=t before inseparable extension is regular and finite type over 𝔽₂(t); after extension ε²=0. | The regular theorem is applied only before, as required. |
| §4.5 integral versus rational weights | On ℙ², ψ²(z)=2z−z², ψ²(z²)=4z². The integral weight-one vector is 2z+z²; z+z²/2 is rational. Determinant of the two integral eigenvectors is 2. | No integral decomposition of the full lattice is asserted. |
| §4.5 finite coefficient generalized weights | On ℤ/25, ψ=12 has endpoint eigenvalue 2 mod 5; ψ−2=10≠0 and (ψ−2)²=100=0. | Squared kernel is necessary. |
| §4.5 Gysin weight / arbitrary pullback | On K₁(ℙ¹), ψ² is 2 on π^*F× and 4 on ∞_*F×. A singular pullback still commutes with ψ after the declared extension, but has no claimed regular decomposition. | Gap retained; no singular motivic overclaim. |
| §4.6 indecomposable K₃ | ℚ gives dimension 0=r₂, ℚ(i) dimension 1=r₂. On ℙ¹, pushforward raises field weights 2,3 to 3,4. | Correct weight-two quotient; supplied field inputs in S03. |
| §5.1 pullback / proper transfer | π:ℙ¹→Spec F has π_*O(−1)=0 and π_*O(2)=3; elliptic π_*O=0 and π_*O(O)=1. | Euler transfer, not sheaf rank. |
| §5.1 finite flatness / generic restriction | [2] in characteristic two remains finite flat of rank 4, though it can be inseparable; the zero map has rank-zero image dimension and is not finite. Generic restriction exists although the generic-point map is not proper. | Correct distinction of map domains. |
| §5.1 open immersion boundary | j:𝔸¹→ℙ¹ has j_*O with arbitrarily high pole orders at ∞, hence not coherent; identity has coherent pushforward O. | No improper G-pushforward is constructed. |
| §5.2 projection formula | f_*f^*(1)=[f_*O]. For a degree-two separable elliptic isogeny this is (2,0,P_f), not (2,0,O). | Correct integral formula; S09 only changes its Check. |
| §5.3 rank–determinant action / iff | Input (r,e,P) gives (dr,de,dP+rP_f). Testing r=1,e=0,P=O forces P_f=O if the action is scalar d; if P_f=O every term is scalar d. | Both directions of the iff hold. |
| §5.3 separable determinant | Perfect trace identifies V with V∨; det gives L²≅O. Its rational Picard class is 0, including a nontrivial order-two L integrally. | Integral and rational statements differ. |
| §5.3 odd multiplication | For [3], L is 3-torsion and 2-torsion, hence 0; d=9 and the action is 9. For m=1 it is identity. m=2 is not admitted by the odd hypothesis. | No good-prime shortcut or false even extension. |
| §5.3 degree-two obstruction | In characteristic≠2, f_*O=O⊕L and h⁰(L)=1−1=0; trivial L would have h⁰=1. | L≠O is witnessed, not assumed. |
| §5.4 projective-line basis | [O(n)] has coefficients (n+1,−n) in (O,O(−1)); n=−1,0,1 give (0,1),(1,0),(2,−1). χ returns the first coordinate. | Both inverse-coordinate maps and signs agree. |
| §5.4 supported point / ring | [O_∞] has coefficients (1,−1), rank-degree (0,1); z²=0. A degree-two point gives (2,−2), rank-degree (0,2). | Correct higher projective-bundle specialization. |
| §5.5 coprime closed-point degrees | Degrees 2 and 3 have gcd 1. A degree-one zero-cycle is [x₃]−[x₂], with degree 3−2=1, although neither point is rational. | Does not assume a rational point. |
| §5.5 degreeOneZeroCycle / splitting | The degree-one combination gives transfer∘pullback=3−2=1. A single degree-two point instead gives 2. | Degree, not effectiveness, fixes the splitting. |
| §5.5 BMS_functionField | R=𝔽₃[t,t⁻¹]: SK₁=0 but K₁=R×=C₂×ℤ; R=𝔽₂[t]: K₁=1. | Finite generation is not finiteness of every affine K₁. |
| §5.5 curveFiniteGeneration | A closed-point complement has finite residue K_n for n>0 and K₀=ℤ; adjoining one missing point changes only finitely generated groups in localization. Rank-one P has zero-dimensional building with reduced H₋₁=ℤ, not an omitted case. | Uses the explicit independent homology gap, not Harder. |
| §5.5 reciprocitySequence_exact | For ℙ¹_𝔽₂, norm target is 1; θ∈𝔽₄× of order 3 lies in the kernel and is a nonzero tame residue. Over 𝔽₃ the target has order 2. | Norm product alone supplies containment, while BMS supplies exactness. |
| §5.5 tameKernel_finite | For ℙ¹, K₂=0 and its order is 1, prime to p. For the trace−2 elliptic curve over 𝔽₂ the computed degree of 1−2π is 13. | The p-primary exclusion and finiteness are separate inputs. |
| §5.5 Geisser–Levine | n=0 over 𝔽₂ gives ℤ/2^ν on both sides; F=𝔽₂(s,t), n=2 retains dlog(s)∧dlog(t)≠0. For a perfect field all positive logarithmic differential groups vanish. | True, but imported under S02/S04. |
| §5.5 filtered-subfield compatibility | A symbol {s,t} and its defining relation use the finite subfield extension generated by s,t; at the union 𝔽̄_p the positive Milnor p-quotients are 0. | No perfect-field-only reduction is valid; ownership S02/S04. |
| §5.6 exact constants / components | ℙ¹_𝔽₄ as a 𝔽₂-curve has constants 𝔽₄ and K₁=C₃². Disjoint union with ℙ¹_𝔽₂ gives C₃²×0=C₃². | Connected and disconnected scopes match Harder. |
| §5.6 Harder all positive degrees | n=0 gives K₀ with ℤ² and is excluded. A finitely generated uniquely p-divisible abelian group has free rank 0 and p-primary part 0; C₃ for p=2 passes, ℤ and C₂ fail. | The algebraic finiteness argument covers n≥3 after the explicit n=1,2 inputs. |
| §5.7 curveEInvariant | For q=3,i=1, the constant cyclic group has order 3−1=2, and the e-invariant's section returns its nonzero generator. On geometric 1/4∈ℚ₂/ℤ₂, Frobenius gives 3/4. | A zero or non-equivariant splitting fails. |
| §5.7 curveCoefficientEdge and section | On ℙ¹_𝔽̄₂ with ℚ₃/ℤ₃ coefficients in degree 2, the edge projects (a,b)↦a and the constant section sends a↦(a,0), so their composite is a. | The second divisible summand is not lost. |
| §5.7 coefficient / Galois naturality | 1/4 maps to 2/8 under coefficient inclusion; Frobenius 3 sends these to 3/4 and 6/8, equal. | Commutes with coefficient transitions and the specified action. |
| §5.7 geometric K-groups | ℙ¹ has J=0: positive even geometric groups are 0; positive odd groups are two copies of prime-to-p ℚ/ℤ with equal twist. For a genus-one curve, J[ℓ] has ℓ² elements when ℓ≠p. | Correct distinction between genus zero and one; source locator S08. |
| §5.8 Kummer/trace | n=1 gives zero groups on both sides; n=3 over 𝔽̄₂ gives H²=ℤ/3, while n=2 gives μ₂=0 and H²=0≠ℤ/2. | Positive invertible n is necessary. |
| §5.8 rational twisted cohomology | At q=3,j=2, H⁰ eigenvalue is 9, H¹ eigenvalue absolute value 3√3, H² eigenvalue 3: none is 1. At j=0, H¹(Spec 𝔽₃,ℚ_ℓ)=ℚ_ℓ. | The j≥2 vanishing is sound; all-twist vanishing is false. |
| §5.8 Frobenius direction | For trace-zero E/𝔽₃, det π=3. Arithmetic H¹ has det 1/3; geometric H¹ has det 3; arithmetic H¹(2) has det 3⁴/3=27. | Earlier inversion repaired. |
| §5.8 divisible-coefficient descent | On ℚ₂/ℤ₂(2) over 𝔽₃, F−1 is multiplication by 8, surjective with kernel C₈. Its quotient H¹ is 0. | Invariants and coinvariants are not conflated. |
| §5.9 positive K-descent | For ℙ¹_𝔽₂, geometric K₁ invariants are μ₁²=0, agreeing with arithmetic K₁; for 𝔽₃ they are μ₂²=C₂². | Deep descent is more than degeneration; edge maps are specified. |
| §5.10 subgroup / i=0 | q=3, rational P of order two: 3^iP=P for every i. Ordinary q=2 curve has #E=4 but B₀=1 because its rational torsion is 2-primary. | Positive-i order theorem must not extend to i=0. |
| §5.10 base change / characteristic torsion | For a rational point, πP=P, so q^iπP=P iff (q^i−1)P=0. At i=0, 0P=0. If also pP=0 and mP=0 with gcd(m,p)=1, Bézout gives P=0. | Natural subtraction has no junk effect since q^i≥1. |
| §5.10 isomorphism functoriality | An isomorphism sends O to O and a nonzero rational two-torsion P to another nonzero point satisfying the same 3P=P equation. Identity sends P to P. | An arbitrary nonpointed map would fail; only the native pointed maps are used. |
| §5.11 finite odd groups | q=2: K₁=0 and K₃=C₃², of orders 1 and 9. q=3: K₁=C₂² of order 4, independent of the trace. | Odd formula and q=2 boundary agree. |
| §5.11 even kernel identification | On ℓ-primary Tate torsion, q^iπ−1 has determinant D_i. Its differential in characteristic p is −1 because i≥1, so the kernel is separable and has D_i geometric points. | No characteristic-p points are incorrectly counted. |
| §5.11 order / prime-to-p / positivity | q=2,a=−2 gives D₁=13,D₂=41; a=2 gives D₁=5,D₂=25. q=3,a=0 gives D₁=28. Each D_i≡1 mod p and D_i>0 from the Hasse bound. | Nat.card and integer formula agree. |
| §5.11 cyclicity Check | q=2,a=2: mod 5 the two Frobenius roots are 3,4; 1−4π vanishes on exactly one eigenspace. Its kernel has order 25 and 5-rank 1, hence C₂₅, not C₅². | The claimed cyclic example is consistent. |
| §6.1 model bundle / marking | For O=F=ℚ(s), identity marking is F-linear; composing with s↦s+1 sends s to s+1 rather than s. | Absolute scheme isomorphism alone fails. |
| §6.1 fibre multiplicity | At a component of multiplicity m, ord(π)=m and local fibre length=m. A reduced smooth fibre gives 1; a doubled local equation π=u·t² gives 2. | Does not assume reduced fibres. |
| §6.1 Weierstrass regular iff / good reduction | For 37a1 at (37,5,18), F=222=6·37∉m², so total space is regular despite nodal fibre. For 11a1 at (11,5,5), F=0,F_x=−55,F_y=11, so F∈m² and total space is singular. | Equation minimality and fibre irreducibility are essential. |
| §6.1 rescaled equation / Néron contrast | y²=x³−81x has singular displayed model at 3 although its elliptic curve has good reduction there. At 37, the 37a1 Néron fibre is a nonproper nonsplit torus; over ℤ[1/37] it is proper. | Smoothness alone is insufficient for a regular proper model. |
| §6.2 excellentSurfaceResolution | Spec ℤ[t] uses identity. xy=z² over ℚ has dimension 2 and embedding dimension 3 at the vertex; resolving changes that point and preserves its regular complement. | Correct general surface target; source hypotheses checked. |
| §6.2 global model existence | 37a1 needs no modification; 11a1 requires one over 11. Both generic fibres retain their original marked elliptic curve. | Existing general owner imported under S05; equation-specific comparison remains. |
| §6.3 marked morphisms / Hom.ext | id respects both triangles. The elliptic involution sends (0,0) to (0,−1) on 37a1 and fails identity generic marking. | Subsingleton applies to marked maps, not all scheme maps. |
| §6.3 outgoing minimality | A blow-up has a nonisomorphic outgoing blow-down and fails minimality. The smooth model and regular nodal 37a1 model have no exceptional fibre component. | Positive and negative models distinguish the predicate. |
| §6.3 toLocalModel / tower comparison | Localizing ℤ at (37), then taking fraction field, gives ℚ both ways; the generic marking is the same identity. | Source and target are the pinned DVR model, not another local carrier. |
| §6.4 common resolution | If M₂=Bl_P M₁, choose X=M₂: maps are blow-down and id. For two minimal marked models the common comparison reduces to a marked isomorphism. | Correct global factorization; marking Check replaced under S09. |
| §6.5 global contraction | Blow-up of Spec ℤ[t] at (2,t) has exceptional ℙ¹_𝔽₂ and normal O(−1); contraction restores Spec ℤ[t]. | Nonlocal base is handled explicitly. |
| §6.5 existence / termination | A single point blow-up adds one vertical component and its contraction removes one. A smooth fibre's normal sheaf is O, degree 0≠−1, so it is not contracted. | Finite component count decreases; no good-fibre contraction. |
| §6.6 blow-down factorization | A map constant on the exceptional ℙ¹ factors through the blow-down. The identity on that ℙ¹ has one-dimensional image and does not satisfy the factorization hypothesis. | Correct source/target and contraction premise. |
| §6.6 terminal / local criterion | Bl_P M→M is the unique marked map. Reversing it would make the blow-up invertible, contradicting its ℙ¹ fibre. M→M is id. | Minimal, locally minimal and terminal are equivalent in genus one. |
| §6.7 uniqueness / localization | The two composites between terminal marked models are their identity endomorphisms. Inverting 37 removes the nodal fibre of 37a1; the remaining model is smooth and still minimal. | Marking excludes the elliptic involution; S01 for missing Lean headlines. |
| §6.8 integral image definition / monotonicity | S=∅ imposes all vertical places; S={2} removes the place 2. Zero lies in both; a nonzero residue at 3 cannot be removed by inverting 2. | Image and inclusion directions agree. |
| §6.8 finite exhaustion | A class descended over ℤ[1/6] belongs to the finite S={2,3} term. The DGJK class with 3-denominator has a finite term but none omitting 3. | Finiteness of S and union statement are compatible. |
| §6.8 model independence | For a point blow-up f, f_*f^*=id because Rf_*O=O. Generic restriction of both composites is id. | Images agree after each common-resolution step; singular arbitrary models are excluded. |
| §6.8 regular versus singular Cartan | On a regular closed point rank 1 maps to length 1; on a doubled point it maps to length 2. | Scholl's warning about singular model images is not discarded. |
| §6.9 good-prime surjectivity | For 37a1 at 2, K₁ of the good fibre is 0, so the localization boundary is 0 integrally. Over 𝔽₃ a good fibre has K₁ order 4, killed only after rationalization. | The general rational claim does not overstate integral surjectivity. |
| §6.10 unramified / vertical boundary | A rational class of {−1,3} has value (−1)^m at a multiplicity-m component: torsion, so rational residue 0. The DGJK component has residue 1/w with divisor [∞]−[0]≠0 and infinite order. | Torsion residues are not required to be literally 1 after rationalization. |
| §6.10 codimension-one criterion | A horizontal certified symbol has every horizontal residue 1; at the bad vertical component (1/w)^m≠1 for every m≠0, since its divisor is m([∞]−[0]). | Vertical conditions add real information beyond the curve tame kernel. |
| §7.1 leading-value definition | f=2t²,g=3t³ gives exponent parity even and residue 8/9; both orders zero instead gives 2⁰/3⁰=1. | The quotient has order 0, not a chosen arbitrary residue. |
| §7.1 uniformizer independence | Replacing t by 5t changes leading units to 2/5² and 3/5³; their quotient of powers is still (2/5²)³/(3/5³)²=8/9. | Wrong scale choices cancel exactly. |
| §7.1 bilinearity / swap / Steinberg | At t=0, {t,1−t} has value 1; at t=1 also 1; at ∞ the parity and leading −1 give (−1)·(−1)=1. {t,t} is −1, not 1. | Antisymmetry is not mistaken for alternation integrally. |
| §7.1 formal candidates / toK₂ | Singleton {f,1−f} has coefficient 1≠0 but image and all tame boundaries 0/1. The empty candidate has image 0 and empty product 1. | Formal carrier is genuinely before the Steinberg quotient. |
| §7.1 candidate tame | A coefficient pair (1,−1) on symbols of values 2,3 gives 2/3; identical symbols cancel and give 1. | Negative exponents and empty support behave correctly. |
| §7.2 SymbolCertificate / iff | Zero candidate admits empty support. {2,t} has value 2 at t=0 and fails certification. On 11a3, {x,y}+{−1,x} gives products of (−1,−1,1,1) with itself, all 1. | Both directions of the existence iff agree with concrete cases. |
| §7.2 norm versus residue | On 36a1, {x−1,−1} has value −1 at x=1 with residue ℚ(√2); N(−1)=1 but −1≠1. | A norm-only certificate is rejected. |
| §7.2 soundness / correction example | On 11a3, C=5 and the four nonzero rational torsion points give corrected local values c⁵c⁻⁵=1; reciprocity fixes O. | Correct kernel/image statement; rational lift uses number-field K₂ torsion. |
| §7.3 IntegralCertificate | On the regular 11a3 model, ord_D(x)=ord_D(y)=0 at its irreducible fibre at 11, so vertical tame value 1. Unit constants have every vertical value 1. | Horizontal and vertical conditions are both present. |
| §7.3 finite bad-prime set | For a unit-constant candidate take horizontal support ∅, but S′ must still contain a nodal fibre: empty S′ would assert smoothness there, which is false. | The carrier does not make a bad model smooth by choosing empty data. |
| §7.3 soundness / obstruction | For u=1/3, the bad component's value is 1/w; its m-th power has divisor m([∞]−[0])≠0. | No nonzero multiple admits an integral certificate. |
| §7.4 last rational point | In the 11a3 corrected symbol, the three other residue products are 1, forcing the O residue to 1. At the degree-two point on 36a1, norm 1 allows residue −1. | Degree-one hypothesis is essential. |
| §7.4 inseparable norm | Over 𝔽₂(s), {s,t²−s} gives s at the inseparable degree-two point and s⁻² at ∞: norm product s²s⁻²=1. Unweighted embeddings give s⁻¹≠1. | Earlier multiplicity repair passes. |
| §7.5 torsion principal functions | On y²=x³−x, div(x)=2(0,0)−2O, but (0,0)−O is nonprincipal. Thus C=2 works and C=1 at that point does not. | Exact annihilator condition, not an arbitrary parameter. |
| §7.5 blochRho / boundary C | For full rational E[2], ρ=1/y has divisor 3O−P₀−P₁−P₋₁, degree 0. For C=1, E[1]={O} and the prescribed divisor is 0, so ρ is any nonzero constant. | Empty nonzero-torsion family handled without choosing a point. |
| §7.5 characteristic torsion | Ordinary E/𝔽₂ has geometric E[2] of order 2, with one nonzero point P; its sum is P≠O, whereas full prime-to-characteristic E[2] would have four points and sum O. | The prime-to-characteristic assumption in the full-torsion construction is necessary; the general correction theorem retains its separate finite subgroup. |
| §7.6 Bloch correction | At P, tame{f_P,c}=c⁻ᶜ and at O it is cᶜ. C=3,c=2 cancels 8 with 1/8; reversed entries give 8·8=64. | Sign and C-factor fixed. |
| §7.6 zero / finite subgroup | T={O}, S=∅ forces f,g to have no nonzero-point zeros or poles; their degree-zero principal divisors are zero, so both are constants and tame=1. | No hidden nonemptiness assumption. |
| §7.7 class lift normalization | If A=3[s]+[t], then A⊗1/3 has coefficients 1,1/3, and multiplying by 3 returns (3,1). Keeping A unscaled would return (9,3). | Dividing by C changes the class. |
| §7.7 C=2 negative control | For {1/y,x} on y²=x³−x, residues at (0,0),(1,0),(−1,0),O are −1,1,−1,1. The candidate alone is not unramified. | Factor C and correction cannot be omitted. |
| §7.7 C=2 explicit corrected lift | 2{1/y,x}+{x,−1}+{x+1,−1} has all four residues 1; at zeros of x or x+1 the correction values are (−1)²=1. | A certified rational lift exists with the stated normalization. |
| §7.7 tensor obstruction / division | The nonzero two-torsion point tensor −1 remains nonzero in the indicated Picard tensor quotient. A rational point halving it would require the displayed rational quartic root; the possible ±1 tests give value 4, not 0. | The unscaled tensor obstruction is real, not only a formal coefficient issue. |
| §7.7 quotient by constants / torsion | Over ℚ, rational constant K₂ is 0; over ℚ(s,t), {s,t} has t-adic residue s of infinite order and survives rationalization. | Quotient notation is necessary over a general field. |
| §7.7 change of functions / corrections | Multiplying f_a by c adds {ρ,c}; changing correction alters a class in the image of constant K₂ plus torsion. In the quotient both differences are 0; before quotient the preceding {s,t} example need not vanish. | Independence is asserted only in the correct quotient. |
| §7.7 Bloch source comparison | For fixed correction, C·(A/C)=A; C=3 gives coefficients (3,1), rather than (9,3). Replacing the tame convention by its inverse preserves unramifiedness but does not negate A. | Internal normalization verified; identification with the waived source remains uncertified. |
| §7.7 three-point normalization | If torsion orders are (2,3,6), lcm=6 and ratios are (3,2,1), whose gcd is 1. The primitive class is recovered by a Bézout combination. | Distinguishes primitive class from any single scaled symbol. |
| §7.8 constant-field transfer | L=ℚ(√2), β={x−√2,y} on y²=x³−2x: Nβ={x²−2,y}; res(Nβ)=β+σβ. The identity extension gives β. | Transfer is not coefficientwise substitution. |
| §7.8 norm/residue calculation | At Q₂ with x₀²=2, the two residues of β are 1/4 and −2√2. Transporting the second by √2↦−x₀ gives (1/4)(2x₀)=x₀/2=1/x₀, the residue of Nβ. N(res 2)=4 on K₁. | Norms, including signs, are required. |
| §7.9 integral and rational descent | Quadratic composites give 2a and β+σβ. For a={−1,−1} of order 2, 2a=0; after tensoring with ℚ, multiplication by 2 is invertible. | Kernel/cokernel killed by degree does not imply integral isomorphism. |
| §7.9 quotient descent / averaging | For |G|=2, (β+σβ)/2 is invariant and has the same invariant quotient class. For G=1 and lifts differing by {s,t}, quotient classes agree while actual rational lifts differ. | Earlier quotient/lift repair passes. |
| §7.9 descent versus integrality | DGJK α at u=1/3 is already defined over ℚ and hence invariant; its vertical residue 1/w still has infinite order. | Galois descent does not imply integrality. |
| §8.1 E₄ equation / discriminant | u=4 gives Δ=16·4⁴·(16−1)²=921600. The source's fourth power would give 207360000. | Source misprint corrected in the package. |
| §8.1 divisors and exhaustive support | div(v) has coefficients 1,−1,−1,1; div(w) has two +1 and two −1; div(h) likewise. Each degree is 0 and the displayed intersections locate every zero/pole. | Degree zero alone would not prove exhaustiveness; the intersections supply it. |
| §8.1 eight tame values | For {v,w} and {−1,h}, the ordered eight values are each (−1,1,−1,1,1,−1,1,−1); termwise products are all 1. | Certificate uses actual residues, not merely their product. |
| §8.1 point specialization | At P=(0,0), specialization is 0. At Q=(−16,0), it is {−1,5}; its rational 5-adic tame value is −1. | The certified curve class need not specialize to zero. |
| §8.2 degree-two example | On y²=x³+1, {y−3,x} has values 1/2,1/x₀,−2,−4,1, with x₀²+2x₀+4=0. N(1/x₀)=1/4, giving (1/2)(1/4)(−2)(−4)=1. | Unnormed product is 4/x₀=−1−√−3 for the chosen root, not 1. |
| §8.3 integral 11a3 case | At its bad fibre, x and y have orders 0,0 and tame=1. Corrected horizontal values are also 1; S′={11} suffices. | All model divisors covered. |
| §8.3 nonintegral DGJK case | u=1/3 yields 4vw=−3(v²−1)(w²−1); at the V=0 component ord(v)=1,ord(w)=0, so ∂{v,w}=1/w. Its divisor is nonzero. | Every nonzero multiple remains nonintegral. |
| §8.3 positive integrality contrast | u=4 has 4u∈ℤ and 2α integral, while u=1/3 has 4u∉ℤ and mα nonintegral for all m≠0. m=0 has tame value 1 and is correctly excluded from the negative assertion. | Both cases and the zero multiple agree with DGJK 10.2. |
| Procyclic contract, packages/EllipticKTheory/README.md:376 | Discrete trivial ℤ gives H¹=0 and coinvariants ℤ; trivial ℤ/3 gives ℤ/3 on both sides. | Missing coefficient restriction: S10. |

## Source-locator audit

The following 70 locator groups were checked in the ten supplied legal extractions. Ranges group adjacent numbered statements; the source line is a reproducible starting point, not a copied passage. The bibliography names the preprint versions used for Levine, DDZ, DGJK, Scholl and Conrad. Four settled inaccessible works are recorded separately below.

| Source and locator group | Extraction witness | Verification / limitation |
| --- | --- | --- |
| weibel I.5.14 | weibel line 3266 | Krull divisor/Picard injection. |
| weibel I.5.15 | weibel line 3295 | Locally factorial divisor/Picard equivalence; adjacent hyperplane sign misprint recorded below. |
| weibel I.5.16 | weibel line 3337 | Pointed degree splitting; genus-zero cardinality error recorded below. |
| weibel II.8.1 | weibel line 8053 | Rank–determinant product has cross exponents. |
| weibel II.8.2.1 | weibel line 8124 | Regular separated one-dimensional scope in this source; supplier's stronger theorem checked separately. |
| weibel II.8.2.3 | weibel line 8185 | Proper transfer is alternating higher direct image. |
| weibel II.8.2.4 | weibel line 8197 | Doubled affine n-space, n≥2; S07. |
| weibel II.8.5–8.6 | weibel line 8338 | Basis O,O(−1),…; z=1−[O(−1)]. |
| weibel III.2.5.1 | weibel line 10938 | BMS for smooth affine curve rings over finite fields. |
| weibel III.6.3 | weibel line 13461 | Inverse tame convention to this package. |
| weibel III.6.3.1 | weibel line 13484 | Ramification exponent e. |
| weibel III.6.5.3 | weibel line 13597 | Reciprocity includes residue norms. |
| weibel III.6.7–6.7.1 | weibel line 13711 | No characteristic-p K₂ torsion; rational function-field direct sum. |
| weibel III.7.2 | weibel line 14147 | Finite-field and global-function-field Milnor vanishing; not itself tame-kernel finiteness. |
| weibel IV.6.9 | weibel line 19053 | Finite Picard and Steinberg-coefficient homology criterion, followed by Quillen finite generation. |
| weibel IV Exercise 6.13 | weibel line 19200 | Degree composite and Galois sum; reverse-composite error recorded below. |
| weibel V.1.5 | weibel line 21877 | Higher projective-bundle theorem. |
| weibel V.3.3.2 | weibel line 23037 | Finite projective-resolution transfer and projection formula. |
| weibel V.3.11–3.12 | weibel line 23664 | Proper coherent/perfect transfers; cached flasque-model omission recorded below. |
| weibel V.6.6 | weibel line 24532 | Dedekind localization and divisor tail. |
| weibel V.6.6.3–6.6.4 | weibel line 24596 | Transfer diagram, residue norms. |
| weibel V.6.7.1 | weibel line 24664 | Split sequence for k[t]⊂k(t). |
| weibel V.6.8 | weibel line 24726 | Arithmetic Dedekind K-injectivity, not arbitrary projective-curve injectivity. |
| weibel V.6.12–6.12.1 | weibel line 25026 | All closed points; G-theory before regularity; norm reciprocity for proper curves. |
| weibel V.6.13.2 | weibel line 25130 | Regular homotopy/Laurent/projective-line formulas. |
| weibel V.9.5 | weibel line 26555 | Finite-dimensional coniveau; printed p. 438. |
| weibel VI.1.7 | weibel line 28316 | μ(i) indexing. |
| weibel VI.2.1–2.5.1 | weibel line 28399 | e-invariant, finite-field example, ℓ=2 alternatives and Harris–Segal splitting; finite-field use does not invoke exceptional-number-field alternatives. |
| weibel VI.4.1–4.3 | weibel line 29046 | Invertible coefficient comparison, motivic tower and symbol edge. |
| weibel VI.4.7 | weibel line 29411 | General characteristic-p comparison, n=0 included. |
| weibel VI.6.1 | weibel line 30619 | Every smooth projective finite-field curve; positive degrees only. |
| weibel VI.6.2–6.3 | weibel line 30646 | S-unit rank and e-invariant; rank misprint recorded below. |
| weibel VI.6.4 | weibel line 30690 | Geometric Galois-module formulas; table has the bar, proof has a missing bar (S08). |
| weibel VI.6.5–6.6 | weibel line 30736 | j≥2 descent valid; unrestricted rational-cohomology claim is false. |
| weibel VI.6.7–6.8 | weibel line 30778 | Arithmetic finite-field K-groups and reciprocity sequence. |
| levine §3.2, Lemma 3.3 / Proposition 3.5 | levine line 551 | Regular finite-type comparison of supported K/G towers. |
| levine Proposition 6.8 | levine line 847 | Localization boundaries, including coefficients. |
| levine Theorem 12.12 | levine line 2644 | Adams compatibility for regular schemes; naturality stated for smooth maps; indexing misprint below. |
| levine Theorem 14.7 | levine line 3399 | Regular weights, rational decomposition and cycle comparison, pp. 73–74. |
| ddz equation (3.1) | ddz line 173 | Tame numerator/denominator and parity. |
| ddz (3.5)–(3.7), Remark 3.8 | ddz line 247 | Vertical residues, regular model and torsion quotient. |
| ddz Construction 4.1 / Lemma 4.2 / Proposition 4.3 | ddz line 348 | Three distinct rational torsion-difference points, normalization and primitive class modulo torsion. |
| ddz Remark 4.14 | ddz line 515 | Algebraic-extension classes and descent context. |
| ddz Theorem 8.3 | ddz line 1103 | Integral polynomial hypotheses and residue obstruction for every nonzero multiple. |
| dgjk Proposition 2.2 | dgjk line 354 | Reduction types; displayed discriminant misprint corrected in package. |
| dgjk Proposition 10.2 | dgjk line 1407 | Horizontal certification; 4u integral versus denominator obstruction. |
| dgjk Remark 10.3 / Table 10.4 | dgjk line 1472 | Specializations and u↦−u relation. |
| scholl introduction (0.1) | scholl line 23 | Codimension-one residues and next divisor boundary. |
| scholl §§1.1.1–1.1.7 | scholl line 92 | Flat regular models, integral image, and warning for singular models. |
| scholl §1.3.3 | scholl line 267 | Weight components of the model image and functoriality. |
| scholl §1.3.6 | scholl line 317 | Local/global intersection description. |
| conrad Definition 3.1 | conrad line 274 | Base-relative generic marking and model morphisms. |
| conrad Definition 3.8, Example 3.9, Theorem 3.10 / Remark 3.11 | conrad line 342 | Outgoing minimality, genus-zero failure, positive-genus existence/terminality. |
| conrad Corollary 4.7 | conrad line 536 | Minimal Weierstrass model versus minimal regular resolution. |
| conrad Example 5.3 | conrad line 615 | Proper Néron model / good reduction and smooth-locus comparison. |
| poonen Exercises 2.12 / 6.10 | poonen line 2521; poonen line 8390 | Conic failure and pointed Picard descent. |
| poonen §5.7.6 / (5.7.29) | poonen line 6058 | All-characteristic Weierstrass equation and distinct regular/smooth properties. |
| poonen Corollary 6.7.8 | poonen line 8065 | Proper geometrically integral hypotheses and Picard/Brauer exact sequence. |
| stacks 33.9.3–33.9.4 | stacks line 134754 | Exact constants and geometric connectedness. |
| stacks 53.2.6 / 53.2.8 | stacks line 210974 | Regular/projective curve–field dictionary; perfectness needed to conclude smoothness in general. |
| stacks 53.5.2, tag 0BS6 | stacks line 211350 | Euler-form Riemann–Roch for proper Gorenstein equidimensional curves. |
| stacks 53.9.2–53.9.3 | stacks line 211644 | Irreducible plane curves, H⁰ and arithmetic genus. |
| stacks 54.14.5, tag 0BGP | stacks line 216035 | Finite normalization, finitely many singularities and normal completed local rings; excellence supplies them. |
| stacks 54.16.1 / 54.16.9 | stacks line 216220; stacks line 216434 | Blow-down factorization and contraction over a nonlocal noetherian base. |
| stacks 54.17.1–54.17.2 | stacks line 216548 | Proper birational surface factorization and common point blow-ups. |
| stacks 55.8.3–55.8.6 | stacks line 219493 | Local regular/minimal models; proof's normal-locus assertion is erroneous. |
| stacks 55.9.1 | stacks line 219539 | Fibre Cartier divisor and multiplicities. |
| stacks 55.10.1–55.10.3 | stacks line 219761 | Positive-genus uniqueness/terminality and genus-zero exception; arrow misprint below. |
| bms Corollary 4.3(a) | bms line 1319 | SL_n=E_n for n≥3 over arithmetic rings; stable SK₁ consequence. |
| harder Corollary (3.2.3) | harder line 1589 | Proof assumes Quillen finite generation; it cannot supply that prerequisite. |

The source-error witnesses also give direct numerical or categorical controls. For ℂ/ℝ and z=i in K₁(ℂ), restriction of the norm is 1, whereas multiplication by the ordinary rank-two K₀ class gives i²=−1 (IV Exercise 6.13). On ℙ¹, the hyperplane ideal has degree −1 while O(1) has degree +1; Pic⁰(ℙ¹)=0 has cardinality 1 while an algebraically closed field is infinite (I.5.15–5.16). On Spec k, the unrestricted flasque-complex category permits a countable direct sum swindle, giving K₀=0 rather than G₀(k)=ℤ (V.3.11). On the normal surface xy=z² in characteristic zero, the resolution has an exceptional ℙ¹ above the vertex, so it cannot be an isomorphism over the whole normal locus (Stacks 55.8.3). These checks concern source passages; they are not additional package findings. The phrase “geometric Frobenius” for the q-power scheme endomorphism is not independently classified as an error: the report instead verifies the explicit actions on points and cohomology.

## Supplier, ownership and pin audit

The content rules and CONTRIBUTING were read. The supplied main checkout was used for existing roadmaps, and the supplied or indexed head only for new roadmap folders. In particular KTheoryLowDegrees, KTheoryFiniteLocalFields, RelativeJacobiansAndIntegralCurveModels, MotivesAndAlgebraicCycles, SchemeKTheoryOperations and GeneralAlgebraicKTheory were checked as new folders absent from both active and completed main. The following 23 rows record the supplier citations and additional ownership witnesses. Locations are relative to their repositories; grouped sections were checked together, not inferred from a roadmap title.

| Roadmap and current locator | Contract checked / discriminating instance | Disposition |
| --- | --- | --- |
| `TauCetiRoadmap/ModularCurves/README.md:449`, Layers 1A–1B, 1D, 2A–2D | Projective equation, charts, zero, coordinate changes and point/scheme maps; O=[0:1:0] is outside Z≠0. | Imported scheme construction, not newly owned. |
| `TauCetiRoadmap/EllipticCurves/README.md:398`, Layers 0.5, 1–3 | Equation-level points, functions and divisors; a nonzero two-torsion P has principal 2(P−O), but P−O is not principal. | Actual torsion-principal theorem is pinned below. |
| `TauCetiRoadmap/AlgebraicCurves/README.md:1100`, Layers 12A–12E, especially 12C at 1128 | Curve/function-field and isogeny/scheme dictionary; degree-[2]=4 but inseparable Frobenius has only one geometric kernel point. | Imported finite morphism; comparisons retained here. |
| `TauCetiRoadmap/JacobianChallenge/README.md:111`, Layers A, B, D, F | Picard, coherent cohomology, degree and genus-one point identification; O(P) has degree 1 and point coordinate P. | Same pointed normalization. |
| `TauCetiRoadmap/StableReduction/README.md:468`, Layers 4–5 | Blow-ups and regular/minimal models over a DVR; ℤ is not a DVR. | Repaired package does not use this as global existence. |
| `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:871`, §§1.8, 2.7, 6.5 | Abelian schemes are Néron models, minimal-model smooth locus, good reduction; a multiplicative fibre is not an elliptic scheme. | Hypotheses retained in §§6.6 and 6.9. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:5643`, §§4.13, 5.7, 5.11 | Regularity from smoothness, geometric K₀/G₀ and curve Weil bound; a singular dual-number point has Cartan rank-to-length 1↦2. | No singular Cartan inversion. |
| `TauCetiRoadmap/SchemeKTheoryOperations/README.md:443`, §§1.7, 2.2–2.4, 2.6, 3.3, 3.5–3.7, 4.5, 5.1–5.2, 5.5, 6.8–6.9, 6.11, 7.6 | qcqs pullback, proper perfect transfer, Tor-independent base change, regular Cartan, support/dévissage, unit boundary, projective basis, Adams/Gysin and self-intersection. At a rational point, O*O_* multiplies by 1−1=0. | Supplied domains match uses; singular pullback extension remains a declared gap. Motivic duplication is S04. |
| `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:332`, §§2.4–2.5, 3.2, 4.6, 4.8, 4.14, 13.8c | Quillen groups, filtered ring colimits, resolution/dévissage/localization and finite fields; K₁(𝔽₂)=0, K₃(𝔽₂)=ℤ/3. | Exact-category groups are distinct from scheme K-groups. |
| `TauCetiRoadmap/KTheoryLowDegrees/README.md:1003`, §§8.1, 11.2, 12.1–12.4 | Determinant, S-integer SK₁, curve rank–determinant and elliptic K₀. The 𝔽₅ eight-point curve gives ℤ²⊕C₄⊕C₂. | Corrected §11.2 citation; duplication S06 and unnecessary separatedness S07. |
| `TauCetiRoadmap/K2SymbolsBrauer/README.md`, §§5.12, 6.16, 7.2, 8.2–8.3, 9.2–9.4, 9.7, 9.11, 9.13, 9.15, 10.21, 10.27, 10.29–10.30, 10.33, 11.1, 11.6, 12.1, 12.11 | Finite-field Milnor groups, residues/norms, DVR boundaries, reciprocity, constants and field transfer. The last-slot convention gives ∂{2,t}=2; purely inseparable norms have the inseparable multiplicity. | Same tame orientation after inverting Weibel's convention. |
| `TauCetiRoadmap/K3BlochGroups/README.md:326`, §§2.1–2.2, 2.5 | Integral Milnor K₃ injection, indecomposable quotient, rational rank r₂. ℚ gives 0 and ℚ(i) gives 1 rationally. | S03 removes the redundant gap. |
| `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:466`, §§1.5–1.6, 3.0–3.0a, 3.4, 5.17 | Finite-field norms, algebraic-closure torsion, Milnor differential theory, shared motivic tower and Geisser–Levine. For perfect characteristic-p fields positive differential symbols vanish; {s,t} over 𝔽ₚ(s,t) does not. | Earliest owner for S02/S04. |
| `TauCetiRoadmap/ArithmeticKTheory/README.md:388`, §§1.1, 2.1, 2.4, 3.2–3.4 | S-integers, localization/injectivity, homology criterion and number-field finite generation. S={2,3} gives ℤ[1/6]. | S03; function-field homology is not claimed by the number-field theorem. |
| `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:608`, §§4.4, 4.7–4.8 | Suslin–Tate weight one and imports of earlier Bloch complexes; H¹(F,ℤ(1))=F×, whereas H²(F,ℤ(1))=0. | S04: retain comparisons between models rather than constructing the shared cycles twice. |
| `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1195`, DWP.1 §§1.4, 1.6–1.7 | Exact constants, curve/Jacobian H¹ and Weil roots. At q=3, trace 0, the roots have absolute value √3 and determinant 3. | Geometric connectedness used only for formulas requiring exact constants. |
| `TauCetiRoadmap/StableHomotopyKTheory/README.md:2215`, §§7.1–7.4, 7.8, 7.25–7.29 | Positive Moore modulus, coefficient UCT, divisible coefficient transition maps and spectral-sequence convergence. Modulus 1 gives zero; Tor is not discarded. | Coefficients are derived, not naive tensoring of K-groups. |
| `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:374`, §§0.3, 0.5 | Curve trace, Kummer/Jacobian H¹ and duality; for n invertible, H²(X̄,μ_n)=ℤ/n. In characteristic 2, étale μ₂=0, so that excluded assertion fails. | The repaired invertibility hypothesis is essential. |
| `TauCetiRoadmap/WeightsInEtaleCohomology/README.md:279`, R34.2 | Arithmetic action on Tate points and contragredient H¹. For q=3, trace 0, the determinants are 3 and 1/3. | The package's repaired duals and twist direction agree. |
| `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:1112`, R02.2 and D7 | Hochschild–Serre for discrete torsion, and continuous/compact comparison with its limit hypotheses. The twist j=0 leaves a nonzero H¹(𝔽_q,ℚ_ℓ). | Layer 5 uses the j≥2 vanishing range, not all rational twists. |
| `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:493`, §2.7 | Evaluation formula for the specified torsion, ℤ_ℓ and ℚ_ℓ coefficient classes; discrete trivial ℤ gives 0≠ℤ. | S10 restores the coefficient restrictions. |
| `TauCetiRoadmap/ProfiniteCohomology/README.md:2438`, §§10–11 and the procyclic example | Continuous torsion cohomology and cd_ℓ Ẑ=1. Higher torsion cohomology vanishes, whereas dropping continuity would change the problem. | Does not authorize arbitrary discrete nontorsion coinvariants. |
| `TauCetiRoadmap/RelativeJacobiansAndIntegralCurveModels/README.md:767`, §5.1 | Global marked regular proper models over excellent Dedekind bases, including ℤ. | Earlier owner newly identified in S05. |

Ownership searches used the roadmap service by object and declaration, then the actual named files. The 27 supplied sibling folders were searched at their supplied heads, including the arithmetic, Habiro, polylogarithm, moduli, cohomology and QWittVector work. Main, Completed and the board's other package folders were searched too. The Lean-name collision search returned “no match on main or in any open roadmap pull request”; the current package is not an indexed roadmap folder. No duplicate fully qualified declaration name was found. The additional ownership findings concern mathematical objects, not spelling collisions. Excellent surface resolution/common resolution remains justified here as the global extension beyond StableReduction's DVR scope; the general regular-model existence output has the separate earlier owner in S05.

The four resolver leads were resolved rather than reported as absent: KGroup.ofRing_colimit is a planned export of GeneralAlgebraicKTheory §3.2; Scheme.K.pushforward_affine is in SchemeKTheoryOperations §2.3; Scheme.cartan_isEquiv_of_regular is in §2.6; TauCeti.AlgebraicGeometry.WeilDivisor.Scheme.GenusOne is a real pinned namespace/module, not an absent theorem of that name.

The pin manifest selects Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Representative native definitions and the assumptions that matter are recorded here; the remaining cited names were checked in their containing modules.

| Native file / declaration | Actual content and boundary |
| --- | --- |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/ProjModel.lean:75`, projModel; `TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Integral.lean:60`, isIntegral_projModel | The projective cubic exists over a commutative base; integrality uses a domain, not ellipticity. Geometric integrality needs base-change compatibility. |
| `TauCeti/FieldTheory/FunctionField/Place/Basic.lean:100`, Place; ord at 142; degree at 487 | A normalized surjective discrete valuation trivial on k. This alone does not assert a finite residue extension; the function-field hypothesis supplies that for the global theorems. |
| `TauCeti/FieldTheory/FunctionField/Place/Residue.lean:113`, residueUnit; normResidue at 140 | residueUnit takes an actual function-field unit with order zero. The quotient in tameValue has order ab−ba=0; residueField units exclude 0/0. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/TorsionDivisor.lean:42`, exists_principal_eq_zsmul_ofPoint_sub_infinity | The integer multiplier n and nP=0 are actual hypotheses; the API supplies a principal divisor, not a canonical chosen rational function. |
| `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:142` | LineBundleClass has CommGroup, correcting the earlier alleged missing group structure. |
| `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Picard.lean:253` | The divisor-class/Picard equivalence retains integrality, noetherianness, codimension-one DVR conditions and the dimension bound. It is not an arbitrary-scheme equivalence. |
| `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/GenusOne.lean:244`, degreeOneEquivPicZero | Integral proper genus-one geometry and the constant-field hypothesis occur in its context. O(P−O) uses the chosen degree-one origin. |
| `TauCeti/AlgebraicGeometry/Cohomology/Genus.lean:64`, Scheme.genus | Native coherent-cohomology genus with a finite-dimensionality guard exists. It is not a missing generic placeholder. |
| `TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Basic.lean:44`; `TauCeti/AlgebraicGeometry/Fibers.lean:345` | Model data and marked generic-fibre comparison are native, with the DVR context where that model interface requires it. A global marked bundle can still be built directly on schemes. |
| `Mathlib/FieldTheory/Finite/Basic.lean:333`, FiniteField.frobeniusAlgHom | q-power algebra homomorphism for the finite base field; q is its cardinality, never 1. No unsupported inverse Frobenius on an arbitrary extension is used. |
| `Mathlib/AlgebraicGeometry/Geometrically/Integral.lean:40` | Geometric integrality is a fibre/base-change property, not merely IsIntegral of the original scheme. |
| `Mathlib/AlgebraicGeometry/Morphisms/Separated.lean:288`, ext_of_isDominant_of_isSeparated | Needs reduced source, a separated target over the base, dominance and compatibility over that base. Generic markings matter for uniqueness. |
| `Mathlib/RingTheory/Flat/TorsionFree.lean:137`, IsDedekindDomain.flat_iff_torsion_eq_bot | Flatness/torsion-freeness equivalence uses the Dedekind domain context; it does not make arbitrary proper morphisms flat. |

All six gap slugs agree between the README and plan. Both have named suppliers; none has supplier `none`. The K₃ and arithmetic packages are redundant (S03); the two motivic packages contain supplied clauses and need decomposition (S04). The function-field Steinberg-homology contract quantifies over every positive-rank finite projective module and q≥0 and explicitly avoids using Harder finiteness. Rank one has the augmented Steinberg convention; omitting rank one would not supply the full criterion. The general-scheme Adams contract specifies every noetherian scheme and every pullback, and expressly excludes singular weight decomposition. These last two are precise residual extensions and are accepted conditionally, not reported for being unimplemented.

The requested mechanical dependency check ran against the unchanged README and supplied merge order, with exit status 0. Its complete output was:

```text
depcheck: 28 roadmaps, 251 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. S02–S06 repoint only to earlier owners; no downstream consumer is proposed as a supplier. The existing *Needs* split for §5.5 prevents the formerly circular finite-generation route: Harder's paper assumes Quillen finite generation, while the declared homology input must establish it independently.

## Verified sound

Coverage: all 2,423 README lines and all 146 Suggested.lean lines read; 8 declarations compared with their elaborated contexts; 60 numbered target sections read (the README has no separate bold target labels); 157 computed statement/convention rows above, in addition to the 8 declaration rows; all 253 Check bullets assessed, with related computations grouped in those rows; 70 source-locator groups checked in 10 readable works; 23 supplier/owner citation groups resolved in the ledger; ownership searched across all 27 supplied sibling heads. All 22 earlier findings have individual dispositions. The five uninstantiated Checks in S09 are not counted as successful discriminating tests.

The four retained Lean theorems survive the stated boundary tests. In particular, singular cubic geometric integrality, the i≥1 kernel-order formula, degree-one last-place reciprocity and finite-support Bloch correction retain the needed hypotheses. No section binder was lost in the supplied signatures. There is no admitted data definition, free Prop placeholder, set_option, forbidden import or API-padding theorem in this head. A model-coverage defect remains in the docstring and acceptance file (S01).

The repaired inseparable norm, Frobenius dual, nonzero torsion, rational quotient descent, constant-field reduction, n-invertible Kummer comparison and finite-S exhaustion pass their recorded tests. The source-side coefficient errors are not used to infer rational cohomology vanishing at twists 0 or 1. The vertical-residue example correctly distinguishes descent from integrality, and the determinant example correctly distinguishes rank from the integral K₀ class. No good-prime-only restriction substitutes for the integral model theory.

The requested git diff stat showed only seven files under packages/EllipticKTheory (3,163 insertions), with no changes outside the package. No package source was edited during this review. Only this report and scratch notes were written. No Lean build, git write, network posting or downloaded-code execution was run. The README and Lean docstrings contain no pull-request numbers or process narrative; their symbol calculations are mathematical certificates, not a planned computational-algorithm library.

## Not verifiable

- **bloch**, *Algebraic K-Theory and Zeta Functions of Elliptic Curves*, the cited p. 514 construction: settled waiver. The primary text was not available for direct certification. Its formula was independently tested on the displayed divisors and scalings; the waiver was not reopened.
- **young**, *K2 and L-series of elliptic curves over real quadratic fields*, Lemma 3.1, pp. 37–38, and Theorem 3.3, p. 41: settled waiver. The algebraic correction and descent arguments were tested directly; the original text and version numbering were not certified.
- **geisser-levine**, *The K-theory of fields in characteristic p*, Theorem 1.1 as recorded in the manifest and restated in Weibel VI.4.7: settled uncertified source. The readable K-book statement and the current supplier contract were checked; no claim is made to have read the paywalled primary text.
- **grayson**, *Finite generation of K-groups of a curve over a finite field*, the cited pp. 69–90: settled uncertified source. The independent finite-generation proof is conditional on the precise declared Steinberg-homology contract, not certified from this text.
- The README's claim that the V.3.11 flasque-complex correction appears in a published erratum was not independently authenticated. The omission in the supplied K-book text and the required pseudocoherence correction were checked; no published correction locator is asserted below.
- No fresh Lean elaboration was run under the read-only/no-build restriction. The worker's eight elaborated signatures were compared with the actual file and README. The report does not claim to have tested newly proposed Lean signatures or proved the sorry bodies.
- Numerical instances falsify missing hypotheses and wrong conventions but do not certify all universal conclusions. Unimplemented, nonredundant supplier gaps remain explicit conditions of acceptance.

## Source issues

- **Misprint** in weibel at I.5.15.1, printed p. 58 (weibel line 3303): the source says the hyperplane ideal sheaf is O(1); it should be O(−1), while the divisor-associated line bundle is O(1); affects nothing.
- **Error** in weibel at I.5.16, printed p. 58 (weibel line 3345): the source says Pic⁰ of every smooth projective curve over an algebraically closed field has the field's cardinality; it should be restricted to positive genus, since Pic⁰(ℙ¹)=0; affects nothing.
- **Error** in weibel at IV Exercise 6.13, printed p. 327 (weibel line 19201): the source says restriction after transfer is scalar multiplication by the ordinary K₀ class of S⊗R S; it should be the bimodule endofunctor, or the sum of conjugate actions in the Galois case; affects a stated result.
- **Gap** in weibel at V.3.11, printed p. 395 (weibel lines 23671–23677): the source says homologically bounded flasque complexes with a cardinal bound form its G-theory model; it should be restricted to pseudocoherent complexes, equivalently bounded coherent cohomology over the noetherian base; affects the proof.
- **Misprint** in weibel at V.9.5.2, printed p. 438 (weibel line 26569): the source says the coniveau spectral sequence is covariant for flat scheme morphisms; it should be contravariant through flat pullback; affects nothing.
- **Gap** in weibel at the paragraph before VI.6.1, printed p. 502 (weibel line 30606): the source says Weil's norm-product identity identifies the cokernel of the tame map with the constant units; it should be supplemented by affine SK₁ vanishing and a degree-one zero-cycle argument establishing exactness; affects the proof.
- **Gap** in weibel at the paragraph before VI.6.1, printed p. 502 (weibel line 30612): the source says III.7.2(a) supplies finiteness and prime-to-p order of the tame kernel; it should be supplemented by an independent finite-generation argument and characteristic-p comparison; affects the proof.
- **Misprint** in weibel at VI.6.2(a), printed p. 503 (weibel line 30647): the source says the S-unit free rank s satisfies |S|=s−1; it should be s=|S|−1, giving rank zero for 𝔽_q[t]; affects nothing.
- **Misprint** in weibel at the proof of VI.6.4, printed p. 504 (weibel line 30724): the source says the geometric coefficient e-invariant has source K₂ᵢ(X;ℚ_ℓ/ℤ_ℓ); it should be K₂ᵢ(X̄;ℚ_ℓ/ℤ_ℓ), as in the preceding table; affects the proof.
- **Error** in weibel at the paragraph before VI.6.5, printed p. 504 (weibel lines 30733–30741): the source says arithmetic rational étale cohomology always equals the geometric invariants, and H¹ vanishes at every twist; it should be computed with continuous Hochschild–Serre, retaining coinvariants; the stated vanishing argument works in twists j≥2; affects the proof.
- **Error** in weibel at equation (6.5.1), printed p. 504 (weibel lines 30742–30745): the source says the procyclic H¹ coinvariant formula holds for any G-module; it should be restricted to appropriate continuous torsion, compact or ℓ-adic coefficients; discrete trivial ℤ gives H¹=0, not ℤ; affects a stated result.
- **Misprint** in weibel at the proof of VI.6.6, printed p. 505 (weibel line 30771): the source says arithmetic H¹ is the full twisted geometric Jacobian torsion before taking invariants; it should be geometric H¹ in that first identification, followed by Galois invariants; affects the proof.
- **Misprint** in levine at Theorem 12.12(3), printed p. 58 (levine line 2650): the source says Adams acts by k^q on the term indexed by weight −q; it should be k^(−q), or both the term and weight should be reindexed by q; affects nothing.
- **Error** in stacks at the proof of Lemma 55.8.3, compiled printed p. 4590 (stacks lines 219502–219504): the source says every resolution is an isomorphism over the entire normal locus; it should be an isomorphism over the smooth generic curve; a normal singular surface still needs resolution; affects the proof.
- **Misprint** in stacks at the proof of Lemma 55.10.2, compiled printed p. 4596 (stacks line 219792): the source says the asserted contraction runs from the minimal model X to the arbitrary regular model Y; it should be Y→X, as in the theorem and the next sentence; affects the proof.
- **Misprint** in dgjk at the proof of Proposition 2.2(1), printed p. 8 (dgjk line 375): the source says the discriminant is 16u⁴(u²−1)⁴; it should be 16u⁴(u²−1)², giving 921600 at u=4 rather than 207360000; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "fd76424f3e12b6eed14587852647f31d375327e5", "job": "RT-EllipticKTheory~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
