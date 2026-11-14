# FIX-RT-SpectralSequencesAndConvergence~1

Repair of red-team round 1 (passes a and b) of `packages/SpectralSequencesAndConvergence/`.
Nine findings were checked against the cached sources, the pinned Mathlib and Tau Ceti, and the
roadmap's own definitions. All nine hold. Eight are applied as proposed or with small corrections
(given below); one (1a/F04) is applied with the same defect also repaired at one more place.
No finding overlaps another.

## RT-SpectralSequencesAndConvergence~1a/F01 (P3) — applied

The witness holds: a constant family is both monotone and antitone, and the zero spectral object
has `abutmentFiltration p n = 0` for every `p`. 5.1's third Check, "not allowed: it is not
monotone", becomes a computed witness: for the stupid filtration of `ℤ →(×2) ℤ`, `F^0 = K ⊄ F^1 = K^1`.
It now adds that a family both monotone and antitone on `ℤ` is constant, and then the two indexings agree.
4.2's second Check, "an increasing family … not a decreasing filtration", becomes the witness that
`abutmentFiltration p 1` is `0` at `p = −2` and `ℤ/2` at `p = −1`, and that the reindexing puts
the graded piece at `p = 3`; it notes that the zero object cannot tell the two apart. I searched
the README for other universal negative claims of this kind ("not allowed", "not monotone",
"increasing family"): there are none.

## RT-SpectralSequencesAndConvergence~1a/F02 (P2) — applied

The finding holds. §2.3 is a statable general theorem: its carriers are Mathlib's `SpectralSequence`,
`ObjectProperty` classes and `Finset`, plus this file's `BidegreeAssignment`. The Lean section
"Layer 2: … Euler characteristics of pages" stated nothing for it. Added
`sum_negOnePow_page_eq_sum_negOnePow_page_add_one` to Layer 2 of `Suggested.lean`, with a
docstring bullet, and the name in README 2.3 and in 5.3's Euler route. Two changes from the
proposed text. (i) The conclusion "page `r + 1` lies in `P`" is stated for `pq ∈ s`, mirroring the
hypothesis; outside `s` the second conjunct already gives zero. (ii) The redundant binder
`hr' : r₀ ≤ r + 1` is dropped: Mathlib's `SpectralSequence.page` fills it by its `lia`
autoparameter. README 2.3 now states the sums over `s`, matching the Lean statement.

## RT-SpectralSequencesAndConvergence~1a/F03 (P3) — applied

The finding holds. The canonical sequence `0 → lim¹_s Q^s → lim¹_s A^s → lim_s RQ^s → 0` needs
several constructions: the bi-indexed image system `Im^r A^s` as a functor, the towers `Q^s` and
`RQ^s` with their transitions, and Boardman's map `lim¹_s A^s → lim_s RQ^s`, which goes through
cofinality of `lim¹`. None of these exists at the pins for an abelian category. Tau Ceti's
cofinality results for `lim¹` (`TauCeti/Algebra/Category/ModuleCat/Tower/Subsequence/LimOne.lean`)
cover module towers only, and `towerDifference` handles a single tower. Added a bullet to the
module docstring's list of headlines that cannot be stated, saying exactly this. Nothing is stated
in its place.

## RT-SpectralSequencesAndConvergence~1a/F04 (P3) — applied

Both Checks were non-discriminating. 1.3's "all differentials zero degenerates at `r₀`" is replaced
by the reviewer's example: `ℤ/2` at `(0, 1)` and `(2, 0)` from page 1, with `d_1 = 0` and
`d_2 = id`. This gives `E_2 = E_1` and `E_3 = 0`, so the sequence does not degenerate at 1 or 2
and does degenerate at 3. It rejects the model "degenerate at `s` iff the page-`s` differentials
vanish". 4.4's "With `I = ∅` there is nothing to prove" is replaced as proposed: `ℤ[0]` with
`G_j = 0` has bounds `a = b = 0` in degree 1 but none in degree 0, so it converges on `{1}` and not
on `{0, 1}`.

The same defect also occurred in 3.5, whose first Check was the bare phrase "The identity
morphism.". It is replaced by a computed Check. With `E_∞ = ℤ/2` at `(0, n)` and `(1, n − 1)`,
there is no morphism `(id, h)` from the `ℤ/4` structure to the `ℤ/2 ⊕ ℤ/2` structure, because
`2h(1) = 0` forces `gr^1(h) = 0`. The 3.3 instances are covered under 1b/F04. In 4.6 the
identity/zero Checks test that the induced morphism is functorial, and 4.6 already has two
discriminating Checks, so they were left alone.

## RT-SpectralSequencesAndConvergence~1b/F01 (P2) — applied

The finding holds. The summary names 5.3 (Stacks Lemma 24.13 for filtered complexes) as an end
theorem. Its carriers are at the pins, yet `Suggested.lean` neither stated it nor named it.
Added `hasConvergenceBounds_spectralObject_filtrationFunctor` to Layer 5. The reviewer's name
`…_filtration` was changed to `…_filtrationFunctor` to follow the term
`spectralObject (filtrationFunctor F hF)`; the statement is as proposed. Its hypotheses on
`H^n(F i)` and `H^{n+1}(F i)` for `i ≤ a`, and on `H^n(F j) → H^n(K)` for `j ≥ b`, give
`HasConvergenceBounds`, so `convergence_of_hasConvergenceBounds` applies. It does not follow in one
tactic: it needs `spectralObjectHIsoCokernel` at `⊥ ≤ i`, the cokernel of the zero map out of
`G_⊥ = 0`, and the naturality lemma for the map to `⊤`. README 5.3 gained the "against the pins"
sentence, the route, and the dictionary `a = −p₀`, `b = −p₁`. Its `*Needs:*` line now lists
`CochainComplex.spectralObject_H_map_comp_spectralObjectHIsoCokernel_hom`. The module docstring
gained a bullet.

## RT-SpectralSequencesAndConvergence~1b/F02 (P3) — applied

Confirmed at the pin: `EInfty` is declared at `TauCeti/Algebra/Homology/SpectralObject/Stabilization.lean:45`,
and `EInftyIsoCokernel` at `Abutment.lean:92`. In the Tau Ceti contract, `EInfty` moved from the
`Abutment.lean` list to the `Stabilization.lean` list. No other place in the README names that file.

## RT-SpectralSequencesAndConvergence~1b/F03 (P3) — applied

Confirmed: `CochainComplex.spectralObjectHIsoCokernel` is declared at
`TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:224`. Its type is
`H^n(f) ≅ (cokernel (F.map f)).homology n` for `F.map f` mono. It is now in the filtered-complex
contract bullet, together with
`CochainComplex.spectralObject_H_map_comp_spectralObjectHIsoCokernel_hom` (same file, line 241),
which the 1b/F01 route also uses.

## RT-SpectralSequencesAndConvergence~1b/F04 (P3) — applied

The finding holds: "the identity is a morphism" and "`(0, 0)` is a morphism" hold for any notion of
morphism, even without compatibility with `β`. They are replaced by the reviewer's two Checks,
recomputed:

- `f = ×2` on the `ℓ`-adic structure. `gr^p(u) = u mod ℓ`, so `(f, 2)` and `(f, 2 + ℓ)` are
  morphisms and `(f, 3)` is not, for every `ℓ`; at `ℓ = 2` this reads `0, 0` versus `1`. This
  shows the forgetful functor is not faithful.
- The zero sequence with the constant filtration of `ℤ`: every `(0, u)` is a morphism.

The `−1` Check is kept.

## RT-SpectralSequencesAndConvergence~1b/F05 (P3) — applied

Verified: helle-rognes2024 line 94 heads Definition 2.7 with "[4, XV.2], [1, 5.2]", and line 1027
identifies [4] as Cartan–Eilenberg. 3.2 now cites cartan-eilenberg1956 Ch. XV §2 (uncertified)
as the attribution of helle-rognes2024 Definition 2.7. In the References, the cartan-eilenberg1956
entry now reads Ch. XV §2 and the mccleary2001 entry reads Ch. 2. In `sources.toml`,
cartan-eilenberg1956 now has `locator = "Ch. XV §2"`, `cited_for = ["3.2"]` and a version note
naming the attribution; mccleary2001 has `locator = "Ch. 2"`, `cited_for = ["3.6"]`. Both remain
`uncertified`, settled, and were not requested again.

## Adversarial pass on new and changed statements

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `sum_negOnePow_page_eq_sum_negOnePow_page_add_one` | `s = ∅` | page `r` all zero ⇒ page `r + 1` all zero; sums `0 = 0` | holds |
| same | `E_2^{0,1} = ℤ/4 ↠ E_2^{2,0} = ℤ/2`, length | deg `1, 2`; page 2: `−2 + 1 = −1`; page 3: `E^{0,1} = ℤ/2`, `E^{2,0} = 0`: `−1 + 0 = −1` | holds |
| same, wrong sign `(−1)^{fil}` | same | page 2: `2 + 1 = 3`; page 3: `1 + 0 = 1`; `3 ≠ 1` | deg sign needed |
| same, `hv` | `finrank` on `0 → k → k^(ℕ) → k^(ℕ) → 0`, `P` everything | `0 ≠ 1 + 0`: `hv` fails, theorem not applicable | hypothesis real |
| same, truth | regrouping by `deg` | `prev`/`next` unique, so the strands meet each degree once; `H(⊕ strands) = ⊕ H`; `v(0) = 0` and iso invariance follow from `hv` (`Z → Z → Z`, `Z → X ≅ Y`) | holds |
| same, context | no `variable` block | all 13 binders present in `#check` | holds |
| `hasConvergenceBounds_spectralObject_filtrationFunctor` | `K₂ = ℤ →(×2) ℤ`, `G` (`0`, `K^1`, `K` at `t ≤ −2`, `−1`, `≥ 0`), `n = 1`, `a = −2`, `b = 0` | `H^1(G_i) = H^2(G_i) = 0` for `i ≤ −2`; `H^1(G_j) = ℤ/2 → ℤ/2` identity for `j ≥ 0` | bounds hold (4.4 first Check) |
| same | `K₂`, `b = −1` | `H^1(G_{−1}) = ℤ → ℤ/2` not iso | hypothesis fails, as 4.4 requires |
| same | `K₂`, `a = −1` | `H^1(G_{−1}) = ℤ ≠ 0` | hypothesis fails |
| same | `K = ℤ[0]`, `G ≡ 0`, `n = 0` vs `n = 1` | `0 → ℤ` not iso; `0 → 0` iso, `H^1 = H^2 = 0` | fails in degree 0, holds in degree 1 |
| same | `K = 0` | all hypotheses and conclusion hold | holds |
| same, truth | `f : ⊥ ⟶ i` | `F.map f : 0 ⟶ G_i` mono (Tau Ceti instance), `coker ≅ G_i`; `(F j).arrow = ofLE ≫ ⊤.arrow`, `⊤.arrow` iso | holds |
| 1.3 new Check | `ℤ/2` at `(0,1)`, `(2,0)`, `d_2 = id` | `d_1` targets `(1,1)`, `(3,0)`: zero; `E_3 = 0` | degenerates at 3, not 1 or 2 |
| 3.3 new Checks | `ℓ = 2, 3`; `u = 2, 2 + ℓ, 3` | `ℓ = 2`: `0, 0, 1` vs `E_∞(f) = 0`; `ℓ = 3`: `2, 2, 0` vs `2` | `(f, 3)` excluded |
| 3.3 zero/constant | `u ∈ ℤ` arbitrary | every `gr = 0` | every `(0, u)` a morphism |
| 3.5 new Check | `h(1) = (x, y)` | `h(2) = (2x, 2y) = 0`; `gr^1(h) = 0` | no morphism `(id, h)` |
| 4.2 new Check | `K₂`, degree 1 | `abutmentFiltration (−2) 1 = 0`, `(−1) 1 = ℤ/2`; `ℤ/2 ⊄ 0` | unreindexed not decreasing |
| 4.4 new Check | `ℤ[0]`, `G ≡ 0`, `I = {1}`, `{0, 1}` | degree 1 bounds `0, 0`, all pages and `H^1` zero; degree 0 `0 → ℤ` | degreewise |
| 5.1 new Check | stupid filtration of `K₂` | `F^0` degree 0 term `ℤ`, `F^1` degree 0 term `0` | not monotone; constant families both ways |

## Checks run

- **Elaboration.** `lake env lean packages/SpectralSequencesAndConvergence/Suggested.lean`, run
  from the content checkout, exits 0. Output: ten `declaration uses 'sorry'` warnings, at lines 113,
  125, 139, 187, 212, 230, 248, 278, 304 and 324: the eight earlier theorems and the two new ones.
  There are no errors and no other warnings. No `TauCeti.*` module needed building. The file is 329
  lines.
- **Signatures.** One scratch file ran `#check @name` on all 13 declarations (1 structure,
  2 definitions, 10 theorems) and was elaborated once. Every elaborated type carries the binders
  of its README statement. There is no `variable` block, so no binder was lost; the two new
  declarations show every hypothesis named in README 2.3 and 5.3. Nothing in the existing
  declarations changed.
- **Dependency check** (`gate --depcheck … --movable`):

  ```text
  depcheck: 242 roadmaps, 2194 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Citations** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name is
  found nowhere.
- **Name collisions.** `roadmaps grep` finds neither new name on main or in any open roadmap pull
  request, and neither appears in the pinned Mathlib or Tau Ceti.

## Ownership

Both new theorems sit in sections this roadmap already owns: "the Euler characteristic of pages"
(Scope, second item) and the cohomologically bounded convergence of filtered complexes in an
abelian category (Scope, fourth item). I searched the roadmaps on main and the open roadmap pull
requests by object: page Euler identities, and "Lemma 24.13" / "0BK5". No other owner turned up.
ExponentialSumsAndCircleMethodPartII applies Lemma 24.13 to a finite filtration of a scheme, which
makes it a consumer. DGFloer Layer 1 item 3 keeps the module-complex statements, as Scope already
records. No supplier gap was added; `design/plan.json` is unchanged.

## For the maintainer

- New Lean names that other roadmaps may cite:
  `TauCetiRoadmap.SpectralSequencesAndConvergence.sum_negOnePow_page_eq_sum_negOnePow_page_add_one`
  and `TauCetiRoadmap.SpectralSequencesAndConvergence.hasConvergenceBounds_spectralObject_filtrationFunctor`.
  No name, section or layer number was removed or renumbered.
- `cartan-eilenberg1956` and `mccleary2001` keep their keys; only their locators and `cited_for`
  changed.
- No text in the reviews or fetched material asked for anything outside this job.
