# Review of DGFloerPartII (pull request #1799 at ba8a414)

**Verdict:** needs changes

This is an incremental re-review of the 10 changed lines since 0cb1f18. The only change is the 4.3
Check at `TauCetiRoadmap/DGFloerPartII/README.md` lines 1654–1663. `Suggested.lean` and
`metadata.toml` are unchanged, nothing outside the folder changed, and the pull request
description is the same as at 0cb1f18.

- **Gate.** The gate passes, with the build, against the brief's moved order. The dependency check
  reports 0 problems. The build prints exactly 24 `sorry` warnings and nothing else.
- **Repairs.** R04 of the previous review is repaired. The sentence it added is correct
  mathematics, and the computed rows are below.
- **Carried.** R01–R03 below are the previous review's three description findings. The
  description has not changed, so none of them is repaired. The README needs no change for any of
  them.

## R01 (P2) — Not repaired: main's DGFloer still owns Theorem B and the §§6.3–6.4 and §7 material, and the description does not put #1798 first

This carries the previous review's R01 (first raised two reviews earlier).

**Location.**

- README lines 41–43: "The base roadmap, cited as **DGFloer** by layer and item, owns every
  other numbered statement of the source".
- The description's merge-order paragraph ends "#1742 (GeneralAlgebraicKTheoryPartII) → **this
  pull request** (#1799)".

**Claim.** This roadmap is the single owner of Theorem B, §§6.3–6.4, §7 and their carriers.

**Witness.** On main (a94a93cf), the DGFloer folder is unchanged since 6aa0bc9c. Its README still
holds Layer 1 items 7–8 (lines 834, 841), Layer 5 item 7 (line 1053) and Layer 10 item 5's
"Multiple realization and Theorem5.14/TheoremB" (line 1567), and its Layer 11 heading (line 1577)
covers abundance and Theorem G.

**Repair.** The README needs no change. Add this to the description's merge-order paragraph:

> #1798 (DGFloer) merges before this pull request or together with it. It moves the source's
> Theorem B, §§6.3–6.4 and §7, and the homogeneous carriers, explicit degree computations and
> projective loop-space computations they rest on, out of DGFloer's Layers 1, 5, 10 and 11 and
> into this roadmap. Every DGFloer id this README cites resolves on main and at #1798.

**Tested.** At #1798's head (7d8ad276), lines 50–54 of its README hand this material to
DGFloerPartII, and line 4241 lists what DGFloerPartII consumes.

## R02 (P3) — Not repaired: TopologicalKTheory #1807 still consumes 4.2a–4.2b in T1.6, and the description does not order it

This carries the previous review's R02.

**Location.**

- README lines 1935–1941: "It cannot consume 4.2a–4.2c in T1.5–T1.6 or in T2's `K` and `KO`
  groups"; TopologicalKTheory may consume them in T7 only.
- The description's merge-order paragraph does not name #1807.

**Witness.** At #1807's head (index of 14:22), `TopologicalKTheory/README.md` line 499, in T1.6a,
reads "equivalent to DGFloerPartII 4.2a's stable `O`". Line 824, in T1.6d, reads "comparison with
DGFloerPartII 4.2b's Grassmannian member Ω₇".

**Repair.** The README needs no change. Add this to the merge-order paragraph:

> #1807 (TopologicalKTheory, with its other roadmaps) merges after this pull request, and only
> once its T1.6a and T1.6d citations of DGFloerPartII 4.2a–4.2b have moved to T7: 4.2a–4.2b
> consume GeneralizedCohomology G4.0b, which consumes TopologicalKTheory T1.5–T1.6.

**Tested.** As #1807 stands, its citations close a cycle: T1.6a (#1807 line 499) → 4.2a →
GeneralizedCohomology G4.0b (README lines 1339 and 1369) → TopologicalKTheory T1.5–T1.6 (README
lines 1940–1941; main's GeneralizedCohomology line 2612).

## R03 (P3) — Not repaired: the description is stale

This carries the previous review's R03.

**Location.** The description says three things that are no longer true:

- "`Suggested.lean` states the rotation family at a fixed pole, the low-rank values of
  `π_(n−1)(SO(n))` and its torsion for odd `n`";
- "HomotopySpheres' James construction and Bott periodicity";
- "TangentialBordism's compact-image embedding".

**Witness.**

- `Suggested.lean` has 0 occurrences of "rotation".
- The folder has 0 occurrences of "HomotopySpheres".
- 3.1 uses TangentialBordism B5 and B6.3 (README lines 1118–1119).
- `Suggested.lean` line 328 states the splitting, which the description does not mention.

**Repair.** Make three changes to the description:

- **Summary.** Replace "HomotopySpheres' James construction and Bott periodicity" with
  "GeneralAlgebraicKTheoryPartII's James construction and Bott–Samelson theorem; real Bott
  periodicity is proved here (4.2a–4.2c)".
- **Layer 3 sentence.** Replace "TangentialBordism's compact-image embedding" with
  "TangentialBordism B5's geometric Pontryagin–Thom and B6.3's rational oriented-bordism
  surjection".
- **Last sentence.** Replace it with:

  > `Suggested.lean` states the compact-generation coreflection and the product criterion of
  > 1.0; Theorem B; the finiteness of the capacity in Theorem I for spheres, manifolds covered by
  > diffeomorphisms, non-aspherical compact Lie groups, `CPᵈ` and `HPᵈ`; the finite-to-stable
  > range and real Bott periodicity of `π_i(SO(n))`; Lemma 6.35's seven low-rank values, its
  > splitting for odd `n ≥ 17` and its torsion for every odd `n`; and Theorem G.

**Tested.** Every name and statement in the replacement is in `Suggested.lean` at this head
(lines 94, 103, 120, 141–224, 256–291, 297–338 and 354; the file is unchanged since 0cb1f18).

## Previous findings

- R01 — not repaired: the description still ends "#1742 (GeneralAlgebraicKTheoryPartII) → **this pull request** (#1799)", with no mention of #1798, while main's DGFloer (6aa0bc9c) keeps Layer 1 items 7–8, Layer 5 item 7, Layer 10 item 5 and Layer 11.
- R02 — not repaired: the description does not name #1807; #1807 lines 499 (T1.6a) and 824 (T1.6d) still cite DGFloerPartII 4.2a and 4.2b.
- R03 — not repaired: the description still says "`Suggested.lean` states the rotation family at a fixed pole" and "HomotopySpheres' James construction and Bott periodicity".
- R04 — repaired: README line 1654 now reads "The splitting formula fails at the parallelizable spheres `S³` and `S⁷`, so the target states it only in the range of its source", and lines 1658–1662 explain why and record agreement at `n = 5, 9, 11, 13, 15`.

The board has no repair report for ba8a414. No finding was marked "not actionable in this package".

## Verified sound

### Gate, dependency check and order

The push gate on this head, with `--build` and `--order merge-order-moved.txt`:

    gate DGFloerPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK

The brief's dependency check (`--movable`, the moved order, `--content`):

    depcheck: 235 roadmaps, 2258 edges, 0 problem(s)

The same gate run against the configured order instead of the moved one reports
`UPWARD: DGFloerPartII (#46) -> GeneralAlgebraicKTheoryPartII (#335)`. That order lists this
roadmap above its last open supplier. The moved order has GeneralAlgebraicKTheoryPartII at line
334, this roadmap at line 335 and TangentialBordism at line 14, so this is the "moved" case the
brief excludes, not a defect.

Other order checks:

- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder holds exactly `README.md`, `Suggested.lean` and `metadata.toml`.
- The pins are Mathlib 1b1ccf4b and Tau Ceti 2fd255d9.
- The citation and overlap tools report nothing for this README: no dropped ids, no other pull
  request changing it.

### Build

`lake env lean TauCetiRoadmap/DGFloerPartII/Suggested.lean` exits 0 with 24 messages, all
"declaration uses `sorry`". They are at lines 94, 103, 120, 141, 156, 174, 204, 217, 256, 263,
270, 276, 283, 289, 297, 300, 303, 307, 311, 315, 319, 328, 337 and 354, the same as at 0cb1f18.

The file is unchanged, so the comparison of its signatures with the README carries over from the
previous review. The changed Check names no Lean declaration and introduces no backticked name of
this roadmap's own.

### The changed passage (4.3 Check, README lines 1654–1663)

- **Source agreement.**
  - `bdho-cotangent` line 5073 (Lemma 6.35, printed p. 117) is stated for odd `n ≥ 3`.
  - Lines 5078–5079 state the splitting for `n ≥ 16`. Lines 5083–5089 give Bott's table, line
    5092 gives `π_n(V_(n+2,2)) = ℤ/2` for odd `n`, and lines 5093–5094 conclude for `n ≥ 17`.
  - The README's range "`n ≥ 17` (`n ≥ 16` and odd)" matches.
  - The proofs of Proposition 6.34 (lines 5095–5139) use only the torsion statement, as 4.3
    says.
- **Crowley–Schick–Steimle.** `css-derivative` line 222, inside the proof of Lemma 2.2 (from line
  214), says the stabilization `π₈SO₉ → π₈SO = ℤ/2` is split with kernel `ℤ/2`. Lines 253–255
  give a class of `TS⁹` that is nonzero unstably and zero stably. This agrees with the new
  sentence at `n = 9`, where `S⁹` is not parallelizable.
- **Notation.** `∂[Id_(Sⁿ)]` denotes the clutching class whichever connecting map `∂` is read:
  - the boundary of `SO(n) → SO(n+1) → Sⁿ` applied to `[Id]`;
  - the named connecting map applied to the class of the fibre `Sⁿ ⊂ V_(n+2,2)`.

  Naturality makes these equal, and the Check identifies the class by name.
- **House style.** The passage has no LaTeX, process word, pull-request number or new locator.
  The gate's text scanners agree.

### Adversarial table

New rows, for the changed Check:

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 4.3 Check: the formula fails at `S³`, `S⁷` | `n = 3`, `n = 7` | `n = 3`: `π₃(V_(5,2)) = ℤ/2` (the map `π₄(S⁴) → π₃(S³)` is multiplication by `χ(S⁴) = 2`), `π₂(O) = 0`, formula `0 ⊕ ℤ/2`; actual `π₂(SO(3)) = π₂(S³) = 0`. `n = 7`: `π₇(V_(9,2)) = ℤ/2`, `π₆(O) = 0` (`6 mod 8`), formula `ℤ/2`; actual `π₆(SO(7)) = 0` | fails at both, as stated | none |
| 4.3 Check: the connecting map of `SO(n) → SO(n+2) → V_(n+2,2)` | odd `n ≥ 3`; inclusion of `SO(n) → SO(n+1) → Sⁿ`, with `Sⁿ = SO(n+1)/SO(n)` the fibre over `e_(n+2)` | `V_(n+2,2)` is `(n−1)`-connected, so `π_(n−1)(SO(n)) → π_(n−1)(SO(n+2)) = π_(n−1)(O)` is onto, with kernel `im ∂`; `π_n(V_(n+2,2)) = ℤ/2` is generated by the fibre class; naturality gives `∂(fibre class) = ∂'[Id_(Sⁿ)]`, the clutching class of `TSⁿ` | image generated by the clutching class, as stated | none |
| 4.3 Check: `∂` injective exactly when `Sⁿ` is not parallelizable | `n = 3, 5, 7, 9`; `n = 1` | the clutching class is `0` iff `TSⁿ` is trivial (`n ≥ 2`, `SO(n)` connected); among odd `n ≥ 3`, `Sⁿ` is parallelizable exactly for `n = 3, 7`; at `n = 9` the class is nonzero (`css-derivative` 253–255) | as stated; `n = 1` is outside Lemma 6.35's range `n ≥ 3` | none |
| 4.3 Check: agreement at `n = 5, 9, 11, 13, 15` | the five ranks | stable terms `π₄, π₈, π₁₀, π₁₂, π₁₄(O) = 0, ℤ/2, 0, 0, 0` (degrees `4, 0, 2, 4, 6 mod 8`); adding the Stiefel `ℤ/2` gives `ℤ/2`, `(ℤ/2)²`, `ℤ/2`, `ℤ/2`, `ℤ/2`; README lines 1605–1606 give the same values; at `n = 9` the extension splits (`css-derivative` 222) | agree, as stated; injectivity alone would not give a splitting, and the Check claims only agreement | none (R04 repaired) |
| 4.3 Check: the stable term against the Lean carrier | `n = 17` (`k = 14`) | the Check reads the stable term in `SO(n+2)`; `nonempty_pi_SO_mulEquiv_prod_stiefel` reads it in `SO(k+4) = SO(n+1)`; `π₁₆(SO(18)) = π₁₆(SO(19)) = π₁₆(O) = ℤ/2`, since `16 ≤ 18 − 2` | consistent | none |

Rows carried from the review at 0cb1f18, whose statements this diff leaves untouched. Each row
cites the table of that review (PRREVIEW-DGFloerPartII~14). Its row "Splitting below the range"
is replaced by the new rows above.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Theorem B (Lean) | `T^r`; `ℝP³`; `U = ∅`; a point; `S² ⊔ T²` | `π_(ℓ≥2)(T^r) = 0`, so `hQ` is false; `π₃(ℝP³) = ℤ`, so `hQ` holds; `H_n(∅) = 0`, so `hU` is false; disconnected: the hypotheses hold but no contractible orbit exists | true, needs `ConnectedSpace` (present) | none (~14) |
| Theorem B, nonorientable `Q` | closed connected nonorientable | `H_n(Q; ℤ) = 0`, so `hU` is false | orientability implied | none (~14) |
| Theorem B route | `x` of infinite order, `d = Nb` | `d^m x ≠ 0` for every `m` | sound | none (~14) |
| 1.0 coreflection (Lean) | metrizable `Y`; `k(kY)` | `kY = Y`; `k(kY) = kY` | true | none (~14) |
| 1.0 product criterion (Lean) | `ℝ/ℤ₊ × ℚ`; `ℝ/ℤ₊ × [0,1]` | the first is not CG; the second is CG | local compactness needed | none (~14) |
| 1.0 `S^∞` Check | `q_r = (e₀ + e_r/r)/|…|` | closed and discrete in the colimit | as stated | none (~14) |
| 1.2 ring | `n = 2, 3`; `W = S⁰` | `x² ≠ 0` in `H_*(ΩS²)`; `J(S⁰) = ℕ ≠ ΩS¹` | as stated | none (~14) |
| 1.3 dimensions, right lines, metric | `V_(3,2)`, `U(2)`; `v = (1, j)`, `λ = i`; `CP¹` | `3 = dim SO(3)`, `4 = dim U(2)`; `vλ = (i, −k)` is not a left multiple of `v`; area `π` | as stated | none (~14) |
| 1.4 degrees | `n = 1, 2, 3, 4` | `1 + (−1)ⁿ = 0, 2, 0, 2`; `1 + (−1)^(n−1) = 2, 0, 2, 0` | as stated | none (~14) |
| 1.5 collapses | `N = ∅`; framed point; circle in `S³` | degree `0`; `±1`; `Th ν ≃ S³ ∨ S²` | as stated | none (~14) |
| 2.1–2.3 indices and cells | `CPᵈ`, `HPᵈ`, `CP²`, `HP²` | `2d(k−1) + 1`; `2(k−1)(2d+1) + 3`; degrees `0, 1, 4, 5, 8, 9` and `3, 10, 13, 20`; gap `3` | as stated | none (~14) |
| 2.4–2.6 | `CP¹`; `CP²`; `HP¹` | `E_(2,q) → E_(0,q+1)` an isomorphism; `d₂: E_(2,4) → E_(0,5)`; `±g`, `±2g`; `dim Σ_p = 5` | as stated | none (~14) |
| 3.3 sign | `T*ℝ²`, `σ = q₁dq₂` | `Ψ'*ω = ω + dq₁∧dq₂` | as stated | none (~14) |
| 4.1 abundance | point; `T^r`; products | reduced shriek `0`; `Ω²T^r ≃ pt`; `deg(α × [N]) = deg α + dim N` | as stated | none (~14) |
| 4.2 Serre comparison, `n = 3` class | twistor `S² → CP³ → S⁴`; `H₁(Ω²S³)` | `π₃(CP³) = 0`; `H₁ = ℤ` | as stated | none (~14) |
| 4.2a range (Lean) | `(n, i) = (2,0), (2,1), (3,3), (4,3), (1,0)` | surjective but not injective at `i = n − 1`; not surjective at `i = n` | bounds sharp | none (~14) |
| Bott and stable values (Lean) | `(0, 11)`; `j = 1..7` | `π₉(SO(11)) = ℤ/2 = π₁(SO(11))`; `π₃(SO(5)) = π₇(SO(9)) = ℤ` | true; `i = 0` excluded | none (~14) |
| 4.2b–4.2c index bounds and stable members | `m = 1`, `k = 0..8` | `λ = 7, 3, 1, 1, 1, 0`; `Ω₈ = O(m)`; `π₀(Ω_i)` has `2, 1, ℤ, 1, 1, 1, ℤ, 2` elements | as stated | none (~14) |
| Lemma 6.35 values (Lean) | `n = 3, 5, …, 15`; `n = 4` | `0, ℤ/2, 0, (ℤ/2)², ℤ/2, ℤ/2, ℤ/2`; `π₃(SO(4)) = ℤ²` | `Odd` needed | none (~14) |
| Splitting (Lean) | `n = 17, 19, 21, 23, 25` | `(ℤ/2)²`, `ℤ/2`, `ℤ/2`, `ℤ/2`, `(ℤ/2)²` | true in range | none (~14) |
| `π₈(SO(9))` | `css-derivative` 222, 249–252 | `(ℤ/2)²`, not `ℤ/4` | as stated | none (~14) |
| ℓ-covered and Lie group (Lean) | `ℓ = 0`; `T^r`; `S³`; `SU(2)` | `hℓ` excludes `ℓ = 0`; `hM` false on tori; `π₃ ≠ 0` | true | none (~14) |
| Capacity (Lean), metric independence | `CP⁰`; `S⁰`; `S¹`; `λW` | `0 < ⊤`; `∞`; `∞`; `c°(λW) = λc°(W)` | `2 ≤ n` needed | none (~14) |
| 4.4 `ℝP²` | `diag(A, −1)`, `det A = −1` | `χ = −1`, coorientation `−1` | as stated | none (~14) |
| 4.6 degrees, Lemma 7.7, Theorem G (Lean), bound Check | `k = 2, 3, 4`; `(m+1)`-connected `Y`; `S² × S⁴`; `k = n` | `3, 4, 9`; fibre inclusion an isomorphism on `H_i`, `i ≤ m`; `d ≠ 0` needed; `n − k ≥ ℓ + 1` | as stated | none (~14) |
| Downstream bullet | #1807 head | T1.6a → 4.2a → G4.0b → T1.5–T1.6 | a cycle unless reordered | R02 |

### Seeded source sample

Only 4.3 falls in the changed passage. I checked it again: `bdho-cotangent` lines 5073–5094
(Lemma 6.35, printed p. 117) and 5095–5139 (both proofs of Proposition 6.34), and
`css-derivative` lines 214–223 and 248–256. The locators and hypotheses are as stated, with
`π₈(SO(9))` corrected.

The other sampled targets lie outside the diff: 1.1, 1.2, 1.4, 1.5, 2.1, 2.3, 3.1, 3.2, 3.3, 4.2,
4.2a, 4.2b, 4.2c and 4.6. Their checks carry over from the sample table of the review at 0cb1f18.

### Citations and ownership

- **#1798 (DGFloer, 7d8ad276).** README lines 50–54 and 4241 are as R01 says.
- **#1807 (TopologicalKTheory).** README lines 191, 499, 824, 1505, 1525, 1537, 1576 and 1626 cite
  this roadmap. Only lines 499 and 824 fall before T7 (R02).
- **Who cites this roadmap.** Nothing on main cites it.
- **Ownership.** The changed passage introduces no definition, carrier or target, so it raises no
  new ownership or duplication question. Ownership of the rest of the roadmap was settled in the
  previous review and is unchanged, apart from R01.

### Headline theorems

`Suggested.lean` is unchanged, so the listing of the previous review stands:

- **Stated:** Theorem B, Theorem I's capacity forms, Theorem G, Lemma 6.35's values, splitting and
  torsion, the finite-to-stable range and Bott periodicity, and 1.0's coreflection and product
  criterion.
- **Named as not statable:** Theorem H and the abundance conclusions, the fibered families,
  Proposition 6.36, and the stable `O`.
- **Statable but absent:** none.
- **Padding:** none. The previous review's one-tactic probe found none, and the file has not
  changed.

## Not verifiable

- **[Jap87] Appendix A, Tables 6.VII–6.VIII.** These are the source's tables for the low-rank
  values and the splitting, and they are not held. Instead, the values in the new rows were
  recomputed from the fibration sequences and Bott's table at `bdho-cotangent` lines 5083–5089.
- **Steenrod, *The Topology of Fibre Bundles*, §23.** This is the identification of `∂[Id_(Sⁿ)]`
  with the clutching class of `TSⁿ`. It is not held, so the identification was checked by the
  naturality argument in the second new row.
- The previous review's other unverifiable items (Milnor, Bott, Ziller, the BDHO 2025 book,
  Thom, Milnor–Stasheff, Pontryagin, Munkres) are unaffected by this diff.

## Source issues

- **Error** in bdho-cotangent at proof of Lemma 6.35, printed page 117: the source says `π₈(SO(9)) = ℤ/4`; it should be `(ℤ/2)²`, since the stabilization to `π₈(SO) = ℤ/2` splits with kernel `ℤ/2` (css-derivative, proof of Lemma 2.2); affects nothing.
