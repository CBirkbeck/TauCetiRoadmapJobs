# FIX-PKG-EllipticCurveModularityTotallyReal~3

Repair round on the review `REV-PKG-EllipticCurveModularityTotallyReal~2` (one finding). Only
`packages/EllipticCurveModularityTotallyReal/README.md` changed; `Suggested.lean`, `metadata.toml`,
`sources.toml` and `design/plan.json` are untouched.

## F01 (P2) — applied

Verified. SmallRamificationAndAbelianVarietyBaseCases §5.0d (its README lines 1995 and 2010)
stores good-place polynomials only outside the bad set, and its restriction "enlarges S by ramified
places". For `L = ℚ`, an odd prime `q ∉ S` and `L′ = ℚ(√q)`, the place above q is ramified
(`e = 2`, `f = 1`), so it lies in the restricted bad set and the old clause "at a place `v′|v` with
`v ∉ S` its polynomial is …" asked for a stored polynomial outside the carrier's domain.

Change (§1.4 API, base-change bullet): old "at `v′|v` with `v ∉ S` its polynomial has roots the
`f(v′|v)`-th powers" → new: names `S_res` (places above S plus places ramified over L, as §5.0d
assigns); stored polynomial with roots `α^f, β^f` only at `v′ ∉ S_res`; separately, for every
`v ∉ S` and every `v′|v` (ramified included), the members away from the residue characteristic
are unramified at v′ with Frobenius roots `α^f, β^f`, constant term `q_{v′}`. A one-line reason is
given (inertia inclusion, Frobenius maps to the f-th power).

New §1.4 Check, "Ramified base-change witness": `L′ = ℚ(√5)` over the existing 5-adic setup, with no
stored polynomial at v′, member polynomial `X² − 2X + 5`, and the e-for-f wrong model `X² + 6X + 25`.

Pattern repaired elsewhere:
- §1.4 API, restriction-to-M bullet: the claim was true but left the domain implicit. It now says
  why `w` above `v ∉ S` lies outside the restricted bad set: `M = L(ζ)` is ramified over L only
  above n, and those places lie in S.
- Exact supplier contracts, SmallRamificationAndAbelianVarietyBaseCases: one sentence records what
  §1.4 assumes of the §5.0d restriction (roots raised to residue degrees, Hodge labels restricted,
  bad set enlarged by ramified places, no polynomial stored there).

No other passage of the README uses the carrier's restriction polynomials. I checked §1.5's lattice
restriction, the §2.1 carrier use and the §§3.1 and 4.1 restrictions to `G_{M(ζ_ℓ)}`; those are
irreducibility or lattice statements.

The supplier's operation is unchanged, and the roadmap is not narrowed to unramified extensions.

## Checks

- **Elaboration**: `lake env lean packages/EllipticCurveModularityTotallyReal/Suggested.lean`, run
  from the content checkout: exit 0, two warnings, both `declaration uses 'sorry'`, at 58:8
  (`realCyclotomic_isCMField`) and 80:8 (`three_five_switch`). No `TauCeti.*` module needed building.
- **Signatures**: I elaborated a scratch copy with `#check @` for both declarations (exit 0). The
  elaborated types match the ones recorded before this round, binder for binder. `realCyclotomic_isCMField`
  keeps `NumberField k`, `IsTotallyReal k`, `NumberField M`, `Algebra k M`, `2 < n`,
  `IsCyclotomicExtension {n} k M` and `IsPrimitiveRoot ζ n`. `three_five_switch` keeps
  `NumberField K`, `DecidableEq (AlgebraicClosure K)` and `W.IsElliptic`. Both still agree with
  their README statements. The Lean file did not change.
- **Dependency direction** (gate `--depcheck … --movable`), output:

  ```text
  depcheck: 237 roadmaps, 2157 edges, 0 problem(s)
  ```

  There are no UPWARD, CYCLE or moved lines.
- **Citation resolver** on the edited README: no cross-roadmap citations or Lean names were found
  missing. The backticked `S_res` is notation, and the resolver does not flag it.
- **Sources**: no new citation was added. `sources.toml` is unchanged and no
  `needs-references.toml` was written.

## Adversarial pass on the changed statements

Setup used throughout, from the §1.4 witness: k = ℚ, n = 3, L = ℚ, `M = ℚ(√−3)`, `5 ∉ S`, and B_t
reduces modulo 5 to `y² = x³ − x + 1`. I recounted that curve: the affine points for
x = 0, 1, 2, 3, 4 are 2, 2, 0, 1, 2, so there are 8 points with ∞, `a₅ = −2`, and
`P_{1,5} = X² − 2X + 5` after the twist `δ(Frob₅) = −1`, with roots `1 ± 2i`.

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| Base change, stored polynomial at `v′ ∉ S_res` | `L′ = L` (trivial); `L′ = ℚ(√−3)` at 5 (inert); `L′ = ℚ(i)` at 5 (split) | Trivial: `S_res = S`, f = 1, polynomial `P_{θ,v}`. Inert: f = 2, roots `−3 ± 4i`, `X² + 6X + 25`, which matches 32 points over `𝔽₂₅` (26 − 32 = −6). Split: f = 1 at both places, `X² − 2X + 5`; δ stays −1 because −3 ≡ 2 is a non-square in `𝔽₅`. | Holds; new text. |
| Base change, member polynomial at every `v′` above `v ∉ S` | `L′ = ℚ(√5)` at 5 (e = 2, f = 1, tame); `L′ = ℚ(i)` at 2 when `2 ∉ S` (e = 2, f = 1, wild) | Since `I_{v′} ⊆ I_v`, the member is unramified at v′. Frob_{v′} maps to Frob_v (f = 1), so the polynomial is `X² − 2X + 5` with constant term 5 = `q_{v′}`. In the wild case the polynomial is `P_{θ,2}` with constant term 2 = `q_{v′}`; wildness does not enter. | Holds; new text. |
| Member clause, the residue-characteristic exclusion | λ above 5 at v = 5 | `det W_{θ,5} = ε₅⁻¹` is ramified at 5 (crystalline there, not unramified), so an unramified claim for λ above 5 would be false. The text excludes λ above the residue characteristic of v. | Hypothesis needed and present. |
| `S_res` and the stored data | v′ above 5 in `ℚ(√5)` | v′ is ramified, so v′ ∈ `S_res` and no stored polynomial exists there. The member polynomial `X² − 2X + 5` still exists. | The two assertions are now distinguished. |
| Wrong model: e used for f | `ℚ(√5)` at 5 | `(1 ± 2i)²` gives `X² + 6X + 25`, unequal to the true `X² − 2X + 5`. | Excluded by the new Check. |
| Constant term `q_v^f = q_{v′}` | f = 1, 2 at 5 | 5 = 5¹ and 25 = 5², the norms of v′. The e-based value 25 at `ℚ(√5)` is wrong. | Holds. |
| Restriction to M: w above `v ∉ S` lies outside the restricted bad set | k = ℚ, n = 3 (M/L ramified at 3 only); k = ℚ(√−3), n = 3 (M = L) | ℚ(√−3)/ℚ has discriminant −3, so it is ramified only at 3, and 3 ∈ S. When M = L nothing ramifies and `S_res = S`. | Holds; new clause. |
| Supplier contract sentence | Compared with §5.0d (its README line 2010) | The supplier's text: roots raised to residue degrees, Hodge labels restricted, S enlarged by ramified places. The sentence restates this and adds that no polynomial is stored at a ramified place, because polynomials are stored only outside S (line 1995). | Agrees with the supplier. |
| Degenerate: v ∈ S | v = 3 for n = 3 | Neither clause claims anything at places above S. | No claim to test. |

## Ownership, overlaps and suppliers

- No new construction was introduced. The carrier and its restriction remain owned by
  SmallRamificationAndAbelianVarietyBaseCases §5.0d, which is earlier in the merge order.
- I checked the citation against that roadmap at the head of its open pull request, via
  `roadmaps show`.
- The overlap report lists no open pull request that changes this roadmap and no dropped or
  revision-only id. Nothing here changes a name that other roadmaps cite.
- No supplier gap was needed. The supplier already states the restriction rule the repair relies
  on, so `design/plan.json` is unchanged.

## For the maintainer

- `Suggested.lean` is unchanged, and no Lean name changed.
- No untrusted text contained instructions.
