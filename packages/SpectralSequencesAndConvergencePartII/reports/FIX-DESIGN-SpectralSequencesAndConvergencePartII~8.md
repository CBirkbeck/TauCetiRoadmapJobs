# FIX-DESIGN-SpectralSequencesAndConvergencePartII~8

One review, one finding.

## REV-DESIGN-SpectralSequencesAndConvergencePartII~7/F01 (P2) — applied

The finding is correct. Its witness is `K = (k → k ⊕ V)`, `V = ⊕_{n≥0} k`, filtered by `F^p = (0 → k ⊕ V)` for `p ≤ 0`. Here `E_∞^{0,0} = k ⊕ V`, `gr^0 H^0 = V`, `B_∞ = 0` and `Bᵗ = k`. The canonical map is the projection, with kernel `k`, but the basis shift is an abstract `β`. Stacks defines convergence through the canonical comparison: stacks-012K line 3131–3140 (Def. 24.9) and line 3144–3150 (Lemma 24.10).

What changed, old → new:
- `gap:base-induced-filtration` in the README and the plan: "weak convergence holding exactly when this presentation is an isomorphism" → the inclusion and projection are written out and stated to be natural in filtered morphisms; when both maps are isomorphisms their composite is the `β`; "convergence through this presentation" means both maps are isomorphisms; no converse is asserted.

Same pattern elsewhere:
- **Conventions:** a new *Convergence* bullet says every asserted convergence is through the canonical presentation, which is what makes filtered morphisms into morphisms of converging structures.
- **§1.2:** a bullet and the matching plan API entry now say the same.
- **§1.4:** the route now gives naturality of the presentation as the reason, and the Needs line and plan add `gap:base-induced-filtration`. Its `neededBy` is now 1.2, 1.4, 5.2.
- **§5.2:** the README statement and the plan statement now say "through the canonical presentation".

New negative-control Check in §1.2, with a plan test:
- The double complex is `K^{0,0} = k y₀ ⊕ V`, `K^{−m,m−1} = k x_m`, `K^{−m,m} = k y_m`. On `Tot^Π` the presentation is a non-invertible projection while an abstract `β` exists. On `Tot^⊕` it is the identity, as 1.3(b) says.

The §6.2 wording was already canonical, so it is unchanged. The suggested repair text was adopted in substance; the naturality clause was added because the §1.4 route uses it.

## Checks run

Dependency check (the command in the brief), exact output:

```text
candidate: SpectralSequencesAndConvergencePartII is not in the merge order yet; checked as if placed after ArithmeticGaloisDuality (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2170 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

Internal consistency, checked mechanically:
- `plan.json` parses.
- The gap slugs in the README, in the plan's `gaps` and in the target prerequisites are the same set of 19.
- Every gap's `neededBy` equals the set of targets that cite it.
- The plan has 90 tests, one more than before (the new §1.2 Check).

No gate failures were listed for this round.

`Suggested.lean`: none at the design stage, so there was no `#check @name` elaboration to run.

## Adversarial pass on the changed statements

| Statement | Instance | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Contract gap:base-induced-filtration (repaired) | `K = (k → k⊕V)`, `F^p = (0 → k⊕V)` for `p ≤ 0` | `Z∞ = Zᵗ = k⊕V`, `B∞ = 0`, `Bᵗ = k`; projection kernel `k`. An abstract `β` exists: `(a, Σvₙeₙ) ↦ ae₀ + Σvₙeₙ₊₁`. | The contract no longer claims the converse. | applied |
| Same contract, positive control | `K = V[0]`, same step filtration | `B∞ = Bᵗ = 0`, `Z∞ = Zᵗ = V`; both maps `id`, so `β = id`. | Sufficient condition holds. | none |
| Same contract, finite length | `K` finite-dimensional over `k` | `dim E∞ = dim gr` forces `dim Zᵗ/B∞` equal to both, so abstract iso ⇔ canonical iso. | The distinction needs infinite length; the Check uses `V` infinite. | none |
| Conventions *Convergence* | Identity of `V[0]`, with `β = id` and `β′ = σ`, a non-identity automorphism of `V` | `β′∘E∞(id) = σ`, but `gr(id)∘β = id`. | An abstract `β` breaks the morphisms of base §3.3; the canonical choice keeps them. | applied |
| §1.2 new Check, `Tot^Π` | `x_m ↦ y_{m−1} + (−1)^m y_m` | `d(1,1,−1,−1,…) = y₀`, since the `y_j` coefficient is `a_{j+1} + (−1)^j a_j = 0` for `j ≥ 1`. `H^{−1} = 0`. `H⁰ = V = F_I⁰H⁰`, `F_I¹H⁰ = 0`. `B∞ = 0`, because finite sequences force `a = 0`. `Bᵗ = k y₀`. | The canonical map is not invertible, yet an abstract strong structure exists. 1.3(c) fails because `K^{−m,m} ≠ 0` for every `m`. | new Check |
| §1.2 new Check, `Tot^⊕` | Functional `c = (1,1,−1,−1,…)` | `c_{m−1} + (−1)^m c_m = 0` for `m = 1..5`; `c(y₀) = 1`. `H⁰ = k y₀ ⊕ V`, and `F_I^pH⁰` is all of it for `p ≤ 0`. | The canonical map is the identity, consistent with 1.3(b) (left half-plane). | new Check |
| Double-complex axioms of the new Check | `d₁d₂`, `d₂d₁`, `d₁²`, `d₂²` | `x_m → y_m → (−m+1, m) = 0` and `x_m → y_{m−1} → (−m+1, m) = 0`; single-step maps square to 0. Total sign in column `−m` is `(−1)^m`. | Valid double complex. | none |
| §1.4 route | Staircase projection onto column 0 | `′E(f)` is an iso on `E₁ = ℤ`. Under 1.3(c), naturality gives a morphism, and the strong comparison gives `H⁰(Tot^Π)`: `ℤ → ℤ`, an iso. `Tot^⊕` fails 1.3(b), with `0` against `ℤ`. | Agrees with the existing §1.4 Check. | applied |
| §5.2 limit-pairing clause | `𝔽₂[x,y]/x²`, `dx = y`, `(y)`-adic filtration; trivial filtration | First case: degreewise filtration finite, `E∞ = 𝔽₂` at `(0,0)`, `gr⁰H⁰ = 𝔽₂`, `F¹H⁰ = 0`, canonical iso. Trivial filtration: `E₁ = E∞ = H(A)`, presentation `id`. | The canonical hypothesis is met where the Checks use it. | applied |
| §6.2 Check *Weak convergence can fail* | `ℤ → ℤ[1/p]` | `E∞⁰ = ℤ/p`, `gr H⁰[1/p] = 0`, so no abstract `β` exists either. | Unaffected by the change. | none |

## Ownership

- No new target or construction was added. The canonical presentation, its naturality and the convergence structures stay with SpectralSequencesAndConvergence §§3.2, 3.3 and 5.2, consumed through declared gaps.
- Ownership against open pull requests is unchanged from the previous round: no new object was introduced that would need a fresh search.

## For the maintainer

- The base design, `packages/SpectralSequencesAndConvergence/design/README.md` §5.2, has the same ambiguity. It says weak convergence at `(p, n − p)` holds "if and only if" the inclusions (24.6.1) and (24.6.2) are equalities, while its §3.2 convergence structure allows an arbitrary `β`. That is only true when weak convergence is read in Stacks's canonical sense.
- This package cannot edit the base. The contract here now states exactly what is consumed, and the base's §5.2 should say "through the canonical presentation" when it is next revised.
- No Lean names or section ids that other roadmaps cite were changed.
- The review's "For the human reviewers" item, on uncertified sources, needs no change.
- No suspicious instructions were found in the review text.
