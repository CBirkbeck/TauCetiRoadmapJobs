# Review of LogicAndDefinabilityInNumberTheoryPartII (pull request #2438 at 8eb7da8)

**Verdict:** needs changes

## R01 (P1) — Cossart–Piltant's projective threefold resolution has no owner

**Location:** `TauCetiRoadmap/LogicAndDefinabilityInNumberTheoryPartII/README.md:652`: "for `d = 3` Cossart–Piltant's theorem does (Cossart–Piltant, Theorem of the introduction, p. 5 of the HAL version)". Also line 23 ("applied inside 1.4"), the 1.4 *Needs:* line 663 and the Layer 1 Dependencies line 716.

**Claim:** In characteristic two with `d = 3`, the statement of 1.4 needs a smooth projective model over `𝔽₂`, and through it so do 3.1, 5.3, 5.7, 6.9 and the Lean headlines with `d ≤ 3`. That model comes from a 146-page resolution theorem. The README cites the paper itself as a *Needs:* item. No target here, no supplier section and no pinned declaration states the theorem.

**Witness:** `roadmaps grep "Cossart.Piltant"` finds only AdicCoefficientsAndComparisonsPartII §PA.0.12 (its README line 454). That section gives proper modifications, and projective ones only for affine `Y`. Kerz–Saito Theorem 8.1 (kerz_saito line 1862) needs `X` projective.

**Repair:**
- Under "From TauCetiRoadmap.AdicCoefficientsAndComparisonsPartII", add: "What AdicCoefficientsAndComparisonsPartII must provide (gap:projective-threefold-resolution): for a field `k` of positive characteristic, differentially finite over a perfect field, and a reduced quasi-projective `k`-scheme `Z` of dimension three with singular locus `Σ`, a projective morphism `π : Z̃ → Z` with `Z̃` regular, an isomorphism over `Z ∖ Σ`, such that `π⁻¹(Σ)` is a strict normal crossings divisor (Cossart–Piltant, Theorem of the introduction, p. 5 of the HAL version). It is stated in §PA.0.12, next to the proper form."
- Add the slug to `gaps` in `design/plan.json`, with supplier AdicCoefficientsAndComparisonsPartII and section §PA.0.12.
- In the 1.4 *Needs:* line and in the Layer 1 Dependencies, replace "Cossart–Piltant, Theorem of the introduction, p. 5 of the HAL version (for `d = 3`)" with "AdicCoefficientsAndComparisonsPartII §PA.0.12 and gap:projective-threefold-resolution (for `d = 3`)".
- At line 23, replace "is Cossart–Piltant's theorem, applied inside 1.4" with "is requested from that section as gap:projective-threefold-resolution".

## R02 (P2) — The 0.12(b) route retells Poonen's proof of Lemma 4.8 clause by clause

**Location:** `README.md:456`: "Choose `M₀ ⊆ K_u` purely transcendental over `κ(E)(t)` with `[K_u : M₀]` finite, and let `M` be the relative separable closure of `M₀` in `K_u`".

**Claim:** The paragraph "In (b), suppose first `t ∈ L` …" reproduces the proof of Poonen's Lemma 4.8 sentence by sentence, in the same order and with words exchanged. It runs from transcendence of `t`, through `M₀` and `M`, `W`, `π`, `ℓ`, `w`, `η = F^ℓ − 1`, `u₂`, the local parameters and the residue field, to Lemma A.5 and Corollary A.2. The corrections are inserted along the way.

**Witness:** poonen_uniform lines 442–469 (pp. 9–10) follow the same steps in the same order. The longest shared run is 11 words: "Let M be the relative separable closure of M0 in Ku" (line 448).

**Repair:** Replace the paragraph with:

"In (b), if `t ∈ L` then by (a) every coefficient lies in `L_u`, a global function field over the finite field `κ`. 0.6(c) then gives a zero for every pair of outer slots, and a vanishing slot `t − b` gives one at once. If `t ∉ L`, one pair `(a, b)` makes the form anisotropic over `K_u`. *Geometry.* `κ` is relatively closed in `L_u`, because `v` ramifies there. Inside `K_u`, take a purely transcendental subfield over `κ(E)(t)` (the function field of `𝔸¹ × E`) of finite index. Its separable closure in `K_u` is the function field of a geometrically integral `κ`-variety `W` with a smooth map `π : W → 𝔸¹ × E`, and `K_u` is purely inseparable over it. *Arithmetic.* 0.11(e) gives a prime `ℓ > 3`, a point `w ∈ W(𝔽_{q^ℓ})` over `(τ, P)`, and `ρ₁, ρ₂ ∈ R`, nonzero because `ρ_i(P)` is not a pole of `z`, with `τ = z(ρ₁P) + z(ρ₂P)`. *The pair.* With `η = F^ℓ − 1`, put `a = z(η(ξ))` and `b = z(ρ₁(ξ)) + z(ρ₂(ξ))`. These are values at anti-invariant images of the generic point `ξ`, so `a ∈ U₁` and `b ∈ U₂`. *Parameters.* Since `z` has a simple pole at `O` and `η` is étale with `η(P) = O`, the function `a⁻¹` has a simple zero at `P`. The function `t − b` vanishes at `(τ, P)` with `t`-derivative `1`. The two cut out `(τ, P)`, and their pullbacks extend to a regular system of parameters at `w`. *Conclusion.* `[κ(w) : κ]` is `1` or `ℓ`, prime to `n_K`, so `⟨1, −c⟩_{n_K}` stays anisotropic over `κ(w)`. Then 0.6(e) gives anisotropy over the separable part and 0.6(b) carries it to `K_u`. The coefficients lie in `K_u`, not in `K`."

Recomputed on the Check's instance (`κ = 𝔽₅`, `E : y² = x³ + x + 1`, `t = s²`, `P₀ = (2, 1)`): `b = 2·z(P₀) = 1` and `s² − b` vanishes at `s = 1`, so the rewrite reaches the same anisotropy.

## R03 (P3) — The Suggested.lean docstring names the wrong missing carriers

**Location:** `TauCetiRoadmap/LogicAndDefinabilityInNumberTheoryPartII/Suggested.lean:26–28`: "the pins have continuous group cohomology but no twisted Galois coefficients `ℤ/n(d)`, … and no residue maps at discrete valuations, so the detection statements have no carrier". Also lines 31–32: "the pins have no normal crossings divisors".

**Claim:** The detection statements of 1.3 use restriction to henselizations, not residue maps. With `ℓ = 2` they need no twist. Tau Ceti does have normal-crossings charts. The carriers that are actually missing are the henselian valued field `K_w`, Kato's groups and simple normal crossings divisors on schemes.

**Witness:** Mathlib has `ContinuousCohomology.map` (`RepresentationTheory/Homological/ContCohomology/Functoriality.lean:148`) and `Field.absoluteGaloisGroup.map` (`FieldTheory/AbsoluteGaloisGroup.lean:87`). Tau Ceti has `TauCeti.SmoothPair.AlgebraicChart` (`AlgebraicGeometry/SmoothPair/AlgebraicChart.lean:45`).

**Repair:** Replace lines 24–28 with:

"* the cohomological local–global principles of Layer 1 (Kerz–Saito's principle with prime coefficients, the principle in characteristic two, Kato's two-dimensional principle). Mathlib's `continuousCohomology`, with `ContinuousCohomology.map` along `Field.absoluteGaloisGroup.map`, gives Galois cohomology and restriction. But the detection statements restrict to the henselization `K_w` of a discrete valuation, and the pins have no henselian valued field: Tau Ceti's `TauCeti.Henselization.algebra` is a ring with no fraction field attached. The pins also have no Kato groups of logarithmic differentials in characteristic two, and no residue maps for the exact sequence of Kato's principle;"

In lines 31–32, replace "and the pins have no normal crossings divisors" with "and the pins have no simple normal crossings divisor on a scheme (Tau Ceti's `TauCeti.SmoothPair.AlgebraicChart` is a normal-crossings chart on one affine ring)".

## Verified sound

| Target | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| 0.2 `IsGeometricPrimeDivisor` | `ℤ_(p) ⊂ ℚ`; `t`-adic on `ℚ(t)`; `ord_s f(s, eˢ−1)` on `ℚ(s,t)` | `ringChar 𝔽_p = p ≠ 0`; `δ(ℚ)+1 = 2 = δ(ℚ(t))`; `1+1 = 2 ≠ 3` | holds; dittmann_pop p. 2, lines 59–63 |
| 1.2 Jannsen adapter | `K = ℚ(x)`, `α = (−1)³` | finite and complex restrictions `0`; real: `8⟨1⟩` anisotropic over `ℝ(x)` | holds; Fact 2.1 line 158; jannsen_hasse lines 65, 109 |
| 2.2 tails and norms | `ℚ₃`, `a₀ = −1`, `a₁ = 3, 2`; `ℚ`, `a₀ = 1` | `v₃(3)` odd, not a norm; `1+1−2 = 0`; `uv(1,0) = 0` | holds; proof of Lemma 3.5, pp. 9–10 |
| 2.4 / 2.8 abundance | `ℚ`, `l₁ = ℚ(i)`, `Σ = {2}` | `145 ≡ 1 mod 72`; `3` nonsquare mod `5`; square at `2, 3` | holds; Prop 3.8 pp. 10–11, line 461 |
| 3.3 root fields | `a_d/θ² = −1/4` over `ℚ`; `τ = 0`; `𝔽₂(t)` | `(X − 1/2)²`, `K_θ = ℚ`; `X² − X` splits; `X² + X + t` separable irreducible | holds; N/R 4.1(3), line 611 |
| 4.2 stabilizers | `{1}`, `ℤ ⊂ ℚ`, `∅` | `{1}`; `ℤ` (with `xB = B`: `±1`); `K` | holds; N/R 4.1(4), line 615 |
| 4.5 ball stabilizer | `κ(t)`, `a = t³` | `B = t²κ[t]_(t)`; `(1/t)·t² = t ∉ B` | holds; line 618 |
| 4.7 intersection | `Stab(ℤ ∪ ℤ√2)` in `ℚ(√2)` | `√2·m√2 = 2m ∈ ℤ`, so `√2 ∈ Stab`, `≠ ℤ = Stab ℤ ∩ Stab ℤ√2` | Check correct; Thm 4.2(1) pp. 14–15 |
| 4.8 isolation | genus `0`, `m = 1` | Tau Ceti lemma needs `n ≥ 2g = 0`; `w(1/f) = 1` odd | holds; Thm 4.2(2), line 652 |
| 5.1 niceness formula | `⟨1,−3,−5,15⟩` | `(5,3)₂ = 1`; `(5,3)₃ = (2/3) = −1` | Hensel test must accept `2`; Def 3.3 p. 8 |
| 5.2 guarded formula | `V_a = ∅`, `{w}`, `{P,Q}` | `K` fails "omits"; `O_w` passes; `O_P ∩ O_Q` fails `x` or `x⁻¹` | holds; Recipe 4.3 p. 15, line 665 |
| 6.2 normalizations | `ℚ(√2)`, `T = ()`; `𝔽₂(t^{1/2}, s)` | `ℤ[√2]`; `𝔽₂[t^{1/2}, s]` finite over `𝔽₂[t, s]` | holds; proof of Prop 5.1 p. 16, line 701 |
| 6.4 height one | `ℚ(t)`, `T = (t)` | `⋂ W_T = ℚ[t]`; adding the place at infinity gives `ℚ` | holds; line 708 |
| 6.5 flags | `ℚ`, `e = 0` | `V_∅` finite places, `⋂ = ℤ` | holds; printed index `W_T` is a misprint, line 732 |
| 8.4 domain sentence | `B = 𝔽₉`, `ℤ` | `θ₉`; QFA of `ℤ` | holds; akns Cor 3.2 p. 21, line 961 |
| 0.12(b) (R02) | `κ = 𝔽₅`, `y² = x³+x+1`, `K = 𝔽₅(u,s)` | `#E = 9`; `U₂ ∩ K = {0}`; `⟨1, s²⟩` zero `(2s,1)`; corrected `b = 1`, `⟨1,−2⟩` anisotropic | correction verified |
| 1.4, `d = 3` (R01) | char `2`, `δ = 3` | Thm 8.1 projective alternative, `(G)_{2,1}` by Remark 6.1(2), lines 1862, 1571 | detection sound; model unowned |
| `exists_formula_valuationSubring_ne_top` | `ℚ`; `𝔽_q(t)`; `𝔽_q` | fibres `ℤ_(p)`; place at infinity included; `δ(𝔽_q) = 0` excluded | holds; poonen_uniform Thm 2.2 |
| `exists_sentence_kroneckerDimension_eq` | `n = 0`; `𝔽₃(t)` | `σ₀` ⇔ finite; `(1+i)⁴ = −1`, `t̄⁴⁰ = −1`, `⟨1,−t,π,−tπ⟩` anisotropic | holds; Thm 2.3, line 128 |
| `exists_sentence_charZero` | `ℚ`; char `p` | `ℤ ≠ 2ℤ`; odd `p`: `s = 2·((p+1)/2)s`, `Z = 2Z`; `p = 2`: `2 = 0` | holds; Thm 1.1, line 47 |
| `exists_formula_mem_primeField` | `𝔽₉(t)`; `𝔽₉` | `𝔽₃[t] ∩ 𝔽₃[1/t] = 𝔽₃`; finite fields excluded | holds; Thm 1.2, line 49 |
| `exists_formula_not_algebraicIndependent` | `n = 0`; `n = 1` in `ℚ(t)`; `𝔽_q` | `Fin 0` family independent, formula false; `0` dependent, `t` not; all dependent | holds; Thm 1.4, line 55 |
| `exists_formula_isGeometricPrimeDivisor` | `d = 0`; `ℚ`; `𝔽_q(t)`; char 2, `d = 2` | none; `ringChar 𝔽_p ≠ 0`; every place; `c_n = n` threshold | holds; hypothesis = `(H_d)`, line 70 |
| `exists_formula_arithmeticNormalization` | `𝔽₄`; `𝔽₂(t)`, `T = (t²)`; `ℚ(s)` | `𝔽₄`; `𝔽₂[t]`; `ℤ[s]` | holds; Prop 5.1, Remark 5.4, lines 694, 763 |
| `exists_sentence_realize_iff_nonempty_ringEquiv_of_isDomain` | `𝔽₉`; `ℤ` vs `ℤ[i]`, `ℤ[1/2]` | `θ₉`; QFA sentence of `ℤ` | holds; akns line 961 |
| `exists_sentence_realize_iff_nonempty_ringEquiv` | `𝔽₄`; `ℚ` vs `ℚ(i)` | `θ₄`; `char ≠ 2 ∨ δ ≤ 3` = Thm 1.1 hypothesis | holds; line 44 |
| 7.6 bi-interpretability (not in Lean) | `ℚ` | `R_∅ = ℤ`, comparison `xb = a` | holds; Thm 1.2, line 52 |

- **Gate.** The worker's gate is OK on all checks, including the build. A rerun of the dependency check gives "depcheck: 250 roadmaps, 2380 edges, 0 problem(s)". The merge order puts this roadmap at line 423, after QuadraticFormInvariantsPartII (line 422).
- **Elaboration.** `lake env lean Suggested.lean` gives only the 9 `declaration uses sorry` warnings. `#check @` of all 11 declarations in a scratch copy matches the README, with no binder lost. The one-tactic probe (`rfl | trivial | decide | infer_instance | simp | exact`) fails on all 9 theorems.
- **Library declarations.** 39 declarations elaborated at the pins, for example `TauCeti.Place.exists_ord_eq_neg_and_forall_ne_ord_nonneg` (`IsFunctionField`, `IsIntegrallyClosedIn`, `2g ≤ n`) and `Field.FG` (`Mathlib/Algebra/Field/Subfield/Basic.lean:458`).
- **Sources.** About 30 locators checked against the text: the 15 sampled targets; jannsen_hasse lines 65, 109, 191; kerz_saito lines 1562, 1571, 1852–1862; cossart_piltant line 162; pop_eei2 lines 120, 475, 517, 546.
- **Cross-roadmap citations.** 47 supplier sections resolved, on main, in Completed (Chebotarev, GlobalNumberFields, RealAlgebraicGeometry) and at 15 open heads. LocalFieldsRamificationPartII §1.3 and §5.2 are bold targets inside its §1.2 and §5.1.
- **Declared gaps.** All five slugs appear in both `design/plan.json` and the README, and each is precise and single. Searches for the function-field Hasse norm theorem and for interpretation homotopy found no other owner. CJS Corollary 0.4 is used only inside the §PA.0.11–0.12 routes.
- **Pull request text.** The summary and prose agree with the head: a new folder, nine Lean headlines, the suppliers present in the merge order, and the `RS(𝔽₂)` scope.

Overlap check: read QuadraticFormInvariantsPartII, AdicCoefficientsAndComparisonsPartII, LogicAndDefinabilityInNumberTheory, LocalFieldsRamificationPartII and EtaleDualityAndPerverseSheavesPartII; the lists for main and for results are empty. Shared objects and their owners:
- Kronecker dimension, the Jannsen `ℤ/2` principle, the dimension theorem and isotropy loci: QuadraticFormInvariantsPartII §§5.7, 6.3, 6.5, 7.2 (restated here only as the Lean `kroneckerDimension`, with an identical body, and the 1.2 adapter).
- Interpretations: LogicAndDefinabilityInNumberTheory §§0.1–0.4. Its §§4.24–4.33 define `ℤ` in `ℚ` only, so nothing is shared with 0.7.
- Henselization and composition: LocalFieldsRamificationPartII §§1.1–1.3, 5.1–5.3.
- Resolution and alterations: AdicCoefficientsAndComparisonsPartII.
- EtaleDualityAndPerverseSheavesPartII: nothing shared. Kato complexes and Kato homology have no other owner.

Source independence: 14 passages compared with 5 sources (dittmann_pop, poonen_uniform, akns, pop_eei2, kerz_saito). One passage is shared (0.12, an 11-word run plus a clause-by-clause match, R02); the others share only statements forced by hypotheses (longest 8 words, the definition in 2.1). The largest share is dittmann_pop, 68 of about 276 source citations. Contents compared with dittmann_pop: Layers 1–8 follow its §§2–5 in an order the *Needs:* lines force (1.2–1.4 → 3.1 → 4.6 → 5.3 → 6.4 → 7.6 → 8.5). The scopes are regrouped: its §3 is split across Layers 2–3 and its §4 across Layers 4–5, and Layers 0, 1.1a, 1.3a, 1.5, 1.6 and 8 are not in it. Result: independent.

## Not verifiable

- kato_hasse (Corollary p. 145, p. 149, §1): uncertified, paywalled; cited by locator only.
- merkurjev_suslin (Theorem 12.2): uncertified; cited by locator only.
- moret_bailly (Lemma 11.1(i)): uncertified; read only as quoted at poonen_uniform line 144.
- lenstra_cm (Theorem 1(a)): uncertified; cited by locator only.
- Jannsen's published numbering (Corollary 0.8 of the Annals version): only arXiv v2 read. dittmann_pop line 154 confirms Theorem 0.4 and Theorem 0.10, not Corollary 0.8.

## Source issues

- **Error** in poonen_uniform at Lemma 4.8, p. 9 (arXiv v1): the source takes `U₂` inside `K` and tests isotropy over `K`, so `U₂ ⊆ {0}` and the test accepts `s² ∉ L` in `𝔽₅(u, s)`; it should take the sums in `K_u` and test over `K_u`; affects a stated result.
- **Error** in poonen_uniform at proof of Lemma 4.8, p. 10: the source says `x(η̄)` has a simple pole at `P`; it has a double pole, and `z ∘ η` should be used instead; affects the proof.
- **Gap** in poonen_uniform at proof of Lemma A.5, p. 14: the source embeds `K` in `k′((t₁))⋯((t_m))` with the coefficients of `q` constant, which needs `k′/k` separable; it should argue through quotients by parameters, as in README 0.6(e); affects the proof.
- **Misprint** in poonen_uniform at proof of Lemma A.4, p. 13: the source says "a power of `t`"; it should be "a power of `π`"; affects nothing.
- **Misprint** in dittmann_pop at proof of Proposition 5.1, p. 16: the source indexes `V_T` by `w ∈ W_T`, which are rank-one divisors; it should be the geometric prime `e`-divisors, whose residue fields are number fields (also in Lemma 5.3, p. 17); affects the proof.
- **Misprint** in dittmann_pop at references [P1], p. 18: the source gives pages "385–308"; it should be 385–408; affects nothing.
- **Error** in akns at proof of Theorem 3.1, p. 23: the source says the core `D` is "therefore a Dedekind domain"; for `A = ℤ[√5, t]`, `D = ℤ[√5]` is not, and a conductor element must be inverted; affects the proof.
- **Misprint** in akns at §2.9, p. 19: the source defines QFA through "every `L`-structure `A′`"; it should be every finitely generated `L`-structure; affects nothing.
- **Error** in pop_eei2 at Notation/Remarks 3.5, p. 2102: the source sets the threshold `v_s(β − 1) > 2v_s(2n)`, which is infinite in characteristic two, so `H_δ` omits `1`; it should be `2v_s(n)` when `char k = 2`; affects the proof.
- **Gap** in pop_eei2 at proof of Lemma 4.3(3), p. 2105: the source applies Lemma 3.3 to the minimal regular model of `L|l`, which needs a smooth generic fibre; in characteristic `p` the fibre can be non-smooth (README 5.6, `p = 5`); affects the proof.

## For the human reviewers

- none
