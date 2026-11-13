# Repair of LubinTateFormalModulesAndQuasiCanonicalLifts

The review held five findings: F01–F03 at P2, F04–F05 at P3. I checked each one against the
README, the supplier FiniteFlatGroupsAndIntegralPadicHodgeTheory at its open head, the pinned Tau
Ceti point carriers and H70. All five are correct, and all five are repaired in
`packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md`. `Suggested.lean`,
`metadata.toml`, `sources.toml` and `design/plan.json` are unchanged: no headline statement,
source or supplier gap is affected.

## F01 (P2) — applied

§0.2: the claim "`F(I)` (equivalently `FormalLieGroup.Points` …)" becomes a comparison with stated
hypotheses. `F` is defined over a complete noetherian local `Λ`, and `R` carries the `I`-adic
topology. Under these, `F(I)` is the subgroup of the supplier's points (coordinates in `rad I`) with
coordinate in `I`, and the two carriers are equal exactly when `I` is radical. New API bullet. New
Check: `9ℤ₃` against `3ℤ₃`. The supplier contract now states `J.radical` and the hypotheses.

Evidence: FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.12 (README at its open head, lines
1193–1197) defines `FormalLieGroup.Points F S J` as the tuples in `J.radical`. The native carrier
`FormalGroup.TopNilpotentPoint` (`TauCeti/RingTheory/FormalGroup/TopNilpotentPoint/Basic.lean`)
uses the coordinate itself. Pattern repaired in two more places. The Weierstrass API bullet now
carries `WeierstrassCurve.FormalGroupPoint`'s `IsAdic I` hypothesis
(`…/EllipticCurve/FormalGroup/AdicPoint.lean`); both of those carriers use `I` itself. The §0.2
*Needs* line now names `FormalLieGroup.evalPoints` and `FormalLieGroup.ofFormalGroup` for the
comparison. The deep ideals `𝔪_L^r` of §0.3 are not radical, and the README now says that only the
native subgroup is used for them.

## F02 (P2) — applied

§4.1: "let `q` be a power of `p`" → "`q = p^r` with `r ≥ 1`". "Only finitely many terms contribute"
→ an explicit argument: the `i`-th term has order at least `q^i`, so only terms with `q^i ≤ n`
contribute (H70 §2, p.221). The API bullet now carries `q ≥ 2`. §4.2 now reads "Under (F) with
`q = p^r`, `r ≥ 1`". New Check: the `q = 1` example diverges; the `q = 2` example gives
`2X + X² + X⁴ + ⋯`.

Evidence: H70 line 309 states (F) with "a power q of p". Its well-definedness remark (H70 line 329,
printed p.221) silently needs `q^v → ∞`. With `q = 1` and `σ = id`, (F) holds and the operator
diverges, exactly as the reviewer says. The only other `q`-uses in Layer 4 are `q = p` (F1) and
`q = p²`, both with `r ≥ 1`.

## F03 (P2) — applied

Each early section now keeps its construction, and the later consequence moves to the section that
builds the later objects:

- §5.4 keeps only `L ↦ u⁻¹L`; the class action `[L] ↦ [a⁻¹L]` and its class-level Checks move into
  §6.6's statement.
- §0.3 drops "formal traces of §9.1"; §9.1 already states `ℓ(Tr x) = Tr ℓ(x)`.
- §1.4 keeps uniqueness, cocycle, base change and point-module isomorphisms; the torsion and Tate
  identifications go to §§2.1–2.2.
- §8.5's trace signs move to §9.3.

Pattern search: I ran a scripted scan of every section for references to later sections, and read
each hit. Further real forward requirements found and repaired:

- §4.4 required §8.5's signs; it now leaves the `p`-adic generator signs to §8.5 as a pointer.
- A §5.4 Check used §7.1's degree; it is now computed from §§2.3–2.4.
- A §3.4 Check used §3.5's dimension; it is replaced by a coboundary test.
- A §3.7 Check instanced §6.1; it now uses §1.3.
- §6.4's *Needs* line wrongly listed §6.2, while §6.2 uses §6.4's `O_s`. §6.4 now needs only
  LocalFieldsRamification, and §6.2's *Needs* line names §6.4.
- §6.3 cited §6.5; it is now a pointer only.

Remaining forward pointers, all descriptive with no requirement:

- §0.2 → §0.3
- §1.4 → §3.1
- §2.3 → Layer 8
- §2.5 → §2.6 ("does not use")
- §3.2 → §3.6
- §4.2 → §7.5
- §5.4 → §6.6
- Layer 5 Examples → Layer 6

Smaller edits made along the way:

- *Needs* lines updated: §2.1 (+§1.4), §2.2 (+§1.4), §6.6 (+§6.5), §9.3 (+§0.3).
- Layer 1 Dependencies now include §0.2.
- The build paragraph now states that no section requires a later one.
- Scope: §0.3 no longer claims trace comparisons; Layer 9 now owns them.

## F04 (P3) — applied

§1.4 Check: "`a = u` a unit gives the non-strict isomorphism" → "`[u]_(f,g)` has linear coefficient
`u` and is strict exactly when `u = 1`". Worked example over `ℤ₂` with `f = g = 2X + X²`: `u = 1`
gives `X`, and `u = 3` gives `3X + 3X² + X³` (derivative 3); both composites equal `(1+X)⁶ − 1`.
Pattern search: no other "non-strict" claim covers `u = 1`; the §3.1 Check on `(1+X)^(1+p) − 1` concerns
`1 + p ≠ 1`.

## F05 (P3) — applied

§9.3 Check: "the wrong sign on the image of `w_(n+1)`" → a test on a point that actually lies over
the source. The point is `x ∈ H(𝔪_Φ) ⊂ H(𝔪_(Ψ′_2))` with `ℓ(x) = 25` at `p = 5`, `s = 0`. Both
routes give `[30]x`, of logarithm 750. With labels 1 → 0, the corrected values agree at −750,
while the uncorrected value is +750. The Check also says why `w₁` is excluded: degree 600 against
30.

Evidence: `[Φ₁ : Φ] = (p² − 1)p² = 600` and `[Ψ′_2 : Φ] = p(p + 1) = 30`. Since `w₁` generates
`Φ₁`, it is not a point over `Ψ′_2`. Pattern search: §8.5's new logarithm Check uses the same kind
of deep base point (`ℓ = p²`); no other Check uses a torsion point outside its field.

## Required checks

- **Elaboration.** `lake env lean packages/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean`,
  run from the content checkout, exited 0. Output: five `declaration uses 'sorry'` warnings at
  lines 77, 91, 113, 129 and 151, and nothing else. The three imported Tau Ceti object files
  were already built.
- **Signature audit.** I put `#check @name` for all seven declarations into one scratch copy and
  elaborated it once (exit 0). Each elaborated type matches its README statement:
  - Both predicates keep `CommRing` and `IsLocalRing`.
  - The §1.2 and §1.3 theorems keep `IsDomain`, `IsDiscreteValuationRing`, a finite residue
    field and `Irreducible π`.
  - The §2.3 and §2.5 theorems keep `IsNonarchimedeanLocalField` and `CharZero`; §2.3 also keeps
    `1 ≤ m` and the root/non-root pair.
  - The §4.4 theorem keeps primality, `s = ±1`, the unit discriminant and the point count.

  No binder was lost, and nothing changed: `Suggested.lean` was not edited.
- **Dependency check** (`gate --depcheck … --movable`):

  ```text
  depcheck: 236 roadmaps, 2138 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Citation resolver** (`roadmaps resolve`) on the new README: "Cross-roadmap citations found
  nowhere: None. Lean names found nowhere: None." The four leads the worker listed before this
  round no longer appear. The newly cited `FormalLieGroup.evalPoints` is in the supplier's
  §R07.1.12 API (README line 1197 at its head).
- **Gate failures.** None were listed for this round.

## Computed adversarial pass on new and changed statements

| Statement | Instances | Values computed | Result; change |
|---|---|---|---|
| §0.2 `F(I)` is a subgroup | `𝔾_m`, `x = y = 9 ∈ 9ℤ₃`; inverse of 9; `I = 0` | `9 + 9 + 81 = 99 = 9·11 ∈ 9ℤ₃`; `ι(9) = −9/10 ∈ 9ℤ₃`; `F(0) = {0}` | Pass. Closedness of `I` is not needed, because `F − X − Y ∈ XY·R[[X,Y]]` |
| §0.2 comparison with `FormalLieGroup.Points` | `𝔾_a/ℤ₃` with `I = 9ℤ₃` and `3ℤ₃`; `I = 𝔪_L²` in `O_L`; `R = ℤ₃[ε]/(ε²)` discrete, `I = 0` | `9ℤ₃` vs `3ℤ₃` (3 separates them); `3ℤ₃ = 3ℤ₃`; `𝔪_L² ⊊ 𝔪_L`; `{0}` vs `(ε)` | Pass. The carriers are equal exactly when `I` is radical, including the square-zero test; Check added |
| §0.2 Weierstrass bullet | `I = 𝔪_L`, and `I = 𝔪_L²` (`IsAdic` holds, since the topologies agree) | Both carriers are `I` itself in each case | Pass; `IsAdic I` added |
| §1.4 point-module isomorphism | `f = g`; `f = πX + X^q`, `g = f + πX²` | Identity map; `φ(x) = x + (1−π)⁻¹x² + ⋯ ∈ I` | Pass |
| §1.4 unit comparison | `u = 1, 3, −1` over `ℤ₂`, `f = g = 2X + X²` | Derivatives `1, 3, −1`; both composites `(1+X)⁶ − 1` for `u = 3` | Strict only at `u = 1`; F04 applied |
| §2.1 torsion identification | `f = (1+X)^p − 1` against `g = pX + X^p`, `m = 1` | `p` points on each side | Pass |
| §3.4 coboundary Check | `F = X+Y+XY` over `𝔽_p`; `c = 1, 0`; `p = 2` | `F' = X + Y + (1 − εc)XY`, computed both from `F − X∂F − Y∂F = −XY` and by direct substitution; `c = 0` gives no change | Pass; `c ≠ 0` is required |
| §4.1 operator with `q = p^r`, `r ≥ 1` | `q = 1, 2` over `ℤ₂`, `σ = id`; `ℓ = 0` | `2 + Σ1` diverges; `2X + X² + X⁴ + ⋯` with coefficients `2, 1, 1`; `u ⋆ 0 = 0` | `r ≥ 1` is needed; F02 applied |
| §5.4 actual lattice action | `a = π_F`, `L = T`; `q₀ = 2, 3`, `L = ϖ₀⁻¹O₀t + T` | Image `T`, while `#(π_F⁻¹T/T) = q_F`; index `q₀ + 1 = 3, 4`; `u²` is nontrivial in a cyclic group of order ≥ 3 | Pass; `u⁻¹L ≠ uL` |
| §5.4 descent Check | `q₀ = 2, 3` | Fixed field degree `3, 4`; division field degree `3, 8` | Degrees coincide at `q₀ = 2`; boundary note added |
| §6.6 class action | `a = π_F`, `L = T`; unramified `L₁` with `a` of order `q₀ + 1` | `[π_F⁻¹T] = [T]`, `M_T = F`; `a²L₁ ≁ L₁`, so `m_(a⁻¹L₁) ≠ m_(aL₁)` | Pass |
| §8.5 `ℓ∘j_n = (−1)^n ℓ` | `n = 0, 1, 2`, with `ℓ(x) = p²` | `p², −p², p²` | Pass |
| §9.3 sign rule `Tr∘j_n = [(−1)^(n+m)]∘j_m∘Tr` | `(n, m) = (1, 0), (0, 1), (n, n)`; `p = 5`, `s = 0`, `ℓ(x) = 25` | Both routes give `[30]x`, i.e. 750; labels (1,0) give −750 = −750 (uncorrected +750); labels (0,1) give 750 = 750 (uncorrected −750); `(n, n)` needs no correction | Pass; F05 applied |
| §6.4 *Needs* line without §6.2 | Statement content | Orders, conductor and units of `O₀ + ϖ₀^s O_F` only | Pure algebra; the cycle is removed |

## Ownership, overlaps and sources

- **Ownership.** No new construction was introduced. Every edit relocates or restricts an
  existing target of this roadmap, or compares it with the supplier carrier that is already cited.
  I read the supplier text at its open head with `roadmaps show`. Ownership against the other open
  pull requests was not re-surveyed this round, because no object changed owner.
- **Overlaps.** `scratch/overlaps.md` lists none affecting this roadmap. No section, layer or
  target id was renamed or dropped.
- **Sources.** Only cached legal texts were used: H70 lines 302–329 and BKO21 lines 225–281.
  Nothing was fetched, and `needs-references.toml` is not needed. No passage was copied.

## Notes for the maintainer

- No Lean name changed, and no other roadmap's citation of this roadmap is affected.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory is still an open new-roadmap pull request that is
  earlier in the merge order. This README depends on its §R07.1.12 names
  `FormalLieGroup.Points`, `FormalLieGroup.evalPoints` and `FormalLieGroup.ofFormalGroup`, and on
  the radical convention of `FormalLieGroup.Points`.
- No text read in this round contained instructions.
