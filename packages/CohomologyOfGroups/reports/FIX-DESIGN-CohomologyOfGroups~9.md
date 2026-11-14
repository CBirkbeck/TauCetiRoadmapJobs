# FIX-DESIGN-CohomologyOfGroups~9

Review settled: `REV-DESIGN-CohomologyOfGroups~8` (two findings, both P2). Files edited:
`packages/CohomologyOfGroups/design/README.md` and `packages/CohomologyOfGroups/design/plan.json`.
`packages/CohomologyOfGroups/sources.toml` is unchanged: no new work is cited. The design package has
no `Suggested.lean`, so there was nothing to elaborate and no `#check @name` audit to run.

## F01 (P2) — applied

Verified. The cup product of 4.1 needs both coefficients in `Rep k Q` (pinned
`Mathlib/RepresentationTheory/Rep/Basic.lean`: `Rep k G` carries `Module k V`). `N^ab` need not be a
`k`-module: for `3ℤ/27 ≅ ℤ/9` and `k = 𝔽₃`, `3·3 = 9 ≠ 0`. So `−c ∪ u` with integral
`c ∈ H²(Q, N^ab)` had no meaning in the roadmap's `k`-linear setting. HS53 line 984–990 states
Theorem 4 for abelian-group coefficients, which is the case `k = ℤ`.

Changes:
- Conventions, "Extension classes": integral `c` → integral `c` plus the scalarised class
  `c_k ∈ H²(Q, A_k)`, `A_k = Additive A ⊗_ℤ k`. It is the factor set followed by `a ↦ a ⊗ 1`. The
  text shows it does not depend on the section (the coboundary of `b`), that `c_ℤ = c`, and that
  `A_k` lies in `Rep.{u} k Q`.
- 6.6: `d₂ = −c ∪ u` → `d₂ = −c_k ∪ u`. `Hom(N^ab, M)` is identified with `Hom_k(N^ab_k, M)`
  (`Rep.ihom`) by `φ ↦ (b ⊗ a ↦ a·φ(b))`, and the pairing is evaluation. A route sentence follows
  HS53's proof: transgress the class `n ↦ n̄ ⊗ 1` (giving `−c_k`), then apply the derivation rule of
  6.5. *Needs:* gains 4.1 and `Rep.ihom`.
- API bullet and sign Check: changed to `c_k`.
- New Checks: C₉ ⊂ C₂₇ over `𝔽₃` (and `ℚ`), and non-abelian Q₈ ⊃ ⟨i⟩.
- Layer 6 Examples: `d₂y = x²` is now called `c_{𝔽₂}`.
- plan 6.6 (statement, hypothesis, locator, prerequisites, `d2_eq_neg_cup`, `tg_sign_Z9`) changed to
  match. New tests `tg_coefficients_Z27` and `tg_nonabelian_Q8`.

Pattern search: I also checked every other place that pairs an extension class or an integral
class with a `k`-linear cup product. Line 484 (1.2, `H¹(N, M) ≅ Hom(N^ab, M)`) is `k`-linear through
`M` and is unchanged. 6.9 and its plan test only compare `−[carry]`, with no cup, and are unchanged.
Layer 8 is integral throughout ("representations are over `ℤ`"), so its cups with `δχ` and `e` are
unaffected.

## F02 (P2) — applied

Verified at the head of K2SymbolsBrauer (`roadmaps show K2SymbolsBrauer`, `README.md` §1.1,
"The bar-calibrated kernel identification"). That section owns:
- the positive lifted-boundary connecting map with `[a] − [b] ↦ ab⁻¹` in `N/[F,N]`;
- the ordered torus cycle `↦ [s,t]⁻¹`;
- naturality under maps of free presentations and of universal extensions.

It leaves existence, bijectivity and presentation independence to its supplier,
StableHomotopyKTheory §3.29. That section on main treats perfect groups only and fixes no map. No
roadmap on main or at an open head owns Hopf's formula for a general group: `roadmaps grep` finds only
InductionRestrictionPartII RS.0.1, which mentions it as an alternative route. K2SymbolsBrauer is line
89 of `merge-order/ORDER.txt`. This roadmap is checked as placed after IntegralIwasawaTheoryPartII
(line 315), so the direction of supply is correct.

Changes:
- Scope: "6.8 … with the map fixed by a chain-level formula" → K2SymbolsBrauer §1.1 owns the
  normalisation, torus value and naturality. 6.8 proves that the map is well defined and an
  isomorphism onto `(R ⊓ ⁅F, F⁆) ⧸ ⁅F, R⁆` for every group.
- New supplier contract "From TauCetiRoadmap.K2SymbolsBrauer". It says that nothing is assumed of the
  map's existence or bijectivity.
- 6.8: "Define `h` …, natural in presentations" → "the map whose normalisation §1.1 fixes; prove it
  is well defined, with image …, and an isomorphism". The kernel/long-exact-sequence route is kept.
  It uses neither §1.1's torus value nor its naturality, so the proofs have no cycle.
- The API bullets "Naturality" (§1.1's) and "Comparison with perfect groups" are deleted. The second
  duplicated §1.1's perfect-group calibration, so it becomes a Check comparing with §3.29: for
  `G = 1` both sides are `0`, and for `A₅` both are `ℤ/2`.
- The torus Check is kept as a comparison with §1.1.
- Layer 6 Dependencies and plan 6.8 (statement, prerequisite `roadmap:K2SymbolsBrauer §1.1`, `api`
  emptied, `hopf_normalisation`, new `hopf_perfect`) changed to match. A K2SymbolsBrauer supplier
  entry is added to the plan.

## Adversarial pass (changed or added statements)

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| Conventions: integral `c`, ℤ/3 ⊂ ℤ/9 | `s(x) ∈ {0,1,2}`, all 9 pairs | `s(x)+s(y)−s(x+y)` = 3 at (1,2), (2,1), (2,2); 0 at the other 6 | Witness made exact ("0 elsewhere"). |
| Conventions: `c_k` independent of `s` | `s′ = b·s`, `b(1)=1` | `f′(x,y) = f(x,y) + (x·b(y) − b(xy) + b(x)) = f + db` | Holds for every `k` (`a ↦ a⊗1` is equivariant). |
| `c_k` at the edge cases | `k = ℤ`; `k = 0`; `A = 0` | `A ⊗ ℤ = A`, so `c_ℤ = c`; `A ⊗ 0 = 0`; `0 ⊗ k = 0` | Consistent. |
| 6.6 `d₂ = −c_k ∪ u`, C₉ ⊂ C₂₇, `𝔽₃` | all 729 pairs `(a,b)` in ℤ/27 | `df(a,b) = −carry(a mod 3, b mod 3)` on all 729; `df(2,1) = 2`; `N^ab_{𝔽₃} = 𝔽₃`; `−c_k ∪ u = −carry` | Equal. New Check. |
| same, `k = ℚ`, `M = ℚ` | `ℤ/9 ⊗ ℚ`, `Hom(ℤ/9, ℚ)` | 0 and 0 | Both sides 0. |
| same, sign model `+c_k ∪` | C₃ ⊂ C₉, `𝔽₃` | `+carry` vs `df(2,1) = −1` | Excluded (sign Check kept). |
| 6.6, non-abelian Q₈ ⊃ ⟨i⟩, `𝔽₂` | `s(σ)=j` | factor set `2 ∈ ℤ/4` at `(σ,σ)`; `H²(ℤ/2, ℤ/4⁻) = {0,2}/0 = ℤ/2`, so `c ≠ 0`; `2⊗1 = 0`, so `c_{𝔽₂} = 0`; `dim H¹(Q₈,𝔽₂) = 2 = 1 + 1`, which forces `d₂ = 0` on `E₂^{0,1}` | Agrees. New Check. |
| 6.6, split extension | ℤ/2 ⊂ (ℤ/2)² | `c_k = 0`; inflation is injective (split by restriction), so `d₂ = 0` | Agrees with `tg_split`. |
| 6.6, degenerate `N` | `N = 1`; `N = G` | `N^ab_k = 0`, both sides 0; `Q = 1`, `H^{p+2}(1, M) = 0` | Agrees. |
| 6.6 route: transgression of `o` | `f(σ s(x)) = σ̄⊗1` | `df(σs(x), τs(y)) = x·τ − (σ + x·τ + f_c(x,y)) + σ = −f_c(x,y)` | `τ(o) = −c_k`. Derivation sign `(−1)^{0+1}` acts on `d₂u′ = 0`, so `d₂u = d₂o ∪ u′`. Product sign `(−1)^{pq′} = (−1)^{0}` in both products. |
| Layer 6 Example `d₂y = x²` | ℤ/2 ⊂ ℤ/4, `𝔽₂` | `ℤ/2 ⊗ 𝔽₂ = 𝔽₂`; non-split, so `c_{𝔽₂} ≠ 0`, which is `x²` | Unchanged value. |
| 6.8 with §1.1's normalisation, torus | ℤ² = ⟨a,b⟩ | `d([a|b] − [b|a]) = [ba] − [ab]`, `h[z] = ba(ab)⁻¹ = ⁅a,b⁆⁻¹`; §1.1 gives `ts(st)⁻¹ = [s,t]⁻¹` | Same map. Inverse model gives `⁅a,b⁆`. |
| 6.8 cyclic / free | `ℤ/n`, `n = 0, 1, 2`; `R = 1` | `R ∩ [F,F] = 0` gives 0 for all `n`; wrong model `R/[F,R]` gives `0, ℤ, 2ℤ`; free: 0 | Unchanged. |
| 6.8 perfect Check | `G = 1`; `A₅` | `F = R = ℤ`: `[F,F] = 1`, quotient 0 = `H₂(1)`; `A₅`: kernel `{±1}` of `SL₂(𝔽₅) → A₅` = ℤ/2 = `H₂(A₅, ℤ)` | Consistent with §3.29's Check. |
| 6.8 no cycle | route inputs | LES of `0 → K → C(F) → C(G) → 0`, `H₁(K) ≅ R/[F,R]`, `H₂(F) = 0` (3.6); no use of §1.1's torus value or naturality | No derivation from the target itself. |

## Checks run

Dependency check (after the final edit):

```text
candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after IntegralIwasawaTheoryPartII (the intake inserts it when its design is accepted)
depcheck: 242 roadmaps, 2198 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The new edge to K2SymbolsBrauer (order line 89) points to an earlier
roadmap.

Citation resolver (`roadmaps resolve` on the README): no cross-roadmap citations and no Lean names
were found missing. `Rep.ihom` (and `ihom.ev`) was checked by hand at the pin, in
`Mathlib/RepresentationTheory/Rep/Basic.lean` (the `MonoidalClosed (Rep k G)` instance). `plan.json`
parses as JSON.

## For the maintainer

- This package now consumes K2SymbolsBrauer §1.1. That roadmap is still an open pull request that
  adds a new folder, and it is earlier in the merge order. It must merge first, and its §1.1 numbering
  and title ("The bar-calibrated kernel identification") must stay as they are at its head.
- K2SymbolsBrauer §1.1 leaves the general-group Hopf equivalence to "its supplier", but
  StableHomotopyKTheory §3.29 covers only perfect groups. 6.8 here proves the general statement. No
  edge back to K2SymbolsBrauer was added, and none is needed.
- No id that other roadmaps cite was renamed or dropped. The 6.8 API bullets removed here had no
  external citers.
- Ownership against open pull requests was checked with `roadmaps grep` and `roadmaps show` at
  their heads for the Hopf map. The overlaps file lists no conflicting head.
