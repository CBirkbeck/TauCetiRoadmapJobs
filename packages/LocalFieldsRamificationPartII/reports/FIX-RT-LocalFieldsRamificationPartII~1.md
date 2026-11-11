# FIX-RT-LocalFieldsRamificationPartII~1: repair of red-team round 1 (passes a and b)

Fifteen findings in two reviews. Two pairs overlap (a/F01 = b/F01, a/F06 = b/F06), so there are 13
sections below. All were verified on the mathematics and the cited texts. All were applied. None
was disputed, and none was left as not actionable.

## RT-LocalFieldsRamificationPartII~1a/F01, RT-LocalFieldsRamificationPartII~1b/F01 (P1) — applied

Verified: `TauCetiRoadmap/ProfiniteCohomologyPartII/README.md:227` (open head, ORDER line 386,
before this roadmap at 388) requests this bound from ProfiniteCohomology (main) as
`gap:char-p-galois-h2-vanishing`, Layer 9. ProfiniteCohomology on main does not state it yet. The
pinned Tau Ceti has only `TauCeti.additiveHilbert90`.

Change: deleted §3.1 and `cohomologicalDimensionAt_absoluteGaloisGroup_le_one`. Added the same
gap slug (supplier ProfiniteCohomology, Layer 9) to the plan's `gaps` and to the contracts.
Renumbered §§3.2–3.6 → §§3.1–3.5. Updated the summary, ownership, deferral, build paragraph, §3.5
route/Needs/Check, Layer 3 Examples and Dependencies, downstream consumers and the Lean docstring.

## RT-LocalFieldsRamificationPartII~1a/F02 (P2) — applied

Verified: Mathlib's `IsKrasner.of_completeSpace` (an instance, for algebraic `L`) and
`IsKrasner.of_completeSpace_of_normal` both need `CompleteSpace K`. Temkin 2017 applies Krasner's
lemma over `kʰ` (temkin17 line 510). GF.4/rank-one-krasner is a supplied export.

Change: added `isKrasner_of_henselianLocalRing` (Layer 4 block). Its hypothesis is
`HenselianLocalRing (NormedField.valuation (K := K)).valuationSubring` and `L` is algebraic.
README §4.1 old "normal algebraic extension" → "algebraic extension, normal or not", plus a route
and two Checks (non-henselian `ℚ` at 7 fails; `ℚ_pʰ`).

## RT-LocalFieldsRamificationPartII~1a/F03 (P2) — applied

Verified: ega4 lines 2750–2758 (17.7.5(iv)) and 2795–2798 (17.7.7) are separate results.

Change: `gap:source-side-fpqc-descent` now holds only 17.7.5(iv). The new
`gap:source-side-etale-descent` (SchemeAndStackFoundations, Layer 1, §1.1) holds 17.7.7. Both are
in the plan's `gaps` and the README contracts; §2.1 Needs, the ownership bullet and Layer 2
Dependencies cite both.

## RT-LocalFieldsRamificationPartII~1a/F04 (P3) — applied

Verified: for `K_0 = ℚ ⊆ K = ℚ(t)`, `K/K_0` is not purely inseparable, so the purely-inseparable
lemma does not apply. `TauCeti.linearDisjoint_fieldRange_of_isIntegrallyClosedIn`
(`TauCeti/FieldTheory/Minpoly/IsIntegrallyClosedIn.lean:138`) has exactly the needed hypotheses.

Change: in the §6.3 Needs, the Mathlib `IntermediateField.linearDisjoint_of_isPurelyInseparable_of_isSeparable` →
the Tau Ceti lemma (separability from perfection of `K_0`). Added a Tau Ceti contract bullet. The
other uses of the Mathlib lemma (§§0.3, 2.6, 2.10, 3.4) are genuine purely-inseparable/separable
pairs; they are unchanged.

## RT-LocalFieldsRamificationPartII~1a/F05 (P3) — applied

Verified: for `P = {1}` or `{4}` the only `P`-number is `1`, so `𝔽_q` is `P`-closed. A coefficient
`0` can be omitted without loss.

Change: Layer 0 Examples old "any nonempty `P`" → "any `P` containing a prime", with the `{1}`,
`{4}` counter-case. The §6.3 Check is now a computed one of my own: `ℚ(t)`, `L = K(√t)`. Omitting
`t` would give `L_0(t)`, whose constant field is `L_0`, so `L_0 = ℚ` and the degree is `1 ≠ 2`. It
also notes that `0` may be omitted. The reviewer's wording ("tensor map has degree 2") was not
copied.

## RT-LocalFieldsRamificationPartII~1a/F06, RT-LocalFieldsRamificationPartII~1b/F06 (P3) — applied

Verified: AdicCoefficientsAndComparisonsPartII (lines 18, 94, …) cites `GF.k` and `GF.k/<name>`.
QuadraticFormInvariantsPartII (lines 83–84, …) cites `§GF.1`, `§GF.4` and `§GF.5`. The README had
no `GF.` before this round. Earlier this was a maintainer remark, not a finding verdict, so this is
its first settlement.

Change: under "How to read the build", added the sentence "Layer `k` is also cited as `GF.k`" and
a 7-row table headed `Former identifier | Section here`. It maps all 43 plan ids `GF.k/<name>` to
sections, using the new Layer 3 numbering.

## RT-LocalFieldsRamificationPartII~1a/F07 (P3) — applied

Change, §3.3: the old "requires injectivity" sentence → computed Checks. `ℚ_3(√3)` gives a
bijective tensor map (dimensions 2/2). `ℚ_3(√−1)` has compositum `Kᵘ` but `Kᵘ ⊗ F′ ≅ Kᵘ × Kᵘ`, with
a kernel of dimension 1.

Change, §6.2: the old "Height 1 is exactly §4.5" → `ℂ_p` (hypothesis holds, tame) and `ℚ_2` (`X² − 2`
breaks the hypothesis; `ℚ_2(i)` has inertia 2, so not tame). This differs from the reviewer's
wording: the negative control is added.

## RT-LocalFieldsRamificationPartII~1a/F08 (P1) — applied

Verified: the stacks-more-algebra lines 2879–2919 route uses 053D and the homogenization step
quoted from Algebra, Lemma 10.57.10. `roadmaps grep` (053D, 053E, 15.26.x, 10.57.10, homogeniz…)
and a search of Mathlib and Tau Ceti found no owner. This roadmap is the owner.

Change: §1.5 now opens with two prose targets. *Homogenization* (B ≅ S_(f), M ≅ N_(f), and
descent of finite presentation) has 4 Checks. *Graded finite presentation* (tag 053D; route via
053C and 053A) has 3 Checks, including a Boolean-ring counterexample to the base hypothesis. The
Prüfer route now cites both targets. The owned list and Layer 1 Dependencies are updated.

## RT-LocalFieldsRamificationPartII~1a/F09 (P2) — applied

Change: added the Layer 1 Lean block with two theorems. They carry the Prüfer hypothesis in
Mathlib's form `∀ (P : Ideal A), [P.IsMaximal] → ValuationRing (Localization P.primeCompl)`:
- `finitePresentation_of_flat_of_valuationRing_localization` (algebra);
- `module_finitePresentation_of_flat_of_valuationRing_localization` (module, with
  `[IsScalarTower A B M] [Module.Finite B M] [Module.Flat A M]`).

README §1.5 names both and says the valuation-ring case is the local case. The names follow
Mathlib's `flat_iff_torsion_eq_bot_of_valuationRing_localization_isMaximal`, not the reviewer's
`…_of_prufer`, because Mathlib has no Prüfer predicate (`Flat/TorsionFree.lean:32` is a TODO).

## RT-LocalFieldsRamificationPartII~1b/F02 (P2) — applied

Verified: RamificationOfCompleteDiscretelyValuedFields (main) §3a.1 (README lines 545–555) gives
`f(L/K_0) = p` and calls the extension not totally ramified. Its conventions (line 146) take `L/K`
finite Galois.

Change: the Conventions sentence now says that `f = 1` (theirs) implies totally ramified (ours),
and that they differ exactly for a nontrivial purely inseparable residue extension. Added a
deferral bullet (Layers 3a–4a), a §3a.1 contract, and a §2.9 comparison target for finite
separable `L/K` with route and 2 Checks. §2.9 is retitled; Layer 2 Dependencies are updated.

## RT-LocalFieldsRamificationPartII~1b/F03 (P3) — applied

Change: the summary link `../LocalFieldsRamification/README.md` →
`../../Completed/LocalFieldsRamification/README.md`. The base roadmap is under `Completed/` on
main.

## RT-LocalFieldsRamificationPartII~1b/F04 (P3) — applied

Verified: `Mathlib/Analysis/Normed/Field/Approximation.lean:52,115` (namespace `Polynomial`; any
normed field; monic `f`, `g` of equal degree; `g` split; strict radius
`((n+1)ε)^{1/n}·max(‖a‖,1)`).

Change: added a Mathlib contract bullet for both lemmas, saying what they lack. §4.1 now delimits
its statement against them and lists both in its Needs as the rank-one existence direction, which
is enough for §4.2. The ownership bullet names them.

## RT-LocalFieldsRamificationPartII~1b/F05 (P3) — applied

Verified: `Completed/ProfiniteProPGroups/README.md` Layer 2 (line 354), items 5.1–5.6 (lines
1094–1166), and Layer 6 step 1 (lines 1316–1325).

Change: added `### From TauCetiRoadmap.ProfiniteProPGroups`. Every prose title used as a citation
is now the roadmap name: "Profinite and pro-`p` groups" → ProfiniteProPGroups; "Continuous
cohomology of profinite groups" → ProfiniteCohomology; "Scheme and stack foundations" (5) →
SchemeAndStackFoundations; "Local fields and ramification" → LocalFieldsRamification.

## Checks run

- **Elaboration.** `lake env lean packages/LocalFieldsRamificationPartII/Suggested.lean` (from the
  content checkout): no errors; 9 warnings, all "declaration uses `sorry`", one per theorem. The
  imports are `Mathlib` plus the two Tau Ceti modules already used; both object files were present.
  There is no `set_option`, `lemma` or sorry'd data.
- **`#check @` comparison.** All 16 declarations went into one scratch file and were elaborated
  once. Every type matches its README statement. The file has no section `variable`s, so no binder
  can be lost. New types: the two Layer 1 theorems carry `[IsDomain A]`, `[Algebra.FiniteType A B]`,
  the flatness instance and the instance-implicit maximal-ideal hypothesis.
  `isKrasner_of_henselianLocalRing` carries `[NontriviallyNormedField K] [IsUltrametricDist K]
  [NormedField L] [NormedAlgebra K L] [Algebra.IsAlgebraic K L]` and
  `[HenselianLocalRing ↥NormedField.valuation.valuationSubring]`. The 13 unchanged declarations
  match the worker's `signatures.md`.
- **Library names.** A scratch `#check` at the pins confirmed every newly cited name:
  `NormedField.valuation`, `IsKrasner.of_completeSpace`, `IsKrasner.of_completeSpace_of_normal`,
  both `Polynomial.exists_…roots_norm_sub_lt_of_norm_coeff_sub_lt`, `HomogeneousLocalization.Away`,
  `Module.Flat.flat_iff_torsion_eq_bot_of_valuationRing_localization_isMaximal`,
  `Algebra.FinitePresentation`, `Module.FinitePresentation`,
  `TauCeti.linearDisjoint_fieldRange_of_isIntegrallyClosedIn` and `TauCeti.additiveHilbert90`.
- **README ↔ Lean.** Every Lean name occurs backticked in the README. The deleted name occurs in
  neither file.
- **Dependency check** (command of the brief), final README:

  ```text
  depcheck: 237 roadmaps, 2142 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve packages/LocalFieldsRamificationPartII/README.md`: "Cross-roadmap
  citations found nowhere: None. Lean names found nowhere: None."
- **plan.json.** Only the top-level `gaps` list changed: one entry edited and two added (`git diff`
  checked).
- **sources.toml.** Updated `cited_for` for kpr86, serre-cg and ega4. The stacks-more-algebra locator
  gains Lemmas 15.26.1 and 15.26.3 (tags 053A, 053C; text lines 2813 and 2845). No new source was
  needed and nothing was added to `needs-references.toml`. The file parses as TOML.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `isKrasner_of_henselianLocalRing` | `K = ℚ_p`; `K = ℚ_pʰ`; `K = ℚ` at 7, `L = ℚ(√2)`, `√2 ↦ s ≡ 3`; `L = K` | complete ⇒ henselian, agrees with Mathlib's instance; henselian and not complete, holds by norm uniqueness; `‖√2 − 3‖ ≤ 1/7 < ‖2√2‖ = 1` but `√2 ∉ ℚ`, and `ℤ_(7)` is not henselian, so the hypothesis excludes it; `x ∈ K` trivially | true; hypothesis necessary | Check added |
| `finitePresentation_of_flat_of_valuationRing_localization` | `A` field; `A = ℤ`, `B = ℤ[X]/(2X−1)`; nondiscrete VR, `B = A/𝔪`; `A = ∏𝔽₂`, `B = A/⊕𝔽₂`; `B = 0` | fp; flat and fp; not flat, excluded; not a domain, excluded (statement false there); `A[∅]/(1)` fp | true | none |
| `module_finitePresentation_of_flat_of_valuationRing_localization` | `B = A`, `M = A/𝔪`; `B = A[x]/(ax)` (not flat), `M = B/(x) ≅ A`; `M = 0` | `M` not flat, excluded; `M` flat and cyclic with kernel `(x)`, fp; fp | true; `B` need not be flat | none |
| Homogenization (§1.5) | `B = R`, `M = 0`; field, `B = R[x]`; `R = ℤ`, `B = 𝔽₂` | `S = R[X_0]`, `S_(f) = R`; `S_(X_0) = R[X_1/X_0]`; `S = ℤ[X]/(2X)`, `S_0 = ℤ`, `S_(X) = 𝔽₂` | true | 4 Checks |
| Graded finite presentation (053D) | field; `R = ∏𝔽₂`, `S = R[X]/(IX)`; nondiscrete VR, `S = R[X]/(𝔪X)` | fp; flat, not fp, and no finite prime family (`R → 𝔽₂^m` not injective); local base, not flat, not fp | hypotheses necessary | 3 Checks |
| §2.9 comparison with complete DVFs | `𝔽_p(s)((t))`, `y^p − y = s t^{−p}`; `𝔽_{p²}((t))/𝔽_p((t))`; `ℚ_p(p^{1/ℓ})` | `e = 1`, `f = p`, residue `𝔽_p(s^{1/p})`: total here yes, there no, unramified in neither; `e = 1`, `f = 2` separable: unramified in both, total in neither; `e = ℓ`, `f = 1`: total in both | consistent with Conventions and §2.6 | 2 Checks |
| Gap `char-p-galois-h2-vanishing` | `F = 𝔽_p`; `F` separably closed; `F = ℚ_p` | `cd_p Ẑ = 1 ≤ 1`; `0 ≤ 1`; characteristic 0, not covered (`cd_p = 2`) | true | — |
| §3.5 route with imported bound | `κ = 𝔽_p`; `κ` separably closed; `p = 1` | `cd_p(G_K/W) = cd_p Ẑ = 1`; `0`; no Sylow step | closes | — |
| Gaps `source-side-fpqc-` / `-etale-descent` | identity of `Spec 𝔽₂`; ega4 Remark 17.7.6 | both conclusions hold; without qc/qs, a disjoint union of affines gives a counterexample | hypotheses kept | — |
| §3.3 Check | `ℚ_3(√3)`; `ℚ_3(√−1)` | source/target `Kᵘ`-dimensions 2/2, kernel 0; 2/1, kernel 1 | discriminates | — |
| §6.2 Check | `ℂ_p`; `ℚ_2` | all finite degrees 1, tame; `X² − 2` degree 2, `ℚ_2(i)` inertia 2 | agrees with §4.5 | — |
| §6.3 Check and Tau Ceti input | `ℚ(t)`, `L = K(√t)`; `K_0 = ℚ`, `k′ = ℚ(√2)` | `K_0 = K`, degree 2; omitting `t` gives constant field `L_0 = ℚ`, degree `1 ≠ 2`; `[ℚ(t,√2) : ℚ(t)] = 2` | true | — |
| Layer 0 Examples | `P = {1}`, `{4}`, `{2}` | `P`-numbers `{1}`, `{1}`: `𝔽_q` is closed; `𝔽_{q²}` degree 2: not closed | corrected claim true | — |
| Conventions: total ramification | as in the §2.9 row | as above | no contradiction with RamificationOfCompleteDiscretelyValuedFields | — |

P3 note, not a finding: the Prüfer hypothesis `hA` is not needed for the truth of the algebra
statement (Raynaud–Gruson 3.4.7 holds over any domain, uncertified). The route and §2.1 use it, and
the README says so, so it is kept.

## For the maintainer

- **Lean names.** `cohomologicalDimensionAt_absoluteGaloisGroup_le_one` is removed. New names:
  `finitePresentation_of_flat_of_valuationRing_localization`,
  `module_finitePresentation_of_flat_of_valuationRing_localization`,
  `isKrasner_of_henselianLocalRing`. No roadmap at main or an open head cites the removed name.
- **Layer 3 numbering.** Old §3.1 is deleted and §§3.2–3.6 → §§3.1–3.5. No roadmap cites Layer 3
  subsection numbers. The consumers cite `GF.k/<name>`, which the new table maps.
- **Supplier gaps.** `gap:char-p-galois-h2-vanishing` reuses the slug that ProfiniteCohomologyPartII
  already uses for the same request to ProfiniteCohomology, so that roadmap gets one request from
  two consumers. `gap:source-side-etale-descent` is a new request to SchemeAndStackFoundations, split
  from `gap:source-side-fpqc-descent`.
- **New supplier edges.** RamificationOfCompleteDiscretelyValuedFields §3a.1 and ProfiniteProPGroups
  (both on main). The gate is clean.
- **Ownership against open work.** Checked by object with `roadmaps grep` over main and the open
  heads: graded finite presentation and homogenization have no owner, so they are owned here;
  sections through pro-`p` kernels have no other owner. The characteristic-`p` bound moved to
  ProfiniteCohomology. No declaration of `Suggested.lean` shares a qualified name with another
  roadmap. No notion was moved down from a later roadmap.
- No suspicious instruction was found in either review.
