<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/937#issuecomment-6398924600 -->
Red team round 2 pass b (claude) of 3e6c184

Verdict: needs changes

1. **F01** (P1) gap:universal-curve-weil-density asks LefschetzPencilsAndVanishingCycles to use two later roadmaps and closes a cycle with DeligneWeightsAndPurity

   **Location.** `packages/CountingBundlesAndHallAlgebrasOfCurves/README.md:151` ("What LefschetzPencilsAndVanishingCycles must provide (gap:universal-curve-weil-density): For every g≥1, apply DeligneWeightsAndPurity §10.5 to the odd-degree hyperelliptic family with the symplectic monodromy of ArithmeticStatisticsPartVIII §5.17"); also line 149; `design/plan.json` gap `universal-curve-weil-density` (supplier LefschetzPencilsAndVanishingCycles, section "§5.11, universal-family density continuation"). Consumed by §4.9 (line 804), §10.4 (line 1570) and the Dependencies bullets at lines 832 and 1605.

   **Claim.** The contract is a theorem whose two stated inputs come from roadmaps after the supplier in the merge order, one of which already consumes the supplier. The supplier cannot accept it without an upward edge and a two-roadmap cycle, so the density theorem that §4.9 (uniqueness of A_{g,α}) and §10.4 (promotion of degree independence to R_g) rely on is in effect unowned. The dependency tool cannot see this: it reads `*Needs:*` lines, not the text of a gap's `needs` sentence, so it reports 0 problems.

   **Witness.** `merge-order/ORDER.txt`: LefschetzPencilsAndVanishingCycles line 65, DeligneWeightsAndPurity line 95, ArithmeticStatisticsPartVIII line 163, this roadmap line 173. DeligneWeightsAndPurity README at its open head, line 45: pencils and vanishing cycles are imported from LefschetzPencilsAndVanishingCycles §§0.2–5; LefschetzPencilsAndVanishingCycles README at its head, line 4393, lists DeligneWeightsAndPurity under "Downstream consumers". LefschetzPencils §5.11 at its head (line 3164) is a gcd lemma on Frobenius polynomials of pencil fibres; it contains no density statement, no hyperelliptic family and no reference to T_g/W_g.

   **Repair.** All inputs of the density theorem precede this roadmap, so state the theorem here and withdraw the gap.
   1. Delete line 151. Replace line 149 by: "Section 5.11 supplies Frobenius polynomials of pencil fibres." (It is then cited only as context; if no target uses it, delete the subsection.)
   2. Add to Layer 4, before §4.9: "### 4.10 density of curve Weil tuples — Prove the following statement. For every g≥1, the classes σ_X∈T_g/W_g of smooth projective geometrically connected genus-g curves over finite fields of odd characteristic, with the unnormalized q coordinate, form a Zariski-dense subset; for g=0 the values q=#k are dense in G_m. (S16, Proposition 4.7 and Appendix B, pp.321,357–358; S16 line 1258 and S16 line 3321). One route is as follows. Apply DeligneWeightsAndPurity §10.5 to the odd-degree hyperelliptic family y²=∏_{i=1}^{2g+1}(x−a_i) over the configuration space of distinct branch points, whose geometric ℓ-adic monodromy is Sp_{2g}(ℤ_ℓ) by ArithmeticStatisticsPartVIII §5.17 (ℓ≥5 for g=1). Half-Tate normalization gives density of the normalized classes in the compact form over each fixed q₀ and every extension degree; the varying coordinate q₀^m gives the radial direction, since a Laurent polynomial vanishing at infinitely many q₀^m vanishes. *Needs:* DeligneWeightsAndPurity §10.5; ArithmeticStatisticsPartVIII §5.17; §0.1." Move the three Checks of lines 159–161 under it.
   3. In §4.9 (line 804), §10.4 (line 1570) and the Dependencies bullets (lines 832, 1605), replace "LefschetzPencilsAndVanishingCycles §5.11 and its universal-curve density contract; DeligneWeightsAndPurity §10.5" by "§4.10".
   4. Maintainer: remove `universal-curve-weil-density` from the plan's `gaps`. If a gap is kept instead, its supplier must come after both inputs (ArithmeticStatisticsPartVIII §5.17 continuation, line 163); the current supplier cannot be.

   *Test on the refuting instance.* After the repair the density edges go to ORDER lines 95 and 163, both above 173 (and above the tool's moved position 269); LefschetzPencils is asked for nothing it cannot cite, and DeligneWeightsAndPurity's edge to it is no longer part of a cycle.

2. **F02** (P2) EndoscopicTransfer §3.7's two-line chart is S16's frame-isomorphism open; the README attributes a corrected open to the supplier

   **Location.** `README.md:1172` ("Prove that its fixed-source strongly generated open is the following explicit Quot open, denoted Q°° … both restricted maps L_i⊗V_i→F are epimorphisms and both frame maps V_i→Hom(L_i,F) are isomorphisms … the supplied smoothness, principal GL(V_2)-bundle Q°°→Q°_(L1) and quotient [Q°°/G] identify with the strongly L₁-generated coherent open"); line 109 ("its supplied smooth two-framing chart Q₁₂, cotangent moment map and zero-level Higgs quotient"); §7.5 line 1193.

   **Claim.** The supplier defines no "fixed-source strongly generated open" for two lines. It takes "the two-framing smooth Quot chart Q₁₂ of Schiffmann §6.4" and asserts that [μ⁻¹(0)/G] is the Higgs stack over that chart. S16 §6.4 defines its open by the two frame isomorphisms alone and asserts, without proof, that this implies strong generation by L₁ (S16 line 2512). The README's own Check 4 (line 1189) refutes that assertion and says the point "must be excluded from the two-line open". So the README's Q°° is a proper open subset of the supplier's Q₁₂, and the sentence identifying [Q°°/G] with "the supplied" open attributes to the supplier a statement it does not make; the supplier's own statement that [Q₁₂/G] parametrizes strongly generated sheaves is false. The principal GL(V₂)-bundle is also not stated in ET §3.7 (its line 1279). The mathematics downstream is unaffected once Q°° is defined here: on all of Q₁₂, dim V_i=χ(L_i,F) forces Ext¹(L_i,F)=0, so the cotangent sequence of §7.5 and the zero-level identification hold on Q₁₂, and Q°° is the open where φ₁ is surjective (φ₂ is then surjective because F is a quotient of L₁^{l₁}, so μ_min(F)≥−d₁ and μ_min(F)+d₂≥d₂−d₁≥2g>2g−1 by §8.1).

   **Witness.** EndoscopicTransferAndUnitaryTraceComparison README at its head, line 1279: the two-framing chart is "Q₁₂ of Schiffmann §6.4", with the zero-level quotient "the Higgs stack over this bounded sheaf chart". S16 line 2508–2512: the open is defined by the two frame isomorphisms, followed by the parenthetical claim of strong generation. README line 1189: F=(L₁⊗M)⊕B with Ext¹(L₁,F)=0, dim Hom(L₁,F)=9=l₁, non-surjective first evaluation (recomputed: h⁰(M)=1, h⁰(L₁⁻¹B)=h⁰ of a degree-9 line in genus 2, 9+1−2=8, total 9; h¹=0).

   **Repair.** In §7.4 replace the first two sentences after "Use the smooth two-framing Quot chart Q₁₂ …" by: "Q₁₂ is the open of Quot((L₁⊗V₁)⊕(L₂⊗V₂),(r,d)) where both frame maps V_i→Hom(L_i,F) are isomorphisms (S16 §6.4); on it Ext¹(L_i,F)=0 because dim V_i=χ(L_i,F). Define Q°°⊂Q₁₂ as the open where the restricted map L₁⊗V₁→F is an epimorphism; prove that then L₂⊗V₂→F is also an epimorphism (F is a quotient of L₁^{l₁}, so μ_min(F)≥−d₁ and the bound d₂≥d₁+2g of §8.1 strongly generates F by L₂). Prove that Q°° is smooth, that Q°°→Q°_(L₁) is a principal GL(V₂)-bundle, and that [Q°°/G] is the strongly L₁-generated coherent open; [Q₁₂/G] is strictly larger (Check 4)." Under "From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison" add: "What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:two-line-chart-epimorphism): in §3.7, define the two-framing chart Q₁₂ by the two frame isomorphisms as in S16 §6.4, and restrict to the open where L₁⊗V₁→F is an epimorphism before asserting that its quotient parametrizes strongly generated sheaves; the frame isomorphisms alone do not imply strong generation." Add the slug to the plan's `gaps` (allowed at the package stage). In §7.5 replace "identifies the supplied zero-level equivalence" by "identifies the supplied zero-level equivalence, restricted to Q°°,". Tested on the instance: the genus-two point of Check 4 lies in Q₁₂ and outside Q°°; the cotangent sequence still holds at it (Ext¹(L_i,F)=0), so nothing proved on Q₁₂ is lost.

3. **F03** (P2) gap:degree-only-strong-generation asks SchemeAndStackFoundations for a statement it cannot state, and the statement follows from what is already supplied

   **Location.** `README.md:97` ("What SchemeAndStackFoundations must provide (gap:degree-only-strong-generation): For every coherent F on a smooth projective genus-g curve and every line L of degree −a, prove strong generation by L when μ_min(F)+a>2g−1"); `design/plan.json` gap `degree-only-strong-generation` (supplier SchemeAndStackFoundations §3.3). Used by §8.1 (line 1255) and cited as "generation contract" in twelve *Needs* lines.

   **Claim.** The hypothesis is stated with μ_min, which needs Harder–Narasimhan filtrations of coherent sheaves. SchemeAndStackFoundations has none: a search of its README on main for "Harder", "slope" and "μ_min" finds nothing. Coherent HN theory is GlobalShtukasAndFunctionFieldLanglands §0.5 (ORDER line 170), which this README already cites. The supplier therefore cannot state the contract. It is also unnecessary: the statement follows in a few lines from two supplied theorems.
   - SchemeAndStackFoundations §3.3 `curve_serre_duality_ext_hom`: Ext¹(U,V)≅Hom(V,U⊗ω_X)^∨ for finite locally free U and coherent V (its line 4745), with ω_X≅Ω¹ for smooth X. Here U=L is a line bundle, so the locally free restriction is no obstacle.
   - GlobalShtukas §0.5: a nonzero map F→M to a line bundle has image a rank-one subsheaf of M, a quotient of F, so Hom(F,M)=0 when μ_min(F)>deg M.
   With deg(L⊗Ω(x))=2g−1−a<μ_min(F) for every point x: Hom(F,L⊗Ω(x))=0, hence H¹(F⊗L^∨(−x))=0, hence Ext¹(L,F)=0 (take x away) and surjectivity of evaluation at x (the image of F⊗L^∨(−x)→F⊗L^∨ has vanishing H¹ because H² vanishes on a curve). Torsion F (μ_min=+∞) and F=0 are covered by the same argument.

   **Witness.** SchemeAndStackFoundations README on main, line 4741–4746 (the Ext–Hom duality for finite locally free U); no occurrence of μ_min in that README. README line 99 already states the two conditions of strong generation and the O(−1) negative control.

   **Repair.**
   1. Delete line 97.
   2. Add to §8.1, before "For every subspace U⊆V₁": "Strong-generation lemma. If deg L=−a and μ_min(F)+a>2g−1, then L strongly generates F. For every geometric point x, deg(L⊗Ω_X(x))=2g−1−a<μ_min(F), so Hom(F,L⊗Ω_X(x))=0 (GlobalShtukasAndFunctionFieldLanglands §0.5); by SchemeAndStackFoundations §3.3 `curve_serre_duality_ext_hom` with U=L this is dual to H¹(F⊗L^∨(−x)), which vanishes. Hence Ext¹(L,F)=0 and evaluation is surjective at x. Torsion sheaves have μ_min=+∞ and the zero sheaf is trivially generated."
   3. Replace "Use the degree-only generation contract μ_min(F)+d_i>2g−1 for strong generation" (line 1255) by "Use the strong-generation lemma with a=d_i", and in the twelve *Needs*/Dependencies occurrences of "SchemeAndStackFoundations §§2.20, 3.3, 3.6–3.7 and its coherent-duality and generation contracts" drop "and generation". Keep the coherent-duality contract (S03 does not concern it).
   4. Maintainer: withdraw the gap.

   The Check at line 1266 (μ_min(K)+24≥8>3) then tests the lemma; it still passes.

4. **F04** (P2) gap:complete-adams-series is compound and asks for λ-rings, Adams operations and a plethystic logarithm that earlier roadmaps already own

   **Location.** `README.md:135` ("What QSeriesPartitionsAndMockModularForms must provide (gap:complete-adams-series): Provide complete filtered rational λ-rings with commuting Adams operations, coefficientwise inverse plethystic Exp and Log acting on every coefficient and grading variable, and the finite-extension Möbius identity"); Scope line 16; `design/plan.json` gap `complete-adams-series`.

   **Claim.** Three of the four objects asked for already have owners, and the named supplier has none of them.
   - Pre-λ-rings, special λ-rings and Adams operations ψⁿ with ψⁿψᵐ=ψ^{nm} are SchemeKTheoryOperations §§6.2.1–6.2.2 (`TauCeti.LambdaRing.PreLambda`, `.adams`; its README line 1692–1715), ORDER line 41, before the supplier (line 172) and this roadmap. Its Checks include the line-element structure on ℤ[u,u⁻¹], the structure R_g needs.
   - The plethystic coefficient family L(F) with Adams action on both q and the grading variables, its uniqueness, triangular recursion and product/inversion closure, and the Laurent-integrality notion "admissible", are HabiroNahmSeries §5.1 (its line 1073–1080), which this README cites only for the ordinary mvLog/mvExp. Its L_n is exactly (q−1)[tⁿ]Log F in this roadmap's notation.
   - The plethystic exponential on tℚ((q))[[t]] is HabiroCyclotomicCompletions §1.1, already cited at line 129.
   QSeriesPartitionsAndMockModularForms §§2.4 and 3.5 are the q-binomial/Euler identities and "ordinary partition-series adapters"; a search of its README for "λ-ring", "plethys" and "Adams" finds nothing. The contract therefore re-plans λ-rings and a second plethystic logarithm at a supplier that has neither, and bundles them with the one thing that is genuinely missing: the extension of HabiroNahmSeries §5.1 from ℚ(q) coefficients to the complete filtered λ-algebras R_g, K_g and their completions, with Adams acting on all a_i.

   **Witness.** SchemeKTheoryOperations README at its head, line 1692 and the Adams paragraph of §6.2.2; HabiroNahmSeries README at its head, line 1073 (definition of L(F)) and line 1079 (admissibility and closure laws); QSeriesPartitionsAndMockModularForms README at its head, headings at lines 304 and 483 and no match for the three search terms.

   **Repair.** Replace the needs sentence (README line 135 and the plan's `needs`) by: "Extend HabiroNahmSeries §5.1's plethystic coefficient family, inverse Exp/Log laws and admissibility from ℚ(q)[[t]] to complete filtered ℚ-algebras carrying the special λ-ring structure of SchemeKTheoryOperations §§6.2.1–6.2.2 with Adams operations on every coefficient parameter and grading variable, agreeing with HabiroCyclotomicCompletions §1.1 under Laurent-series specialization; include the finite-extension Möbius identity." Add "SchemeKTheoryOperations §§6.2.1–6.2.2 owns λ-rings and Adams operations; HabiroNahmSeries §5.1 owns the one-parameter plethystic coefficient family" to Scope line 16 and a line to the SchemeKTheoryOperations contracts. Maintainer: the natural supplier of the narrowed contract is HabiroNahmSeries (§5.1 continuation), which precedes the tool's moved position 269; if the supplier stays QSeriesPartitionsAndMockModularForms, its section must say which of §§2.4, 3.5 is extended. Tested on the instance: ψ₂((q−1)⁻¹)=(q²−1)⁻¹ and the Exp(T)=1+T+T²+⋯ witness of line 141 are both statements about the λ-structure of SchemeKTheoryOperations §6.2 composed with HabiroNahmSeries §5.1's L(F); nothing in them needs QSeries §§2.4, 3.5.

5. **F05** (P3) `nilpotent_matrix_count` is an input lemma, not a headline theorem

   **Location.** `Suggested.lean:84` and the module docstring lines 9–11 ("It states the roadmap's headline theorems against the pinned APIs: finite-field nilpotent matrix enumeration and degree independence"); README §1.4 line 355 ("This is the headline `nilpotent_matrix_count`"), line 49, line 183.

   **Claim.** The Summary (line 3) lists the end theorems: the partition residue formula, the coprime Higgs count, Higgs purity and the Poincaré polynomial, the nilpotent-cone formula and Mellit's degree-independent count. The Fine–Herstein enumeration of 1958 is the Layer 1 input to the ratio of §1.5, not an end theorem, and `Suggested.lean` is the acceptance test, not a catalogue. The statement is true (n=0,1,2 over 𝔽₂: 1,1,4; n=2 over 𝔽₃: 9).

   **Witness.** README line 3 against Suggested.lean line 84.

   **Repair.** Delete `nilpotent_matrix_count` and the "Layer 1" section comment from `Suggested.lean`; in the module docstring replace "finite-field nilpotent matrix enumeration and degree independence of the absolute indecomposable bundle count" by "degree independence of the absolute indecomposable bundle count"; in §1.4 replace "This is the headline `nilpotent_matrix_count` in Suggested.lean, for every field K with a finite underlying type and every natural n." by "It holds for every field K with a finite underlying type and every natural n."; in line 49 delete "for the headline `nilpotent_matrix_count`"; in line 183 replace "states the nilpotent matrix enumeration and degree independence" by "states degree independence". If the authors keep it, add it to the Summary's list of end theorems instead.

6. **F06** (P3) present-tense ownership for a symmetric-function "Part II" that exists only as a contract

   **Location.** `README.md:17` ("its symmetric-function Part II owns generic modified Macdonald admissibility and the regular-sequence deformation theorem"); line 139 ("The supplier's Part II also proves the integral HLV conclusion").

   **Claim.** No roadmap on main, at an open head or on the board contains modified Macdonald functions; a repository-wide search for "Macdonald" returns only bibliography entries (SchurWeyl, ClassicalGroups, SmoothRepresentationsOfLocalGroups). QSeriesPartitionsAndMockModularForms §3.5 is "ordinary partition-series adapters". The objects exist only as gap:macdonald-admissibility, so "owns" and "proves" overclaim.

   **Witness.** The `roadmaps grep -i macdonald` result (bibliography hits only); QSeries README heading at its line 483.

   **Repair.** Line 17: replace "its symmetric-function Part II owns generic modified Macdonald admissibility and the regular-sequence deformation theorem" by "gap:macdonald-admissibility asks its symmetric-function continuation for generic modified Macdonald admissibility and the regular-sequence deformation theorem". Line 139: replace "The supplier's Part II also proves" by "The same contract also asks for".

7. **F07** (P3) the §8.4 elliptic Check uses the opposite sign of §8.2's δ and calls the negative value stable

   **Location.** `README.md:1313` ("its test weight is at most 7−2·5=−3; the full two-dimensional U₁ generates all seven dimensions, and (0,U₂) has weight −2 dim U₂. Thus the point is γ-stable"), against §8.2 line 1270 (δ(a₁,a₂)=l₁a₂−l₂a₁; semistable means δ≥0, stable δ>0) and the Check at line 1315 ("Its weight is 9·29−47·8=−115, so it cannot be semistable").

   **Claim.** With l₁=2, l₂=7 the pair generated by a one-dimensional U₁ has dimensions (1,5) and δ=2·5−7·1=+3>0, and (0,U₂) has δ=2 dim U₂>0; stability holds because δ is positive. The Check prints −δ (7−10=−3 and −2 dim U₂) and concludes stability from negative values, while two bullets later a negative value (−115, which is δ) proves instability. The same quantity is used with both signs inside one Checks block.

   **Witness.** Recomputed: d₁=2, d₂=7, l₁=2, l₂=7; a nonzero section of O(2o) times H⁰(O(5o)) spans 5 of the 7 dimensions of H⁰(O(7o)); δ(1,5)=3, δ(0,a₂)=2a₂, δ(8,29)=−115.

   **Repair.** Replace "so its test weight is at most 7−2·5=−3; the full two-dimensional U₁ generates all seven dimensions, and (0,U₂) has weight −2 dim U₂. Thus the point is γ-stable" by "so its invariant pair has δ(1,5)=2·5−7=3>0; the full two-dimensional U₁ generates all seven dimensions, and (0,U₂) has δ=2 dim U₂>0. Thus the point is γ-stable".

8. **F08** (P3) §1.2 re-derives for Coh(X) what ArtinAlgebras Layer 0 states, through a §1.1 with no other consumer

   **Location.** `README.md:309–335` (§1.1 additive Hom transfer; §1.2's route "Apply the finite-length module local-ring theorem through hom-transfer; apply direct-sum uniqueness in the same way"); line 11 ("ArtinAlgebras Layer 0 owns general categorical decomposition and radicals").

   **Claim.** ArtinAlgebras Layer 0 (another author's open pull request adding a new folder, which this roadmap may cite) states exactly what §1.2 needs: Recognition (an idempotent-complete category with finite biproducts, Hom-finite over a commutative Artinian ring, is Krull–Schmidt), Uniqueness, and Indecomposables (local endomorphism rings), its README lines 153–166. Coh(X) on a proper curve is abelian and Hom-finite over k (SchemeAndStackFoundations §2.6), so §1.2 is one application. §1.1 exists only to feed §1.2 (a search for "§1.1" finds no other consumer) and carries no locator of its own. This is a P3 because the pinned Tau Ceti module theorems give a legitimate alternative route that depends on no open pull request; the defect is that the README names ArtinAlgebras as owner and then plans the categorical argument again.

   **Witness.** ArtinAlgebras README at its head, line 164 (Recognition), line 160 (Uniqueness), line 156 (Indecomposables).

   **Repair.** In §1.2's route write: "Coh(X) is abelian with finite biproducts and Hom-finite over k (SchemeAndStackFoundations §2.6), so ArtinAlgebras Layer 0 (Recognition) makes it Krull–Schmidt; Uniqueness and Indecomposables give the permutation uniqueness and local endomorphism rings; `Finite.isDomain_to_isField` gives the residue field. Until that roadmap is on main, the same statements follow from `TauCeti.isLocalRing_end_of_isIndecomposable` and `TauCeti.exists_equiv_linearEquiv_of_directSum_of_isLocalRing_end` applied to Hom(M,−) as End(M)^op-modules." Add "ArtinAlgebras Layer 0; SchemeAndStackFoundations §2.6" to §1.2's *Needs* and a "From TauCetiRoadmap.ArtinAlgebras" contract line. Demote §1.1 to a sentence of that route (or keep it only if another target uses it).

One P1 (S01, blocking), three P2 (S02–S04), four P3 (S05–S08). Every round-1 finding of both passes is repaired at this head (table below); no repair introduced an error I could find. The new findings concern gap contracts and supplier citations that neither round-1 pass raised, plus three small prose and Check defects. Every computed Check I recomputed holds (ledger under *Verified sound*).

## Round-1 findings at this head

| Finding | Status | Witness at 3e6c184 |
|---|---|---|
| r1a F01 (P1) invariant positive representative | repaired | §9.2 (README line 1460): the class is Weyl invariant and has a nonnegative representative that "need not be Weyl invariant before imposing the paired-coordinate relations"; the degree-10 obstruction and the two representatives of q⁵ are Checks (lines 1469–1470); propagated to §10.5 (line 1578) and §11.6(ii) (line 1708). |
| r1a F02 (P2) scheme fibre versus reduced core | repaired, differently | Conventions line 33 define Λ_sch and Λ; §7.3 (line 1148) proves Lagrangian only for Λ and cites Stacks 04DZ/03SI for reduction invariance; the characteristic-two elliptic Check (line 1167) and the k[ε] family Check (line 1168) added; §8.7 (line 1367), §9.1 (lines 1449, 1456), §9.4 (line 1488) and the Lean docstring (Suggested.lean line 32) use Λ. I recomputed the Check: charpoly of a·Id₂ in characteristic 2 is t²+a², fibre a²=0, reduced core a=0, D=1. |
| r1a F03 (P1) second chart construction | repaired, with a residual supplier defect | §7.4 (line 1172) and §7.5 (line 1193) now use ET §3.7's Q₁₂, moment map and zero level; Scope line 7 claims only "the fixed-source comparison for the supplied two-line chart". The residual defect is S02 below: the supplier's chart is not the open the README identifies with it. |
| r1a F04 (P3) three Checks per definition | repaired | §4.6 lines 770–772 (3√2 versus 1; torsion generator 1,0; O(m)⊕O(−m)); §5.9 lines 966–968; §10.1 lines 1536–1538; §11.1 lines 1628–1631; §11.3 lines 1667–1669; §11.5 lines 1701–1704. Values recomputed in the ledger. |
| r1a F05 (P3) equal-slope HN type | repaired | §4.7 line 784: types ((2,0)) and ((1,1),(1,−1)) with one class each; ((1,0),(1,0)) declared inadmissible. |
| r1b F01 (P2) frame bijectivity | repaired, differently | §8.4 line 1304 states the Ext¹(L₁,F)=0 vanishing as a separate target on the intermediate locus Q°_(L₁,L₂), citing S16 line 2522 and S16 line 2753; Checks at lines 1315–1317 (F=L₁⊕B, dims 11 and 2, weight −115; elliptic positive control; §7.4 example). Recomputed: h⁰(L₁⁻¹F)=1+10=11, h¹=2, 9·29−47·8=−115. |
| r1b F02 (P2) gap:fixed-source-good-lines | repaired | README line 111 and `design/plan.json` carry the same needs sentence: construction over every field as the locally free open of §3.7, identification with §3.6 only when the characteristic does not divide r!. ET §3.6 (its line 1241) still assumes char(k) ∤ |W|. |
| r1b F03 (P3) §8.9 Checks | repaired, differently | Five Checks at lines 1391–1395; the rank-two elliptic mass 30 = 12+8+6+4 and the logarithmic remainder 6 recomputed below. |
| r1b F04 (P3) slope-zero attribution | repaired | Line 1383 attributes MS14 Theorem 1.2 (4) to positive slopes only and proves the slope-zero factor by z⁰ extraction (MS14 line 96, MS14 line 427). |

## Verified sound

**Counts.** Declarations read: 5 of 5 plus the module docstring. Targets read: 80 of 80 (README read in full, 1775 lines; 80 `*Needs:*` lines, 85 Checks blocks with 195 bullets). Locators verified against the cached texts: 71 line anchors (S16 56, MS14 8, HN10 3, SV12 1, M18 1, ACK07 1, LIN15 4, BTL12 3, SPR66 1, STACKS 2) plus WII (3.5.3) at WII line 2849 and the S16 page-marker arithmetic (marker N is printed page 296+N; checked at markers 6, 44, 61). Sibling citations checked at main or at the named open heads: 27 roadmaps, 63 sections or layers; every one exists with the content attributed to it except as reported in S01–S04 and S08 (list: SchemeAndStackFoundations §§1.18–1.21, 2.6, 2.18, 2.20, 3.3, 3.6–3.7, 4.1, 4.5, 4.14; AlgebraicModuliForArithmeticGeometry §§1.3, 4.19; EndoscopicTransfer §§3.6–3.7 including items (a)–(d); AutomorphicSpectralTheory §§6.22c, 6.24; GlobalShtukas §§0.1, 0.5–0.6, 0.13; FunctionFieldArithmetic §§0.2–0.3, 5.1–5.4; ClassicalGroupsPartII CG.0.4–CG.0.5, CG.2.4–CG.2.6; WeilConjectures WC.1 "Finite groupoid mass"; ReductiveGroupsPartII RG2.3.7; HabiroNahmSeries §5.1; HabiroCyclotomicCompletions §1.1; QSeries §§2.4, 3.5; DeligneWeightsAndPurity §§0.10, 0.12, 0.16–0.18, 1.7, 7.12, 7.15, 8.8–8.11, 10.5; LefschetzPencils §5.11; ArithmeticStatisticsPartVIII §5.17 with its three named items; EtaleDualityAndPerverseSheaves §§0.4, 0.6–0.7; CohomologicalPointCounting "The combined endpoint"; ComplexComparisonPartII C6.3–C6.6; AlgebraicVectorBundles L0A–L2B; QuiverRepresentations Layers 1–2; ArtinAlgebras Layer 0; SchemeKTheoryOperations §6.2). TopologicalMirrorSymmetryForHitchinSystems (Downstream consumers) is in the merge order at line 311.

**Declared gaps.** All eight slugs agree between README and `design/plan.json` with the same supplier and needs; none has supplier `none`. `coherent-ext-serre-duality` is genuinely missing (SchemeAndStackFoundations §3.3 proves the Ext–Hom form only for locally free U) and true on smooth curves (κ(x),κ(x): 1=1; κ(x),O: 1=1; O,κ(x): 0=0; the nodal Check at line 99 shows why smoothness is required). `reductive-character-git`, `macdonald-admissibility`, `affine-bundle-compact-shift` and the repaired `fixed-source-good-lines` are precise and not provided elsewhere. The other three are S01, S03, S04.

**Dependency check** (run as instructed, with `--movable`):

```text
moved: CountingBundlesAndHallAlgebrasOfCurves moved in the merge order from #172 to #269, right after its last supplier ClassicalGroupsPartII (HabiroNahmSeries also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 52 roadmaps, 599 edges, 0 problem(s)
```

No UPWARD or CYCLE line; the move is not a defect. The tool does not read the `needs` text of gaps, which is why S01 is invisible to it. The pull request's diff touches only `packages/CountingBundlesAndHallAlgebrasOfCurves/` (nine files); `design/plan.json` changes only in its `gaps` list (one hunk). Policy: no `lemma`, no `set_option`, no pull-request numbers or process words in README or docstrings, every target has a locator, imports are `import Mathlib` plus three existing `TauCeti.*` modules.

**Lean.** Not built: no Lake environment at the pins exists on this worker (the local Tau Ceti checkout is at another commit without the needed oleans, and its Mathlib package is at another revision), so no `#check @name` file was elaborated. Manual binder audit: all five declarations carry their binders and instances in their own signatures; there is no section `variable`, no sorry'd data, no `True`, no `lemma`. Pinned carriers read at the pins (Tau Ceti a91d3aa, Mathlib 6b7abb3): `FiniteLocallyFreeSheaf.FixedRank` (abbrev, FixedRank.lean line 69), `FixedRank.pullback` (line 104, `(f : X ⟶ Y) : FixedRank Y r ⥤ FixedRank X r`, so pulling back along `pullback.fst : X×_k Spec k̄ ⟶ X` has the right direction), `Scheme.Modules.eulerCharBelow` (line 105, truncated alternating finrank with junk value 0 for infinite-dimensional cohomology, as the README says), `InvertibleSheaf.trivial` (line 131), `Indecomposable` (BinaryBiproducts.lean line 1096), `Skeleton` (Skeletal.lean line 74), `ObjectProperty.FullSubcategory` (line 39), `Matrix.card_GL_field` (Card.lean line 120), `IsArtinianRing.isNilpotent_jacobson_bot` (Ring.lean line 54, `[Ring R]`), `IsArtinianRing.isSemisimpleRing_iff_jacobson` (Module.lean line 641), `Finite.isDomain_to_isField` (LittleWedderburn.lean line 176), `IsProper` (Morphisms/Proper.lean line 41), `SmoothOfRelativeDimension` (Morphisms/Smooth.lean line 127), `GeometricallyConnected` (Geometrically/Connected.lean line 40), `X ↘ S` (Over.lean), Tau Ceti Krull–Schmidt theorems (DirectSum.lean line 154 without a finite-length hypothesis; Indecomposable.lean line 266 with `IsFiniteLength`, supplied by finite-dimensional Hom modules as §1.1 says), `YoungDiagram.armLength`/`legLength` (HookLength/Basic.lean lines 136 and 140, natural subtraction, used only on cells).

| Declaration | Context compared with README | Computed control | Outcome |
|---|---|---|---|
| `bundleDegree` | explicit `k`, `X : Scheme.{u}`, `X.Over (Spec k)`, implicit rank, fixed-rank sheaf; total function on any scheme | P¹: χ₂(O(1))−χ₂(O)=2−1=1; O(1)⊕O(−1): 2−2·1=0; genus two O²: −2−2(−1)=0 | matches §0.2 |
| `IsAbsolutelyIndecomposable` | same context; pullback to X×_k Spec k̄, then `Indecomposable` on the sheaf of modules | O: End=k̄, idempotents 0,1, nonzero: true; O²: diag(1,0): false; zero: fails nonzeroness: false | matches §0.2 |
| `absIndecCount` | same context, `r : ℕ`, `d : ℤ`; `Nat.card` of a skeleton (0 on an infinite type) | P¹ over 𝔽₃, ranks 0,1,2: 0,1,0 in degrees ±1; class count 1 versus mass 1/2 | matches §0.2 |
| `nilpotent_matrix_count` | `[Field K] [Finite K]`, `n : ℕ`; `n*(n−1)` is 0 at n=0 | q=2: n=0,1,2 give 1,1,4; q=3, n=2: 9 | true; see S05 |
| `absIndecCount_eq_of_degree` | `[Finite k]`, proper, smooth of relative dimension 1, geometrically connected structure map; all `r`, `d`, `d'` | P¹: 1=1 (r=1), 0=0 (r≥2, r=0); genus one: P(1)=P(1) | matches §10.4 (Mellit Theorem 1.1) |

**Computed ledger** (one row per statement checked; values on both sides).

| Statement | Instances | Values | Result |
|---|---|---|---|
| Conventions, Euler form | P¹: χ(O,O(1)), χ(O(1),O) | 1·1+1−0=2; 1+0−1=0 | agrees |
| Conventions, Adams | (−1,−2), q=2 | P(1)=6; ψ₂(1−Σα+q)=1−1−4+4=0; ψ₂((q−1)⁻¹)=1/3 | agrees |
| Conventions, y²+y=x³ | 𝔽₂, 𝔽₄, 𝔽₆₄ | 3; 1+4−(−4)=9; 1+64−(−16)=81 | agrees |
| §0.3 residues | (1−z/u)⁻¹, (1−z/u)⁻² | rRes 1,0; dRes −1,−1 | agrees |
| §1.3 radical block | N=k[t]/t², M=N², 𝔽₂ | dim M₂(rad)=4; M₂(𝔽₂) has 16 elements | agrees |
| §1.4 | n=0,1,2 over 𝔽₂; n=2 over 𝔽₃ | 1,1,4; 9; GL counts 1,1,6 | agrees |
| §1.5 ratio | 0; L/𝔽₃; L²/𝔽₂; k[t]/t²/𝔽₂ | 1; 1/2; 4/6; 2/2 | agrees |
| §1.9 cutoff | g=2, r=2; g=1 | d>2; gap bound 0 | agrees |
| §2.1 | BGL₁(𝔽₃); fibre of Id | 1/2; 1 | agrees |
| §2.3 Heine | one line species, q=2, degrees 0,1,2 | 1,1,4/6 versus exp(T+T²/6): 1,1,1/2+1/6 | agrees |
| §2.7 fibre mass | one step; length-two block on P¹/𝔽₂ | 0; d=g−1=−1 gives 1/2 = 3 nonzero nilpotents / 6 | agrees |
| §3.2 Green | O,O on P¹/𝔽₂ | product 3v, pairing 3v/6=v/2; Δ′ gives v/2 | agrees |
| §3.4 flag mass | O⊂O² on P¹/𝔽₂ | 3/6=1/2; q^{−1/2}·v/2=1/2 | agrees |
| §4.5 | O(1)⊕O(−1) on P¹ | E((1,−1),(1,1))=1+1+1=3; q^{−1/2}q^{−1}q^{3/2}=1 | agrees |
| §4.6 Checks | P¹/𝔽₂ | three sublines, twist √2: 3√2 versus characteristic 1; torsion generator 1 on κ(x), 0 on O | agrees |
| §4.9 | P¹/𝔽₂ | N₀=1+3z; [T]N: O(1)→1, three O⊕κ(x): 2 nilpotents/2 automorphisms each → 1+3=4; (1+3z)(1+z)=1+4z; [Tz](N/N₀)=1 | agrees |
| §5.2 | one rank-one slot, q=2, P¹ | zw coefficient 3/(2·1)=3/2 | agrees |
| §5.6 | tuple (2), g=2 | a(2)=−1/2 | agrees |
| §5.8 | λ=(1),(2),(1,1),(3) | arms (0),(1,0),(0,0),(2,1,0): 1, ζ(q⁻¹z), 1, ζ(q⁻¹z)ζ(q⁻¹z²) | agrees |
| §5.9 | λ=(1),(2) | q^{g−1}J₍₁₎H₍₁₎=P(1)/((q−1)(1−z)); H₍₂₎=1/(1−z²): coefficients 0,1 | agrees |
| §6.2 extraction | r=2, b₀=2, b₁=3 | dRes at 1,−1: −5/2, 1/2; −Σξ^{−d}dRes: 2, 3 | agrees |
| §6.3 | rank 1 | A₁=P(1)/(1−z); dRes −P(1); extraction P(1) | agrees |
| §6.4 rank two | empty tuple, q=2; (−1,−2), q=2 | 1/3−1/12−1/4=0; P=6,U=15,V=0,S=5/6: 6·(5−4)=6 | agrees |
| §6.6 origin constants | g=1,2,3; r=1..4; all d mod r | independent plethystic-logarithm computation (z-precision 140): g=1: 1,1,1,1; g=2: 1,2,6,22; g=3: 1,3,15,95, equal for every residue of d | agrees with 1, g, 4C(g,2)+g, 32C(g,3)+20C(g,2)+g |
| §7.1 torsion Ext | k_x, zero field | columns (1,1),(1,1), zero differential: 1,2,1 | agrees |
| §7.1 elliptic sign | (O,0)→(O,η) | Id↦η, coefficient +1 | agrees |
| §7.3 characteristic two | g=1, r=2, d=1, p=2 | (t−a)²=t²+a²; fibre a²=0; Λ=Pic¹; D=1; H=Pic¹×A¹ of dimension 2=2D | agrees |
| §7.4 Check 4 | g=2, deg L₁=−5, M degree 2 nonspecial, deg B=4 | h⁰(M)=1, h⁰(L₁⁻¹B)=8; dim Hom=9=l₁; Ext¹=0; M has basepoints | agrees |
| §7.5 | line in genus g | kernel Ext¹(L,L)* dimension g | agrees |
| §7.6 | V₁=V₂=k, h=1 | μ=(xy,−xy), trace 0 | agrees |
| §8.1 framing | g=2, r=2, d=1 | l=2, B=−3/2, d₁=5, l₁=9, d₂=24 (≥20, ≡6 mod 9), l₂=47, C=423; kernel rank 7, degree −46; μ_min(K)≥−46+30=−16; −16+24=8>3 | agrees |
| §8.1 elliptic | g=1, r=1, d=0 | d₁=2, l₁=2, d₂=7, l₂=7, C=14 | agrees |
| §8.2 | (2,3): (1,1),(1,2); (9,47) and (5,24) | −1, 1; 216−235=−19 | agrees |
| §8.3 | local End dimension h | q^{h−χ}/q^{h−1}=q^{1−χ}=q^D | agrees |
| §8.4 elliptic Check | U₁ of dimension 1 | δ(1,5)=+3, δ(0,a₂)=2a₂: stable | agrees, sign printed wrongly (S07) |
| §8.4 F=L₁⊕B | g=2, deg B=6 | h⁰=1+10=11, h¹=2; pair (8,29): 9·29−47·8=−115 | agrees |
| §8.5 | W of class (1,1), (1,0) | 19·(1−2)=−19; 19·1=19 | agrees |
| §8.9 rank one | q=2, g=1, P(1)=3; g=2 | 3·2/1=6, Ω=6; q^{−1}·q²P(1)/(q−1)=2P(1), reversed 8P(1) | agrees |
| §8.9 rank two | E/𝔽₂, d=0 | 3 pairs·4/1=12; 3 doubled·16/6=8; 3 self-extensions·4/2=6; 3 orbits·4/3=4; total 30; 30−6²/2−(4·9/3)/2=30−18−6=6=qA(2,0) | agrees |
| §8.10 | E/𝔽₂, E/𝔽₄ | A=3,9; Ω=6,36; #H=6,36; stack masses 6,12 | agrees |
| §9.1 | rank 1, g=2 | m=2, b=0, D=2; shift 4, twist −2 | agrees |
| §9.2 | rank 1, g=1; g=2, r=2, d=1 | (1+α₁)(1+α₂)=1+α₁+α₂+q, leading t²; D=5, top degree 10, 10=4e impossible | agrees |
| §9.3 | rank 1, g=1,2 | H_c(E×A¹): dims 1,2,1 in degrees 2,3,4: t²−2t³+t⁴=t²(1−t)²; g=2: t⁴(1−t)⁴ | agrees |
| §9.4 | rank 1, g=2 | q²∏(1−α_j⁻¹)=∏(α_j−1)=P(1); top degree 4, dimension 1 | agrees |
| §10.1 | g=1, q=2, α=−1; α=−2; actual curve | 3(z+1): 6,3; 2(z+2): 6,4; (1−α)(1−ᾱ)=1−0+2=3 | agrees |
| §11.2 Euler form | one two-step mark on P¹ | m=(1,0),n=(0,1): 1−1=0; reversed 1; Hom dims 0, 1 | agrees |
| §11.3 | genus two extension of O by O(P) | h¹(O(P))=1; exact slopes 1,0 | agrees |
| AutomorphicSpectralTheory §6.24 Check | g=2, A=(O(P),0), B=(O,0) | complex Hom(B,A)→Hom(B,A⊗Ω) with zero differential: h⁰(O(P))=1, h¹(O(P))+h⁰(Ω(P))=1+2=3, h¹(Ω(P))=0; mass q^{3−1}=q² | agrees |
| ArithmeticStatisticsPartVIII Check | (g,ℓ)=(1,3) | index-27 subgroup with full mod-3 image; ℓ≥5 avoids it | agrees with its line 967 |

## Not verifiable

- M20 (Mellit 2020), FH58 and HES81 are settled locator-only sources; their theorems are cited by locator. The degree-independence headline was checked for meaning and on genus 0 and 1; Mellit's proof was not read.
- The §8.4 frame-vanishing target and the §8.7 BB–Hesselink theorem over a finite base field are stated as targets with routes; no source at hand states them in that generality.
- Lean: not built (see above); the five signatures were audited by hand against the pinned sources.
- Ownership against open pull requests was checked through the `roadmaps grep` index of 2026-10-25T14:06:45Z and the sibling checkouts named in the brief; pull requests without supplied files were not read beyond that index.

## Source issues

- **Error** in S16 at §6.4, printed p.339 (S16 line 2512): the source says the two frame isomorphisms of a point of the two-line open imply strong generation by L₁; it should require surjectivity of the restricted evaluation, which the genus-two example (L₁⊗M)⊕B violates with Ext¹=0 and the right Hom dimension; affects the proof.
- **Gap** in S16 at Lemma 6.4, printed p.345 (S16 line 2753): the source passes from injectivity of the first frame map to bijectivity by a dimension equality that amounts to Ext¹(L₁,F)=0, not established for points of the intermediate locus (F=L₁⊕B has dim Hom(L₁,F)=l₁+g); affects the proof.
- **Error** in S16 at Corollary 1.5, printed pp.301–302 (S16 line 198 and S16 line 201): the source says the count lies in the image of an invariant nonnegative polynomial ring and is monic of degree 2D; for g=2, r=2, d=1 the degree-10 top monomial cannot be invariant in the free ring, so only the class on the paired cone has such a representative; affects a stated result.
- **Misprint** in S16 at Lemma 2.4, equation (2.1), printed p.309 (S16 line 635): the source writes the diagonal part of the radical as an n_i-fold direct sum of rad End(M_i); it should be the n_i×n_i matrix algebra over it (dimension 4, not 2, for N=k[t]/t², M=N² over 𝔽₂); affects nothing.
- **Misprint** in S16 at §4.2, printed p.316 (S16 line 1010): the bundle–torsion splitting coefficient is written q^{−l/2}; it should be q^{−rl/2}, as the Euler twist rl shows; affects nothing.
- **Misprint** in EndoscopicTransferAndUnitaryTraceComparison §3.7 at its line 1279 (a roadmap, recorded here because it inherits the S16 error): the text says the quotient of the two-framing chart of Schiffmann §6.4 parametrizes strongly generated sheaves; it should restrict to the open where the first restricted evaluation is surjective; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3e6c184", "job": "RT-CountingBundlesAndHallAlgebrasOfCurves~2b", "model": "fable", "worker": "fable-rt38"} -->
