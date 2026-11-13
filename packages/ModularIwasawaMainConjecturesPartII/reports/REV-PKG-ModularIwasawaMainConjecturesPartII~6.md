<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12963#issuecomment-6849494655 -->
Review (claude) of 804418a

Verdict: needs_changes

1. **F01** (P2) Layers 2–3 plan again what NonordinaryCMSpecialValues Layer 2 owns

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/README.md:11–12`: "Kato's CM theta functions, canonical CM pairs, standard elliptic units … Kato's realizations `V(ψ)`, `S(ψ)` … and his explicit reciprocity law for elliptic units"; §§2.2–2.6, 3.1–3.3.

   **Claim:** these constructions have no earlier owner and are targets of this roadmap.

   **Witness:** `packages/NonordinaryCMSpecialValues/README.md:12`, merge order line 345 (this roadmap: 378): it owns the same objects in its §§2.1–2.6 and says "the CM continuations of ModularIwasawaMainConjecturesPartII consume them from here". This README never names it.

   Object by object: `aθ_E` (its §2.1; here §2.2); canonical CM pairs, `a z_f`, the limit formula (15.5.1) (its §2.2; here §§2.3–2.5); `z_{p∞f}` with (15.6.3)–(15.6.5) (its §2.3; here §§2.5–2.6); `V_L(ψ)`, `S(ψ)`, `per_ψ`, (15.8.1) (its §2.4; here §3.1); the height-one law in Kato's applied form and Proposition 15.9 (its §§2.5–2.6; here §3.3 with gap:height-one-explicit-reciprocity). The two texts also disagree on the shared objects, so the overlap is not harmless: it writes `V_L(ψ) = H₁(E(ℂ), Q)^{⊗r} ⊗ L` and `per_ψ : S(ψ) → ℂ`, this README `H¹(E(ℂ), ℚ)^{⊗r} ⊗_K L` and `per_ψ : S(ψ) → V_L(ψ) ⊗ ℂ` (Kato line 5398 and Proposition 15.9, where `γ = β^{⊗(−r)}` with `β ∈ H₁`, support this README).

   **Exact repair:**

   1. Add a Scope deferral bullet and a contract `### From NonordinaryCMSpecialValues` citing its §2.1 (`aθ_E`, uniqueness, (15.4.1), (15.4.3)), §2.2 (canonical CM pair, universality, `a z_f`, integrality, (15.5.1)), §2.3 (`z_{p∞f}`, (15.6.3)–(15.6.5)), §2.4 (`V_L(ψ)`, `S(ψ)`, `per_ψ`, (15.8.1)) and §§2.5–2.6 (Proposition 15.9 in its range). State in the contract the dictionary between its `H₁`-form of `V_L(ψ)` and the `H¹`-form used here.
   2. In §§2.2, 2.3, 2.4, 2.5 (first display), 2.6 (definition of `z_{p∞f}`, first two bullets) and 3.1, replace "Define/Prove" of those objects by the citation. Keep as targets here only what that roadmap does not state, each with its one-clause difference:
      - the coprimality in (15.3.3) and in (15.4.2), which it states without restriction, and the reduction criterion of §2.3;
      - `a ζ_m` with its Euler-system relations, the module `z ⊂ h¹`, `J`, §2.7;
      - §3.2's invertibility hypothesis;
      - §3.3 at every prime. Its standing hypothesis for its Layer 2 is `p ≥ 5` inert with `p ∤ h_K` (its Conventions), so split and ramified `p`, `p = 2, 3` and `p ∣ h_K`, with the auxiliary-prime reduction, remain here.
   3. gap:height-one-explicit-reciprocity stays: that roadmap proves only the applied form in its own range.

   **Repair test:** dependency direction after the edit is NonordinaryCMSpecialValues (345) → this roadmap (378), no UPWARD edge. The instance that separates the kept variants: `K = ℚ(i)`, `f = (1 + i)^3`, `a = (1 + i)` gives annihilator `(f : a) = (1 + i)^2 ≠ f` (§2.3 Check), which the unrestricted (15.3.3) of the supplier does not exclude; `p = 2` lies outside the supplier's range and inside §3.3.

   For the maintainer (not this package's defect): InertAnticyclotomicCMMainConjecture declares `gap:elliptic-unit-euler-system` and `gap:inert-two-variable-main-conjecture` (Rubin's Theorem 4.1(ii)) with supplier NonordinaryCMSpecialValues (`packages/InertAnticyclotomicCMMainConjecture/README.md:69–71`), while this roadmap states both in §§4.1 and 4.8(ii). NonordinaryCMSpecialValues §2.1 ("Isogeny invariance" without the degree condition) and §2.5 ("good reduction at every place of `K(g)`") are refuted by this README's negative controls (§2.2 Check 4; §2.3 last Check).

2. **F02** (P2) the Hecke functional equation is cited from a supplier that no longer states it

   **Location:** README:111: "AutomorphicLFunctionsAndLocalFactors AL.1 ("Global distributions and completed Euler products" and "Rank-one specialisation and Hecke comparison") supplies the completed Hecke L-functions and their functional equation"; also the `*Needs:*` and Dependencies lines 353, 379, 387, 416, 442, 726, 832.

   **Claim:** AL.1 supplies continuation and functional equation of Hecke L-functions, under those two titles.

   **Witness:** AutomorphicLFunctionsAndLocalFactors at its open head, Scope: "AL.1.6.2, Hecke continuation and functional equation: AnalyticNumberTheoryPartI §2.3a" (likewise AL.1.5.2, AL.1.5.3). Neither quoted title exists there; AL.1.5 is "Global distributions".

   **Exact repair:** replace the contract sentence by "AnalyticNumberTheoryPartI §2.3a (Hecke continuation and functional equation `Λ_H(ω, s) = W(ω)Λ_H(ω⁻¹, 1 − s)` for unitary idele-class characters, with the comparison to the finite-order and algebraic completions of LFunctions Layers 5–6)", move it under a heading that names AnalyticNumberTheoryPartI, and replace "AutomorphicLFunctionsAndLocalFactors AL.1" by "AnalyticNumberTheoryPartI §2.3a" in the seven `*Needs:*`/Dependencies lines.

   **Repair test:** AnalyticNumberTheoryPartI is on main (`TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:1356`, "### 2.3a Hecke continuation and functional equation") and is line 51 of the merge order. §2.7's use (leading coefficient of `L_{pf}(η⁻¹, s)` at 0 from `L(η̄, 1) ≠ 0`) needs exactly the functional equation for a finite-order character, which §2.3a states; §3.2's values at `r = 1, 2` need the continuation for an algebraic character, which its last bullet covers through the unitary twist.

3. **F03** (P2) the CM predicate and the induced representation have an earlier owner

   **Location:** README:715–726 (§7.1) and README:736: "Prove that `V_{L_λ}(f) ≅ Ind_{G_K}^{G_ℚ} V_{L_λ}(ψ)` as `G_ℚ`-representations".

   **Claim:** what a CM newform is, and that its Galois representation is induced, are targets with no supplier.

   **Witness:** AutomorphicGaloisRepresentations §3.15 "The CM predicate" (open head, earlier in the order): "define CM by `π_f=AI_L^F(α)` … Its `λ`-adic induction is our `ρ`", with trace zero at inert primes. CMRankZeroConverse states its endpoint with that predicate and consumes §8.6 here.

   **Exact repair:** in Scope and in §§7.1–7.2 cite AutomorphicGaloisRepresentations §3.15 for the predicate, the inducing field and character and the induced representation. Restate §7.1 as the comparison this roadmap needs: for a classical newform, (b) holds for `(K, ψ)` if and only if its eigensystem is CM in the sense of §3.15 with `L = K` and `α` the unitary normalization of `ψ`; keep (c), the level formula and (a). In §7.2 keep as this roadmap's target the identification of Kato's realization `V_{L_λ}(ψ)` with the inducing `λ`-adic character (through §3.1) and the de Rham-normalized uniqueness (15.11.2); cite §3.15 for the induction itself.

   **Repair test:** 32.2.a.a: §3.15's own Check ("the weight-two form of `y²=x³−x`, conductor 32, is induced from `ℚ(i)`") and §7.1's Check (`4·8 = 32`) then describe one predicate, not two. Direction: AutomorphicGaloisRepresentations is already a supplier (§§1.5, 7.3).

4. **F04** (P3) a quoted ProfiniteProPGroups title that main does not have

   **Location:** README:67: "ProfiniteProPGroups ("Layer 9 prerequisites: two owned inputs") specifies the completed group algebra"; also lines 151, 185.

   **Claim:** the supplier has a part of that title.

   **Witness:** `Completed/ProfiniteProPGroups/README.md:2107` on main: "### Layer 9: the classification of Demushkin groups"; the completed group algebra is its subsection "The completed group algebra of the orientation image". The phrase "two owned inputs" occurs nowhere on main.

   **Exact repair:** write "ProfiniteProPGroups Layer 9 ("The completed group algebra of the orientation image")" in line 67 and "ProfiniteProPGroups Layer 9" in lines 151 and 185.

   **Repair test:** the subsection is at line 2193 of that file and names `TauCeti.completedGroupAlgebra`, the object consumed.

5. **F05** (P3) three locators that do not carry their claims

   **Location:** README:726: "The converse (a) ⇒ (b) is Ribet's theorem on self-twists, as recorded in Kato, 15.10", and "`N = |d_K|·N(f_ψ)` … (… Kato, Remark 12.8, p. 223, and 15.10, p. 260)"; README:736 "(Kato, 15.10, pp. 260–261)"; README:520 "Rubin 1991, §1, p. 27".

   **Claim:** Kato 15.10 records Ribet's self-twist theorem and the level formula; 15.10 runs over pp. 260–261; Rubin's elliptic units are on p. 27.

   **Witness:** Kato lines 5572–5585 (15.10, all on p. 260): CM is assumed, "conductor divides N", and [Ri2] is cited only for comparing Frobenius polynomials. Rubin91 lines 193–205 (pp. 28–29) define the elliptic units; §1 begins on p. 27.

   **Exact repair:**
   - Delete the sentence on the converse, or give it a source that states it (Kato's [Ri2]: Ribet, *Galois representations attached to eigenforms with nebentypus*, 1977, fetched through the sources service and recorded in `sources.toml`). No target uses (a) ⇒ (b): "CM newform" is (b), Kato's Remark 12.8.
   - Give the level formula a locator that states it (a textbook statement of the level of the theta series of a primitive Hecke character, recorded in the manifest), or weaken it to Kato's "the conductor of `ψ` divides `N`" and keep `32 = 4·8`, `27 = 3·9` as Checks of the two examples.
   - Write "15.10, p. 260" in §7.2 and "§1, pp. 27–29" in §4.7 (the manifest already has pp. 27–29).

   **Repair test:** `self-twist` occurs only in lines 71 and 724, so deleting the converse breaks no dependency.

6. **F06** (P3) the vanishing-factor Check of §3.2 drops its congruence

   **Location:** README:422: "so for `r = 2`, `c ∈ ℤ` prime to `6f` and `a = (c)`, `ψ(a) = c² = N(a)` and the factor is zero at the trivial character".

   **Claim:** for every integer `c` prime to `6f` the factor vanishes at the trivial character.

   **Witness:** `K = ℚ(i)`, `ψ = ψ_E²·ν`, `ν` of order 4 and conductor `(5)`, `c = 7`: `ψ_E((7)) = −7`, `ν((7)) = −1` (class `(2,2) ↦ 4` in `𝔽_5^×`), so `ψ((7)) = −49` and the factor at `χ = 1` is `98`.

   **Exact repair:** write "`c ∈ ℤ` prime to `6f` with `c ≡ 1` modulo the conductor"; for other `c` say that the factor `c²(1 − ε(c)χ(σ_c)⁻¹)` vanishes at the characters with `χ(σ_c) = ε(c)`, `ε` the finite part of `ψ`.

   **Repair test:** in the witness the factor is `49 − 49 = 0` at `χ = ν`, and `98` at `χ = 1`; with `c ≡ 1` modulo the conductor `ε(c) = 1` and it vanishes at `χ = 1`. The invertibility hypothesis of §3.2 is needed in both cases.

7. **F07** (P3) a docstring line of `Suggested.lean` is read as a declaration

   **Location:** `packages/ModularIwasawaMainConjecturesPartII/Suggested.lean:21`: "structure over those fields and Kato's theta functions; none exists in Mathlib or Tau Ceti."

   **Claim:** the file declares nothing.

   **Witness:** the worker's signature extraction emitted `#check @over` and failed ("unexpected token 'over'; expected term"): the docstring line begins with the keyword `structure`.

   **Exact repair:** reflow the sentence so that no docstring line begins with a declaration keyword, for instance "… which need CM elliptic curves over those fields with a torsion point of exact level, and Kato's theta functions; …".

   **Repair test:** no line of the file then matches a line-initial `theorem|def|instance|class|structure|abbrev|opaque|example|lemma|inductive|axiom`; line 21 is the only such line now. The file itself elaborates (below).

8. **F08** (P3) §7.8 is presented as a result and is not named in the docstring

   **Location:** README:3: "It proves that the elliptic units generate the CM ray-tower Iwasawa cohomology at the height-one primes over height-zero cyclotomic primes"; README:940 lists "the elliptic-unit generation of §7.8" among what consumers use.

   **Claim:** the module docstring names every headline that is not statable.

   **Witness:** `Suggested.lean:8–36` lists §§8.6, 6.2, 4.5, 4.8, 5.3–5.4, 5.5; §7.8 was removed in the last repair although the Summary and Downstream consumers still present it as a result.

   **Exact repair:** add a bullet: "Generation of the CM ray-tower and cyclotomic Iwasawa cohomology by elliptic units at height zero (Kato, 15.15; README §7.8). It needs the ray-tower Iwasawa cohomology, the elliptic-unit element and Kato's comparison map, none of which exists at the pins."

   **Repair test:** every result the Summary says the roadmap "proves" is then either in the docstring list or a step of a listed one.

Eight findings: three P2 (two ownership overlaps with earlier roadmaps, one supplier citation that no longer resolves) and five P3. The three findings of round 5 are repaired. The mathematics of the sampled targets and of the passages the last repair changed checks out; nothing false was found in a statement of this roadmap.

## Previous findings (round 5), checked first

| Round-5 finding | Repaired passage | Status |
|---|---|---|
| F01 (P2) CM case of Kato's Theorem 12.4 planned twice | `packages/ModularIwasawaMainConjecturesPartII/README.md:22`: "is KatoEulerSystems §4.4 for every admissible pair at every prime. Every CM pair is admissible there"; §7.8 is now "Elliptic units generate CM Iwasawa cohomology at height zero" with clauses (1)–(2) only; `Suggested.lean` no longer lists it | **Repaired.** KatoEulerSystems at its open head: Conventions call `(f, λ)` admissible "when f has complex multiplication"; §4.4 states torsion, torsion-freeness and rank one for admissible pairs, any `p`, with the case 15.14. `Theorem 12.4` occurs four times in the README (lines 3, 22, 129, 811), each time attributed to KatoEulerSystems §4.4. |
| F02 (P3) wrong printed page | README:317: "Kato, proof of Proposition 15.9, p. 258, Kato lines 5492–5494" | **Repaired.** Kato line 5460 is the header of p. 258, Kato line 5501 that of p. 259. |
| F03 (P3) false distinguished-polynomial Check | README:657: "`P(ι(T)) ≡ (−1)^d T^d (1 + T)^{−d}` modulo `ϖ`: its first unit coefficient has index `d`" | **Repaired.** Recomputed: `P = 1, T, T²` give reduced orders 0, 1, 2; `P = T + ϖ` gives `ϖ − T + T² − …`, constant `ϖ`, first unit coefficient at index 1. |

No finding of the last repair report was marked "not actionable in this package". The repaired patterns were searched in the rest of the text: no other passage claims the module structure of 12.4 or the inequality 12.5(3) as owned here; the other page/line pairs into Kato agree with the page headers; no other "distinguished … times a unit" claim occurs.

## Verified sound

### Elaboration, padding, binders

`lake env lean` on `packages/ModularIwasawaMainConjecturesPartII/Suggested.lean`, run from the content checkout: exit 0, no output, no warning. The file has `import Mathlib`, one module docstring, the namespace, and no `def`, `theorem`, `instance`, `example`, `set_option` or `sorry`. The one-tactic probe therefore has zero candidates and the `#check @name` comparison zero declarations (the supplied signatures file is unavailable for the reason in R07). No headline is statable at the pins: a search of the pinned Tau Ceti and Mathlib for elliptic units, a Katz measure and Iwasawa cohomology finds none.

Headlines from the Summary: §4.5, §4.8, §§5.3–5.4, §5.5, §6.2, §8.6 are each named in the docstring with the missing carrier; §7.8 is R08.

### Pinned declarations opened

Mathlib `1b1ccf4b`, by `#check` in a scratch file: `ClassGroup`, `Module.length` (values in `ℕ∞`; `Mathlib/RingTheory/Length.lean:32` defines it through `Order.krullDim (Submodule R M)`, as the README says), `IsLocalization.AtPrime`, `Ideal.height`, `NumberField.Units.regulator`, `NumberField.Units.regulator_ne_zero`, `NumberField.Units.torsion`, `NumberField.IsTotallyComplex`, `IsCyclotomicExtension`, `cyclotomicCharacter`, `PowerSeries`, `MvPowerSeries`: all exist.

Tau Ceti `2fd255d9`: `TauCeti.completedGroupAlgebra` (`Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`); `TauCeti.GlobalNumberFields.Modulus` (`NumberTheory/NumberField/Global/RayClass/Modulus.lean:98`), `.RayClassGroup` (`…/RayClass/Basic.lean:130`), `.HeckeCharacter` (`…/HeckeCharacter/Basic.lean:70`, continuous homomorphisms of the idele class group to `ℂˣ`); `TauCeti.ClassFieldTheory.rayClassField` and `rayClassArtinEquiv` (`NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:123, 209`, with the `NumberField` and `IsAbelianGalois` instances at 139, 143); `HeckeRing.GL2.Newform` (`NumberTheory/ModularForms/Newforms/Newform.lean:104`, no Galois representation among its fields).

### Seeded source sample (15 targets)

| Target | Text opened | Result |
|---|---|---|
| §0.2 | JLK lines 1419–1425 (Lemma 7.2, p. 34), 1471–1482 (Definition 7.5, Lemma 7.6, p. 35); BT line 146 | Supported. The source gives `(Ω_O)_q ≅ ∏_χ Λ(χ)_q`; one factor survives at a prime, as the README says. |
| §2.5 | Kato lines 5270–5285 ((15.5.1), p. 253), 5341–5351 ((15.6.5), p. 255); JLK lines 613–617 (Proposition 3.3(4), p. 14) | Supported: factor `N(a) − χ(a)⁻¹`, nontrivial `χ` and `L_{pf}` in the second formula. JLK writes `N(a) − η(a)` with `η(a) = η⁻¹(σ_a)`: the same factor. |
| §2.6 | Kato lines 5288–5292, 5321–5336 ((15.6.3)–(15.6.4), p. 254); BT line 144; JLK lines 1062–1072 | Supported: `a` prime to `6pf`, `a ≠ O_K`, independence, the ideal a unit at height one. |
| §4.2 | JLK lines 407–432 (Conjectures 2.4–2.5, Theorem 2.6, p. 10), 450–455, 512–522 (Corollaries 2.8, 2.11); HuberKings line 716 | Supported. `Det RΓ(…)[1]` as printed. Theorem 2.6 takes `p = 2` from a preprint not in the manifest; it is cited as JLK's stated theorem. |
| §4.6 | JLK lines 1025–1044 (Corollary 5.3, pp. 24–25) | Supported, with the determinant `(1 − χ(𝔩)Frob_𝔩⁻¹)⁻¹`. |
| §4.7 | Rubin91 lines 486–541 (pp. 36–37) | Supported: `p ∤ #μ(H)`, `K₀ ⊃ H`, `p ∤ [K₀ : K]`, the five modules, the sequence (5). Page of §1: R05. |
| §4.8 | Rubin91 lines 545–571 (Theorem 4.1, Remarks, p. 37); JLK lines 1091–1144 (§5.4) | Supported, including "no restriction on `p` besides `p` prime to the order of `Δ`". |
| §5.3 | Rubin91 lines 545–562, 633–648, 671–678 | Statement shape supported; OCR of the correction module in Theorem 5.3(ii) is damaged (below). |
| §6.2 | BT lines 152–157; Kato lines 5197–5207 (Theorem 15.2, p. 251), 5352–5361 (p. 255); JLK lines 1039–1044, 1487–1497 | The printed form lacks the tame Euler terms; the README's corrected form follows from JLK Lemma 7.7 with Corollary 5.3. |
| §6.3 | same, with JLK Lemma 4.3 lines 861–865 | Supported as consequences of §6.2 and §1.5. |
| §7.1 | BT lines 199–206; Kato lines 4119–4129 (Remark 12.8, p. 223), 5572–5576 | (b), (c) and the Hecke field supported; converse and level formula: R05. |
| §7.2 | Kato lines 5577–5625 (15.10, Lemma 15.11(1)), 5664–5676 (pp. 262–263) | Supported, including "we will never use (15.11.3) as identification". Page of 15.10: R05. |
| §8.2 | Kato lines 5686–5700 ((15.12.2), p. 263) | Supported: the set `S`, the sign `± = χ(−1)`. The `L`-symbol is damaged in the extraction (below). |
| §8.3 | Kato lines 5744–5753, 5768–5771; BT lines 213–218 | The source gives the route only; the statement is the README's own derivation, recomputed below. |
| §8.4 | Kato lines 5757–5760 ((15.16.1), p. 265); BT lines 215–216 | Supported. |

No locator was flagged by the author as unverified. All ten manifest entries were found in the cache; no new key was added and no text is requested.

### Adversarial table (values computed in this round)

| Statement | Instances and computed values | Result |
|---|---|---|
| §0.2 normalization | `ℤ_2[x]/(x² − 1)`: `(x − 1)(x + 1) = 0`, residue ring `𝔽_2` at `(x − 1, 2)`, local and not a domain; after inverting 2, `ℚ_2 × ℚ_2` | integral normalization fails, rational holds |
| §0.2 `ξ` | `A/(T²)` and `(A/(T))²`: length 2 at `(T)` both; `A/(p)[1/p] = 0` | `ξ` records lengths only |
| §1.7 route (used by §2.6) | invariants of `ℤ_p(1) ⊗ R/x`: `(g − χ_cyc(g))m = 0`, so `(R/x)[J]`; `dim R/J = 1`, `dim R/q = 2` at height one, so `J ⊄ q`; associated primes of `R/x` have height 1, `ht J = 2` | `(R/x)[J] = 0` |
| §2.5 first formula | `χ = 1`, `K = ℚ(i)`, `f = (3)`: `ζ_K(0) = −1/4`, derivative of `ζ_K(s)(1 − 9^{−s})` at 0 is `−log(9)/4`; `f` with two primes: left side `log` of a root of unity `= 0`, right side a double zero | both sides agree |
| §2.5 factor | from `a z_f = (N(a) − σ_a)z`: `Σ_σ χ(σ) log|σσ_a z| = χ(σ_a)⁻¹ Σ_σ χ(σ) log|σz|` | `N(a) − χ(a)⁻¹`, not `N(a) − χ(a)` |
| §2.6 `J` | `σ_a` acts on `μ_{p^∞}` by `N(a)`, the `σ_a` are dense, ideals of `R` are closed | `J = ker(χ_cyc)`, `R/J ≅ ℤ_p` |
| §3.2 display | from Kato lines 5540–5571: `σ_b` of the value is `N(a)Z(b) − ψ(a)Z(ab)`; summing `χ(σ_b)` gives `(N(a) − ψ(a)χ(σ_a)⁻¹)L` | display correct; Check 3 is R06 |
| §4.2 Checks | `ζ_{ℚ(i)}(0) = −hR/w = −1/4`, 2-adic valuation −2; `(1, 7, 1/7) ∈ ℚ_7³`: product 1, valuations `(0, 1, −1)` | scalar statement does not control characters |
| §4.5 (headline) | DVR model `H¹ = A`, `ζ = tⁿ`, `H² = A/tⁿ`: lengths `n = n`; `J_Λ` is a unit at height one, so `J_Λζ` and `Λζ` have the same localization | equality needs this `ζ`; any multiple breaks it |
| §4.6 | `χ` ramified at `𝔩`: factor `1 − 0 = 1`; all primes of `f` above `p`: empty product | reduces to §4.5 |
| §4.8 Checks | `Gal(K(E[5])/K)` for `y² = x³ − x`: `(4·16)/4 = 16`; conductor-one tower `16/4 = 4`; `ℚ(√−7)`: `−7 ≡ 1 mod 8`, `#μ(H) = 2` | counts correct; Rubin's hypothesis excludes `p = 2` there |
| §5.3 display | from `0 → ker → A_{F′} → ℤ_p → coker → 0`: `char X(F′) = π(L)·char(ℤ_p)/char(A_{F′})` | matches the display |
| §5.5 Check | see F03 above | repaired |
| §6.2 (headline) | layer sequence: `H²_w = H⁰(κ(w), ℤ_p)`, corestriction = residue degree, unbounded, limit 0; `H³_w = H¹(κ(w), ℤ_p)`, corestriction the identity, limit `ℤ_p[[G/D_𝔩]]`. `ℚ(i)`, `p = 5`, `f = (3)`: `#Δ = 4·4·8/4 = 32`, `δ_{(3)} ↦ ω(2)² = −1`; characters of `μ_4` at `−1`: `1, 1, −1, −1` | Euler term nonunit on two components, unit on two, zero on 28 |
| §6.3(c) | `1 − ζ⁻¹γ⁻¹` with `ζ` of `p`-power order and `γ = p^k·`(primitive): a finite-order `ρ` with `ρ(γ) = ζ⁻¹` exists | nonzero nonunit after inverting `p` |
| §7.1 Checks | `4·8 = 32`, `3·9 = 27`; `−11 ≡ 5 mod 8`, `a_2(11.2.a.a) = −2 ≠ 0` | correct |
| §7.2 irreducibility | `p` split: the characters are ramified at different places; `p` inert or ramified: on units near 1 they are `a^r` and `ā^r`, different for `r ≥ 1` | induction irreducible at every `p` |
| §7.8(1), changed text | minimal primes of `Λ` do not contain `p` (`Λ` is `O`-flat), so §7.5 applies; `Tw_κ(h − 1) = h − 1` for `h` in the kernel of `G_{p∞f} → G_∞`, so the kernel ideal is twist-stable and the twist only permutes the components `𝔭` | the specialization argument is sound; the characters used lie on the twisted component, which §4.2 of KatoEulerSystems covers ("every component") |
| §7.8(2), changed text | `H¹(T̃)_𝔭 ≅ A/aA = Λ_𝔭`; `p^m(γ ⊗ ζ^{⊗−1}) ∈ T(−1)`, `p` a unit in `Λ_𝔭`; zero-divisors of the reduced `Λ` are the union of its minimal primes | generation and torsion quotient hold |
| §7.9, changed wording | condition (b) gives `p ≠ 2` (`−1 ∈ H`) and `p ∤ #Δ`, the residue hypothesis of §7.5 at `𝔭 ∋ p`; the projected unit is `∏(1 − χ(𝔩)Frob_𝔩⁻¹)ζ(χ)`, which only enlarges the right side | inequality survives the Euler factors |
| §8.2 identity | `χ(b) = χ₀(N b)` because the Artin symbol of `b` restricts to `σ_{N(b)}`; removing the `p`-factor of `f*` is removing ideals not prime to `p` | `L_{pf}(ψ̄, χ₀ ∘ N, s) = L_{{p}}(f*, χ₀, s)` |
| §8.3 | `I_𝔩` finite and trivial in `G_∞`. If `P(g) ∈ q′` for an irreducible factor `P ≠ X − 1` of `X^m − 1`, then `P(1) ∈ q ∩ O_λ = 0`, but `P(1) ∣ m ≠ 0`; so `g − 1 ∈ q′`. Twisted annihilator `χ_T(g)⁻¹ − 1 ≠ 0`, a unit of `A_{q′}`, since `ψ` is ramified at `𝔩` | Euler terms vanish on `ψ`-components (the argument does not need roots of unity in `O_λ`) |
| §8.4 sign | KatoEulerSystems §5.3: `± = (−1)^{k−r−1}χ(−1)`; at `r = k − 1` it is `χ(−1)`, as in §8.2; its §5.1: `z(ιγ) = −σ_{−1}z(γ)` | conventions agree across the two roadmaps |
| §8.6 (headline) | `H¹(V)` torsion-free and one-dimensional at each minimal prime over a product of principal ideal domains: free of rank one; `ℤ_2[[ℤ_2^×]][1/2]` has two components | modules are torsion on every component; the equality is tested prime by prime |
| §8.7 Check | `h(c)² = c^{−3}` gives `h(−1)² = −1` and `h(1) = 1` | no central character for `k = 3` |

For the sections no repair touched and outside the sample, the rows of round 5 carry computed values and were relied on (§§1.1–1.5, 2.1–2.4, 3.1, 3.3, 5.1–5.2, 7.5–7.7, 8.1, 8.5); §3.2 was recomputed here because of R06.

### Supplier-order audit

```text
depcheck: 206 roadmaps, 1914 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` lists no citation found nowhere. Every cited section was located by heading at main or at the supplier's open head, in this round:

- KatoEulerSystems §§4.2, 4.4, 5.1, 5.3, 7.2; PadicFamilies §§4.0.1, 4.0.3 ("Include the CM case through its induced-character decomposition and the corresponding elliptic-unit argument"); ModularIwasawaMainConjectures §§0.1, 0.6, 0.7 (`KMC_Q`).
- PadicHodgeRegulators §§1.4, 1.7; AutomorphicPadicLFunctionsPartII §§3.3, 3.4, 8.5; NoncommutativeAndEquivariantIwasawa §4.3 (Construction, `Col_𝔣` onto `J_𝔣`, `Col_𝔣(β(𝔞)) = (σ_𝔞 − N𝔞)ν_𝔣`, the characteristic-ideal identity, the Theorem).
- SelmerIwasawaCohomology §§0.9, 0.10, 2.8, 3.0–3.3, 3.7, 3.13 (cyclotomic, odd `p`, as the README says), 3.15, 3.17; ColemanPowerSeries Layer 1, §§2.37, 2.39, 2.44; IntegralIwasawaTheory §§2.6, 7.1, 7.2 (`arithmeticColeman`), 10.0.
- EulerSystemsAndKolyvaginSystems §§2.2, 2.5, 8.1, 8.2, 8.6, 8.7, 8.14, 8.25, 8.37; ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.2, 3.2, 4.1, 4.2, 5.1; NeronModelsAndSemistableAbelianVarieties §5.1.
- AutomorphicGaloisRepresentations §§1.5, 7.3; AutomorphicGaloisRepresentationsPartII Layer AG2.0; PeriodsAndSpecialValues PS.5.2, PS.6.5 (weight `≤ −3`); AnticyclotomicLocalUnits §1.1; ArithmeticGaloisDuality R02.4.3, R02.4.4, D7.5.
- On main: ImaginaryQuadraticClassNumber H3.1; ClassFieldTheory Layers 10, 11, 13 and former §2.6 (mapped to Conventions C.6 by its numbering table); GlobalNumberFields Layers 2, 9, 10; PadicMeasuresIwasawaAlgebras Layer 1, §§2.1–2.3, 2.6, 2.8, 4.1, 4.6, 5.1; LFunctions Layer 7; ModularCurves Layers 0, 2; ModularForms Layer 9 (self-twists).

Exceptions: AL.1 (R02) and the ProfiniteProPGroups title (R04). ModularForms Layers 4, 5, 7 and EllipticCurves Layers 1–2 are on main and were not reopened in this round; round 5 located them.

The declared gap `gap:height-one-explicit-reciprocity` has the same slug, supplier (PadicHodgeRegulators §1.4) and `needs` in `design/plan.json` and at README:117. It is precise (the `p`-divisible group, the `O_𝔭`-action of relative height one, the unit system, the cup product, the dual exponential, the logarithmic derivatives) and minimal: PadicHodgeRegulators has no such statement, and NonordinaryCMSpecialValues §2.5 states only the applied CM form for `p ≥ 5` inert (R01, item 3).

Remark, no change asked: KatoEulerSystems §4.4 takes its CM rational clauses from PadicFamilies §4.0.3, whose CM case is "the corresponding elliptic-unit argument", which no roadmap earlier than this one plans. This roadmap does not depend on that clause in substance: §7.8(1)–(2) give `H² = 0` and `dim H¹ = 1` at every minimal prime, and torsion-freeness in KatoEulerSystems §4.4 does not use elliptic units. The supplier-side question is the maintainer's, as the last repair report says.

### Duplication and overlap

`scratch/overlaps.md` reports no other pull request changing this roadmap, no cited id dropped and no id defined only by an open revision; this roadmap is not on main, so there is no second copy. By-object searches over main, the open heads and the board packages (elliptic units, CM pairs, Kronecker limit formula, Johnson-Leung–Kings, Katz functional equation, Kato §15 locators) gave R01 and R03 and otherwise only consumers or the suppliers already cited:

- NoncommutativeAndEquivariantIwasawa §4.3 (rational CM curves, `p ≥ 5` ordinary): cited, and the kept variants say how they differ.
- EllipticCurvePeriodsAndModularParametrizations: a one-variable ring-class construction, named in Scope.
- ModularIwasawaMainConjectures: says the elliptic-unit inputs of the Eisenstein-prime proofs "belong to those roadmaps' proofs" and owns none.
- AutomorphicCongruences: consumes the Katz measure of AutomorphicPadicLFunctionsPartII §8.5 and owns no elliptic-unit statement.
- HeegnerPointEulerSystems: declares `gap:eisenstein-elliptic-unit-inputs` with supplier EulerSystemsCyclotomicMainConjecture for the object of §5.4 plus a μ-statement; that supplier's text has no elliptic-unit statement today. For the maintainer.
- CMRankZeroConverse cites this roadmap by labels "§CZ.4", "§CZ.5", "§CZ.6" that this README does not have (its §§6.2, 7.6, 7.8, 8.6, 8.7); that is the consumer's citation to repair.
- InertAnticyclotomicCMMainConjecture (board package) is a scope boundary only; its README was read for the two gaps named in R01.

Overlap check: read KatoEulerSystems, AutomorphicCongruences, ModularIwasawaMainConjectures, EulerSystemsAndKolyvaginSystems, CMRankZeroConverse (open, by vocabulary), PadicMeasuresIwasawaAlgebras (main), KatoEulerSystems (by results); shared with KatoEulerSystems: the module structure of Kato's Theorem 12.4, owner KatoEulerSystems §4.4 (cited); with PadicMeasuresIwasawaAlgebras: characteristic ideals, owner PadicMeasuresIwasawaAlgebras §4.6 (cited); nothing shared with the others. Outside those lists: Kato's CM theta functions, canonical CM pairs, elliptic units, `V(ψ)`/`S(ψ)`/`per_ψ` and Proposition 15.9, owner NonordinaryCMSpecialValues Layer 2 (R01); the CM predicate, owner AutomorphicGaloisRepresentations §3.15 (R03).

### Shape, style, policy

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–8 each ending with Examples and Dependencies, Downstream consumers, Worked examples, References: present. Every definition has at least three Checks (counts per section: 0.1: 4; 0.2: 3; 1.1: 3; 1.2: 3; 1.4: 3; 1.5: 3; 1.7: 4; 2.1: 3; 2.2: 4; 2.3: 5; 2.4: 5; 2.5: 3; 2.6: 3; 3.1: 4; 3.2: 4; 3.3: 4; 4.1: 3; 4.2: 5; 4.7: 3; 5.1: 5 + 5; 5.2: 4; 7.3: 3; 7.8: 4). The layer order is forced by the dependency lines (units before realizations, both before the character-wise main conjecture, that before the equivariant one, then induction and descent); Layer 5 is a side branch and says so; no layer is named after a source's chapter and the README does not say it follows a source. Greps found no LaTeX delimiter, pull-request number, date, machine path, HTML anchor, round label or `lemma` declaration; "removed" at line 596 and "lemma" in §§5.3, 7.5, 7.7 are mathematical uses. No algorithm, no copied passage. No backticked name is presented as a declaration of this roadmap.

## Not verifiable

- Kato's displays (15.5.1), (15.9.1)–(15.9.2) and (15.12.2) are damaged in the extraction (the `L`-symbols and the conjugation bars). The surrounding text, hypotheses and page headers were read; the forms were recomputed from the proof of (15.9.1) (Kato lines 5540–5571), not read off the glyphs.
- Rubin91 lines 667–675 (the module in Theorem 5.3(ii)) are OCR-damaged; the shape of the sequence is legible, the case distinction is not. §5.3's correction terms rest on the round-2 reading.
- JLK Theorem 2.6 at `p = 2` rests on a preprint the manifest does not record; it is cited through JLK's stated theorem and was not read.
- NonordinaryCMSpecialValues and InertAnticyclotomicCMMainConjecture were read in the board checkout, which is where the board index places them (they are not among the packages listed as living on another branch); neither is on main or in an open roadmap pull request, so their text may still change.
- The proof of the declared gap is the supplier's and cannot be checked here.

## Source issues

- **Error** in BT at Theorem 2.1, printed p. 4: the source says the two characteristic ideals are equal for every modulus; it should be the equality with the Euler terms at the primes of the modulus prime to `p`; affects a stated result.
- **Error** in Kato at Theorem 15.2(2), printed p. 251: the source says the two lengths are equal at every height-one prime under (b) and (c); it should carry the tame Euler terms on components unramified at a prime of the modulus; affects a stated result.
- **Error** in Kato at (15.3.3), printed p. 252: the source says the ideal need only have prime divisors unramified in the field; it should also be prime to the modulus of the CM pair; affects a stated result.
- **Error** in Kato at (15.4.2), printed p. 252: the source says the norm along any isogeny of CM curves preserves the theta function; it should be restricted to isogenies of degree prime to the norm of the ideal; affects a stated result.
- **Error** in Kato at proof of Proposition 15.9, printed p. 258: the source says the canonical curve has good reduction at every finite place; it should require the units to inject modulo the part of the level prime to the place; affects the proof.
- **Misprint** in Kato at proof of Proposition 15.17, printed p. 265: the source says the length identity used is Lemma 14.12; it should be Lemma 14.15; affects the proof.
- **Gap** in BT at proof of Theorem 2.6, printed p. 5: the source says Kato's §15 turns the equivariant equality into the cyclotomic equality; it should add the Tor bookkeeping, since Kato's Proposition 15.17 proves an inequality only; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "804418a7b86a6b5dab294ec0eb4a613677a4a9fa", "job": "REV-PKG-ModularIwasawaMainConjecturesPartII~6", "model": "fable", "worker": "chris-x54"} -->
