# Review of DGFloerPartII (pull request #1799 at a660fec)

**Verdict:** needs changes

Incremental re-review of the 25 lines changed since `43d9b63`, all in
`TauCetiRoadmap/DGFloerPartII/README.md` (17 insertions, 8 deletions): the headings of 4.2a and
4.3 are renamed, each gains an introductory paragraph, and 4.2b, 4.2c and 4.4 become bold run-in
labels under them. `Suggested.lean` is unchanged and nothing changed outside the folder. This
round also reads the title and description against the head.

## R01 (P3) — 4.3's new introduction reads as excluding odd spheres, and omits `n ≥ 3`

**Location** `TauCetiRoadmap/DGFloerPartII/README.md` lines 1855–1856: "with compact connected Lie
groups other than tori and odd spheres as cases (4.3)".

**Claim** The sentence parses as "Lie groups other than (tori and odd spheres)", which is false,
and in the intended reading "odd spheres" includes `S¹`, which is not abundant.

**Witness** `S³ = SU(2)` is a Lie group and an odd sphere, abundant by line 1366. `S¹ = T¹` is
the non-example of the Layer 4 Examples (line 2198). `bdho-cotangent` line 5063: Proposition 6.34
is for dimension `n ≥ 3`.

**Repair** Replace lines 1853–1857, up to "instead.", by: "This part makes a manifold abundant
with 2-spheres from a group acting on it. `Diff(M)` acts through evaluation on manifolds covered
or `ℓ`-covered by diffeomorphisms, under the homotopy hypotheses stated there; the compact
connected Lie groups that are not tori, and the odd spheres `Sⁿ` with `n ≥ 3`, are cases (4.3).
`G` acts on a homogeneous space `M = G/H` (4.4), which for nonorientable `M` gives
`c°_HZ(D*M) < ∞` instead."

## R02 (P3) — the description says its task list does not name #1798, and the list names it

**Location** Pull request description, last sentence of "Merge order with DGFloer": "DGFloer is
on main, so #1798 is not a supplier, and the task list below does not name it."

**Claim** The sentence is false of the description as it stands.

**Witness** The `depends-on` block directly below reads "- [ ] #1798 DGFloer", and the
`merge-order` block ends "#1798 (DGFloer) → **this pull request** (#1799)".

**Repair** Replace the sentence by: "DGFloer is on main, so this roadmap cites it as it is on
main; the task list below names #1798 only because it must merge first, as this paragraph says."

## Previous findings

The review of `43d9b63` accepted the folder with no finding, so there is none to account for.

## Verified sound

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | 4.2a introduction: Lemma 6.35 takes "the stable term `π_(n−1)(O)` from 4.2c and the range `r ≥ i + 2` … from 4.2a" | `n = 17`, `19`, `9` | `n = 17`: `i = 16`, rank `r = n + 1 = 18 = i + 2`, in range with equality; `π₁₆(O) = ℤ/2` (`16 ≡ 0`), and `17 ≡ 1 (mod 8)`. `n = 19`: `π₁₈(O) = 0` (`18 ≡ 2`). `n = 9`: `r = 10 = 8 + 2` | agrees with 4.3 (lines 1883–1887) and its `*Needs:*` line (4.2a, 4.2c) | none |
| 2 | The same sentence against `nonempty_pi_SO_mulEquiv_prod_stiefel` (`signatures.md`) | `k = 14` | `Odd (k+3)`, `14 ≤ k`: `n = 17`; `π_(k+2) = π₁₆`; `SO (k+4) = SO(18)`; Stiefel frames in `ℝ^(k+5) = ℝ¹⁹ = ℝ^(n+2)` | the Lean reads the stable term in rank `n + 1`, as the introduction says | none |
| 3 | 4.2a introduction: "forms the stable classical groups `O`, `SO`, `U` and `Sp` in 1.0's convenient category … computes the homotopy groups of `O` and `SO`" | lines 1601–1612, 1798–1803 | the colimits of all four are defined at line 1601; `π_i(O) = ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, ℤ`, `π_i(SO) = π_i(O)` for `i ≥ 1`, `π₀(SO) = 0` at 1802–1803 | agrees | none |
| 4 | 4.3 introduction: "odd spheres as cases" (R01) | `n = 1`, `n = 3` | `S¹`: aspherical, `π_k = 0` for `k ≥ 2`, so neither hypothesis of Proposition 6.33 holds; `S³`: `π₃ = ℤ` not `ℓ`-torsion, abundant, and a non-torus Lie group | false at `n = 1`; misparse excludes `S³` | R01 |
| 5 | 4.3 introduction: "for nonorientable `M` gives `c°_HZ(D*M) < ∞` instead"; "4.5 consumes both" | `ℝP² = SO(3)/O(2)`; 4.5 lines 2036–2042 | 4.4 (line 1959) and the Examples (line 2200) give finite capacity without abundance; 4.5 uses "4.1–4.3" for Theorem I and "(4.4)" for the added orientable homogeneous spaces | agrees | none |

The rows for the untouched statements stand as in the previous review, of `43d9b63`.

- Source locators checked against the text, 6: `bdho-cotangent` lines 4599–4600 (Theorem I's list), 4935 (Proposition 6.29), 5037 (6.31), 5059 (6.33), 5063 (6.34, `n ≥ 3`), 5073 (Lemma 6.35, odd `n ≥ 3`, torsion), 5156 (6.36). No locator is flagged unverified.
- Seeded sample in the changed passages: 4.2a and 4.3 (rows 1–5); the other sampled targets are untouched.
- Cross-roadmap citations resolved, 3: the open DGFloer revision's numbering note (its README lines 197–199) cites DGFloerPartII §§4.1, 4.2, 4.3, 4.4, 4.5, 4.6; `roadmaps resolve` on that README reports none unresolved, so the run-in labels 4.4, 4.2b and 4.2c still resolve. GeneralizedCohomology G4.0b is on main (its README line 939): the `overlaps.md` lead is a false positive, as before.
- The labels `4.2a` and `4.3` now each name both a heading spanning several parts and the first of those parts; every citation of them in the README and `Suggested.lean` was read (62 lines) and none becomes wrong. A remark, no change asked.
- Gate, run on this head with the brief's command: every check 0, `OK`. Dependency check: `depcheck: 243 roadmaps, 2235 edges, 0 problem(s)`.
- `lake env lean` on `Suggested.lean`: exit 0, 27 diagnostics, all "declaration uses `sorry`".
- `git diff --stat origin/main...HEAD` outside the folder: empty. `git diff 43d9b63..HEAD`: `README.md` only, 25 lines.
- Title and description against the head: the roadmap is added, not on main (2829 insertions); the Layer 1–4 bullets, the `Suggested.lean` list (33 declarations) and the not-statable list match the README and the module docstring; the `roadmap-summary` block agrees; only R02 fails.

Overlap check: read DGFloer (main and its open revision), HomotopySpheres, AlgebraicTopology; the changed passages add no object. Theorem B, the Layer 11 applications and the carriers move here by the open DGFloer revision's numbering note (owner after it merges: this roadmap); stable `O`/`SO` and real Bott periodicity are also in HomotopySpheres Layer 4 on main, which the merge rules bar as a supplier (see the last section).

Source independence: changed passages only; 2 added paragraphs and 2 headings compared with 1 source (`bdho-cotangent` lines 4599–4600, 5037, 5063, 5073), longest shared run 7 words, a standard phrase ("compact connected Lie groups other than tori"); no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Nothing in the changed passages. The texts the previous review lists as outside the cache (Milnor, Bott 1959, Ziller and the others) bear on no changed passage.

## Source issues

- none

## For the human reviewers

- **Scope/ownership.** HomotopySpheres on main (its README lines 41, 1497–1646) plans stable `O`/`SO` and real Bott periodicity; this roadmap's 4.2a–4.2c plan them again, and the project's rules bar HomotopySpheres as a supplier.
- The previous report carried no bullets in this section to write again.
