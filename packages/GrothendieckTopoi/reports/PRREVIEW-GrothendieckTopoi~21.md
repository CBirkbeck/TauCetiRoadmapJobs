# Review of GrothendieckTopoi (pull request #1520 at 24c3553)

**Verdict:** needs changes

## R01 (P3) — 7.3 cites the wrong section of Stone Spaces for sober spaces

**Location:** `TauCetiRoadmap/GrothendieckTopoi/README.md` line 1244: "Stone Spaces II, §3 for sober spaces"; the References entry, lines 1658–1659: "§3 (spaces and sober spaces)".

**Claim:** Chapter II, §3 of Stone Spaces is "Coherent locales". Points of a locale, spatial locales, sober spaces and the soberification are in §1 "Frames and locales" (II 1.3–1.7).

**Witness:** The nLab page "Stone Spaces" lists, under II §1 "Frames and locales": point of a locale, adjunction between Loc and Top, spatial locale, sober space, soberification; §2 is "Sublocales and sites", §3 "Coherent locales".

**Repair:** Line 1244: "Stone Spaces II, §1 (1.3–1.7) for the points of a locale and sober spaces". References: "Chapter II, §§1–2 (frames, locales, points and sober spaces, nuclei and sublocales, …, 2.14 for `ℚ × ℚ`); Chapter VII, §4 (…)", dropping "§3 (spaces and sober spaces)". 8.4's "II, §§1–3" (line 1381) then reads "II, §1".

## R02 (P3) — 5.1 still has no source locator

**Location:** README lines 793–803 (5.1): "Define `GeometricMorphism.IsConnected` (`f.inverse` fully faithful) … Route: composites of fully faithful functors are fully faithful. …".

**Claim:** The previous R03 asked for a source for 5.1. The head adds a route (correct, see the table) and no locator; neither does it say, as 7.3, 8.4 and 9.5 now do, that the statements are proved by the route.

**Witness:** Lines 793–804 contain no parenthesised source; 5.2 (line 820) has "(Elephant B1.4, C3.3.1)", and the changed 7.3 has "The statement on 2-cells is proved here".

**Repair:** End the paragraph, before *Needs:*, with a locator for the definition and the sentence "The three statements are proved here by the route above." The candidate locator is Elephant C1.5.7 (connected geometric morphisms); I could not read it, so check it against the text and add C1.5 to the References entry.

## Previous findings (review of 119dbd3)

- R01 — repaired: `Suggested.lean` lines 498, 514, 523 and README lines 187, 1097, 1141 read `Sheaf.canonicalTopology`; the file elaborates with 44 `sorry` warnings and nothing else.
- R02 — repaired: line 1141 "*Needs:* 1.1, 1.2, 1.4, 6.5; Mathlib `Sheaf.canonicalTopology`, … `Sheaf.isLocallySurjective_iff_epi`, …"; line 1185 "6.6 uses 1.1, 1.2, 1.4 and 6.5".
- R03 — partly repaired: 3.2, 3.3, 7.1, 7.3, 8.4 have locators and 9.5 says "No source states this; the route above is its proof"; 5.1 has a route and no locator (R02), and 7.3's new locator is wrong (R01).
- R04 — repaired: "`lake build …` was not run locally at this head. The worker's elaboration of a copy with the same Lean edits … exits 0 with 44 `sorry` warnings"; nothing at this head contradicts it.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 6.6 (a) `isIrreducibleObject_yoneda_iff` (restated) | elaborated type at the head | `IsIrreducibleObject (Sheaf.canonicalTopology (Sheaf J (Type u))) (J.yoneda.obj c) ↔ IsIrreducibleObject J c`, `[J.Subcanonical]` kept; `Canonical.lean` line 103 | elaborates; agrees with README (a) | none |
| 6.6 (b) `isIrreducibleObject_iff_projective_preservesCoproducts` (restated) | elaborated type at the head | `hE : IsGrothendieckTopos E` and `A` kept; `Sheaf.canonicalTopology E` on `E : Type (u+1)` | elaborates; agrees with README (b) | none |
| 6.6 *Needs:* | the two added Mathlib names | `Sites/LocallySurjective.lean` line 377 (`Sheaf.isLocallySurjective_iff_epi`, sheaves of types) and line 491 (`GrothendieckTopology.ofArrows_mem_iff_…`) | both exist at the pin | none |
| 5.1 route | `X = ∅`; discrete `Bool`; `ℝ`; `C = ∅`; `Discrete (Fin 2)` | `Γ Δ ∅` has 1 element against 0. Discrete `Bool`: `Γ Δ Bool` has 4 against 2. `ℝ`: continuous maps to discrete `S` are constant, so `S`. `C = ∅`: limit is 1 point against 0. `Fin 2`: 4 against 2. | route correct, nonempty included on both sides | R02 (locator only) |
| 7.3 2-cells, proof added | Sierpiński, `f = o`, `g = c`; reversed | On `∅, {o}, X`: `c^*` = (F, F, T) ≤ `o^*` = (F, T, T), so `o ⟶ c`; reversed fails at `{o}`. `closure {o} = X ∋ c`, `closure {c} = {c} ∌ o`. | agrees with Convention 4 and the Checks of 2.2 and 7.3 | R01 (locator only) |
| 8.4 scattered ⟺ no nonempty preperfect subset | `ℚ`; Sierpiński subsets; `∅` | `Perfect.lean` line 78: `Preperfect C := ∀ x ∈ C, AccPt x (𝓟 C)`. `ℚ` preperfect, no isolated point. `{o}`, `{c}`, `{o,c}`: `o` (or `c`) isolated, none preperfect. `∅` preperfect, no isolated point. | holds; "nonempty" needed only on the scattered side | none |
| 3.2, 3.3, 7.1 locators | section titles | SGA 4 IV §5 is the induced topos `E/X` with its localization morphism, §9 subtopoi and gluing (the README's own "IV 9.5", line 732). Mac Lane–Moerdijk IX.1–5: locales, points and sober spaces, spaces from locales, embeddings, localic topoi. | consistent; texts not read | none |
| 9.5 sentence added | `V = (−1,1)`, `N = (−2,2)` | `ℤ_V(N) = 0` (`V` not closed in `N`), `ℤ_V(V) = ℤ`: the route still closes; statement unchanged. | holds | none |

The rows for untouched statements stand as in the previous review, of 119dbd3.

- **Gate:** worker's gate at 24c3553: 0 on every check, build included ("Every check passed"). Depcheck rerun (candidate order, `--movable`): "depcheck: 206 roadmaps, 1897 edges, 0 problem(s)". Outside-folder diff empty.
- **Elaboration:** `lake env lean` on `Suggested.lean` at the head exits 0 with 44 `sorry` warnings and nothing else; the two restated signatures compared with the README, no lost binder.
- **Library declarations opened at the pin, 4:** `Sites/Canonical.lean` 103 (inside `namespace Sheaf`, 49–120); `Sites/LocallySurjective.lean` 377, 491; `Topology/Perfect.lean` 78.
- **Source locators checked, 3:** Stone Spaces II §§1–3 against the book's outline (R01); SGA 4 IV §5, §9 and Mac Lane–Moerdijk IX.1–5 by section title only.
- **Cross-roadmap citations:** none added or changed by the diff; overlaps report none dropped.
- **Pull request text:** title and description read against the head; no sentence contradicted, no supplier, section or declaration change left unstated.
- Remark: the two Mathlib names added to 6.6's *Needs:* are not in "From Mathlib" under Exact supplier contracts; neither are `ConnectedSpace` or `LocallyConnectedSpace`, which the previous review passed.

## Not verifiable

- SGA 4 IV §5 and §9 (3.2, 3.3), Mac Lane–Moerdijk IX.1–IX.5 (7.1, 7.3) and Stone Spaces II (7.1, 7.3, 8.4): paywalled books, not in the sources cache; checked by section title only, the mathematics recomputed in the table.
- Elephant C1.5.7, proposed in R02: paywalled, not read.

## Source issues

- none
