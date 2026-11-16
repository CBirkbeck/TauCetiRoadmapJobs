# FIX-DESIGN-VirtualFundamentalClassPartII~9

Findings settled: the two findings of REV-DESIGN-VirtualFundamentalClassPartII~8 (F01, F02; its
adversarial table calls them R01 and R02). Files edited: `packages/VirtualFundamentalClassPartII/design/README.md`,
`packages/VirtualFundamentalClassPartII/design/plan.json`, `packages/VirtualFundamentalClassPartII/sources.toml`.

## F01 (P3) — applied differently

Verified. The text recorded under `edidin-graham1998` was arXiv:alg-geom/9603008v3 (11 March 1996). There, Proposition 11
(lines 790–798) compares the products and assumes a quasi-projective moduli scheme. In
arXiv:alg-geom/9609018v3 (16 May 1997), which the arXiv comments call "the version [that] will appear in
Inventiones", the comparison is Proposition 15 (lines 1069–1076). It needs only smooth `X` and a locally separated
Deligne–Mumford `[X/G]`. Proposition 11 of that text (line 870) is about pullback along quotient maps.

Why this differs from the suggested repair: the review proposed citing the published number while keeping line
numbers from the older preprint. That would cite a text the manifest does not record and mix two numberings. I
re-fetched the paper through the sources service under the **same key** `edidin-graham1998` (the
arXiv:alg-geom/9609018v3 text), so all numbers and line numbers now come from the version that was read.

- 5.3: "(edidin-graham1998 lines 758–759)" → "(edidin-graham1998 §5.1, lines 1042–1045)". At lines 1042–1045,
  finite reduced stabilisers give an unramified diagonal (Deligne–Mumford) and a proper action gives a proper
  diagonal (separated). The stack is also named "Deligne–Mumford" in that clause.
- 5.3: "(edidin-graham1998 Proposition 11, lines 790–798, under its assumption of a quasi-projective moduli
  scheme, which is not made here)" → "(edidin-graham1998 Proposition 15, lines 1069–1076, for smooth `X` with
  `[X/G]` locally separated and Deligne–Mumford, no moduli scheme assumed; the hypotheses here are those under
  which EquivariantIntersectionTheory and StableReductionPartII §5.15 supply the two sides)".
- References: the arXiv link is now alg-geom/9609018, with a note: read in the arXiv v3 numbering, the version
  meant for Invent. Math.; the earlier preprint alg-geom/9603008 has the comparison as Proposition 11, with a
  moduli-scheme hypothesis.
- `plan.json` 5.3 locator: "Proposition 11, lines 790-798; lines 758-759" → "Proposition 15, lines 1069-1076;
  Section 5.1, lines 1042-1045 (arXiv v3 of alg-geom/9609018, the Invent. Math. numbering)".
- `sources.toml` (`edidin-graham1998`, still one key): the service updated `arxiv`, `url`, `fetched_from`,
  `fetched_at`, `sha256` and `accessed`. I set:
  - `locator` = "Proposition 15; Section 5.1 (…)";
  - `cited_for` = Proposition 15, lines 1069–1076, and Section 5.1, lines 1042–1045. I also removed the bare
    "5.3" item the service had appended;
  - `version_note`: names the text read, its status as the Invent. Math. version, and the earlier preprint's
    Proposition 11 with its moduli-scheme hypothesis.

Pattern: `edidin-graham1998` is cited only in 5.3, `plan.json` 5.3 and References (search), and every one was
repaired. The other preprints were checked by the reviewer and not reopened here. "Proposition 11",
"758", "790–798" and "moduli scheme" no longer refer to this source anywhere in the three files (search).

Generality: Proposition 15 holds for locally proper actions on algebraic spaces, which is wider than 5.3. 5.3
keeps the quasi-projective, linearised hypotheses because both sides come from suppliers at exactly that
generality: EquivariantIntersectionTheory Conventions 1 and 5, and StableReductionPartII §5.15 (README contract,
"From TauCetiRoadmap.EquivariantIntersectionTheory" and "From TauCetiRoadmap.StableReductionPartII"). The new
clause says this, so the narrowing is explicit. No statement was widened.

## F02 (P3) — applied

Verified. AlgebraicGromovWittenTheory's README at its open head (Summary, line 5; "The end goals", line 38)
fixes "a field `k` of characteristic zero". "Algebraically closed" does not occur in it (search, 0 hits).
README "Downstream consumers": "smooth projective target over an algebraically closed field of characteristic
zero" → "smooth projective target over a field of characteristic zero".

Pattern: `plan.json`'s `consumers` entry already says "in characteristic zero" with no algebraic-closure clause.
The only other "algebraically closed" in the README (5.2, line 1147) concerns geometric points of a coarse moduli
space (`Ω` algebraically closed) and is correct there. 9.3 and 9.5 already say "every field".

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 5.3 hypotheses ⇒ edidin-graham1998 Proposition 15 hypotheses | proper action with finite reduced stabilisers on smooth quasi-projective `X` | Proper action gives a proper diagonal, so `[X/G]` is separated, hence locally separated. Finite reduced stabilisers give an unramified diagonal, so `[X/G]` is Deligne–Mumford (lines 1042–1045). `X` is smooth. | Proposition 15 applies | locator only |
| 5.3, `G` trivial | `[X/G] = X` | Proposition 15 compares a product with itself; identity map, identity ring isomorphism | holds | none |
| 5.3, `μ_n` on `Spec k` | `n` invertible; `n = p = char k` | Invertible `n`: stabiliser `μ_n` reduced, `ℤ[t]/(nt) ⊗ ℚ = ℚ = A^*(Bμ_n)_ℚ`. `n = p`: `μ_p` is non-reduced, `Bμ_p` is not Deligne–Mumford, and the "finite reduced" hypothesis excludes it | holds; the hypothesis is needed | none |
| 5.3, `ℙ(1, 2) = [(𝔸² ∖ 0)/𝔾_m]`, `char k ≠ 2` | weights `(1, 2)` | Stabilisers: trivial where `x ≠ 0`, `μ₂` (reduced) at `(0, y)`; positive weights make the action proper; the trivial sheaf with a character is ample on the quasi-affine `𝔸² ∖ 0`. `A^*_{𝔾_m} = ℤ[t]/(2t²)`, rationally `ℚ[t]/(t²)`; `t ↦ [Bμ₂]` with multiplicity `1` (`x` vanishes to order `1`); `t·t = 0 ∈ A^2(ℙ(1, 2))_ℚ = 0` | holds; no moduli scheme needed | none |
| 5.3, `𝔾_m` on `𝔸¹`, weight `1` | origin | Stabiliser `𝔾_m` is not finite; the action is not proper; excluded | holds | none |
| 5.3, the narrowing clause | supplier contracts | EquivariantIntersectionTheory Conventions 1, 5: quasi-projective `X` with a linearised ample sheaf. StableReductionPartII §5.15: proper action on such `X`, `[X/G]` Deligne–Mumford. The same hypotheses as 5.3 | consistent | clause added |
| Downstream consumers clause | AlgebraicGromovWittenTheory §§4.1–4.3 over any `k` of characteristic `0` | 9.3–9.5 are stated for every field, so the case named (prestable-curve base, smooth projective target, `char k = 0`) is a case of them. Rank `d(1 − g) + c_1(T_X)·β` and dimension `(1 − g)(d − 3) + n + c_1(T_X)·β` are unchanged | holds | wording only |

No other statement, Check or worked example uses the changed locator or the changed consumer clause, so nothing
else needed recomputing.

## Checks run

Dependency check (`gate --candidate … --only VirtualFundamentalClassPartII`), after the edits:

    candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2242 edges, 0 problem(s)

There are no UPWARD or CYCLE lines.

Citation resolver (`roadmaps resolve` on the README): "Cross-roadmap citations found nowhere: None"; "Lean names
found nowhere: None".

`plan.json` parses as JSON and `sources.toml` parses as TOML.

No `Suggested.lean` exists at the design stage, so no elaboration was run and no `#check` comparison applies.

## Gate failures

None were listed for this round.

## For the maintainer

- The key `edidin-graham1998` now records the text arXiv:alg-geom/9609018v3 (sha256 `9a7b60f5…`) instead of
  arXiv:alg-geom/9603008v3. Its locators in this roadmap use the new text's numbering and lines. No other roadmap
  cites this roadmap's locators.
- No names, sections or targets changed. No id that other roadmaps cite was dropped.
- Ownership: no new construction was stated. The Edidin–Graham comparison of groups stays with
  StableReductionPartII §5.15, and 5.3 still adds only the compatibility with products.
- No suspicious instructions were found in the review text.
