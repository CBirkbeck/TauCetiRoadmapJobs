# FIX-DESIGN-HardSphereDynamicsAndKineticLimits~12

Repair of the findings of `REV-DESIGN-HardSphereDynamicsAndKineticLimits~11` (two findings, both P3). Files changed: `packages/HardSphereDynamicsAndKineticLimits/design/README.md` (§1.1 Check 3, §10.5 Check 3) and `packages/HardSphereDynamicsAndKineticLimits/design/plan.json` (tests `sup_norm_torus_fails` of target 1.1 and `poisson_variance` of target 10.5). `sources.toml` is unchanged; no source was fetched.

## F01 (P3) — applied

§10.5 Check 3: "`ε = 0` (Poisson process …): `Var(π(h)) = μ^{−1} ∫ f⁰ h²` exactly, which tends to 0" → "`ε = 0` at `t = 0` (…; the flow is not used, `T_0` being the identity by §7.1): `F_1(0) = f⁰`, `F_2(0) = f⁰ ⊗ f⁰` for every mass (§9.5, `Z = exp(μ ∫ f⁰)`, §9.3), so §10.1 gives `Var(π_0(h)) = μ^{−1} ∫ f⁰ h²`, tending to 0 as `μ → ∞`", plus the witness μ = 2, `h = 1`: variance 1/2. Plan test aligned.

Verification. The finding is right: at `t ≠ 0` the formula is false in general (one particle under free transport, `h` supported away from `S_t(supp f⁰)` but `∫ f⁰ h² > 0`: the variance is 0, the formula positive), and at `ε = 0` the flow lies outside the standing hypothesis `0 < ε < ρ` of the Conventions. At `t = 0`, `T_0 = id` holds by the definition of §7.1 (the trajectory of `Z ∈ G` at time 0 is `Z`; `Z ∉ G` is fixed), so no flow is used. At `ε = 0`, §9.3 gives `Z = 1 + Σ_N (μ∫f⁰)^N/N! = exp(μ∫f⁰)`, and the definition of §9.5 gives `F_n(0) = Π_i f⁰(z_i) · Z^{−1} Σ_p (μ∫f⁰)^p/p! = (f⁰)^{⊗n}` whatever the mass of `f⁰` (the §9.5 Check states the mass-1 case only, so the new sentence cites the definition, not that Check). The two identities of §10.1 then give `E[π_0(h)] = ∫ f⁰ h` and `E[π_0(h)²] = μ^{−1}∫ f⁰ h² + (∫ f⁰ h)²`, hence the variance. The reviewer's repair text was correct; I added the derivation's inputs (§7.1, §9.3, §9.5, §10.1) and one computed witness.

Pattern search: every other `ε = 0` statement in the README was read. §9.3 Checks (README lines 709, 711–713) and §8.4 Check 4 (line 659) concern the static measure, with no time; §9.5 Check 2 (line 737) names `F_n(0)`, so the time is explicit. No other occurrence.

## F02 (P3) — applied

§1.1 Check 3: "the class of `(0.1, 0.1)` has supremum norm 0.1 while every lift has Euclidean norm at least `0.1414`" → "for any radius ρ > 0: for `0 < s < min(ρ, 1/2)` the class of `(s, s)` has supremum norm `s < ρ`, while every lift `(s + m, s + n)` has Euclidean norm at least `s√2 > s`, since `|s + m| ≥ s` (0.1 against 0.1414 at `s = 0.1`; for ρ = 0.05, 0.01 against 0.01414)". Plan test aligned.

Verification. The finding is right: the lift axiom of §1.1 applies only to `‖ξ‖ < ρ`, so the old witness refutes only instances with ρ > 0.1. At the pin, `UnitAddTorus` is `abbrev UnitAddTorus (d : Type*) := d → UnitAddCircle` (`Mathlib/Topology/Instances/AddCircle/Real.lean:55`), so it carries the Pi supremum norm, and `AddCircle.norm_coe_eq_abs_iff` (`Mathlib/Analysis/Normed/Group/AddCircle.lean:107`) gives `‖(s : UnitAddCircle)‖ = |s|` exactly when `|s| ≤ 1/2`. For `0 < s < 1/2` and an integer `m`: `m = 0` gives `s`; `m ≥ 1` gives `s + m ≥ 1 > s`; `m ≤ −1` gives `|m| − s ≥ 1 − s > s`. So every lift has Euclidean norm at least `√(s² + s²) = s√2 > s`. Values: `0.1 · √2 = 0.14142`, `0.01 · √2 = 0.014142`. The other axioms cannot rescue the instance. The upper bound `‖π a‖ ≤ max(|a_1|, |a_2|) ≤ |a|` holds. For ρ ≤ 1/2, injectivity on `B(0, ρ)` and the local measure axiom also hold. The lift axiom is the one that fails, for every ρ ∈ (0, ∞] (for ρ = ∞, `min(ρ, 1/2) = 1/2`).

Pattern search: the other comparison with the supremum norm (§1.3 Check 3, line 139, and test `sup_norm_differs`) compares two norms at `(1/2, 1/2)` and makes no claim about a radius. No other Check refutes a class axiom with a fixed witness.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §10.5 Check 3, variance at `ε = 0`, `t = 0` | mass 1, μ = 2, `h = 1`; mass 0; mass `c`, general bounded `h` | `N ~ Poisson(2)`, `Var(N/2) = 2/4 = 1/2`, formula `μ^{−1}∫f⁰ = 1/2`; `f⁰ = 0`: `N = 0` a.s., variance 0, formula 0; mass `c`: `Z = e^{μc}`, `F_1 = f⁰`, `F_2 = f⁰⊗f⁰`, `E[π_0(h)²] − (E π_0(h))² = μ^{−1}∫f⁰h²` | Holds at `t = 0` for every mass | Check restated with `t = 0`, derivation inputs and witness |
| Same formula at `t ≠ 0` (excluded) | one particle, free transport, `h` vanishing on `S_t(supp f⁰)` with `∫ f⁰ h² > 0` | variance 0 against a positive formula | False, so the time is now named | `t = 0` stated |
| `T_0 = id` used in the Check | `Z ∈ G`; `Z ∉ G` | trajectory value at time 0 is `Z`; junk value `Z` | Holds by the definition of §7.1, for every ε | none |
| §1.1 Check 3, supremum-norm torus | ρ = 0.05, `s = 0.01`; ρ = 1, `s = 0.1`; ρ = ∞, `s = 0.4` | norm 0.01 < 0.05 against lift ≥ 0.014142; 0.1 < 1 against ≥ 0.14142; 0.4 < ∞ against ≥ 0.56569 | Lift axiom fails in each case | Check restated for every ρ |
| `|s + m| ≥ s` for `0 < s < 1/2` | `m = 0, 1, −1, −2` at `s = 0.4` | 0.4, 1.4, 0.6, 1.6, all ≥ 0.4 | Holds; it fails for `s > 1/2` (`s = 0.6`, `m = −1`: 0.4 < 0.6), hence the bound `s < 1/2` | none |
| Other axioms of §1.1 on the supremum-norm torus | `a = (0.3, 0.4)`; ρ = 0.5 | `‖π a‖ = 0.4 ≤ |a| = 0.5`; the Euclidean ball of radius 0.5 lies in `(−1/2, 1/2)²`, so `π` is injective there and preserves measure | Hold, so the lift axiom is the one that refutes | none |

## Checks

Dependency check (command of the brief), output:

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `plan.json` parses as JSON after the edit. The diff touches only the two tests named above. No `*Needs:*` line, prerequisite, target or name changed, so the README and plan agree as before.

Lean: this is the design stage. The package has no `Suggested.lean`, so no `#check` comparison or elaboration was run and no Lean command was used.

Gate failures: none were listed for this round.

## For the maintainer

- No name, section number or id changed. No other roadmap is affected.
- No supplier was added. Ownership is unchanged by this round: both edits are Checks on this roadmap's own objects.
- No suspicious instruction was found in the review text.
