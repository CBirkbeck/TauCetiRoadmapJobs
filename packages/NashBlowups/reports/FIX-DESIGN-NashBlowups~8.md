# FIX-DESIGN-NashBlowups~8: repair of the design review

Review settled: `REV-DESIGN-NashBlowups~7`. It has three findings, all P3.

Files edited:
- `packages/NashBlowups/design/README.md`
- `packages/NashBlowups/design/plan.json`
- `packages/NashBlowups/sources.toml` (one `cited_for` string of `nashModificationNotes2024` names the new
  supplier of §5.3; no entry added, no key changed)

There is no `Suggested.lean` at the design stage, so there was nothing to elaborate and no `#check` comparison to
run. The review's "For the human reviewers" section (licence of `alperModuli`, share of
`nashModificationNotes2024`) lists no finding, so nothing was changed because of it.

## REV-DESIGN-NashBlowups~7/F01 (P3) — applied

Verified at the pin (Tau Ceti `2fd255d`, equal to `lake-manifest.json` and the plan's baseline):
- `TauCeti.powRingHom_finite` (`TauCeti/Algebra/CharP/Frobenius/Finite.lean:62`) takes `[CommRing R] [ExpChar R p]
  [PerfectRing R p]`, `h : (p : A) = 0`, a ring map `f : R →+* A` and `f.FiniteType`. It concludes that
  `powRingHom A p h` is finite.
- `TauCeti.powRingHom` is defined at `…/Frobenius/PowRingHom.lean:38`. `powRingHom_eq_frobenius` (line 49)
  identifies it with Mathlib's `frobenius`.

The review's localisation step is correct. With `A = Σ A^p g_i` and `a·s^{p−1} = Σ c_i^p g_i`, we get
`a/s = Σ (c_i/s)^p g_i`. Also `R_Q = (A_m)_Q = A_{Q∩A}`.

Old → new:
- §5.3 step 3: "finite because `R_Q` is F-finite (DeformationAndDerivedPatchingAlgebra §3.14…)" becomes the
  `A_P` argument through `TauCeti.powRingHom_finite`.
- §5.3 Check 4: "`R` is still F-finite" becomes "`F_*R` is still a finite `R`-module, free on the `t^i s^j`".
- Added a `From Tau Ceti` bullet for `powRingHom` and `powRingHom_finite`.
- Deleted the DeformationAndDerivedPatchingAlgebra contract, its Scope sentence and its "How to read" clause.
- In §5.3 *Needs* and the Layer 5 Dependencies, the DeformationAndDerivedPatchingAlgebra entry is replaced by Tau
  Ceti's `TauCeti.powRingHom_finite`.
- `plan.json`: 5.3 statement, prerequisite (`tauceti:TauCeti.powRingHom_finite`) and test `psi_rank_imperfect`
  updated; supplier entry deleted.
- The same change in `sources.toml` `cited_for`.

Pattern: I searched README, plan and manifest for "DeformationAndDerivedPatching", "F-finite" and "essentially
of finite type". Every occurrence is one of the places listed above, and none remains.

## REV-DESIGN-NashBlowups~7/F02 (P3) — applied

Verified at the pin:
- `Module.Grassmannian.scheme` (`TauCeti/AlgebraicGeometry/Grassmannian/Basic.lean:161`) and `toSpec` (line 166).
  `M` is in the universe of `R`.
- `schemeHomEquiv` (`Points.lean:405`): `G(k, A ⊗[R] M; A) ≃` morphisms `Spec A → scheme` over `Spec R`.
- `isSeparated_toSpec` (`Proper.lean:137`): the section has no finiteness variable, so it holds for every `M`.
- `isProper_toSpec [Module.Finite R M]` (line 230).
- Mathlib's `Module.Grassmannian` uses the quotient convention (finite projective quotient, rank `k` at every
  stalk).

AlgebraicModuliForArithmeticGeometry §1.3 (open head, `README.md:610–627`) has the affine-points bullet the repair
cites.

Old → new:
- Added a `From Tau Ceti` bullet for the scheme, `toSpec`, `schemeHomEquiv` and the two instances. It gives the
  universe and convention, and says that its affine points agree with those of `Gr_r(F|_{Spec A})`.
- The Scope list of pinned Tau Ceti now includes "the Grassmannian scheme of rank-`r` quotients of a module over
  an affine base…".
- The AlgebraicModuliForArithmeticGeometry sentence now says "on an arbitrary base scheme".

No statement changed.

## REV-DESIGN-NashBlowups~7/F03 (P3) — applied

Verified: §6.1 *Needs* names SchemeAndStackFoundations §0.30, but the Layer 6 Dependencies did not. Old → new:
"…§5.4; Mathlib relative normalisation; Tau Ceti …" becomes "…§5.4; SchemeAndStackFoundations §0.30 (Tau Ceti
`IsNormalScheme`); Mathlib relative normalisation, `isIso_of_isClosedImmersion_of_surjective` and
`Algebra.IsTranscendentalSeparable`; Tau Ceti …".

Pattern: I compared every layer's Dependencies with the union of its *Needs* lines. For roadmap suppliers, Layer 6
was the only mismatch. Within Layer 6, the Mathlib names of §6.3 and §6.4 *Needs* were also missing, and are now
added. Layers 0–5 and 7 match at the roadmap-section level.

## Checks

**Dependency check.** Output:

```
candidate: NashBlowups is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2235 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. NashBlowups no longer depends on DeformationAndDerivedPatchingAlgebra, so its
provisional place moves earlier, to just after AlgebraicModuliForArithmeticGeometry.

**Citations.** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name that is found
nowhere. That tool did not check pinned-library names on this host, so I grepped every new name at the pins:
- `TauCeti.powRingHom`, `powRingHom_finite`, `powRingHom_eq_frobenius`;
- `Module.Grassmannian.scheme`, `toSpec`, `schemeHomEquiv`, `isSeparated_toSpec`, `isProper_toSpec`.

All exist at the lines above.

**plan.json.** It parses, with 37 targets and 118 tests (unchanged), five suppliers and `gaps: []`. `sources.toml`
parses.

**Ownership.** No new target was added. One supplier edge, to an open roadmap, is replaced by a pinned Tau Ceti
declaration.

**Sources.** No source was fetched and no `needs-references.toml` was written. The one locator touched
(nashModificationNotes2024 lines 418–420) was re-read: it says that `R^{1/p}` is finite, and so is any
localisation.

## Adversarial pass (changed statements)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Contract `powRingHom_finite` | `A = k[s]`, `k` perfect, `p = 2`; `A = 0`; `A = R = 𝔽_p(t)`; `A = 𝔽_p(t_1, t_2, …)` | generators `1, s`; zero ring, finite trivially; finite of rank `p` although `R` is imperfect (outside the hypotheses, not claimed to fail); `[K : K^p] = ∞` | bullet claims only the pinned hypotheses; failure example is the infinite-variable field (I first drafted `𝔽_p(t)` there and dropped it, since its Frobenius is finite) |
| §5.3 step 3, localisation | `A = k[s]`, `P = (s)`, `p = 2`, `a/s = 1/(1+s)`; `d = 0`; cusp in char 3 | `1·(1+s) = 1²·1 + 1²·s`, so `1/(1+s) = (1/(1+s))²·1 + (1/(1+s))²·s = (1+s)/(1+s)²`; no height-one prime, so step vacuous; `R_Q` not a DVR, so step 3 does not apply (Check 2) | sound |
| §5.3 Check 4 (reworded) | `k = 𝔽_p(t)`, `R = k[s]_{(s)}`, `p = 2` | `k[s] = ⊕ k^p[s^p]·t^i s^j`; after localising, basis `1, t, s, ts` of `F_*R`, rank `4 = p²`; image of `ψ` is `R^2·1 + R^2·s`, so `t` is missing | sound, uses no pinned lemma |
| Contract Grassmannian scheme | `R = k[x]`, `M = R ⊕ R/(x)`, `r = 1`; `r = 0`; `M = 0`, `r = 1`; `M = R^{(ℕ)}` over a field | fibre over `x = 0`: rank-one quotients of `k²`, a `ℙ¹`; over `x = a ≠ 0`, one point (§1.2 Check 2); `G(0, ·) = {·}`, so `Spec R` (§1.3 `Gr_0 ≅ S`); empty (§1.3 `Gr_1(0) = ∅`); separated, not quasi-compact, so not proper | agrees with the pins and with AlgebraicModuliForArithmeticGeometry §1.3 |
| Layer 6 Dependencies | *Needs* lines of §§6.1–6.4 | suppliers AMAG §5.4, SASF §0.30; Mathlib `normalizationDesc`, `normalizationPullback`, `isIso_of_isClosedImmersion_of_surjective`, `IsTranscendentalSeparable`; Tau Ceti `isIso_normalizationDesc_iff`, all now listed | consistent |

## For the maintainer

- NashBlowups no longer cites DeformationAndDerivedPatchingAlgebra; its last roadmap supplier is now
  AlgebraicModuliForArithmeticGeometry.
- No Lean name of this roadmap changed.
- No other roadmap's citation of this one is affected.
- With F02, the package stage can decide whether the Nash blowup of an affine `X` is statable at the pins, using
  `Module.Grassmannian.scheme`.
