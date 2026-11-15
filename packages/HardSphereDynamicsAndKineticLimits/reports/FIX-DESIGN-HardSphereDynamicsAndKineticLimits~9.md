# Repair of HardSphereDynamicsAndKineticLimits (design, round 9)

This round settles the three findings of `REV-DESIGN-HardSphereDynamicsAndKineticLimits~8`: F01, F02 and F03, all P3. I checked each one against the README, the plan and MathematicalBilliards at the head of its open pull request. All three are right. F01 and F03 are applied as asked. F02 is applied with a different Check, so that §1.2 does not cite the later §1.4.

I edited `packages/HardSphereDynamicsAndKineticLimits/design/README.md` and `packages/HardSphereDynamicsAndKineticLimits/design/plan.json`. I did not touch `sources.toml` and fetched no source; no locator changed. This is the design stage, so there is no `Suggested.lean`, and I ran no Lean command and no `#check` comparison.

## F01 (P3) — applied

Scope and ownership, after the ComplexTori sentence, new: "MathematicalBilliards §10.5 gives `ℂ/Λ` its translation-surface atlas and directional flows, while §1.3 here gives `E ⧸ L`, in every dimension `d`, its Euclidean quotient norm and its Haar measure of total mass `ZLattice.covolume L` (for `d = 2` this mass is the flat area of MathematicalBilliards §10.3, `4` for `2ℤ + 2iℤ`); neither roadmap restates the other's structure." No target changed.

## F02 (P3) — applied differently

§1.2: "every statement of this roadmap specialises on `E` …" → "for this instance the short lift `ℓ` of §1.1 is the identity on all of `E`, so the contact normal `ℓ(x_i − x_j)/ε` is `(x_i − x_j)/ε` for every ε > 0, and free transport `x + π(t v)` is `x + t v`". New Check and plan test `infinite_radius`. They use §1.1's ball axiom, not the later §1.4.

## F03 (P3) — applied

§4.5: "`η > 0` with `ε + η < ρ`, and `s ≥ 0` with `2 R s ≤ η`" → "`R ≥ 0` and `s ≥ 0`". The domain is unchanged. "`η = 4`" is deleted from Check 4. In §6.2, "taken with `η = 4Rδ`" is replaced by the reason a near pair lies in the domain. Plan 4.5 now has hypotheses `0 < ε < ρ`, `i ≠ j`, `R ≥ 0`, `s ≥ 0`, and its test `others_fixed` drops `η = 4`. Plan 6.2 matches the README.

## Evidence and the repaired pattern

### F01

- **The witness.** MathematicalBilliards (open, at the head given by `roadmaps show`) has `### 10.5 Flat tori`. It proves that `ℂ/Λ` is a translation surface with `Σ = ∅` whose directional flows are the linear flows, and it has the Check "`Λ = 2ℤ + 2iℤ`: area `4`". Its §10.3 defines the flat area `area_X` of any translation surface, with the Check "Torus `ℂ/Λ`: area = covolume Λ". Our scope paragraph did not name it.
- **The agreement.** For `L = 2ℤ × 2ℤ` in `E = EuclideanSpace ℝ (Fin 2)`, `ZLattice.covolume L = |det(2e_1, 2e_2)| = 4` (`ZLattice.covolume`, `Mathlib/Algebra/Module/ZLattice/Covolume.lean:73`). This equals MathematicalBilliards' area 4.
- **No duplication.** The two roadmaps put different structures on the torus:
  - MathematicalBilliards: a translation atlas on a compact surface, with cone points and directional flows.
  - This roadmap: a normed group `E ⧸ L` in every dimension `d`, with a `MeasureSpace` instance and the `FlatPositionSpace` axioms.

  So neither section is deleted, and the clause says how they differ.
- **The pattern.** I searched every roadmap README, on main and at the open heads, for a section heading on flat or real tori (`roadmaps grep`). The only hit in this subject is MathematicalBilliards §10.5. The other hits, HilbertModularVarietiesAndShimuraCurves H6.4 and FunctionFieldArithmeticPartII 3.12, are about torsion points and torsors. ComplexTori is already named. So the scope paragraph needed only this one clause.

### F02

- **The vague target.** The old sentence quantified over "every statement of this roadmap", so it was no target an implementer could prove. The plan statement was already precise. The README sentence now says the same as the plan: `ℓ = id` on `E`, the normal formula for every ε > 0, and the free-transport formula. Plan 1.2 says the same, word for word.
- **Why a new Check is needed.** Take the same cover `π = id` with the finite radius ρ = 2. It satisfies every axiom of §1.1:
  - lifts `a = ξ` for `|ξ| < 2`;
  - injectivity on `B(0, 2)`;
  - the local measure axiom on `A ⊆ B(0, 2)`.

  It also passes the three old Checks: the normal `(1, 0)` at ε = 1 < 2, the volume `4π/3` at radius 1 ≤ 2, and `(2, 0)`.
- **The new Check.** In d = 2 at ε = 100, `(100, 0)` and `0` are in contact, with normal `ℓ(100, 0)/100 = (1, 0)`. The ball of radius 100 has measure `π · 100² = 10⁴π = 31415.93` by §1.1's ball axiom (`r ≤ ρ = ∞`) and `EuclideanSpace.volume_ball`. With ρ = 2, the hypothesis `ε < ρ` fails at ε = 100, `ℓ` is specified only for `|ξ| < 2`, and the ball axiom covers only `r ≤ 2`. So the new Check tells the two instances apart.
- **Why the Check differs from the review's.** The review's Check used §1.4's shell formula (`π(100² − 99²) = 199π = 625.18`). §1.4 comes after §1.2, and the previous round removed every forward reference of this kind. §1.1's ball axiom separates the two instances just as well, and §1.2 already lists it in `*Needs:*` (§1.1, `EuclideanSpace.volume_ball`). So no `*Needs:*` line and no plan prerequisite changes.
- **Another wrong model.** The structure `π = −id`, ρ = ∞ also satisfies §1.1. It is excluded by the existing Checks 1 and 3, which would give `(−1, 0)` and `(−2, 0)`.
- **The pattern.** The phrase "specialises" and statements over "every statement" occur nowhere else in the README (grep). §1.3, the other instance section, states its instance with explicit axioms and the value of ρ.
- **Consumers of §1.2.** All four use exactly the two formulas the new statement gives:
  - §3.2 API `ν_ij = (x_i − x_j)/ε` on `E`;
  - §3.4 API and Check (`S_2(0, (1, 0)) = ((2, 0), (1, 0))`, `TauCeti.flowOfLipschitz`);
  - §5.4 on `X = E`;
  - §8.2 API on `E`.

### F03

- **η is unused.** On the domain, the relative motion keeps `|u| ≤ |v_i| + |v_j| ≤ 2R`, and `|R_q u| = |u|`. So the relative position stays within `|a| + 2Rs < ρ` on `[0, s]`, and the short lift `ℓ` is defined along the whole path. Neither the domain nor the conclusion mentions η.
- **The new statement is no weaker.** If the domain is nonempty, then `ε + 2Rs ≤ ‖x_i − x_j‖ + 2Rs < ρ`. So the old hypotheses hold with `η = 2Rs` when `Rs > 0`, and with any small η when `Rs = 0`. The old and new statements therefore assert the same thing for every `(i, j, R, s)` whose domain is nonempty.
- **`R ≥ 0` rather than the review's `R > 0`.** `R` enters only through the domain. At `R = 0` the domain has `v_i = v_j = 0`, `B_s(a, 0) = (a, 0)`, and the map is the identity on a `λ_N`-null set, so the statement holds. I kept the more general form. The consumer §6.2 uses `R > 0`, which is a special case.
- **`0 < ε < ρ` in the plan.** The Conventions assume `0 < ε < ρ` for every dynamical statement. The old hypothesis `ε + η < ρ` implied `ε < ρ`, so the plan now states it directly.
- **§6.2.** A near pair of `Z ∈ 𝒟̄` with `|V| ≤ R` satisfies `ε ≤ ‖x_i − x_j‖ ≤ ε + 2Rδ` and `|v_i|, |v_j| ≤ |V| ≤ R`. So `‖x_i − x_j‖ + 2Rδ ≤ ε + 4Rδ < ρ`, which is the domain of `P^{ij}_δ`. The parenthetical now says this without η, and plan 6.2 says the same.
- **The pattern.**
  - I scanned every plan target mechanically for a hypothesis symbol that its statement does not mention. The only hits are the standing `0 < ε < ρ` of Layers 3–10, where ε and ρ enter through `𝒟̄^ε`, `ℓ` and `G`. That is the Conventions' standing hypothesis, not an unused parameter.
  - I also read every target's opening sentence (grep of `Prove|Define|For|Give|Let`). No other target introduces a parameter that its domain and conclusion do not use.
  - The η of §6.1 is used: it sets the shell width in both the set `I` and the bound. §6.2 and §6.3 instantiate it as `η = 2Rδ`. After this repair, η means only §6.1's parameter. Before, §6.2 also used "`η = 4Rδ`" for the pair maps, an overload that is now gone.

## Adversarial pass

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.2, `ℓ = id` on `E` (F02) | d = 1, 2; ε = 1 and ε = 100 | `B(0, ∞) = E` and `π = id`, so `ℓ(ξ) = ξ`; `ℓ(1, 0)/1 = (1, 0)`; `ℓ(100, 0)/100 = (1, 0)`; d = 1: `ℓ(−3) = −3` | Holds | statement reworded |
| §1.2 new Check (F02) | ρ = ∞ against ρ = 2 with `π = id` | ρ = ∞: `ε = 100 < ρ`, ball `10⁴π = 31415.93`. ρ = 2: `100 < 2` is false; the ball axiom requires `r ≤ 2`, and 100 > 2; the old Checks give `(1, 0)`, `4.18879`, `(2, 0)` for both | Separates the two instances | new Check, plan test `infinite_radius` |
| §1.2, wrong cover `π = −id` | Checks 1 and 3 | `ℓ = −id`: normal `(−1, 0)` instead of `(1, 0)`; transport `(−2, 0)` instead of `(2, 0)` | Excluded by the existing Checks | none |
| §1.3 against MathematicalBilliards §10.3/§10.5 (F01) | `L = 2ℤ × 2ℤ`; `L = ℤ²` | covolume `4` against area `4`; covolume `1` against the area of `ℂ/(ℤ + iℤ)`, which is 1 | The masses agree; the structures differ | scope clause |
| §4.5 without η (F03), Check 4 | `N = 3`, d = 1 on `E`, ε = R = 1, `s = 1`, positions `0, 2, 20`, velocities `0.1` | domain: `2 ≥ 1`, `2 + 2 = 4 < ∞`, `0.1 ≤ 1`; `a = −2`, `u = 0`, `w = 0.2`; `B_1(−2, 0) = (−2, 0)`; `x_2 = 2.1`, `x_1 = 2.1 − 2 = 0.1`, `x_3 = 20` | Holds without η | `η = 4` deleted |
| §4.5, head-on Check | `P^{12}_3` on `E`, any `R ≥ 1` | `2 + 6R < ∞`; `a = (2, 0)`, `u = (−1, 0)`, `D = 4 − 3 = 1`, `τ = 1`, `q = (1, 0)`, `R_q u = (1, 0)`, `a' = (1, 0) + 2(1, 0) = (3, 0)`; `w = (−1, 0)`, `v_2' = (w − u')/2 = (−1, 0)`, `x_2 = (−2, 0)`, `x_1 = (1, 0)` | Holds | none |
| §4.5, torus domain | unit torus, ε = 0.3, R = 1; `s = 0.09` and `s = 0.045` | separation 0.47: `0.47 + 0.18 = 0.65 ≥ 0.5`, outside the domain; separation 0.39: `0.39 + 0.09 = 0.48 < 0.5`, inside | Agrees with the §6.2 Check | none |
| §4.5, degenerate `s = 0` and `R = 0` | `B_0`; zero velocities | `s = 0`: the identity except at incoming contacts (the §4.4 Check); `R = 0`: `u = 0`, `⟨a, u⟩ = 0`, no collision, the identity on a null domain | Holds | `R ≥ 0` admitted |
| §4.5, old hypotheses implied by a nonempty domain | `Rs > 0`; `Rs = 0` | `ε + 2Rs ≤ ‖x_i − x_j‖ + 2Rs < ρ`, so `η = 2Rs` works; if `Rs = 0`, then `ε < ρ` and any `η < ρ − ε` works | The old and new statements are equivalent on nonempty domains | none |
| §6.2 parenthetical (F03) | the block-composition Check (d = 1, ε = R = δ = 1, positions `0, 2, 20, 22`); the torus Check | pair `{1, 2}`: `1 ≤ 2 ≤ 3`, `2 + 2 = 4 < ∞`, speeds `0.1 ≤ 1`; torus δ = 0.045: `0.3 ≤ 0.39 ≤ 0.39`, `0.39 + 0.09 = 0.48 ≤ 0.48 < 0.5` | Holds | reworded without η |
| `*Needs:*` and Dependencies | §1.2, §4.5, §6.2 | §1.2 still uses only §1.1 and `EuclideanSpace.volume_ball`; §4.5 still uses §1.1, §3.4, §4.4; no `target:` prerequisite changed; the layer Dependencies lines are unchanged | Consistent | none |
| Counts | §1.2 | Checks 3 → 4; plan tests 3 → 4 | At least 3 per section and per target | none |

## Checks

**Dependency check** (`tauceti-roadmap … gate --candidate packages/HardSphereDynamicsAndKineticLimits/design/README.md --only HardSphereDynamicsAndKineticLimits …`):

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

**Citations.** `roadmaps resolve` on the edited README finds no cross-roadmap citation and no Lean name unresolved. The new citations, MathematicalBilliards §10.3 and §10.5, match the headings at that roadmap's open head (`### 10.3 Flat area`, `### 10.5 Flat tori`). MathematicalBilliards is the last line of the merge order, earlier than this roadmap. It is named only in the scope paragraph, not as a supplier.

**`Suggested.lean`.** None exists at the design stage. I ran no Lean command and no `#check` comparison.

**Ownership.** No new object was introduced. The flat torus stays owned here, and the scope paragraph now names its neighbouring form in MathematicalBilliards §10.5.

## For the maintainer

- No name that another roadmap cites has changed. The plan names `FlatPositionSpace.euclidean`, `HardSphere.pairMap` and `HardSphere.measurePreserving_stepMap` are unchanged.
- No other roadmap is affected. MathematicalBilliards is cited for one comparison in the scope paragraph and is not consumed.
