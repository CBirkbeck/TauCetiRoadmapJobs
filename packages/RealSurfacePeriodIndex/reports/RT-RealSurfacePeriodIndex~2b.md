<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13094#issuecomment-6916095211 -->
Red team round 2 pass b (claude) of a2b9a07

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The Kodaira–Spencer map is used in three targets and defined nowhere

   **Location.** `packages/RealSurfacePeriodIndex/README.md:867` (§2.2): "the map ∇(λ) … is the Kodaira–Spencer map `T_{B,b}` → H¹(T_b, `T_{T_b}`) followed by contraction with λ"; also `:879` (its API), `:1375` and `:1379` (§4.7), `:1393` (§4.8). §§2.5, 6.9 and 6.10 use it through Griffiths' formula and φ_λ.

   **Claim.** Griffiths' formula (§2.2), the factorisation of §4.7 and the bound of §4.8 are statements about a map the roadmap or a supplier constructs.

   **Witness.** §2.2 names the map with its source and target and never says what it is. No *Needs:* entry supplies it: ComplexComparisonPartII excludes Kodaira–Spencer identifications (its README lines 383 and 5259), and `roadmaps grep 'Kodaira.Spencer'` finds on main only ComplexCurveModuli, for curves. §4.7 step 1 rests on SER06, uncertified.

   **Repair.** In §2.2, after the sentence that introduces the variation, add:

   > For b ∈ B(ℂ) the Kodaira–Spencer map κ_b : `T_{B,b}` → H¹(T_b, `T_{T_b}`) is the connecting homomorphism of the tangent sequence of π restricted to the fibre, 0 → `T_{T_b}` → `T_𝒯|_{T_b}` → `T_{B,b}` ⊗ `O_{T_b}` → 0 (exact because π is smooth), applied to the constant sections. Contraction with λ ∈ H¹(T_b, Ω¹) is the cup product H¹(T_b, `T_{T_b}`) ⊗ H¹(T_b, Ω¹) → H²(T_b, O) induced by the pairing of tangent vectors with one-forms.

   Add the API bullet "κ_b : `T_{B,b}` → H¹(T_b, `T_{T_b}`), linear, the connecting map of the fibre tangent sequence; for a base change g : B′ → B, `κ_{b′}` = κ_b ∘ dg." Add the Checks: "For a product family T × B → B the fibre tangent sequence splits, `T_𝒯|_{T_b}` = `T_{T_b}` ⊕ `T_{B,b}` ⊗ O, so κ_b = 0, in agreement with ∇(λ) = 0." and "κ is not the zero map in general: at a smooth quartic containing a line, its contraction with the class of the line is onto H²(O) ≅ ℂ (§4.7 Checks)."

   Replace step 1 of §4.7 by:

   > 1. For the universal family 𝒯 ⊂ B × X, the differential of the projection 𝒯 → X restricts on T to a map from the fibre tangent sequence 0 → T_T → `T_𝒯|_T` → `T_{B,T}` ⊗ O_T → 0 of §2.2 to the normal sequence 0 → T_T → T_X|_T → `N_{T/X}` → 0. It is the identity on T_T, and on the quotients it sends a tangent vector of B to the normal field of the corresponding first-order deformation, which is the classifying map `T_{B,T}` → H⁰(T, `N_{T/X}`). Connecting maps are natural, so the Kodaira–Spencer map of §2.2 is the classifying map followed by the boundary of the normal sequence (SER06, Proposition 3.2.9 (i), states this).

   Tested: two tangent vectors (v, ξ), (v, ξ′) of 𝒯 over the same v differ by ξ − ξ′ ∈ T_T, so the map on quotients is well defined; for a direction v along which the member does not move the normal field is 0 and κ(v) = 0, as for the product family.

2. **F02** (P2) §6.7 follows B19's Lemma 6.4 clause by clause

   **Location.** `packages/RealSurfacePeriodIndex/README.md:1768`: "there are ι′ ∈ 𝒰 and t ∈ H⁰(S, A^l ⊗ N²(−R)) such that {t = 0} is smooth along its real locus Z, Z = ι′(𝒮), and rt ∈ H⁰(S, A^l ⊗ N²) is negative on S(ℝ) ∖ Ξ".

   **Claim.** The statement is in the roadmap's own words.

   **Witness.** B19 lines 1157–1161. The clauses come in the source's order with its connectives; ten consecutive words are shared ("such that {t = 0} is smooth along its real locus Z"), and five more at the end. Round 1 rewrote §6.2 and §5.1 for the same defect and left this section.

   **Repair.** Replace the statement (the locator stays) by:

   > Fix a very ample line bundle A, a line bundle N and an embedding ι : 𝒮 → Ξ satisfying Assumption 6.1. Sections with a prescribed real zero set exist in high even twists: for each neighbourhood 𝒰 of ι in C^∞(𝒮, Ξ) there is l₀, depending on 𝒰, such that for every even l ≥ l₀ one can find an embedding ι′ ∈ 𝒰 and a section t of A^l ⊗ N²(−R) with three properties. (1) The real zero set Z of t is exactly ι′(𝒮). (2) The curve {t = 0} is smooth at each point of Z. (3) The product rt, a section of the square of `A^{l/2}` ⊗ N, is negative in the sense of §6.1 at every real point outside Ξ.

   Tested on the Check Ξ = S(ℝ): (3) is empty and (1), (2) are the real-locus condition. The bound l₀ is kept dependent on 𝒰, as in the source's proof, where l is chosen after the auxiliary divisor D′, which depends on ι′.

3. **F03** (P2) §9.10 follows B19's Theorem 0.6 (ii) clause by clause

   **Location.** `packages/RealSurfacePeriodIndex/README.md:2626`: "iff S(ℝ) is nonorientable and, if exactly one half of S is nonempty, S(ℝ) has an odd number of connected components of odd Euler characteristic".

   **Claim.** The statement is in the roadmap's own words.

   **Witness.** B19 lines 79–80. The same three clauses in the same order with the same connective "and, if exactly one … is nonempty,"; eight consecutive words are shared ("S(ℝ) has an odd number of connected components"). The context line (`:2624`) says "The second clause is the source's".

   **Repair.** Replace the statement by the criterion the roadmap proves, and keep the locator:

   > Let S be a real Enriques surface. Some class of Br(S) has index different from its period exactly when both halves of S are nonempty and S(ℝ) has a nonorientable component. (B19, Theorem 0.6, p. 65; proof §8.1, pp. 106–107. The source's condition lists a further case, a single nonempty half together with a parity condition on the Euler characteristics of the components; by §9.8 that case is empty, source correction E25.)

   Move the present first Check ("By §9.8 the criterion is equivalent to …") into the context line. Tested: for the surface of the §5.5 Checks (four components ℝℙ² in one half) both statements say that no such class exists, the old one because 4 is even; for two nonempty halves and a nonorientable component both say that one exists (§9.7); for an orientable real locus both say none (§9.6).

4. **F04** (P3) §1.8 step 3 uses a resolution that its *Needs:* line does not list

   **Location.** `packages/RealSurfacePeriodIndex/README.md:788`: "Blowing up a coherent ideal whose zero locus has dimension at most one resolves them without changing anything above the generic points of the fibre components".

   **Claim.** The step rests on the inputs of the *Needs:* line (`:798`).

   **Witness.** The *Needs:* line and the Layer 1 Dependencies (`:827`) list only "ResolutionOfSingularitiesCharacteristicZero §5.1 (principalization)", which principalizes an ideal on a smooth variety; the cover here is a singular threefold. The resolution that is an isomorphism over the smooth locus is §7.8 of that roadmap.

   **Repair.** In step 3 replace the quoted clause by: "The cover is a generically reduced scheme of finite type over k whose singular locus has dimension at most one, since it lies over the singular locus of the reduced divisor {s_t = 0} of X × 𝔸¹. The resolution of ResolutionOfSingularitiesCharacteristicZero §7.8 (`exists_resolution`), a projective birational morphism from a smooth scheme that is an isomorphism over the smooth locus, resolves it without changing anything above the generic points of the fibre components". Add "ResolutionOfSingularitiesCharacteristicZero §7.8 (field resolution)" to the *Needs:* line of §1.8 and to the Layer 1 Dependencies. Tested on the Check at `:796` (l = 2, s₀ = s₁ = x): s_t = x(t²x + (1 − t)²), singular along x = 0, t = 1, a curve; at the generic points of z = ±x over t = 1 one has z ≠ 0 and the cover is étale over X × 𝔸¹.

5. **F05** (P3) §7.9: one Check computes nothing and one misdescribes the failing case

   **Location.** `packages/RealSurfacePeriodIndex/README.md:2121`: "the corrected w′ and the forms y_j are explicit"; `:2123`: "With w itself, dw² can be proportional to dz_j and y₁, y₂ can fail to be regular parameters (the case the source's choice does not exclude)".

   **Claim.** Both are discriminating Checks.

   **Witness.** The first states no value. For the second, proportionality to one dz_j is what the source excludes (B19 line 1332). With d(w² + 1) = α₁dz₁ + α₂dz₂ the determinant is 2(1 + i)(α₁ + α₂ + 2(1 + i)); on the first Check's own data (z₁ = w² + 1) it is nonzero.

   **Repair.** Replace the two Checks by:

   > - On 𝔸²_ℝ at the closed point 𝔪 = (x² + 1, y), with w = x and i the class of x: w′ = (x² − 1)/(2x) and w′² + 1 = (x² + 1)²/(4x²) ∈ 𝔪². For the parameters z₁ = y, z₂ = −y − (1 − x)(x² + 1)/2 one gets y₁ ≡ 2(1 + i)·y and y₂ ≡ −2(1 + i)·y − 2(x² + 1) modulo 𝔪², independent in 𝔪/𝔪².
   > - With w itself the same parameters fail, although neither is proportional to w² + 1 in 𝔪/𝔪²: y_j ≡ (x² + 1) + 2(1 + i)z_j, so y₁ ≡ (x² + 1) + 2(1 + i)y and y₂ ≡ −(x² + 1) − 2(1 + i)y = −y₁, and y₁ + y₂ ∈ 𝔪². In general, writing d(w² + 1) = α₁dz₁ + α₂dz₂, the y_j are parameters iff α₁ + α₂ ≠ −2(1 + i); the source's two separate conditions exclude only (α₁, α₂) = (−2(1 + i), 0) and (0, −2(1 + i)) on that line (source correction E10). For z₁ = x² + 1, z₂ = y, which the source excludes, y₁ ≡ (3 + 2i)z₁ and y₂ ≡ z₁ + 2(1 + i)z₂ are parameters.

   Tested: (1 + i)(1 − i) = 2 gives 2(1 + i)·(−(1 − i)/2)(x² + 1) = −2(x² + 1), whence both displayed values of y₂.

6. **F06** (P3) §2.1: "the graph-like section family" is not a defined notion

   **Location.** `packages/RealSurfacePeriodIndex/README.md:856`: "For n = d = 1, p_b has degree 1, and T_b is the graph-like section family."

   **Claim.** It is a Check with a value.

   **Witness.** "Graph-like section family" is neither standard nor defined in the README (one occurrence); a member T_b is a surface, not a family.

   **Repair.** "For n = d = 1 a member of |H| is {t₀a₀ + t₁a₁ = 0} with a₀, a₁ ∈ H⁰(S, A); for a general pencil it is the closure of the graph of S ⇢ ℙ¹, the blow-up of S at the A² base points a₀ = a₁ = 0, and p_b is birational, of degree dn = 1. For S = ℙ², A = O(1) it is a divisor of bidegree (1, 1) in ℙ¹ × ℙ², the blow-up of ℙ² at one point." Tested: over a point with (a₀, a₁) ≠ 0 the fibre is one point of ℙ¹; over a base point it is all of ℙ¹.

7. **F07** (P3) Two layer comments of `Suggested.lean` do not carry the README's layer titles

   **Location.** `packages/RealSurfacePeriodIndex/Suggested.lean:62`: "Layer 0: real function fields"; `:97`: "Layer 7: period equals index, the u-invariant and quadratic forms".

   **Claim.** The section comments are the README's layer headings.

   **Witness.** `README.md:148`: "Layer 0: real function fields: orderings, real closures, Brauer index and the Elman–Lam invariant"; `README.md:1946`: "Layer 7: period equals index: the main theorems and the u-invariant". The Layer 2 comment (`Suggested.lean:76`) does agree with `README.md:829`.

   **Repair.** Set the two comments to the README headings, word for word.

Second pass. Three P2 findings (one missing definition, two statements that follow the source's wording) and four P3 findings. No statement of `Suggested.lean` and no bold README target was found false. Files read in full: `packages/RealSurfacePeriodIndex/README.md` (2828 lines) and `packages/RealSurfacePeriodIndex/Suggested.lean` (165 lines). No Lean was run in this pass.

## Round 1 findings at this head

| Round-1 finding | State | Witness at a2b9a07 |
|---|---|---|
| 1a/F01 (P1) Pfister's local–global principle unowned | repaired | `README.md:366` (§0.6a): "sign_P(q) = 0 for every P ∈ X_F if and only if the Witt class of q is torsion in W(F), and in that case 2^m·q is hyperbolic for some m ≥ 0". §0.6a is in the *Needs:* of §0.8 (`:433`) and §0.14 (`:571`). Steps 3–5 recomputed (table below). EKM lines 6701, 6811, 7657. |
| 1a/F02 (P2) Artin–Lang unowned | repaired | `README.md:306` (§0.5a): "there is an R-algebra homomorphism x : A → R with f_i(x) > 0 for every i". §0.5a is in the *Needs:* of §0.9 (`:456`), §7.6 (`:2062`), §7.11 (`:2162`), §7.13 (`:2203`). The transfer step cites K3BlochGroups §5.8, whose text at its open head states that every ordered-field embedding between real closed fields is elementary with parameters. |
| 1a/F03 (P3) §1.3 cited AlgebraicTopologyPartII §7.4 alone | repaired | `README.md:667`: "adding ω ∪ (a₀, a₁) = (a₀, a₁, 0) gives (0, a₁, Sq¹a₁)". Recomputed: §7.4 with k = 1 gives (a₀, 0, Sq¹a₁); sum (0, a₁, Sq¹a₁). §14.2 is in the *Needs:* (`:677`) and in the Layer 1 Dependencies (`:827`). |
| 1a/F04 and 1b/F07 (P3) source corrections not cited | repaired | Every id E1–E15, E17, E18, E20–E26 occurs at least twice in the README (counted: E3 six times, E12 and E26 three, the others two). E11 is cited in §3.6 step 1 (`:1209`). |
| 1a/F05 (P3) "merge order" in the README | repaired | `grep -c 'merge order' README.md` is 0. `README.md:24`: "QuadraticFormInvariantsPartII consumes it for its Layer 5". |
| 1b/F01 (P2) layers follow B19's sections | partly repaired | Five headings were renamed (`README.md:1066`: "Layer 3: double covers branched along a curve: finite and incidence models and their cohomology"); no layer was merged, split or moved. Not raised again: see "Copyright, arrangement" below and the last section. |
| 1b/F02 (P2) §6.2 follows Assumption 6.1 clause by clause | repaired there, pattern not carried | `README.md:1663`: "whose image crosses R(ℝ) only at smooth points of R, and transversally there, subject to four conditions". Against B19 lines 1111–1121 the longest shared run is now four words. §5.1 was reworded too. The same defect remains in §6.7 (S02) and §9.10 (S03). |
| 1b/F03 (P3) §0.15 locator | repaired | `README.md:577`: "BEC05's Theorem 3.1 and Remark 3.2 are different criteria for u ≤ 4, by universality of four-dimensional forms, and are not used". BEC05 lines 105–107, 135–139. |
| 1b/F04 (P3) §0.14 step 2 rested on a recollection | repaired | `README.md:563`: "this property descends to F (EKM, Theorem 35.12, p. 152), and for F it is equivalent to the torsion-freeness of I³F (EKM, Proposition 35.9, p. 150)". EKM lines 8404, 8317. Step 3's "Becher's argument" is the first half of the proof of BEC05 Theorem 3.1 (BEC05 lines 112–117) and was recomputed: for q = q′ ⊥ ⟨a⟩ torsion of dimension 6, q′ ⊥ ⟨−det q′⟩ has signature ±1 ∓ 1 = 0 at every ordering. |
| 1b/F05 (P3) §0.9 step 5 | repaired | `README.md:447`: "F is nonreal by §0.5a (an integral variety without real points has a nonreal function field); X_F is empty". |
| 1b/F06 (P3) §0.2 pointer Check | repaired | `README.md:202`. Recomputed: [F_n : ℚ] = 2ⁿ, 2ⁿ orderings, fibres of size 2, limit {±1}^ℕ; Z_n = {√p₁ < 0} has 2ⁿ⁻¹ points. |

No repair was found to introduce a false statement. The repairs of 1a/F01, 1a/F02 and 1b/F04 added §§0.5a, 0.6a and a new step 2 of §0.14; each was recomputed on the instances listed under "Verified sound".

## Verified sound

**Dependency check** (the command of the brief):

    depcheck: 262 roadmaps, 2537 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README lists no citation and no Lean name found nowhere.

**Counts.** 9 declarations of `Suggested.lean` read with their elaborated types; all 148 `###` sections of the README read (110 with a *Needs:* line); 87 source locators verified at the text (B19 41, EKM 25, BEC05 5, BEN18 4, CT05 4, MVH98 3, VOI06 2, VA13 2, BW20II 1); 15 pinned declarations checked at file and line; all Checks read, those with computable content recomputed (main values below); 77 supplier section ids and 31 supplier declaration names resolved by hand at main or at the open head.

**Suggested.lean.** The file has nine declarations (one definition, eight theorems). The signature transcript supplied with the job lists a tenth entry named `,` at line 66 and three errors at line 167; both come from the transcript's own appended commands, not from the file. The nine elaborated types were compared with the README statements: no binder is lost, and finite generation is present in §§2.9, 2.10, 7.4, 7.6, 7.10 and absent in §§7.8, 7.11, 7.13, as the README says. The file begins with `module` and `public import Mathlib`, the form of 62 of the 250 `Suggested.lean` files on main; not raised.

| Declaration | Context | Instances and values | Result |
|---|---|---|---|
| `HasZeroTotalSignature` | all binders explicit; R : Type u, the universe of K | ⟨1, −1⟩ over ℝ: line x = y, 2·1 = 2, holds; ⟨1, 1⟩: no isotropic vector over any real closed R, fails; odd dimension over a real field: 2·dim W odd, fails; nonreal K: no real closed K-algebra, holds; ⟨1, 0⟩ over ℝ: radical line, holds | equals sign_P = 0 for all P on nondegenerate forms; degenerate forms are isotropic |
| `index_eq_orderOf_of_isAlgClosed` | k, K : Type u; `EssFiniteType`; trdeg = 2 | M_n(K): 1 = 1; (x, y) over ℚ̄(x, y): 2 = 2; period l^r: index divides l^(r−1)·l | true as typed |
| `index_dvd_two_mul_orderOf_of_isRealClosed` | R real closed | (x, x) + (y, xy) over ℝ(x, y): 4 divides 2·2; √−1 ∈ K: index = period | true, sharp |
| `index_eq_orderOf_of_not_isSemireal` | `¬ IsSemireal K` is "−1 is a sum of squares" (Mathlib `isSemireal_iff_not_isSumSq_neg_one`) | ℂ(x, y) admitted; ℝ(x, y) excluded, where the Albert class has 4 ≠ 2 | true as typed |
| `index_eq_orderOf_of_forall_isRealClosed` | hypothesis over all real closed K-algebras in Type u | nonreal K: hypothesis empty; Hamilton class over ℝ(x, y): hypothesis false; (−1, x): fails at orderings with x < 0 | true; real closures of K lie in Type u |
| `not_anisotropic_of_hasZeroTotalSignature` | no `EssFiniteType`; 4 < dim | degenerate q: radical vector; algebraic closure of ℝ(x, y): every form of dimension ≥ 2 isotropic; descent to a finitely generated subfield containing a transcendence basis | true as typed |
| `exists_anisotropic_hasZeroTotalSignature` | `EssFiniteType`; `Fin 4 → K` | w′ ≡ i; w′² + 1 = (w² + 1)²/(4w²); y_j ≡ 2(1 + i)z_j; signature 1 + 1 − 1 − 1 = 0; nonreal K without √−1: anisotropy over K(√−1) descends | true as typed |
| `not_anisotropic_of_not_isSemireal` | trdeg 2; 5 ≤ dim | ℝ(x, y): 5⟨1⟩ anisotropic, excluded; ℂ(x, y, z): 8-dimensional Pfister form anisotropic, excluded | both hypotheses needed |
| `exists_common_zero_of_not_isSemireal` | trdeg 1 | K(t) nonreal of trdeg 2, Amer–Brumer; ℝ(x): 5⟨1⟩ has no zero, excluded | true as typed |

Headline theorems: de Jong's theorem, the norm bound, Theorems 0.3, 0.4 (birational form), 0.10, 0.12 (both halves) and the pair-of-quadrics form of 0.13 are stated. Theorem 0.4 (scheme form), 0.5, 0.6, Proposition 0.7 and Theorem 0.13 (del Pezzo form) are named in the module docstring with the missing carriers; the pins have no Brauer group of a scheme (Mathlib's `Algebra/Azumaya` is over a ring) and no del Pezzo, Enriques or K3 carrier. One-tactic probe: no theorem follows from one library lemma; Theorem 0.3 from the birational 0.4 and Theorem 0.10 from the upper bound each need the transfer of semireality along a field map. No padding, `lemma`, `set_option`, `#eval` or sorry'd data.

**README statements, computed in this pass.**

| Statement | Instance | Values | Result |
|---|---|---|---|
| §0.5 trace form | M_d(R); M_(d/2)(ℍ_R) | d(d+1)/2 − d(d−1)/2 = d; Trd(x²) = 2(a² − b² − c² − d²), signature −2, times d/2 = −d | ✓ |
| §0.5a | Spec ℝ, Spec ℂ over ℝ; x² + y² = 0 | real, smooth point, dense: yes/yes/yes and no/no/no; singular real point, (y/x)² = −1, nonreal | equivalences hold; "smooth" needed |
| §0.6a steps 3–5 | φ(v + √a·w) = 0; ⟨1, a⟩ + ⟨1, −a⟩; b² + c² nonsquare | plane φ(w)⟨1, −a⟩; ⟨1, 1, a, −a⟩ = 2; ⟨1, 1, 1⟩ isotropic ⇒ 4q = 0 | ✓ |
| §0.7 | C₀; one-variable step | (a, 0) zero of the homogenisation forces a = 0; N(m + 1) > (dm + c + 1)dⁱ for N > d^(i+1), m large | ✓ |
| §0.11 | ⟨1 + t, 1 − t⟩ over ℝ(t) | −(1 + t)(1 − t) = t² − 1, not a square | ✓ |
| §0.13 | e = −x₁x₂x₃ | ex₃ ≡ −ab; ex₆ ≡ x₄x₅ ≡ cd using −x₁⋯x₆ a square; a = b = c = d = −1: ⟨−1, −1, −1, 1, 1, 1⟩ isotropic | ✓ |
| §0.14 Check | ⟨1, −(1 + x²)⟩ ⊗ ⟨1, −y⟩ | residue forms ⟨1, −(1 + x²)⟩, ⟨−1, 1 + x²⟩ anisotropic over ℝ(x) | ✓ |
| §1.2 at Spec ℝ | Hⁿ(G, ℤ(1)), n = 0, …, 3 | 0, ℤ/2, 0, ℤ/2 | ✓ |
| §1.8 step 4 | crossing N | s_t/s₁^l = c·ss′·(ss′)^(−l); (s, s′) = (s, s_t/s₁^l) + (s, −c⁻¹) | ✓ |
| §2.1 | H = h + A | H²·K_X = (2hA + A²)(−2h + K_S) = 2(A·K_S − A²); ℙ²: −8; quintic: 5 = 5, O(2): 20 > 10 | ✓ |
| §§4.1–4.5 | L = A^l ⊗ N(−R) | L²(R)(−C) = L ⊗ N; L(−C) = N(−R); ℙ², l = 2, N = O: L = O(1); N = O(−1): L = O | ✓ |
| §5.5 Check | B = ((1, 1, 1), (1, 2, 4), (1, 3, 9)) | entries, 2×2 minors and det = 2 nonzero; X(ℝ): 8 sign vectors × S² modulo ±1 = 4 spheres, ι antipodal; S(ℝ) = 4 ℝℙ²; J = w₁^⊥ (§9.1 with a₀ = 0); c_Ψ = h₁, coefficient sum 1 | consistent with §§3.6, 5.3, 5.4, 9.1, 9.8, 9.9 |
| §6.4 Check | torus, loops a, b, a + b | three double points; H¹(Ξ′) = 𝔽₂⁵; total class 0 | ✓ |
| §6.7 | t = −h₁h₂ru | ord_R(t) = −1 + 1 = 0; rt = −h₁h₂·r²u, r²u a square of a section of `A^{l/2}` ⊗ N | ✓ |
| §6.10 | λ_van | p_*λ_van = p_*λ − ½·2·p_*λ = 0; image of ∇λ in the vanishing part, of codimension h²(O_S) | ✓ |
| §7.9 | w′ = (w² − 1)/(2w) | see S05: with w′ the determinant is (2(1 + i))² ≠ 0 for all parameters | target ✓, Checks S05 |
| §7.12 | d = 4; d = 3 | 5, 13 < 15; 10 = 10 | ✓ |
| Layer 8 Examples | n = 4 | ψ(1, 0, 0, 0) = (1, 1, 1, 1) − 4(1, 0, 0, 0) = (−3, 1, 1, 1); (3, −1, −1, −1) ≡ (3, 3, 3, 3) | ✓ |
| §9.8 | any real Enriques surface | χ(S(ℝ)) ≡ χ(S(ℂ)) = 12 mod 2, so the number of components of odd Euler characteristic is even | ✓, independent of the route |
| §9.9 step 2 | a = [α̃]₁ + w₁(Σ) | deg(a·w₁) = 1 + χ(Σ) = 0 | ✓ |
| §9.12 | A₅ points [1 : 0 : 0], [0 : 1 : 0] | locally z² + v² + tw⁶ = 0: one real point; the chain of the resolution is two conjugate pairs of lines and a conic z² + v² + t = 0 without real points | four spheres only |

**Suppliers.** Every cited section exists where cited. Read at the open heads: MotivesAndAlgebraicCycles §§0.5b, 7.6a, 7.6b, 7.8, 7.10 (its §7.10 states H¹_alg = w₁^⊥ and cl_R(K_X) = w₁ for Enriques surfaces); HeightsRationalPointsAndObstructions §§2.16b, 2.19a with `smoothBrauer_residueExact`, `pullbackMultiplicity`, `brauerResidue_henselianFormula`, `finiteFlatBrauerCorestriction`, `pullback_comp`; WeilConjectures Layer WC.7; ShimuraData §3.1 (`Variation`); LefschetzPencilsAndVanishingCycles §0.10; PurityForFlatCohomology §8.4; K3BlochGroups §5.8; EnriquesSurfaces §§1.1, 1.3, 1.4 (another author's open pull request that adds a new folder); AlgebraicTopologyPartII Layer 6 and §§7.4, 9.2, 9.3, 10.3, 10.5, 12.1, 12.2, 14.1–14.3, 15.1–15.6, 16.1–16.4. On main: SchemeAndStackFoundations (17 sections, 15 names), ResolutionOfSingularitiesCharacteristicZero §§5.1, 6.2, 7.8 (`exists_resolution`), AlgebraicModuliForArithmeticGeometry §§1.1, 1.4, ComplexComparisonPartII §§C5.2, C5.3, C6.2, C6.3, AffineMorseLefschetz (A3), (A5), QuadraticFormInvariants Layers 0, 1, 2, 4, 5, SemisimpleAlgebras Layer 6 (separable maximal subfields, used in §0.12), FormalLaurentPuiseux L4, L5, StableReduction Layer 4, PurityOfBranchLocus §2.3, AlgebraicTopology Stage 6, RealAlgebraicGeometry Layer 1 (completed); "ModularCurves 4D" is mapped to its Layer 0.9 by the table at line 4529 of that README. AlgebraicTopologyPartII §14.2 states the sign system ℤ(1) of the covering S × G → S; that its class is ω is the classification of §14.1 applied to that covering.

**Pins.** Found at the cited file and line: Mathlib `AlgebraicGeometry.Scheme.Hom.smoothLocus` (Morphisms/Smooth.lean:300, with `LocallyOfFinitePresentation`), `Scheme.isBasis_affineOpens` (AffineScheme.lean:303), `IsSemireal` (Semireal/Defs.lean:38), `IsRealClosed` (IsRealClosed/Basic.lean:52), `QuadraticForm.baseChange` (TensorProduct.lean:128), `QuadraticMap.Anisotropic` (Basic.lean:1054), `Algebra.trdeg` (AlgebraicIndependent/Basic.lean:45), `Algebra.EssFiniteType` (EssentialFiniteness.lean:40); Tau Ceti `RegularFormClass.eq_iff_rank_eq_and_signature_eq` (Witt/Signature.lean:133), `Algebra.index` (Index.lean:99), `BrauerGroup.baseChange` (BaseChange.lean:136, both fields in one universe), `BrauerGroup.mk` (Group.lean:139), `RealClosure.exists_realClosure` (Basic.lean:120), `RealClosure.isRealClosed_of_isAlgClosed_adjoin` (QuadraticExtension.lean:144), `puiseuxField.instIsAlgClosed` (AlgClosure.lean:63). By object, the pins have no C_i fields, Tsen–Lang theorem, u-invariant, space of orderings or Artin–Lang theorem.

**Declared gaps.** The three slugs are in `design/plan.json` (`gaps`) with the suppliers and sections of the README. Each is still needed: ComplexComparisonPartII §C6.3 on main is the comparison over ℂ; MotivesAndAlgebraicCycles §7.8 uses "the torsion-free divisor cokernel" inside a proof without naming it; AlgebraicTopologyPartII §16.2 takes invariant control data as a hypothesis.

**Ownership.** Searched by object on main, at the pins and at the open heads: Kodaira–Spencer maps (S01), Tsen–Lang and C_i fields, Pfister's local–global principle, Artin–Lang, the u-invariant, period and index, Albert forms, Amer–Brumer. The only second owner is QuadraticFormInvariantsPartII for the Tsen–Lang block (last section). No declaration of `Suggested.lean` has a fully qualified name declared by another roadmap.

**Policy.** The pull request changes only `packages/RealSurfacePeriodIndex/`. No pull-request number or process word in the README or the Lean file; every target has a locator; every definition has at least three Checks (the fewest is §8.1, with three).

**Copyright, wording.** 25 passages compared with 4 sources: B19 lines 43–44, 52–53, 65–69, 77–80, 106–107, 123–124, 138–139, 146–147, 485–487, 676–683, 748–749, 1052–1058, 1111–1121, 1157–1161, 1173–1176, 1198–1204, 1286–1290, 1703–1708, 1805–1813; EKM lines 6701–6704, 6811–6816, 8820–8826; BEC05 lines 75–76, 102–104; MVH98 lines 135–144. Two follow the source (S02, S03). The statements of §§7.4 and 7.6 share nine-word runs with B19 lines 43 and 52 that are hypothesis lists ("a connected smooth projective surface over ℝ"); not raised.

**Copyright, arrangement.** B19 has the largest share of the source ids. Its sections against the layers, by number: Layer 2 ↔ §1 (with CT05 §3 added), Layer 3 ↔ §3, Layer 4 ↔ §5, Layer 5 ↔ §4, Layers 6 and 7 ↔ §6, Layer 8 ↔ §7, Layer 9 ↔ §8; Layers 0 and 1 have no counterpart. The correspondence is not one to one (§6 is two layers, Layers 0 and 1 are the roadmap's) and not in the source's order (Layers 4 and 5 are transposed, Layer 2 follows the material of §2). The *Needs:* lines force 3 before 4 and 5 (§§4.2, 5.1 need §3.2), both before 6 (§6.13 needs §§4.8, 4.9, 5.5, 5.8), 6 before 7 (§7.2 needs §6.13), and 7 and 8 before 9 (§§9.6, 9.7 need §§7.7, 8.10); only the place of Layer 8 after Layer 7 is free. The criterion of a one-to-one run in the same order is not met; the fact is recorded for the human reviewers.

Source independence: 25 passages compared with 4 sources, 2 shared (§6.7, S02; §9.10, S03); largest share B19, 134 of 268 source ids; contents compared with B19: layers 3, 4, 5, 8 and 9 have the scope of its §§3, 5, 4, 7 and 8, not in its order and not one to one, the order forced by the dependency lines named above.

## Not verifiable

- BCR, ARA75, SPR55, EL73, BRO80, DK96, DIK00, CTP90, SCH94, SER06, GG73, BRE97, DIM85: settled as uncertified; their statements were not read. §§6.5, 6.6, 9.13, the component count and the sign statement of §9.12, and the values {0, 1, 2, 4, 6} of §0.14 rest on them.
- The claim of the §5.5 Checks that B19's Proposition 4.4 fails: the hypotheses of that proposition were read (B19 lines 670–671, 748–749: any open and closed Ψ ⊃ Θ), the surface and its classes were recomputed, and the criterion of §5.5 was followed step by step; no independent second derivation of the comparison of AlgebraicTopologyPartII §16.4 was made.
- VOI06 Propositions 8 and 9, BEN18 Propositions 1.1 and 1.3, CT05 Propositions 2.2, 2.3, 2.6 and Lemme 3.15, BW20II Proposition 8.3: located at the cited pages; their proofs were not read. BW20 Propositions 2.8, 2.9 and Lemma 2.11 were not opened in this pass.
- The sign argument of §9.14 and the statement "only ADE singularities" of §9.12 were read for consistency (the two real singular points were resolved by hand, table above), not fully recomputed.
- Elaboration: no Lean command is given in this brief; the elaborated types are those of the supplied transcript.
- Condition (iv) of Assumption 6.1 after the blow-ups of §6.4 was read, not recomputed on the torus example.

## Source issues

- **Error** in B19 at Proposition 4.4, printed p. 81 (statement) and p. 84 (after (4.8)): the source says the obstruction vanishes for every open and closed Ψ containing Θ; it should require the evaluation term on Ψ to be the first real component of an integral class; affects a stated result.
- **Error** in B19 at Theorem 0.6 (ii), printed p. 65: the source says a single nonempty half can carry an odd number of components of odd Euler characteristic; it should be that this never occurs, the Euler characteristic of the real locus being even; affects nothing.
- **Gap** in B19 at the proof of Theorem 0.12, lower bound, printed p. 96: the source says the two elements built from w are local parameters once neither parameter is proportional to w² + 1; it should exclude a whole line of differentials, or first modify w; affects the proof.
- **Gap** in B19 at the proof of Theorem 0.12, printed p. 95: the source says the field is the union of the finite extensions of a finitely generated subfield carrying the class; it should first add a transcendence basis to that subfield; affects the proof.

## For the human reviewers

- **Scope.** Layers 3, 4, 5, 8, 9 have the scope of B19 §§3, 5, 4, 7, 8 and Layers 6–7 that of §6 (`packages/RealSurfacePeriodIndex/README.md:1066–2446`); 134 of 268 source ids are B19. Round 1 renamed the headings only.
- **Scope.** The README replaces B19's Propositions 4.4 and 4.5 by its own criteria and states that Proposition 4.4 fails (`README.md:24`, `:1558`, `:2778`); no refereed source for this correction is cited, and none was searched for outside the cached texts.
- **Ownership.** QuadraticFormInvariantsPartII at its open head (its README lines 118, 1592, 1622, 2029) still states Lang–Nagata and Tsen–Lang as its own targets and names this roadmap as their consumer; this README (`:24`, `:2771`) says the reverse.
- **Licence.** BEC05 is read from a preprint-server copy (`README.md:2814`); §§0.6a, 0.13–0.15 cite that copy's page numbers, and the published version was not collated.
- **Licence.** EKM is read from an author-hosted PDF with printed page numbers (`README.md:2813`); whether it is the final published text was not checked.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a2b9a07cb202748f91935f93ee13c124999d2d9b", "job": "RT-RealSurfacePeriodIndex~2b", "model": "fable", "worker": "chris-x29"} -->
