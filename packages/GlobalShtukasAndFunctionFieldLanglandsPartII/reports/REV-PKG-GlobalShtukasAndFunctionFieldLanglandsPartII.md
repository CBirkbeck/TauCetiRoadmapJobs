<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1152#issuecomment-6384513456 -->
Review (claude) of c98ff93

Verdict: needs changes

1. **F01** (P3) §3.0 restates two LanglandsParameterStacks targets and cites the wrong ones

   - **Location.** `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md` line 394: "For every Schur-irreducible object A with endomorphism algebra equal to its algebraically closed coefficient field L, reconstruct the semisimple parameter φ_A … whose evaluation on every finite tuple equals the corresponding excursion scalar." Line 411 (*Needs*) cites "LanglandsParameterStacks §§LP2c.1–LP2c.4 (continuous reconstruction)"; lines 398–401 restate the centre-map API.
   - **Claim.** The excursion centre map of a categorical Hecke datum and the parameter of a Schur object are constructed here.
   - **Witness.** `TauCetiRoadmap/LanglandsParameterStacks/README.md` (open head) line 600, §LP2e.15 "Abstract excursion centre maps" (Fargues–Scholze VIII.4.1), and line 707, §LP2c.8 "Parameters of Schur objects" (Fargues–Scholze VIII.4.3), state exactly these; LP2e.15 assigns only the Bernstein-centre application to consumers.
   - **Repair.** In §3.0 cite LanglandsParameterStacks §LP2e.15 and §LP2c.8 (keep §§LP2c.3–LP2c.4 for continuity) and HeckeStacksAndLocalShtukas §§HS4.1, HS4.7 for the exported Hecke datum; restrict §3.0's own target to their instantiation on the lisse category of Bun_G for F of characteristic p, the restriction to the Bernstein centre (fs Definition/Proposition IX.4.1) and the compatibility with local-shtuka cohomology (fs Theorem IX.5.2). Update line 580 (Dependencies) to match.

2. **F02** (P3) Scope does not record ownership of §3.0, §4.0 and the analytic part of §3.1

   - **Location.** README line 7: "This Part II owns the arithmetic-weight consequences and the Fargues–Scholze comparison by local-to-global uniformization." Line 11 records moves only for §§5.1, 8.0, 8.5. §4.0 (line 585) and §3.1 (line 416: "analytic generic fibre and étale period map") are not mentioned.
   - **Claim.** The Fargues–Scholze parameter of §3.0, the all-prime étale Kloosterman anchor of §4.0 and the analytic local-shtuka tower of §3.1 are owned here without saying so.
   - **Witness.** `packages/KloostermanSheavesAndBesselIsocrystals/design/README.md` (merge order 259) plans §4.0's object at lines 234, 750, 845. `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md` line 24 assigns excursions to a roadmap that exists nowhere; its §HS2.9 has the tower and period map.
   - **Repair.** Add three Scope sentences: (1) this roadmap owns the equal-characteristic Fargues–Scholze parameter of §3.0 (no readable roadmap owns it); (2) §4.0 owns the étale Kloosterman anchor, moved down from KloostermanSheavesAndBesselIsocrystals KB.1, KB.6, KB.7 and KB.11, which later in the merge order imports §4.0; (3) in §3.1 take the analytic tower and its period map from HeckeStacksAndLocalShtukas §HS2.9 and own only the formal model and the identification of its generic fibre with that tower (lh Theorem 4.9, Proposition 4.12). The move in (2) is recorded here.

3. **F03** (P3) `propertyA` is a statement about bare arrays, not a headline

   - **Location.** `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/Suggested.lean` lines 39–58 (`WeightArray`, `rowSum`, `colSum`, `propertyA`); docstring lines 7–8: "Property A is stated on finite weight arrays, the actual multiplicity arrays used in the global argument."
   - **Claim.** `propertyA` is the roadmap's statable headline.
   - **Witness.** `WeightArray` is `(ℤ × ℤ) →₀ ℕ`, tied to no parameter, place or representation; the theorem is a half-page combinatorial lemma (ch26 line 1639, p. 34), arithmetic on its hypothesis. §8.6, which it serves, is not statable.
   - **Repair.** Delete `WeightArray`, `rowSum`, `colSum` and `propertyA` from `Suggested.lean` (§8.4 stays in the README as a target); make the module docstring say that no headline is statable at the pins and keep the not-statable list. If the author keeps it, apply R04.

4. **F04** (P3) `rowSum` and `colSum` restate `Finsupp.mapDomain`

   - **Location.** `Suggested.lean` lines 43–48.
   - **Claim.** Row and column margins need new definitions.
   - **Witness.** At the pin, `Finsupp.mapDomain` (`Mathlib/Data/Finsupp/Basic.lean:267`) along `Prod.fst`/`Prod.snd` is the margin: in a scratch copy, `rowSum a i = Finsupp.mapDomain Prod.fst a i` and the `colSum` analogue each close by one `simp [rowSum, Finsupp.mapDomain, Finsupp.sum_apply, Finsupp.single_apply, eq_comm]`.
   - **Repair.** If `propertyA` is kept against R03, state it with `Finsupp.mapDomain Prod.fst a` and `Finsupp.mapDomain Prod.snd a`, delete `rowSum` and `colSum`, and cite `Finsupp.mapDomain` in the Mathlib contract (line 37).

5. **F05** (P3) The module docstring omits several unstatable headlines

   - **Location.** `Suggested.lean` lines 10–29.
   - **Claim.** The list names every headline that is not statable.
   - **Witness.** Absent: rationality of Lafforgue's Satake classes (README §2.2, line 340), Beuzart-Plessis pseudo-globalization (§4.3, line 655), the local spherical separator theorem (§5.1, line 791) and the extraneous-point classification (§8.0, line 1181).
   - **Repair.** Add these four, each with its missing carrier (cuspidal excursion blocks and algebraic Hecke eigenvalues; automorphic representations and pseudo-coefficients; unitary spherical duals of reductive local groups; Kazhdan–Lusztig triples and complementary series).

6. **F06** (P3) FunctionFieldArithmetic §5.10 does not exist

   - **Location.** README line 603 (*Needs* of §4.0) and line 757: "FunctionFieldArithmetic §5.10 (Chebotarev)".
   - **Claim.** Chebotarev is supplied at FunctionFieldArithmetic §5.10.
   - **Witness.** `TauCetiRoadmap/FunctionFieldArithmetic/README.md` at its open head: Layer 5 ends at §5.8 "Quantitative Chebotarev in each degree" (line 1885); no §5.9 or §5.10. The board copy `packages/FunctionFieldArithmetic/README.md` also ends at §5.8.
   - **Repair.** Replace "§5.10" by "§5.8" in lines 603 and 757; the dependency is supplied, so no gap is needed.

7. **F07** (P3) Wrong internal pointers and one page range

   - **Location.** Line 37: "for the finite-array statement of §8.6"; line 509: "Use the coefficient-transport contract specified at §3.0, … (the central-reduction contract)"; line 513: "The specified §3.0 coefficient-transport contract"; line 1344: "consumes §§5.1–5.1"; line 659: ghs Appendix A "pp. 38–40".
   - **Claim.** These pointers resolve.
   - **Witness.** The array statement is §8.4 (line 1284). The coefficient-transport contract is in §3.3 (line 459), gap:parameter-square-root-transport. ghs Lemmas A.1–A.3 occupy pp. 38–39 (ghs lines 1789–1869); p. 40 is acknowledgements.
   - **Repair.** Line 37 "§8.4"; lines 509 and 513 "§3.3 … (the parameter-square-root-transport contract)"; line 1344 "§§5.1 and 8.0"; line 659 "pp. 38–39".

8. **F08** (P3) Roadmaps named in Scope and Downstream consumers exist nowhere

   - **Location.** Line 13: "Counting local systems, … belong respectively to GlobalShtukasAndFunctionFieldLanglandsCountingPartII, GlobalShtukasPartIICrystallineCompanions, ShtukaSpecialCyclesAndHigherSiegelWeil, ShtukaTateCohomologyAndGlobalBaseChange and GValuedDeformationsAndPotentialAutomorphy." Line 1344: "GlobalShtukasPartIISupercuspidalParameters consumes …".
   - **Claim.** These roadmaps own or consume these topics.
   - **Witness.** None of the six is on main, in an open roadmap pull request (`roadmaps grep` finds no match), in the board package index, in the board checkout or in the merge order; they are the design's proposed split.
   - **Repair.** In line 13 say only that these five topics are outside this roadmap's scope, without naming nonexistent owners; delete the GlobalShtukasPartIISupercuspidalParameters sentence from line 1344.

9. **F09** (P3) Generality narrowed below the sources, and "split" used inconsistently

   - **Location.** Line 639: "Let G be connected semisimple over a global function field K"; line 1237: "Let G be split semisimple over K", with (c) "every split w ∉ S has the same real part"; line 1320: "with G adjoint split".
   - **Claim.** §4.2 needs G semisimple; §§8.2, 8.6 need G split over K.
   - **Witness.** ghs Proposition 3.9 (line 450, p. 10) allows any reductive G; glo Theorem 1.1 (p. 1) allows connected reductive H with central character. ch26 Theorem 1.11 (line 234, p. 5) assumes G split only at v, hence "every split w".
   - **Repair.** §4.2: state it for connected reductive G with fixed central character, concluding irreducibility of every global parameter and an adjoint-bounded completion at z (semisimple G as a Check). §§8.2 and 8.6: replace "split semisimple over K"/"adjoint split" by "semisimple (resp. adjoint) over K and split at v", keeping "every split w ∉ S".

10. **F10** (P3) "Lafforgue's global parameter of Π" presumes a unique parameter

   - **Location.** Line 443: "the semisimplification of the restriction to W_(K_v) of Lafforgue's global parameter of Π equals the Fargues–Scholze semisimple parameter of Π_v"; line 639 and line 673: "whose global parameter L(Π) lies in no proper parabolic".
   - **Claim.** Π determines one global parameter.
   - **Witness.** The README's own Conventions (line 23) and §2.1 (line 311, Check line 334) require a chosen occurring excursion block; ch26 line 1495 notes that for multiplicity above one several σ can occur.
   - **Repair.** Line 443: "for every σ ∈ Φ(U) to which Π belongs (§2.1), the semisimplification … of σ equals …" (lh Theorem 6.13 gives the excursion-level form). Lines 639 and 673: "every global parameter to which Π belongs lies in no proper parabolic".

11. **F11** (P3) A Check describes an impossible parameter

   - **Location.** Line 158: "For cyclic C₃ with trivial Frobenius image all weights are also 0." (the same Check fixes q=5).
   - **Claim.** At q=5 there is a parameter with inertia image C₃ and trivial Frobenius image.
   - **Witness.** Frobenius acts on the C₃ quotient of tame inertia through μ₃ by x ↦ x⁵ = x⁻¹; with ϕ(Frob)=1 the image σ satisfies σ = σ⁻¹ and σ³ = 1, so σ = 1.
   - **Repair.** Take q ≡ 1 mod 3 for the cyclic case: "For q = 4 (or 7), cyclic C₃ inertia with trivial Frobenius image has all weights 0".

12. **F12** (P3) The SL₂-lift Check is false in characteristic 2

   - **Location.** Line 836: "the lift exists over K′ where the image of the Brauer class of σ in Br(K′)[2] vanishes."
   - **Claim.** The lifting obstruction is the class in Br(K′)[2].
   - **Witness.** The obstruction lies in H²(Gal(K^sep/K′), μ₂); this equals Br(K′)[2] only for p odd. For p = 2, cd₂ K′ ≤ 1 gives H² = 0 (every σ lifts over K) while Br(K′)[2] ≠ 0.
   - **Repair.** "… over K′ where the obstruction class of σ in H²(Gal(K^sep/K′), μ₂) vanishes (equal to Br(K′)[2] for p odd; zero for p = 2)". Delete the near-duplicate line 840.

13. **F13** (P3) Duplicate Checks

   - **Location.** Lines 138–139 (repeat 132–133 and 135); 189–190 (repeat 181–182); 245–246 (repeat 241 and the API line 236); 333 (repeats 329); 378–379 (repeat 374, 376); 501 (repeats 496); 930 (repeats 926); 989–990 (repeat 985, 987); 1045–1046 (repeat 1040–1041); 1101 (repeats 1097); 1230–1231 (restate §8.1 and repeat 1228); 1276–1277 (repeat API line 1269 and Check 1274).
   - **Claim.** Each bullet is a separate discriminating test.
   - **Witness.** Each listed bullet computes the same value on the same instance as the earlier one.
   - **Repair.** Delete the listed later bullets; every definition keeps at least three distinct Checks after deletion (counted: 0.1 six, 0.3 eight, 1.1 four, 2.1 five, 2.3 four, 3.4 six, 6.1 five, 6.4 five, 7.1 five, 7.3 five, 8.1 three, 8.3 four).

14. **F14** (P3) Three garbled or imprecise sentences

   - **Location.** Line 852: "including its specified central reduction the central-reduction contract"; line 275: "let T be a torus containing the semisimple part of Frob_v … That subgroup is parabolic unless ω vanishes on all roots"; line 882: "at every w ∉ S at which G_(K_w) is quasi-split".
   - **Claim.** These sentences say what is meant.
   - **Witness.** Root subgroups need a maximal torus; the group generated by T and the ω ≥ 0 root groups is always parabolic, proper unless ω vanishes on all roots (st line 4033 has the same slip). At w ∉ S, G is unramified, hence quasi-split.
   - **Repair.** Line 852: "including the central reduction of the reductive-central-reduction contract"; line 275: "a maximal torus T … That parabolic is proper unless ω vanishes on all roots"; line 882: "at every w ∉ S" (keep "if G is quasi-split over K" for the second clause).

Fourteen findings, all P3 (none blocking). The acceptance is conditional on the nine declared supplier gaps (listed under the gap audit below). No statement of the README was found false at the instances tried; the computed record is the adversarial table in "Verified sound".

## Verified sound

### Principles

No route-specific shortcut (the central-compact and odd-unitary restrictions in §§5.4 and 8.2 are forced by the G₂ witness and ch26 line 374). Parent and suppliers are imported by section. No upward or cyclic supply (depcheck below). No copied passage: every locator I opened is restated in the author's own words. No computational algorithm. `Suggested.lean` has a single `import Mathlib`, no `set_option`, no sorry'd data (the three definitions have real bodies), `theorem` not `lemma`, one module docstring, a namespace, a layer comment and a docstring on each declaration. No process words, pull-request numbers, LaTeX delimiters or machine paths in the README (grep: only source "Lemma" locators, "geometric lemma" and "Schur's lemma").

### Source sample (15 targets; the author flagged no locator as unverified)

| Target | Locator checked | Result |
| --- | --- | --- |
| 0.2 | ch26 Def 2.5, p. 7, line 323; ghs Def 2.5, pp. 7–8, line 329 | supports (a) as the "equivalently" clause, Frobenius-lift independence; README adds finite inertia correctly |
| 0.3 | ch26 Def 2.6, p. 7, line 333; ghs Defs 3.1–3.3, p. 8, lines 341–366; ty Lemma 1.4, pp. 6–7, line 201 | supports; README corrects the ch26 (iii) direction and the ghs N/N^i slip (source issues) |
| 0.4 | ghs Lemma 3.5 and proof, p. 9, line 384; ty Lemma 1.4(3)–(4) | supports, including reductive uniqueness via the adjoint centralizer |
| 1.2 | ch26 Prop 2.7, p. 8, line 353; laf02 Cor VII.8, pp. 201–202, line 11609 | supports (a)–(c); README uses ρ_u^ss, which is the meaningful reading |
| 1.3 | st Lemma 11.4, p. 83, line 4018; ghs Lemma 3.6, Remark 3.7, pp. 9–10 | supports; ghs Remark 3.7 gives the reductive extension |
| 3.7 | ch26 Prop 3.10(3), p. 10, line 494 | supports; README supplies the cuspidal-support proof the source calls obvious |
| 4.2 | ghs Prop 3.9, p. 10, line 450, Remark 3.10, p. 11; glo Thm 1.1, pp. 1–2; hny Thm 2, p. 17, line 976 | supports; narrower than the source (R09); ghs Remark 3.10 error noted |
| 4.3 | ghs Lemma A.1, Lemma A.3, pp. 38–39, lines 1789, 1834; glo Lemma 8.1, Prop 8.2, pp. 38–40 | supports exactly, including "same cuspidal support" only; page range nit (R07) |
| 5.3 | ch26 proof of Thm 5.4, pp. 14–15, line 639 | supports; README's fixed-ι reading of the tempered case is more careful than the source |
| 5.4 | ch26 Thm 5.4, p. 13, line 609; Cor 6.32, p. 25, line 1192; standing hypothesis line 374 | supports; the central-compact hypothesis is justified (source issue 4) |
| 6.5 | ch26 Exp 5.9, Sketch 5.10, pp. 15–16, lines 731, 757; sun Thm 2.11, p. 14, line 667 | supports; sun gives mixedness only, integrality is the declared gap |
| 7.2 | ch26 Conj 1.3, 1.8, Exp 1.9, p. 4, lines 167, 188, 201 | supports (a)–(c) and j(Frob_w) of (1.7) |
| 7.5 | ch26 Lemma 9.2, p. 31, line 1479 | supports; README correctly asks for Conjecture 9.1 at all small levels |
| 8.2 | ch26 Thm 1.11, p. 5, line 230; Prop 10.2, p. 32, line 1554 | supports (a); (b)–(c) add justified central-compact/adjoint hypotheses; split-at-v narrowing (R09) |
| 8.6 | ch26 Thm 10.3, p. 33, line 1592; Property A, p. 34, line 1639; Remark 10.7 | supports; Property A direction matches the Lean statement |

### Adversarial table (values computed)

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, Tate/reciprocity (L21, L27) | q=4 Tate line and inverse | 2 log₄(1/4) = −2; 2 log₄4 = 2 | holds | none |
| Conventions, WD relation (L21, L28) | r=diag(1,4), Ne₁=e₀ | rNr⁻¹e₁ = e₀/4 = (N/4)e₁; N: weight 2 → 0; sign reversed gives 4N | holds | none |
| Conventions, Satake normalization (L29–30) | diag(2,1/2) in SL₂ at q=4; degree-2 place | ν = ±log₄2 = ±1/2, weights ±1; 2log₄2 = 2log₁₆4 = 1 | holds | none |
| Conventions, degenerate (L31) | zero space; formal q=1 | empty multiset; 1 = 1^{w/2} for all w | holds | none |
| 0.1 geometric | G_m, q=4: 2, 3; e^i; (3+4i)/5 at q=5 | w=1; w=log₂3≈1.585∉ℤ; transcendental; |(3±4i)/5|=1, min. poly 5x²−6x+5 not monic, infinite order | holds | R13 |
| 0.2 independence | SL₂ adjoint; S₃ at q=5; cyclic C₃ | q,1,q⁻¹ → 2,0,−2; transposition ±1 → 0,0, (b) via ϕ(Frob′)^{Nm}=ϕ(Frob)^{Nm}; Frob inverts μ₃ at q=5 | (a)(b)(c) hold; L158 Check false | R11 |
| 0.3 pure WD | Sp(2) N≠0/N=0; G_m id vs id⊕1; Salem x⁴−x³−x²−x+1 | gr₀,gr₂ with N iso → weight 1; N=0 fails; weights {2} vs {2,0}; conjugate modulus 1.7221 | holds | R13 |
| 0.4 uniqueness | GL₂ diag(q^{1/2},q^{−1/2}); diag(1,q²) | N: gr₁→gr₋₁ iso (Steinberg); ratio q² ≠ q, no N | holds | none |
| 1.1 twist decomposition | F₄ Frob 3 (ℓ=5); F₂ 1+i, 1+2i (ℓ=7); ℚ̄_ℓ(−1) | log₂3∉ℤ; |1±i|=√2 → w=1; √5 ≠ 2^{w/2}; w=2; Ext vanishes as H¹ Frobenius classes avoid 1 | holds | R13 |
| 1.2 boundary propagation | Kl_n at 0; constant 3 on G_m/F₄ | ss eigenvalues 1,q,…,q^{n−1} (weights 0..2n−2), single gr_{n−1}; 3^{deg w} not integral weight | holds | none |
| 1.3 ST purity | SL₂ χ⊕χ⁻¹ weight 1; Legendre ⊗ q^{−1/2} | weights ±1 in a Borel; det q·q⁻¹ = 1, dense monodromy → weight 0 | holds | R14 |
| 1.4 local purity | PGL₂, π_z Steinberg | Sp(2)⊗q^{−1/2}: weights −1, 1, N≠0 | holds | none |
| 2.1 occurrence | Sym² Ind χ, det 1 | ρ⊗ρ = Ind χ² ⊕ μ ⊕ με, Λ² = εμ = 1 ⇒ Sym² ⊇ ε | holds | R13 |
| 2.2 rationality | PGL₂ | α+α⁻¹ = q_w^{−1/2}a_w algebraic | holds | none |
| 2.3 real part | trivial PGL₂; diag(q^{1/4},q^{−1/4}); Salem ζ | ν=½α̂ pairs ±½ → weights ±1; ¼ → weight ½; ν^ι=0, ν^{ι′}≠0 | holds | R13 |
| 3.0 local excursion | G=1; G_m value a at q=4; GL₂ St vs 1 | unit scalar 1; φ(Frob)=2 vs 1/2 separates conventions; common pair (2,1/2) | holds | R01 |
| 3.1 uniformization | GL₁ lattice z^{−d}O_v | O_X(dv), degree d·deg v: 1 (rational v), 2 (degree-two v) | holds | R02 |
| 3.2 Li-Huerta | rank 2 unramified, q=4 | (2,1/2), trace 5/2 | holds | R10 |
| 3.3 local parametrization | GL₂ St, 1; PGL₂ St | diag(q^{1/2},q^{−1/2}) for both | holds | none |
| 3.4 geometric reps | trivial PGL₂; value 3 at q=4; transcendental unitary value | weights ±1 ✓; log₂3 ✗; no number-field model ✗ | holds | R13 |
| 3.5 conjugates | 1+2i at q=5; √5 ↦ −√5 | |1±2i|=√5 → w=1; (−√5,−1/√5) weights ±1 | holds | R07 |
| 3.6 torus characters | unramified quadratic, χ(ϖ_E)=q_F^{1/2}, q_F; q_F=4 value 2; F(t^{1/p}) | ±q_F^{1/4} → w=½ ✗; ±q_F^{1/2} → 1 ✓; ±√2 → ½ ✗; unipotent radical dim p−1 | holds | none |
| 3.7 stability | PGL₂ Ind(|·|^{±1/2}) | constituents 1 and St, both geometric | holds | none |
| 3.8 central characters | GL_n St_n; μ_p in char p | ω trivial; (x−1)^p=0 ⇒ μ_p(F)=1 | holds | none |
| 4.0 Kloosterman anchor | Kl₂; constant rank 2; PGL₂ odd p | Swan 1; Swan 0, invariants 2; adjoint dim 3, toral line sign −1, invariants 0 | holds | R02 |
| 4.1 ι-tempered | Salem ζ; (3+4i)/5; G_m Salem | 1.7221 > 1 not tempered at ι′; all conjugates modulus 1; central modulus 1.722083805739 | holds | none |
| 4.2 globalization | PGL₂, Kl₂ at ∞ | ∞-inertia irreducible, Swan 1 | holds | R09, R10 |
| 4.3 pseudo-globalization | PGL₂ St EP function | tr Ind = 0 = tr St + tr 1 ⇒ tr 1 = −1 | holds | none |
| 4.4 discrete series | PGL₂ St support (T, δ^{1/2}) | constituents St, 1; cuspidal components generic ⇒ Π_z ≅ St | holds | none |
| 4.5 WD purity | PGL₂ St | eigenvalues q^{∓1/2} → weights ∓1, pure weight 0 | holds | none |
| 4.6–4.8 | St, supercuspidals of PGL₂; unramified ν=0 | geometric weights ±1; integer-weight Casselman test is ι-independent | holds | none |
| 5.1 test family | PGL₂ ν=(¼,−¼); B₂ ν=(½,0); PGL₃ | adjoint ±½, std ±¼; vector ½,−½,0,0,0, spin ±¼ twice; only ν=0 below ½; list = ch26 Prop 6.31 | holds | none |
| 5.1 local theorem | split G₂, α₁∨(s_c)=−1, ν=½ω₂, q=4 | coroot values −1,2,−2,2,−2,−4 ≠ 4^{±1}; without s_c the highest gives 4 | holds; justifies hypothesis | none |
| 5.2 adjoint lift | SL₂-lift obstruction, p odd vs p=2 | H²(μ₂)=Br[2] (p odd); cd₂ ≤ 1 ⇒ H²=0 ≠ Br[2] (p=2) | statement holds; L836 Check false at p=2 | R12 |
| 5.3 integrality | hyperspecial anchor q=4; Frob 3 on complete curve | weights 0,0; log₂3 ∉ ℤ | holds | R14 |
| 5.4 generic Ramanujan | complementary (√2,1/√2) at q=4 | weights ±½ excluded | holds | none |
| 5.5 genericity | PGL₂ tempered spherical | irreducible unitary principal series, generic | holds | R14 |
| 6.1 elliptic | GL₂ χ₁⊕χ₂; V₄ ⊂ PGL₂; torus | S_σ/G_m dim 1; centralizer V₄, 𝒮=(ℤ/2)²; S_σ=T̂^Γ=Z(Ĝ)^Γ | holds | R13 |
| 6.2 elliptic tempered | PGL₂ elliptic σ | standard weight 0 at all good places | holds | none |
| 6.3 Lafforgue–Zhu | GL_r single moving standard factor | centre weight 1 ⇒ W^{G_m}=0 | holds | none |
| 6.4 realisability | identity; Frob 3, ℓ=5 vs ℓ=3; zero sheaf | realisable; 2log₄3 ∉ ℤ, 3 not a 3-adic unit; empty stack | holds | R13 |
| 6.5 stack weights | Z a scheme | Deligne integrality | holds (conditional on gap) | none |
| 7.1 Arthur data | ψ=1⊠std; trivial SL₂, diag(q,q⁻¹) | diag(q^{1/2},q^{−1/2}), weights ±1; unbounded | holds | R13 |
| 7.2 prediction | diag(q^{1/4},q^{−1/4}); trivial rep | weight ½ fails (a); weights = eigenvalues of 2ρ̂ | holds | none |
| 7.3 compatible parameter | trivial PGL₂ | |·|^{±1/2}(Frob_w) = q_w^{∓1/2} | holds | R13 |
| 7.4 hypotheses | anisotropic G | G(K)\G(A)/U finite ⇒ (9.1) | holds | none |
| 7.5–7.6 | cuspidal case; (T−a), a transcendental | = §2.2; finite codimension gives no algebraicity | holds | none |
| 8.0 strata | ν=(½,−½), q_v=4, q_w=16; Sp₆ (2,2,2) | adjoint eigenvalues 4 vs 16, q-eigenspaces dim 1; (0,½,1) = h/2 + ½(1,0,−1) | holds | none |
| 8.1 weight pattern | trivial PGL₂, standard | n(±1)=1 | holds | R13 |
| 8.2 propagation | O∨=0; Sp₆ | real part 0; (½,½,½) or (0,½,1) | holds | R09 |
| 8.3 weight array | a(0,±1)=1; a(−2,−2)=3 | r(0)=2, c(±1)=1; both margins 3 at −2 | holds | R13 |
| 8.4 Property A (Lean) | Remark 10.8; a(2,1)=a(2,3)=1; a(1,0)=1; signed; zero | in Lean: r(1)=0,c(1)=1,r(0)=2; r(3)=0,c(3)=1,r(2)=2; r(1)=1,c(1)=0 and symmetry fails at (1,1); c(1)=−1<0; downward induction checked | holds | R03, R04 |
| 8.5 comparisons | Sp₆; F₄ B₃, A₁+Ã₁; E₇; E₈ D₆, A₆, A₄+A₂, A₂+2A₁ | central 3δ₁+3δ₋₁ vs δ₂+δ₁+2δ₀+δ₋₁+δ₋₂ (i₀=2); B₃ (5/2,1,½,0): 1,0,2 at 10,9,8 vs neutral 1,0,1, printed ω₂ gives top 16; top 4 vs neutral max 3; 1,1 at 10,9; 1,0,2 at 18,17,16; tops 13, 9, 5 each multiplicity 1 | holds | none |
| 8.6 elimination | direction; O∨=0 | Property A forces c(i₀)>r(i₀), §8.5 gives row excess: contradiction; recovers generic case | holds | R09 |

The exceptional profiles were computed from the ch26 (6.21), (6.24), (6.26) coordinates with the dual root systems as listed in the README (F₄: ±2e_i, ±e_i±e_j, (±1,±1,±1,±1); E₈ standard; E₇ as the E₈ roots orthogonal to e₇+e₈), after checking that the printed fundamental weights are dual to the printed simple coroots. The F₄ neutral profiles use the weighted diagrams 2200 (B₃) and 0100 (A₁+Ã₁).

### Duplication and ownership

- Pinned libraries: no Weil-number, Weil–Deligne, L-group, Kloosterman, Aubert or Jacobson–Morozov object in Mathlib or Tau Ceti (grep by object). The Mathlib contracts exist: `Finsupp` (`Mathlib/Data/Finsupp/Defs.lean:88`), `Finsupp.sum` (`Mathlib/Algebra/BigOperators/Finsupp/Basic.lean:48`, additive of `prod`), `Finset.sum_comm` (`Mathlib/Algebra/BigOperators/Group/Finset/Sigma.lean:121`, additive of `prod_comm`), `Finset.sum_eq_single` (`Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean:355`, additive of `prod_eq_single`); `Finsupp.mapDomain` (`Mathlib/Data/Finsupp/Basic.lean:267`) gives R04. Tau Ceti: `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean` and `TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean` exist and are correctly described as not supplying the roadmap's objects.
- Roadmaps (main, 338 open heads via `roadmaps grep`, board packages): §3.0 against LanglandsParameterStacks (R01) and HeckeStacksAndLocalShtukas; §4.0 against KloostermanSheavesAndBesselIsocrystals (R02, move recorded); §5.1 local theorem and §8.0 against SmoothRepresentationsOfLocalGroupsPartII SRU.5–SRU.7 (`packages/SmoothRepresentationsOfLocalGroupsPartII/design/README.md` lines 1287, 1874, 1983; merge order 294, after this roadmap), so these notions move down to this roadmap as README line 11 already records; §8.5 against LieHighestWeightPartII (293), likewise recorded. ExcursionOperatorsAndSpectralActionPartII (board design, 287) treats p-adic fields only and does not overlap §3.0. No `Suggested.lean` elsewhere declares `WeightArray`, `propertyA` or this namespace.

### Supplier order

Output of the dependency check:

    moved: GlobalShtukasAndFunctionFieldLanglandsPartII moved in the merge order from #27 to #243, right after its last supplier HeckeStacksAndLocalShtukas (ArithmeticGaloisRepresentations, LanglandsParameterStacks, MotivesAndAlgebraicCycles, DiamondEtaleCohomology, DiamondSixOperations, DeligneWeightsAndPurity, FunctionFieldArithmetic, GlobalShtukasAndFunctionFieldLanglands also came after it); checked as moved (the worker moves it there when it submits)
    depcheck: 34 roadmaps, 314 edges, 0 problem(s)

No UPWARD or CYCLE line. The consumers named (SmoothRepresentationsOfLocalGroupsPartII 294, LieHighestWeightPartII 293) remain after 243.

Citations resolved at the head where each lives: parent `packages/GlobalShtukasAndFunctionFieldLanglands/README.md` (its board head, fetched): GS.1.4, GS.1.9–GS.1.14, GS.2.1–GS.2.5, GS.2.9–GS.2.10, GS.3.6, GS.3.10, GS.3.12, GS.4.8, GS.4.12, GS.5.3–GS.5.10, GS.6.1–GS.6.2, GS.7.6–GS.7.9 all exist (GS.1.4, GS.6.1, GS.6.2 read: GS.6.2 gives the weight-0 algebraicity §1.1 uses). The resolver's lead "GS.6.2 found nowhere" is a false lead: the parent is a board package, not a content pull request. SmoothRepresentationsOfLocalGroups SR.0.2, SR.1.3–SR.1.5, SR.2.2, SR.3.1–SR.3.4, SR.4.1–SR.4.2, SR.5.2 (SR.5.2 owns the raw Weil–Deligne fields, its line 88); ReductiveGroupsPartII RG2.3, RG2.4, RG2.5.1, RG2.5.2; FunctionFieldArithmetic §§6.1–6.6 (§5.10 missing, R06); ArithmeticGaloisRepresentations §2.6; DeligneWeightsAndPurity §§0.1, 0.2, 0.3, 0.6, 0.7, 0.13, 0.17, 0.19, 5.2, 5.3, 5.5, 5.11, 5.12, 7.8, 7.9, 8.5, 8.17, 8.18; LanglandsParameterStacks LP0.1–LP0.4, LP1.11–LP1.12, LP2e.5, LP2c.1–LP2c.4; MotivesAndAlgebraicCycles §6.3 (Deligne–Milne 2.20–2.21: tensor generation and closed-immersion criterion); NilpotentOrbits (main) N0–N2, with "N2.1, N2.2, N2.4" resolving to items 1, 2, 4 of N2; HeckeStacksAndLocalShtukas HS0.1–HS0.4, HS1, HS2.9, HS3.1–HS3.4; DiamondEtaleCohomology Layer C0; DiamondSixOperations S1.2, S1.5, S2.1–S2.4; RepresentationTheory/LieHighestWeight (main) Layers 0 and 6; SchemeAndStackFoundations (main) Layers 1–2; EtaleCohomologyFoundations (main) §§F.0–F.4.

### Gap audit

All nine slugs appear in `design/plan.json` and in the README contracts with identical needs sentences (checked programmatically). Suppliers FunctionFieldArithmetic (171), SmoothRepresentationsOfLocalGroups (27), DeligneWeightsAndPurity (95) and NilpotentOrbits (main) precede the moved position. Minimality checked at the supplier heads: SR has no pseudo-coefficients, elliptic orthogonality, number-field descent, z-extensions or tempered-spherical genericity; DWP §8.5 is for schemes only (stacks absent), and GS.1.4 builds stack operations and the trace formula but not weight preservation; NilpotentOrbits N2 item 4 has orbit classes but no named exceptional profiles. function-field-globalization, elliptic-pseudo-coefficients and spherical-adjoint-transfer each bundle two or three precise statements for one supplier section (the inputs of ghs Lemma A.1 and of ch26 Corollary 5.7); each part is precise and they are used together, so I do not count them as compound. No dependency is written as supplied while missing, except R06, where the supplier has the content at §5.8.

### Shape and Lean

`lake env lean packages/GlobalShtukasAndFunctionFieldLanglandsPartII/Suggested.lean` from the content checkout: the only message is "declaration uses `sorry`" at line 53. A scratch copy with `#check @WeightArray`, `@rowSum`, `@colSum`, `@propertyA`, elaborated once, gives `WeightArray : Type`, `rowSum : WeightArray → ℤ → ℕ`, `colSum : WeightArray → ℤ → ℕ` and the `propertyA` type equal to README §8.4 (finite support, row symmetry, diagonal-or-column-excess); no section variables exist, so no binder was lost. README backticked own names are exactly these four. README shape follows main (Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–8 each ending in Examples and Dependencies, Downstream consumers, Worked examples, References); every definition keeps at least three distinct Checks after R13.

### Headlines and padding

README headlines: §§0.2, 0.4, 1.1–1.4, 2.2, 3.2, 3.3, 3.5–3.8, 4.2–4.8, 5.1 (local theorem), 5.3–5.5, 6.2, 6.3, 6.5, 7.5, 7.6, 8.0 (classification), 8.1, 8.2, 8.4, 8.5, 8.6. None is statable at the pins (no Weil group of a local field, L-groups, lisse ℓ-adic sheaves on curves, automorphic modules over function fields or shtuka stacks), except the combinatorial §8.4. One-tactic probe on `propertyA` in scratch: `simp`, `omega` and `aesop` each fail, so it is not one-tactic padding; R03 is the free-variable rule.

## Not verifiable

- The neutral-element side of the E₇ and E₈ comparisons in §8.5 (multiplicities 1,0 at 10,9 for D₅(a₁)+A₁; neutral maxima 12, 8, 4 and value 1 at 16 for the E₈ orbits): this needs the Bala–Carter weighted diagrams of the named orbits, which is the content of gap:exceptional-named-orbit-profiles. I computed the extraneous side and the F₄ neutral sides; the E₇ and E₈ neutral values agree with ch26 lines 1668–1675 but are not independently recomputed.
- The "n even" qualifier in the PSO(2n) Check (README line 783) was not checked against ch26 Theorem 6.14 (outside the sample).
- The Annals version of ch26 was not collated; the README cites arXiv v1 throughout and says so (line 1358).
- lz, fs, xz and most of hny and xue were not opened beyond the passages above (outside the sample); every manifest text was readable.
- Ownership against open pull requests was checked through the roadmap index tool for the 338 open heads; nothing was unreadable.

## Source issues

- **Misprint** in ch26 at Definition 2.6(iii), p. 7: the source says N^i maps the weight w−i graded piece onto the weight w+i piece; it should run from weight w+i to w−i, as condition (ii) and the downward monodromy convention require; affects nothing.
- **Error** in ch26 at Proposition 3.10(2), p. 10: the source says a character of any torus is geometric iff its values are Weil q-numbers; it should be split tori only, with q_E for Res_{E/F}G_m (unramified quadratic, χ(ϖ_E)=q_F^{1/2} gives weight 1/2); affects a stated result.
- **Gap** in ch26 at §4.1, sketch of Theorems 4.2–4.3, step (1), p. 11: the source says Beuzart-Plessis's appendix makes every discrete series a local component; it should say it gives a cuspidal Π with the same cuspidal support, isomorphic only at a supercuspidal place; affects the proof.
- **Error** in ch26 at Corollary 6.32(1), p. 25, used in the proof of Theorem 5.4, p. 14: the source says generic unitary L(s_c s_ν) half-integral for the test family has ν = 0; it should assume s_c central (split G₂, α₁∨(s_c)=−1, ν=½ω₂, q=4 is a counterexample); affects the proof.
- **Misprint** in ch26 at Theorem 8.5(3), p. 29: the source says the F₄ B₃ extraneous point has an extra ω₂ term; it should be ω₁+½ω₃+½ω₄, whose top adjoint weight 10 is the one used in the proof of Theorem 10.3, case (3a); affects a stated result.
- **Misprint** in ch26 at the proof of Theorem 10.3, cases (3a), (4) and (5a), p. 34: the source says n_v on both sides of three comparisons; it should be n_u on one side; affects nothing.
- **Misprint** in ghs at Definition 3.3(a)(iii), p. 8: the source says N itself is an isomorphism from gr_{w+i} to gr_{w−i} for all i ≥ 0; it should be N^i; affects nothing.
- **Error** in ghs at Definitions 2.5, p. 7, and 3.3(b), p. 8: the source says common-weight purity for one faithful representation is equivalent to purity for all, for reductive G; it should be semisimple G (G_m, Frobenius q: identity weight 2, identity plus trivial weights 2, 0); affects a stated result (Lemma 3.5(a) read with Definition 3.3(b)).
- **Error** in ghs at Remark 3.10, p. 11: the source says the Kloosterman parameter composed with the adjoint representation is irreducible; it should say only that adjoint inertia invariants vanish (PGL₂, odd p: the toral line is stable, by hny Corollary 2.13); affects nothing.
- **Misprint** in st at the proof of Lemma 11.4, p. 83: the source says "a torus" containing the semisimple Frobenius and calls the stabilizer parabolic unless it contains every root; it should be a maximal torus and a proper parabolic; affects nothing.


## Maintainer override

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c98ff93", "job": "REV-PKG-GlobalShtukasAndFunctionFieldLanglandsPartII", "model": "opus", "worker": "fable-rev60"} -->
