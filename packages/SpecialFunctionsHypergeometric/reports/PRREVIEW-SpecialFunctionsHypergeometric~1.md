# Review of SpecialFunctionsHypergeometric (pull request #2089 at 9ce2a1e)

**Verdict:** needs changes

## R01 (P1) — The Layer 2 example on 15.5.18 at `c = 1` is false

**Location.** `TauCetiRoadmap/SpecialFunctionsHypergeometric/README.md` line 423: "15.5.18 at `c = 1`, where its first term vanishes and it reduces to a two-term relation."

**Claim.** Line 264 makes every Example a statement to prove, and this one is false. At `c = 1` the term `c(c − 1)(z − 1) F(a, b; c − 1; z)` does not vanish. By 15.2.3_5, `(c − 1) F(a, b; c − 1; z) = Γ(c) 𝐅(a, b; c − 1; z)` tends to `𝐅(a, b; 0; z) = a b z F(a + 1, b + 1; 2; z)`. If the term is instead read with Lean's junk value (`gaussHypergeometric a b 0 z = 0`), the remaining two-term relation is false.

**Witness.** At `(a, b, z) = (0.3, 0.7, 0.4)` the two-term sum `(a + b − 1) z F(a, b; 1; z) + (1 − a)(1 − b) z F(a, b; 2; z)` is `0.0881917`, not `0`. The first term at `c = 1 ± 10⁻⁶` is `−0.0881923` and `−0.0881910`.

**Repair.** Replace the bullet with: "15.5.18 in regularized form, `(z − 1) 𝐅(a, b; c − 1; z) + (c − 1 − (2c − a − b − 1) z) 𝐅(a, b; c; z) + (c − a)(c − b) z 𝐅(a, b; c + 1; z) = 0` for all parameters. At `c = 1` its first term is `(z − 1) a b z F(a + 1, b + 1; 2; z)` (15.2.3_5); at `(a, b, z) = (0.3, 0.7, 0.4)` the three terms are `−0.0881917`, `0` and `0.0881917`." Recomputed on that instance: the three terms sum to `0` within `10⁻¹⁶`.

## R02 (P2) — Formulas other chapters hand to this roadmap are handed on to no roadmap

**Location.** README lines 116–118: "The formulas of other DLMF chapters through the continued Gauss function, which other roadmaps leave to this chapter: they belong to roadmaps that consume this one". Lines 953–958 repeat the same hand-off: "belong to roadmaps that consume both".

**Claim.** Two other roadmaps give these formulas to the Chapter 15 roadmap: SpecialFunctionsEiLiErfIncompleteGamma (on main) and SpecialFunctionsConfluent. This README passes them on to unnamed roadmaps, so the formulas have no owner. They are DLMF 8.14.5–8.14.6, 8.17.9 and 8.19.25 off the disc, 13.4.8, 13.4.12, 13.4.15, 13.10.3, 13.10.7, 13.16.9 and 13.23.4, and SpecialFunctionsBessel's list.

**Witness.** `TauCetiRoadmap/SpecialFunctionsEiLiErfIncompleteGamma/README.md` lines 1668–1669 (main) say these formulas "belong to a hypergeometric roadmap (DLMF Chapter 15)". `TauCetiRoadmap/SpecialFunctionsConfluent/README.md` line 1140 (head of its pull request) says they belong "to a roadmap for DLMF Chapter 15".

**Repair.** Give the formulas one owner and delete "roadmaps that consume both". Either way, a named follow-up under "Planned for follow-up roadmaps" carries what this roadmap does not own: "SpecialFunctionsHypergeometric, Part II", which consumes this roadmap together with SpecialFunctionsConfluent and SpecialFunctionsBessel.
- **Split ownership.** State 8.14.5–8.14.6, 8.17.9 and 8.19.25 on the cut plane in a new Layer 9 subsection. SpecialFunctionsEiLiErfIncompleteGamma is on main and may be consumed. Part II then owns the Chapter 13 formulas and Bessel's list.
- **All in Part II.** Part II owns all three groups.

## R03 (P2) — Two roadmaps already own special cases of the continued function, and neither is cited

**Location.** README lines 41–42 ("It needs no other special-function roadmap") and "What it does not own" (lines 106–118). Neither place mentions the two roadmaps below.

**Claim.** ConformalMappingPartII (on main) owns two special cases of this roadmap's targets: 15.10.1 for the native `₂F₁` on the disc, and 15.8.10 at `m = 0, b = a`, a continuation of `₂F₁(a, a; 2a; ·)` across the slit disc around `z = 1`. SpecialFunctionsBessel owns the continuation of `𝐅` to `ℂ \ [1, ∞)` at its own parameters. Each object therefore has two owners.

**Witness.** `TauCetiRoadmap/ConformalMappingPartII/README.md` §4.1 (lines 603–607) and §4.6 (lines 651–670, `zero_balanced_connection`, "DLMF 15.8.10, specialized to m=0 and b=a"). `TauCetiRoadmap/SpecialFunctionsBessel/README.md` line 161 (ownership table) and §8.2 line 1206 (`exists_integral_cpow_mul_exp_mul_besselJ`).

**Repair.** In Scope and ownership:
1. Cite ConformalMappingPartII §4.1 and §4.6, and say in one clause that 3.1 and 5.2 are their general cases on the cut plane for all parameters. A roadmap on main is earlier than any open one, so this roadmap cites it.
2. State that 1.2–1.4 give SpecialFunctionsBessel's `G` as `𝐅((μ + ν)/2, (μ + ν + 1)/2; ν + 1; ·)`, which is unique because the cut plane is connected.
3. Place this roadmap before SpecialFunctionsBessel: its only roadmap supplier is ZerosOfLFunctions.
4. List SpecialFunctionsBessel 8.2 (10.22.49) under Downstream consumers, so that Bessel cites 1.2–1.4 rather than building `G` itself.

## R04 (P2) — Headline results that are statable at the pins are missing from Suggested.lean

**Location.** `Suggested.lean` lines 9–11: "this file states a selection of them, and discharging it finishes neither a layer nor the roadmap."

**Claim.** The Summary (README lines 17–30) lists the following deliverables. Each is statable with this file's `𝐅` and `gaussHypergeometric`, `Complex.digamma`, `Filter.Tendsto` and Mathlib's series, and none is stated:
- the limits at `z = 1` (15.4.21–15.4.23);
- the circle-of-convergence trichotomy of §15.2(i);
- the logarithmic connection formulas 15.8.8–15.8.11;
- Kummer's 24 solutions (15.10.11–15.10.16);
- the logarithmic solution 15.10.8;
- Riemann's reduction 15.11.7;
- 15.6.7 and the fractional integrals 15.6.8–15.6.9;
- the generalized Legendre relation 15.16.5.

The docstring names no headline as unstatable, although the loop integrals 15.6.2–15.6.5 need contour pieces.

**Witness.** The two statements below elaborate against the pins in a scratch copy of the file, with only the `sorry` warnings (47 + 2). The 15.8.10 form gives `𝐅(0.3, 0.7; 1; 0.6) = 1.2009006585` and `𝐅(1.4, −0.6; 0.8; 1.5 − 0.4i) = −0.2691548383 + 1.3523388614 i`, matching Euler's integral.

**Repair.** Add one theorem for each item. For example:

```lean
/-- **4.2** DLMF 15.4.23. -/
theorem tendsto_gaussHypergeometric_div_cpow_one_sub {a b c : ℂ} (hc : ∀ k : ℕ, c ≠ -k)
    (h : (c - a - b).re < 0) :
    Tendsto (fun x : ℝ => gaussHypergeometric a b c x / (1 - (x : ℂ)) ^ (c - a - b)) (𝓝[<] 1)
      (𝓝 (Gamma c * Gamma (a + b - c) / (Gamma a * Gamma b))) := sorry

/-- **5.2** DLMF 15.8.10 at `m = 0`. -/
theorem regularizedGaussHypergeometric_log_15_8_10_zero {a b z : ℂ} (hz₁ : ‖z - 1‖ < 1)
    (hz : 1 - z ∈ slitPlane) :
    HasSum (fun k : ℕ => -((Gamma a * Gamma b)⁻¹ * poch(a, k) * poch(b, k) /
        ((k ! : ℂ) * (k ! : ℂ)) * (1 - z) ^ k *
        (Complex.log (1 - z) - 2 * Complex.digamma (k + 1) + Complex.digamma (a + k) +
          Complex.digamma (b + k))))
      (𝐅 a b (a + b) z) := sorry
```

Also:
- State the loop integrals against Tau Ceti's contour API (`TauCeti/Analysis/Contour/`), or name them in the docstring together with the carrier they lack.
- Replace "a selection" with the standard docstring form: the headline theorems are stated, and any that are not statable are named with what they lack.

Deleting the declarations listed in R08 frees space for these.

## R05 (P2) — The route in 8.2 does not give 15.4.31 or 15.4.32, and Layer 8 omits its dependency on Layer 7

**Location.** README lines 873–876: "DLMF 15.4.31–15.4.34, from 15.8.31 at `z = −1/3`-type points and from 15.8.32 at `e^{iπ/3}`". Line 878 gives *Needs:* "8.1; Layer 4", and Layer 8's Dependencies (line 886) are "Layers 1–5".

**Claim.**
- **15.4.31.** Its third parameter is `3/2 − 2a`. Every linear transform of the two functions in 15.8.31 has third parameter `4a + 2/3`, `2a + 5/6`, `2/3`, `1/2` or `3/2`. So the named route needs a further cubic transformation that no layer states; DLMF's note uses Erdélyi et al. (1953a, Eq. (2.11.41)).
- **15.4.32.** This is a consequence of a quadratic transformation: 15.8.30 at `z = ½`, followed by 15.4.28 (DLMF-15.4 lines 909–910).
- **15.4.33.** DLMF obtains it as the limit `z → −∞` in 15.8.32, not by evaluating 15.8.32 at `e^{iπ/3}`.

**Witness.** At `a = 0.2`, `F(0.2, 0.7; 29/30; 1/9) = 1.0170943121`. This equals `(3/4)^{0.4} F(0.4, 7/15; 14/15; ½)` (15.8.30 at `z = ½`) and also the right side of 15.4.32. 15.4.31 itself holds at `a = 0.2`: both sides are `0.9632623833`.

**Repair.**
- Route 15.4.32 through 15.8.30 at `z = ½` and 15.4.28, with 5.5.5 and 5.5.6. Either move it to 7.3, or add 7.2–7.3 to the *Needs:* line of 8.2 and Layer 7 to Layer 8's Dependencies.
- Add the cubic transformation that 15.4.31 rests on as a target of 8.1, with its locator, or name a route through targets the roadmap states.
- Describe 15.4.33 as the limit `z → −∞` of 15.8.32.

## R06 (P3) — The gate fails: 15 Mathlib names are read as this roadmap's own

**Location.** `Suggested.lean` line 42, `namespace Complex` inside `TauCetiRoadmap.SpecialFunctionsHypergeometric`; README lines 221–238.

**Claim.** Because the file opens its own `Complex` namespace, the gate's readme-ids-missing rule takes every backticked `Complex.*` name in the README for a declaration of this roadmap. All 15 names exist at the Mathlib pin.

**Witness.** The gate at 9ce2a1e reports `readme-ids-missing=15 … FAIL`. Two of the names at the pin: `Complex.Gamma_add_one` (`Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:312`) and `Complex.digamma_one_sub` (`Gamma/Digamma.lean:94`).

**Repair.** Either:
- drop the local `namespace Complex` / `end Complex` and the docstring sentence about it; or
- add `#check @_root_.Complex.<name>` for each of the 15 names.

Both repairs were tested on scratch copies with the gate's own function, and each leaves 0 names missing. The first copy also elaborates with only the 47 `sorry` warnings.

## R07 (P3) — 15.16.4 is narrowed to the unit disc

**Location.** README lines 931–932: "15.16.4 as an identity of power series on `|z| < 1` for `c ∉ ℤ`".

**Claim.** DLMF's note derives 15.16.4 from 15.8.2, 15.8.4 and 15.8.1: the left side is entire, so Liouville's theorem gives the identity (DLMF-15.16 lines 40–43). It therefore holds on the whole cut plane, which is this roadmap's object.

**Witness.** At `(a, b, c) = (0.3, 0.45, 0.8)` the left side equals `1` to within `1.6·10⁻¹⁴` at `z = 3 + 2i`, `−5`, `2 − i` and `−0.9 + 4i`.

**Repair.** State the identity on the cut plane and keep the disc value as the Check. Add 1.4 and Layer 5 to the *Needs:* line of 9.3. This statement elaborates in a scratch copy:

```lean
theorem gaussHypergeometric_product_15_16_4 {a b c z : ℂ} (hc : ∀ n : ℤ, c ≠ n)
    (hz : 1 - z ∈ slitPlane) :
    gaussHypergeometric a b c z * gaussHypergeometric (-a) (-b) (-c) z +
      a * b * (a - c) * (b - c) / (c ^ 2 * (1 - c ^ 2)) * z ^ 2 *
        gaussHypergeometric (1 + a) (1 + b) (2 + c) z *
          gaussHypergeometric (1 - a) (1 - b) (2 - c) z = 1 := sorry
```

## R08 (P3) — Suggested.lean states auxiliary route lemmas and a small value

**Location.** `Suggested.lean` lines 73–81 (`shiftConstruction`, docstring "(auxiliary)"), 94–97, 104–114, 154–155, 184–190 and 244–250.

**Claim.** These declarations are not headline theorems:
- `shiftConstruction`, with `differentiableOn_shiftConstruction` and `regularizedGaussHypergeometric_eq_shiftConstruction`. They are the existence route; the headline is `exists_isEulerContinuation`.
- `differentiableOn_eulerIntegral`, a step in the route of 1.1.
- `eq_zero_of_periodic_of_bound`, a Carlson-type lemma about an arbitrary `f`.
- `exists_eqOn_combination_of_wronskian_ne_zero`, about arbitrary `f₁ f₂ w`. It also follows from AsymptoticExpansions §10.2 (on main) together with the identity theorem.
- `regularizedGaussHypergeometric_zero`, the small value `𝐅(a, b; c; 0) = 1/Γ(c)`.

**Witness.** The file's own docstrings call `shiftConstruction` and `eq_zero_of_periodic_of_bound` "auxiliary". None of these declarations is among the Summary's deliverables (README lines 17–30).

**Repair.** Delete them from Suggested.lean. In README 1.1, 1.2, 1.4, 3.1 and 4.2, state the same facts in prose without the backticked names, since the gate checks every such name. The one-tactic probe closed none of the 47 theorems, so nothing else in the file is padding.

## R09 (P3) — The definitions in 1.1–1.2 have no Checks

**Location.** README §1.1–1.2 (lines 269–324) have no **Checks.** list, and §1.3 has a single Check (lines 347–349).

**Claim.** `eulerIntegral`, `IsEulerContinuation`, `regularizedGaussHypergeometric` and `gaussHypergeometric` each need at least three discriminating Checks, each naming the wrong model it excludes.

**Witness.** No existing Check or Example separates `𝐅` from `F/Γ(c)` taken with Lean's junk value at the poles, or from Euler's integral read outside `0 < Re b < Re c`.

**Repair.** Add to 1.2, for example (values recomputed):
1. `𝐅(0.3, 0.7; −1; 0.4) = 0.1064071000` by 15.2.3_5, while `gaussHypergeometric 0.3 0.7 (−1) 0.4 = 0`. This excludes `𝐅 := F/Γ(c)` with junk.
2. `𝐅(1, −½; −½; ½) = 2/Γ(−½) = −0.5641895835`, while `eulerIntegral 1 (−½) (−½) ½ = 0`. This excludes "`𝐅` is Euler's integral everywhere".
3. `F(0.3, 0.7; 1.9; 2 − i) = 1.0347657243 − 0.3076156788 i`, the conjugate of the value at `2 + i`. This excludes a branch continued across the cut from above.

## R10 (P3) — Three hypotheses are redundant

**Location.**
- `Suggested.lean` line 326: `hb'` in `gaussHypergeometric_quadratic_15_8_13`.
- `Suggested.lean` line 348: `h₂` in `gaussHypergeometric_cubic_15_8_31`.
- `Suggested.lean` line 203: `hz₀` in `wronskian_gaussHypergeometric_infty`.
- README line 450: `U∞ = {z | z ∈ slitPlane ∧ z − 1 ∈ slitPlane}`.

**Witness.** Each follows from another hypothesis:
- `b + ½ = −k` gives `2b = −(2k + 1)`, contradicting `hb`.
- `2a + 5/6 = −k` gives `4a + 2/3 = −(2k + 1)`, contradicting `h₁`.
- `z − 1 ∉ (−∞, 0]` gives `z ∉ (−∞, 0]`.

**Repair.** Drop `hb'`, `h₂` and `hz₀`, and write `U∞ = {z | z − 1 ∈ slitPlane}`.

## R11 (P3) — The README contains process words and a stale status

**Location.**
- README line 972: "SpecialFunctionsEiLiErfIncompleteGamma roadmap (an open pull request)".
- README lines 982–983: "the SpecialFunctionsBessel roadmap (an open pull request)".
- README line 985: "**Deferred, with no planned roadmap.**"

**Claim.** Roadmaps are timeless and do not use "deferred". SpecialFunctionsEiLiErfIncompleteGamma is also already on main.

**Witness.** `TauCetiRoadmap/SpecialFunctionsEiLiErfIncompleteGamma/README.md` is on main, and its ownership table (line 97) places Pincherle's theorem at 4.1.

**Repair.** Write "which SpecialFunctionsEiLiErfIncompleteGamma 4.1 owns" and "the SpecialFunctionsBessel roadmap", and retitle line 985 as "**Outside every planned roadmap.**"

## R12 (P3) — The README understates what is taken from ZerosOfLFunctions

**Location.** README lines 39–40: "for the Mellin–Barnes integrals alone, on the Gamma function on vertical strips from ZerosOfLFunctions". Layer 4's Dependencies (line 643) read "Layers 1–2".

**Claim.** The route for Dougall's sum in 4.2 also uses ZerosOfLFunctions 1.3 (lines 604–606; *Needs:* line 615), as the "does not own" list already says (lines 109–110).

**Repair.** Write "for Dougall's sum and the Mellin–Barnes integrals alone", and change Layer 4's Dependencies to "Layers 1–2; ZerosOfLFunctions 1.3".

## Verified sound

**Gate, build and Lean form**
- **Gate at 9ce2a1e.** Every check is 0 except readme-ids-missing (R06). Run against the default order, the gate also reports depcheck "NOT IN ORDER"; that is not a defect for a roadmap the order does not list yet.
- **Dependency check against the candidate order.** `depcheck: 236 roadmaps, 2263 edges, 0 problem(s)`. The only roadmap supplier, ZerosOfLFunctions, is line 48 of that order; this roadmap is line 401.
- **Elaboration.** `lake env lean` on Suggested.lean gives 47 `sorry` warnings and nothing else.
- **Signatures.** `#check @` for all 52 declarations elaborates in one scratch file. The file has no section `variable`s, so no binder can be lost, and each elaborated type matches its README statement.
- **Names.** All 52 Lean names appear in the README.
- **Form.** No `set_option`, no sorry'd data and no `lemma`. The imports are `Mathlib` and `TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Hypergeometric`, which exists at the pin. No files outside the folder are changed.
- **Padding probe.** Each theorem tried with `rfl`, `simp`, `norm_num` and `infer_instance`: 0 of 47 closed.

**Sources: DLMF Release 1.2.8 (2026-09-15)**

The release cited in the README is the one read. Each seeded target was checked at its locator:

| Target | DLMF formulas checked (source id, line) | Result |
|---|---|---|
| 1.3 | 15.2.3_5, 15.2.4, 15.2.5, 15.2.6 (DLMF-15.2 lines 306, 352, 388, 426) | as stated; the paragraph at lines 467–473 supports the Check in 4.1 |
| 1.4 | §15.2(ii) (lines 291–297) | as stated: `𝐅` is entire in `a`, `b`, `c`; `F` has poles in `c` |
| 3.2 | 15.10.2–15.10.7, including the Wronskians (DLMF-15.10 lines 135–322) | as stated |
| 3.3 | 15.10.8–15.10.10 and rules (a)–(e) (lines 347–495) | as stated |
| 3.4 | 15.11.1–15.11.8 (DLMF-15.11 lines 81–354) | as stated; in 15.11.7, `c − a − b = b₂ − b₁` follows from 15.11.2 |
| 4.1 | 15.4.1–15.4.19 (DLMF-15.4 lines 93–604), the domain sentence (lines 87–91), the 15.2.6 note (lines 635–637) | as stated |
| 4.2 | 15.4.20–15.4.25 with their conditions (lines 669–857) | as stated |
| 5.1 | 15.8.1–15.8.5 with their regions (DLMF-15.8 lines 86–258); 15.2.3 (DLMF-15.2 line 196) | as stated |
| 5.2 | 15.8.6–15.8.12 and the `ψ/Γ` interpretations (lines 326–619) | as stated; `−(1/Γ)′(−N) = (−1)^{N+1} N!` matches DLMF's reading |
| 5.3 | 15.10.11–15.10.16 (DLMF-15.10 lines 527–702) | as stated, with the half-plane correction (see Source issues) |
| 6.3 | 15.6.6–15.6.7 (NIST page); 5.12.3 (`Re a, Re b > 0`); 5.13.3, Barnes' beta integral (`Re a, b, c, d > 0`) | as stated |
| 7.1 | 15.8.13–15.8.28 with their regions (lines 738–1255) | as stated |
| 7.2 | 15.8.29–15.8.30 (lines 1311–1343) | as stated |
| 8.1 | 15.8.31–15.8.33 with their regions (lines 1409–1517) | as stated; the lens equals `|ph((1 − z)/(1 + 2z))| < π/3` (interior angle `2π/3` at `z = 1`, rederived) |
| 9.2 | 15.14.1 (DLMF-15.14 lines 55–57); 15.15.1 (DLMF-15.15 lines 44, 76–77) | as stated |

Also checked: 15.5.15 and 15.5.16_5 (DLMF-15.5 lines 512, 568), from which both shift relations were rederived coefficient by coefficient; 15.9.5–15.9.7 and 15.9.24–15.9.26 (DLMF-15.9 lines 235, 262, 301, 971, 1002, 1033).

**Definition**

`IsEulerContinuation.eq` holds with holomorphy in `b` and `c` alone. Apply the identity theorem in `c` on `Re c > Re b`, then in `b` on `Re b > 0`. Neither step needs any regularity in `a` or `z`. DLMF's `𝐅` satisfies `IsEulerContinuation`, so the definition picks out DLMF's principal branch.

**Library declarations opened at the pins (file:line)**

Mathlib:
- `RegularizedHypergeometric.lean`: `Complex.regularizedGaussHGFun` :428, `regularizedGaussHGFun_symm` :440, `coeff_regularizedGaussHGFunSeries` :445, `ordinaryHypergeometric_div_Gamma_eq` :458, `radius_regularizedGaussHGFunSeries_eq_top_of_left` :468, `radius_regularizedGaussHGFunSeries_ge_one` :485.
- `OrdinaryHypergeometric.lean`: `ordinaryHypergeometricSeries_eq_zero_of_neg_nat` :130, `ordinaryHypergeometric_radius_top_of_neg_nat₁` :149.
- `Gamma/Basic.lean`: `Gamma_add_one` :312, `Gamma_neg_nat_eq_zero` :344, `Gamma_conj` :356.
- `Gamma/Beta.lean`: `Gamma_mul_Gamma_eq_betaIntegral` :124, `GammaSeq_tendsto_Gamma` :335, `Gamma_mul_Gamma_one_sub` :398, `Gamma_ne_zero` :427, `Gamma_add_nat_div_Gamma_eq` :481, `differentiable_one_div_Gamma` :543, `Gamma_mul_Gamma_add_half` :580.
- `Gamma/Digamma.lean`: `digamma` :48, `digamma_one_sub` :94.
- `Complex/CauchyIntegral.lean`: `integral_boundary_rect_eq_zero_of_differentiableOn` :313, `DifferentiableOn.analyticOnNhd` :729.
- Elsewhere: `starConvex_one_slitPlane` (`Complex/Convex.lean:45`), `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` (`Analytic/Uniqueness.lean:224`), `IsOpen.is_const_of_deriv_eq_zero` (`Calculus/MeanValue.lean:767`), `mellinInv_mellin_eq` (`MellinInversion.lean:92`), `Differentiable.apply_eq_apply_of_bounded` (`Complex/Liouville.lean:117`), `Polynomial.Chebyshev.U_complex_cos` (`Chebyshev/Basic.lean:73`), `hasDerivAt_integral_of_dominated_loc_of_deriv_le` (`ParametricIntervalIntegral.lean:99`), `binomialSeries_eq_ordinaryHypergeometricSeries` (`Analytic/Binomial.lean:60`).

Tau Ceti:
- `one_le_radius_ordinaryHypergeometricSeries` and `analyticOnNhd_ordinaryHypergeometric` (`SpecialFunctions/OrdinaryHypergeometric.lean:36, 56`).
- `legendreK_eq_ordinaryHypergeometric` and `legendreEc_eq_ordinaryHypergeometric` (elaborated with `#check`).
- `TauCeti.Contour.residue` (`Contour/Residue/Basic.lean:80`).
- `TauCeti.wronskian_eq_of_hasDerivAt` (`ODE/Wronskian.lean:31`). It covers only the real equation `f″ = q f`, so Abel's identity in 3.1, which has a first-order term, is not a duplicate.

Not at the pins: a continued Gauss function, Euler's integral for `₂F₁`, Chu–Vandermonde in Pochhammer form (only `Ring.add_choose_eq`, `RingTheory/Binomial.lean:525`), Barnes' integral and Dougall's sum.

**Cross-roadmap citations and ownership**

- **Citations.** ZerosOfLFunctions §1.3 (main, lines 469–476) states `log ‖Γ(σ + it)‖` uniformly for `σ` in compact intervals, as the contract says. EllipticIntegrals (main) owns the `₂F₁` forms of `legendreK` and `legendreEc` (its lines 292–293). The residue API comes from ContourIntegration (completed). SpecialFunctionsEiLiErfIncompleteGamma 4.1 is Pincherle's theorem.
- **Ownership.** I searched main and all 458 open pull requests by object: the continued `₂F₁`, Euler's integral, Pfaff, Chu–Vandermonde, Barnes, Dougall, Carlson, Wronskian, regular singular points, 15.9.26. No other roadmap defines the principal branch for all parameters, so this roadmap owns it. The partial owners are those in R03. NoncompactQuantumSymmetry cites a different Dougall sum (DLMF 16.4.17).
- **Overlaps file.** It lists no open pull request that changes this roadmap, drops an id it cites, or defines an id only at an open revision.

**Adversarial pass**

Values were computed in plain Python: Lanczos/Stirling Γ, the series, tanh-sinh quadrature of Euler's integral and the shift relations. The Euler-integral values agree with the series to `≤ 7·10⁻¹⁵` on the disc.

| Statement | Instances | Left side | Right side | Result |
|---|---|---|---|---|
| 1.1/1.3 Euler's integral = Mathlib series | `(0.3, 0.7, 1.9, 0.4)` | 1.0947310151578 | 1.0947310151578 | holds |
| same, via shift relations, `c` off Euler region | `(−1.3, 0.4, −2.5, 0.5)` | −1.152116684531 | −1.152116684531 | holds |
| 15.2.3_5 `regularizedGaussHypergeometric_neg_nat` | `n = 2`, `z = 0.4` | 0.145621501778878 | 0.145621501778879 | holds (README 0.14562 15017 79 ✓) |
| same, `n = 0` off the disc | `z = 2 + i` | −0.3592428714 + 0.0169322290i | same | holds |
| same, complex `b` | `n = 2`, `z = −3 + 0.5i` | −0.1886092168 − 0.0288092033i | same | holds |
| Layer 1 example | `F(0.3, 0.7; 1.9; 2 + i)` | 1.0347657243 + 0.3076156788i (both orderings) | README 1.03476 57242 8 + 0.30761 56787 97i | holds |
| Layer 1 example | `F(0.3, 0.7; 1.9; −3)` | 0.8262198695 | README 0.82621 98694 88 | holds |
| shift relations (`shift_c`, `shift_b`) | coefficient of `zˢ` | `(a)ₛ(c + s)/Γ(c + 1 + s)` | `(a)ₛ/Γ(c + s)` | identity |
| 15.5.11 regularized | `(0.3, 0.7, 1.9, 2 + i)`; `c = −2`, `z = −3 + 0.1i` | residual 2.8e−16; 1.0e−14 | 0 | holds |
| 15.5.18 example, `c = 1` | `(0.3, 0.7, 0.4)` | two-term sum 0.0881917 | 0 | **fails** (R01) |
| 15.10.3 regularized (`wronskian_..._zero`) | `c = −1.4`, `z = 0.4 + 0.3i` | −0.3388900296 + 0.2241861389i | −0.3388900292 + 0.2241861389i | holds (finite-difference error) |
| 15.10.7 (`wronskian_..._infty`) | `z = 2 + i`; `−1 + 0.5i` | −0.0925269396 + 0.0586740560i; −0.2039388755 − 0.5649776502i | same | holds |
| pair at ∞ off `U∞` | `(½, 1, 3/2)`, `z = −2 ± i0` | `z^{−1/2} → ∓i/√2` | README `∓i/√2` | holds |
| 15.10.8 divergence remark | `n = 1`, `a = b = 2` | term `2(k + 1)zᵏ` | not → 0 at `2i` | holds |
| span criterion | `U ∋ 0` allowed | `U \ {0, 1}` connected | conclusion still holds | true as stated |
| 15.4.1 Lean form | `z = −1`, `2 + i`, `0.999 − 0.5i` | residuals 5e−15, 1.5e−14, 1.0e−14 | 0 | holds |
| 15.4.7 hypothesis needed | `a = ½`, `z = −2` | junk 0 | −1/3 | hypothesis excludes it |
| 15.4.6 Check | `₂F₁(−1, 2; −1; ½)` | 2 | `(1 − ½)^{−2}` = 4 | as the Check says |
| 15.4.20 | `(½, ½, 2)`; `(−3, 2, 5)`; `₂F₁ 1 1 3 1` | 1.2732395447; 2/7; partial sums → 2 | 4/π; 2/7; 2 | holds |
| 15.4.20 regularized, `c = −1` | `(−2.3, −0.4)` | −0.2738605267 | −0.2738605266 | holds |
| 15.4.24, `c = −3`, `n = 2` | symbolic `b` | `1 + 5b/6 + b²/6` | same | holds |
| 15.4.25 Dougall | `(0.3, 0.45, 1.8, 2.1)` | 20.016895115376 | 20.016895115368 | holds (README 20.01689 511 ✓) |
| 15.4.25, `d = b` (`1/Γ(0) = 0`) | `(0.3, ·, 1.8)` | 2.5e−9 (`N = 8·10⁵`, tail-corrected) | 0 | holds |
| periodic Carlson lemma | proof check | `f/sin πw` antiperiodic, entire, → 0 | 0 | true |
| 15.2.3 jump | `(0.3, 0.7, 1.9, x = 2)` | 0.8272611591402i (from Euler's integral on each side) | 0.8272611591402i | holds; sign confirmed |
| 15.8.4 Lean form | three parameter sets, including `c = −1` | residuals ≤ 8e−15 | 0 | holds |
| 15.8.2 Lean form | three parameter sets, including `z = 2 − i` | residuals ≤ 5e−15 | 0 | holds |
| Euler/Pfaff Lean form | `(0.3, 0.7, −1.5, 2 + i)`; complex `b` | ≤ 6e−14 | 0 | holds |
| `w₅` first vs third expression | `(0.3, 0.7 + 0.2i, 1.9)`, `z = 2 − i` | 0.4055763329 + 0.5932115944i | 0.4388477730 − 0.5690384782i | differ by 1.16273 (README 1.16… ✓) |
| 15.10.25 printed (`..._of_im_pos`) | `z = 2 + i`; `−3 + 0.5i`; `2 − i` | residual 1.3e−14; 1.7e−14; 0.9176 | 0 | fails only for `Im z < 0` (README 0.918 ✓) |
| 15.10.25 with `−i` (`..._of_im_neg`) | `z = 2 − i`; `−3 − 0.5i` | 1.4e−14; 1.7e−14 | 0 | holds |
| 15.10.19 printed / with `−i` | `z = 0.5 − 0.7i` | 1.10 / 2.9e−14 | 0 | same pattern |
| 15.6.6 Mellin–Barnes | `(0.6, 0.8, 1.7, −2)`, `σ = −0.3` | 0.77812184200304 | 0.77812184200304 | holds (README ✓) |
| Barnes 5.13.3 | `(0.6, 0.9 + 0.3i, 0.4, 1.1 − 0.2i)` | 0.3775742386 − 0.0524262008i | same | holds |
| 15.4.26 | `(0.6, 0.25)` | 0.91945804074860 | 0.91945804074860 | holds |
| 15.4.28 | `(0.6, 1.3)` | 1.44511786029413 | 1.44511786029416 | holds |
| 15.8.13 | `a = 0.7`, `1.3 + 0.4i`; `z = 0.6`, `3 + i`, `−7`, `1.5 − 0.01i` | residuals ≤ 3e−15 (fine quadrature) | 0 | holds on the cut plane |
| 15.8.31 | two `a`; six `z` with `Re z < 8/9` | residuals ≤ 6e−14 | 0 | holds |
| 15.8.33 | `z = 0.3`, `0.9 + 0.05i`, `−0.45` (lens); `0.1 + 0.5i` (outside) | ≤ 1e−13; 1.64 | 0 | domain needed |
| 15.4.31, 15.4.32 | `a = 0.2` | 0.9632623833; 1.0170943121 | same; = 15.8.30 at `½` | hold; route R05 |
| 15.9.5, `n = 2` | symbolic | `1 − 8y + 8y²`, `y = (1 − x)/2` | `2x² − 1` | holds |
| 15.9.7 coefficients | symbolic | `(−n)ₖ(n + 1)ₖ/(k!)²` | `(−1)ᵏ C(n, k) C(n + k, n)` | holds |
| 15.9.26 | `k² = ½` | 1.0068615925 | README 1.00686 15925 1 | holds |
| 15.14.1 | `(1.5, 2.2, 1.1, 0.7)` | 0.61835140936 (quadrature) | 0.61835140937 | holds (README ✓) |
| 15.15.1 Lean form | `(0.3, 0.7, 1.9, z = 2 − 3i, z₀ = 0.3 + 0.2i)`; `z₀ = ½` (`1/z₀` on the cut) | 1.0575903646 − 0.0019274131i; 0.9661016183 − 0.2337578154i | same | holds |
| 15.16.4 | `(0.3, 0.45, 0.8)`, `z = 0.35`, `3 + 2i`, `−5` | 1, 1, 1 | 1 | holds off the disc (R07) |
| `ordinaryHypergeometric_one` needs `hc` | `c = −1` | Lean `₂F₁` truncated | `Γ(c) = 0` | hypothesis needed |
| `legendreD_...` needs `0 < k²` | `k = 0` | `x/0 = 0` | π/4 | hypothesis needed |

## Not verifiable

- Andrews–Askey–Roy (1999), Erdélyi et al. (1953a), Olver (1974/1997), Whittaker–Watson (1927) and Dougall (1907) are cited as background at chapter level. I fetched no open copy, and no sampled locator depends on them.
- The lean-DLMF errata note linked in the description was not read. The two DLMF issues below were verified independently.
- DLMF §15.6 was read directly from the NIST page, because the sources service resolved that page to a figure PDF.

## Source issues

- **Error** in DLMF at §15.10(ii), 15.10.15–15.10.16, 15.10.19–15.10.20 and 15.10.23–15.10.36 (online, Release 1.2.8): the source states these for principal branches with no region, but the forms carrying `e^{(·)πi}` hold only for `Im z > 0`; it should state `Im z > 0`, and for `Im z < 0` replace `i` by `−i` in every `e^{(·)πi}`; affects a stated result.
- **Misprint** in DLMF at 15.10.35 (§15.10(ii), online, Release 1.2.8): the source says a stray "exp" precedes `e^{−aπi}` in the coefficient of `w₅`; it should be `e^{−aπi}` alone; affects nothing.
