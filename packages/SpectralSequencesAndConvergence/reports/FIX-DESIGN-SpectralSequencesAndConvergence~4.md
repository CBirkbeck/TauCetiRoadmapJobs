# Repair round 4 of the SpectralSequencesAndConvergence design

Review settled: REV-DESIGN-SpectralSequencesAndConvergence~3 (two findings, both P3). Files edited:
`packages/SpectralSequencesAndConvergence/design/README.md` and
`packages/SpectralSequencesAndConvergence/design/plan.json`. `sources.toml` is unchanged (no new
source is cited). The review's `review.json` was not present in the package; the verdict was read
from the review report.

## REV-DESIGN-SpectralSequencesAndConvergence~3/F01 (P3) — applied

2.1's bullet drops "and along the page shift of 6.1, which changes `e` by the shift". New 6.1
bullet: `(fil, deg, e)` for `E` gives `(fil, deg, e − k)` for the shift by `k`, with a sign
Check. 6.1 *Needs:* and plan 6.1 add 2.1 (plus api, test); plan 2.1 `transport` keeps
isomorphisms; Layer 6 Dependencies add Layer 2.

Verified before editing: the page shift is constructed only in 6.1, and plan 2.1 has no
`target:6.1`, so the bullet could not be proved in Layer 2. The sign: page `r` of the shift has
shape `c (r + k)`, so a relation raises `fil` by `(r + k) − e = r − (e − k)`; injectivity and
`deg` are untouched.

## REV-DESIGN-SpectralSequencesAndConvergence~3/F02 (P3) — applied differently

7.2 *Needs:* adds "1.2 and Mathlib `IsArtinianObject` for the cycle-tower bullet"; the sentence
"The tower of 7.4 below then has `RE_∞ = 0`" is deleted (7.4's third Check keeps it); plan 7.2
adds `target:1.2`, `mathlib:CategoryTheory.IsArtinianObject` and an api entry. The bullet now
assumes an Artinian first-page object, not finite length, and gets `lim¹ = 0` from 7.1.

Why it differs: the requested edits are made as asked. The bullet's argument only uses that the
antitone chain `Z_r(pq)` inside `(E.page r₀).X pq` stabilises. That is the descending chain
condition, Mathlib `CategoryTheory.IsArtinianObject`
(`Mathlib/CategoryTheory/Subobject/ArtinianObject.lean` line 55; the chain lemma
`antitone_chain_condition_of_isArtinianObject` at line 70), and finite length is a special case.
The old "Under these hypotheses" did not say what the hypotheses were needed for: the
Mittag–Leffler property needs none of them. `lim¹ = 0` follows from 7.1 alone, because the tower
is constant on a cofinal subsequence. The Mathlib contract gains one bullet for the two names.

## The same pattern elsewhere

The search covered every `### k.n` section and every `plan.json` statement, api entry and test. A
script listed every section number and every notion owned by another target (convergence 3.2,
limit page 1.4, regularity 1.3, filtration predicates 3.1, towers 1.2, lim¹ 7.1, Mittag–Leffler
7.2, assignments 2.1). Each hit outside the transitive `target:` closure was then read by hand.
Repaired (each a statement or API bullet that uses a target its *Needs:* line does not reach):

- 2.2: the first-quadrant bullet states `E_r^{p,q} = E_∞^{p,q}`, which is 1.4's limit page.
  *Needs:* adds "1.4 for the first-quadrant bullet"; plan 2.2 adds `target:1.4`.
- 4.5: the bullet "the edge morphisms and five-term sequence of 3.6 apply to every first-quadrant
  spectral object" uses 3.6. *Needs:* adds "3.6 for the edge-morphism bullet"; plan 4.5 adds
  `target:3.6` and the matching api entry `firstQuadrant_edgeMorphisms`, which was missing.
- 5.2: the statement "converges weakly at `(p, n − p)` if and only if …" uses 3.2. *Needs:* and
  plan 5.2 add 3.2.
- 5.4: the statement "converges strongly in degrees `I`" uses 3.2. *Needs:* and plan 5.4 add 3.2.

None of these creates a cycle: 1.4 needs 1.2 and 1.3; 3.6 needs 2.2, 3.2 and 3.4; 3.2 needs 1.4,
2.1 and 3.1. Layer Dependencies already listed Layer 1 for Layer 2, Layers 1–3 for Layer 4 and
Layers 1–4 for Layer 5. Afterwards, a script compared every README *Needs:* line with its plan
`target:` prerequisites, and all 31 agree.

Read and left unchanged, because none of them is something a target needs to be stated or proved:

- 3.1's "The characterisation of completeness through lim¹ is in 7.1" is a pointer. Round 2's
  repair placed it there and the review accepted it.
- 4.1's third Check ends "4.3 says when they agree", and 4.3 says its comparison "is used in
  4.4". Both point readers elsewhere.
- Some Checks compare with or reuse examples from other sections: 2.2 (the complex of 1.4), 6.3
  (the filtration of 4.2), 7.5 (reduces to 5.3), and 1.4's filtered-complex Check, whose
  spectral sequence is Tau Ceti's `CochainComplex.spectralSequence` at the pin. Checks are not on
  *Needs:* lines.
- 7.1's Check calls the zero-transition tower Mittag–Leffler. That is the standard notion (stacks-012K
  line 3715–3735, Definition 31.2), not a construction of 7.2.
- 5.4's "bounded below on `K^n`" is the filtration condition defined in its own sentence, not
  2.2's notion.
- The remaining hits were source locators ("remark after 5.2.6", "boardman1999 3.4(b)").

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1 transport along isomorphisms | `φ : E ≅ E′` in the same `SpectralSequence C c r₀`; `E = 0` | the defining conditions mention only `κ`, `c` and `r₀`, which `E` and `E′` share, so `(fil, deg, e)` is an assignment for both; for `E = 0` every assignment of the shape is one | holds | shift clause moved to 6.1 |
| 6.1 shifted offset `e − k` | `k = 0`; `k = 1` on `coreE₂Cohomological`, classical; `k = −1`, E₂ assignment; `k = 2` on `coreE₂HomologicalNat` | `k = 0`: unchanged. `k = 1`: page `r` is native `r + 1`, `(p, q) → (p + r + 1, q − r)`, `fil = −q − 1` rises by `r`, so `e = 1 ↦ 0`. `k = −1`: native `r − 1`, `(p, q) → (p + r − 1, q + 2 − r)`, `fil = p` rises by `r − 1`, so `e = 0 ↦ 1`. `k = 2`: `(p, q) → (p − r − 2, q + r + 1)`, `fil = −p` rises by `r + 2`, so `e = 0 ↦ −2`. In all four, `(fil, deg)` and injectivity are unchanged | holds | new bullet |
| 6.1 wrong model `e + k` (new Check) | `k = 1`, classical | predicts a rise of `r − 2` against the computed `r` | refuted as the Check says | new Check |
| 6.1 start page | shift of `coreE₂Cohomological` (`r₀ = 2`) by `1` | starts at `r₀ − k = 1`, as the couple's spectral sequence in 6.1 does; 6.3's couple degree `(2, −1) + (r − 1)(1, −1) = (r + 1, −r)` matches `(p + r + 1, q − r)` | consistent | none |
| 7.2 cycle tower, Artinian | `ℤ/4` at a position; Prüfer group `ℤ/ℓ^∞` (Artinian, not of finite length); zero object; `ℤ` in the 1.4 complex | `ℤ/4`: `Z_r ∈ {ℤ/4, 2ℤ/4, 0}`, constant from some `r`. `ℤ/ℓ^∞`: every proper subgroup is finite cyclic, so a descending chain stabilises. Zero object: `Z_r = 0` for all `r`. `ℤ`: `Z_r(0,0) = ℓ^{r−1}ℤ` never stabilises and `lim¹ = ℤ_ℓ/ℤ ≠ 0` (7.1 Check), the negative control | holds; finite length is the special case | bullet generalised |
| 7.2 `lim¹ = 0` of the cycle tower | constant from `N` | the cofinal subsequence `n ≥ N` has isomorphisms as transitions, so it is isomorphic to a constant tower with identities; `lim¹ = 0` (7.1 Check, constant tower) and cofinal invariance (7.1) | holds with countable products only | routed through 7.1 |
| 7.4 third Check (unchanged) | finite-length first page | finite length ⇒ Artinian ⇒ 7.2's bullet; `RE_∞ = lim¹_r Z_r = 0` | consistent | none |
| 2.2 first-quadrant bullet with 1.4 | `(1, 0)`, `r = 2` | leaving target `q = 1 − r < 0`, entering source `p = 1 − r < 0`: stabilises from `2`, and 1.4's limit-page isomorphism at a stabilising position gives `E_2^{1,0} ≅ E_∞^{1,0}` | holds | *Needs:* +1.4 |
| 4.5 edge-morphism bullet with 3.6 | first quadrant, only row `q = 0` nonzero | 4.5 gives strong convergence in degrees `1, 2`; five-term `0 → E_2^{1,0} → H^1 → E_2^{0,1} = 0 → E_2^{2,0} → H^2`, so `H^1 = E_2^{1,0}` and `E_2^{2,0} ↪ H^2`, which 3.6 predicts | holds | *Needs:* +3.6 |
| 5.2 weak convergence with 3.2 | non-exhaustive complex of 4.3, `(0, 0)` | `gr^0 H^0 = 0`, a proper subquotient of `E_∞^{0,0} = ℤ`; the Stacks inclusions are strict, so 3.2's weak convergence fails | consistent | *Needs:* +3.2 |
| 5.4 strong convergence with 3.2 | `ℓ`-adic `ℤ` in degree `0` | exhaustive, not bounded below, `F^pK^0 = ℓ^pℤ ≠ 0`: the hypothesis fails and 3.2's strong convergence fails (not complete) | consistent | *Needs:* +3.2 |

## Checks

Dependency check (verbatim):

    candidate: SpectralSequencesAndConvergence is not in the merge order yet; checked as if placed after StableHomotopyKTheory (the intake inserts it when its design is accepted)
    depcheck: 235 roadmaps, 2123 edges, 0 problem(s)

No UPWARD or CYCLE line.

`roadmaps resolve` on the README found no unresolved cross-roadmap citations and no unresolved
Lean names. It did not check library names ("no pinned Lake packages on this host"), so the two
new Mathlib names were read by hand at the pin: `CategoryTheory.IsArtinianObject` at
`Mathlib/CategoryTheory/Subobject/ArtinianObject.lean` line 55 (an abbreviation for
`WellFoundedLT (Subobject X)`, with no length function or Noetherian condition in it) and
`CategoryTheory.antitone_chain_condition_of_isArtinianObject` at line 70.

Other mechanical checks: `plan.json` parses; it was rewritten in its original format (indent 1,
no trailing newline). No README line is over 100 characters. All 31 README *Needs:* lines agree
with the plan's `target:` prerequisites. The README gained no backticked names of this roadmap's
own. No `Suggested.lean` exists at the design stage, so there was no elaboration and no `#check`
comparison.

Ownership: the edits add no new object. A `roadmaps grep` for "page shift" and `IsArtinianObject`
on main and the 437 indexed open heads found no second owner. The only hit was
EtaleDualityAndPerverseSheaves, which consumes Mathlib's `IsArtinianObject` and owns nothing here.

Sources: no new source was needed and `needs-references.toml` was not written.

## For the maintainer

- No id that other roadmaps cite changed: section numbers, headings and target names are the
  same. `plan.json` has three new api names (`pageShift_bidegreeAssignment` in 6.1,
  `firstQuadrant_edgeMorphisms` in 4.5, `cycleTower_isMittagLeffler_of_isArtinianObject` in 7.2)
  and one new test (`shift_offset_sign` in 6.1). None of them appears in the README as a
  backticked name.
- No passage of the review asked for anything outside this package. It held no instructions to
  act on.
