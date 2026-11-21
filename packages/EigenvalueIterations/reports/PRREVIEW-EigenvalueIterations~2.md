# Review of EigenvalueIterations (pull request #2816 at cc2273b)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review (the Check of 2.2 on `dim W > dim U`) is repaired, and the repaired sentences were recomputed and hold; the two small corrections and the suggested Check were also taken up correctly, and no repair introduced a new problem. `Suggested.lean` elaborates with `sorry` as its only warning. There is one format note, not blocking; the two facts about the sources remain for the human reviewers.

## N01 — "Its template update" names the revised texts by a working title

Scope and ownership (README lines 435 and 467) now says "the sectioned numbering of its template update" for SpectralSubspacePerturbation 3.11–3.14 and MarkovChainsAndRenewal 3.5. The numbers do resolve in the open revisions of those two roadmaps, and the ids of main (`SSP-C11`–`SSP-C14`, Layer 3 item 5) are cited alongside, so nothing breaks; but once the revisions merge the phrase refers to nothing a reader can find. "In the sectioned numbering of its revised text" would stay true.

## Previous findings

- R01 — repaired: "When `T` is invertible, `dim Tᵏ W = dim W > dim U`, so `s(Tᵏ W) = 1` for every `k` … For a singular `T` it can: for `T = diag(1, 0)` …, `Tᵏ W = U` for every `k ≥ 1`."
- C01 — repaired: the module docstring of `Suggested.lean` says "together with the five definitions they need"; the description already said 5.
- C02 — repaired: "The angles, gaps and Rayleigh quotients in the statements are invariant under nonzero scaling …; 1.2 is the exception, as it fixes the scaling by `λ⁻ᵏ`."
- N01 — repaired in substance: "3.11 to 3.14 in the sectioned numbering of its template update"; the wording is the format note N01 above.
- N02 — repaired: "For `T = i` on `ℂ` and `x = 1`, `rayleigh T x = ⟪1, i⟫ = i`; the variant `⟪T x, x⟫ / ‖x‖²` gives `−i`, and 3.1 with `λ = i` and `c = 0` would then fail."

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 2.2 Check 2, invertible case | `dim W > dim U`, `T` invertible | `dim W + dim U⊥ > dim E`, so `W ∩ U⊥ ≠ 0`, `s(W) = 1`; `dim Tᵏ W = dim W`, `s(Tᵏ W) = 1`, gap to `U` is `1` | holds |
| 2.2 Check 2, singular case | `T = diag(1, 0)`, `α = 1`, `ρ = 0`, `W = 𝕜²` | hypothesis `‖0‖ ≤ 0·1`; `U = ⟨e₁⟩`; `Tᵏ W = ⟨e₁⟩` for `k ≥ 1`; 2.2 reads `0·0 ≤ 0·1·1` | holds |
| 2.2 `directedProjectionGap_map_pow_mul_sqrt_le` (Lean) | same instance against the signature | `hρ` holds for `d = (1, 0)`; `W.map (T^k) = dominantSubspace T 1`; both sides `0` at `k ≥ 1`, `0 ≤ 1·1·0` at `k = 0` | agrees with README |
| Conventions, Iterates | `x ↦ t x`, `t ≠ 0`, in 1.3, 2.1–2.3, 3.1–3.3; 1.2 | subspaces unchanged; 2.3 and 3.1 scale both sides by `‖t‖²`; `rayleigh (t x) = rayleigh x`; 1.2: `‖λ⁻ᵏ Tᵏ v − u‖` not invariant | holds |
| 3.1 Check on the order of the inner product | `T = i` on `ℂ`, `x = 1`, `λ = i`, `c = 0` | `⟪1, i⟫ = conj(1)·i = i`, left side `0 ≤ 0`; variant `conj(i)·1 = −i`, left side `2 > 0` | holds; separates the variants |
| `rayleigh` (Lean, line 141) | same | `⟪x, T x⟫_𝕜 / ‖x‖²`, first argument conjugate-linear | agrees with the Check |

The rows of the previous review, of `9a98a8e`, for the untouched statements stand as they are.

- Source locators: the change adds or alters none; the 12 checked in the previous review stand.
- Cross-roadmap citations resolved again for the two changed passages: SpectralSubspacePerturbation `SSP-C11`–`SSP-C14` on main (README lines 315–321) and 3.11–3.14 at the head of its open revision; MarkovChainsAndRenewal Layer 3 item 5 on main (line 261) and `### 3.5` at the head of its open revision.
- Library declaration read at the pin for the new Check: the definition of `rayleigh` in `Suggested.lean` with Mathlib's `inner` convention (conjugate-linear in the first argument).
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no roadmap supplier.
- Elaboration of `TauCetiRoadmap/EigenvalueIterations/Suggested.lean`: 8 `sorry` warnings, nothing else. No statement changed (one word of the module docstring), so the one-tactic probe of the previous review stands.
- Pull request's text against this head: title and description agree ("its 5 definitions", 8 headline theorems, one Tau Ceti module, no roadmap supplier); nothing to correct.
- No change outside the roadmap folder; the automatic checks all passed.

Overlap check: read SpectralSubspacePerturbation (main and its open revision), IterativeMethodsForLinearSystems, ConditioningAndPerturbation, ManifoldOptimization, PrincipalAngles, VariationalMethods; nothing shared (as in the previous review; the change adds no object).

Source independence: changed passages only; 4 passages compared with 2 sources (Saad2011, Arbenz2016), none shared; largest share Arbenz2016, 6 of 11 cited targets; the change adds, removes or reorders no layer, so the contents were not compared again (previous result: independent).

Research link: classical numerical linear algebra: the Kato–Temple bound (Saad2011 Theorem 3.8) and Parlett's cubic convergence of Rayleigh quotient iteration (Saad2011 p. 90; Arbenz2016 Theorem 7.14), which Saad2011 Chs. 4–6 use for projection and Krylov methods. Rests on the sources read; no research article is cited.

## Not verifiable

- The description's claims about the author's numerical experiments (instance counts, 80-digit arithmetic) and prior-art survey: not reproducible from the files.

## Source issues

- none

## For the human reviewers

- Scope: the two sources are a SIAM textbook (Saad2011) and unpublished ETH lecture notes (Arbenz2016, 6 of 11 cited targets); the README cites no research article; Kato, Temple, Parlett and Bauer are attributed without locators (README References).
- Licence: both texts were read from their authors' university pages (Saad at Minnesota, Arbenz at ETH); neither page states a licence. No passage or table is reused.
