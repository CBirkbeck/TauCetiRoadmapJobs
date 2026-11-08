# FIX-DESIGN-NashBlowups~4: repair of the design review

Review settled: `REV-DESIGN-NashBlowups~3` (two findings, both P3). Files edited:
`packages/NashBlowups/design/README.md`, `packages/NashBlowups/design/plan.json`,
`packages/NashBlowups/sources.toml`. No `Suggested.lean` exists at the design stage, so nothing was elaborated
and no `#check` file was needed. `plan.json`: 37 → 38 targets, 107 → 114 tests.

## REV-DESIGN-NashBlowups~3/F01 (P3) — applied differently

Verified. stacksVarieties line 2256 (0C3N) gives `Y^ν ≅ X^ν ×_k K` for every separable `K/k`. Its proof (lines
2278–2280) uses only that `A' ⊗_k K` is normal (0C3M, line 1049, from 0C30 line 21510 and 06DF line 21516). §6.3
was stated for finite `k'/k` only, and did not say so.

Old → new: §6.3 now covers every separable `k'/k` (Mathlib `Algebra.IsTranscendentalSeparable`). The finite route
comes first, then a general route through Mathlib `normalizationDesc` and Tau Ceti
`Scheme.Hom.isIso_normalizationDesc_iff`. A new target §0.7 owns the normality input. §6.3 gains a non-finite
Check.

Why it differs from the suggested repair:
- The reviewer proposed an API bullet in §6.1 saying that `(X̄*)_{k'}` is normal. That statement holds for every
  normal `k`-scheme, and it is a theorem in its own right (0C30, 06DF). The method says an unowned prerequisite
  becomes a target with hypotheses, a locator and three Checks. So it is the general target §0.7,
  *isNormalScheme_baseChange_of_isTranscendentalSeparable*, at the end of Layer 0, where nothing gets renumbered.
- The general route does not use 035Q(3) as a black box. It uses declarations at the pins instead:
  `normalizationDesc` builds the comparison, and `isIso_normalizationDesc_iff` makes it an isomorphism, because a
  normal ring with finitely many minimal primes is integrally closed in its total ring of fractions. 035Q(3) stays
  as a parallel locator.
- The new Check is the cusp over `𝔽_2` with `k' = 𝔽_2(s)`, not the reviewer's cusp over `ℚ` with `k' = ℚ(t)`. In
  characteristic 0, `X* = 𝔸¹` is already normal and `η` is the identity, so that Check never exercises the
  normalisation. In characteristic 2, `X* ≅ X` and `η` is the normalisation of the cusp. The reviewer's instance
  is still true (adversarial table below).

Ownership. Nothing on main, at the 462 indexed open heads or in the board packages states normality under
separable field extension. I searched with `roadmaps grep` for `geometrically normal` and for the tags
`0C3M|0C30|06DF|033C|037X|07BV|037D`. The only hits are SchemeAndStackFoundations §0.8 (`rational_point_component`,
which uses smoothness) and PELModuli's use of 033C (a citation, not a target). At the pins, Mathlib has only the
definitions `Algebra.IsTranscendentalSeparable` and `IsGeometricallyReduced`, and Tau Ceti has
`isIntegrallyClosedIn_tensorProduct` for smooth algebras. So this roadmap owns the statement.

Pattern: a second "finite separable" restriction was looked for and not found. The other occurrences are §0.5 and
§4.1 (a residue field finite separable over `k`). There the narrowing is either needed or already explained: a
closed point has a finite residue field, and §0.5 says that its source allows any finitely generated separable
extension. §2.6 already covers every field extension.

Other places changed:
- README: Scope and ownership (new owned item and the pinned-library sentence); `From Mathlib`
  (`normalizationDesc`, `Algebra.IsTranscendentalSeparable`); `From Tau Ceti` (`IsNormalScheme`,
  `isNormalScheme_iff_forall_affineOpens`, `isIntegrallyClosedIn_tensorProduct`, `IsRegular.of_smooth`,
  `isIso_normalizationDesc_iff`); "How to read the build"; the Dependencies of Layers 0 and 6.
- `plan.json`: new target 0.7 with three tests. Target 6.3 has a new statement, hypotheses and locator, adds the
  prerequisites `target:0.7`, `normalizationDesc`, `IsTranscendentalSeparable` and `isIso_normalizationDesc_iff`,
  and adds the test `cusp_char2_transcendental`.
- `sources.toml`: `cited_for` of `stacksVarieties` (0C3N reworded, 0C3M added), `stacksAlgebra` (0C30, 06DF, 037X,
  033C, 037D) and `stacksNormalization` (035Q(3) for §6.3).

## REV-DESIGN-NashBlowups~3/F02 (P3) — applied

Verified. alperModuli line 2985 starts the proof with "Let `S` be a noetherian scheme". Its closed-subscheme step
cites Exercise 0.3.21 (line 1202), which also assumes a Noetherian `S`, coherent sheaves on `ℙⁿ_S` and a flat
target. The step used here needs neither hypothesis. On a trivialisation `Q ≅ O^r`, the vanishing locus of
`h*K → Q` is `V(I)`, where `I` is the sum of the images of the coordinate maps. Pullback is right exact, so
`K_{T'} → Q_{T'}` vanishes exactly when `I·O_{T'} = 0`, and `h*E = coker(h*K → h*E')`.

Old → new: the §0.4 locator now ends with "the proof there takes `S` Noetherian … Exercise 0.3.21, line 1202 …
the step used here … needs neither". The description of the closed subscheme now spells out the local ideal and
the right-exactness step. §0.4 gains three Checks: non-Noetherian `S`, `p = id`, and the cusp.

Details. §0.4 had no Checks block. I added the reviewer's non-Noetherian witness, the identity surjection and the
cusp equation `−3x²a + 2yb = 0`, which matches the "fibre `ℙ¹` over the origin" of the Layer 0 Examples. The
reviewer asked for no `plan.json` change, but the README Checks need matching tests, so target 0.4 gained three
tests and an extended locator, and the `alperModuli` `cited_for` records the hypotheses.

Pattern repaired: a source's hypothesis dropped without comment. I read every literature locator against the
standing setting of its source:
- nobile1975 lines 26–29 and 70–71;
- gonzalezSprinberg1982 lines 78–82 (over `ℂ`, valid over any algebraically closed field of characteristic 0);
- nashModificationNotes2024 lines 99–100;
- duarteNunezBetancourt2020 line 103;
- castilloDuarteLeytonLiendo2026 lines 13–14 and 58.

All five work with varieties over an algebraically closed field. Only §§2.3, 4.4, 4.5 and 5.4 said so; §§1.2–1.4,
2.1, 2.2, 2.4–2.7, 3.1–3.3, 4.1, 5.1–5.3, 6.1, 6.4 and 7.1–7.3 did not.

Rather than add a clause at 21 targets, I added one Conventions bullet, "Sources over algebraically closed fields".
It names each source's setting by locator and says that each route given here uses only the target's hypotheses,
never a closed point with residue field `k` or a tangent space inside `kⁿ`. I checked that claim against every
route listed above. Each one is the roadmap's own: §3.1 goes through §0.4; §3.2 through §§1.3–1.4 and the blowup's
universal property; §4.1 through Nakayama; §5.1 through `∂(r^p f) = r^p ∂f`, not through duarteNunezBetancourt2020
line 280, which uses algebraic closedness; §6.4 through a section of `ν`.

The other Stacks and hamann2003 locators were already scoped:
- §0.5 says its source assumes Noetherian.
- §0.6 notes the reducedness hypothesis of 0B8X.
- §4.3 keeps hamann2003's "Noetherian, containing `ℚ`".
- §6.2 keeps 035Q(4)'s finiteness of components, through local Noetherianity.

## Adversarial pass on added or changed statements

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| §0.4 closed immersion, no Noetherian | `S = Spec k[x_1, x_2, …]`, `O² → O`, `(a,b) ↦ a`, `r = 1` | `K = 0 ⊕ O`, `Gr_1(O) = S`, image `{q(e_2) = 0} = [1:0]` section of `ℙ¹_S` | true | clause + Check |
| §0.4 | `p = id`; `r = 0`; `r` above the fibre ranks | `K = 0`, identity; `Gr_0 = S → S` identity; `∅ → Gr_r(E')` | true | Check (identity) |
| §0.4 | cusp char 0, `O² → Ω` | `K = (−3x², 2y)`; origin: `0 = 0` gives `ℙ¹`; elsewhere `[a:b] = [2y : 3x²]`, check `−3x²·2y + 2y·3x² = 0` | true, consistent with Layer 0 Examples | Check |
| §0.4 right-exactness step | `T' → T`, `h*K → h*E' → h*E → 0` | exact (pullback right exact), so a quotient of `h*E'` killing the image of `h*K` is a quotient of `h*E` | true | sentence added |
| §0.7 statement | `Y = Spec ℚ(i)`, `K = ℚ(i)` | `ℚ(i)[x]/(x²+1) = ℚ(i)[x]/((x−i)(x+i)) ≅ ℚ(i)²`, two points, normal, not connected | true; integrality is not preserved | Check 1 |
| §0.7 transcendental separable | `C : x^p+y²+t`, `k = 𝔽_p(t)`, `K = k(s)`, `p > 2` | Jacobian `(0, 2y)`; `x^p + t` irreducible as `−t ∉ 𝔽_p(t^p, s^p)`; local ring at `(y, x^p+t)` has `m = (y)` (`x^p + t = −y²`), a DVR; `y² + (x^p + t)` irreducible (odd degree in `x`) | `C_K` regular, normal, not smooth | Check 2 |
| §0.7 inseparable | same `C`, `K' = k(t^{1/p})` | `(x + t^{1/p})^p + y²`; `u = −w²`, `y = w^p`: `(−1)^p w^{2p} + w^{2p} = 0`; `(y/u^{(p−1)/2})² = −u^p/u^{p−1} = −u`; `y/u^{(p−1)/2} = ±w ∉ K'[w², w^p]` | not normal: hypothesis needed | Check 2 |
| §0.7 point | `Y = Spec k(t^{1/p})`, `K' = k(t^{1/p})` | `K'[z]/(z^p − t) = K'[z]/((z − t^{1/p})^p)`, nilpotent `z − t^{1/p}` | not reduced: hypothesis needed | Check 3 |
| §0.7 degenerate | `Y = ∅`; `K = k`; `char k = 0` | `∅`; `Y_K = Y`; every extension separable (`PerfectField` instance) | true | none |
| §0.7 route, smooth step | `B_𝔭` normal domain, `L = Frac B_𝔭`, `S = A_i ⊗_k B_𝔭` | `S ⊗_{B_𝔭} L = A_i ⊗_k L`, smooth over `L`, regular, normal; `S` integrally closed in it (Tau Ceti instance with `R = B_𝔭`, `B = L`); minimal primes of the flat `S` lie over `(0)`, so `Q(S) = Q(A_i ⊗ L)` | route closes | route text |
| §0.7 generality | README versus plan | both: any normal `Y`, any `K` with `IsTranscendentalSeparable`, no Noetherian hypothesis; 0C3M has the same generality | equal | none |
| §6.3 statement, finite case | cusp over `ℚ`, `k' = ℚ(i)` | `X* = 𝔸¹`, `X̄* = 𝔸¹`, both sides `𝔸¹_{ℚ(i)}`; `Spec ℚ(i) → Spec ℚ` étale | true | Check kept first |
| §6.3 non-finite case | cusp over `𝔽_2`, `k' = 𝔽_2(s)` | `𝔽_2(s)` not of finite type, so `Spec k' → Spec k` is not smooth; `X* ≅ X` (char 2 quotient `dx ↦ 0, dy ↦ 1`); `X̄* = 𝔸¹`; `(X̄*)_{k'} = 𝔸¹_{k'} → X_{k'}`, `u ↦ (u², u³)`, equal to `(X_{k'})̄*` | true; normalisation non-trivial | new Check |
| §6.3 reviewer's instance | cusp over `ℚ`, `k' = ℚ(t)` | `(X̄*)_{k'} = 𝔸¹_{ℚ(t)}`; `(X_{k'})* = 𝔸¹_{ℚ(t)}` normal, so `(X_{k'})̄* = 𝔸¹_{ℚ(t)}` | true | not added (η trivial) |
| §6.3 inseparable | `C` over `𝔽_p(t)`, `k' = k(t^{1/p})` | `(C̄*)_{k'} = C_{k'}` non-normal; `(C_{k'})̄* = 𝔸¹`; comparison `u ↦ (−u² − t^{1/p}, u^p)` bijective, not an isomorphism | separability needed | Check kept |
| §6.3 general route | `W = (X*)_{k'}`, `Z = (X̄*)_{k'}` | `η_{k'}` finite; iso over `(ν⁻¹X_sm)_{k'}`; flat projections send generic points of `W`, `Z` into `ν⁻¹X_sm`, `ν̄⁻¹X_sm`; over affine `U`, `Γ(Z, η⁻¹U)` normal and Noetherian, `⊆ ∏ κ(ζ) = ∏ κ(ξ) = Γ(W^(0), U)`, integrally closed there | `isIso_normalizationDesc_iff` holds | route text |
| §6.3 degenerate | `k' = k`; `X = ∅`; `V = X_sm` | identity; `∅`; `V̄* = V` | true | none |
| Conventions bullet | the 21 located targets without a clause | each route uses only target hypotheses; duarteNunezBetancourt2020 line 280 (algebraic closedness) not used by §5.1 | claim holds | bullet added |

## Checks run

Dependency gate (on the edited design README):

```
candidate: NashBlowups is not in the merge order yet; checked as if placed after DeformationAndDerivedPatchingAlgebra (the intake inserts it when its design is accepted)
depcheck: 230 roadmaps, 2243 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

`roadmaps resolve` on the edited README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere:
None." The tool did not check Lean names outside TauCetiRoadmap. So every library name added this round was
checked by hand at the pins (Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`, the revisions in the content repository's
`.lake/packages`, matching `plan.json` `baseline`):
- `Algebra.IsTranscendentalSeparable` and `Algebra.isSeparable_iff_isTranscendentalSeparable_and_isAlgebraic`
  (`Mathlib/FieldTheory/TranscendentalSeparable.lean`);
- `Scheme.Hom.normalizationDesc` and `normalization.hom_ext` (`Mathlib/AlgebraicGeometry/Normalization.lean` 371,
  435);
- `TauCeti.AlgebraicGeometry.IsNormalScheme` and `isNormalScheme_iff_forall_affineOpens`
  (`TauCeti/AlgebraicGeometry/Scheme/Normal.lean` 84, 153);
- `TauCeti.Algebra.Smooth.isIntegrallyClosedIn_tensorProduct` (`TauCeti/RingTheory/Smooth/IntegralClosure.lean`
  48);
- `TauCeti.AlgebraicGeometry.IsRegular.of_smooth` (`TauCeti/AlgebraicGeometry/Scheme/Regular/Scheme.lean` 90);
- `AlgebraicGeometry.Scheme.Hom.isIso_normalizationDesc_iff` (`TauCeti/AlgebraicGeometry/Normalization/IsIso.lean`
  114).

`plan.json` loads, has 38 targets and 114 tests, and every `target:` prerequisite resolves. The *Needs:* lines of
§§0.4, 0.7 and 6.3 match the prerequisites of targets 0.4, 0.7 and 6.3. `sources.toml` parses (`tomllib`).

Sources: every passage cited this round is in a cached text: stacksVarieties lines 1049 and 2256–2280; stacksAlgebra
lines 3999, 4015, 20409, 20414, 21335, 21470–21545; stacksNormalization line 6566; alperModuli lines 1202 and
2985–3007; plus the setting lines of the five literature sources. No fetch was needed and no
`needs-references.toml` was written.

Ownership against open pull requests: checked through `roadmaps grep` over the indexed heads (index of
2026-11-08T15:49:51Z) and the board packages index. The overlaps file lists no pull request that changes this
roadmap or drops an id it cites. Nothing here depends on an open revision.

## Notes for the maintainer

- New owned target: §0.7 *isNormalScheme_baseChange_of_isTranscendentalSeparable*. It is a general fact, and a
  later commutative-algebra or scheme-foundations roadmap may want to cite it from here.
- No id another roadmap could cite was renumbered. §0.7 is new, and §6.3 keeps its number and names. No roadmap
  on main, at an open head or in a board package cites NashBlowups.
- This roadmap's own §0.7 now sits beside the many citations of SchemeAndStackFoundations §0.7 (dimension theory).
  Those always carry the roadmap name, so a bare "§0.7" in this README means this roadmap's own section.
- Outside the findings: the README's SchemeAndStackFoundations §0.30 contract names `IsNormalScheme` and
  `IsNormalScheme.isDiscreteValuationRing_stalk`. Both already exist at the pinned Tau Ceti
  (`TauCeti/AlgebraicGeometry/Scheme/Normal.lean`). The new Tau Ceti contract bullet says so, but the §0.30 bullet
  and the `roadmap:SchemeAndStackFoundations §0.30` prerequisites of targets 5.3 and 6.1 were left as they are. A
  later round may move them to Tau Ceti.
- The package stage still has to write `Suggested.lean`. §0.7 can be stated on pinned carriers
  (`Algebra.IsTranscendentalSeparable`, `IsNormalScheme`, `pullback`) and is a candidate headline input.
- Nothing in the review, the sources or the sibling roadmaps asked for any action outside this job.
