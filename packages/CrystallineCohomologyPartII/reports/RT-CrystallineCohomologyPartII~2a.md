<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13111#issuecomment-6849509624 -->
Red team round 2 pass a (claude) of e5e4857

Verdict: needs_changes

1. **F01** (P2) §1.5: the cancellation law needs universal descent of the blowup; the route proves descent of the blowup only

   - **Location:** `packages/CrystallineCohomologyPartII/README.md:468` (§1.5, step 3): "By the composition and cancellation laws (ArcTopologyAndDescent §1.1) it suffices to treat the blowup Bl_J Y → Y"; and `:437` (§1.4, statement).
   - **Claim:** descent for the Čech nerve of Bl_J Y → Y (steps 3–4, through §1.3 and §1.4) yields descent for X → Y by cancellation, and the induction on dim Y closes.
   - **Witness:** ArcTopologyAndDescent §1.1 (the laws listed after its definition of universal F-descent; this README `:62`) states the law for *universal* descent: "If g∘f is of universal descent then g is". Universal means after every base change T → Y. For Y = A², T = Bl_0 A², the base change Bl_0 A² ×_Y T is the diagonal copy of T glued to P¹ × P¹: not a blowup of T, and dim T is not below dim Y. §1.3 and §1.4 as stated do not apply to it. BS17 line 353 ("By the same argument, it is of universal F-descent") inducts on the inductive level, which is stable under base change; dimension is not.
   - **Repair** (three edits; the instance above becomes a Check):
     1. §1.4, statement. Replace the sentence "Then RΓ(Y, W(O)[1/F]) → … is a fibre sequence for every n ≥ 1. For n = 1 the sequence is already a fibre sequence before inverting F." by: "Then for every qcqs Y-scheme T and every n ≥ 1, RΓ(T, W(O)[1/F]) → RΓ(`X^{n/Y}` ×_Y T, W(O)[1/F]) ⊕ RΓ(Z ×_Y T, W(O)[1/F]) → RΓ(`E^{n/Y}` ×_Y T, W(O)[1/F]) is a fibre sequence; here `E^{n/Y}` ×_Y T is the n-fold fibre product of E ×_Y T over Z ×_Y T. For T = Y and n = 1 it is a fibre sequence before inverting F; for other T inverting F is needed already for n = 1." Add route step 5: "Base change to T: tensor the structure-sheaf sequence over A with RΓ(T, O); by step 2 the result is the structure-sheaf sequence of T ← X ×^L_Y T, Z ×^L_Y T ← E ×^L_Y T. The n = 1 argument applies to these derived schemes, and §1.2 removes the derived structure after inverting F. Steps 3 and 4, with T as one more tensor factor, give every n."
     2. §1.5, step 2. Replace "and argue by induction on dim Y. Since F inverts nilimmersions, Y may be taken reduced; for dim Y = 0 …" by: "Prove by induction on d that every proper surjective finitely presented X → Y in Sch^fp_S with dim Y ≤ d is of universal F-descent. Universal F-descent can be checked after base change along a nilimmersion and Zariski-locally on Y (ArcTopologyAndDescent §1.1), so Y may be taken reduced and affine. For d = 0 it is then a finite disjoint union of spectra of fields, X → Y is a proper fppf cover, and fppf covers are of universal F-descent (§1.1)."
     3. §1.5, steps 3–4. Replace from "By the composition and cancellation laws" to the end of step 4 by: "By the composition and cancellation laws (ArcTopologyAndDescent §1.1) it suffices that the blowup b: Bl_J Y → Y is of universal F-descent: for every T → Y in Sch^fp_S, which may be taken affine, the base change b_T is of F-descent. The base change b_T is in general not a blowup of T (Check below), so §1.3 is applied to Y only. Rename the blowup X → Y, with exceptional divisor E over Z = V(J). After thickening, H^i(X, O_X(−E)) = 0 for i > 0; let Y′ be the pushout of §1.3 and T′ = T ×_Y Y′. Then T′ → T is a finite universal homeomorphism, X ×_Y′ T′ = X ×_Y T, and the Čech nerves of b_T over T and over T′ differ by nilimmersions, so F does not distinguish them. By induction E → Z, with dim Z \< d, is of universal F-descent, so F(Z ×_Y′ T′) is the totalization of F on the Čech nerve of E ×_Y′ T′ → Z ×_Y′ T′. By §1.4 over Y′, with the structure-sheaf fibre sequence of §1.3 (iv) and the Y′-scheme T′, F(T′) → F(`X^{n/Y′}` ×_Y′ T′) ⊕ F(Z ×_Y′ T′) → F(`E^{n/Y′}` ×_Y′ T′) is a fibre sequence for every n; the limit over n, as in the proof of BS17 Theorem 2.9, gives descent for b_T."
     4. New Check in §1.5: "For Y = A², X = Bl_0 A² and T = X, the base change X ×_Y T is the union of the diagonal copy of X and E × E = P¹ × P¹, meeting along the diagonal P¹; it is not a blowup of T. With K-coefficients, §0.6 gives RΓ(X ×_Y T) = fib(RΓ(X) ⊕ K → K) = RΓ(X), and the sequence of §1.4 over T reads RΓ(X) → RΓ(X) ⊕ K → K with K → K an isomorphism: a fibre sequence."
   - **Tested on the refuting instance:** T = Bl_0 A² → A². Z ×_Y T = E has H^\*(WO_K) = K, `E^{1/Y}` ×_Y T = P¹ × P¹ has K (Künneth, H^i(P¹, WO_K) = 0 for i > 0), X ×_Y T has RΓ(X) by Mayer–Vietoris; fib(RΓ(X) ⊕ K → K) = RΓ(X) = F(T) rationally. The repaired step uses only §1.3 over Y, the strengthened §1.4 and the inductive hypothesis for Z.

2. **F02** (P3) §3.6: the truncation level N ≥ 2d does not reach degree 2d

   - **Location:** `README.md:834–835` (§3.6, steps 3–4): "take N ≥ 2d … an isomorphism on E_1 for i ≤ N" and "The augmentations are isomorphisms in degrees ≤ N: … on the Witt side by §2.6".
   - **Claim:** the comparison on the simplicial objects and the Witt augmentation hold in every degree ≤ N, so N = 2d covers all degrees ≤ 2d.
   - **Witness:** §2.6 (`README.md:648`) gives "isomorphisms for q \< N" only; its own Check (`:663`) has H¹ = K³ ≠ K at N = 1. An isomorphism on the columns i ≤ N of E_1 gives the abutment in degrees q \< N: a differential leaving total degree N lands in column N + 1. BBE07 lines 1392–1394 print "q ≤ N".
   - **Repair:** in step 3 write "take N ≥ 2d + 1" and "which is an isomorphism on E_1 for i ≤ N, hence on the abutments in degrees q \< N (a differential leaving total degree q lands in a column of index at most q + 1 ≤ N)". In step 4 write "The augmentations are isomorphisms in degrees \< N" and "both sides vanish above 2d \< N". In the same step 3, replace "is a dense open of the union of the d-dimensional components of the smooth projective X_i" by "is a dense open of the union of the connected components of the smooth projective X_i that meet U_i, a smooth projective scheme of dimension d" (a d-dimensional component of X_i may lie over X̄ ∖ U: for X_0 = Bl_x of a surface, X_0 ×_X X_0 contains E × E = P¹ × P¹ of dimension 2 = d).
   - **Tested:** d = 1, N = 3: degrees 0, 1, 2 \< 3 are covered and both sides vanish above 2. With N = 2 degree 2 was not covered.

3. **F03** (P3) §5.2 and §6.4 (iii): quotients by a finite group have an owner on main that is not cited

   - **Location:** `README.md:1141` (§5.2): "a quasi-resolution of the form X″/G → Y′ → Y", its *Needs:* `:1145`; `README.md:1502–1504` (§6.4 (iii)): "X proper with orbits in affine opens (so X/G exists)", its *Needs:* `:1506`.
   - **Claim:** the quotient X″/G, the finite map q: X → X/G and O_{X/G} = (q_\*O_X)^G are available; no input is named.
   - **Witness:** SchemeAndStackFoundations §1.17 (on main, its README line 3450) owns `finiteGroupQuotient_projective`: for Y → S projective over a Noetherian S with a finite group Γ acting by S-automorphisms, Y/Γ exists with q finite, surjective, and the invariant structure sheaf. The pin has the affine case, `TauCeti.AffineInvariantQuotient.quotient` (`TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/Affine.lean`).
   - **Repair:** add "§1.17, `finiteGroupQuotient_projective`" to "From TauCetiRoadmap.SchemeAndStackFoundations" and to the *Needs:* lines of §5.2 and §6.4. In §5.2 step 1 add: "The quotient X″/G is that of SchemeAndStackFoundations §1.17, `finiteGroupQuotient_projective`, applied to the projective morphism X″ → Y′ over the Noetherian Y′, on which G acts by Y′-automorphisms." In §6.4 step 3 add: "For X projective over F_q the quotient X/G, the finiteness of f and O_Y = (f_\*O_X)^G are SchemeAndStackFoundations §1.17, `finiteGroupQuotient_projective`; for X proper with every orbit in an affine open, X is covered by G-stable affine opens and the affine quotients (Tau Ceti `TauCeti.AffineInvariantQuotient.quotient`) glue in the same way; this gluing is an API bullet of §6.4 (BBE07, 6.11 and Lemma 6.10, p. 39)."
   - **Tested:** the Igusa Check of §6.4 has X = E_1 × E_2 projective, so §1.17 applies; §5.2's cusp Check has G = 1, where the quotient is the identity.

4. **F04** (P3) *Needs:* lines that omit an input their route uses

   - **Location and witness:**
     - `README.md:1324` (§5.9 *Needs:* "§5.5; §5.6; §5.3; §0.7; §4.1") against step 1 (`:1328`), which uses "SchemeAndStackFoundations §2.21, sheafified grothendieck duality"; the Layer 5 Dependencies (`:1420`) omit it too.
     - `README.md:301` (§0.7 *Needs:*) and `:602` (§2.4 *Needs:*) against §0.7 step 3 (`:307`): "apply SchemeAndStackFoundations §2.6 proper_fibreDimension_vanishing" and "Grothendieck vanishing gives H^i(X, W_nI) = 0 above dim X". The first target exists (SchemeAndStackFoundations README line 4400) but is not in the supplier contract list (`:106`); Grothendieck vanishing is its §2.5 (line 4271), cited nowhere. §6.8's last Check (`:1613`) uses it again.
   - **Repair:** §5.9 *Needs:* and Layer 5 Dependencies: add "SchemeAndStackFoundations §2.21, sheafified grothendieck duality". §0.7 *Needs:*, Layer 0 Dependencies and the supplier list: add "SchemeAndStackFoundations §2.6, `proper_fibreDimension_vanishing`; SchemeAndStackFoundations §2.5, Grothendieck vanishing". In §0.7 step 3 write "Grothendieck vanishing (SchemeAndStackFoundations §2.5)".
   - **Tested:** the dependency check still shows no UPWARD or CYCLE edge, SchemeAndStackFoundations being on main.

One P2 finding (S01) and three P3 findings (S02–S04). No statement of `Suggested.lean` was found false; no P1. All seventeen round-1 findings are repaired at this head; no repair introduced a false statement, but the repair of 1b/F01 left the gap that S01 reports (the repair report lists it under "Not addressed in this round", without marking it not actionable, so S01 is a new finding and not a re-raise).

## Round 1: verification of the repairs

| Round-1 finding | State at e5e4857 | Witness (repaired passage) |
|---|---|---|
| 1a/F01 (P2) Ax's criterion absent from the acceptance test | repaired (applied differently; I agree: a statement on free power series is not a headline) | `Suggested.lean:48–53`: "Ax's criterion in its point-count form (§6.3) … The pins have the zeta function of a Weierstrass curve only … it stays a README target." |
| 1a/F02 (P3) CT03 locator | repaired | `README.md:797`: "CT03, Corollary 11.2.6, p. 197, which rests on the coskeleton identity of CT03, Proposition 11.2.5, pp. 196–197"; References `:1813` agree. |
| 1a/F03 = 1b/F05 (P3) Ser58Top locator | repaired | `README.md:1588`: "Ser58Top, n° 3 (Opérations de Bockstein) of §1, pp. 27–29"; Ser58Top line 1127 (n° 3) and line 1146 (printed p. 28). |
| 1a/F04 (P2) supported class versus Chern class | repaired | `README.md:963`: "write ĉl(Z)\|_X for its image … under the map forgetting supports. For an integral divisor D ⊂ X, ĉl(D)\|_X = c_1(O(D))"; sign (−1)^c checked at CR12 line 1940. |
| 1a/F05 (P3) split node | repaired | `README.md:639`: "For a split nodal cubic X … P¹ ⊔ two k-points. For a nonsplit rational node … the off-diagonal part … is Spec k′"; recomputed y² = x²(x − 1) over F_3: 1 + 1 + 2 + 1 = 5 = q + 2. |
| 1a/F06 (P3) Ax64 secondary locator | repaired | `README.md:1817`: "pp. 255–261; BBE07 Proposition 6.3, p. 35"; same in `sources.toml` (Ax64 `locator`). |
| 1a/F07 (P2) not-statable inventory | repaired | `Suggested.lean:56–63`: bullets for Ekedahl duality and correspondences (§§4.1, 4.5) and Serre's Bockstein vanishing (§6.8). |
| 1b/F01 (P2) reduction to a blowup | partly repaired | `README.md:468`: "choose a dense open U ⊂ Y over which X → Y is flat and a U-admissible blowup Y_1 = Bl_J Y → Y … gap:reduced-flattening-by-blowup". The gap is declared in `design/plan.json` and the README with the same sentence. The cancellation step that follows is S01. |
| 1b/F02 (P2) §6.8 route | repaired | `README.md:1602–1605`: four-step route (criterion, primitive lifts, cup products, degree g − 1); recomputed below. `exteriorCohomology` exists in AbelianSchemesAndArithmeticModuli §A4.4 with R^iπ_\*O_A ≅ ∧^i R¹π_\*O_A. |
| 1b/F03 (P3) degree formula | repaired | `README.md:927`: "For a finite surjective morphism f: X → Y of connected smooth k-schemes (equivalently, f finite and dim X = dim Y, so r = 0), f_\* ∘ f^\* = deg(f)". |
| 1b/F04 (P3) flat base change citation | repaired | `README.md:1513`: "Tau Ceti `TauCeti.AlgebraicGeometry.bijective_cohomologyBaseChange`"; at the pin `TauCeti/AlgebraicGeometry/Cohomology/FlatBaseChange.lean:185`, hypotheses `[Module.Flat R R'] [CompactSpace X] [IsAffineHom (pullback.diagonal …)]`. |
| 1b/F06 (P3) converse of §0.5 (ii) | repaired | `README.md:264`: "some `p^N[b] = V^N[b^{p^N}]` lies in the image of W(A) … so `b^{p^N}` ∈ A … hence a universal homeomorphism"; recomputed: coordinate N of `V^N[b^{p^N}]` is `b^{p^N}`. |
| 1b/F07 (P3) rationally chain connected headline | repaired | `Suggested.lean:67–71`. |
| 1b/F08 (P3) process words in HW23 entry | repaired | `README.md:1804`: "§2; Corollary 4.6 and proof (arXiv v2; Corollary 4.7 in the published version). Corollary 1.3 and pp. 19–20 are locators of the published version." |
| 1b/F09 (P3) duplicate Checks | repaired | §0.3 has four distinct Checks (`README.md:222–225`); `:1641` cites BBE07, Remarks 6.6 (ii). |
| 1b/F10 (P3) supplier subsection | repaired | `README.md:92–94`: "From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarietiesPartII — §1.1, ferrand geometric pushouts". |

## Dependency check

```
depcheck: 206 roadmaps, 1906 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line for this roadmap.

## Adversarial table (computed values)

`Suggested.lean`: 8 declarations, all in `namespace TauCetiRoadmap.CrystallineCohomologyPartII`, Layer 6, no section `variable`; every binder is in the declaration's own signature. The elaborated types of the job's signatures file were compared with the README statements; no binder is lost (the file's ninth entry, "under", is a word of the module docstring misread as a declaration).

| Declaration (README section) | Context | Instances tried | Values | Result |
|---|---|---|---|---|
| `card_rationalPoints_modEq_of_cohomologyPullback_bijective` (§6.4 (ii)) | K : Type u finite field; πX, πY proper; f ≫ πY = πX; bijectivity for all i : ℕ | X = ∅; identity; blowup of a surface at a rational point; fold P¹ ⊔ P¹ → P¹; E → Spec F_p ordinary | i = 0 forces H⁰(Y, O) = 0, Y = ∅, 0 ≡ 0; equal; difference q; H⁰: K → K² not onto, difference q + 1; H¹ ≠ 0, p + 1 − a ≢ 1 | true as typed; equals §6.4 (ii) and BBE07 Corollary 1.6 (line 195) |
| `card_projectiveZeroLocus_modEq_one` (§6.6) | F : Fin r → MvPolynomial (Fin (n+1)) K; d_j ≥ 1; ∑ d_j ≤ n | r = 0; n = 0 (forces r = 0); F_j = 0 with d_j = 1; xy, x², x² − ay² in ℙ²; F = 1 with d = 0 | (q^{n+1} − 1)/(q − 1) ≡ 1; 1; all of ℙⁿ; 2q + 1, q + 1, 1; 0, excluded by `hd` | true |
| `card_dvd_card_solutions_of_sum_lt` (§6.6) | `[Finite σ]`, s : Finset ι, ∑ totalDegree \< Nat.card σ | s = ∅ (σ ≠ ∅ forced); f = 0; f = 1; ternary quadric over F_9 | q^m, m ≥ 1; q^m; 0; 1 + (q − 1)(q + 1) = 81 | true; pin has p only (`Mathlib/FieldTheory/ChevalleyWarning.lean:110`) |
| `IsThetaDivisor` (§6.9) | A : AbelianVariety K, I : IdealSheafData | E, I = O(−P); I = O(−2P); A = Spec K, I = unit ideal; I = 0 | h⁰(O(P)) = 1 ✓; h⁰ = 2 ✗; O ample, h⁰ = 1 ✓ (Θ = ∅); 0 is a zero divisor ✗ | determines principal polarizations; wrong model I in place of its dual: h⁰ = 0 |
| `card_thetaDivisor_modEq` (§6.9) | K finite | g = 1; g = 0; 2P and P + Q on E | 1 ≡ 1; 0 ≡ 0; counts 1, 2 but h⁰ = 2, excluded | true |
| `zeroCycleDegree` (§6.10) | π : X → Spec L, z : AlgebraicCycle X ℤ | [x] rational; [y] of degree 2; [y] − 2[x]; z = 0 | 1; 2; 0 (unweighted sum would give −1); 0 | real body; finite sum on quasi-compact X |
| `UniversallyCH0Trivial` (§6.10) | L : Type u; `Chow.cyclesOfDimension _ 0` = cycles on points of specialization height 0 for x ≤ y ↔ y ⤳ x, i.e. closed points (pin, `Chow/Basic.lean:67–71`) | Spec K; ∅; Spec F_{q²}/F_q; genus ≥ 1 curve | ✓; first clause fails; over F̄_q the difference of two points has degree 0, not torsion; fails over an algebraic closure of k(C) | equals Conventions item 9 |
| `card_rationalPoints_modEq_one_of_universallyCH0Trivial` (§6.14 (i)) | projective over K, smooth, geometrically connected | ℙⁿ; y² = x³ + x + 1 over F_5; y² = x³ − x over F_3; Spec F_{q²}; ∅ | ≡ 1; 2 + 0 + 2 + 2 + 2 + 1 = 9 ≡ 4, hypothesis fails; 4 ≡ 1, no converse claimed; excluded; excluded | true |

Padding probe: none of the five theorems follows from one tactic or one pinned lemma; each of the three definitions is used by a stated theorem and has a real body. No finding.

README targets (59 numbered sections and the Conventions, read in full):

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Conventions Checks | W_2(F_2); F = (σ, 2σ) over F_4; x² − ay² on ℙ¹ | FV(1) = 2 ≠ [1]; φ = (1, 4), v_4 = 0, 1; affine 1 = 1 + (q − 1)·0 | consistent |
| §0.1 | W_1I = I; I = (t), n = 2; Spec F_p tower | V(t) = (0, t) ∈ W_2(I), [t]·(a_0, a_1) = (ta_0, t^p a_1); lim ℤ/p^n = ℤ_p, lim¹ = 0 | true |
| §0.2 | ⊕ ℤ/p^n on a point; ℤ/3 at p = 2; End on Spec F_p | ⊗ℚ = 0, q ≠ 0; in T(X); Hom_Ab(ℤ_p, ℤ_p) = ℤ_p, so ℚ_p | true |
| §0.3 | A perfect; F_p[ε]/(ε²); ∅ | F bijective; colimit ℤ_p; 0 | true |
| §0.4 | k[ε]/(ε²); F_p[t_i]/(t_i^{p^i}) | W(N) killed by F, p = VF; (t_1, t_2, …) not killed by any F^c | (iii) needs nilpotent nilradical, stated |
| §0.5 | F_{q²}/F_q; k[t] ⊂ k[t, s]/(s² − t), p odd; F_p[t] ⊂ F_p[t^{1/p}]; gap statement by Noetherian approximation | dims 1, 2; s^{p^N} = t^{(p^N − 1)/2}s ∉ A; b^p ∈ A; g = (g_0 ∘ pr, F^N) satisfies both identities | true; p^e W(B) ⊂ V^e W(A) recomputed |
| §0.6 | two lines; W(I_1 + I_2) = W(I_1) + W(I_2) | fibre product over K; a = ∑ V^i[b_i] + ∑ V^i[c_i] by induction on coordinates | true |
| §0.7 | A² ∖ 0 → A²; transition maps in degree m | [x⁻¹y⁻¹] ≠ 0 in R¹j_\*O, lifts since R²j_\*O = 0; onto since R^{m+1}f_\*I = 0 | properness needed in (3), stated; S04 |
| §0.8 | P¹; ordinary and supersingular E; torsion bound | 0; dim 1 slope 0, dim 2 slope 1/2; R = W_σ[[V]] Noetherian, p central | true |
| §1.1 | F_{p²}/F_p | equalizer of (a, a), (a, σa) is ℤ_p | true |
| §1.2 | k ⊗^L_{k[t]} k | π_1 = k, π_1W = ∏k killed by F and p | true |
| §1.3 | J = (f) nonzerodivisor; J nilpotent; A², J = (x, y) | B′ = A; X = ∅, B′ = A/J, Y′ = Z → Y a universal homeomorphism; H¹(Bl, O(−E)) = ⊕ H¹(P¹, O(m + 1)) = 0, B′ = k[x, y] | true; K ⊂ √(JB′) recomputed |
| §1.4 | closed cover; base change to T = Bl_0 A² | Mayer–Vietoris; fib(RΓ(X) ⊕ K → K) = RΓ(X) | true as stated; too weak for §1.5: S01 |
| §1.5 | dim 0; V(xy); T = Bl_0 A² → A² | fields, fppf; Bl_pt = two lines, Z = point; base change not a blowup | S01 |
| §1.6 | two lines | Mayer–Vietoris after ⊗ℚ | depends on §1.5 |
| §2.1 | Bl_0 A²; cone over canonical curve | R¹f_\*(I′^r) = 0; R¹f_\*(I′) ⊃ H¹(C, ω) = k but Witt-rationally 0 | true |
| §2.2 | rational tree; elliptic cone | H¹(E, WO_ℚ) = 0; dim 1 or 2 | true |
| §2.3 | A¹; G_m; proper U; ∅ | K → K iso, H¹(P¹) = 0, so 0; coker(K → K²) = K in degree 1; RΓ; 0 | true |
| §2.4 | A² | P² ∖ line: K → K iso, so H^\*_c = 0, while H⁴_rig,c = K(−2) | true |
| §2.5 | split and nonsplit node over F_q | P¹ ×_X P¹ has q + 3 and q + 1 rational points | true |
| §2.6 | split node, N = 1, 2 | H¹ = K³ at N = 1; a = 0, b + c = 0 leaves K at N = 2 | true; range q \< N strict |
| §3.1 | F = p^aσ; 1 − a_1t + pt²; rank 0 | \<1 iff a ≤ 0; unit root or both slopes 1/2 (points (0,0), (1, ≥1), (2,1)); 1 | true |
| §3.2 | Spec F_p ⊂ Spf ℤ_p; ℤ_p[t], φ(t) = t^p | P(J_n) = ℤ/p^n → W_n(F_p) identity; ghost t^{p^i}, s_φ(t) = [t] | true |
| §3.3 | point; P¹; ordinary E | id_K; K(−1) → 0; 2-dim onto the slope-0 line | true |
| §3.4 | constant simplicial frame | matching maps identities | locator verified in round 1 |
| §3.5 | abelian variety, p-rank f | f + (2g − 2f) = 2g − f | true |
| §3.6 | d = 1, N = 2 against N = 3 | degree 2 not covered at N = 2 | S02 |
| §3.7 | A¹ ⊂ P¹; G_m | 0 in all degrees; K in degree 1 = n only | true |
| §4.1 | point; P¹, n = 1 | W_n(k); K_{X,1} = Ω¹[1], shift [−1] restores degrees 0, 1 | true |
| §4.2 | point → P¹; F on A¹; id | ĉl(x)\|_P¹ in bidegree (1, 1), trace 1; p; 1 | true with "surjective" |
| §4.3 | A¹, D = 0, n = 1; P¹ | −dt/t ≠ 0 in k[t, t⁻¹]dt/k[t]dt, image c_1(O) = 0; c_1(O(1)), trace 1 | true; sign from CR12 (2.4.1), line 1940 |
| §4.4 | finite flat h of degree d; A¹ → Spec k | h_\*h^\* = d; graph not proper over the target, transpose is | true |
| §4.5 | [P¹ × x], [x × P¹] | (0 on H⁰, α ↦ (∫α)ĉl(x)) and (id on H⁰, 0 on H¹); sum = identity | true |
| §4.6 | point inclusion; two-point diag(1, 0) | degree 1, image in (1,1), projection to WO-part 0; N·diag(1, 0) ≠ 0 at codimension 0 | (i)–(iii) consistent |
| §5.1 | A²/±1, p odd; Spec k ⊔ A¹; exponent of a purely inseparable extension of degree p^n | degree 2; dims 0, 1; b^{p^n} ∈ k(A) ∩ B = A | true |
| §5.2 | Frobenius; elliptic double cover; split node | degree p^d purely inseparable ✓; separable ✗; two points over the node, not radicial | true; S03 |
| §5.3 | Spec k ⊔ A¹ | (1, p) componentwise | true |
| §5.4 | quadric cone; Frobenius | H¹(P¹, WO_ℚ) = 0; p^d invertible up to isogeny | true |
| §5.5 | elliptic cone; resolution of an isolated point | dim 1 or 2 ≠ 0; isogeny = tensor for proper E | true |
| §5.6 | u ∘ f | R^i(u ∘ f)_\* = u_\*R^if_\* | true |
| §5.7 | S smooth; elliptic cone | WO_{S,ℚ}; H¹ ≠ 0 | true |
| §5.8 | blowup along C ≠ X; C = X | unchanged; H⁰ drops to 0, excluded | true |
| §5.9 | split node normalization; BE-Witt-rationality | f_\*O ≠ O, H¹: K against 0; "every alteration" agrees with CR12 Proposition 4.4.3 (lines 3917–3919) | true; S04 |
| §5.10 | conic cone; genus g ≥ 1; x² − ay² | 0; 2g − f ≥ g; dims 1 and 2 at the vertex | true; the embedded cone is covered by §0.5 (ii) and §2.2, not by CR12 Theorem 4.7.4 alone |
| §5.11 | P^d; elliptic curve | N = 1; hypothesis fails | true |
| §5.12 | P¹ → Spec k; P^n_Y; identity | H¹(Wω) = W_ℚ ≅ H⁰, shift r = 1; only R^n; r = 0 | (ii) consistent with §4.2 |
| §6.1, §6.2 | point; P¹; A¹; ∅; E | 1/(1 − t); 1/(1 − t); 1; 1; unit-root factor or all | true |
| §6.3 | 1/(1 − qt); 1/(1 − t); 1 | N_r = q^r, all four; N_r = 1, none; N_r = 0, all | true; N_r = ∑β^r − ∑α^r |
| §6.4 | Igusa; isogeny of degree p; nodal cubic; fold | −1 on H¹ ⊗ H¹ of slope \< 1; dual kernel μ_p kills a tangent vector, so (ii) fails; q ≢ 1; q + 1 ≢ 0 | true; S03 |
| §6.5 | quadric cone and F_2 | q² + q + 1, (q + 1)², difference q | true |
| §6.6 | r hypersurfaces; affine step | augmented simplex complex of K's exact; (1) − (1) = 0 with ∑d ≤ m − 1 at both places | true |
| §6.7 | P¹, D a point; dim 0 | H⁰(ω) = H⁰(O(−1)) = 0; 1/(1 − t) = 1·1/(1 − t) | sign (−1)^{n+1} consistent with §6.9 step 3 |
| §6.8 | criterion; primitivity; E_1 × E_2, p = 2; lifts | x = R^{n−j}(y + Vw); m^\*x has components (x, x) under i_1^\*, i_2^\*; a_1 ⊗ a_2 − a_2 ⊗ a_1 ≠ 0 also for p = 2; e = V^n(f), i_1^\*f = i_2^\*f = 0, f = 0 | route sound with its two suppliers |
| §6.9 | g = 0, 1; 2P, P + Q | 0 ≡ 0, 1 ≡ 1; excluded by h⁰ = 2 | true |
| §6.10 | P¹ with x, y; F_{q²}/F_q pull-push; ∅ | [y] − 2[x] of degree 0; 2[x], 2[y]; excluded by the first clause | true |
| §6.11, §6.12 | Spec k; elliptic curve; cone | constant family dominant; no rational curve; RCC but not WO-rational | true |
| §6.13, §6.14 | P^n; cubic surface; E/F_5, E/F_3 | slopes j; ≡ 1; 9 ≡ 4; 4 ≡ 1 | true |

## Verified sound

- **Declarations read:** 8 of 8, each against its elaborated type and README statement; imports are `Mathlib` and nine existing `TauCeti.*` modules (the `module`/`public import` header is the form of 70 of the 187 roadmaps on main); no `set_option`, no sorry'd data, no `lemma`, no admitted `example`.
- **Targets read:** all 59 numbered sections, the Conventions, the supplier contracts, the Examples and Dependencies blocks and the References; the *Needs:* edges have no forward reference inside the roadmap.
- **Locators verified against the cached texts this round (statement read): 20.** BS17: Definition 2.5, Lemma 2.6 and proof, Theorem 2.9 and proof, Lemma 2.10, proof of Lemma 11.45 (n = 2), proof of Proposition 11.41 (lines 214–234, 289–359, 2440–2501). BBE07: Corollary 1.6 (line 195), Proposition 3.2 (lines 722–734), proof of Theorem 1.1 (lines 1335–1412), Lemma 6.10 (lines 1650–1668). CR12: Propositions 2.3.4 and 2.4.1 (lines 1928–1946), 3.2.3 (1)–(3) (lines 2518–2543), Proposition 4.4.3 (line 3917), Theorem 4.7.4 (line 4444). Ser58Top: n° 3 of §1 with formula (5), the surjectivity criterion and the Igusa example (lines 1127–1163). ESN03: Theorem 1.1, Corollaries 1.2, 1.3 (lines 52–82).
- **Checks tested:** every Check bullet read; values recomputed for the rows above (about 75 bullets); none false. Every definition section has at least three Checks.
- **Pinned declarations checked (6):** `Chow.pointsOfDimension`, `Chow.cyclesOfDimension`, `Chow.RatEquiv` (`TauCeti/AlgebraicGeometry/Chow/Basic.lean:67–93, 257`); `TauCeti.AlgebraicGeometry.bijective_cohomologyBaseChange` (`FlatBaseChange.lean:185`); `char_dvd_card_solutions_of_sum_lt` (`Mathlib/FieldTheory/ChevalleyWarning.lean:110`); `TauCeti.AffineInvariantQuotient` (`TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/Affine.lean`). No Künneth formula for quasi-coherent cohomology under `TauCeti/AlgebraicGeometry`.
- **Sibling citations checked at main or at the open head (17):** AbelianSchemesAndArithmeticModuli §A2.4 `ampleCohomologyAndDegree` and §A4.4 `exteriorCohomology` (statement read); ArcTopologyAndDescent §1.1 (definition and the three laws read); EnhancedDerivedSheaves §E2.8 `properSurjective_inductiveLevel` (read; no longer consumed); SchemeAndStackFoundations §§0.20, 0.23, 0.26, 0.29, 1.17, 2.5, 2.6 (`proper_fibreDimension_vanishing`), 4.9, 4.12 (`generic_flatness`, `flattening_by_blowup`, `modification_domination`, integral base), 4.14, 4.16, 4.19. The other supplier sections rest on the worker's resolve run (none unresolved) and on round 1.
- **Declared gaps:** the three gaps have the same sentence in `design/plan.json` and in the README, each with supplier SchemeAndStackFoundations; each is precise and none is provided at the pins or on main (§4.12 is stated over integral bases; §0.26 for finite type over F_p; no Künneth). Not raised.
- **Ownership:** `roadmaps grep` finds no other owner of `UniversallyCH0Trivial`, Witt-rational or WO-rational singularities, rational chain connectedness, or the Ax–Katz congruence, on main or at an open head; the eight Lean names are declared nowhere else. The overlap list has no other pull request changing this roadmap and no dropped id.
- **Policy:** the pull request changes only `packages/CrystallineCohomologyPartII/`; no pull-request number in the README or docstrings; every target has a locator; no computational algorithm.

## Not verifiable

- Ser58 (Théorème 2), Ax64, BS83, Kol96, Eke84, EkeII, Tsu03, Tsu04: uncertified, no text. §6.8 no longer depends on Ser58; §6.11 and §6.12 depend on Kol96 for the passage from a dominant family of chains to chains through every pair of points.
- HW23, published Corollary 1.3 and pp. 19–20: absent from the cached arXiv v2.
- Stacks tags 0FH6, 02RH and 0BED: the tag–lemma numbers were not re-read this round (round 1 and the repair read them).
- CR12 Theorem 4.8.1 and Proposition 4.8.4 (the shift in §5.12 (ii)), Gro85, dJ96, dJ97, CT03, Del74, EGAIII1, CR11, GNT19, NT20, Tan18: not re-read this round; round 1 covered them.
- The sections of PadicDifferentialEquationsAndRigidCohomology, CrystallineCohomology, DerivedDeRhamCohomology, MotivesAndAlgebraicCycles, ClassicalAdicEtaleCohomology, PrismaticCohomology, EtaleCohomologyFoundations, AdicSpacesPartIII and DerivedModuleAlgebra: existence by the worker's resolve run; statements not re-read this round.
- No Lean was elaborated (read-only pass); types are those of the job's signatures file.
- The first gap entry of `design/plan.json` has an `id` and no `slug` field, the two later ones have both; whether the intake reads `id` was not checked.

## Source issues

- **Gap** in BS17 at the proof of Proposition 11.41, printed page 53: the source says the induction on the dimension of the base, with the cancellation lemma, reduces to one blowup; it should treat every base change of that blowup, since the lemma needs universal descent; affects the proof.
- **Gap** in BS17 at the proof of Proposition 11.41, printed page 53: the source says the pushout of the blowup along the map from the exceptional divisor to the centre exists and is finite and universally homeomorphic over the base; it should construct it, that map not being finite; affects the proof.
- **Misprint** in BBE07 at the proof of Theorem 1.1 (5.2), printed page 33: the source says an isomorphism on the first N + 1 columns of the first page gives the abutment in degrees up to N; it should be degrees below N, with N at least 2d + 1; affects the proof.
- **Gap** in CR12 at Proposition 2.3.4, printed page 40: the source says pushforward after pullback is multiplication by the degree for a finite morphism of connected smooth schemes; it should assume the morphism surjective, as CR11 Theorem 1.2.3 (1) does; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e5e48575eb8b1783e49d873a6c606a2a0de45dab", "job": "RT-CrystallineCohomologyPartII~2a", "model": "fable", "worker": "chris-x27"} -->
