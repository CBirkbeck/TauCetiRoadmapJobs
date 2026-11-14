# FIX-DESIGN-FinitenessAndDualityOfGroups~7

The review `REV-DESIGN-FinitenessAndDualityOfGroups~6` lists five findings, F01–F05, all P3. Its text calls the repairs R01–R05; they are the same items and are settled here. The `## For the human reviewers` section lists no finding, so nothing was changed because of it.

## F01 (P3) — applied

Verified: over `R = 0` every group is a Poincaré duality group of every dimension (6.1 and 6.4 Checks), so the trivial group is one of dimension `2` and `F₂` one of dimension `1`. Both 6.6 negative controls were therefore false as written.

Old → new (README 6.6 Checks, plan.json `6.6/sphere` and `6.6/doubled_point_circle`):
- `S²`: "is a Poincaré duality group of dimension `0`, not `2`" → "over every nonzero `R` … dimension `0`, not `2`: in dimension `2` the duality map `H⁰(1, R) = R → H₂(1, R) = 0` is not bijective. Over the zero ring it is one of every dimension (6.4)."
- doubled-point circle: "`F₂` is not …" → "over `ℤ` (indeed over every nonzero `R`, 6.4) `F₂` is not …; over the zero ring it is one (6.4)."

Same pattern elsewhere: I grepped the README for negative claims ("is not a", "not of type", "fails", "is not free", "not a duality", "not a Poincaré"). Every other hit already carries "over `ℤ`", "`R ≠ 0`" or "over a field": the 1.2, 1.3, 1.4, 1.6, 1.7 and 2.7 Checks, the Layer 1 Examples, 6.2 ("Over a field … not a Poincaré duality group"), 6.3 (`ℤ ∗ ℤ²` and finite groups over `ℤ`), 6.5(b) and 7.3/7.4.

## F02 (P3) — applied

Verified: for `S₃` over `ℤ`, `hd_ℤ(ℤ/2) = hd_ℤ(ℤ/3) = ⊤ = hd_ℤ S₃`, and over `ℚ` everything is `0`. So 2.5(a)'s formula holds for this non-directed family, and the old plan test did not test 2.5.

Old → new: plan.json test `2.5/S3` ("`S₃` … the colimit identification fails") → `2.5/Z2_cyclic_subgroups`: "`ℤ²` is the union of its cyclic subgroups, a family that is not directed (`⟨(1,0)⟩` and `⟨(0,1)⟩` have no cyclic upper bound), each of `hd_ℤ ≤ 1`, while `hd_ℤ ℤ² = 2`". This now matches the README's third 2.5 Check, which is unchanged.

## F03 (P3) — applied

Verified against BieriEckmann1973 §1.5, lines 238–253 (the extended action on a cochain is `x⁻¹ f(xp) x`), and the remark after Theorem 3.5, lines 474–477. In left-module form this is `(g·f)(p) = g f(g⁻¹p) g⁻¹`. For `g ∈ N`, `N`-linearity gives `f(p) g⁻¹`, which is the Conventions action.

Old → new (README 6.5(c), plan.json 6.5 statement and locator): "`D_G ≅ D_{G⧸N} ⊗_R D_N` with `G` acting diagonally" → "… as representations of `G`: diagonally on the tensor product, through `G ⧸ N` on `D_{G⧸N}`, and on `D_N = Hⁿ(N, RN)` by conjugation on `N` and on the coefficients, `(g·f)(p) = g f(g⁻¹p) g⁻¹`; for `g ∈ N`, right multiplication by `g⁻¹`".

The Klein-bottle Check (README and plan `6.5/klein_extension`) now shows the computation and the wrong model it excludes. I wrote the action as a cochain formula rather than the reviewer's longer "pair" sentence; the two agree (see the table below).

## F04 (P3) — applied

Verified: Brown1974 lines 1315–1318 state the refinement for `ℤ` localized at any prime ideal, not for `ℤ_p`.

Old → new (README 7.4, plan.json 7.4, sources.toml Brown1974 locator):
- The statement gains the form `ℤ_(p) ⊗ P ≅ (ℤ_(p) G)^m`, defined with `Localization.AtPrime`.
- The text now says the source states this form (at the zero ideal it is 7.3(b)), and that the `ℤ_p` and `𝔽_p` forms follow from it by base change.
- Route for the `ℤ_(p)` form: lift the mod-`p` isomorphism. The cokernel and the kernel (a direct summand) are finitely generated over `ℤ_(p)` and vanish modulo `p`, so Nakayama over `ℤ_(p)` kills both.
- Checks extended to the new form.

I used Nakayama over the commutative local ring `ℤ_(p)` instead of the reviewer's Jacobson radical of `ℤ_(p)[G]`. Mathlib's lemma `Submodule.eq_bot_of_le_smul_of_le_jacobson` is stated only over commutative rings, so this route uses the pinned lemma directly. A new "From Mathlib" bullet records `Localization.AtPrime` (AtPrime/Basic.lean line 55), `Localization.AtPrime.isLocalRing` (line 105) and that lemma (Nakayama.lean line 117, `[CommRing R]` at line 50); 7.5's Nakayama step uses the same bullet.

## F05 (P3) — applied

Verified: `packages/MotivicStructuresInModuliOfCurves/README.md` line 337 is "### 2.1 The virtual cohomological dimension". Its *Needs:* list names MappingClassGroupsAndCanonicalRepresentations §C.0, StableReductionPartII and MC.0, and does not name this roadmap. `TC.1` exists only in that package's design README.

Old → new (README Downstream consumers, plan.json `consumers`): "MotivicStructuresInModuliOfCurves (TC.1 …) consumes 4.1 … and 4.3" → "MotivicStructuresInModuliOfCurves §2.1 (rational vanishing above the virtual cohomological dimension of mapping class groups) is an instance of 4.1 … and 4.3 … and can cite them". That package is at merge-order line 349, after CohomologyOfGroups (line 318), where this roadmap will be placed, so the direction is correct.

Same pattern elsewhere: the PosetHomotopyAndSubgroupComplexes line had the same defect. That roadmap (open pull request, README "Out of scope" paragraph) puts Brown's theorem on the `p`-fractional part of `χ` out of its scope and names no consuming edge. The line said it "consumes Layers 4 and 8". It now says that roadmap places the theorem outside its scope and that the invariants the theorem concerns are `vcd` (4.1) and `χ` (8.4) here; plan.json was changed to match. The ArithmeticKTheory, BianchiModularForms, FuchsianOrbifolds and MappingClassGroupsAndCanonicalRepresentations line claims instances, not edges, and is unchanged.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 6.6 Check, `S²` | `R = ℤ`, `𝔽₂`, `0` | `ℤ`, `𝔽₂`: `H⁰(1, R) = R → H₂(1, R) = 0`, not bijective, so not PD₂; dimension 0: `D = R`, `e = 1`, duality map the identity. `R = 0`: all groups `0`, PD of every dimension | qualifier needed and added |
| 6.6 Check, `F₂` | `R = ℤ`, `𝔽₂`, `0` | `ℤ`: `H¹ = ℤ²` vs `H₀(F₂, ℤ_w) ∈ {ℤ, ℤ/2}`. `𝔽₂`: `𝔽₂²` vs `𝔽₂` (`w = 1`, since `𝔽₂ˣ = 1`). In general `R²` is never a quotient of `R` for `R ≠ 0` (tensor with a residue field: `k² ↠` a space of dimension ≤ 1). `R = 0`: PD₁ | qualifier needed and added |
| 2.5 plan test | `ℤ²` with cyclic subgroups; `S₃` | `sup hd_ℤ⟨v⟩ = max(0, 1) = 1 < 2 = hd_ℤ ℤ²` (`H₂(ℤ², ℤ) = ℤ`); `⟨(1,0)⟩, ⟨(0,1)⟩` have no cyclic upper bound. `S₃`/`ℤ`: `sup = ⊤ = hd`; `S₃`/`ℚ`: `0 = 0` | `ℤ²` refutes the non-directed case, `S₃` does not |
| 6.5(c) action is an action and lands in cochains | general `g, h ∈ G`, `y ∈ N` | `(g·f)(yp) = g f(g⁻¹yg·g⁻¹p) g⁻¹ = y (g·f)(p)`; `(gh)·f = g·(h·f)`; commutes with `d` because `d` is `G`-linear | well defined |
| 6.5(c), `g ∈ N` | `g = x ∈ N` | `x f(x⁻¹p) x⁻¹ = x x⁻¹ f(p) x⁻¹ = f(p) x⁻¹`: the Conventions action (right multiplication by `x⁻¹`) | agrees |
| 6.5(c) Klein | `K = ⟨a, t⟩`, `N = ⟨a⟩` | `t⁻¹at = a⁻¹`; `(t·d)(a) = t d(a⁻¹) t⁻¹ = −t a⁻¹ t⁻¹ = −a`, augmentation `−1`; `a`: `a⁻¹ ↦ 1`; `w(t) = −1`, `w(a) = 1`; `H²(K, ℤ) = H₀(K, ℤ_w) = ℤ/2` (trivial-`t` model: `ℤ`) | agrees with 6.4 |
| 6.5(c) abelian / degenerate | `ℤⁿ⁺¹`; `F₂ × ℤ`; `N = G`; `N = 1`; `S₃ ⊳ C₃` over `ℚ` | `ℤⁿ⁺¹`: conjugation trivial, `D = R`. `F₂ × ℤ`: central `s` acts trivially, `D = D_{F₂}` (Künneth). `N = G`: `D_{G⧸N} = R`, `D_G = D_N` with the Conventions action. `N = 1`: `D_N = R`. `S₃`: `D_N = ℚ·Σ_{C₃}`, `gΣg⁻¹ = Σ`, `D = ℚ` trivial, `= (ℚS₃)^{S₃}` | consistent |
| 7.4 `ℤ_(p)` form | `P = ℤG`; `G = 1`, `P = ℤ^m`; `P = 0`; `G = ℤ/2`, `p = 2` | `m = 1`; `ℤ_(p)^m`; `m = 0`, zero modules; `ℤ_(2)[ℤ/2]` free of rank 1 | holds |
| 7.4 negative control | trivial `ℤ` over `ℤ/p` | `ℤ_(p)`, `ℤ_p` of rank `1 < p`, `𝔽_p` of dimension `1 < p`: none free | projectivity needed |
| 7.4 Nakayama route | lift `φ: (ℤ_(p)G)^m → P' = ℤ_(p) ⊗ P` | `coker φ` is a quotient of `P'`, finitely generated over `ℤ_(p)` (`G` finite), and `coker φ / p = coker(φ mod p) = 0`; `P'` projective gives `F ≅ P' ⊕ K`, so `F/p ≅ P'/p ⊕ K/p` and `K/p = 0`; Nakayama with `I = (p) = 𝔪 ≤ jacobson` gives `0` | valid |
| 7.4 locator | Brown1974 lines 1315–1318 | "localization of ℤ at any prime ideal"; at `(0)` it is `ℚ`, i.e. 7.3(b) | matches |
| Mathlib bullet | pin | `Localization.AtPrime` line 55 (`[P.IsPrime]`), `AtPrime.isLocalRing` line 105, `eq_bot_of_le_smul_of_le_jacobson` line 117 (`N.FG`, `N ≤ I • N`, `I ≤ Ring.jacobson R`, `[CommRing R]` line 50); the `…_jacobson_bot` variant is deprecated at the pin and not used | resolves |
| Downstream §2.1 | package README | line 337 heading; *Needs:* line has no edge to this roadmap; merge order 349 > 318 | resolves |

## Checks

**Dependency check** (command of the brief):

```text
candidate: FinitenessAndDualityOfGroups is not in the merge order yet; checked as if placed after CohomologyOfGroups (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2201 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

**Citation resolver** (`roadmaps resolve` on the edited README) lists five leads, none of them a defect:
- `CohomologyOfGroups §4.6`: a board package with an accepted design, merge order line 318.
- `BieriEckmann1974, §3.3`, `BrownGTM87, §VIII.6` and the new `BieriEckmann1973 §1.5`: source locators, not roadmaps.
- The new `MotivicStructuresInModuliOfCurves §2.1`: a board package, resolved at its README line 337.

No Lean name is unresolved. I checked the three new Mathlib names by hand at the pin (table above).

**Lean:** this is the design stage and there is no `Suggested.lean`, so no `#check @name` binder comparison was run and no Lean name changed.

**Ownership:** `roadmaps grep` for Swan's theorem on main and the open heads found no owner of the localized form for finite group rings. Tau Ceti has the `ℤ_p` form (`TauCeti/NumberTheory/Padics/GroupAlgebra/Swan.lean`) and reduction modulo `p` for `ℤ_p[G]` only, nothing over `ℤ_(p)`. The `G`-action on `D_N` is part of this roadmap's 6.5(c).

**Sources:** no new source was fetched and `needs-references.toml` was not written. In `sources.toml`, the BieriEckmann1973 locator gains "Proposition 1.8 and §1.5", and the Brown1974 locator gains the refinement at lines 1311–1320.

## For the maintainer

- No id of this roadmap changed. No section, target or Lean name was renamed, and no supplier edge was added or removed.
- The one test rename is in plan.json only: `2.5/S3` → `2.5/Z2_cyclic_subgroups`.
- The Downstream consumers section now asserts no edge that MotivicStructuresInModuliOfCurves or PosetHomotopyAndSubgroupComplexes lacks; neither roadmap needs to change.
