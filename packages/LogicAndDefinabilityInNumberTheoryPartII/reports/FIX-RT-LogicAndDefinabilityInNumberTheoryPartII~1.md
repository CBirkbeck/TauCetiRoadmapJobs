# Repair report FIX-RT-LogicAndDefinabilityInNumberTheoryPartII~1

Ten findings from two red-team reviews (pass a: F01–F03; pass b: F01–F07). Two pairs overlap and are each settled once below. All ten are settled by edits to this package. None is marked not actionable.

## RT-LogicAndDefinabilityInNumberTheoryPartII~1a/F01 (P1) — applied differently

The finding is right. §1.5 had no route, and Kato's proof goes through higher class field theory (kerz_saito line 125–126), which nobody owns. The proposed dyadic repair is wrong, though. Kerz–Saito's §8 over a henselian discrete valuation ring assumes ℓ invertible (kerz_saito line 1826), so their second alternative only covers ℓ = char over a finite field.

What changed:
- §1.5 now cites Kato's exact sequence as background and proves the two things Pop's lemmas actually use (pop_eei2 lines 420–452, 489, 583):
  - (a) detection. For number fields this is restricted to classes that vanish above 2; it comes from §1.2 + §1.3 and is the top degree of Kerz–Saito Theorem 8.4.
  - (b) the complex property, via coniveau and absolute purity.
- §1.3 is generalised to a prime ℓ.
- §1.6(d) and the §5.6(a) route are updated to match.

## RT-LogicAndDefinabilityInNumberTheoryPartII~1a/F02, RT-LogicAndDefinabilityInNumberTheoryPartII~1b/F01 (P2) — applied

Both are right. Jannsen's Theorem 0.6 needs (RS1) and (RS2) in every dimension (jannsen_hasse lines 191, 1889–1897, 2183–2185).

What changed in §1.4 (renamed "The principle in characteristic two"):
- It is now split by dimension: d ≤ 3 uses Kerz–Saito Theorem 8.1, second alternative, with condition (G)_{2,d−2}; d > 3 uses Jannsen under RS(𝔽₂).
- The "d ≤ 4 unconditional (Jannsen, p. 5)" claim is deleted.
- (G) is requested as gap:embedded-resolution-dimension-two, i.e. Cossart–Jannsen–Saito Corollary 0.4, which I fetched (cossart_jannsen_saito line 131–134).
- The §1.4 Needs line, the Checks, the §5.3 Check and the Conventions are updated.

## RT-LogicAndDefinabilityInNumberTheoryPartII~1a/F03, RT-LogicAndDefinabilityInNumberTheoryPartII~1b/F04 (P3) — applied

Both are right: poonen_uniform lines 49–50 state Theorem 1.2, and no section of the README stated it.

What changed:
- New §0.13a, "The prime subfield of every infinite finitely generated field", with four Checks.
- New Lean headline `exists_formula_mem_primeField`, with `[Infinite K]`.
- The route uses 0.7(3) and 0.7(5) as they stand: ℚ = fractions of ℤ, and 𝔽_p = 𝔽_p[x] ∩ 𝔽_p[1/x]. So b/F04's extra item 0.7(2a) is not needed.

## RT-LogicAndDefinabilityInNumberTheoryPartII~1b/F02 (P3) — applied

The finding is right: `algebraicIndependent_unique_type_iff` is at `Mathlib/RingTheory/AlgebraicIndependent/Transcendental.lean:38`.

What changed:
- `exists_formula_isAlgebraic_primeField` is deleted from `Suggested.lean`.
- README §0.13 now reads "Prove:" and says the statement is the case n = 1 of 0.14(b) (Poonen Remark 1.5).
- The docstring of `exists_formula_not_algebraicIndependent` notes the case n = 1.

## RT-LogicAndDefinabilityInNumberTheoryPartII~1b/F03 (P3) — applied

The finding is right: with n = 3 over ℚ, a vertical point over 3 has a residue field of characteristic 3.

What changed: §1.5 now fixes n = n_K (2 away from characteristic two, 3 in characteristic two), and its first Check records the k = ℚ, n = 3 non-example. §1.6(d) now states n = n_K.

## RT-LogicAndDefinabilityInNumberTheoryPartII~1b/F05 (P2) — applied

The finding is right: ClassFieldTheory restricts itself to number fields (its README lines 38, 244 and 1839). ArithmeticGaloisDuality §R02.3.2 item 1 states the function-field Brauer sequence.

What changed: ArithmeticGaloisDuality §R02.3.2 is added to:
- the Needs of §§1.1, 1.6 and 5.6,
- the Layer 1 and Layer 5 Dependencies,
- the supplier contract (with the exact sequence spelled out),
- the Checks of §1.1 and §1.3.

The pattern also appeared in §5.6: Pop's Lemma 3.3 uses Brauer–Hasse–Noether for κ(x_s).

## RT-LogicAndDefinabilityInNumberTheoryPartII~1b/F06 (P3) — applied

The finding is right. At NeronModelsAndSemistableAbelianVarieties (#852), §5.1 is Néron–Ogg–Shafarevich over a henselian ring, and §5.2 is `GoodIsogeny` over any discrete valuation ring.

What changed: "§5.1 (Néron–Ogg–Shafarevich, isogeny invariance…)" becomes "§5.2 (`GoodIsogeny`: …)" in all five places (Scope, supplier contract, §0.9 Needs, §0.12 Needs, Layer 0 Dependencies). The Néron–Ogg–Shafarevich clause is dropped from the contract.

## RT-LogicAndDefinabilityInNumberTheoryPartII~1b/F07 (P3) — applied

The finding is right. The pin has `IsDedekindDomain.FiniteAdeleRing.denseRange_algebraMap` at `TauCeti/RingTheory/DedekindDomain/FiniteAdeleRing/Basic.lean:476` and `TauCeti.GlobalNumberFields.weakApproximation_denseRange` at `TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean:208`.

What changed: the old names `denseRange_algebraMap_finiteAdeleRing` and `GlobalNumberFields.weakApproximation_denseRange` are replaced by the pinned names, and both pinned declarations are added under "From Tau Ceti".

## Checks run

- **Elaboration.** `lake env lean packages/LogicAndDefinabilityInNumberTheoryPartII/Suggested.lean` (run from the content checkout) gives eight `declaration uses 'sorry'` warnings, one per theorem, and no errors.
- **Signatures.** One scratch file with `#check @name` for all ten declarations elaborated. Every type matches its README statement. `exists_formula_mem_primeField` elaborates as `∃ φ, ∀ (K : Type u_1) [Field K] [Field.FG K] [Infinite K] [Ring.CompatibleRing K] (x : K), φ.Realize ![x] ↔ x ∈ ⊥`. The other nine types are unchanged, and no binder is lost.
- **Dependency check** (the gate command of the brief):

```text
depcheck: 241 roadmaps, 2271 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line.
- **`roadmaps resolve`** on the README: no cross-roadmap citation and no Lean name found nowhere.
- **Gate failures:** none were listed.

## Adversarial pass (changed and added statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 detection with ℤ/n | n = 3, X = ℙ¹ over 𝔽₂ | `Br(𝔽₂(t))[3] → ⊕ H¹(κ(x), ℤ/3)` injective (BHN, ArithmeticGaloisDuality §R02.3.2) | sound | definition extended |
| 1.3, prime ℓ | ℓ = 3, R = 𝔽₂; ℓ = 2, R = ℤ₂^h; ℓ = 2, R = 𝔽₂; d = 0 | admissible; excluded (kerz_saito l.1826); excluded (char); `H¹(𝔽_q, ℤ/ℓ) = ℤ/ℓ ≠ 0` into an empty sum | sound | Check added |
| 1.3, `KH₀ = ℤ/ℓ` over a finite field | X proper connected over 𝔽_q | `dim T_X = 0` gives `Λ_G = ℤ/ℓ` (kerz_saito l.1858) | sound | — |
| 1.4, d ≤ 3 | d = 1, 2, 3 | (G)_{2,−1} vacuous; (G)_{2,0} = blow up points; (G)_{2,1} by CJS Cor. 0.4 (q ≤ 2) | sound | split |
| 1.4, first alternative | ℓ = 2 on Spec 𝔽₂ | 2 not invertible, so the projective alternative is used | X must be projective | Check |
| 1.4, d = 4, `𝔽₂(s,t,u,v)` | X = ℙ⁴ | a = 4 ≤ 4, (G)_{2,2} by CJS | holds without RS | Check corrected |
| 1.4, Jannsen alone at d = 3 | Cossart–Piltant model | RS needs (RS2) in all dimensions (jannsen l.1895) | not covered | negative Check |
| 1.5(a), function field | k = 𝔽₂(s), n = 3, 𝒳 = ℙ¹ × ℙ¹ | 1.3 with ℓ = 3, R = 𝔽₂: `KH₂ = KH₁ = 0`, `KH₀ = ℤ/3` | sound | — |
| 1.5(a), number field | k = ℚ(i), 𝔭 = (1+i) | `v(2) = 2`; H_δ threshold `2v(4) = 8 > 2v(2) = 4`, so β is a square at 𝔭 | hypothesis met by 5.5 classes | Check |
| 1.5(a), without √−1 | K = ℚ(x), α = (−1)³ | residues 0 where 2 is invertible; `H³(ℚ₂^h) = 0` (cd₂ = 2); α ≠ 0 at ℝ | (a) fails, so the hypothesis is needed | negative Check |
| 1.5(a), complex places | k ∋ √−1 | `cd₂(k̄(X)) = 1`, so `H³ = 0` | sound | — |
| 1.5(a), base change | v non-dyadic, `𝒳_v = 𝒳 ×_S O_v^h` | x′ vertical: same special fibre, e = 1; x′ horizontal: `k_v/k` separable, so e = 1; `∂_{x′} res = res ∂_x` | sound | — |
| 1.5(b) | α = {t, π, b}, x0 = (t, π) over non-dyadic s | at (t): `∂_s{π, b} = b̄`; at (π): `∂_{t̄}{t̄, b̄} = −b̄`; sum 0 | sound | — |
| 1.5, n = n_K | k = ℚ, n = 3 | char κ(x) = 3 over 3 | excluded | Check |
| 1.6(d) | A split versus division over K̂_x | split: `a∪b = 0`, every c a norm; division: Merkurjev–Suslin | sound | dyadic clause added |
| 5.5 API, henselization | n = 3, char 2, `v(β − 1) > 0` | `f′(1) = 3` unit, Hensel in henselian fields | sound | wording |
| 5.6(a), dyadic vanishing | s ∈ U_f gives n invertible (pop l.348) | dyadic s ∉ V_δ, so β is an n-th power there | sound | route sentence |
| 0.13a | ℚ(√2, t); 𝔽₉(t); 𝔽₂(t); 𝔽₉ | ℚ; 𝔽₃; `𝔽₂[t] ∩ 𝔽₂[1/t] = 𝔽₂`; empty family gives 𝔽₉ ≠ 𝔽₃ | sound, finite case excluded | new |
| `exists_formula_mem_primeField` | ℚ, 𝔽_p(t), `𝔽_{p²}` | `⊥ = ⊤`; `⊥ = 𝔽_p`; no uniform formula (CDM, poonen l.51) | `[Infinite K]` is needed | new |
| `exists_formula_not_algebraicIndependent`, n = 1 | x ∈ ℚ(t) | `¬AlgIndep ↔ IsAlgebraic` (Mathlib l.38) | the 0.13 statement | docstring |
| `GoodIsogeny` use in 0.12(a) | E_u bad at v, A_i good, local ring not henselian | §5.2 covers any DVR | sound | citation |

## Ownership and suppliers

**Ownership.** I searched main and the open heads by object (`roadmaps grep` for Kerz–Saito, Kato complex, embedded resolution, absolute purity, Gros–Suwa, logarithmic Hodge–Witt, Katz–Messing):
- No other roadmap states Kerz–Saito's or Kato's principle (only Hyodo–Kato complexes, which are unrelated). This roadmap stays their owner.
- Embedded resolution of closed subschemes of dimension ≤ 2 in regular excellent schemes in positive characteristic is stated nowhere. ResolutionOfSingularitiesCharacteristicZero covers characteristic zero only; EnriquesSurfaces covers surface ambients only.
- AdicCoefficientsAndComparisonsPartII §PA.0.12 consumes Cossart–Jannsen–Saito Corollary 0.4 inside its route. It is earlier in the merge order, so it is asked for the statement: gap:embedded-resolution-dimension-two, added to `design/plan.json` and to the supplier contracts.

**New supplier sections cited.** All are earlier in the merge order or on main:
- LefschetzPencilsAndVanishingCycles §0.10 (absolute purity)
- PadicDifferentialEquationsAndRigidCohomology §RD.7.7 (Katz–Messing)
- CrystallineCohomology §§CR.4.7–CR.4.8 (on main)
- AdicCoefficientsAndComparisonsPartII §PA.0.12
- ArithmeticGaloisDuality §R02.3.2 (already a supplier)

**Sources.** `cossart_jannsen_saito` (arXiv:0905.2191v2) was fetched and recorded as certified. Locators were updated for `kerz_saito`, `jannsen_hasse` (Conjecture 3, p. 4, replaces p. 5), `poonen_uniform` (Remark 1.5) and `kato_hasse` (§1, uncertified, cited by locator only). `needs-references.toml` was not created.

## For the maintainer

- **Lean names.** `exists_formula_isAlgebraic_primeField` is removed and `exists_formula_mem_primeField` is added. No other roadmap cites either name.
- **Renamed headings.** §1.3 is now "Kerz–Saito's principle with prime coefficients" and §1.4 is now "The principle in characteristic two". The section numbers are unchanged.
- **§1.5 is restated.** It no longer claims Kato's full four-term exactness for number fields; it states only detection away from 2 and the complex property, which are the parts Pop 2017 uses. A reviewer who wants Kato's full theorem for number fields would need higher class field theory, which no roadmap owns.
- **Remaining unowned input (already present before this round).** The weights of p-adic cohomology that Kerz–Saito's Lefschetz condition uses for ℓ = char come from [CTSS] and Gros–Suwa. They are now routed through CrystallineCohomology §CR.4.7 and PadicDifferentialEquationsAndRigidCohomology §RD.7.7 (Katz–Messing). The step from crystalline slopes to the weights of `H^i(X, ℚ_p(j))` (Milne) has no explicit owner; Jannsen's route for d > 3 had the same gap before this round.
- **Untrusted text.** Neither review contained instructions addressed to the worker.
