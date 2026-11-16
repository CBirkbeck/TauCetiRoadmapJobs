# Review of EllipticCurveModularityImaginaryQuadraticPartII (pull request #2445 at fcd601d)

**Verdict:** accepted

## Previous findings

- R01 — repaired: lines 830–832, 878–880 and 919–920 now give CaptainSude26's setting (`p = 5`, `μ₅ ⊂ F_v`, `ρ̄(τ) = U`, `ρ̄(φ) = 1`). §3.4 says its route uses only the normal form and odd `p`. §3.5 (lines 913–918) adds proofs of (c) and (d) for general `p`.
- R02 — repaired: line 1686 reads "a prime `q ≡ 1 mod 5` other than `p` and `31`, outside `Σ₀` and split completely in the field of definition of the data of §7.1(b)".
- R03 — repaired: the description now reads "the targeted Lake build succeeds with no warnings, the file containing no declaration and no `sorry`" and "`Suggested.lean` has no declaration, only its module docstring …".

## Verified sound

| Target | Instances tried | Values computed (roadmap side / check side) | Result |
| --- | --- | --- | --- |
| §3.3 locator (line 830) | CaptainSude26 lines 177–183 and 533–536 | Source assumes characteristic 5, `μ₅ ⊂ F_v`, `ρ̄(τ) = U` and `ρ̄(φ) = 1`; lines 533–536 bring a split Tate curve to that form | as the new text says |
| §3.4 route and locator (line 878) | `p = 7`, `q_v = 29`, `ρ̄(φ) = [[29δ̄, z̄],[0, δ̄]]`; `p = 2` | Unit off-diagonal entry gives `tr N = det N = 0`; `δ² = ψ(φ)/q_v` lifts uniquely only if `2` is invertible; `μ_p` and `ρ̄(φ) = 1` are never used | holds; "only the normal form and that `p` is odd" is accurate |
| §3.5(c), new proof | `p = 5`, `q_v = 11`; `q_v = 7` | `h⁰ = 1`; Frobenius acts on `e ⊗ ζ` by `q_v² = 121 ≡ 1`, so `h² = 1` and `h¹ = 2`. At `q_v = 7`: `49 ≡ 4`, so `h² = 0` | holds |
| §3.5(d), new proof: the sum `Σ_{i<q_v} D^i` | `(p, q_v) = (5,11), (7,29), (11,23), (3,4), (3,7)`, as matrices on `(e, h, f)` | Identity for the first three. `C(4,3) ≡ 1` and `C(7,3) ≡ 2 mod 3` give `1 + (D−1)²` and `1 + 2(D−1)²`; `(D−1)³ = 0` in every case | holds; `p ≥ 5` is necessary, as stated |
| §3.5(d), cocycles | `p = 7`, `q_v = 29`; `p = 3`, `q_v = 4` | `(1 − D)ξ(φ) = 0`, `dim Z¹ = 4`, `dim B¹ = 3 − 1 = 2`. At `p = 3`, `(f, 0)` is not a cocycle but `(f, −h)` is | holds |
| §6.2 Example (line 1423) | `F = ℚ(ζ₅)`, `v ∣ 11`, `v(Δ_min) = 3`; `v ∣ 5` | Residual inertia `[[1,3],[0,1]] ≠ 1`, char. poly `(X−1)²`. `SL₂(𝔽₅)` is non-solvable, so the curve is non-CM and `π` cuspidal. Steinberg `π_v` is Iwahori-spherical. `v ∣ 5` is now excluded | every hypothesis of the protected alternative is supplied |
| §7.1 locator (line 1461) | CaptainSude26 lines 45, 500 and 509; parent §2.1 | Source: `μ₅ ⊂ K`, large `p`, `R₀` of order `6p`. README: `p > 3` and `R_*` of order `2n = 6p`. Parent §2.1 needs only `n ≥ 3` in characteristic zero | holds |
| §7.2 locator (line 1501) | CaptainSude26 lines 520–532 | Source: `q ≥ 7`, `q ≠ 5, p`, split completely. The README route uses `q ≥ 7` and `q ≠ p`, not `μ₅ ⊂ K` | holds |
| §7.5 Example (line 1684) | `y² = x³ + x + 1`; `q = 11, 31, 101 = p` | `Δ = −496 = −2⁴·31`; `j = 6912/31` with `6912 ≡ 30 mod 31`, so non-integral and non-CM. `31 ≡ 1 mod 5` is bad, hence excluded; so is `101 = p`. Four places lie above `11` | every hypothesis of §§7.2 and 7.5 is supplied |

The rows for statements this change leaves untouched stand as in the previous review, of `669904e`.

- Source locators: 8 CaptainSude26 passages in the changed text were checked against the cached text (lines 45, 177–183, 184–220, 221–226, 500, 503–532, 520–532 and 533–536). Each is at the cited line and supports the wording.
- Cross-roadmap: the parent's §7.2 ("Genericity of the original elliptic endpoint", line 1930 at its open head) gives `p > max{100, 2d + 1}`, so `p > 100` is enough for `ℚ(ζ₅)`. The parent's §2.1 needs only `n ≥ 3`. Declared gap `gap:acc-torsion-inertial-comparison`: README line 349, unchanged.
- Gate at fcd601d: every check passes. Dependency check: `depcheck: 255 roadmaps, 2429 edges, 0 problem(s)`. The diff outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file is unchanged and still declares nothing.
- Pull request text, read against fcd601d: the 35 changed lines alter nothing the title, the summary block or the prose state.
- Remark (untouched text): the second Check of §3.5 still reads `5 | q_v − 1` where (d) and its new proof have `p | q_v − 1`. The computation is the same.

Overlap check: the three lists are unchanged since `669904e`. Read EllipticCurveModularityImaginaryQuadratic, EllipticCurveModularityTotallyReal, PotentialAutomorphyInfrastructurePartII, CrystallineLocalGlobalCompatibilityCM and OrdinaryAutomorphicFormsAndModularityLiftingPartII; the main-branch and results lists are empty. The cover family, `switch_five` and the CM lifting criteria belong to EllipticCurveModularityImaginaryQuadratic; prepared patching and solvable preparation belong to CrystallineLocalGlobalCompatibilityCM. The change moves no ownership. "Protected place", "unipotent-inertia condition" and "exceptional class" occur in no other roadmap, open or on main.

Source independence: changed passages only; 7 passages compared with 1 source (CaptainSude26, lines 177–226 and 500–538), none shared beyond formulas and standard terms of at most four words; largest share CaptainSude26, 23 of 64 locators (mentions per source unchanged since `669904e`); contents compared with CaptainSude26: independent, as in the previous review, since no layer was added, removed or reordered.

## Not verifiable

- none: CaptainSude26 is in the sources cache and was read at every changed locator.

## Source issues

- none

## For the human reviewers

- Scope: Theorems 6.2 and 8.1 (Layers 3–8) rest on CaptainSude26, a pseudonymous, unrefereed GitHub release of 7 October 2026 (README lines 112–113 and 1768–1774). LeHung26 line 355 says it has no seed when `ζ₅ ∈ K`. No other cited source treats that case.
- Scope: Theorem 2.5 rests on LeHung26, an unrefereed discussion draft (Hexagon preprint, README lines 1764–1767), and on the parent's OpenAI26. Searched the eight cited sources and the open roadmaps: no refereed statement found.
- Licence: CaptainSude26 states no licence (README line 1774). `sources.toml` records it as `author-page` for a pseudonymous GitHub release, and records OpenAI26 the same way.
