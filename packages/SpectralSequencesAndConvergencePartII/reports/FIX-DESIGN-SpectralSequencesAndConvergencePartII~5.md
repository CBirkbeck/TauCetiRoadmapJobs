# FIX-DESIGN-SpectralSequencesAndConvergencePartII~5: repair report

Files changed:

- `packages/SpectralSequencesAndConvergencePartII/design/README.md`:
  - §4.1: the explanation at the end of the negative-control Check is relabelled.
  - §5.3: the one-column Check is rewritten and one negative-control Check is added.
- `packages/SpectralSequencesAndConvergencePartII/design/plan.json`:
  - target 4.1, test `degree_zero_needs_right_exactness`: its explanation is relabelled.
  - target 5.3, test `one_column`: rewritten.
  - target 5.3: new test `pairing_not_algebra` (kind `non-example`). The plan now has 89 tests.

`sources.toml` is unchanged because no new work is cited. No target, layer, hypothesis or Lean name was added,
renamed or removed. The definition of a pairing of double complexes keeps its generality.

## REV-DESIGN-SpectralSequencesAndConvergencePartII~4/F01 (P2) — applied

Confirmed. Old (README §5.3, plan `one_column`): "A double complex concentrated in column `0` with its pairing
is a differential graded algebra, and `′E₁ = H` with its product." New: a differential graded algebra `A` in
column `0`, with its associative unital multiplication as the self-pairing, gives `Tot(K) = A` and `′E₁ = H(A)` as
algebras. The `ℤ[ε]/(ε²)` value is included. The rank-two non-associative self-pairing is added as a negative
control, in both files.

### Evidence

- The definition (README §5.3, opening paragraph) asks only for bilinear maps `K^{p,q} × L^{p′,q′} → M^{p+p′,q+q′}`
  that induce a chain map of sum totals. It imposes no associativity and no unit, and `K`, `L`, `M` need not
  coincide. "Its pairing" in a one-column Check can only mean a self-pairing `K × K → K`, and nothing makes that
  pairing associative or unital.
- Witness, recomputed:
  - Take `K^{0,0} = ℤe ⊕ ℤf`, all other terms `0`, with `e·e = f`, `f·e = e`, `e·f = f·f = 0`, extended
    bilinearly.
  - `d₁ = d₂ = 0`, so both rules of §5.3 read `0 = 0`. This is a pairing.
  - `(ee)e = fe = e`, but `e(ee) = ef = 0`, so the product is not associative.
  - For `u = ae + bf`: `eu = a·f + b·0 = af`, which is never `e`, so there is no right unit. `ue = af + be = e`
    forces `a = 0` and `b = 1`, so `u = f`; then `uf = ff = 0 ≠ f`, so there is no left unit.
- Correct form, verified:
  - Put `K^{0,q} = A^q`, `d₂ = d_A` and `d₁ = 0`; column `1` is zero.
  - The horizontal rule is `0 = 0`. The vertical rule at `p′ = 0` reads `d₂(xy) = d₂(x)y + (−1)^q x d₂(y)` for
    `x ∈ A^q`, which is the Leibniz rule of `A`.
  - The total differential on column `0` is `d₁ + (−1)^0 d₂ = d_A` (Conventions), so `Tot(K) = A`.
  - The column filtration has one graded piece, so `′E₁ = H_II(K) = H(A)` in column `0` with the induced
    product, and `d_r = 0` for `r ≥ 1`.
  - For `A = ℤ[ε]/(ε²)`, `|ε| = 1`, `d = 0`: `(1·ε)·1 = ε = 1·(ε·1)`, and `′E₁ = A = H(A)`.
- Pattern search: I looked at every other place where a pairing is said to give an algebra or a product on
  `H(A)`. None needs a change:
  - §5.2 Checks: `𝔽₂[x, y]/(x²)` and the trivial filtration of a DGA. The input is a DGA.
  - §5.3 bullet "`Tot(A ⊠ B) = A ⊗ B` as differential graded algebras": `A` and `B` are DGAs, and the Koszul-signed
    product is associative and unital.
  - §6.2 *Multiplicativity*: `M` is a differential graded `A`-algebra.
  - plan.json: the `5.2` trivial-filtration test, the `5.3` "tensor of DGAs" API item, and
    `CochainComplex.bocksteinSpectralSequence_multiplicative`.

  In each of these the input already is an algebra.

## REV-DESIGN-SpectralSequencesAndConvergencePartII~4/F02 (P3) — applied

Confirmed. Old: "`X ⋆ −` is not right exact: `R → X` induces the zero map `soc(R) = k·xy → soc(X)`". New:
"`− ⋆ k` is not right exact: applied to `R ↠ X` it gives the zero map `soc(R) = k·xy → soc(X) = k·x ⊕ k·y`".
The new text also gives a correct witness for `X ⋆ −`: it sends `R ↠ k` to the zero map `X ≅ X ⋆ R → soc(X)`,
which is induced by `xy`. The same change is made in plan `degree_zero_needs_right_exactness`.

### Evidence

- `U ⋆ k = D(DU ⊗_R k) = D(DU/𝔪DU)` is the set of `u ∈ U` with `𝔪u = 0`. This is `soc(U)`, naturally in `U`. So
  `soc(R) → soc(X)` is `− ⋆ k` applied to `R ↠ X`, not `X ⋆ −` applied to anything.
- `X ⋆ R ≅ X ⋆ DR = D(DX ⊗_R R) = X` has dimension 3, as the reviewer says. The displayed map is the restriction
  of `R ↠ X` to socles. It sends `xy ↦ 0`, so it has rank 0 into a 2-dimensional target and is not surjective.
- The `X ⋆ −` witness I added:
  - The dual of `R ↠ k` is `Dk → DR`. Its image is the functional "constant term". Under the `xy`-coefficient
    isomorphism `R ≅ DR`, that functional corresponds to `xy`, because `coeff_xy(xy·b)` is the constant term of
    `b`.
  - So `DX ⊗_R Dk → DX ⊗_R DR = DX` is `m ↦ xy·m`.
  - `(xy·φ)(u) = φ(xy·u) = 0`, because `xy` kills `X = R/(xy)`. So the map is zero.
  - Dualising gives the zero map `X → soc(X) ≠ 0`, so `X ⋆ −` is not right exact either.
- Consistency with the Check's own computation. `Tor_0(X, k)` (resolving `k`) and `Tor'_0(X, k)` (resolving `X`)
  both equal `k`, but `X ⋆ k = k²`. By `Functor.leftDerivedZeroIsoSelf`, each partial functor must therefore fail
  to preserve finite colimits, and the two witnesses above show both failures.
- Pattern search:
  - This is the only socle witness in the roadmap. Its plan.json copy is repaired.
  - The supplier contract (README §"Exact supplier contracts", the line for `leftDerivedZeroIsoSelf`) and §2.6
    (`L_0F(A) ≅ F(A)` for right exact `F`) name no partial functor of `⋆`, so they need no change.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| §5.3 new Check: a DGA in column 0 is a self-pairing with `′E₁ = H(A)` | `A = ℤ[ε]/(ε²)`, `d = 0`; `A = 0`; control `A = ℤ·1 ⊕ ℤ·t` (`|t| = 1`, `t² = 0`, unit `1`) with `d(1) = 2t` | First: both associations of `(1, ε, 1)` are `ε`, and `′E₁ = A = H(A)`. Zero: all groups 0, both rules `0 = 0`. Control: `d(1·1) = 2t`, but `d(1)·1 + 1·d(1) = 4t`, so the vertical rule fails. | Holds for DGAs. In a unital DGA, `d(1) = 2d(1)` forces `d(1) = 0`; the rule excludes the control, which is neither a DGA nor a pairing. |
| §5.3 vertical rule at `p = p′ = 0` equals the DGA Leibniz rule | `x ∈ A^q`, `y ∈ A^{q′}`; `q` odd and even | Rule `d₂(xy) = (−1)^{p′} d₂(x)y + (−1)^q x d₂(y)` with `p′ = 0` gives `d(x)y + (−1)^q x d(y)`, the Koszul sign of `|x| = q`. | Agrees. |
| `Tot(K) = A` for one column | Conventions' total differential `d₁ + (−1)^p d₂` at `p = 0` | Sign `+1`, horizontal part 0: total differential is `d_A`. | Agrees; no sign twist. |
| §5.3 new negative control | `e² = f`, `fe = e`, `ef = f² = 0` | `(ee)e = e`, `e(ee) = 0`; right unit impossible (`eu = af`); left unit forces `u = f`, `ff = 0 ≠ f`. `′E₁ = K` since all differentials vanish. | A pairing is not an algebra; the general definition is kept unchanged. |
| §5.3 unchanged Checks recomputed against the new ones | Vertical-sign Check with `p′ = 0` | `(−1)^{qp′} = 1 = (−1)^{p′}`, so `d₂(xy) = d₂(x)y`, matching the one-column rule at `x = 1 ⊗ b`. | Consistent. |
| §4.1 relabelled witness `− ⋆ k` on `R ↠ X` | `X = R/(xy)`; also `R ↠ R` (identity) and `R ↠ k` | `soc(R) = k·xy → soc(X) = ⟨x, y⟩` is 0 (dims `1 → 2`). Identity: `soc R → soc R` identity. `R ↠ k`: `soc(R) → soc(k) = k` sends `xy ↦ 0`, zero onto `k`, again not surjective. | `− ⋆ k` fails right exactness; the label is now correct. |
| §4.1 added witness `X ⋆ −` on `R ↠ k` | `X = R/(xy)`; control `X = R` | For `X = R/(xy)`: the map is multiplication by `xy` on `DX`, which is 0. For `X = R`: the map is `R → soc R`, `r ↦ xy·r`, which sends `1 ↦ xy` and is surjective, consistent with `R ⋆ − ≅ id` being exact. | The witness separates `X = R/(xy)` from the exact case `X = R`. |
| §4.1 theorem (unchanged) | Same `⋆` | `Tor_0 = Tor'_0 = k` | Balance unaffected. |

## Checks run

- Dependency check, with the exact command of the brief:

  ```text
  candidate: SpectralSequencesAndConvergencePartII is not in the merge order yet; checked as if placed after ArithmeticGaloisDuality (the intake inserts it when its design is accepted)
  depcheck: 240 roadmaps, 2177 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line. Absence from the merge order is expected at the design stage.
- `plan.json` parses as JSON after the edit, and has 89 tests.
- `Suggested.lean`: none at the design stage. No Lean declaration was added or changed, so there was nothing to
  elaborate and no `#check @name` comparison to make.
- Ownership against open pull requests: nothing new was introduced. Both repairs edit Checks of objects this
  roadmap already owns (§4.1, §5.3), so no new search was needed.

## For the maintainer

- No name that another roadmap cites changed. No supplier, `*Needs:*` line or citation changed.
- No text was fetched, and nothing suspicious was found in the review.
