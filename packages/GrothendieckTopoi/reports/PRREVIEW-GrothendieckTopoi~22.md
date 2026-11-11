# Review of GrothendieckTopoi (pull request #1520 at 6b3158d)

**Verdict:** accepted

No findings.

## Previous findings (review of 24c3553)

- R01 — repaired: README line 1245 "Stone Spaces II, §1 (1.3–1.7) for the points of a locale and sober spaces"; line 1382 "Stone Spaces II, §1"; References "Chapter II, §§1–2 (frames, locales, points and sober spaces, …)", "§3 (spaces and sober spaces)" gone.
- R02 — repaired: lines 803–804 "The three statements are proved here by the route above (the definition and the case of `Sh(X)`: Elephant C1.5.7)"; References gain "C1.5 (C1.5.7, connected morphisms and connected spaces)".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 5.1 `Sh(X)` connected ⟺ `ConnectedSpace X`, with the added locator | `X = ∅`; discrete `Bool`; `ℝ` | `∅`: `Γ Δ ∅` has 1 element against 0, unit not iso, and `ConnectedSpace ∅` fails. `Bool`: `Γ Δ Bool` has 4 against 2. `ℝ`: maps to discrete `S` are constant, `Γ Δ S = S`. | both sides agree in the three cases; the nLab entry "connected topos" gives Elephant C1.5.7 for exactly this statement | none |
| 5.1 presheaf case (said to be proved by the route, no source) | `C = ∅`; `Discrete (Fin 2)`; `C` with a terminal object | `∅`: limit of the empty diagram is 1 point against `S = ∅` with 0. `Fin 2`: `S²`, 4 against 2 at `Bool`. Terminal object: `π₀ C` is a point, limit `= S`. | agrees with `CategoryTheory.IsConnected` (nonempty included) and with the three Checks of 5.1 | none |
| 7.3 points of `Sh(X)` and the locator II §1 (1.3–1.7) | Sierpiński space; indiscrete `Bool` | Sierpiński (sober): completely prime filters of `{∅, {o}, X}` are `{X}` and `{{o}, X}`, 2 points for 2 points. Indiscrete `Bool`: frame `{∅, X}`, 1 point against 2, the soberification. | statement holds; II 1.3 is points of a locale, 1.6 sober spaces, 1.7 soberification | none |
| 8.4 points of `Sh(S × T)` for sober `S, T`, locator II §1 | `S = T =` Sierpiński | `S × T` has 4 points and is sober (`T0`, every irreducible closed set a point closure), so `Sh(S × T)` has 4 points `= 2 · 2` pairs. | holds; the locator is cited only for sober spaces and points of a locale, which are in II §1 | none |

The rows for untouched statements stand as in the previous review, of 24c3553.

- **Gate:** the worker's gate at 6b3158d gives 0 on every check, build included ("Every check passed"). Depcheck rerun (candidate order, `--movable`): "depcheck: 206 roadmaps, 1897 edges, 0 problem(s)". No file changed outside the folder.
- **Elaboration:** `lake env lean` on `TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` at the head exits 0 with 44 `sorry` warnings and nothing else; the file is unchanged since 24c3553, so no signature was compared again.
- **Source locators checked, 3:** Elephant C1.5.7 (5.1) against the nLab entry "connected topos", which cites it for connectedness of `Sh(X)`; Elephant C1.5 against the book's contents ("Some topological properties of toposes"); Stone Spaces II §1 items 1.3–1.7 (7.3, 8.4, References) against the book's outline. No remaining mention of II §3 in the README.
- **Diff read in full:** besides the three repairs, the 56 changed lines are re-wrapped paragraphs (5.1, 7.3, the Elephant entry) with the same words; no statement, *Needs:* line, Check or Lean declaration changed.
- **Cross-roadmap citations:** none added or changed by the diff; the overlaps report lists none dropped and no other pull request changing this folder.
- **Pull request text:** title and description read against the head; "Elephant (A4, B1.4, B3.4, C1–C3)" covers the added C1.5, and no sentence is contradicted or supplier, section or declaration change left unstated.
- Overlap check: read TotallyDistributiveTopoi, ClassifyingTopoi, AdicEtaleGeometry, EnhancedDerivedSheaves; nothing shared (the first two leave Grothendieck topoi, geometric morphisms, 5.2, 5.6, 6.5, 6.6 and 7.1 to this roadmap by section; AdicEtaleGeometry A1 owns Deligne's theorem for coherent topoi, which 6.4 cites).

## Not verifiable

- Elephant C1.5.7 (5.1): paywalled, not in the sources cache. That it treats connectedness of `Sh(X)` is confirmed second-hand; that the definition of a connected morphism stands at the same number was not read.
- Stone Spaces II §1 (7.3, 8.4): paywalled; checked against the book's outline by item number, the statements recomputed in the table.

## Source issues

- none
