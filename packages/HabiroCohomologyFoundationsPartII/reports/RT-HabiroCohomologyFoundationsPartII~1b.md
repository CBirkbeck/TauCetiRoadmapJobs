<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/151#issuecomment-6335960744 -->
Red team round 1 pass b (claude) of 755e915

Verdict: needs_changes

1. **F01** (P2) Habiro completion is attributed to HabiroRings, and the family order is stated backwards

   **Location:** `packages/HabiroCohomologyFoundationsPartII/README.md:29`: “Within this family the supplier order is HabiroCyclotomicCompletions, HabiroRings, HabiroCohomologyFoundations, RefinedTraceMethods, then this roadmap.”; `README.md:81`: “HR.1–HR.2. Perfectly covered Λ-rings, derived Habiro completion and the completed tensor product.”; `README.md:168`: “an object of the Habiro-complete derived category of A[q] (HabiroRings HR.2)”.

   **Claim:** The README places HabiroRings before HabiroCohomologyFoundations and makes HabiroRings the owner of the Habiro-complete derived category, derived Habiro completion and the completed tensor product. The HabiroRings package itself says the opposite on both points: it consumes HabiroCohomologyFoundations Layer 0 and §§4.21/4.28, disclaims Habiro-complete modules and the reflection L_H in favour of HabiroCohomologyFoundations §0.1, and states the family order with HabiroCohomologyFoundations before HabiroRings. HabiroCohomologyFoundations agrees (its Layer 0 row says HabiroRings uses its contracts afterwards). So `traceHabiro` (§1.3) cites the wrong owner for its target category, and the order sentence contradicts both suppliers; if the three contracts become declared gaps (pass a F02), the gap for the Habiro-complete category would be announced on the wrong supplier.

   **Witness:** `packages/HabiroRings/README.md:13` (board head 75ba3e1): “HabiroCohomologyFoundations Layer 0. §0.1 owns Habiro-complete modules over A[q] for every commutative ring A, the reflection L_H …”; `packages/HabiroRings/README.md:23`: “The family order is HabiroCyclotomicCompletions → QWittVectors → HabiroCohomologyFoundations I → HabiroRings → RefinedTraceMethods → HabiroCohomologyFoundations II.”; `packages/HabiroCohomologyFoundations/README.md:29` (board head 0220c88): “HabiroRings subsequently uses these cohomological contracts”.

   **Exact repair text:** README:29: “Within this family the supplier order is HabiroCyclotomicCompletions, QWittVectors, HabiroCohomologyFoundations, HabiroRings, RefinedTraceMethods, then this roadmap.” README:81: “- **HR.2.** The Laurent-convention comparison for Habiro completion, the ordinary/derived comparison of §2.4 and the completed coefficient base change of §2.5; the Habiro-complete derived category of A[q], its reflection L_H and its completed symmetric monoidal tensor are HabiroCohomologyFoundations §0.1 and are cited there.” README:168: “an object of the Habiro-complete derived category of A[q] (HabiroCohomologyFoundations §0.1)”. Make the same replacement wherever HR.2 is cited for Habiro completion (§1.3 *Needs:* line 200 and Dependencies line 208: add “HabiroCohomologyFoundations §0.1”).

2. **F02** (P2) `TraceInversion.etale` restates a HabiroRings target the same section imports

   **Location:** `packages/HabiroCohomologyFoundationsPartII/README.md:383`: “`TraceInversion.etale` (R is étale over ℤ and finite étale over ℤ[1/Δ])”.

   **Claim:** The first clause, “𝒪_F[1/Δ] is étale over ℤ when disc(F) | Δ”, is already a named HabiroRings target, and README:367 itself imports it from there (“The condition disc(F) | Δ makes R étale over ℤ (HabiroRings, number-field coefficient section)”). Stating it again as a target of this roadmap is duplication by object. Note that pass a F08 asks to add exactly this clause to `Suggested.lean` as a sorried theorem; doing so would mirror a supplier's theorem rather than this roadmap's own target. Only the second clause (finite étale over ℤ[1/Δ], which follows from étaleness over ℤ by base change plus finiteness of 𝓞 F over ℤ) is new here.

   **Witness:** `packages/HabiroRings/README.md:1750` (board head 75ba3e1): “`etale_localization_away_discr`: For F a number field and nonzero Δ with disc(F)∣Δ, any localization of 𝒪_F away from Δ is étale over ℤ.”

   **Exact repair text:** README:383: “Provide `TauCeti.QHodge.Trace.TraceInversion`, `TraceInversion.isUnit_two_three`, `TraceInversion.finiteEtale` (R is finite étale over ℤ[1/Δ]: finite because 𝓞 F is a finite free ℤ-module, étale by base change of HabiroRings §5.8 `etale_localization_away_discr` along ℤ → ℤ[1/Δ]), `TauCeti.QHodge.Trace.genuineRealisation` (the ring P_R) and `genuineRealisation.epsilon` (the imported ε_R).” If a Lean mirror is added for pass a F08, state it for the ℤ[1/Δ]-algebra, not for `Algebra.Etale ℤ (Localization.Away (Δ : 𝓞 F))`, which is the supplier's statement.

3. **F03** (P3) RefinedTraceMethods §8.12 does not exist

   **Location:** `packages/HabiroCohomologyFoundationsPartII/README.md:27`: “Syntomic trace comparisons are supplied by RefinedTraceMethods Layer 8, especially §8.12, and are not additional targets here.”

   **Claim:** Layer 8 of RefinedTraceMethods has eight subsections, §8.1–§8.8; there is no §8.12. The syntomic material is §8.7.

   **Witness:** `packages/RefinedTraceMethods/README.md:3771` (board head 86b0104) “## Layer 8: Arithmetic trace filtrations”, `:3956` “### 8.7 Characteristic-p TC and syntomic K-sheaves”, `:4004` “### 8.8 The coherent Habiro trace interface”, `:4028` “## Layer 9 …”.

   **Exact repair text:** “Syntomic trace comparisons are supplied by RefinedTraceMethods Layer 8, especially §8.7, and are not additional targets here.”

4. **F04** (P3) The high-powered Check is statable at the pins and has no Lean mirror

   **Location:** `packages/HabiroCohomologyFoundationsPartII/README.md:249`: “High-powered integers: 1, 9, 16 and 64 satisfy the condition at every prime divisor, while 8 (v₂ = 3), 32 (v₂ = 5) and 12 (v₃ = 1) do not”.

   **Claim:** With `E1QuotientExponent` and Mathlib's `Nat.factorization` every one of these seven instances is a closed statement at the pinned Mathlib, and `Suggested.lean` mirrors none of them (its two `E1QuotientExponent` examples test only direct values at (2,2), (2,5), (2,4), (3,2) and the E₂ ⇒ E₁ implication). Pass a F07 covers the direct-value gaps; this Check is a different statement (through prime factorisation) and is the one that ties §2.1 to RefinedTraceMethods §7.6.

   **Witness:** In a probe copy at the pinned Mathlib (`6b7abb3c7686292736be2955bd3eb9ebf63b456a`) the six statements below elaborated with no diagnostics (64 is the same proof as 16 with `2 ^ 6`).

   **Exact repair text:** Replace the first `E1QuotientExponent` example by (keeping at most two examples for the definition):

   ```lean
   /-- README §2.1, high-powered integers: `16` and `9` pass the exponent condition at every prime
   divisor (so does `1`, vacuously), while `8`, `32` and `12` fail at `2`, `2` and `3`. -/
   example :
       (∀ p : ℕ, p.Prime → p ∣ 16 → E1QuotientExponent p (Nat.factorization 16 p)) ∧
       (∀ p : ℕ, p.Prime → p ∣ 9 → E1QuotientExponent p (Nat.factorization 9 p)) ∧
       (∀ p : ℕ, p.Prime → p ∣ 1 → E1QuotientExponent p (Nat.factorization 1 p)) ∧
       ¬ E1QuotientExponent 2 (Nat.factorization 8 2) ∧
       ¬ E1QuotientExponent 2 (Nat.factorization 32 2) ∧
       ¬ E1QuotientExponent 3 (Nat.factorization 12 3) := by
     refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
     · intro p hp h
       have h2 : p = 2 := (Nat.prime_dvd_prime_iff_eq hp Nat.prime_two).mp
         (hp.dvd_of_dvd_pow (show p ∣ 2 ^ 4 by norm_num; exact h))
       subst h2
       rw [show (16:ℕ) = 2 ^ 4 by norm_num, Nat.Prime.factorization_pow Nat.prime_two]
       simp [E1QuotientExponent]
       decide
     · intro p hp h
       have h3 : p = 3 := (Nat.prime_dvd_prime_iff_eq hp Nat.prime_three).mp
         (hp.dvd_of_dvd_pow (show p ∣ 3 ^ 2 by norm_num; exact h))
       subst h3
       rw [show (9:ℕ) = 3 ^ 2 by norm_num, Nat.Prime.factorization_pow Nat.prime_three]
       simp [E1QuotientExponent]
     · intro p hp h
       exact absurd (Nat.dvd_one.mp h) hp.one_lt.ne'
     · rw [show (8:ℕ) = 2 ^ 3 by norm_num, Nat.Prime.factorization_pow Nat.prime_two]
       simp [E1QuotientExponent]
     · rw [show (32:ℕ) = 2 ^ 5 by norm_num, Nat.Prime.factorization_pow Nat.prime_two]
       simp [E1QuotientExponent]
       decide
     · rw [show (12:ℕ) = 3 * 4 by norm_num, Nat.factorization_mul (by norm_num) (by norm_num)]
       simp [E1QuotientExponent, Nat.Prime.factorization_self Nat.prime_three,
         Nat.factorization_eq_zero_of_not_dvd (by norm_num : ¬ 3 ∣ 4)]
   ```

   (The six conjuncts were verified as separate examples; the conjunction only packages them.)

5. **F05** (P3) The docstring attributes the inversion of 3 to KU Theorem 5.63

   **Location:** `packages/HabiroCohomologyFoundationsPartII/Suggested.lean:91`–`93`: “Under the trace inversion condition, `2` and `3` are units of `𝓞 F[1/Δ]` … This is the extra inversion of KU Theorem 5.63 used by Corollary 6.15.”

   **Claim:** KU Theorem 5.63 adds only 2 ∈ R^× (and the coherence (A₂)) to the standing assumptions; the README says so itself at lines 75, 189 and 367. The source's hypothesis 6 | Δ in Corollary 6.15 is not explained by Theorem 5.63, as the RefinedTraceMethods package records. The docstring therefore overclaims the source for the unit 3.

   **Witness:** KU Theorem 5.63, p.79 (hypotheses: 4.18, 2 ∈ R^× and 5.43(A₂)); `packages/RefinedTraceMethods/README.md:3475` (board head 86b0104): “Why 3 | Δ is required is not explained in the source; the hypothesis is kept as stated.”

   **Exact repair text:** “/-- Under the trace inversion condition, `2` and `3` are units of `𝓞 F[1/Δ]`: the integer `Δ` becomes a unit, `6` divides it, and a product of commuting elements is a unit exactly when both factors are. The unit `2` is the inversion KU Theorem 5.63 needs; the unit `3` comes from the hypothesis `6 ∣ Δ` of KU Corollary 6.15, which the source states without explaining the role of `3`. -/”

6. **F06** (P3) Process word “current” in the Tau Ceti supplier contract

   **Location:** `packages/HabiroCohomologyFoundationsPartII/README.md:53`: “The current Tau Ceti library and the current TauCetiRoadmap roadmaps contain no Habiro, q-Hodge, spherical-lift, THH or Nygaard carrier.”

   **Claim:** “current” is a process-narrative word the README form excludes; the sentence is about the pinned library and the roadmaps on main, which are timeless.

   **Witness:** The pinned Tau Ceti (`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`) and the roadmaps on the content repository's `main` have no such carrier (grep for `QHodge`, `Habiro`, `THH`, `Nygaard`, `SphericalLift`), so only the wording needs to change.

   **Exact repair text:** “No Tau Ceti declaration is used. Tau Ceti at the pin and the roadmaps on main contain no Habiro, q-Hodge, spherical-lift, THH or Nygaard carrier.”

## Verified sound

**Package read.** All 462 README lines (four layers, ten numbered subsections, five bold targets, 51 Check bullets, the Remarks on the sources and ten References) and all 111 lines of `Suggested.lean` (8 declarations: 3 definitions with real bodies, 4 proved examples, 1 proved theorem; single `import Mathlib`, no `TauCeti.*` import, no `set_option`, no `lemma`, no `def := sorry`, no `#eval`/`#print`, at most two examples per definition, module docstring and `namespace TauCetiRoadmap.HabiroCohomologyFoundationsPartII` in the required form, Layer section comments in README order). Every Lean name (`E1QuotientExponent`, `E2QuotientExponent`, `TraceInversion`, `TraceInversion.isUnit_two_three`) occurs in the README; the title keeps “Habiro” capitalised; no LaTeX delimiters; no issue numbers (the pull-request URLs are pass a F01).

**Elaboration.** `Suggested.lean` as submitted elaborated in a probe copy against the content checkout's Lake setup (Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`): exit 0 with no diagnostics at all (the file contains no `sorry`, so there are no sorried theorems to test for triviality). The eight cited Mathlib names exist at the pin (`Rat.numberField_discr` in `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean`, `IsLocalization.Away.algebraMap_isUnit`, `isUnit_of_dvd_unit`, `Commute.isUnit_mul_iff`, `Algebra.Etale`, `Algebra.Smooth`, `NumberField.discr`, `Nat.factorization`).

**Lean statements versus README (adversarial).** `E1QuotientExponent`/`E2QuotientExponent`: total on ℕ, the `p = 2` branch first, else the lower bound; on primes they are the displayed conditions; the non-prime branch is documented (README:223). Instances tried: p = 0, 1, 2, 3, 4; α = 0…7. The ranges match Burklund (Theorem 1.4 with v = y at odd p: T/y^q is Eₙ for q > n, so E₁ for α ≥ 2 and E₂ for α ≥ 3; Remark 5.5/5.7 with v = y² at 2: T/y^{2q}, so E₁ for even α ≥ 4 and E₂ for even α ≥ 6), KU Example 6.8 (pp.82–83, both the E₂ and the E₁ ranges with “R p-torsion free” for the (E₁) cover, exactly as `quotientLift_framed` states), QH Remark 4.23 (p.63), TC 3.3 (p.30: E₁ definition of high-powered) and TC Remark 3.6 (p.31: the E₂ range), and Wagner's thesis (same ranges). α = 0 gives the zero ring and is excluded by both predicates; r = 0 gives T. The sufficient-not-necessary bullet (README:248) agrees with Bu Theorem 1.1 (S/8 is E₁) and Remark 5.7 (v = 4 gives Eₙ on S/2^{2(n+1)} only). `TraceInversion`: the three conjuncts are the hypotheses of KU Corollary 6.15 (Δ divisible by 6 and by disc F) and GSWZ §1.4 (Δ a positive integer, p.6); instances ℚ with Δ = 6, 1, 0, −6 and ℚ(i) with Δ = 6, 12 (disc = −4), ℚ(∛2) with Δ = 108 (disc = −108 = −2²·3³) agree with README:387–390. `isUnit_two_three`: the proof is correct as typed, and no section variable is dropped (all binders explicit).

**README Checks recomputed (27).** §1.1: ℤ[1/2][x] admits `ofSpherical`, ℤ[x] does not (2 not invertible); R̂₂ = 0 for ℤ[1/2]; ℚ[u,v]/(u²,uv,v²) is Artinian non-Gorenstein (socle (u,v)), hence not lci, while every p-completion is zero and it is torsion free. §1.2: for A = R = ℤ, (F/β)^i = cofib(h : h^{i−1}ℤ[[h]] → h^iℤ[[h]]) is 0 for i ≥ 1 and ℤ for i ≤ 0, and the degreewise quotient leaves ℤ in every degree; for R = 0, dR_{0/ℤ} ⊗ 𝔽_p = dR_{0/𝔽_p} = 0 (conjugate filtration with L_{0/𝔽_p} = 0) and dR_{0/ℚ} = ℚ (animated Poincaré lemma), so dR_{0/ℤ} = ℚ, qdR_{0/ℤ} = ℚ[[h]] (h-complete with reduction ℚ), its filtration completion is 0, F/β is the constant ℚ, and fil_Hdg dR_{0/ℤ} is the constant ℚ since every Hodge graded piece of the zero ring vanishes; for A = ℚ, R = ℚ(i): dR = ℚ, fil^k_Hdg = (R/ℚ)[−1] for k ≥ 1, and the pullback ℚ[[h]] ×_{R[[h]]} h^kR[[h]] has H⁰ = h^kℚ[[h]] and H¹ = (R/ℚ)[h]/h^k; ℤ[x]: coordinate steps h^i, h^{i−1}dx. §1.3: h∇_q(x^r) = (q^r−1)x^{r−1}dx versus [r]_q, 0 versus 2 at r = 2, q = 1; mod h the differential vanishes (H⁰ = ℤ[x], H¹ = ℤ[x]dx) while H¹(Ω•_{ℤ[x]/ℤ}) = ⊕ℤ/r. §2.1: all six exponent bullets and the seven high-powered instances (also as Lean, F04). §2.2: δ^{(2)}_q(x,1) = (x−1)(x−q)/(1+q) ↦ (x−1)²/2. §2.3: 𝔽_p[x]/(x−1) ⊗_{𝔽_p[x],φ} 𝔽_p[x] = 𝔽_p[x]/(x^p−1) → 𝔽_p is onto; B = ℤ[x^{1/∞}] is relatively perfect and B/(x⁴) is torsion free with E₁ data at every prime, B/(x²) at odd primes only. §3.3: for M = (ℤ[x][[h]] → ℤ[x][[h]]dx, x^r ↦ (q^r−1)x^{r−1}dx), H⁰(M) = ℤ[[h]] so H⁰(M)/h = ℤ while H⁰(M/^Lh) = ℤ[x], and the Bockstein of x^r is [r]_q x^{r−1}dx, nonzero h-torsion in H¹(M); ℚ[x^{±1}]: qΩ has H¹ = ℚ[[h]]dx/x while qdR ≃ ℚ[[h]]; ℤ[x,y] needs 2 inverted for the canonical pair. §4.1–4.2: 7 inert in ℚ(i), i⁷ = −i, the twisted family φ_m(i) glues under GSWZ (13) (f_m(x+ζ_{pm}−ζ_m) = φ_p f_{pm}(x), p.7); x³−2 ≡ (x−3)(x²+3x+4) mod 5 (x = 3: 27−2 = 25 ≡ 0; the quadratic has discriminant 9−16 ≡ 3, a non-residue mod 5); Δ = 1 fails `TraceInversion` while ℤ is étale. All agree with the README.

**Source locators (109 verified).** The cached legal copies at the recorded source directory contain TC (author copy of Meyer–Wagner, dated 2026-02-05), Bu (arXiv 2203.14787v2), BS (1905.08229v4), BMS2 (1802.03261v2), HA (September 2017), Pri (1608.07142v4), the Stacks crystalline chapter and Wagner's thesis, but no copy of QH (2510.04782v2), KU (2510.06057v1) or GSWZ (2412.04241v2); those three were read from the arXiv PDFs of exactly the cited versions (fetched read-only for this pass, pages taken from the printed folios). QH (29 statements): 1.19 p.9, 2.9 p.16, Convention 3.1 p.20, Definition 3.2 p.20, Lemma 3.3 p.22, 3.5 p.22, Remark 3.6 p.22, 3.8 and Lemma 3.9 p.23, Theorem 3.11 p.25 (clauses (a),(b) as cited at README:168–176), Example 3.12 p.25, Corollary 3.13 p.27, Remark 4.4 p.55, Lemmas 4.6–4.7 pp.55–56, Lemma 4.18 p.61, Construction 4.21 p.62, Theorem 4.22 pp.62–63 (clause (b) exactly as `perfectedLiftNaive` states, p = 2 included), Remark 4.23 p.63, Example 4.24 p.63, Example 4.25 p.64, Lemma 4.26 p.64, Lemma 4.27 p.65, Construction 4.28 and Theorem 4.29 p.66, Remark 4.31 p.67, Construction A.12 p.75, A.14 p.76, B.1 p.77. KU (42): Theorems 1.2 and 1.4 p.3, 1.9 and 1.11 p.5 (the ku-lift counterexample, “we don't know any counterexample” for E₂ ku-lifts, and the non-commuting image-of-J diagram, as README:126 says), Theorem 1.14 p.7, Corollary 1.15 p.8, 3.1–3.2 p.24, Remark 3.10 and Proposition 3.11 p.27, 4.4 p.36, 4.7 p.38, Theorem 4.8 and Remark 4.9 p.39, Theorems 4.14, 4.16 and Remark 4.15 p.43 (issues (!) and (!!) in §4.2), Theorem 4.17 p.45 under the identity-cover assumptions of §4.3 (p-quasi-lci, E₁ lift, R/p relatively semiperfect), 4.18 p.46 with (A) and (R) exactly as README:105–107, 4.18a (R₂) p.49, 4.21 p.47, Lemma 4.22 and 4.23 p.48, 4.25 p.49, 4.26 and Theorem 4.27 and Remark 4.28 (E_{n−1}) p.50, Lemma 4.29 p.51, 5.43 p.70, Remark 5.62 and Theorem 5.63 p.79 (2 ∈ R^× and (A₂)), Example 6.1 p.81, Examples 6.7–6.8 p.82, Example 6.9 and Theorem 6.10 p.83, Lemma 6.11 p.84, 6.12 p.84, Lemma 6.13 p.85, Remark 6.14 and Corollary 6.15 p.86, Lemma A.1 p.87. GSWZ (6): §1.4 and Definition 1.1 with (12) p.6, (13)–(15) p.7, footnote 1 p.6 (φ_m = ∏φ_p^{v_p(m)} for abelian K), Remark 1.2 p.7. TC (6, cached author copy): 3.3 p.30, 3.4 pp.30–31, 3.5 p.31, Remark 3.6 p.31, Lemma 3.7 p.32 (its proof does assert vanishing rationalisations, which README:445 corrects), Corollary 3.8 p.32. Bu (7, cached): Theorem 1.1 p.1, Theorems 1.4–1.5 and footnote 4 p.2, Definition 5.1 p.11, Remarks 5.5 and 5.7 p.12. HA Theorem 7.5.0.6 p.1374 (cached). Pri Remark 1.2 and Lemma 1.3 p.3 (cached). Stacks Example 19.1, tag 07L7 (cached chapter). Nit not raised: README:231 and :238 cite “TC 3.4, p.31”; the paragraph begins on p.30.

**Suppliers.** Section labels and declaration names cited from the three Habiro-family packages exist at their board heads (HabiroCohomologyFoundations 0220c88: §§1.14, 1.16, 2.1–2.10, 4.1, 4.4, 4.8, 4.12–4.28, 5.2–5.8, 5.13–5.26, 8.18–8.19 and the 14 backticked names including `HabiroHodgeDescent`, `QHodgeFiltration.ofUnderived`, `naiveFiltration_baseChange` in §5.17; HabiroRings 75ba3e1: HR.k = Layer k anchors, §§2.4, 5.6, 5.8, 5.9, 7.3 and the 16 backticked names; RefinedTraceMethods 86b0104: §§6.1, 6.9–6.14, 7.6 (HighPowered is the arithmetic predicate of README:238) and 8.8 and the 18 backticked names; §8.12 is F03). StableHomotopyKTheory, QWittVectors, AInfCohomology and the three PrismaticCohomology roadmaps precede this package in `merge-order/ORDER.txt` (lines 3, 64, 50, 51–53); HabiroCyclotomicCompletions is line 63. Depcheck at this head:

```text
NOT IN ORDER: HabiroCohomologyFoundationsPartII (insert it after its last supplier)
depcheck: 9 roadmaps, 75 edges, 1 problem(s)
```

`HabiroCohomologyFoundationsPartII` is absent from `merge-order/ORDER.txt` (imported package; not a defect). No UPWARD or CYCLE line.

**Pass a findings not re-raised** (round 1 pass a, codex, 755e915): F01 pull-request URLs; F02 the three unowned suppliers; F03 stale pins; F04 missing `sources.toml`; F05 the p = 2 compatibility parameter; F06 the m = 0 index; F07 unmirrored E1 Checks; F08 missing `TraceInversion.etale` headline (see F02 above for its interaction with HabiroRings §5.8); F09 torsion-freeness in `quotientLift_perfected`; F10 the finite-coefficient Check; F11 QWittVectors ownership of perfect coverage; F12 example docstrings; F13 the degree-zero Check. My reading agrees with these; none is repaired at this head.

## Not verifiable

- No `sources.toml` at this head (pass a F04), so no source ids or sha256 values were available; QH, KU and GSWZ are not in the cached legal copies and were read from the arXiv PDFs of the cited versions instead. TC was verified against the cached author copy (dated 2026-02-05), whose numbering and pages agree with the README; its agreement with arXiv v4 was not checked.
- BS (Theorem 15.3, Proposition 15.7, Lemma 16.10, Theorem 16.22) and BMS2 (Theorem 1.12) are cited as supplied by the prismatic roadmaps; only their page markers were located in the cached copies, the statements were not re-read.
- The three Habiro-family suppliers are board packages, not roadmaps on `main` or in the merge order (pass a F02); their sections were checked for existence and wording at the board heads, not certified as merged contracts. In particular KU Theorem 4.17's hypotheses are stated in §4.3 of the source rather than in the theorem, so the identity-cover contract depends on RefinedTraceMethods §6.9 carrying them.
- The enhanced ∞-categorical targets of Layers 1–3 and the genuine-fixed-point realisation of Layer 4 have no carrier at the pins; they were checked for internal consistency and against the sources, not formally.
