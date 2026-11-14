# Repair report: FIX-DESIGN-CohomologyOfGroups~5

Files changed:

- `packages/CohomologyOfGroups/design/README.md`
- `packages/CohomologyOfGroups/design/plan.json`

`packages/CohomologyOfGroups/sources.toml` is unchanged: no new work is cited.

There is one review (`REV-DESIGN-CohomologyOfGroups~4`) with one finding, P2. It was checked
against the supplier's text on main (AlgebraicTopology §5.3) and recomputed by hand before any
edit. The design stage has no `Suggested.lean`. So no Lean declaration was added, changed or
elaborated, and the `#check @name` binder audit does not apply. The review's "For the human
reviewers" section raises no finding and changed nothing.

## F01 (P2) — applied

Changed: the first Check of 3.3 ("the singular chains of a finite regular cover … the abutment is
the homology of the base through §5.3") → a surjective finite regular cover `p : E → B` with `M` of
trivial `G`-action, `(C ⊗ M)_G = C_*(E; M)_G ≅ C_*(B; M)` through `p_*`, "§5.3 compares constant
coefficients only". Added the sign-module double-cover negative control. Plan: `free_cover`
restated; new test `free_cover_sign`.

Verification:

- **The supplier's scope.** AlgebraicTopology §5.3 on main (`TauCetiRoadmap/AlgebraicTopology/README.md`
  lines 1968–1979) identifies `C_*(E; M)_G` with `C_*(B; M)` "for constant R-module coefficients
  M", with the square `q_E ≫ φ = p_*`, and builds Cartan–Leray with
  `E²_(p,q) = H_p(G; H_q(E; M)) ⇒ H_(p+q)(B; M)`, again for constant `M`. It requires surjective
  `p` and a deck action simply transitive on every fibre. Nothing there treats a deck group acting
  on `M`. The old Check applied it to an arbitrary `M : Rep k G`. The finding is right.
- **Why the corrected Check holds.** `G` acts freely on singular simplices of `E`: if
  `(deck g) ∘ σ = σ` then `g` fixes the points of the nonempty image of `σ`, so `g = 1`. Hence
  `C_*(E; k)` is free over `k[G]` and 3.3 applies. For trivial `M`,
  `C_*(E; k) ⊗_k M = C_*(E; M)` with the deck action, so `(C ⊗ M)_G` is §5.3's quotient
  complex. 3.3's second page `H_p(G, H_q(C ⊗ M))` is then §5.3's `H_p(G; H_q(E; M))`.
- **The witness, recomputed.** Take `E = ℝ/2ℤ`, `B = ℝ/ℤ`, `t(x) = x + 1`, `k = ℤ` and
  `M = ℤ_sgn`.
  - **Cellular model.** The basis is `v = 0`, `e = [0, 1]`, with `∂e = 1 − 0 = (t − 1)v`.
    Under `g ⊗ m ↦ g⁻¹m`, `(t − 1) ⊗ m ↦ t⁻¹m − m = −2m`. So `(C ⊗ M)_G = (ℤ →(−2) ℤ)`,
    with `H₀ = ℤ/2` and `H₁ = 0`. The base has `(ℤ, ℤ)`. For trivial `M` the differential is
    `0` and both sides are `(ℤ, ℤ)`.
  - **Singular chains, without a cellular–singular comparison.** I did not use AlgebraicTopology
    §4.3 for this, because it compares cellular and singular chains only up to specified chain
    homotopies, not as an equivariant quasi-isomorphism. Instead:
    - `1 ↦ t − 1` embeds `ℤ_sgn` in `ℤG`, since `t(t − 1) = −(t − 1)`. This gives
      `0 → ℤ_sgn → ℤG → ℤ → 0`.
    - Singular chains are free abelian, so 3.1's coefficient sequence applies.
    - `(C ⊗ ℤG)_G ≅ C` by `c ⊗ g ↦ g⁻¹c`. The induced map to `(C ⊗ ℤ)_G ≅ C_*(B)` is
      `q_E ≫ φ = p_*`.
    - The exact sequence reads `0 = H₂(B) → H₁(sgn) → H₁(E) = ℤ →(×2) ℤ = H₁(B) → H₀(sgn) →
      H₀(E) →(≅) H₀(B) → 0`, so `H₁ = 0` and `H₀ = ℤ/2`.
    - For `n ≥ 2`, `Hₙ(sgn)` lies between `Hₙ₊₁(B) = 0` and `Hₙ(E) = 0`, so it is `0`.
    - This agrees with the cellular model.
- **Mod-2 control.** Over `k = 𝔽₂` the sign module is trivial. Then `−2 = 0` and both sides are
  `(𝔽₂, 𝔽₂)`, which is consistent with the hypothesis.

Pattern repaired elsewhere (every mention of §5.3 or Cartan–Leray, in both files):

- **Scope and ownership.** README "AlgebraicTopology owns …" now says "the Cartan–Leray spectral
  sequence of a finite regular cover with constant coefficients (§5.3)".
- **Supplier contract.** The "From TauCetiRoadmap.AlgebraicTopology" §5.3 bullet now names the
  surjective finite regular cover `p : E → B`, the constant-coefficient quotient-chain
  identification through `p_*`, and the Cartan–Leray sequence. It says that nothing is assumed of
  coefficients with a nontrivial deck action.
- **Plan supplier entry.** The plan's AlgebraicTopology `what` is restated the same way.
- **Left unchanged, both correct as they stand:**
  - 3.3's own sentence "the algebraic form of the Cartan–Leray spectral sequence" (HS53 Ch. I §5
    Prop. 5). The algebraic theorem holds for every representation, as the review says.
  - The 3.2 rotation Check. It uses trivial `ℤ` coefficients: `ℤ →0 ℤ` gives the quotient
    circle.

## Checks run

- **Dependency check** (command of the brief):

  ```text
  candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after IntegralIwasawaTheoryPartII (the intake inserts it when its design is accepted)
  depcheck: 240 roadmaps, 2173 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line. The design-stage placement is expected.
- **Citations** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name
  found nowhere. The tool notes that names outside TauCetiRoadmap were not checked on this host.
  The edit adds no Lean name.
- **plan.json.** It parses. It has 41 targets and 136 tests: 135 before, plus
  `free_cover_sign`.
- **Lean.** There is no `Suggested.lean` at the design stage. Nothing was elaborated and there was
  no `#check` audit.
- **Ownership.** No new construction is stated. The repair narrows a Check to what the supplier on
  main owns, so ownership against open pull requests is unaffected. The overlap file lists no
  dropped id and no second copy.
- **Sources.** No source was fetched and none is newly cited. `needs-references.toml` was not
  written.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| 3.3 cover Check (trivial `M`) | `G = 1` (homeomorphism `E ≅ B`) | `(C ⊗ M)_1 = C_*(E; M) ≅ C_*(B; M)`; `E²_{0,q} = H_q(E; M)`, `E²_{p>0,q} = 0` | holds |
| same | `E = B = ∅` (surjective, vacuous fibres) | `C = 0`, which is free on the empty basis; both sides `0` | holds; surjectivity kept as §5.3 states it |
| same | `M = 0` | both sides `0` in every degree | holds |
| same | double cover `ℝ/2ℤ → ℝ/ℤ`, `M = ℤ` trivial | quotient differential `0`: `(H₀, H₁) = (ℤ, ℤ)`; base `(ℤ, ℤ)` | holds |
| freeness claim | deck `g ≠ 1` fixing a simplex `σ` | `g·σ(x) = σ(x)` for `x ∈ Δⁿ` contradicts a free fibre action | `C_*(E; k)` free over `k[G]` |
| negative control, cellular | `M = ℤ_sgn`, `∂e = (t − 1)v` | `t⁻¹m − m = −2m`: `(ℤ/2, 0)` against base `(ℤ, ℤ)` | comparison fails without the hypothesis; added as Check |
| negative control, singular | `0 → ℤ_sgn → ℤG → ℤ → 0`; `p_*` on `H₁` is `×2`, on `H₀` is `id` | `H₁(sgn) = ker 2 = 0`, `H₀(sgn) = coker 2 = ℤ/2`, `Hₙ(sgn) = 0` for `n ≥ 2` | agrees with cellular model |
| inclusion `ℤ_sgn → ℤG` | `1 ↦ t − 1` | `t(t − 1) = 1 − t = −(t − 1)` | equivariant for the sign action |
| `(ℤG ⊗ M)_G ≅ M` | `g ⊗ m ↦ g⁻¹m` | `h·(g ⊗ m) = hg ⊗ hm ↦ g⁻¹m` | well defined |
| mod-2 coefficients | `k = 𝔽₂`, sign module `≡` trivial | `−2 = 0`: `(𝔽₂, 𝔽₂)` on both sides | consistent with the trivial-action hypothesis |
| supplier contract bullet | §5.3 text lines 1961–1979 on main | surjective `p`, simply transitive deck action, finite `G`, constant `M`, `q_E ≫ φ = p_*`, `E² = H_p(G; H_q(E; M))` | bullet matches, nothing more claimed |

## For the maintainer

- No name that another roadmap cites changed. The edit touches only one Check of 3.3, its plan
  test, and the AlgebraicTopology wording in the scope, supplier contract and plan supplier
  entry.
- A roadmap that later owns local-coefficient homology of covers could add the general comparison:
  `(C_*(E; k) ⊗ M)_G` is the homology of `B` with the local system defined by `M`. This roadmap
  does not claim it, and the Check now says so.
