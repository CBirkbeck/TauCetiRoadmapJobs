<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13111#issuecomment-6792302273 -->
Red team round 1 pass b (claude) of 1b57030

Verdict: needs_changes

1. **F01** (P2) §1.5: the reduction to a blowup uses domination by a blowup, which no listed input provides

   - **Location:** `packages/CrystallineCohomologyPartII/README.md:461` (§1.5, step 3) and `:455` (its *Needs:*): "In the inductive step arrange X → Y to be the blowup of Y along Z with dim Z < dim Y".
   - **Claim:** the inputs listed for §1.5 reduce a proper surjection to the blowup `Bl_J Y → Y` that §1.3 requires (O_X(−E) relatively ample).
   - **Witness:** EnhancedDerivedSheaves §E2.8 `properSurjective_inductiveLevel` gives only "proper surjective … and an isomorphism outside a finitely presented closed Z". Domination by a blowup is SchemeAndStackFoundations §4.12 `modification_domination`, stated for Noetherian integral schemes, absent from §1.5's *Needs:* (BS17 lines 2465–2468 invoke "the proof of Lemma 2.6").
   - **Repair (replace the first sentence of step 3, and extend the *Needs:* line):**
     - Step 3: "In the inductive step the supplied factorization gives X_0 → Y_0, proper surjective, finitely presented and an isomorphism outside a closed Z ⊂ Y_0 with dim Z < dim Y_0; since F inverts nil-immersions, Y_0 may be taken reduced. Dominate X_0 → Y_0 by a blowup Bl_J Y_0 → Y_0 with V(J) = Z set-theoretically (SchemeAndStackFoundations §4.12, `modification_domination`, applied on each irreducible component of Y_0, the components being glued by §1.4 applied to the closed cover of the reduced Y_0 by one component Z and the union X of the others, whose hypothesis holds because O_Y → O_X ⊕ O_Z → O_{X∩Z} is exact when I_X ∩ I_Z = 0); by the cancellation law of universal descent (ArcTopologyAndDescent §1.1: if g∘f is of universal descent then so is g) it suffices to treat X = Bl_J Y → Y. After thickening, H^i(X, O_X(−E)) = 0 for i > 0; replace Y by the pushout Y′ of §1.3 …" (rest unchanged).
     - *Needs:* add "SchemeAndStackFoundations §4.12, modification domination".
     - If the repair worker cannot meet the integrality hypothesis of `modification_domination` this way, declare instead a second gap on SchemeAndStackFoundations §4.12: "For a Noetherian scheme Y and a proper morphism X → Y that is an isomorphism over the complement of a closed subset Z, provide an ideal J with V(J) ⊂ Z and a Y-morphism Bl_J Y → X" (Stacks, Lemma 38.31.3 (081T), has no integrality hypothesis).
     - Tested on the instance: Y = two lines meeting at a point (reducible), X = their disjoint union, Z = the point: the supplier's lemma does not apply to Y (not integral); the closed-cover step does.

2. **F02** (P2) §6.8: the proof route is a bare citation; its inputs are unowned

   - **Location:** `packages/CrystallineCohomologyPartII/README.md:1582–1586` (§6.8): "*Needs:* §0.1." and "Use Serre’s Bockstein theorem for abelian varieties, Ser58 Théorème 2, and Ser58Top, sections 1 and 3".
   - **Claim:** §6.8 (a target "here", per Scope and ownership) is provable from §0.1 alone.
   - **Witness:** the target is the theorem cited, so the route proves it by itself. BBE07 lines 1543–1546 also only cite. Serre's argument needs the cup-product algebra H^\*(A, O_A) = Λ^\*H^1(A, O_A) (no owner: `exterior` has no hit in AbelianSchemesAndArithmeticModuli) and the derivation formula, Ser58Top lines 1147–1150.
   - **Repair:** replace the route and the *Needs:* line by an actual route with owned inputs, as three API bullets of §6.8 (each a target here, with its locator), and route steps that use them:
     1. "Bockstein operations: for n > m the boundary δ_{n,m}: H^q(X, W_{n−m}O_X) → H^{q+1}(X, W_mO_X) of 0 → W_mO →(V^{n−m}) W_nO →(R^m) W_{n−m}O → 0; it is zero for all (n, m) in degree q iff H^q(X, W_nO_X) → H^q(X, O_X) is onto for all n (Ser58Top, §1, n° 3, pp. 27–28; lines 1135–1157)."
     2. "Derivation formula: for n > 2m, δ_{n,m}(x·y) = δ_{n,m}(x)·F^{n−m}R^{n−2m}y + (−1)^r F^{n−m}R^{n−2m}x·δ_{n,m}(y) (Ser58Top, formula (5), p. 28; lines 1147–1150)."
     3. "For an abelian variety A of dimension g: H^\*(A, O_A) is the exterior algebra on H^1(A, O_A), and H^1(A, W_nO_A) → H^1(A, O_A) is onto for every n (Ser58, Théorème 2 and its proof, cited by locator)."
     - Route: "(1) By bullet 3 the Bockstein operations vanish in degree 1. (2) By bullet 2 and induction on the degree they vanish on products of degree-1 classes, hence on H^\*(A, O_A) by bullet 3; the pairs (n, m) with n ≤ 2m are covered through the surjectivity criterion of bullet 1, which only needs H^q(A, W_nO_A) → H^q(A, O_A) onto. (3) In degree g − 1 this is the vanishing of H^{g−1}(A, W_iO_A) → H^g(A, O_A), i.e. the injectivity of V^i."
     - *Needs:* "§0.1; AbelianSchemesAndArithmeticModuli (cite the section that owns H^\*(A, O_A) = Λ^\*H^1 if one exists at its head; otherwise bullet 3 stays a target of §6.8 with the Ser58 locator)."
     - Tested on the README's own instance g = 1: degree g − 1 = 0, bullet 1's criterion reads W_{i+1}(k) → k onto, as in the existing Check.

3. **F03** (P3) §4.2: the degree formula is stated for finite morphisms that need not be surjective

   - **Location:** `README.md:919` and API bullet `:933`: "For a finite morphism f: X → Y of connected smooth k-schemes, f_\* ∘ f^\* = deg(f) on W_•Ω_Y."
   - **Claim:** holds for every finite f.
   - **Witness:** f = inclusion of a k-point x in P¹ is finite with no degree; over S = Spec k, f_\*f^\*(1) = ĉl(x), of trace 1 (the README's own Check at `:1070`). CR12 line 1928 prints the same unqualified hypothesis.
   - **Repair:** in both places: "For a finite surjective morphism f: X → Y of connected smooth k-schemes (so dim X = dim Y and r = 0), f_\* ∘ f^\* = deg(f) as an endomorphism of the sheaf W_•Ω_Y on Y (S = Y)." Add the Check: "For the inclusion f of a k-point x in P¹ (finite, not surjective, r = −1), f_\*f^\*(1) = ĉl(x) ≠ 0 lies in bidegree (1, 1): the degree formula is for surjective f only." Tested: the point inclusion is now excluded; the Frobenius Checks (degree p) still hold.

4. **F04** (P3) §6.4: flat base change is cited to a supplier declaration that does not state it

   - **Location:** `README.md:1496` and `:1503`: "flat base change (SchemeAndStackFoundations §2.6, `qcoh_higherDirectImages`) gives `H^i(X_{K′}, O)` = H^i(X, O) ⊗_K K′".
   - **Claim:** `qcoh_higherDirectImages` provides flat base change.
   - **Witness:** SchemeAndStackFoundations README lines 3556–3560: that declaration is quasi-coherence of R^pf_\*F and "uses no flat base change"; the statement is pinned Tau Ceti `TauCeti.AlgebraicGeometry.bijective_cohomologyBaseChange`, `TauCeti/AlgebraicGeometry/Cohomology/FlatBaseChange.lean:185`.
   - **Repair:** in step 4 and in the *Needs:* line replace the citation by "Tau Ceti `TauCeti.AlgebraicGeometry.bijective_cohomologyBaseChange` (`TauCeti/AlgebraicGeometry/Cohomology/FlatBaseChange.lean`, line 185: R → R′ flat, X quasi-compact with affine diagonal, M quasi-coherent; a proper K-scheme is quasi-compact and separated)", and add that declaration to "From Tau Ceti" in the supplier contracts.

5. **F05** (P3) §6.8: Ser58Top locator misreads "§1, n° 3" as "sections 1 and 3"

   - **Location:** `README.md:1578`, `:1586`, References `:1791`, and `sources.toml` (`Ser58Top`, `locator = "§§1, 3, pp. 24–53"`).
   - **Claim:** Bockstein operations are in sections 1 and 3 of Ser58Top; the page range is the whole article.
   - **Witness:** Ser58Top line 1127: "3. Opérations de Bockstein" is n° 3 of §1 (printed pp. 27–28, lines 1127–1172); §3 (line 1698) is on cyclic coverings. BBE07 line 1546 writes "[24, §1, 3]".
   - **Repair:** "Ser58Top, §1, n° 3 (Opérations de Bockstein), pp. 27–28" in the three README places and in `sources.toml`.

6. **F06** (P3) §0.5 (ii), converse: the route stops at closed points

   - **Location:** `README.md:258` (step 3): "so B/mB has a single point n and … hence A/m = B/n."
   - **Claim:** this proves that the fibres are connected "after every base change to a field point" (Conventions item 7).
   - **Witness:** the step treats maximal ideals m only; the generic point of Y = A¹ is not covered. NT20 lines 657–674 has the same extent.
   - **Repair:** append to step 3: "Thus the finite map f is injective with trivial residue field extensions at closed points. The set of y ∈ Y whose fibre is not a single point with purely inseparable residue extension is constructible (SchemeAndStackFoundations §0.23, universal homeomorphism criteria) and contains no closed point; Y is of finite type over a field, hence Jacobson, so the set is empty and f is radicial." Tested: for a generically étale double cover of A¹ the bad set is a dense open, which has closed points, so the hypothesis already fails there.

7. **F07** (P3) Suggested.lean: the rationally-chain-connected form of Esnault's theorem is neither stated nor named as not statable

   - **Location:** `Suggested.lean:42–54` (module docstring, "Not statable at the pins").
   - **Claim:** the list names every headline that is not statable.
   - **Witness:** the Summary's headline (`README.md:3`: "rationally chain connected varieties have a number of points congruent to 1 modulo q"; §6.11, §6.12, §6.14 (i) "for instance") is absent from both lists; `rationally chain connected` has no carrier at the pins.
   - **Repair:** add the bullet: "* Esnault's point count for rationally chain connected (in particular Fano) smooth projective varieties (§§6.11, 6.12, 6.14 (i)): no families of rational curves and no notion of rational chain connectedness; `card_rationalPoints_modEq_one_of_universallyCH0Trivial` states the theorem under the hypothesis that §6.12 derives from it."

8. **F08** (P3) References: process narrative in the HW23 entry

   - **Location:** `README.md:1783`: "Certified text: arXiv v2, Corollary 4.6. … are cited by locator only; they are absent from v2 and are not certified by this extraction."
   - **Claim / witness:** "certified", "this extraction" describe the production process, not the source (policy class 12).
   - **Repair:** "HW23: …, 2020. §2; Corollary 4.6 and proof (arXiv v2; Corollary 4.7 in the published version). Corollary 1.3 and pp. 19–20 are locators of the published version."

9. **F09** (P3) Checks: two duplicates in §0.3 and an unexplained computation in §6.9

   - **Location:** `README.md:214` and `:218` (same statement, A perfect); `:215` and `:219` (same statement, A = F_p[ε]/(ε²)); `:1620`: "have q + 1 − q = 1 ≢ 0 points' difference".
   - **Witness:** lines 218–219 restate 214–215 word for word in content; BBE07 lines 1554–1556 give D = 2{0} with 1 rational point and D′ = {0} + {∞} with 2.
   - **Repair:** delete the Checks at `:218` and `:219`; in `:1620` replace the parenthesis by "(the analogue on an abelian variety of BBE07 Remarks 6.6 (ii): on P¹, D = 2{0} has 1 rational point and D′ = {0} + {∞} has 2, with h^0 = 3 for both)".

10. **F10** (P3) a roadmap cited in a Check is missing from the supplier contracts

   - **Location:** `README.md:420`: "(NeronModelsAndSemistableAbelianVarietiesPartII §1.1, ferrand geometric pushouts)".
   - **Witness:** "## Exact supplier contracts" (`:42–104`) has no subsection for NeronModelsAndSemistableAbelianVarietiesPartII; the section exists at that roadmap's head (line 271, "1.1 ferrand geometric pushouts") and the roadmap is earlier in the merge order.
   - **Repair:** add "### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarietiesPartII — §1.1, ferrand geometric pushouts (comparison in a Check of §1.3 only; no proof route consumes it)", or drop the parenthesis from the Check.

Two P2 findings (R01, R02) and eight P3 findings. No statement of `Suggested.lean` was found false; no P1.

## Dependency check

```
depcheck: 237 roadmaps, 2149 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line for this roadmap.

## Adversarial table (computed values)

Suggested.lean declarations (all in `namespace TauCetiRoadmap.CrystallineCohomologyPartII`, no section `variable`s; every binder is in the declaration's own signature; elaborated types in the job's `signatures.md` compared with the README, no lost binder):

| Declaration | Context | Instances tried | Values | Result |
|---|---|---|---|---|
| `card_rationalPoints_modEq_of_cohomologyPullback_bijective` | K finite field, πX, πY proper, f over K, hH for all i : ℕ | X = ∅ (forces H^0(Y) = 0, so Y = ∅: 0 ≡ 0); blowup of a surface at a rational point (counts differ by q); fold P¹ ⊔ P¹ → P¹ (H^0: K → K², not onto; q+1 ≢ 0); E → Spec F_p ordinary (H¹ ≠ 0; p+1−a ≢ 1); nonreduced X (five lemma on V-sequences is insensitive) | as listed | true as typed; equals §6.4 (ii) |
| `card_projectiveZeroLocus_modEq_one` | F : Fin r → MvPolynomial (Fin (n+1)) K, d_j ≥ 1, ∑ d_j ≤ n | r = 0: (q^{n+1}−1)/(q−1) ≡ 1; n = 0 forces r = 0: 1 point; F_j = 0 (any degree): dropping keeps the bound; d_j = 0, F = 1: 0 ≢ 1, excluded by `hd`; x²−ay² on ℙ² : 1 point; on ℙ¹ (∑d = 2 > 1): 0 points, not covered | affine N = 1 + (q−1)P, N ≡ 0 ⇒ P ≡ 1 | true (Ax–Katz); equals §6.6 |
| `card_dvd_card_solutions_of_sum_lt` | s : Finset ι, ∑ totalDegree < Nat.card σ | s = ∅: q^{|σ|}, |σ| ≥ 1; f = 0: q^{|σ|}; f = 1: 0; nondegenerate ternary quadric over F_9: 81 | q ∣ each | true (Ax); not at the pin (`char_dvd_card_solutions_of_sum_lt`, `Mathlib/FieldTheory/ChevalleyWarning.lean:110`, gives p only) |
| `IsThetaDivisor` | A : AbelianVariety K (pin: proper, geometrically integral group scheme; smooth follows) | E, I = O(−P): dual O(P) ample, h^0 = 1 ✓; I = O(−2P): h^0 = 2 ✗; wrong model I itself: h^0 = 0, not ample ✗; dim A = 0: only the unit ideal, Θ = ∅ | as listed | determines principal polarization (h^0 = χ, deg φ = χ²) |
| `card_thetaDivisor_modEq` | K finite | g = 1: 1 ≡ 1; g = 0: 0 ≡ 0; 2P vs P+Q on E: not theta divisors (1 ≢ 2) | — | true (BBE07 Theorem 1.4) |
| `zeroCycleDegree` | π : X → Spec L | [x] rational: 1; [y] of degree 2: 2; [y] − 2[x]: 0; non-closed point: residueDegree 0 (junk, harmless on `cyclesOfDimension _ 0`) | — | matches §6.10 |
| `UniversallyCH0Trivial` | L : Type u, both clauses | Spec K: ✓; ∅: first clause fails ✓; curve of genus ≥ 1: fails over L ⊃ k(C); Spec F_{q²}/F_q: fails over L = F̄_q | deg ⊗ ℚ bijective ⇔ (∃ nonzero degree) ∧ (ker torsion) | equivalent to Conventions item 9 |
| `card_rationalPoints_modEq_one_of_universallyCH0Trivial` | projective, smooth, geometrically connected | ℙⁿ: ≡ 1; y² = x³+x+1/F_5: 9 ≡ 4 (hypothesis fails); y² = x³−x/F_3: 4 ≡ 1 (converse not claimed); Spec F_{q²}: 0, excluded twice; ∅ excluded | recomputed 2,0,2,2,2 affine points over F_5 | true; hypothesis stronger than ESN03 Corollary 1.2 |

Padding probe (read against the pins): none of the five theorems follows by one tactic or one library lemma; the three definitions are each used by a stated theorem. No finding.

README targets (59 sections read in full); rows with computed values:

| Statement | Instances | Values | Result |
|---|---|---|---|
| Conventions Checks | W_2(F_2): FV(1) = 2; F = (σ, 2σ) over F_4: φ = (1, 4); ℙ¹ zeta | v_4(4) = 1; ζ^W = 1/(1−t) | consistent |
| §0.1 Teichmüller Check | [t]·(a_0, a_1) = (t a_0, t^p a_1) vs V(t) = (0, t) | t ∤ t^p-multiple | true |
| §0.2 End(WO_ℚ) on Spec F_p | Hom_Ab(ℤ_p, ℤ_p) = ℤ_p (p-adic continuity) | ℚ_p | true |
| §0.4 (iii) negative control | (t_1, t_2, …), F^c: t_i^{p^c} ≠ 0 for i > c | nonzero in colimit | true |
| §0.6 W(I_1+I_2) = W(I_1)+W(I_2) | derived from exactness of the fibre-product sequence | lift ũ ∈ W(I_2), w − ũ ∈ W(I_1) | true |
| §0.8 slopes | ordinary E: dim 1 slope 0; supersingular: dim 2 slope 1/2 | 2g − f with g = 1 | consistent with §3.5 Check |
| §1.3 (i)–(ii) | J = (f) nonzerodivisor: B′ = A; J nilpotent: X = ∅, B′ = A/J; A², J = (x, y): B′ = k[x, y] | KO_X = JO_X since J·B′ ⊂ K ⊂ H^0(JO_X) | true; E = X ×_{Y′} Z exactly |
| §1.5 base case | dim Y = 0 reduced: product of fields, X flat | fppf | true; step 3 is R01 |
| §2.1 Check | cone over canonical curve: R¹f_\*(I′) ⊃ H¹(C, ω) = k; Bl_0A²: H¹(ℙ¹, O(m+r)) = 0 | — | true |
| §2.3 Checks | A¹: K → K iso, H¹(ℙ¹) = 0 ⇒ H_c^\* = 0; G_m: coker(K → K²) = K | — | true |
| §2.6 Check | split node: C⁰ = K, C¹ = K³, d⁰ = 0; cocycle: g(x,x) = 0, g(a,b)+g(b,a) = 0 | H¹ = K at N = 2, K³ at N = 1 | true |
| §3.1 Checks | F = p^aσ: E^{<1} = E iff a ≤ 0; p = 2, a_1 = ±2: roots 1 ± i | v_2 = 1/2 | true |
| §3.5 Check | slopes 0^f, 1^f, (0,1)^{2g−2f} | f + 2g − 2f = 2g − f | true |
| §4.5 Check | [ℙ¹×{x}]: 0 on H⁰, α ↦ (∫α)ĉl(x); [{x}×ℙ¹]: id on H⁰ | sum = Δ | true |
| §4.6 | degree i = codim − dim X: point in ℙ¹: 1; diag(1, 0) control | N·diag(1,0) ≠ 0 | consistent with (i)–(iii) |
| §5.10 Check 3 | cone of x² − ay²: normalization A¹ over F_{q²}; fibre over vertex Spec F_{q²} | dims 1 and 2 | condition (1) fails, true |
| §5.11 Check | Δ_{ℙ^d} = ∑ h^i × h^{d−i} | terms with d − i ≥ 1 on ℙ^d × H | N = 1 |
| §5.12 (ii) | ℙ¹ → Spec k: H¹(Wω) = W ≅ H⁰; ℙⁿ_Y; identity (r = 0) | shift by r | consistent; CR12's unshifted form refuted (Source issues) |
| §6.3 | Φ = 1/(1−qt): N_r = q^r; Φ = 1/(1−t): N_r = 1; Φ = 1 | (i)–(iv) all / none / all | true |
| §6.4 Checks | two ℙ¹ at a point: 2q+1; split node: q; Spec K′: 0; Igusa: −1 on H¹(E_2) ⊗ H¹(E_1) | ≡ 1, ≢ 1, ≢ 1, ≠ id | true |
| §6.5 Check | cone: q(q+1)+1; F_2: (q+1)² | both ≡ 1 | true |
| §6.6 step 4 | homogenize in ℙ^m, ∑d ≤ m−1; at infinity ℙ^{m−1}, ∑d ≤ m−1 | 1 − 1 = 0 | true |
| §6.7 Check | ℙ¹, D a point: H⁰(ω) = H⁰(O(−1)) = 0 | 1/(1−t) = 1/(1−t)·1 | true |
| §6.14 Checks | as in the Lean table | 9 ≡ 4 mod 5; 4 ≡ 1 mod 3 | true |

## Verified sound

- **Declarations read:** 8 of 8 in `Suggested.lean`, each against its elaborated type and its README statement (§6.4 (ii), §6.6 twice, §6.9, §6.10, §6.14 (i)); generality equal on both sides; imports are `Mathlib` plus nine `TauCeti.*` modules, each used; no `set_option`, no sorry'd data, no `lemma`.
- **Targets read:** all 59 numbered sections, the Conventions, the supplier contracts and the References; internal *Needs:* edges checked for forward references (none; no internal cycle).
- **Locators verified against the cached texts (statement read):** BBE07 27 (Theorem 1.1, Corollaries 1.2, 1.3, 1.5, 1.6, Theorem 1.4, Propositions 2.1, 2.2, 2.10, 3.2, 4.4, 4.6, Corollary 2.3, Theorem 2.4, Lemmas 2.5–2.7, Theorem 4.5, Lemma 5.1, §5.2, Propositions 6.2–6.4, §6.5, Remarks 6.6, Propositions 6.8, 6.9, Lemma 6.10, Corollary 6.12, Remarks 6.13, with pages); CR12 19 (Theorem 5, Lemma 1.5.1, Definition 2.3.1, Propositions 2.3.3–2.3.4, Lemma 2.4.3, Theorem 3.3.10, Proposition 3.5.10, Lemma 3.6.1, Proposition 3.7.7, Proposition 4.1.4, Lemma 4.2.4, Definitions 4.2.5, 4.3.1, 4.4.4, Theorem 4.3.3, Corollary 4.4.16, Proposition 4.6.1, Corollary 4.6.4, Theorems 4.7.4, 4.8.1, Proposition 4.8.4); BS17 8; ESN03 3; GNT19 7; NT20 3; HW23 1 (Corollary 4.6, v2); Tan18 2; Stacks 1 (0FH6 = Lemma 45.8.2); Ser58Top 1 (see R05). Presence and page only: Gro85 4.1.7, dJ97 5.15, dJ96 7.4, CT03 11.2.5, Del74 (6.2.5), EGAIII1 3.3.1, CR11 1.1.14 and 1.2.3.
- **Checks tested:** all 210 Check bullets read; values recomputed for the rows of the table above (about 70 bullets); no false Check found. Every definition section has at least three Checks.
- **Pinned declarations checked at the pins:** Mathlib `char_dvd_card_solutions_of_sum_lt` (line 110), `WittVector.frobenius_verschiebung` (43), `verschiebung_mul_frobenius` (102), `verschiebung_frobenius` (141, `CharP`), `map_surjective` (263), `frobeniusEquiv` (283), `GeometricallyConnected`, `Scheme.Hom.residueDegree`, `LocallyOfFiniteType.isLocallyNoetherian` (`Noetherian.lean:236`), `SerreClassLocalization.abelian` and `isZero_obj_iff`; Tau Ceti `AbelianVariety` (fields `toOver`, `grpObj`, `isProper`, `geometricallyIntegral`), `Chow.cyclesOfDimension` (points of height k in the specialization order), `Chow.RatEquiv` (an `AddSubgroup` of `cyclesOfDimension X k`, `[IsLocallyNoetherian X]`), `IsProjectiveOver`, `cohomologyBaseModule`, `pullbackObjUnitIso`.
- **Sibling citations checked at main or at the open head (section and named target present):** 46 — SchemeAndStackFoundations §§0.20, 0.23, 0.26, 0.29, 2.6 (`ample_serre_vanishing`, `proper_fibreDimension_vanishing`, `projectiveSpace_cohomology`), 2.7, 2.18 (`projectionFormula`), 2.19–2.21 (`trace_finite`), 4.9, 4.12, 4.14, 4.16, 4.19 (`alteration_theorem`), 5.1, 5.2, 5.5; EnhancedDerivedSheaves §§E1.3, E1.4, E2.6, E2.8 (`properSurjective_inductiveLevel`, `derivedSchemeBaseChange`, `descendableCover_fppf`), E5:descent, E5:animation (`simplicialWitt`, `wittFrobeniusLocalization`, `tot_filteredColimit_of_bounded`); ArcTopologyAndDescent §§1.1, 1.3, 1.6; PrismaticCohomology §2.0; AbelianSchemesAndArithmeticModuli §A2.4 `ampleCohomologyAndDegree`; MotivesAndAlgebraicCycles §§0.1, 0.6, 2.2; AdicSpacesPartIII §F0.6; DerivedModuleAlgebra §1.T.1; ClassicalAdicEtaleCohomology §5.4; EtaleCohomologyFoundations §G.2; DerivedDeRhamCohomology §PD.6; CrystallineCohomology §§CR.3:duality.1, CR.4.4, CR.4.6, CR.4.7, CR.4.8 with the four named targets; PadicDifferentialEquationsAndRigidCohomology (RD.4.24, RD.5.67, RD.6.58 headings; the others by the worker's resolve list, none unresolved).
- **Declared gap `gap:qcqs-frobenius-factorization`:** same slug and sentence in `design/plan.json` and in the README; precise; minimal (SchemeAndStackFoundations §0.26 `frobenius_factors_through_universalHomeomorphism` is for schemes of finite type over F_p; §1.5 needs finitely presented schemes over a Noetherian S). Not raised.
- **Ownership:** no sibling on main or at an open head declares `UniversallyCH0Trivial`, `zeroCycleDegree`, `IsThetaDivisor`, the Ax–Katz congruence, Witt vector cohomology of singular schemes, WO-rationality, or rational chain connectedness (searched by object with `roadmaps grep`); MotivesAndAlgebraicCycles §2.2 owns Chow continuity for smooth projective schemes and §6.10 states the proper case, with the citation in place. This roadmap is the owner of the eight Lean names.
- **Policy:** the pull request changes only `packages/CrystallineCohomologyPartII/`; no pull-request number in README or docstrings; every target has a locator.

## Not verifiable

- Stacks tag 02RH (Lemma 42.15.2): the cached Stacks text is the Weil-cohomology chapter only; the tag–lemma match was not read.
- Ser58 (Théorème 2), Ax64, BS83, Kol96, Eke84, EkeII, Tsu03, Tsu04: uncertified, no text; the statements attributed to them were checked only for internal consistency. R02 depends on what Ser58 Théorème 2 states.
- HW23, published Corollary 1.3 and pp. 19–20: absent from the cached arXiv v2.
- The content of Gro85, dJ97, dJ96, CT03, Del74, EGAIII1 and CR11 at the cited places was located (number and page) but not read against the claims.
- The exact statements of the PadicDifferentialEquationsAndRigidCohomology sections RD.3.1–RD.7.4 beyond three headings: existence relied on the worker's resolve run.
- No Lean was elaborated in this pass (read-only); types were taken from the job's `signatures.md`.

## Source issues

- **Error** in CR12 at Theorem 5 (introduction), printed page 6, and Theorem 4.8.1, printed page 96: the source says the higher direct images of Wω for i > 0 match the cohomology sheaves of the Witt singularity complex in the same degrees, and vanish for Witt-rational Y; it should be that R^i f_* of Wω matches degree i − r, r the relative dimension (ℙ¹ over a point has H¹ ≠ 0); affects a stated result.
- **Gap** in BS17 at the proof of Proposition 11.41, printed page 53: the source says the pushout of the blowup along the map from the exceptional divisor to the centre exists and maps to the base by a finite universal homeomorphism; it should construct it, since that map is not finite; affects the proof.
- **Gap** in NT20 at Lemma 2.17, printed page 13: the source says the converse direction follows from the fibres over maximal ideals being single points with trivial residue extension; it should add the passage from closed points to all points (constructibility, Jacobson); affects the proof.
- **Gap** in CR12 at Proposition 2.3.4, printed page 40: the source says the composite of pushforward and pullback is multiplication by the degree for a finite morphism of connected smooth schemes; it should assume the morphism surjective (or define the degree as zero otherwise); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1b57030b727f5209c5a9c16d8166c4f25fd11302", "job": "RT-CrystallineCohomologyPartII~1b", "model": "fable", "worker": "chris-l"} -->
