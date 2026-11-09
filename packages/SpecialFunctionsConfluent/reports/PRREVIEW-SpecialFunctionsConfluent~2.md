# Review of SpecialFunctionsConfluent (pull request #1995 at de21e2f)

**Verdict:** needs changes

This head repairs all twelve findings of the previous review (table under `## Verified sound`). The full review finds 8 new defects: 5 at P2 and 3 at P3. All 37 statements of `Suggested.lean` hold numerically on the instances tried. The defects are ownership, unowned prerequisites, missing hypotheses and one absent headline.

## R01 (P2) — The Whittaker functions on the positive axis already have an owner: AutomorphicSpectralTheory §§0.26–0.28

**Location.** `TauCetiRoadmap/SpecialFunctionsConfluent/README.md:201–202`: "The Whittaker models of the automorphic roadmaps are the representation-theoretic notion, not the functions of §13.14." The same objects are owned here in 1.5, 2.4, 4.4 (13.16.1, 13.16.5) and 5.3 (13.18.8–13.18.9, `whittakerW_zero_eq_besselK`).

**Claim.** The sentence is false. AutomorphicSpectralTheory is an open new roadmap at merge-order line 96; this roadmap is at line 212. Its §0.26 defines DLMF's `M_{κ,μ}(y)` and `W_{κ,μ}(y)` for `y > 0`, together with:
- the Euler-type integrals (13.16.1, 13.16.5);
- Whittaker's equation (13.14.1);
- the symmetry `W_{κ,−μ} = W_{κ,μ}` (13.14.31).

Its §0.27 has the Bessel comparisons (13.18.8, 13.18.9). Its §0.28 has the leading behaviour at `0` and `∞` (13.14.14, 13.14.20–13.14.21). MaassForms (`README.md:380`) and MetaplecticAutomorphicForms (`README.md:61`) already consume these sections. So the same object has two owners.

**Witness.** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:555–557` at its head: "### 0.26 Whittaker `M` and `W` functions … For `y>0` put `M_{μ,ν}(y)=Γ(1+2ν)e^(−y/2)y^(ν+1/2)` regularized `₁F₁(ν−μ+1/2;1+2ν;y)`". Its line 586 has "`K_ν(y)=√(π/(2y))W_{0,ν}(2y)`".

**Repair.** Treat this the same way the head treats Tricomi's `U` and QuantumFoundations §9.4:
- Under `## Scope and ownership` and in a new `### From AutomorphicSpectralTheory` contract, cite §§0.26–0.28 for the positive-axis functions and the facts listed above.
- Keep here the slit-plane and logarithmic-plane functions and the rest of §§13.14–13.26.
- Add one agreement target in 4.4. For `y > 0` and `Re(μ − κ) > −½`, `whittakerW κ μ y` equals AutomorphicSpectralTheory's `W_{κ,μ}(y)`, whose defining integral is 13.16.5. Likewise `whittakerM κ μ y` equals its `M_{κ,μ}(y)`. Say that it writes `(μ, ν)` for DLMF's `(κ, μ)`.
- Replace the sentence at README 201–202.
- Add AutomorphicSpectralTheory to the `*Needs:*` lines of 1.5, 2.4, 4.4, 5.3 and 6.1.

Tested on the shared instance: `W_{0,1/2}(2) = e^{−1} = 0.3678794412` here (the 1.5 Check), and `W_{0,1/2}(y) = e^{−y/2}` there (the §0.26 Check).

## R02 (P2) — Joint holomorphy of `𝐌` in `(a, b, z)` is used, but no supplier provides it

**Location.** `README.md:430`: "Layer 1 rests on two facts: `𝐌` is entire in all three variables (consumed)". Three targets depend on it:
- `differentiable_kummerULog` (`Suggested.lean:148`);
- `differentiable_regularizedWhittakerMLog` (`Suggested.lean:193`);
- the 1.1 step at README:465, that "the `z`-derivatives of a function holomorphic in `(b, z)` are continuous in `b`".

**Claim.** The cited supplier states less than this. SpecialFunctionsParabolicCylinder §1.5 gives holomorphy in `a` and in `b` separately, and continuity of `(a, z) ↦ 𝐌`. Mathlib at the pin has analyticity in `z` only, and no Hartogs or Osgood theorem that would upgrade separate holomorphy to joint holomorphy. So joint holomorphy in `(a, b, z)` has no owner, and two `Suggested.lean` statements depend on it.

I rate this P2 rather than P1 because the route is already named in the supplier.

**Witness.** `TauCetiRoadmap/SpecialFunctionsParabolicCylinder/README.md:351–355` on main: "For fixed `b, z`, `a ↦ 𝐌(a, b, z)` is entire … For fixed `a, z`, `b ↦ 𝐌(a, b, z)` is entire. The function `(a, z) ↦ 𝐌(a, b, z)` is continuous". In Mathlib, `analyticOnNhd_regularizedHGFun_of_card_le` (`RegularizedHypergeometric.lean:282`) concerns `z` only, and a search for osgood/hartogs finds nothing.

**Repair.**
- Add to 1.1, and to the auxiliary table, the target "`(a, b, z) ↦ 𝐌(a, b, z)` is holomorphic on `ℂ³`". The route is locally uniform convergence of the series in `(a, b, z)`, which SpecialFunctionsParabolicCylinder §1.5 already names. Each term `(a)_n zⁿ/(n! Γ(b + n))` is jointly entire.
- Replace "(consumed)" at README 430 with a citation of the new target.
- Add the target to the `*Needs:*` lines of 1.1 and 1.5.

## R03 (P2) — The Hermite relations 13.6.18 and 13.18.14–13.18.16 fail in the left half-plane; 13.6.14–13.6.15 are stated more narrowly than they hold

**Location.** `README.md:809`: "Hermite polynomials 13.6.16–13.6.18, with `H_n(x) = 2^{n/2} He_n(√2 x)`" (no domain). `README.md:824–825` transports "the domains of 5.2" to 13.18.14–13.18.16. `README.md:808` reads "Weber's function 13.6.12–13.6.15 for `Re z > 0`".

**Claim.**
- With the principal branches of the Conventions, 13.6.18 holds for every `z ≠ 0` when `n` is odd, because `U` is then a polynomial. When `n` is even it holds only for `−π/2 < ph z ≤ π/2`.
- 13.18.14–13.18.16 compare a principal `√z` with `(z²)^{1/4}`. They fail for `Re z < 0` for every `n`.
- 13.6.14 is an identity between entire functions, and 13.6.15 one for `z ≠ 0`. Both hold on all of `ℂ`, so restricting them to `Re z > 0` narrows them below the source.

**Witness.** Take `n = 2` and `z = −1`. By 13.2.40 and 13.2.7, `U(−½, 3/2, 1) = (z²)^{−½}(z² − ½) = ½`, while `2^{−2} z^{−1} H₂(z) = −½`. For 13.18.16 at `n = 2`, `z = −0.8+0.3i`, the left side is `0.0554557467−0.3342630922i` and the right side is `0.3342630922+0.0554557467i`.

**Repair.**
- State 13.6.18 for `z ≠ 0` when `n` is odd, and for `Re z > 0` (or `−π/2 < ph z ≤ π/2`) when `n` is even.
- State 13.18.14–13.18.16 for `Re z > 0`.
- State 13.6.14 for every `z` and 13.6.15 for `z ≠ 0`.
- Add the `n = 2`, `z = −1` instance as a negative-control Check.

Tested on the repaired forms:
- At `z = 1`, `n = 2`, both sides of 13.6.18 equal `0.5`.
- At `z = 0.8+0.3i`, both sides of 13.18.16 agree to `7e−17`.
- At `a = 0.7`, `z = −1.1+0.3i`, both sides of 13.6.14 equal `1.7946152197−0.7026920297i`, and both sides of 13.6.15 equal `1.4706414347−0.3841350893i`.

## R04 (P2) — 9.4 states 13.24–13.26 with no hypotheses at all

**Location.** `README.md:1066`: "DLMF 13.24.1–13.24.3, 13.25.1 and 13.26.1–13.26.12." 9.3 states its convergence conditions; 9.4 states no domain, no branch and no condition.

**Claim.** DLMF takes `x`, `y` real in §13.26 and attaches conditions:
- `|y| < |x|` for 13.26.1, .4, .7, .8, .10 and .11;
- `Re(y/x) > −½` for 13.26.3, .9 and .12;
- `Re((x+y)/x) > ½` for 13.26.6;
- `2μ, κ + μ ∉ {−1, −2, …}` for 13.24.1.

Without these the targets are false. For example, the series of 13.26.1 diverges when `|y| > |x|`.

**Witness.** Take `κ = 0.3`, `μ = 0.35`, `x = 1`. At `y = 0.6` both sides of 13.26.1 equal `1.2580669306`. At `y = 1.5` the `n`-th term has modulus `2.9` at `n = 20`, `3.0e3` at `n = 40` and `5.0e6` at `n = 60`. The conditions are at DLMF-13.26 lines 69 and 125, and DLMF-13.24 line 88.

**Repair.** State the hypotheses in 9.4:
- 13.24.1 for `z ∈ slitPlane` with principal `z^{½−κ}` and `2μ ∉ {−1, −2, …}` (`κ + μ = 0` is already covered by the holomorphic reading);
- 13.24.2 for `z ∈ slitPlane`;
- 13.26.1–13.26.12 for real `x > 0`, `x + y > 0`, with the convergence conditions above (or for complex `x`, `x + y` in the slit plane with principal powers, as 9.3 does for `U`).

The `y = 0.6` instance confirms the repaired 13.26.1.

## R05 (P2) — The corrected zero counts are statable at the pins but absent from `Suggested.lean`

**Location.** `README.md:926–933` states 13.9.3–13.9.4 for `a > 0` and 13.9.6 for `a ∉ {−1, −2, …}`, correcting DLMF. Layer 7 of `Suggested.lean` (lines 315–326) states only 13.9.1, 13.9.2 (positivity of a series with nonnegative terms) and Wimp's theorem.

**Claim.** The corrections are the theorems where this roadmap departs from its source, and the pull request's description presents them as such. They use exactly the carrier of the stated 13.9.1. A headline that is statable at the pins is therefore absent from the acceptance test.

**Witness.** Both statements below elaborate at the pins in a scratch copy, with only `sorry` warnings. Sign-change counts of `𝐌(a, b, x)` on `(0, 60]`:
- `(a, b) = (0.5, −0.5)` gives `1`, and `(0, −0.5)` gives `0` (printed 13.9.3: `1`).
- `(−1.5, −2.5)` gives `1`, `(−1.5, −3.5)` gives `0`, and `(−2, −4.5)` gives `0` (printed 13.9.6: `1`).

**Repair.** Add these statements to Layer 7 of `Suggested.lean` and name them at 7.1 in the README:

```lean
/-- Corrected DLMF 13.9.3: for `a > 0` and `−1 < b < 0`, `M(a, b, ·)` has one positive zero. -/
theorem ncard_pos_zeros_regularizedHGFun_of_pos_of_neg {a b : ℝ} (ha : 0 < a) (hb : -1 < b)
    (hb0 : b < 0) : {x : ℝ | 0 < x ∧ 𝐌((a : ℂ), (b : ℂ)) (x : ℂ) = 0}.ncard = 1 := sorry

/-- Corrected DLMF 13.9.6, for `a ∉ {−1, −2, …}` and `b ∉ ℤ`. -/
theorem ncard_pos_zeros_regularizedHGFun_of_ceil_lt {a b : ℝ} (ha : ∀ n : ℕ, a ≠ -n)
    (hb : ∀ n : ℤ, b ≠ n) (h0 : 0 < ⌈-a⌉) (h : ⌈-a⌉ < ⌈-b⌉) :
    ({x : ℝ | 0 < x ∧ 𝐌((a : ℂ), (b : ℂ)) (x : ℂ) = 0}.ncard : ℤ) =
      (⌈-b⌉ - ⌈-a⌉ + 1) / 2 - (⌈-b⌉ - ⌈-a⌉) / 2 := sorry
```

On the instances above, these statements give `1`, `1` and `0` where they apply. They exclude `(0, −0.5)` and `(−2, −4.5)`, where the printed formulas fail. A 13.9.4 statement for `a > 0` can be added in the same form.

## R06 (P3) — Three owned definitions lack three Checks

**Location.**
- `README.md:1041–1044`: `buchholzCoeff` has two Checks, inline in an API bullet.
- `README.md:1068–1070`: the polynomials `p_s^{(μ)}` have no Checks.
- `README.md:161, 451–454`: `kummerUBracket` has no Checks; `F(a, 1, w) = 0` appears only as an Example.

**Claim.** Every definition needs a `**Checks.**` list with at least three discriminating tests.

**Witness.** Searching 9.1, 9.4 and 1.1 finds no `**Checks.**` list for these three definitions.

**Repair.** Add a `**Checks.**` list for each:
- **`buchholzCoeff`.** Keep `A₃ = (2a − b)/3` and `A₄ = b(b + 2)/8`. Add: at `b = 2a`, `𝐌(a, 2a, z) = e^{z/2} ∑_s A_s (z/2)^s/Γ(2a + s)`. At `a = 0.65+0.2i`, `z = 1.3−0.4i`, both sides equal `2.4479444299−0.5249427441i`. A recursion with the coefficients of `A_{n−1}` and `A_{n−2}` swapped would give `A₃ = (b + 1)/3 ≠ 0` there.
- **`p_s^{(μ)}`.** `p₀ = 1` and `p₁ = z²/6` for every `μ` (DLMF-13.24 line 153). Reading the sign as `z^s` instead of `(−z)^s` gives `−z²/6`.
- **`kummerUBracket`.** `(π/sin πb) F(0, b, w) = 1`, which is 13.6.3. It gives `1.0000000000` at `b = 0.37, w = 0.4+1.1i` and at `b = 1.6−0.3i, w = −0.7+3i`. Swapping the factors `1/Γ(a − b + 1)` and `1/Γ(a)` breaks it.

## R07 (P3) — "Beyond this roadmap" names the wrong owners and uses "deferred"

**Location.**
- `README.md:1146–1147`: the Coulomb functions "belong to a roadmap for DLMF Chapter 33".
- `README.md:1140–1142` and `1126–1127`: the Gauss-function formulas belong to a Chapter 15 roadmap, and that roadmap "consume[s] Layers 1–5".
- `README.md:38, 42, 1134, 1144, 1151`: "follow-up", "deferred".

**Claim.**
- QuantumFoundations §9.5 already defines the Coulomb functions through Kummer functions (DLMF 33.2.4 and 33.2.7). DLMF §13.6(vii) contains no formula at all, only pointers to 33.2.4, 33.2.8 and 33.14.5.
- SpecialFunctionsHypergeometric is the open Chapter 15 roadmap. It has no SpecialFunctionsConfluent supplier, and it assigns these formulas to a third roadmap.
- The house style forbids "deferred".

**Witness.** `TauCetiRoadmap/QuantumFoundations/README.md:1015` at its head defines "`F_ℓ(η,ρ) = C_ℓ(η)ρ^(ℓ+1)e^(iρ)M(ℓ+1+iη, 2ℓ+2, −2iρ)`" and "`H_ℓ^±` … `U(ℓ+1±iη, 2ℓ+2, ∓2iρ)`". `TauCetiRoadmap/SpecialFunctionsHypergeometric/README.md:952–956` says the formulas "belong to roadmaps that consume both: … 13.4.8, 13.4.12, …, 13.23.4".

**Repair.**
- Name QuantumFoundations §9.5 as the owner of the Coulomb–Kummer relations.
- Say that 13.4.8, 13.4.12, 13.4.15, 13.10.3, 13.10.7, 13.16.9 and 13.23.4 belong to a roadmap that consumes both this roadmap and SpecialFunctionsHypergeometric, and drop the claim that a Chapter 15 roadmap consumes Layers 1–5.
- Reword "planned for follow-up roadmaps" and "deferred" as "outside this roadmap", as the Beyond section of SpecialFunctionsParabolicCylinder on main does.

## R08 (P3) — 1.1 uses 13.2.5 from the later section 1.3, whose `*Needs:*` line cites 1.1

**Location.** `README.md:451–454`: the bracket "vanishes at `b = n ∈ ℤ` … for `n ≥ 2` by 13.2.5 … for `n ≤ 0` by 13.2.5". The `*Needs:*` line of 1.1 (README:475–476) omits 1.3. The `*Needs:*` line of 1.3 (README:501) reads "1.1; Mathlib `Complex.regularizedHGFunCoeff_eq_zero_right`".

**Claim.** This makes a coarse cycle 1.1 → 1.3 → 1.1. Also, one `*Needs:*` line covers targets with different needs: 13.2.5 is about `𝐌` alone and needs only `regularizedHGFunCoeff_eq_zero_right`.

**Witness.** The numerical check of `kummerUBracket_intCast` at `n = 3, −2, 1, 0` (`|F| ≤ 7e−16`) uses only 13.2.5 for `𝐌`, nothing from 1.1.

**Repair.**
- Move 13.2.5 (`regularizedHGFun_neg_nat`) to the start of 1.1, or to its own subsection before 1.1.
- List it in the `*Needs:*` line of 1.1.
- Keep "1.1" only in the `*Needs:*` line for 13.2.7–13.2.8.

## Verified sound

**Gate and dependencies.**
- I re-ran the gate with `--base origin/main`. Every text and Lean check is 0: `tex`, `statement-hygiene`, `sorry-data`, `imports`, `readme-ids-missing`, `stray-files`, `outside-folder`, `build`.
- The only non-zero counter is `depcheck: NOT IN ORDER: SpecialFunctionsConfluent (insert it after its last supplier)`. Under the brief that is not a finding: the roadmap is placed after its last supplier.
- The dependency check against the candidate order prints `depcheck: 236 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Lean.**
- `lake env lean Suggested.lean` gives 37 warnings, all `declaration uses 'sorry'`, and no errors.
- The file has no `variable`, `include`, `set_option` or `lemma`.
- I elaborated `#check @name` for all 50 declarations in one scratch file, with 0 errors. Each type matches its README statement, and no binders are lost (every hypothesis is in the declaration's own signature).
- One-tactic probe: each `sorry` was replaced by `first | (rfl; done) | (simp; done) | (norm_num; done) | (infer_instance; done) | (fun_prop; done) | (positivity; done) | (aesop; done)`. All 37 theorems stay unsolved, so none is padding by that test.
- The roadmap-local copies agree verbatim with the suppliers: `besselI` and `besselK` with SpecialFunctionsBessel `Suggested.lean:81, 87`, and `airyAi` with SpecialFunctionsAiry `:63`. Their fully qualified names differ.

**Library declarations opened at the pins (14).**
- Mathlib `Analysis/SpecialFunctions/RegularizedHypergeometric.lean`:
  - `regularizedHGFun` (192);
  - `regularizedHGFunCoeff_eq_zero_right` (82);
  - `analyticOnNhd_regularizedHGFun_of_card_le` (282, in `z` only);
  - `regularizedGaussHGFun` (428);
  - `radius_regularizedGaussHGFunSeries_eq_top_of_left` (468);
  - `regularizedHGFun_zero_zero` (414).
- Other Mathlib files:
  - `eqOn_of_preconnected_of_eventuallyEq` (`Analysis/Analytic/Uniqueness.lean:224`);
  - `integral_boundary_rect_eq_zero_of_differentiableOn` (`Analysis/Complex/CauchyIntegral.lean:313`);
  - `differentiableOn_update_limUnder_of_bddAbove` (`Analysis/Complex/RemovableSingularity.lean:101`);
  - `Gamma_neg_nat_eq_zero` (`Analysis/SpecialFunctions/Gamma/Basic.lean:344`).
- Tau Ceti:
  - `TauCeti.lowerIncompleteGamma` (`IncompleteGamma.lean:115`: `∫₀^{max x 0} t^{s−1}e^{−t}`, and `0` for `s ≤ 0`, so 13.6.6 with `s > 0` is right);
  - `TauCeti.Real.erf` and `erfc` (`Erf.lean:61, 64`);
  - `Complex.hasSum_regularizedHGFun` (`RegularizedHypergeometric.lean:53`).
- Neither pin has Kummer's `U`, Whittaker functions, Laguerre polynomials, complex `erfc` or complex incomplete Gamma, so the docstring's "not statable" list is right.

**Cross-roadmap citations resolved (all present).**
- **AsymptoticExpansions (main):** §4.2 (552), §4.3 (562), §8.1 (904), §8.2 (919), §8.6 (1052), §10.2 (1201), §10.3 (1211), §10.4 (1229), and `Asymptotics.HasAsymptoticExpansion` (125).
- **SpecialFunctionsParabolicCylinder (main):**
  - Layer 1, §§1.1–1.6 (312–366), with the four names at its `Suggested.lean:52–66` and `parabolicCylinderU` at :107;
  - §6.7 (854);
  - it leaves 12.7.14 to a Chapter 13 roadmap (1303–1305).
- **SpecialFunctionsEiLiErfIncompleteGamma (main):**
  - §2.2 (585), §4.1 (700, with `IsMinimalSolution`, `contFrac` and `pincherle`), §11.4 (1308);
  - the function names in its Conventions (163–271);
  - it leaves 6.11.2–3, 7.11.5, 7.18.10, 8.5.3–5 and 8.19.16 to a Chapter 13 roadmap (1660–1662).
- **QuantumFoundations §9.4 (head 824bab8, README:995):** the Laplace definition, 13.3.7, 13.2.34, 13.2.41 on half-planes, 13.2.9–13.2.11, `U ∼ z^{−a}` and 13.6.19. The anchor resolves. Its §9.4 gives `U` no Lean name, so stating the agreement through 13.4.4 is right.
- **LaguerreJacobi (head):** A1 (224) and B3 (293–298, for `−1 < α`), which covers `b − 1` with `b > 0`.
- **SpecialFunctionsBessel (head):**
  - the Conventions names (214–217);
  - 10.32.9 in its §3.1 (763) and 10.39.5 in its §4.3 (827–834);
  - the Sturm-comparison auxiliary row for its 7.1 (158);
  - it leaves 10.16.6–8 and 10.39.6–8 to this roadmap (184–187).
- **SpecialFunctionsAiry (head):** `TauCeti.airyAi` and `TauCeti.airyBi` (142).
- **Ownership:** I searched the open pull requests by object (Tricomi `U`, `kummerU`, Whittaker `M`/`W`, `W_{0,`, Charlier, Coulomb, users of `regularizedHGFun`, Sturm, Laguerre). The second owners are those in R01 and R07. RelativisticQuantumFieldTheory and MaassForms are consumers only.

**The previous review's findings, checked one by one (12 repaired, 0 partly, 0 not).**

| Previous | Passage at this head | Status |
|---|---|---|
| R01 13.10.11 example | README:1013–1014 "`Γ(λ)² Γ(1 − λ) = π Γ(λ)/sin(πλ)` … equal `π^{3/2} = 5.56832 79968…`" | repaired (Fubini gives `Γ(λ)π/sin πλ`) |
| R02 second owner of `U` | README:52–56, 142–148, 198–200: consumes QuantumFoundations §9.4; agreement in 4.1 through 13.4.4 | repaired (option a) |
| R03 Sturm owned twice | README:178 "Sturm comparison, consumed from SpecialFunctionsBessel"; 383–385; 947; the auxiliary row is gone | repaired |
| R04 continued fraction | `Suggested.lean:263` `tendsto_convs_regularizedHGFun_div`; README:774 names it | repaired |
| R05 gate `tex` | gate `tex=0` | repaired |
| R06 `h.choose` | `Suggested.lean:80–81` `cos (π * b)`, `:122` `-Complex.cos (ν * π) / 2`; README:243 | repaired |
| R07 16 unnamed declarations | all 50 Lean names occur in the README (word search) | repaired |
| R08 Whittaker Checks | README:544–550 (three Checks, including the `κ ↔ μ` swap); 1043–1044 `A₃`, `A₄` | repaired (Check format: R06) |
| R09 Gauss supplier | README:411–412 "13.14.6 and 13.23.1" | repaired |
| R10 draft sentence | no "draft" in the folder | repaired |
| R11 Laguerre | README:57–58, 166, 353–355 (LaguerreJacobi B3); 1143–1145 | repaired |
| R12 narrow statements | `Suggested.lean:200` without `hb0`; README:571–572, 861–862 | repaired |

**Source sample (DLMF Release 1.2.8; fetched sections cited as `DLMF-13.x line N`; §§13.4 and 13.7 read on the public DLMF pages because the fetched copies are image-only).** I checked each target's locator, hypotheses and statement:
- **1.1:** 13.2.42 (DLMF-13.2 line 1632) gives the bracket `F` and `(π/sin πb)` through `Γ(1−b)Γ(b) = π/sin πb` and `Γ(b−1)Γ(2−b) = −π/sin πb`.
- **1.4:** 13.2.12 (line 600) matches the Lean form. I derived the integer limit `2πi m (−1)ⁿ/Γ(1+a−n)` by l'Hôpital.
- **1.5:** 13.14.1–13.14.13 (DLMF-13.14):
  - the 13.14.6 terminating `₂F₁` at `2`, which is `Γ(1+2μ)·regularizedGaussHGFun`;
  - 13.14.7 (line 379), checked against 13.2.5;
  - 13.14.10 (line 494);
  - "entire in κ and μ" after 13.14.13. That is separate holomorphy; for the joint claim see R02.
- **2.1:** 13.2.13–13.2.22, with the case split `a = −n`, `a = b−1−n` and "all other cases". The Lean limit is right in every case, including `Γ(1−b)/Γ(1−b−n) = (−1)ⁿ(b)ₙ`. 13.2.19 at `a = 1` gives `−ln z − γ`.
- **2.3:** 13.2.40–13.2.44; 13.2.43–13.2.44 were added in release 1.2.2.
- **3.1:** 13.3.1–13.3.29. The split 13.3.1–6 and 13.3.13 for `M`, 13.3.8–12 and 13.3.14 for `U`, matches. 13.3.22 is `U′ = −aU(a+1,b+1,·)` (line 661). The operator `(z d/dz z)ⁿ` was checked against 13.3.17 at `n = 1`.
- **3.2:** 13.15.1–13.15.26. Slater's (2.5.4) and (2.5.10) are corrected by 13.15.2 and 13.15.10 (DLMF-13.15 line 54), as the README says.
- **4.3:** 13.4.16 (`a ∉ −ℕ`, `|ph z| < π/2`, separating contour), 13.4.17 (`a, a−b+1 ∉ −ℕ`, `|ph z| < 3π/2`), 13.4.18 (`|ph z| < π/2`). With `dt = i dy` the Lean normalisation is `(2πΓ(a))⁻¹`.
- **5.2:** 13.6.1–13.6.21, including Temme's errors for 13.6.7–13.6.8 (DLMF-13.6 line 194). The domains of 13.6.6, 13.6.8, 13.6.11 and 13.6.12 are right; 13.6.14–13.6.18 are in R03.
- **6.1:** 13.7.3 in `|ph z| ≤ 3π/2 − δ`, and 13.14.21 in the same sector. 13.7.2 holds "unless `a` and `b−a` are both nonpositive integers", as 6.2 says.
- **6.3:** 13.8.1 holds for `|b+n| ≥ δ` with `a, z` fixed (DLMF-13.8 line 71), the Lean filter's region. 13.20.1 holds for `|ph μ| ≤ π/2 − δ`, uniformly for bounded `|z|` (DLMF-13.20 line 76).
- **7.1:** 13.9.1–13.9.7 (DLMF-13.9 lines 127–197), the parabolic regions (line 325) and the `b`-zero sentence (line 364). The README's corrections are confirmed (table). The partial sums of degree up to 15 have no zero in the interior of `P_α` for five parameter pairs covering all three ranges; at `a = b = 1` the degree-one sum has its zero at the vertex `−1`.
- **7.3:** §13.22 (DLMF-13.22 line 46) gives the same zeros as `M` and `U`.
- **9.2:** 13.12.1 (DLMF-13.12 line 46). Its note proves it by boundedness at infinity through 13.2.39–13.2.41 and 13.7.3, as 9.2 says. `b ∉ ℤ` is exactly what the four `M` factors and `b²(1−b²)` need.
- **9.4:** 13.24.1 (`κ + μ = 0` allowed, so the holomorphic reading is right), 13.24.3 (`p_s = (−z)^s × [t^s]`, consistent with `p₁ = z²/6`), 13.25.1, and 13.26 with the Slater errors (lines 57–60). The missing hypotheses are in R04.

**Adversarial table.** Computed in pure-Python complex arithmetic: shifted Stirling Γ, series for `𝐌` and `₀F₁`, integer-`b` derivatives by a Richardson-extrapolated central difference, tanh-sinh, exp-sinh and trapezoidal quadrature. "diff" is the largest difference over the points tried.

| Statement | Instances | Left side | Right side | Result | Change |
|---|---|---|---|---|---|
| `kummerUBracket_intCast` | `(a,n,w) = (0.3+0.2i,3,0.4−0.9i), (0.7,−2,1.1+2i), (1.3−0.5i,1,−0.3+0.2i), (−1.5,0,0.2+4i)` | `≤ 6.5e−16` | 0 | holds | R08 (order) |
| `tendsto_kummerULog_intCast` | `a=0.3+0.2i, n=2, w=0.5+0.7i`; `a=1.1, n=0, w=0.3−2.5i` (average at `b = n ± 10⁻⁵`) | 1.0501064066−0.3955064559i; 0.1067390423+0.6222078896i | 1.0501064059−0.3955064565i; 0.1067390414+0.6222078898i | holds (O(h²)) | — |
| `differentiable_kummerULog` | follows from the two rows above and the `deriv` form | — | — | true; prerequisite unowned | R02 |
| `kummerU_kummer_equation` | `(0.3,0.45,1.1+0.7i)`, `(0.6+0.2i,2,−1.5+0.3i)`, `(1.2,−1,0.8−0.6i)` | residual `≤ 9.4e−10` | 0 | holds | — |
| 1.1 Checks | `U(1,1,1)`, `U(½,½,1)`, `U(0.3,2,1.7)`, `U(1.2,0,0.8)`, `U(0.7,−1,2.5)` | 0.5963473623, 0.7578721561, 0.9498530205, 0.3574093373, 0.3322969197 | `eE₁(1)`=0.5963473623, `√π e erfc 1`=0.7578721561, integral 13.4.4: 0.9498530199, 0.3574093373, 0.3322969198 | holds | — |
| `regularizedHGFun_neg_nat` (13.2.5) | `(0.3+0.4i,2,1.3−0.4i)`; `(1,10,1)` | 1.9771524171+0.5664224406i; 2.7182818285 | same; same | holds | — |
| `kummerU_neg_nat` (13.2.7) | `(m,b,z) = (2,0.4+0.3i,1.2+0.5i), (3,−1,−2), (2,0,0.5−1.5i)` | −1.4−0.38i; −20; −3+1.5i | same | holds, including the cut and integer `b` | — |
| `kummerULog_add_two_pi_mul_I` (13.2.12) | `(0.3,0.45,1.1+0.7i,1)`; `(0.8−0.3i,1.7+0.2i,−0.9+0.4i,−2)` | 3.9363968583+4.0373700133i; −0.9791354425+1.3611431649i | same | holds | — |
| `kummerULog_intCast_add_two_pi_mul_I` | `(0.3,2,1.1+0.7i,1)`; `(0.7,−1,0.6−0.2i,1)`; `(1.4+0.2i,0,2,−1)`; `(0.5,3,−1+0.5i,2)` | 1.2658113704−1.9838414490i; −0.7286636479−1.0983297548i; … | same (diff `≤ 9e−11`) | holds | — |
| `whittakerW_equation` | `(0.3,0.2,1.1+0.7i)`, `(0.1+0.2i,0.5,0.9−0.8i)`, `(−0.4,0,2)` | residual `≤ 6e−9` | 0 | holds | — |
| 1.5 Checks | `W_{0,½}(2)`; `W_{½,0}(2)`; 13.18.1 at `z=0.6+0.3i`; 13.14.10 at `(0,½,0.7+0.4i)` | 0.3678794412; 0.5202600950; 1.2164367959+0.7006578526i; −0.7001394315−0.4219251114i | `e^{−1}`; `√2e^{−1}`; `2 sinh z`; `−M_{0,½}(z)` | holds; the swap is detected | R01 |
| 13.14.10 general | `κ=0.3, μ=0.35, z=1.1+0.7i` | −1.5395846837−0.2966892921i | `i e^{μπi} M_{−κ,μ}(z)` same | holds | — |
| `tendsto_kummerU_nhdsWithin_zero` | `z=10⁻⁷e^{0.4i}`, `(a,b) = (0.7,−0.6), (0.7,0), (−2,−0.5), (−1.5,0.5), (1.2,−1)` | 0.76584052, 1.10054628, −0.25000009, −0.00046−0.00009i, 0.41254708 | 0.76584060, 1.10054741, −0.25, 0, 0.41254713 | holds (errors `O(z^{1−Re b})`, `O(z ln z)`) | — |
| 2.1 Check 13.2.19 | `a = 1` | `−ln z − ψ(1) − 2γ` | `−ln z − γ` | holds | — |
| `kummerU_eq_cpow_mul_kummerU` (13.2.40) | `(0.3,0.45,1.1+0.7i)`, `(0.8+0.1i,2,−1.3−0.2i)`, `(1.4,−0.7+0.3i,0.2+2.2i)` | 0.8156415343−0.0986299628i; … | same (diff `≤ 6e−13`) | holds | — |
| `regularizedHGFun_eq_kummerU_add` (13.2.41 upper); lower sign | `(0.3,0.45,1.1+0.7i)`, `(0.3,2,−2)`, `(0.6+0.3i,1.3,−0.8)`, `(0.9,−1,0.4−1.2i)`, `(1.1,0.6,0.5±1.5i)` | 0.9455825546+0.6023584360i; 0.7928652489; 0.7893979196−0.1430374387i; … | same (diff `≤ 7e−13`) | holds for every `z ≠ 0`, both signs | — |
| 13.2.43, 13.2.44 | `(0.3,0.45,1.1+0.7i)`; 13.2.43 also at `z=−1.5`, `(0.7,2,−0.6−0.9i)` | 0.4816438052+1.3766839822i; 0.3969319185+0.4151794535i; 9.0224595483i | same | holds | — |
| `whittakerW_neg` (13.14.31) | `(0.3,0.35,1.1+0.7i)`, `(0.2−0.1i,1,0.5−0.9i)`, `(0,½,2)` | 0.6386051605−0.1291882571i; 0.9665782926+0.6529997735i; 0.3678794412 | same | holds | R01 |
| `whittakerW_eq_whittakerM_add` (13.14.33) | `(0.3,0.35,1.1+0.7i)`, `(−0.4+0.2i,0.15,2−0.5i)` | 0.6386051605−0.1291882571i; 0.1894851731+0.1171160868i | same | holds | — |
| 2.4 regularized Wronskians | `κ=0.3, μ=0.35, z=1.1+0.7i`; `μ = ½` | −0.2575181074, −0.6187642989; 0 | `−sin 2πμ/π`, `−1/Γ(½+μ−κ)`; 0 | holds | — |
| `hasDerivAt_kummerU` (13.3.22) | `(0.3,0.45,1.1+0.7i)`, `(0.7,1,−1+0.3i)`, `(1.2+0.3i,−2,0.5−0.4i)` | −0.1145765097+0.0722838334i; 0.5475687611−0.4387028748i; … | same | holds | — |
| `regularizedHGFun_eq_integral` (13.4.1) | `(0.7+0.2i,1.9−0.1i,1.3−0.8i)`, `(0.4,0.9,−3)` | 1.9168586936−0.3447760735i; 0.4002918420 | quadrature same | holds | — |
| `kummerU_eq_integral` (13.4.4) | `(0.8+0.3i,1.7−0.4i,0.9+0.6i)`, `(0.5,2,1.5)`, `(1.3,−0.5+0.2i,0.4−0.3i)` | 0.6886295354−0.7228899026i; 0.9317209755; 0.3013236595+0.1002088117i | quadrature same | holds | — |
| `regularizedHGFun_neg_eq_barnes_integral` (13.4.16) | `(1.3+0.2i,2.1−0.5i,0.8+0.5i,c=−0.4)`, `(0.6,0.3,1.5−0.6i,c=−0.2)` | 0.7337907897−0.1312600452i; −0.1302181214+0.0429255897i | line integral same | holds | — |
| `tendsto_convs_regularizedHGFun_div` (13.5.1) | `(0.3+0.2i,1.4,2.5−i)`, `(−2,½,1)`, `(0.7,−1.5,−4)`, 60 convergents | 0.4767000252+0.2346938109i; −5; −0.0678901821 | `𝐌(a,b,z)/(b𝐌(a+1,b+1,z))` same | holds | — |
| `kummerU_half_half_sq` (13.6.8) | `x = 0.7, 2` | 0.9321872517; 0.4526770500 | `√π e^{x²} erfc x` same | holds | — |
| `kummerU_one_sub_one_sub` (13.6.6) | `(s,x) = (0.6,1.3), (2.5,0.4)` | 0.7456488604; 1.9375966632 | `e^x(Γ(s)−γ(s,x))` same | holds | — |
| `kummerU_airyAi` (13.6.11) | `z = 0.6+0.9i, −0.5+1.2i, 1.5` | 0.2727658251−0.6338207217i; −0.4446329772−0.4152847945i; 0.4540637791 | same | holds | — |
| `kummerU_parabolicCylinderU` (13.6.12) | `(0.7,1.1+0.3i)`, `(−1.3+0.4i,0.6−0.8i)` | 0.8145637285−0.1446806481i; 0.4433787090−0.1942677213i | same | holds | — |
| 13.6.18 | `n=2`: `z=1`; `z=−1`; `z=−0.6+0.8i`; `n=3, z=−1` | 0.5; 0.5; 0.3−1.2i; −0.5 | 0.5; **−0.5**; **−0.3+1.2i**; −0.5 | **fails for even `n`, `Re z<0`** | R03 |
| 13.18.14, 13.18.16 | `z = 0.8+0.3i`; `z = −0.8+0.3i` (`n=1,2`; `n=2,3`) | agree; −0.1109114934+0.6685261843i (13.18.14, `n=1`) | agree; **−0.6685261843−0.1109114934i** | **fail for `Re z<0`** | R03 |
| 13.6.14, 13.6.15 | `(0.7,−1.1+0.3i)`, `(−1.3+0.4i,−0.6−0.8i)` | 1.7946152197−0.7026920297i; 1.4706414347−0.3841350893i; … | same | hold for `Re z<0` | R03 |
| `whittakerW_zero_eq_besselK` (13.18.9) | `(ν,z) = (0.3,0.8+0.4i), (1,0.8+0.4i), (0,−0.5+0.7i), (0.5+0.2i,1.5−i)` | 0.3932570522−0.1561245294i; 0.5208338380−0.2832363373i; 1.4199963599−0.8912612575i; … | same | holds, including integer `ν` | R01 |
| 5.3 Check 13.18.17 | `α=0.4, n=2, z=0.7+0.2i` | `W`: 0.2891098319−0.3579475478i | `(−1)ⁿ(α+1)ₙM` and `(−1)ⁿn! e^{−z/2}z^{α/2+½}Lₙ^{(α)}`: same | holds | — |
| `isBigO_kummerULog_sub_sum` (13.7.3) | `a=0.4+0.3i, b=1.35, N=2, Im w=1.3π`, `\|z\| = 6, 10, 14` | `\|rem\|/\|e^{−(a+N)w}\|` = 0.388, 0.102, 0.137 | bounded | holds | — |
| `isBigO_regularizedHGFun_sub_sum_cobounded` (13.8.1) | `a=z=1, n=2`, `b = 30, −20.5, −40.5, 25i, −30.1+0.5i` | `\|b\|²\|rem\|` = 0.9989, 0.9975, 0.9994, 1.0016, 0.9989 | bounded | holds near the negative axis | — |
| `ncard_pos_zeros_regularizedHGFun_of_neg` (13.9.1) | `(−0.5,0.01), (−2.3,1.5), (−3,0.7)` | sign changes 1, 3, 3 | `⌈−a⌉₊` = 1, 3, 3 | holds | — |
| 7.1 Checks | zero of `M(−0.5,0.01,·)`; `𝐌(−0.5,0,x)` at `x = 0.001, 1, 10`; `b`-zero of `M(1,·,1)` | 0.0199014758; −0.0005, −0.664, −2155 (no zero); −10.0000008232663 | README: 0.01990 14758; none; −10.00000 08232 66 | holds | — |
| 13.9.3, 13.9.6 as printed and corrected | `(0.5,−0.5), (0,−0.5)`; `(−1.5,−2.5), (−1.5,−3.5), (−1,−1.5), (−2,−4.5)` | counts 1, 0; 1, 0, 0, 0 | printed 1, **1**; 1, 0, **1**, **1**; corrected forms agree | README corrections right; absent from Lean | R05 |
| `regularizedHGFun_ne_zero_of_nonneg` (13.9.2) | series with terms `(a)ₙxⁿ/(n!Γ(b+n)) ≥ 0`, first term `> 0` | `> 0` | `≠ 0` | holds | — |
| `kummerU_ne_zero` (Wimp) | `a=0.5, b=1.9`, grid of `\|z\| ∈ {0.05,…,10}`, `ph z ∈ [−π/2, π/2]`; `a=−2, b=−4.5` | `min\|U\|` = 0.3166; zeros `−3.5 ± 1.87i` | `≠ 0`; outside the sector | holds | — |
| `integral_cpow_mul_regularizedHGFun_neg` (13.10.10) | `(1.6,2.3,0.7)`, `(1.2+0.3i,0.8,0.5+0.2i)`, `(1,1,½)`, `(1,2,0.4)` | 1.7374647625; 0.5012004867−0.8404298515i; 1.7724538509; 3.6969325729 | `Γ(s)Γ(a−s)/(Γ(a)Γ(b−s))` same | holds | — |
| 8 example 13.10.11 at `a=b=1` | Fubini with `e^tE₁(t) = ∫₀^∞e^{−tu}/(1+u)du`, `λ = ½` | `Γ(λ)·π/sin πλ` = 5.5683279968 | README `π^{3/2}` = 5.5683279968 | holds | — |
| `hasSum_regularizedHGFun_buchholz` | `(0.2−0.5i,1.4+0.4i,−1.2+0.3i)`, `(0.3,1.7,2.1)`, `(1,−2,0.7)`; at `b=2a`: `(0.65+0.2i,1.3−0.4i)` | 1.1852922839+0.4678121627i; 1.8516687739; 0.6907171787; 2.4479444299−0.5249427441i | `𝐌(a,b,z)` same | holds | R06 |
| `buchholzCoeff` Checks | `a=0.3+0.1i, b=1.7` | `A₃` = −0.3666666667+0.0666666667i, `A₄` = 0.78625 | `(2a−b)/3`, `b(b+2)/8` | holds | R06 |
| `kummer_quadratic_relation` (13.12.1) | `(0.3+0.2i,0.45,1.1+0.7i)`, `(1.7,−2.3,0.8−1.1i)` | 1.0000000000; 1.0000000000 | 1 | holds | — |
| 13.26.1 | `κ=0.3, μ=0.35, x=1`: `y = 0.6`; `y = 1.5` | 1.2580669306; terms 2.9, 3.0e3, 5.0e6 | 1.2580669306; diverges | needs `\|y\|<\|x\|` | R04 |
| `airyAi_eq_whittakerW` (9.6.21) | `z = 1, 0.6+0.9i, −0.5+1.2i` | 0.1352924163; 0.1491905827−0.1992497397i; 0.6110541846−0.4311461441i | same | holds | — |
| `besselK_eq_kummerU` (10.39.6) | `(1,0.8+0.4i)`, `(0.3,−1+0.2i)`, `(0,2)` | 0.5855167600−0.5238887310i; −0.1024145426−3.6527135484i; 0.1138938728 | same | holds | — |
| `parabolicCylinderU_eq_whittakerW` (12.7.14) | `(0.7,1.1+0.3i)`, `(−2,0.5−i)` | 0.3888010245−0.1378763639i; −0.1037104359−1.6755001982i | same | holds | — |
| `kummerUBracket` Check (proposed) | `(π/sin πb)F(0,b,w)` at `(0.37,0.4+1.1i)`, `(1.6−0.3i,−0.7+3i)` | 1.0000000000; 1.0000000000 | `U(0,b,z) = 1` | holds | R06 |
| `analyticOnNhd_kummerU`, `differentiable_regularizedWhittakerMLog` | `log` is analytic on the slit plane; explicit product of entire factors with `𝐌` | — | — | true; the second needs R02's target | R02 |

## Not verifiable

- **Gautschi (1967, SIAM Rev.).** It supports only the minimal-solution route of 5.1. The text is paywalled and I did not open it; no statement depends on it.
- **Wimp (1965, Proc. AMS).** I checked the statement only as DLMF reports it (DLMF-13.9, §13.9(ii): `a, b ∈ ℝ`, `2a − b > −1`, `|ph z| ≤ ½π`), plus the numerical rows above.
- **Tricomi (1954), Slater (1960), Buchholz (1969), Olver (1974), Temme (2015).** No sampled target cites a locator in them, so I did not open them.
- **The interior form of the parabolic zero-free regions for the partial sums.** It has no source beyond DLMF's closed form. I checked it numerically only, up to degree 15.
- **Ownership against open pull requests.** I checked this through the `roadmaps grep`/`show` index of 2026-11-09 and the sibling checkouts named in the brief.

## Source issues

- **Gap** in DLMF at §13.6(v), 13.6.18 (Release 1.2.8): the source gives `U(½ − ½n, 3/2, z²) = 2^{−n} z^{−1} H_n(z)` with no domain; with principal `U` it should require `−π/2 < ph z ≤ π/2` for even `n` (fails at `n = 2`, `z = −1`); affects a stated result.
- **Gap** in DLMF at §13.18(v), 13.18.14–13.18.16 (Release 1.2.8): the source gives no domain, and its principal `√z` differs from `(z²)^{1/4}` when `Re z < 0`; it should require `−π/2 < ph z ≤ π/2`; affects a stated result.
- **Gap** in DLMF at §13.6(ii), 13.6.8 (Release 1.2.8): the source gives `U(½, ½, z²) = √π e^{z²} erfc z` with no domain; it holds only for `−π/2 < ph z ≤ π/2` (principal `U` is even in `z`, `erfc` is not); affects a stated result.
- **Error** in DLMF at §13.9(i), 13.9.3–13.9.4 (Release 1.2.8): the source allows `a ≥ 0`; it should require `a > 0`, since `M(0, b, x) = 1` has no zero while 13.9.3 gives `1` at `b = −½`; affects a stated result.
- **Error** in DLMF at §13.9(i), 13.9.6 (Release 1.2.8): the source requires only `⌈−b⌉ > ⌈−a⌉ > 0`; it should also exclude `a ∈ {−1, −2, …}` (at `a = −2`, `b = −4.5` it gives `1`, the true count is `0`); affects a stated result.
- **Error** in DLMF at §13.9(i), last sentence (Release 1.2.8): the source says `M(a, b, z)` has finitely many `b`-zeros for fixed `a, z`; it should restrict to `|b + n| ≥ δ`, since `M(1, b, 1)` vanishes at `b ≈ −10.0000008233` and near every large even `−n`; affects a stated result.
- **Error** in DLMF at §13.9(i), paragraph after 13.9.9 (Release 1.2.8): the source says the closed regions `P_α` are zero-free for the partial sums; at `a = b = 1` the partial sum `1 + z` vanishes at the vertex `−1 ∈ P₁`, so only the interior is zero-free; affects a stated result.
