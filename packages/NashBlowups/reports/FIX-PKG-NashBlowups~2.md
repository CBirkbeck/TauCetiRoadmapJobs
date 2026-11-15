# FIX-PKG-NashBlowups~2: repair report

One review (`REV-PKG-NashBlowups`), four findings, all P3. I verified all four and applied all four. Files
changed: `packages/NashBlowups/README.md` and `packages/NashBlowups/sources.toml` (the text of one `cited_for`
string). `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## F01 (P3) — applied

Verified independently. The normalisation of `y² = x²z` is `(u, v) ↦ (u, uv, v²)`. The Gauss map pulls back
to `(u, v) ↦ [−2v² : 2v : −u]`, which is undefined exactly at the ideal `(u, v)`. Its graph closure is
`Bl_0 𝔸²_{u,v}`, and that maps by a closed immersion into `X × ℙ²`: on the chart `u = vw` the coordinates are
`a/b = v` and `c/b = w`; on the chart `v = us` they are `x = u` and `b/c = s`. So `X* ≅ Bl_0 𝔸²_{u,v}`.

The ideal `(x, y, z)` pulls back to `(u, v²)`. On the chart `u = vw` this is `(vw, v²)`, and `v ≠ 0` is
nilpotent there (an embedded point). On the chart `v = us` it is `(u)`, which is reduced. So only the reduced
fibre is `ℙ¹`. nobile1975 line 319 speaks of varieties, that is, of the reduced fibre.

Old → new: in the §2.2 Check, "`ν⁻¹(0) ≅ ℙ¹`" → "`X* ≅ Bl_0 𝔸²_{u,v}` …, reduced fibre `ν⁻¹(0)_red ≅ ℙ¹` …;
the scheme-theoretic fibre is cut out by `(u, v²)`, with `(vw, v²)` in the chart `u = vw` (an embedded point)
and `(u)` in the chart `v = us`". The same correction is made in Layer 2 Examples (locator now
nobile1975, Example 4, lines 319–324).

Pattern search: every other fibre claim in the README was recomputed as a scheme (line numbers after the edits).

| Line | Claim | Result |
|---|---|---|
| 618 | `Gr_1(Ω)` of the cusp has fibre `ℙ¹` over the origin | `Proj Sym(Ω ⊗ κ(0)) = Proj k[T₀, T₁]` is reduced; correct |
| 700 | `Gr_1(O ⊕ O/(x))` has fibre `ℙ¹` over the origin | `F ⊗ κ = k²`, so `ℙ¹_k`; correct |
| 704, 730, 768 | exceptional fibres of blowups of regular points | `Proj gr_m = ℙ^{r−1}` (regular), reduced; correct |
| 807 | `ℙ¹` as a fibre of `Ω` | not a claim about `ν⁻¹`; correct |
| 1400 | "has a `ℙ¹` over the origin" | true of the reduced fibre; no change |

## F02 (P3) — applied

Verified: §2.4 *nashBlowup.isIso_lift_iff* had a statement but neither a locator nor a route. The suggested
route is correct. I wrote it with the inputs this roadmap already supplies. Old → new: I added "for `X` in the
Setting", which makes explicit the hypothesis under which §2.4's lift exists, and a route:

- By the construction of the lift in §1.3 (the factorisation of the classifying map through `N`), the
  classifying map equals `ι ∘ q`, where `ι : X* → Gr_d` is the closed immersion of §1.2.
- So the classifying map is a closed immersion iff `q` is (`IsClosedImmersion.comp_iff`).
- If `q` is a closed immersion, its image is closed and contains `ν⁻¹(X_sm)`, by surjectivity of `π` and
  injectivity of `ν` there (§2.1).
- `ν⁻¹(X_sm)` is dense (§2.2) and `X*` is reduced (§1.2), so `q` is an isomorphism by
  `isIso_of_isClosedImmersion_of_surjective`.

The `*Needs:*` line became `§§1.2, 1.3, 2.1, 2.2; Mathlib IsClosedImmersion, IsClosedImmersion.comp_iff,
isIso_of_isClosedImmersion_of_surjective`. `IsClosedImmersion.comp_iff` was added to "From Mathlib".

Pinned evidence:
- `IsClosedImmersion.comp_iff` is at `Mathlib/AlgebraicGeometry/Morphisms/Separated.lean:242`: for
  `[IsClosedImmersion g]`, `IsClosedImmersion (f ≫ g) ↔ IsClosedImmersion f`.
- `isIso_of_isClosedImmersion_of_surjective` is at
  `Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean:409`. It assumes `[IsClosedImmersion f]`,
  `[Surjective f]` and `[IsReduced Y]`; it was already in the supplier contract.

Pattern search: I scanned every `Prove`/`Define` paragraph for a source key or a route. The only others
without a source key are §0.3 *smoothLocusOfDim*, whose openness comes with pinned inputs, §1.1 *setting*
(locators plus "Route for (1)") and §7 *nashIterate_of_smooth* (induction from §§2.5 and 6.4). None of
them needs a repair.

## F03 (P3) — applied

Verified: nashModificationNotes2024 line 202 heads Section 3, "The results of Anna Oneto and Elsa Zatini".
Lines 151–152 credit the universal-property formulation to the notes' reference [21] (line 742, Teissier,
*The hunting of invariants…*). That is not `teissier1982`, the only Teissier work in the manifest and the
References, so neither credited work is recorded.

I took the review's first repair, because no statement depends on either work. Old → new:
- Scope: "(§1.2, after Oneto–Zatini as presented in Nobile's notes)" → "(§1.2; nashModificationNotes2024,
  Section 3)".
- §2.4: "(nashModificationNotes2024, Section 2, lines 153–162, Teissier's formulation; §1.3)" → the same
  without "Teissier's formulation".

Pattern search: the other personal names in the README all refer to works in the manifest or to standard
names of results with a cited source:
- Hironaka and Spivakovsky (line 91): `hironaka1983`, `spivakovsky1990`.
- Nobile's theorem: `nobile1975`.
- Seidenberg's lemma: cited to `hamann2003`.
- Kunz's theorem: cited to EnhancedDerivedSheaves §E1.6.
- Plücker, Gauss and Whitney: terminology.

## F04 (P3) — applied

Verified: in the alperModuli text, the printed folio "61" is at line 2975 and closes the page before §1.4.3.
Theorem 1.4.5 is at line 2979, and lines 2985–3007 precede the folio "62" at line 3020. Old → new: "printed
pp. 61–62" → "printed p. 62" in README §0.4 and in the `cited_for` string of `alperModuli` in `sources.toml`.
No entry was removed or re-keyed.

Pattern search: there is no other printed-page locator for alperModuli. Its other locators (lines 1202 and
2283) are line numbers only.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.2 Check, `y² = x²z`, char ≠ 2 | chart `u = vw`; chart `v = us`; char 2 | `(vw, v²)`, nilpotent `v`, radical `(v)`; `(u)` reduced; char 2: `J = (x²)` principal, `X* = X` (§6.1 Check unchanged) | reduced fibre `ℙ¹`, scheme fibre non-reduced | wording fixed |
| `X* ≅ Bl_0 𝔸²_{u,v}` | Gauss map in `(u, v)` | `[−2uv² : 2uv : −u²] = [−2v² : 2v : −u]`; base ideal `(u, v)`; closed immersion into `X × ℙ²` on both charts | holds (agrees with nobile1975 lines 320–324) | stated |
| §2.4 `isIso_lift_iff`, ⇐ via route | `X = 𝔸¹ ⊔ 𝔸¹` with one line; cusp in char 0 with `𝔸¹ → X`; `Bl_0 𝔸² → 𝔸²`; `X = ∅` | image misses the other line (surjectivity is the step used); lift iso, classifying map `t ↦ (t², t³, [1 : 3t/2])` a closed immersion; lift `= π`, classifying map `= π`, not injective, both sides false; `∅ → ∅`, both sides true | iff holds in both directions | route added, "X in the Setting" made explicit |
| §2.4, ⇒ | lift `q` an isomorphism | `ι ∘ q` is a closed immersion composed with an isomorphism | holds | none |
| §0.4 locator | alperModuli lines 2975, 2979, 3020 | folios 61 and 62 bracket the proof on p. 62 | corrected | p. 62 |

## Checks

- **Elaboration:** `lake env lean packages/NashBlowups/Suggested.lean` from the content checkout gives only
  `71:8: warning: declaration uses 'sorry'` and `87:8: warning: declaration uses 'sorry'`. Nothing else.
- **Signatures:** I wrote `#check @name` for all three declarations in one scratch file and elaborated it
  once. The types are unchanged and agree with README §§0.7, 4.4 and 5.4:
  - `HasLocallyFreeQuotientOfDifferentials` takes `k`, `[CommRing k]`, `X`, `[X.Over (Spec k)]` and `ℕ`.
  - The char-0 theorem takes `[Field k] [CharZero k] [IsReduced X] [LocallyOfFiniteType]` and
    `IsPureDimensional d`.
  - The char-`p` theorem takes `[Fact p.Prime] [CharP k p] [PerfectField k] [IsNormalScheme X]
    [LocallyOfFiniteType]` and `IsPureDimensional d`.

  No binder is lost; `Suggested.lean` was not edited.
- **Dependency check output:** `depcheck: 246 roadmaps, 2244 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- **Supplier gaps:** none added. `design/plan.json` is unchanged.
- **Ownership:** no new construction was introduced. The repairs only cite this roadmap's own sections and
  pinned Mathlib declarations, so no new ownership question arises.

## For the maintainer

- No Lean name, section or target id changed, so no other roadmap's citation is affected.
- The only new external names are two pinned Mathlib declarations, both checked at the pin.
- The review's "For the human reviewers" items (scope of the smoothness criteria, the licence of
  `alperModuli` and of `nashModificationNotes2024`) were not acted on, as the brief directs.
