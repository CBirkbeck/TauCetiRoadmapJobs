# FIX-RT-EllipticCurveModularityTotallyReal~1

Repair round for red-team round 1 (passes a and b). Three findings were raised. All three are
right on the mathematics. Two are applied as asked. One is applied differently, because part of
its witness and one of its suggested edits do not match how the README uses the layers. Only
`packages/EllipticCurveModularityTotallyReal/README.md` changed. `Suggested.lean`,
`metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## RT-EllipticCurveModularityTotallyReal~1a/F01 (P3) — applied

Old (§4.1, first Check): an induction from a quadratic subextension "would have reducible
restriction and several descents". New: with an irreducible restriction there are exactly
`[L:K]` descents, the twists `ρ ⊗ ψ`, pairwise non-isomorphic. The reviewer's S₃ witness
(`x³ − 4x + 1`, `L₀ = ℚ(√229)`) shows a reducible restriction with exactly one descent, and
`1 ⊕ 1` shows one with three.

Verified. Discriminant `−4(−4)³ − 27 = 229`, which is prime, positive and not a square. The cubic
has no rational root (`f(±1) = −2, 4`), so `Gal(F/ℚ) ≅ S₃` and F is totally real. A descent of
`χ ⊕ χ⁻¹` kills `G_F`, so it is a representation of S₃, and only the standard representation
restricts to `χ ⊕ χ⁻¹`.

The old claim also fails in the other direction. Take `ρ|G_L` irreducible over `ℚ̄_ℓ`. Then
`Hom_{G_L}(ρ, ρ′)` is a line on which `Gal(L/K)` acts by a character ψ, so `ρ′ ≅ ρ ⊗ ψ`. Also
`Hom_{G_K}(ρ, ρ ⊗ ψ) ≠ 0` only for `ψ = 1`. So the irreducible case already has `[L:K]` descents.
The new Check says this.

Changes to the reviewer's text: the example field is renamed `L₀` and its character `sgn`. This
avoids clashing with the roadmap's own L and δ.

Pattern search. "descents" occurs at one other place, the next Check. It says that at a quadratic
step the two descents differ by the quadratic character. That holds for an irreducible
restriction (two descents, `ρ` and `ρ ⊗ δ`, not isomorphic), so it is unchanged.

## RT-EllipticCurveModularityTotallyReal~1b/F01 (P2) — applied

Old JacobianChallenge contract: "`Pic⁰` of a smooth proper curve without a rational point …
§§1.3–1.4". New contract: `Pic⁰` of a smooth proper geometrically connected curve with a rational
point, with its Abel–Jacobi map; the point is `φ⁻¹(O, 1)` of §1.2(6); used in §§1.2–1.4. Added
§1.2 item 6, which proves `C^δ_m(L) ≠ ∅`, and one §1.2 Check.

Verified against JacobianChallenge on main.
- The end goal (README lines 22–25) assumes a k-rational point `x₀`.
- Its standing hypotheses (lines 44–46) fix one.
- Its scope section (lines 488–491) puts the pointless case out of scope for v1.
- Only the projective Picard representability bullet of Layer D drops the point.

Verified against EllipticCurveModularityImaginaryQuadratic at its open head.
- §1.1 requires `O, ±R, ±S` to be pairwise distinct.
- §1.2 normalizes `f` by `f(O) = 1`.
- §1.3 defines `C_m` as the normalization of `Y^m = f` and `w(Z, Y) = (−Z, Y⁻¹)`.

So `C_m → B_t` is étale over O (f is a unit there and m is invertible), and `(O, 1)` is a
k-rational point with `w(O, 1) = (O, 1)`. For every g, `g ⋆ (O, 1) = (O, 1)`. With
`ᵍ(φ⁻¹) = φ⁻¹ ∘ a_g`, `g(φ⁻¹(O, 1)) = φ⁻¹(g ⋆ (O, 1)) = φ⁻¹(O, 1)`.

The new Check also corrects a tempting wrong model. I computed `g ⋆ (O, ζ) = w(O, ζ⁻¹) = (O, ζ)`
for `δ(g) = −1`. So every point of the fiber over O is L-rational on the twist, although
`(O, ζ)` with `ζ ≠ 1` is not L-rational on `C_m ⊗ L`. The branch points `(S, 0)` and `(−S, ∞)`
are k-rational on `C_m`, but they form an orbit of size two on `C^δ_m`.

## RT-EllipticCurveModularityTotallyReal~1b/F02 (P3) — applied differently

Old EllipticCurves contract: Layers 0.5, 4.5a ("comparisons") and 5, "used in §§1.2, 1.6, 4.1,
4.2". New contract:
- Layers 4 and 4.5a for the reduction types of the Conventions and §4.2.
- Layer 5 for §§1.2 and 1.6.
- Layer 0.5 for `End(E_K̄)` in §4.3 and the CM contract.
- Layer 1 for that contract's route.

The Conventions cite Layer 4 through 4.5a. Needs lines were added at §4.2 and §4.3.

Why "differently":
1. **Layer 4.5a is kept, not replaced.** At main, EllipticCurves Layer 4.5a is "invariant theory
   over a Dedekind domain". It localizes Layer 4's local minimal data at every height-one prime of
   `𝒪_K`. Its semistability bullet reads the reduction at v on a local minimal model at v. That is
   exactly how the Conventions read reduction types at the finite places of a number field. So the
   Conventions now cite "Layer 4, at each finite place through the localizations of Layer 4.5a"
   rather than Layer 4 alone.
2. **Layer 0.5 goes to §4.3, not §1.2.** Layer 0.5 is about Weierstrass curves and their isogenies.
   The Galois conjugations in §1.2 act on the higher-genus covers `C_m`, and their descent is
   ModularCurves §0E. The only elliptic case there, m = 1, is the quadratic twist of Layer 5. The
   Galois action on endomorphisms is used in §4.3 (`G_K` acting on `End(E_K̄)`), so Layer 0.5 is
   cited there.
3. **One part of the witness does not hold.** README line 156 does not use Layer 4: it says that
   the comparison with the exponent from Tate's algorithm is *not* used. The rest of the witness
   holds: §4.2 items 5, 7 and 8 do use reduction types and the Tate curve.

Also stated in the Mathlib contract: the pin has `WeierstrassCurve.IsMinimal`,
`WeierstrassCurve.minimal`, `HasGoodReduction`, `HasMultiplicativeReduction`,
`HasSplitMultiplicativeReduction` and `HasAdditiveReduction`
(`Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean`, lines 275–360, namespace
`WeierstrassCurve`). Each predicate extends `IsMinimal`. They carry the reduction types of §4.2.

Pattern search. I compared every other supplier block's "Used in" list with the Needs lines:
AbelianSchemesAndArithmeticModuli (§§1.4, 2.2, 4.3), NeronModelsAndSemistableAbelianVarieties
(§§1.4, 2.2, 4.2), ModularCurves, InverseGalois, ModularCurvesPartII,
PotentialModularityAndCompatibleSystems, EtaleCohomologyFoundations, Faltings and
ShimuraVarieties. They all agree. The Layer 4 Dependencies paragraph now lists EllipticCurves
Layers 0.5, 4 and 4.5a.

## Checks run

- **Elaboration.** `lake env lean packages/EllipticCurveModularityTotallyReal/Suggested.lean`,
  run from the content checkout, gave exactly two warnings: `declaration uses 'sorry'` at 58:8 and
  80:8. There were no errors. The file is unchanged this round. No `TauCeti.*` object file was
  missing.
- **Elaborated signatures.** I put `#check @…` for both declarations in one scratch copy and
  elaborated it once. Results:
  - `realCyclotomic_isCMField` keeps `Field k`, `NumberField k`, `IsTotallyReal k`, `Field M`,
    `NumberField M`, `Algebra k M`, `2 < n`, `IsCyclotomicExtension {n} k M` and
    `IsPrimitiveRoot ζ n`. Its conclusion is `IsCMField M ∧ k⟮ζ + ζ⁻¹⟯.toSubfield = maximalRealSubfield M`.
  - `three_five_switch` keeps `NumberField K`, `DecidableEq (AlgebraicClosure K)` and
    `W.IsElliptic`, with the five-torsion equivariance and pairing clauses and the
    every-basis/every-`SL₂(𝔽₃)` clause.

  Both are identical to the earlier signatures and to README §§1.1 and 2.3. Nothing changed and
  no binder was lost.
- **Dependency check** (command from the brief):

  ```text
  depcheck: 237 roadmaps, 2157 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. All newly cited suppliers (EllipticCurves Layers
  0.5, 1, 4, 4.5a and 5, JacobianChallenge, Mathlib) are on main or pinned.
- **Citation resolver** on the edited README: no cross-roadmap citation and no Lean name was found
  missing.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §1.2(6) rational point `φ⁻¹(O, 1)` | m = 1; m = 3 with n = 3 or 3p; δ trivial (`k = ℚ(√−3)`, n = 3); δ nontrivial | m = 1: the point is the origin of `B^δ_t`. m = 3: fiber over O is `{(O,1), (O,ζ₃), (O,ζ₃²)}`, `f(O) = 1`, étale. δ trivial: e = 0, `g ⋆ x = gx`, `(O,1)` is k-rational. δ nontrivial: `w(O,1) = (−O, 1) = (O,1)`. Quotient `Y ↦ Y^{n/m}` sends `(O,1)` to `(O,1)`. | True for every `m \| n`, m ≥ 1; added |
| §1.2 Check on rational points of the twist | δ(g) = −1; ζ ∈ μ_m of odd order d ≥ 3 | `g ⋆ (S,0) = w(S,0) = (−S,∞)`: orbit of size 2, stabilizer `G_M`. `g(O,ζ) = (O,ζ⁻¹) ≠ (O,ζ)` because d is odd. `g ⋆ (O,ζ) = w(O,ζ⁻¹) = (O,ζ)`. For δ(g) = 1 both actions fix `(O,ζ)`. | Discriminates the twisted action from the untwisted one; added |
| JacobianChallenge contract | curve with no point (pointless conic, JacobianChallenge Layer D Check) versus `C^δ_m` | Pointless conic: outside JacobianChallenge v1. `C^δ_m`: has the point of §1.2(6). | Contract restated |
| §4.1 Check: irreducible case | `[L:K] = 1, 2, d` with L/K abelian | Twists `ρ ⊗ ψ`: 1, 2, d of them. `Hom_{G_K}(ρ, ρ⊗ψ) ≠ 0` iff ψ = 1, since `g·id = ψ(g)id`. | Exactly `[L:K]` descents; added |
| §4.1 Check: S₃ witness | `x³ − 4x + 1` | disc = 256 − 27 = 229, prime. `f(1) = −2`, `f(−1) = 4`. Three real roots. Restriction to `C₃`: trivial ↦ 1, sign ↦ 1, standard ↦ `χ ⊕ χ⁻¹`. | Exactly one descent; added |
| §4.1 Check: `1 ⊕ 1` over `L₀` | `Gal(L₀/ℚ) = C₂` | 2-dimensional representations of C₂: `1⊕1`, `1⊕sgn`, `sgn⊕sgn`. Twist classes: `{1⊕1, sgn⊕sgn}` and `{1⊕sgn}`. | Three descents in two twist classes; added |
| §4.1 second Check (quadratic step) | L/K quadratic, `ρ\|G_L` irreducible | Two descents `ρ` and `ρ⊗δ`, not isomorphic by the row above | Unchanged |
| EllipticCurves contract and Conventions | layer titles at main | 0.5 "base change, Galois actions, …, descent"; 1 "isogenies, …, invariant differential"; 4 "reduction, Tate's algorithm, the Tate curve"; 4.5a "invariant theory over a Dedekind domain"; 5 "twists" | Descriptions corrected |
| §4.2 Needs: Mathlib reduction predicates | pinned `Reduction.lean` | `HasGoodReduction` (line 324), `HasMultiplicativeReduction` (341), `HasAdditiveReduction` (348), `HasSplitMultiplicativeReduction` (360), `IsMinimal` (275), `minimal` (300). Each predicate extends `IsMinimal`. 11a1 at 11: v(Δ) = 1 > 0 and v(c₄) = 0, so multiplicative (split, a₁₁ = 1). | Names exist at the pin; cited |

## Ownership, sources, overlaps

- **Ownership.** No new construction or target was introduced.
  - §1.2(6) is a property of this roadmap's own reflection twist `C^δ_m`.
  - The new Checks are worked examples.
  - The parent's §§1.1–1.3 are cited by section, at the head of EllipticCurveModularityImaginaryQuadratic, read through `roadmaps show`.
  - JacobianChallenge and EllipticCurves were read on main (`7a5597a`).
- **Sources.** No new sources and no `needs-references.toml`. The S₃ example and the twist count
  are proved in the Check itself.
- **Overlaps.** The overlap list reports nothing that drops a cited id. No id of this roadmap was
  renumbered: §1.2 gains item 6 at the end, so the existing references §1.2(2), (4) and (5) are
  unchanged.

## For the maintainer

- No Lean name changed and `Suggested.lean` is untouched. The three supplier gaps in
  `design/plan.json` are unchanged and still match the README.
- Other roadmaps are not affected. The new citations, EllipticCurves Layers 0.5, 4 and 4.5a and
  JacobianChallenge Layers D–F with its rational point, are all on main.
- `design/README.md` (lines 1104–1105) still has the old "several descents" wording. This job may
  not edit that file; the package README is the roadmap. The matching test in
  `design/plan.json` is a different statement and is true: `H¹(B_t)|G_L` is irreducible because
  its residual representation is absolutely irreducible on `G_M`.
