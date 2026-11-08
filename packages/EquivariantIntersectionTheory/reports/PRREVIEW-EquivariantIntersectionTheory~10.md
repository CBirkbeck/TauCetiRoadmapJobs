# Review of EquivariantIntersectionTheory (pull request #1685 at 9014e96)

**Verdict:** needs changes

This is an incremental re-review of the 6 lines of `TauCetiRoadmap/EquivariantIntersectionTheory/README.md`
changed since `493bc96`: the second sentence of `## Downstream consumers` is deleted (the previous
R01) and a bullet for Fulton, *Intersection Theory* (1998) is added to `## References` (the previous
R02). `Suggested.lean` is byte-identical to the file reviewed at `1650b0a`. The gate now passes on
every scanner and the build. One P3 remains: the previous R02 asked for the Fulton record in two
places, the README's references (done) and the roadmap's manifest (not done). Nothing is blocking.

## R01 (P3) — The manifest has no record for Fulton 1998, cited at 2.2

Location: `README.md` line 420, "This is the argument of Fulton 1998, Theorem 3.3 (a), for the
projective completion `ℙ(V ⊕ 1)`, run on a nonsplit extension", and the new bullet at lines 621–622.

Claim: every cited work is recorded in the roadmap's `sources.toml`. The README now lists the
work (lines 621–622, correct edition, series, year and locators: Theorem 3.3 (a) is the homotopy
invariance `p^* : A_{k−r}(X) ≅ A_k(E)` for a vector bundle, and Appendix B.5 defines `ℙ(E)` and
`ℙ(E ⊕ 1)` in the lines convention the README uses), but
`packages/EquivariantIntersectionTheory/sources.toml` still has only the keys `eg1998`, `brion2015`,
`fo2010`, `totaro1999`, `hua2026`, `kklv1989`, `mfk1994`.

Witness: `grep -n '^id = '` on the manifest lists those seven keys and no `fulton1998`; `grep -n
Fulton README.md` gives lines 420, 517, 529, 621 and 623 (517, 529, 623 are Fulton–Olsson).

Repair: record the work in the manifest under the key `fulton1998`, `locator_scheme = "theorem"`,
`locator = "Theorem 3.3 (a)"`, `cited_for = "2.2"`, with `doi = "10.1007/978-1-4612-1700-8"` and
`status = "uncertified"` (the Springer text is paywalled, and the cache holds no copy). The README
needs no change; the record is outside the pull request, so the branch needs no new commit.

## Previous findings

- R01 — repaired: line 598 now reads "No roadmap on main cites this one." and nothing else; no
  name of the project's dropped-names list occurs in the README or the Lean file (grep of the
  fifteen names: no hit), and the gate's `dropped` scanner gives `0`. The sentence is true: no
  roadmap under `TauCetiRoadmap/` or `Completed/` on main (`829d715`) mentions this roadmap.
- R02 — partly repaired: lines 621–622 add "W. Fulton, *Intersection Theory*, 2nd ed., Ergeb.
  Math. Grenzgeb. (3) 2, Springer (1998), Theorem 3.3 (a) and Appendix B.5", in the form the
  repair asked for; the manifest record is missing (R01 of this report).

## Verified sound

**Gate, build, direction, folder.**

- Gate at `9014e96` against `origin/main` with the candidate merge order: every scanner `0`,
  `depcheck=0`, verdict `OK` (the worker's run, with the build, agrees: `build=0 OK`). Without the
  order file the gate's only line is `depcheck: NOT IN ORDER: EquivariantIntersectionTheory`, the
  placement of a roadmap the public order does not list yet, not a defect.
- Dependency check, with `--movable` against the candidate order (this roadmap at line 397):

```
depcheck: 237 roadmaps, 2421 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.
- `9014e96` is a merge of main (`3b3f7ef`) into the branch; `git diff --stat origin/main...HEAD`
  outside the folder is empty, so the workflow and `CONTRIBUTING.md` changes listed in the change
  set are main's, not the pull request's. The folder holds `README.md`, `Suggested.lean` and
  `metadata.toml` only.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/EquivariantIntersectionTheory/Suggested.lean`
at the pins (16.8 s) gives nine `declaration uses sorry` warnings (lines 64, 71, 78, 86, 101, 113,
121, 149, 155), no error and no other warning. `git diff 1650b0a HEAD -- Suggested.lean` is empty,
so the fifteen `#check @` types, the binder audit, the padding audit and the one-tactic probe of the
review of `1650b0a` stand; the worker's `signatures.md` for this head lists the same fifteen types
with no lost binder (`homogeneousUnitDegrees_away_prime` keeps `hf` and `Prime f`;
`depressedDiscr_mem` keeps `2 ≤ m`; `depressedDiscr_prime` keeps `[CharZero K]` and `2 ≤ m`).

**The changed passages.**

- `## Downstream consumers` (line 598): a single true sentence; the ownership of `Pic^G` by 1.1 is
  stated in `## Scope and ownership` and needs no consumer.
- The Fulton bullet (lines 621–622): bibliographic data checked against the work itself
  (Ergebnisse der Mathematik (3) Band 2, second edition 1998); Theorem 3.3 (a) is the vector-bundle
  homotopy invariance proved through `ℙ(E ⊕ 1)`, and Appendix B.5 ("Projective cones and bundles")
  defines the bundle of lines `ℙ(E)` and the completion `ℙ(E ⊕ 1)`, both as the 2.2 passage at
  line 420 uses them. The citation is a locator for an argument, not a supplier: the 2.2
  `*Needs:*` line (line 424) lists 2.1, 1.4 and SchemeAndStackFoundations §§5.2–5.6 only, and the
  route is deduced from `chow_affine_bundle`, `localization_exact` (§5.2) and `chow_basis` (§5.4).
- SchemeAndStackFoundations on main (`829d715`) still owns these under the same numbers: §5.2 at
  README line 6653 with `chow_affine_bundle` at 6680, §5.3 at 6701 with `eq_cartier_divisor` at
  6711, §5.4 at 6721 with `chow_basis` at 6727. `scratch/overlaps.md` reports no other open pull
  request changing this roadmap and no cited id dropped or defined only by a revision.

**Ownership and overlaps.** The diff adds no object and no ownership claim. The resolver's three
leads (`GroupSpace.ofGroupScheme`, `StableCurves.Mbar`, `actionQuotient.torsorEquiv`, README lines
101–105) are README targets of SchemeAndStackFoundations, as in the previous reviews; the diff does
not touch them.

**Seeded sample.** None of the fifteen sampled targets (0.1–0.5, 1.1–1.3, 2.1, 2.3, 2.4, 3.1–3.4)
falls in a changed passage; their locator checks stand from the reviews of `1650b0a` (r6),
`03f0a93` (r7), `f62b21a` (r8) and `493bc96` (r9).

**Remark on untouched text (no change requested).** The manifest also has no key for five other
works the References list and the text cite: Vistoli 1998 (appendix to Edidin–Graham), Romagny
2005 (line 43), Mumford 1965 (3.2), Arsie–Vistoli 2004 (3.3; cache `097ce924`) and Edidin–Hu 2025
(3.3; cache `1d28e1b2`). The previous reviews passed these; a repair that records `fulton1998`
can record them in the same pass.

**Adversarial table.** The diff changes no mathematical statement. The rows for every statement
carry forward the review of `493bc96` ("r9") and, through it, the reviews of `f62b21a`, `03f0a93`
and `1650b0a`; the one row with new values is the reference check.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| References, Fulton 1998 bullet | the cited theorem and appendix | Theorem 3.3 (a): `p^* : A_{k−r}(X) → A_k(E)` iso for `E` of rank `r`, via `ℙ(E ⊕ 1)`, `D = ℙ(E)` at infinity, `O(D) = O(1)`; B.5: `ℙ(E)` = lines, `ℙ(E ⊕ 1)` = completion | locators and edition right; matches the 2.2 argument at line 420 | R01 (record only) |
| 2.2, `E = ℙ(Ṽ) ∖ ℙ(V)` and `p^*` iso (nonsplit, split, rank `0`); `[ℙ(V)] = c₁(O(1)) ∩ [ℙ(Ṽ)]` | as in r9 | r9: `X = ℙ¹`, `Ṽ = O(−1)²`, `V = O(−2)`, `E = (ℙ¹ × ℙ¹) ∖ Δ`: `CH_1(E) = ℤ²/(1,1) = ℤ`, `CH_0(E) = 0`, `CH_2(E) = ℤ`; Stacks 02TY for the split case; `V = 0` gives `p^* = id` | unchanged by the diff | none |
| 2.3, `B/T` tower (`GL₂`, `GL₃`, `n = 1`), `N = n(n − 1)/2`, `A^*_{GL_n}` from `A^*_T` | as in r9 | r9: `x ↦ (a x + b)/d`, chain `R ⊇ U₁₂U₁₃ ⊇ U₁₃ ⊇ 1`, `0, 1, 3, 6`, `ℤ[t₁, t₂]` free of rank `2` over `ℤ[c₁, c₂]` | unchanged by the diff | none |
| 2.2 locators (Propositions 1, 3, Definition-Proposition 2), 3.4 opening, scope paragraph, 0.4 Check, 2.2 Checks and every other untouched statement | as in r8, r7 and r6 | as in r8 (eg1998 lines 215–229, 257–265, 399–402; `ℤ/6 → ℤ/12`, `d ↦ 2d`; `20`, `42`) and r6 (29 rows: `⊥`/`⊤`/`2ℤ` for 0.1, `(1+εt)(1−εt) = 1` for 0.2, `−4a₂³ − 27a₃²` for 0.5, `ℤ/2, ℤ/6, ℤ/12, ℤ/20` for 3.4) | unchanged by the diff | none |

**Counts.**

| What | Number |
| --- | --- |
| Changed passages reviewed | 2 |
| Lean declarations (file unchanged; types from `signatures.md` compared with the README) | 15 |
| `sorry` warnings | 9 |
| SchemeAndStackFoundations sections re-resolved on main (§§5.2, 5.3, 5.4) | 3 |
| Manifest keys checked | 7 |
| Dropped-names grep (fifteen names, two files) | 0 hits |
| New table rows / carried rows | 1 / 3 groups |

## Not verifiable

- Fulton, *Intersection Theory* (1998), Theorem 3.3 (a) and Appendix B.5 (README lines 420,
  621–622): the Springer text is paywalled and the sources cache holds no copy; checked from the
  work's standard numbering, and through the open Stacks project Lemma 42.36.3 (02TY) and
  SchemeAndStackFoundations §5.2, as in the previous review. To be recorded as `uncertified` (R01).
- The diff touches none of these, and none can be read legally: Mumford–Fogarty–Kirwan, Ch. 1
  §3 (1.1); Knop–Kraft–Luna–Vust 1989, Lemma 2.2 and Proposition 2.3 (1.3); Edidin–Graham,
  published numbering, Proposition 18 (2.4); Mumford 1965 (3.2).

## Source issues

- none
