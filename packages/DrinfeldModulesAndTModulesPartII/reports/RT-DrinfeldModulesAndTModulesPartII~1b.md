<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1436#issuecomment-6400695618 -->
Red team round 1 pass b (claude) of 9500295

Verdict: needs_changes

1. **F01** (P2) `direct_small_weight_spanning` asserts weight 2q−1, which no source proves

   Location: `packages/DrinfeldModulesAndTModulesPartII/Suggested.lean:378` (`hw : w ≤ 2 * Fintype.card F - 1`); `packages/DrinfeldModulesAndTModulesPartII/README.md:1343` ("For w ≤ 2q − 2 (and also w = 2q − 1), the AMZVs ... span AZ_w").

   Claim: the arrays over Thakur's family with character 1 at every entry q span AZ_w for every w ≤ 2q − 1, by a direct expansion of B*C(R_ε).

   Witness: IKLNDP24 Proposition 4.11 (IKLNDP24 line 6517) is stated for w ≤ 2q − 2 only. Remark 4.12 (IKLNDP24 line 6729) says the bound is essential to the printed proof and that the authors "can manage" w = 2q − 1, with no proof given. The README's proof route for (1) (line 1345) says only "the condition w ≤ 2q − 2 keeps the expansion short" and supplies nothing for w = 2q − 1. At w = 2q − 1 the family AJ^1_w has s(w) elements (my count at q = 3, w = 5: 130 = s(5)), so spanning is equivalent to its independence, which is not the independence theorem of §5.13(2) (that one is for AT′_w, a different set: (q−1, q) ∈ I′_{2q−1} but ∉ I^T_{2q−1}, while (q, q−1) ∈ I^T_{2q−1} but ∉ I′_{2q−1}).

   Repair: in `Suggested.lean` line 378 replace `(hw : w ≤ 2 * Fintype.card F - 1)` by `(hw : w ≤ 2 * Fintype.card F - 2)` and in the docstring (line 375) "through weight 2q-1" by "through weight 2q-2". In README §5.13 line 1343 delete "(and also w = 2q − 1)" and add after the statement: "Im–Kim–Le–Ngo Dac–Pham remark that the same conclusion holds at w = 2q − 1 (Remark 4.12) without giving a proof; it is not asserted here." Tested on the refuting instance: at q = 3 the Lean statement then stops at w = 4, where Proposition 4.11 applies and the README's Check (line 1363, AT^1_4 a basis of AZ_4) still holds.

2. **F02** (P2) The Scope presents a supplier roadmap that exists nowhere as existing supply

   Location: `packages/DrinfeldModulesAndTModulesPartII/README.md:7` ("This Part II begins at the depth-one boundary of DrinfeldModulesAndTModules: DM.0 fixes Carlitz products; DM.2 fixes C∞ ... These objects belong to that supplier"); also line 60 ("The depth-one boundary is the following exact contract").

   Claim: a roadmap DrinfeldModulesAndTModules with sections DM.0, DM.2, DM.4, DM.6, DM.8 fixes the depth-one theory.

   Witness: no folder `TauCetiRoadmap/DrinfeldModulesAndTModules` or `Completed/DrinfeldModulesAndTModules` on main (bbed953); `roadmaps list` (366 entries) has no such roadmap; `roadmaps show 'DrinfeldModulesAndTModules'` prints nothing; the board's packages index lists only this Part II; the only occurrences of the name elsewhere are as a future consumer in FunctionFieldArithmetic (rev/1474 README line 3107) and GlobalShtukasAndFunctionFieldLanglands (rev/1490 README lines 29, 2211). The merge order has no such line. Both earlier reports (PKG line 52, FIX "For the maintainer") recorded the same fact. All thirteen DM citations are covered by declared gaps in `design/plan.json` and the README (checked slug by slug: DM.0/carlitz-products, DM.2 and DM.2/omega, DM.4/inverse-twist-dual-motive, DM.6 and DM.6/small-power-sum and DM.6/v-adic-special-values, DM.8 and DM.8/abp-lifting, entire-from-equation, constant-denominator, fundamental-matrix), so the dependencies are declared; the overclaim is the prose, which sends a reader to look for sections that do not exist.

   Repair: in README line 7 replace "This Part II begins at the depth-one boundary of DrinfeldModulesAndTModules: DM.0 fixes Carlitz products; DM.2 fixes C∞, the exponential, logarithm, period and Ω; DM.4 fixes effective dual t-motives; DM.6 gives the small-exponent power sums; DM.8 gives the analytic twist, entire-series and ABP interfaces. These objects belong to that supplier, with their exact contracts below." by "This Part II begins at the depth-one boundary of DrinfeldModulesAndTModules, a roadmap that is not yet written: every depth-one object used here (Carlitz products, C∞ with the exponential, logarithm, period and Ω, effective dual t-motives, small-exponent power sums, the analytic twist, entire-series and ABP interfaces) is a declared supplier gap below, named by the section the parent is expected to have (DM.0, DM.2, DM.4, DM.6, DM.8)." In line 60 replace "The depth-one boundary is the following exact contract." by "The depth-one boundary is the following exact contract on a roadmap that does not yet exist; each item is a declared gap."

3. **F03** (P3) `character_roots_independent` is not a headline theorem

   Location: `packages/DrinfeldModulesAndTModulesPartII/Suggested.lean:321-335` (docstring at 321, `theorem character_roots_independent` at 323); README line 1277 ("The roots-of-characters part is `character_roots_independent`").

   Claim: it is a headline signature of §5.8.

   Witness: the statement mentions none of the roadmap's objects (no value, index family or weight space); it is IKLNDP24 Lemmas 3.1–3.2 (IKLNDP24 line 3844), an elementary fact about a finite constant-field extension of F_q((1/θ)) (F_q-independent elements of F_{q^m} stay independent over K∞ because K∞ ⊗_{F_q} F_{q^m} is a field). The brief's rule: a theorem about free variables whose conclusion is algebra on its hypotheses is not a headline.

   Repair: delete the declaration (lines 321–335, docstring included) from `Suggested.lean`; in README §5.8 delete the sentence beginning "The roots-of-characters part is `character_roots_independent`." up to "the specialisation formula of §3.5." (line 1277). The README keeps the statement as a target.

4. **F04** (P3) `two_row_rigidity` is an intermediate coefficient lemma on free polynomial variables

   Location: `packages/DrinfeldModulesAndTModulesPartII/Suggested.lean:239-258` (docstring at 239, `theorem two_row_rigidity` at 241); README lines 1150 ("The headline `two_row_rigidity` states this exact polynomial system") and 1202.

   Claim: it is a headline of §4.7.

   Witness: its hypotheses and conclusion are a two-equation Frobenius system on arbitrary δ₁, δ₂ ∈ K̄[t], a₁, a₂ ∈ F[t] (ND21 (6.3)–(6.4), ND21 line 1403); it names no object of the roadmap; the theorem it serves, `q_indivisible_independent` (§5.3), is stated at line 270. I verified the statement itself by hand (endpoint k = q − 1: a(t−θ)^{2q}, a(t^q − t), δ₂ = 0; interior case: δ₁ = 0, f = (k−1)a₁, a₁ = 0), so this is padding, not an error.

   Repair: delete the declaration (lines 239–258, docstring included) from `Suggested.lean`; in README §4.7 delete the paragraph "The headline `two_row_rigidity` states ... sends θ to θᑫ." (line 1150). The README keeps the statement as a target, with its q = 3 Check.

5. **F05** (P2) Thakur's product theorem (§1.7) is statable at the pins and absent

   Location: `packages/DrinfeldModulesAndTModulesPartII/Suggested.lean` (module docstring lines 1–20 and Layer list); README §1.7 line 555.

   Claim: the file states every headline that is statable with the kept definitions, and names the rest in its docstring.

   Witness: §1.7 is Thakur's shuffle theorem (THAKUR10 Theorem 3(ii)–(iii), THAKUR10 line 230: products of multizeta values are sums of multizeta values preserving total weight), the main theorem of Layer 1 and one of the Summary's stations (line 3, "product relations"). Its weight-graded form Z_w·Z_{w′} ⊆ Z_{w+w′} and AZ_w·AZ_{w′} ⊆ AZ_{w+w′} needs only `zetaSpace`, `alternatingZetaSpace` and the product of submodules of a `RatFunc F`-algebra, which Mathlib has at the pin (`Mathlib/Algebra/Algebra/Operations.lean:214`, `instance mul : Mul (Submodule R A)`; `RatFunc.CompletionAtInfty F` derives `Algebra (RatFunc F)`). The docstring does not list it as unstatable.

   Repair: add to Layer 2 of `Suggested.lean` (before `brown_spanning`), untested for elaboration since this pass runs no Lean:

   ```lean
   /-- Thakur's shuffle theorem in weight-graded form: the product of two ordinary
   (resp. alternating) MZV weight spaces lies in the space of the summed weight
   (Thakur 2010, Theorem 3). -/
   theorem zeta_space_mul_le (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)]
       (w w' : ℕ) :
       zetaSpace F w * zetaSpace F w' ≤ zetaSpace F (w + w') ∧
         alternatingZetaSpace F w * alternatingZetaSpace F w' ≤
           alternatingZetaSpace F (w + w') := by
     sorry
   ```

   and in README §1.7 after the statement: "The weight-graded form is `zeta_space_mul_le`." Tested on the instance that motivates it: at q = 2, ζ_A(1)ζ_A(2) = ζ_A(3) + ζ_A(1, 2) ∈ Z_3 (recomputed to u¹³) and at q = 3, ζ_A(2)² = ζ_A(4) + 3ζ_A(2, 2) ∈ Z_4 (recomputed to u¹⁰).

## Verified sound

- **Declarations read:** 36 of 36, each compared with the elaborated type in the worker's signatures file and with its README statement; no binder lost (the file has no section variables). `frobeniusResidual` reproduces (E_M) on the descended carrier: residual at a tree node u is f_u(θ^q) − (f_u + Σ_{1≤n≤w} f_{(u,n)})(t−θ)^{w−wt(u)}, with off-tree coordinates forced to zero by the kernel; this is CCM23 Definition 4.3.3 after Lemma 4.2.3's descent to F_q(t)[θ]. `twisted_system_rigidity` is the forward twist of IKLNDP24 (3.4)–(3.5) (IKLNDP24 lines 4164–4171, γ^{(−1)} inside the inverse twist becomes γ). `two_row_rigidity` is the forward twist of ND21 (6.3)–(6.4) with H_k = H_{q−1} = 1 and H_w untwisted. `directIndices` matches the Note's I′_w clause by clause (IKLNDP-NOTE lines 191–207) and the character rule (lines 208–214). `zeta_algebra_graded` is Chang Theorem 2.2.1(1) (CHANG14 line 228); its validity in any E with compatible K-embeddings holds because the compositum K̄·K∞ in E is K∞-isomorphic to the one in C∞ by a K-automorphism of K̄. `character_roots_independent` is true (constant-field linear disjointness) though not a headline (R03).
- **Targets read:** 68 of 68 (14 + 8 + 13 + 12 + 7 + 14), every Needs line checked: all internal references point to earlier sections; no forward reference; no cycle.
- **Adversarial pass (values computed):**

| Statement | Instances | Computed | Result |
|---|---|---|---|
| Conventions ℓ₁, D₁ | q = 3 | ℓ₁ = θ−θ³, D₁ = θ³−θ, ℓ₁+D₁ = 0 | holds |
| Ω⁽¹⁾(θ), ζ_A(2)/π̃² | q = 3 | Ω⁽¹⁾ = Ω/(t−θ^q) ⇒ π̃⁻¹/ℓ₁ = −π̃⁻¹/D₁; 1/e_C(z) = 1/z + Σ_{(q−1)|m} ζ(m)z^{m−1}/π̃^m gives −1/D₁ | holds |
| Generating series gap | d = 0; d = 1 | (1−x)⁻¹; Σ_c 1/(θ+c−x) = 1/(ℓ₁ + x^q − x) | holds |
| log_C term size | general | q^{q/(q−1)}(abs z / q^{q/(q−1)})^{q^d} | holds |
| S₁(1) | q = 4 | derivative of θ⁴−θ is 1 in char 2 ⇒ 1/(θ⁴−θ) | holds |
| S₁(4), Li(4)−ζ(4) | q = 3, numeric to u¹⁰ | S₁(4) leads 2u⁶; difference leads u⁶ | holds |
| Li(1,2) = ζ(1,2) | q = 3, numeric | zero to u¹⁰ | holds |
| D_s witness (2,2), z = (1, θ⁴) | q = 3 | exponent −3·3^{d₁} + 3^{d₂} ≤ −8·3^{d₂} | holds |
| d(w), s(w), t(w), c(w) | q = 2, 3, 4; w ≤ 3q−2 | enumerated: d = 1,1,2,3,5 (q=2); 1,2,3,6,11,20,37 (q=3); s(4) = 46, s(7) = 1042 (q=3); t(4) = 48 | holds |
| Δ coefficients | q = 2: Δ¹₁,₂ = 1, Δ²₁,₂ = 0; q = 3: Δ²₂,₂ = −2 = 1; Δ^{q−1}_{1,q−1} = 1+(−1)^q | as stated | holds |
| ζ(1)² | q = 2, 3 numeric | = ζ(2) (q=2); = ζ(2)+2ζ(1,1) (q=3), zero to u¹³/u¹⁰ | holds |
| ζ(2)² | q = 3 numeric | = ζ(4) + 3ζ(2,2) (stuffle 2 + correction 1) | holds |
| R₁ induction identity | d = 0, 1 | Σℓ_j^{1−q} = −(θ−θ^{q^{d+1}})/(D₁ℓ_d^{q−1}) | holds |
| ζ(1)ζ(2), ζ(1)ζ(1,1) | q = 2 numeric/by hand | ζ(3)+ζ(1,2) exact to u¹³; ζ(1,1,1)+ζ(2,1)+ζ(1,2) | holds |
| C₍₁₎(R₁) | q = 2 | S_d(3) + D₁S_{d+1}(1,2) = 0 ⇒ ζ(3) = D₁ζ(1,2) | holds |
| ζ(3) reduction | q = 2 | from the two relations: ζ(3) = D₁²(ζ(1,1,1)+ζ(2,1)); numeric residual only beyond lost precision | holds |
| BC_q(R₁) fixed parts | q = 2, d = 1 | 0, D₁⁻³, D₁⁻²; 0 − D₁·D₁⁻³ = D₁⁻² | holds |
| U^ζ(3), U^ζ(1,2) | q = 2 | D₁[1,2]; D₁([1,1,1]+[2,1]) | holds |
| 2.13 relation | general: Δ^{q−1}_{q,q−1} = (−1)^q = −1 in F_p, Δ^{2q−2}_{q,q−1} = 0, 2(1+(−1)^q) = 0; q = 3 numeric: ζ(5)+D₁ζ(1,4) termwise d = 2 zero | as stated | holds |
| H_{q+k−1} | 2 ≤ k ≤ q−1; q = 3, k = 2 | 1 + (k−1)γ₁/D₁ with Γ = D₁; H₄ = 2t³−t−θ³ | holds |
| deg_θ H_n bound | ND indexing | Chang Thm 5.5.1 gives deg_θ H^{Ch}_{n} ≤ nq/(q−1); H^{ND}_s = H^{Ch}_{s−1} | holds |
| Gauss norm of 𝔏 term | general | ∏_j c_j^{q^{d_j}}, c_j = ‖Q_j‖/|θ|^{qs_j/(q−1)} | holds |
| Ψ⁽⁻¹⁾ = ΦΨ | depth k | 𝔏(s₁..s_k)⁽⁻¹⁾ = 𝔏 + Q_k⁽⁻¹⁾(t−θ)^{s_k}Ω^{s_k}𝔏(s₁..s_{k−1}) | holds |
| det Φ | s = (2,1) | (t−θ)³(t−θ) = (t−θ)⁴ | holds |
| 𝓛(1) at θ, θ² | q = 2 | −1/D₁, 1/D₁² | holds |
| X_w, w = q−1 | general | root t^q−θ, leaf t−t^q: both sides (t−θ)^q | holds |
| X_1 | q = 3 | a = (a+b)(t−θ) ⇒ a = b = 0 | holds |
| twisted system, w = q−1, full tree | general γ, solved by hand | δ_∅ = −α(t−θ)^q, leaf b = α(t^q−t)/γ ∈ F_q[t] ⇒ γ ∈ F_q^× or α = 0 | rigidity holds; q = 3 residual (1−γ)(t−t³)(t−θ³)² confirmed |
| two-row endpoint | k = q−1 | G = a(t−θ)², f = 0, a₁ = a(t^q−t); q = 3 check (t−θ)⁶ + (t³−t)(2t³−t−θ³) = (t−θ³)² | holds |
| two-row interior | 2 ≤ k < q−1 | δ₁ = 0, f = (k−1)a₁, a₁(t^q−t) = 0 ⇒ a₁ = f = 0 | holds |
| directIndices counts | q = 3: w = 4..7; q = 2: w = 3, 4; q = 4: w = 10 | 6/46, 11/130, 20/368, 37/1040 (s(7) = 1042); {(1,1,1),(1,2)}, 3; 372/733902 (s = 733908) | holds |
| (4,3),(2,5) in, (7),(2,2,3) out; (2,3,1),(1,2,3) in, (3,2,1) out; (2,3) in, (5) out | q = 3 | as stated | holds |
| q = 2, w = 4 old rule | numeric to u¹³ | ζ(1,1,2) + D₁(ζ(1,1,1,1)+ζ(1,2,1)) residual only beyond lost precision | holds |
| Eulerian valuations | general | v(π̃^w) = −wq/(q−1) ∈ ℤ iff (q−1) | w | holds |
| weight-0 cases of all 23 theorems | w = 0 | Composition 0 is a singleton; every family is {1}; `thakurIndices q 0`, `indivisibleIndices q 0` contain the empty composition; `toddNumber q 0 = 1`; `frobenius_solution_dimension` gives 1 since (q−1) | 0 | consistent |
| q = 2 degenerate cases | `twisted_system_rigidity` (hypothesis false), `q_indivisible_independent` (hq excludes), `direct_small_weight_independent` (w ≤ 4, three listed tuples) | as stated | consistent |

- **Locators verified:** 104 line locators across the 19 sources checked against the page markers (all consistent); 22 theorem or definition statements read in full against the roadmap's wording (CCM23 Theorem 4.3.5, Definition 4.3.3, Lemma 4.2.2, Corollary 3.2.5, Theorem 5.2.1; CHANG14 Definition 3.4.1, Theorems 2.2.1, 3.4.5, 5.5.1, Proposition 5.4.1, Lemma 5.3.5, Definitions 5.1.1, 5.1.3; ND21 Theorems A, B, D, Corollary C, (6.3)–(6.4); IKLNDP24 Theorems 1.11, 3.4, 3.6, 4.9, Propositions 4.10, 4.11, 4.13, (3.4)–(3.5), (3.9); IKLNDP-NOTE I′_w, J′_w, Theorem 1.6; THAKUR09R Theorem 5; THAKUR10 Theorem 3; THAKUR09P Theorem 4; CPY19 Propositions 2.2.1, 2.3.3; PAP08 Lemma 3.3.2, §4.1.6; ABP04 Theorem 3.1.1, Proposition 3.1.3; CM21 Theorem 1.2.2; CCM-ALG Theorem 1.2.3). Manifest: 19 entries, all `certified`, licence classes open-repository or author-page.
- **Checks tested:** 46 Checks recomputed (listed in the table); none false, vacuous or a restatement. Every Lean definition has at least three discriminating Checks in its section.
- **Sibling citations checked:** PeriodsAndSpecialValues §PS.9.1–9.4 exist at rev/1496 (README lines 1989–2062; PS.9.2 is the stuffle word algebra over ℚ on H¹, so the integer-coefficient gap is needed and minimal); RestrictedPowerSeries §§0.1–0.3, 1.1–1.2, 2.1, 7.2 exist on main (lines 193–723); the 13 gaps on DrinfeldModulesAndTModules are declared with identical slugs in `design/plan.json` and the README and each `needs` sentence is precise and single-purpose; the PeriodsAndSpecialValues gap likewise. Ownership by object (`roadmaps grep` for Thakur, multizeta, Anderson–Thakur, Carlitz over main and the 365 open heads, and the sibling checkouts): no competing owner of function-field MZVs, power sums, the Frobenius difference systems or the index families. No `Suggested.lean` elsewhere declares any of the 36 names.
- **Mathlib and Tau Ceti at the pins:** `RatFunc.CompletionAtInfty` (Valuation.lean:138, derives `Field`, `Algebra (RatFunc F)`), `inftyValuation.X`, `.X_inv`, `.polynomial`, `FiniteField.frobeniusAlgHom` (Finite/Basic.lean:333, x ↦ x^{#K}), `sum_pow_units` (line 290, −1 iff (q−1) | i), `card'`, `Composition`, `blocksFun`, `sizeUpTo`, `composition_card`, `Polynomial.comp`, `mapRingHom`, `Monic`, `iSupIndep` (SupIndep.lean:328), `Finsupp.single`, `Submodule.span`, `Nat.choose` all exist in the cited files; `TauCeti.PowerSeries.norm_eq_gaussNorm`, `norm_coeff_mul_pow_le`, `norm_C`, `norm_X` (the last with `NormOneClass`) exist in `TauCeti/RingTheory/PowerSeries/TateAlgebra.lean`.
- **Policy:** `git diff --stat origin/main...HEAD` touches only `packages/DrinfeldModulesAndTModulesPartII/` (README, Suggested.lean, design/plan.json gaps only, metadata.toml, two reports, sources.toml); no pull-request numbers or process words in README or docstrings; `theorem` only; no `set_option`; single `import Mathlib`; no computational algorithm. Every target has a locator.
- **Dependency check** (run on this head, complete output):

  ```text
  depcheck: 54 roadmaps, 598 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line. `roadmaps resolve`: no cross-roadmap citation and no Lean name unresolved.

## Not verifiable

- Whether DrinfeldModulesAndTModules exists at a design stage invisible to this pass (no folder, no open pull request, no board package); the brief's gap list treats it as the named supplier. Ownership against board packages on other branches (the 20-entry index) was not checked; ownership against open pull requests was checked only through `roadmaps grep` and `roadmaps show`.
- IKLNDP24 Case 1 of the proof of Theorem 3.4 (the (q−1) ∤ w half of `twisted_system_rigidity`) for weights beyond q − 1 and 1, and the block-matrix step of CCM23 Theorem 4.3.5 for ℓ ≥ 2: taken from the sources, not recomputed.
- Elaboration of the Lean repair text in R05: this pass runs no Lean.
- The published numbering of CCM23 and IKLNDP24 (the README records the preprint-to-journal shifts); only the arXiv texts were read.

## Source issues

- **Misprint** in CHANG14 at Definition 3.4.1 and Theorem 3.4.5, printed pp. 8–9: the source says the MZ property is defined for nonzero elements of k_∞; it should be the completed algebraic closure C_∞, since Proposition 5.4.1 (p. 16) applies the property to Carlitz multiple polylogarithms at algebraic points, which lie outside k_∞; affects nothing.
- **Misprint** in CPY19 at Proposition 2.2.1, printed p. 6: the source says the matrix of the k̄(t)[σ]-module homomorphism between the rationalised Frobenius modules has entries in k̄[t]; it should be k̄(t), the ring over which the modules are defined; affects nothing (the proof bounds its denominator).
- **Error** in THAKUR10 at Theorem 3, proof display, printed p. 1979: the source says the fourth equality of the display follows from the depth-one shuffle; it does not, the vector-notation induction being set up wrongly; it should be replaced by an induction proving the mixed identity first at each depth; affects the proof; corrected in print at THAKUR-UPDATES entry 36, pp. 7–8.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9500295f50d3ee0b34eea0f8d44847758e13689c", "job": "RT-DrinfeldModulesAndTModulesPartII~1b", "model": "fable", "worker": "chris-k"} -->
