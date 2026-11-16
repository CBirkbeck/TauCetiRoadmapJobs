<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13003#issuecomment-6904419642 -->
Red team round 1 pass b (claude) of 44f5901

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) the rational bounded-denominator form (§6.4) is statable and absent from `Suggested.lean`

   **Location.** `packages/ModularFormsPartII/Suggested.lean:25–27` ("the unbounded denominators
   theorem … (README §6.3), Galois conjugation … (README §6.5) and the unbounded denominators theorem
   for algebraic-integer Fourier coefficients (README §6.6)") and lines 35–47 (the list of headline
   theorems not stated); `packages/ModularFormsPartII/README.md:620–622` (§6.4).

   **Claim.** The README's scope paragraph owns "the unbounded denominators theorem, its rational and
   algebraic-integer forms", and the Layer 6 introduction says the layer proves the theorem "with its
   rational and algebraic-integer forms". §6.4 is the form that gives the theorem its name (a pole at
   `∞` and one clearing integer `D` allowed), and it is the export `W6.4` that
   `TauCetiRoadmap/NoncongruenceModularForms/README.md` on main consumes (its supplier contract,
   "W6.3–W6.5 (integral, rational and number-field unbounded denominators for weak forms)", and its
   §8.2). The Lean file states §6.3 and §6.6 only, and its docstring does not name §6.4 among the
   theorems not stated.

   **Witness.** Every carrier is at the pins and already used in the file:
   `TauCeti.UpperHalfPlane.laurentQExpansion h f` with `.coeff n`, `n : ℤ`
   (`Suggested.lean:198`) and the clearing clause `(D : ℂ) * … = z` (`Suggested.lean:132–133`).
   Instance the two stated forms cannot take: `f = Δ⁻¹/11`, `Γ = SL₂(ℤ)`, `k = −12`, `h = 1`; its
   expansion `(1/11)(Q⁻¹ + 24 + 324Q + ⋯)` is unbounded at `∞` and not integral, so neither
   `unbounded_denominators` nor `algebraicInteger_unbounded_denominators` applies; `D = 11` clears it.

   **Repair.** In `Suggested.lean`, after `unbounded_denominators`, add (idioms copied from lines
   132–133 and 195–204; elaborate it with `#check @boundedDenominators_congruence` before submitting):

   ```lean
   /-- Rational bounded denominators force congruence (README §6.4; CDT Theorem 1.0.1 and the
   paragraph after it). Let `f` be a weak form of weight `k` for a finite-index `Γ ≤ SL₂(ℤ)` with
   period `h ≥ 1`. If one positive integer `D` makes every coefficient of `D` times its Laurent
   expansion at `∞` in `exp(2πiτ/h)` an integer, then `f` is a weak form of weight `k` for some
   congruence subgroup. A pole at `∞` is allowed. -/
   theorem boundedDenominators_congruence (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] (k : ℤ)
       (f : ℍ → ℂ) (hf : IsWeakForm Γ k f) (h : ℕ) (hh : 0 < h)
       (hper : Function.Periodic (f ∘ UpperHalfPlane.ofComplex) h)
       (D : ℕ) (hD : 0 < D)
       (hint : ∀ n : ℤ, ∃ z : ℤ,
         (D : ℂ) * (TauCeti.UpperHalfPlane.laurentQExpansion h f).coeff n = z) :
       ∃ Γ' : Subgroup SL(2, ℤ), IsCongruenceSubgroup Γ' ∧ IsWeakForm Γ' k f := by
     sorry
   ```

   Add "the rational bounded-denominator form (README §6.4)" to the "Stated here" list of the module
   docstring, and begin README §6.4 with the name: "`boundedDenominators_congruence`: let f be a weak
   form …". On the instance above: hypotheses hold with `D = 11` (coefficients `1, 24, 324, …` after
   clearing), and the conclusion holds with `Γ′ = SL₂(ℤ)`.

2. **F02** (P2) the gap `udc-bombieri-andre-katz` is compound, and its first half is stronger than the theorem it names

   **Location.** `packages/ModularFormsPartII/README.md:130` ("the Bombieri–André theorem that a system
   satisfying Galochkin's condition is globally nilpotent, and Katz's theorem that a globally nilpotent
   operator over `ℚ̄(x)` is regular singular with quasi-unipotent local monodromy"); the same sentence
   in `design/plan.json`, `gaps[2].needs`; README §7.9, lines 784–786 ("`L_j` is globally nilpotent").

   **Claim.** One `needs` sentence asks the supplier for two theorems joined by an undefined
   intermediate notion. "Globally nilpotent" in Katz's sense is nilpotent p-curvature for all but
   finitely many p. The Bombieri–André theorem gives nilpotent p-curvature only for a set of primes of
   density one; nilpotence for all but finitely many p is not known for a system that merely satisfies
   Galochkin's condition. Katz's regularity and rational-exponent theorem does hold under the
   density-one hypothesis, so the consequence §7.9 uses is true; the intermediate statement as written
   is not a theorem the supplier can provide.

   **Witness.** §7.9 uses only the composite: Galochkin's condition for the companion system of `L_j`
   ⇒ quasi-unipotent local monodromy at `0`. `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md`
   §5.3 (lines 3047–3088 on main) defines `GalochkinCondition` and has no p-curvature notion, so the
   gap also asks it to define one that no target here consumes.

   **Repair.** Replace the `needs` sentence (README line 130 and `gaps[2].needs`, same slug) by the
   single statement consumed:

   > What DiophantineApproximationAndTranscendence must provide (gap:udc-bombieri-andre-katz): if a
   > system `y′ = Gy` over `ℚ̄(x)` satisfies Galochkin's condition (§5.3), then every point of `ℙ¹` is
   > a regular singular point of it with rational exponents, so every local monodromy is
   > quasi-unipotent (the theorems of Bombieri–André, nilpotent p-curvature for a set of primes of
   > density one, and of Katz, composed).

   In §7.9 replace "`L_j` is globally nilpotent, and its local monodromies are quasi-unipotent" by
   "`L_j` is regular singular with rational exponents at every point of `ℙ¹`, so its local monodromies
   are quasi-unipotent", and in its proof sketch replace "give global nilpotence and quasi-unipotent
   local monodromy" by "give regular singularities with rational exponents, hence quasi-unipotent local
   monodromy". Tested on §7.9's use: the minimal operator of an integral component has
   `f, f′, …, f^(m−1)` independent, Chudnovsky (§5.3) gives Galochkin, and the repaired contract gives
   exactly the quasi-unipotence that, with semisimplicity, yields finite order.

3. **F03** (P3) pinned Tau Ceti already has the field of functions with coefficients in a subfield; §§3.1, 5.1, 5.4 do not cite it

   **Location.** `packages/ModularFormsPartII/README.md:80` (the Tau Ceti contract lists only
   `TauCeti.UpperHalfPlane.laurentQExpansion…`); §3.1 line 392; §5.1 line 541 ("identify `ℂM₂m` with
   the function field of `X(2m)`"); §5.4 line 565.

   **Claim.** The README says the library supplies only the Laurent expansion of a function on `ℍ`, and
   builds the field of level-`2N` modular functions with rational coefficients, and the injectivity of
   the expansion, from scratch.

   **Witness.** Pinned `TauCeti/NumberTheory/ModularForms/QExpansion/FunctionField.lean`:
   `Subgroup.CompactifiedQuotient.laurentQExpansion D` (line 102, a `ℂ`-algebra map from
   `MeromorphicFunction Γ.CompactifiedQuotient` to `LaurentSeries ℂ`), `laurentQExpansion_injective`
   (line 137), `coeffSubfield D K` (line 209), `mem_coeffSubfield` (line 215).

   **Repair.** Add to "From Tau Ceti": "`Subgroup.CompactifiedQuotient.laurentQExpansion`,
   `Subgroup.CompactifiedQuotient.laurentQExpansion_injective`,
   `Subgroup.CompactifiedQuotient.coeffSubfield`, `Subgroup.CompactifiedQuotient.mem_coeffSubfield`
   (`TauCeti/NumberTheory/ModularForms/QExpansion/FunctionField.lean`): for a discrete
   `Γ ≤ PSL₂(ℝ)` and a cusp datum D of width w, the injective `ℂ`-algebra map from the meromorphic
   functions on the compactified quotient to Laurent series in `exp(2πiz/w)`, and the subfield of
   functions whose coefficients lie in a subfield K of `ℂ`." Add to the API of §3.1: "`M₂N` is the
   image under `Subgroup.CompactifiedQuotient.laurentQExpansion D` of
   `Subgroup.CompactifiedQuotient.coeffSubfield D ℚ`, for the image of `Γ(2N)` in `PSL₂(ℝ)` and the
   cusp datum D at `∞` of width `2N` with identity scaling (the inclusion ⊆ because the right side is a
   field containing the generators; ⊇ by §5.1, since `ℂM₂N ∩ ℚ((t)) = M₂N`)." In §5.1 and §5.4 name
   `MeromorphicFunction` of that compactified quotient as "the function field of `X(2m)`". Tested at
   `N = 1`: the right side is the functions on `X(2)` with rational expansion, `ℚ(λ) = M₂` (§2.4).

4. **F04** (P3) ModularForms Layer 4 is cited for the old/new decomposition, which is its Layer 3

   **Location.** `packages/ModularFormsPartII/README.md:11` ("eigenforms, newforms and oldform
   decomposition (Layer 4)"), line 84 ("Layer 4 (eigenform and newform bases, oldform reindexing)"),
   line 955 ("decompose into newforms and oldforms (ModularForms Layer 4)"), lines 957 and 976.

   **Claim.** ModularForms Layer 4 supplies the newform basis and the oldform reindexing.

   **Witness.** `TauCetiRoadmap/ModularForms/README.md` on main: Layer 4 is "primitive associates"
   (§4.1, the conductor of a good eigenform, line 670); the oldspace indexing
   `Σ_{M∣N} Σ_{d∣N/M} V_d S_k(M, χ_M)` is §3.1 (line 632); its table of earlier labels (lines 333–349)
   puts "old/new spaces" under Layer 3 and the newform basis under Layer 5 and Tau Ceti.

   **Repair.** Line 11: "eigenforms, newforms and the oldspace indexing (Layers 3–5)". Line 84:
   "Layer 3 (§3.1, the oldspace indexing `Σ V_d S_k(M, χ_M)` in a character space), Layers 4–5
   (primitive associates and the newform basis, the latter Tau Ceti's as listed there)". Line 955:
   "(ModularForms §3.1 and Layer 5)". Lines 957 and 976: "ModularForms Layers 0 and 3–5 and
   §§8.0–8.1". Tested on §8.6: the step needs `S_k(Γ₁(M²))` written as newforms and their `V_d`
   translates, which is §3.1 with the newform basis.

5. **F05** (P3) ModularCurvesPartII §5.13 is a `*Needs:*` edge with no contract

   **Location.** `packages/ModularFormsPartII/README.md:986` and `:1026` ("ModularCurvesPartII §§5.13,
   6.3, Layer 11"); the contract paragraph at line 104 lists §§15.2, 15.3, 15.5, 15.10, 5.14, 6.3,
   6.4–6.5, 8.1 and Layer 11, not §5.13; neither does the scope bullet at line 13.

   **Witness.** ModularCurvesPartII §5.13 at its open head ("The fixed-pairing compactified curve"):
   for `N ≥ 1` and a `ℤ[ζ_N]`-algebra R, the curve `X(N, ζ)_R`, with `X(N, ζ) = X(N)` over `ℤ[ζ_N]`.

   **Repair.** Insert in line 104, before "§5.14": "§5.13: for `N ≥ 1` and a `ℤ[ζ_N]`-algebra R, the
   fixed-pairing compactified curve `X(N, ζ)_R`, equal to `X(N)` with its cyclotomic structure for
   `R = ℤ[ζ_N]`; its generic fibre over `K ⊇ ℚ(μ_N)` is the curve `X(N)_K` of §9.1." Add "§5.13" to
   the list in line 13.

6. **F06** (P3) two `*Needs:*` edges that no step of the proof plan uses

   **Location.** `packages/ModularFormsPartII/README.md:642` (§6.6: "AlgebraicModularFormsAndSerreWeights
   §1.5 (All-weight analytic comparison, Layer R15.1)"); line 907 (§8.3:
   "GeometryOfNumbersAndQuadraticArithmetic §4.3").

   **Witness.** §6.6's proof sketch (line 640) uses §6.5, the trace forms and §6.3 only. §8.3's proof
   sketch (line 905) uses the hypergeometric recurrences, §2.6 and the Serre derivative; the theta
   products it could need are SpecialFunctionsTheta §4.2. These are the only uses of the two supplier
   sections in the README (lines 16, 21, 96, 120, 682, 976 are their contract and dependency lists).

   **Repair.** Delete "AlgebraicModularFormsAndSerreWeights §1.5 (…)" from line 642, "§1.5" from lines
   16, 120 and 682; delete "GeometryOfNumbersAndQuadraticArithmetic §4.3" from lines 907 and 976, the
   bullet at line 21 and the subsection at lines 94–96. If a step does use one of them, name the step
   in the proof sketch instead (for §8.3: which theta identity is taken from the triple product).

Two P2 findings (R01, R02) and four P3 findings (R03–R06). No P1: no statement of
`packages/ModularFormsPartII/Suggested.lean` or bold target of `packages/ModularFormsPartII/README.md`
was refuted, and no supplier citation is unowned.

Dependency check (run at this head):

```
depcheck: 235 roadmaps, 2235 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The pull request changes only `packages/ModularFormsPartII/`
(`git diff --stat origin/main...HEAD`: 12 files, all in that folder).

No Lean was run in this pass (the brief gives no elaboration command). The elaborated types were
read from the worker's `signatures.md` (23 entries, one of them the parsing artefact `for` from
line 27 of the module docstring; the 22 real declarations agree with their README statements, and
none lost a section binder: the file has no `variable` line).

## Verified sound

Counts: 22 declarations read (all of `Suggested.lean`); 64 README targets read (every line of the
README); 31 source locators verified against the text (28 in CDT25, 3 in KSV10); 115 Check and
Example bullets read, and every one with a computable value recomputed (the table below gives the
values); 14 supplier roadmaps and 44 cited sections resolved at main or at the open head; 45 of the
60 distinct pinned declaration names opened at the pins by grep (the worker's resolver reports none
of the 60 missing).

The pass table (instance → values on each side → result; "ok" means no change):

| Statement | Instances tried and values computed | Result |
|---|---|---|
| `IsWeakForm` | `Δ⁻¹`, k = −12: growth `exp(2π Im τ)`, accepted; `exp(j)`: `exp(exp(2πy))` on `Re τ = 0`, rejected; odd k with `−I ∈ Γ`: `f = −f`, so `f = 0`; `exp(2πiτ/7)` under `[[1,0],[7,1]]`: not invariant | ok |
| `wohlfahrt_Gamma_le` | N = 0: `Γ(0) = ⊥`; `H′` (a ≡ 1 mod 4): `gT²g⁻¹ = [[−1,2],[−2,3]] ∉ H′`, `gT⁴g⁻¹ = [[−3,4],[−4,5]] ∈ H′`, so the hypothesis fails at N = 2 and holds at N = 4 with `Γ(4) ≤ H′`; kernel of the `η²` character: `χ(T)⁶ = −1`, `χ(T)¹² = 1`, `L = 6`, `T⁶ ∉ G`. The proof of KSV10 Proposition 3 uses only conjugates of `T^N` in G, so `hneg` is not needed for the statement as typed; it keeps the target the signed form (the strict form is `wohlfahrt_strict` of NoncongruenceModularForms on main) | ok, note |
| `modularLambda` | `τ = i`: 0.5; `2i`: 0.0294373; `0.3+0.8i`: 0.7660029+0.4097863i; `1.3+0.8i`: −0.0508248−1.8402518i = λ/(λ−1); `0.6+1.6i`: −0.0278242+0.1029613i; exponent `8(−1/24+2/12) = 1` | ok |
| `modularLambda_covering` | `λ(1+i) = −1`, `λ((1+i)/2) = 2`, `λ(1+0.5i) = −32.97`; `Γ(2) = ⟨−I, T², ST⁻²S⁻¹⟩` by the Euclidean descent on (a, c); fibre iff in both directions through the set D | ok |
| `lambdaField` | N = 1: generator `16q − 128q² + 704q³`; `√2 ∉`; N = 0 junk, excluded by `0 < N` in the theorems | ok |
| `congruenceSpan` | `[M₄ : M₂] = (64/12)(3/4) = 4`; `[M₆ : M₂] = 18·(3/4)(8/9) = 12`; N = 1 formula would give 1/2 | ok |
| `boundedDenominatorSpan` | `Γ₀(3)` Hauptmodul at N = 1: `T ∈ Γ₀(3)` but width 3 at 0, excluded by the all-conjugates clause; `1/2 ∈ R₂` | ok |
| `nonabelian_ihara` | `c([[1,0],[6,1]]) = [[1,0],[3,1]]`; N = 2 with G the normal closure of `T²`, which contains `−I` (if not it would equal `H′`, which excludes `[[−1,2],[−2,3]]`), so S is trivial there; the proof for N ≥ 3 goes through without `−I ∈ G` (`K = Γ(N)` from `Γ(N) ≤ ±K`, `−I ∉ Γ(N)`) | ok |
| `boundedDenominatorSpan_eq_congruenceSpan` | generator f with stabilizer `G_f ⊇ H`, `G_f` congruence, `−I ∈ G_f`, all conjugates of `T^(2N)` in it ⇒ `Γ(2N) ≤ G_f` | ok |
| `boundedDenominatorSpan_finrank_le` | N = 1: needs `C ≥ 1/log 2`; `log(1+A/N³) + log(1−A/(2N³)) ≥ A/(3N³)`; `r = 0.95`: `0.95·4.37688/4 = 1.0395` | ok |
| `unbounded_denominators` | f = 0; `j^(1/3)Δ = E₄η¹⁶`, period 3; odd h → 2h; CDT states `ℤ[[q^(1/N)]]`, `q = exp(πiτ)` (CDT25 line 25) | ok |
| `weakForm_galois_conjugate` | `√2 Δ⁻¹`, h = 1: `K = ℚ(√2)`, conjugate `−√2 Δ⁻¹`; period kept because `(f h₀^k)^σ / h₀^k` is supported on multiples of 24 | ok |
| `algebraicInteger_unbounded_denominators` | trace matrix `(σ(α_i))` invertible; `f^σ` keeps the support, so bounded at `∞` | ok |
| `IsVectorValuedForm` | `ρ(T) = [[1,1],[0,1]]` rejected; odd k ⇒ F = 0; n = 0 | ok |
| `vectorValued_component_congruence` | conclusion's growth clause at every `g`: `F_j ∣ g` is `Γ(M)`-invariant, hence periodic, so the strip bound is uniform; `F(Mτ)` law: `(c/M)(Mτ) + d = cτ + d` | ok |
| `vectorValued_effective_mason` | `ρ = 1 ⊕ σ`, `F = (1,0,0)`: `σ(R)² = [[−3,−1],[7,2]]`, `σ(R)³ = I`, `σ(T) = [[2,1],[7,3]]`, `X² − 5X − 1`, roots 5.19258, −0.19258; conclusion holds, `ker ρ` not congruence | ok |
| `weakFormAlgebra`, `quasiModularWeakAlgebra` | `E₂ ∉ M^!(SL₂(ℤ))`; `DΔ = E₂Δ`, `θ_qΔ = 2q² − 96q⁴` | ok |
| `quasiModularWeakAlgebra_differential_closure` | `E₂ = (DΔ)Δ⁻¹` uses only `Δ, Δ⁻¹ ∈ A`; Serre derivative of a weak form is a weak form | ok |
| `HasCuspidalExpansionOver` | Δ accepted, `E₄` (constant term 1) and `Δ⁻¹` rejected, `√2Δ` over ℚ rejected | ok |
| `congruenceKernel_no_deficient_place` | k ≤ 0 or odd: a = 0; `E₄` would violate the bound for ε < 3/2, excluded by the zero constant term | ok |
| `exists_deficient_finite_place` | S = ∅ and `F_j = 0` make `hnon` false; `ρ = 1 ⊕ σ`: `(σ(T)^h − 1)g = 0` forces g = 0 | ok, see Not verifiable |
| README §1.2 | `(1−16t)^(1/16)`: `t²` coefficient −15/2; `Q + |Q|²Q̄`: `qExpansion 1 = t`, `qExpansion 2 = 0` | ok |
| README §1.7 | `p ∤ a`: `at + rp = b`, `ct + s = d` with `t = bs − dpr`; `p ∣ a`: `det [[a/p,b],[c,pd]] = 1`, conjugate of `[[1,n/p],[0,1]]` by `diag(p,1/p)` is `[[1,np],[0,1]]` | ok |
| README §§2.3, 2.5, 2.6 | `x = q − 8q² + 44q³ − 192q⁴ + 718q⁵`, inverse `x + 8x² + 84x³ + 992x⁴ + 12514x⁵` (composition is the identity through degree 5); `x₃`: `68/9`; `(n+1)²a_{n+1} = 4(2n+1)²a_n`; `θ₃(τ₀)² = (1+4i)·1.0074837` | ok |
| README §§2.7, 3.5 | `γ₂ = 4.376879`, `γ₃ = 2.581057`; `F₂′(0) = −2(ic)(2i) = 4c` | ok |
| README §§5.4, 5.5 | `(8N³/12)(6/π²) = 4N³/π²`; `2^k ≤ (Cπ²/4) log 2N` | ok |
| README §§6.7–6.9 | `u^(1/5)`: −24/5, 348/25, −4544/125; `u^(1/24)`: 1, −1, 1, −2, 2, −3; `n = 8`: `s₂(m) = 1,1,2,1,2,2,3,1,2`; `n = 16`: `−v₂(m!)`; `n = 3`: −1, −2, −4, −5, −6, −8 | ok |
| README §7 examples | `B = [[−3,−2],[2,1]]`, `B² = [[5,4],[−4,−3]]`; `η⁴ = Q^(1/6)(1 − 4Q + 2Q² + ⋯)`; `μ = √2 − 1`: `det ρ(R) = 1`, `det ρ(T) = −1`, trace `2is`, s = 0.51329 | ok |
| README §§8.3, 8.4 | `E₀(x(q)) = 1 − 4q + 20q² − 64q³ + 164q⁴ − 392q⁵`; `Σ C_n² xⁿ = 1 + q − 4q² + 5q³ + 12q⁴ − 42q⁵`; both theta formulas agree numerically at `τ = 0.1 + 1.3i` to 7 digits | ok |

Other checks:

- Ownership against main and the open heads. `TauCetiRoadmap/NoncongruenceModularForms` on main
  (closest in vocabulary, 0.24) is a consumer, not a second plan: it cites this roadmap's W1.2–W1.3,
  W1.5–W1.6, W1.8 and W6.3–W6.5 and owns only the strict level, `wohlfahrt_strict` and the transport
  to native forms. All eight ids exist here (§§1.2, 1.3, 1.5, 1.6, 1.8, 6.3, 6.4, and W6.5 = §6.6 by
  the README's former-numbering table). No `Suggested.lean` declaration here has the fully qualified
  name of a declaration of a roadmap I could read; `modularLambda` is also the short name of
  `TauCetiRoadmap.SpecialFunctionsTheta.modularLambda` (theta quotient), a different namespace, and
  README §2.1 targets their equality on `ℍ`. SpecialFunctionsTheta §§2.2, 4.2, 6.1, 6.2, 6.4 state
  what the contract says, including the value at `0.3 + 0.8i`; it does not state the covering.
- Supplier sections read and found to state what the contract says: ModularCurvesPartII §§5.14, 6.3,
  6.4, 6.5, 8.1, 11.4, 15.2, 15.3, 15.5, 15.10; DiophantineApproximationAndTranscendencePartII §§4.1,
  4.5, 4.8 (and headings 4.2–4.7); ConformalMappingPartII §§0.3, 0.5, 1.4, 1.8, 5.1, 5.5, 5.8, 9.19;
  AlgebraicModularFormsAndSerreWeights §2.9; AutomorphicGaloisRepresentations §4.2;
  EtaleCohomologyFoundations §F.0.2; DiophantineApproximationAndTranscendence §§5.2–5.3;
  FuchsianOrbifolds Layer 2 items 3 and 5, Layer 3 items 1–5, Layers 4–5, Layer 6 item 1; BelyiMaps
  §9.1C and §11.1; UniversalCovers Stage 2; QSeriesPartitionsAndMockModularForms §§5.2, 8.1, 8.4a;
  GeometryOfNumbersAndQuadraticArithmetic §4.3 (the triple product is inside the section headed
  "Oppenheim and Duke"); ModularForms §§0.2, 8.0, 8.1 and its table of earlier labels.
- The three declared gaps have the same slugs in `design/plan.json` and in the README, each with a
  named supplier; the two ModularCurvesPartII gaps are precise. The third is R02.
- Padding: no declaration follows by one tactic or one library lemma; no `example`, no `#check`, no
  `set_option`, no `lemma`; imports are `Mathlib` and one existing Tau Ceti module. The docstring's
  reason for not stating §§5.3 and 5.5 (they are implied by the stated equality) is correct, and
  §§7.1–7.2 and §9.3 lack the carriers it names.
- Policy: no process words or pull-request numbers in the README or docstrings; every target has a
  locator; no algorithm.

Source independence: 18 passages compared with 2 sources (15 with CDT25, 3 with KSV10), none shared
beyond formulas and standard names; largest share CDT25, 57 of 64 locators; contents compared with
CDT25: independent (Layer 1 ↔ §4.1, Layer 3 ↔ §3 and §4.2, Layer 4 ↔ §4.4, Layer 5 ↔ §4.3, Layer 6
↔ §6.3; Layer 2 has no counterpart, CDT §§2, 5, 6 belong to other roadmaps, and Layers 4 and 5
reverse CDT §§4.3–4.4; the order of Layers 7, 8, 9 is forced by the `*Needs:*` lines of §§8.5–8.7 on
§§7.3, 7.11, 7.13). Ihara1994 could not be read (settled as uncertified).

## Not verifiable

- README §7.11, API bullet (the `𝓞_K` form of the component theorem), on which
  `exists_deficient_finite_place` rests when `K ≠ ℚ` or `S ≠ ∅`: CDT25 states Theorem 7.3.3 for
  `ℤ[[q]]` only and §7.4.8 over ℚ. The roadmap's argument (conjugate operators, traces, least common
  left multiple) was read and no step failed, but no source states it and it was not checked beyond
  the sketch.
- README §§9.2–9.3: the route through Ihara 1994, Theorem 1 and §4, was not compared with the text
  (uncertified source); CDT25 gives a sketch only (lines 4118–4133).
- The density-one statement of the Bombieri–André theorem used in R02 is recalled from the
  literature (André, *G-functions and Geometry*, Ch. IV; Katz 1982), not read in this pass: neither
  text is in the sources cache.
- Elaboration of the Lean text proposed in R01: no Lean command is available to this pass.
- Wohlfahrt's 1964 paper (Theorem 2) is cited through CDT25 and KSV10 only; its text was not read.

## Source issues

- **Misprint** in CDT25 at proof of Lemma 4.1.7, case (2), printed page 654: the source says the correcting matrix C has lower row (cp, d) and equals the conjugate times diag(p, 1/p); it should be C with rows (a/p, b), (c, pd), the conjugate times diag(1/p, p); affects the proof.
- **Error** in CDT25 at §4.4, definition of f₂, printed page 658: the source says conjugation by A maps the signed group ⟨E, Γ(N)⟩ ∩ Γ₀(p) isomorphically onto itself; it should be onto the subgroup of ⟨E, Γ(N)⟩ with upper-right entry divisible by p; affects the proof.
- **Gap** in CDT25 at proof of Lemma 4.2.3, printed page 656: the source says the normal core of the generators' stabilizers lies in ⟨E, Γ(2N)⟩ with level exactly 2N; it should be the core after intersecting with ⟨E, Γ(2N)⟩ (basis {1} gives SL₂(ℤ)); affects the proof.
- **Misprint** in CDT25 at proof of Theorem 4.3.2, printed page 656: the source says the chosen form lies in R at level 2Np and outside M at level 2N; it should be chosen in R at level 2N outside M at level 2N; affects the proof.
- **Misprint** in CDT25 at Proposition 3.0.1 and §6.3, printed pages 649 and 685: the source says the rank is at most a constant times N³ log N for every N; it should be N³ log(2N), since the left side is 1 at N = 1; affects nothing.
- **Error** in CDT25 at Corollary 2.0.5, (2.0.7), printed page 636: the source says the span over all rational functions of x has the stated dimension bound over ℚ(p); it should be the span over ℚ(p) only (p = x + x⁴/32 gives 4 > e·log(5/2)/log 2); affects a stated result.
- **Misprint** in CDT25 at (1.0.4) and the lines after it, printed page 629: the source says λ(1 − λ)/16 has level Γ₀(2); it should be the theta group ⟨Γ(2), S⟩, a conjugate, since T changes its sign in exp(πiτ); affects nothing.
- **Error** in CDT25 at Corollary 7.3.4, printed page 691: the source says bounded denominators of all components give ker ρ ⊇ Γ(N) and finite image; it should require the values of F to span ℂⁿ (F = (1, 0, 0), ρ = 1 ⊕ σ); affects a stated result.
- **Misprint** in CDT25 at Lemma 7.4.4, printed pages 692–693: the source says θ = (1/πi) d/dτ and θΔ = E₂Δ; it should be θΔ = 2E₂Δ for that θ; affects nothing.
- **Misprint** in CDT25 at §7.4.2, printed page 693: the source says E equals (16x − 1)K − 8∫K, of constant term −1; it should be (1 − 16x)K + 8∫K, of constant term 1; affects nothing.
- **Error** in CDT25 at §7.4.8, printed page 695: the source says a non-archimedean deficient place exists whenever ker ρ is not a congruence subgroup; it should require a noncongruence component of some cuspidal form for ρ (ρ = 1 ⊕ σ has none); affects a stated result.
- **Misprint** in KSV10 at the line after equation (1), proof of Proposition 3, printed page 6: the source says L is the transpose of T times T^(a−1) times the inverse transpose; it should be the inverse transpose first and the transpose last (a = 2 gives [[0,1],[−1,2]] instead of [[2,1],[−1,0]]); affects the proof.

## For the human reviewers

- **Licence.** CDT25 was read in the author's offprint (`sources.toml`, `licence_class = "author-page"`); every page of that copy carries the publisher's line that copyright restrictions may apply.
- **Not tested.** Ihara1994 (`sources.toml`, `status = "uncertified"`) is the only source of README §9.2's proof route; its text was not read, so wording and content of §§9.2–9.3 were not compared with it.
- **Scope.** README §§7.12, 7.13, 8.7 state corrected forms of CDT25 Corollary 7.3.4 and §7.4.8, and §7.11's `𝓞_K` form extends Theorem 7.3.3; no refereed source states these corrected forms.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "44f590142862c4e3e821cc8e49b756f939be0bdc", "job": "RT-ModularFormsPartII~1b", "model": "fable", "worker": "chris-x88"} -->
