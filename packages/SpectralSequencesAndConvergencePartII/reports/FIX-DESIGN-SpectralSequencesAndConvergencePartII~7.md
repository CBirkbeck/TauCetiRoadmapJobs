# FIX-DESIGN-SpectralSequencesAndConvergencePartII~7

This round settles the findings of `REV-DESIGN-SpectralSequencesAndConvergencePartII~6`. There is one
finding, rated P2. Two files changed: `packages/SpectralSequencesAndConvergencePartII/design/README.md`
and `packages/SpectralSequencesAndConvergencePartII/design/plan.json`. `sources.toml` did not change:
no new source is cited, and every new citation is either a pinned library declaration or a section of
a roadmap that was already cited. The review's "For the human reviewers" section lists no finding, so
nothing was changed because of it.

## F01 (P2) — applied

**Old → new.** Twenty base sections taken as ordinary supply (README list, plan supplier entry,
`"gaps": []`) → 19 separate `gap:base-*` contracts, one per base section used, each with its statement
and hypotheses. Base §5.1 → pinned Tau Ceti declarations. 5.1's exact-couple pages →
StableHomotopyKTheory §7.22 (main).

**Verification.** The witness holds. `roadmaps show SpectralSequencesAndConvergence` prints "no roadmap
SpectralSequencesAndConvergence on main or in an open roadmap pull request". The base is not in
`merge-order/ORDER.txt`. It exists only as `packages/SpectralSequencesAndConvergence/design/README.md`
on the board. So it is outside the supplier classes this roadmap may consume, and a prerequisite that
another roadmap must supply is declared as a supplier gap. The base keeps its ownership and its section
references: the `parent` field, the *Scope and ownership* paragraph and every "base §X" in the prose
are unchanged. Each `*Needs:*` line now gives the slug next to the section, for example
"base §5.3 (gap:base-finite-filtered-convergence)".

**The gaps** (slug: base section; Part II targets that list it):

| Slug | Section | Needed by |
| --- | --- | --- |
| base-stabilisation-regularity | §1.3 | 1.3, 4.2, 4.3, 6.2 |
| base-limit-page | §1.4, with the towers of §1.2 | 6.2 (and every convergence statement, through §3.2) |
| base-bidegree-assignments | §2.1 | Conventions, 2.6 |
| base-bounded-below-regularity | §2.2 | 1.3 |
| base-decreasing-filtrations | §3.1 | 6.2 |
| base-convergence-structures | §3.2 | 1.3, 6.2 (and every convergence statement) |
| base-converging-morphisms | §3.3 | 1.4, 2.4, 2.5, 3.3 |
| base-finite-filtration-convergence | §3.4 | 1.3, 4.2, 4.3 |
| base-comparison-theorem | §3.5 | 1.4 |
| base-first-quadrant-sequences | §3.6 | 3.3 |
| base-einfty-comparison | §4.3 | 5.2 |
| base-induced-filtration | §5.2 | 1.2, 5.2 |
| base-finite-filtered-convergence | §5.3 | 1.3, 4.3, 5.2 |
| base-exhaustive-bounded-below-convergence | §5.4 | 1.3, 1.5, 5.2 |
| base-exact-couple-spectral-sequence | §6.1 | 5.2, 6.1 |
| base-exact-couple-towers | §6.2 | 6.2 |
| base-filtered-exact-couple | §6.3 | 5.2, 6.1 |
| base-tower-exact-categories | §7.2, the standing hypothesis of §§7.4–7.5 | 1.3, 1.5 |
| base-complete-convergence | §7.5 | 1.3, 1.5 |

Each slug appears in two places, with the same slug in both:

- In the README, as a line "What SpectralSequencesAndConvergence must provide (gap:<slug>): …" under
  *Exact supplier contracts*, followed by "Supplier section: …. Used in …".
- In the top-level `gaps` list of `plan.json`, with `supplier`, `section`, a one-sentence `needs` and
  `neededBy`.

Each target's `prerequisites` now carry `gap:<slug>` in place of
`roadmap:SpectralSequencesAndConvergence §X`. The base was removed from the plan's `suppliers` list
and stays as `parent`. A script cross-check found that the slugs in the README, in `gaps` and in the
prerequisites are the same set, and that no gap is unused.

**Three choices in the repair:**

- **No omnibus gap.** The review asked for no single "convergence theory" gap, so there is one gap per
  section, each with its own hypotheses. §7.4 is used only for its class of categories, and the one
  notion in that class that the base itself defines is "lim-acyclic epimorphic towers" in §7.2. The
  gap is therefore stated for §7.2, together with the `ModuleCat.{u} R` instance that the Conventions
  need. The base's §7.2 asserts this instance under `Small R`, which holds for `R : Type u`.
- **Narrower inputs that already exist were used** (the review's last instruction):
  - *Base §5.1 → pinned Tau Ceti.* Base §5.1 reads pinned declarations in a new indexing. The README
    now consumes them directly, and the Conventions state the dictionary:
    - `CochainComplex.spectralSequence (filtrationFunctor G _)` with `G_t = F^{−t}`.
    - `CochainComplex.spectralSequenceFirstPageXIsoCokernel` at `i₁ = −p − 1`, `i₂ = −p` gives
      `E_1^{p,q} ≅ H^{p+q}(gr^p K)`.
    - `CochainComplex.spectralSequence_first_page_d_eq` gives `d_1` as the connecting morphism of
      `0 → gr^{p+1} → F^p/F^{p+2} → gr^p → 0`.
    - `CochainComplex.filtrationFunctorMap`, `CochainComplex.spectralObjectMap` and
      `CategoryTheory.Abelian.SpectralObject.spectralSequenceMap` give functoriality.

    I checked each at the pin: `Filtered/SpectralObject.lean:409` (the `abbrev`), `:425`;
    `Filtered/FirstPage.lean:89`; `Filtered/Naturality.lean:83`; `Filtered/SpectralObject.lean:191`;
    `SpectralObject/SpectralSequenceMap.lean:230`. The Mono instance on `filtrationFunctor` is at
    `Filtered/SpectralObject.lean:338`. The only part not pinned is the classical bidegree assignment,
    which is in the §2.1 gap.
  - *5.1 → StableHomotopyKTheory §7.22.* 5.1 states pairings on the pages `E_r` of an exact couple.
    §7.22 on main (`TauCetiRoadmap/StableHomotopyKTheory/README.md:2618`) defines exactly these pages:
    the `E` of the `(r − 1)`-th derived couple, with `d_r` of degree `c + b − (r − 1)a`. So 5.1 no longer
    needs base §6.1. Base §6.1, the assembly into Mathlib's carrier, is still needed by 6.1 and 6.2,
    and by 5.2 through §6.3.
  - *Not replaced.* Tau Ceti's `filtrationSpectralSequencePageXIsoGradedOfFinite` and
    `isIso_homologyMap_of_isIso_spectralSequence_page` (`Filtered/Convergence.lean:118`,
    `Filtered/Comparison.lean:70`) need a filtration that is finite globally (`F_a = ⊥`, `F_b = ⊤`).
    Finite antidiagonals give filtrations that are finite only in each degree. For example, a
    first-quadrant double complex with infinitely many nonzero columns has no `p` with `F_I^p Tot = ⊥`.
    So these declarations do not supply 1.3(a) or 1.4, and §§5.3 and 3.5 stay gaps. DGFloer Layer 1
    item 3 on main covers module complexes only, while 1.3(b) and (c) are stated in abelian categories
    with exactness hypotheses, so §§5.4 and 7.5 stay gaps.
- **Canonical comparisons in the convergence gaps.** 5.2 identifies the limit-page pairing through the
  canonical comparison, so the gaps for §§5.3 and 5.4 require their convergence isomorphisms to be the
  canonical ones of the §5.2 gap. The base provides this: its §5.3 goes through §4.4, which is
  "through the isomorphisms of 4.3", and its §5.4 route uses §4.3's `B_∞ = Bᵗ`.

**Other occurrences of the same pattern, also repaired:**

- The Mathlib contract cited "the module-category instances, as fixed in the base's Mathlib contract".
  It now names `AB5` and `AB4Star` of `ModuleCat.{u} R` in `Mathlib/Algebra/Category/ModuleCat/AB.lean`
  (lines 30 and 38 at the pin), with the files for the three classes.
- The Tau Ceti contract read its declarations "through the base's §5.1". It now gives their content.
- *How to read the build*, 1.2, 4.3 and 6.1 said "the spectral sequence of base §5.1". They now say "of
  the filtered complex (Conventions)".
- The *Dependencies* of Layers 1, 2, 4, 5 and 6 now list the gap slugs. Layer 2 now lists §2.1, which
  2.6 used but its *Dependencies* omitted.
- In `plan.json`, the statements of 1.2, 4.3 and 5.1 and the hypothesis of 1.3(c) were updated the same
  way, and so was the "what" of the StableHomotopyKTheory supplier entry.

**The review's repair test** comes out as stated. Take the stupid filtration of `ℤ →(×2) ℤ` and
`n = 1`. The filtrations of `K^0`, `K^1` and `K^2 = 0` are finite. `F^1 H^1` is the image of
`H^1(F^1 K) = ℤ` in `H^1 = ℤ/2`, which is `ℤ/2`, and `F^2 H^1 = 0`. On the spectral-sequence side,
`E_∞^{1,0} = ℤ/2 = gr^1` and `E_∞^{0,1} = H^1(gr^0) = 0 = gr^0`. This is the conclusion that 1.3(a)
consumes.

## Adversarial pass on the changed text

Here `ℓ` and `p` are primes and the ring is `ℤ` unless stated otherwise.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: classical reading of the pinned sequence | Stupid filtration of `ℤ →(×2) ℤ`, degrees 0, 1 | `E_1^{0,0}` at native `(1, −1)`, `E_1^{1,0}` at `(3, −2)`; `i₁ = −1`, `i₂ = 0` gives cokernel `gr^0`, `n = 0`; target of the pinned `d` is `(3, −2)` = classical `(1, 0)`; connecting map: lift `1 ∈ K^0`, `d1 = 2 ∈ K^1 = gr^1`, so `d_1 = +2` | Agrees with the base's witness and 1.2's Check | Added as the Conventions witness |
| gap:base-bidegree-assignments | Classical assignment on native positions; homological on `up'(−r, r − 1)`; wrong `(p, q) ↦ (q, p + q)` | `(1, −1) ↦ (0, 0)`, `(3, −2) ↦ (1, 1)`; native page `r + 1`: `fil` rises by `r = (r + 1) − 1`, so `e = 1`; homological: `fil −p → −p + r`, `deg +1`; wrong model: `fil` changes by `1 − r` | Holds; wrong model excluded | none |
| gap:base-stabilisation-regularity | `E_2^{0,1} = E_2^{2,0} = ℤ`, `d_2 = ×2` | Stabilises at `(2, 0)` from page 3, not from page 2; at `(0, 1)` coregular from page 2, regular from page 3 | Holds | none |
| gap:base-limit-page | `ℓ`-adic filtration on `K^1` of `ℤ →(id) ℤ` | `Z_r(0,0) = ℓ^{r−1}ℤ`, meet `0`, so `E_∞^{0,0} = 0` while every `E_r^{0,0} = ℤ` | The meet definition is needed | none |
| gap:base-bounded-below-regularity | Same complex, total degrees 0, 1 | Degree 1 has `E_1^{p,1−p} = ℤ/ℓ` for every `p ≥ 1`: not bounded below and not finite in degree `n + 1`; `(0, 0)` does not stabilise | The hypothesis is needed; consistent | none |
| gap:base-convergence-structures | Zero sequence, `H^0 = ℤ` with constant filtration; `I = ∅` | Weak convergence in `{0}` holds (`gr = 0 = E_∞`); not separated, so no convergence; `I = ∅` trivial | Holds | none |
| gap:base-converging-morphisms | `E_1^{0,0} = ℤ ⇒ H^0 = ℤ`; pair `(−1, id)` | `gr^0(id) = 1 ≠ −1 = E_∞(f)` | The compatibility is a real condition | none |
| gap:base-finite-filtration-convergence | `ℤ/4` and `ℤ/2 ⊕ ℤ/2` with `E_∞ = ℤ/2, ℤ/2`; `ℚ` vector spaces with `ℚ → ℚ/ℤ` | Both strongly convergent, so no splitting is claimed; `E_∞^{0,0} = ℤ ∉ P`, and page 1 is not a limit page since `d_1 ≠ 0` | Both weak Serre forms exclude the counterexample | none |
| gap:base-comparison-theorem | `E = E′ = 0`, `H^0 = ℤ` (constant) → `0`; `ℤ → ℤ_ℓ`, `ℓ`-adic | Constant filtration: not finite and not separated, so excluded; `ℤ`: not complete, so not strong, excluded | Both bad cases are outside the hypotheses | none |
| gap:base-first-quadrant-sequences | Only `E_2^{0,0} = ℤ`, `m = 0`; coextension `E_2^{0,q} = ℤ/2` | `m = 0` would claim exactness at `H^0` with identity edges, which fails, so `m ≥ 1` is kept; coextension: `0 → 0 → ℤ/2 → ℤ/2 → 0 → ℤ/2`, image = kernel at each place | Holds, with `m ≥ 1` | none |
| gap:base-einfty-comparison | `K^{−1} = ℤ →(id) K^0 = ℤ`, `F^p K^{−1} = 0` | `Bᵗ = ℤ ≠ 0 = B_∞`: the projection is not an isomorphism; weak convergence fails | "exactly when" is sharp | none |
| gap:base-induced-filtration | Same complex | `gr^0 H^0 = 0`, a proper subquotient of `E_∞^{0,0} = ℤ` | Holds | none |
| gap:base-finite-filtered-convergence | Stupid filtration of `ℤ →(×2) ℤ`, `n = 1`; `ℓ`-adic on `K^1`, `n = 0` | `F^1H^1 = ℤ/2`, `F^2H^1 = 0`; filtration of `K^1` not finite, and `(0, 0)` does not stabilise | The degree `n + 1` hypothesis is needed | none |
| gap:base-exhaustive-bounded-below-convergence | Non-exhaustive complex above; `ℓ`-adic `ℤ` in degree 0 | Not exhaustive on `K^{n−1}`: the conclusion would give `ℤ ≅ 0`, false, so excluded; not bounded below: converges, not strongly, excluded | Hypotheses needed | none |
| gap:base-exact-couple-spectral-sequence | Degrees `(−1, 1), (0, 0), (1, 0)`; couple with `E = 0` | `d_r` degree `(1, 0) − (r − 1)(−1, 1) = (r, 1 − r)`, cohomological; `E = 0`: all pages zero | Holds | none |
| gap:base-exact-couple-towers | Bockstein couple of `ℤ`; `M = (ℤ →(×p^s) ℤ)`, `f = p` | `ker i^r = 0`, so `B = 0`; `k = 0`, so `Z = E` and `E_∞ = ℤ/ℓ`. For `M`: `k(1) = p^{s−1} ∈ ℤ/p^s`, and `p^{s−1} ∈ p^r ℤ/p^s` exactly when `r ≤ s − 1`, so `Z_r = E` for `r ≤ s`, `Z_{s+1} = 0` | Agrees with 6.2's Check (`d_s` nonzero, `E_{s+1} = 0`) | none |
| gap:base-filtered-exact-couple | Stupid filtration of `ℤ →(×2) ℤ` | `k(1) = 2 ∈ D^{1,0} = H^1(F^1K) = ℤ`, `j` = identity onto `E^{1,0} = ℤ`, so `d_1 = jk = ×2` | Agrees with the Conventions witness | none |
| gap:base-tower-exact-categories | `ModuleCat ℤ`: `ℤ/ℓ^{n+1} ↠ ℤ/ℓ^n`; `×ℓ` on `ℤ` | `lim = ℤ_ℓ`, `lim¹ = 0`, projections onto; `×ℓ` is not epimorphic (`lim¹ = ℤ_ℓ/ℤ`), so it is not a counterexample | Holds; the instance condition `R : Type u` gives `Small R` | none |
| gap:base-complete-convergence | `ℓ`-adic `ℤ_ℓ` in degree 0; `ℓ`-adic `ℤ` | `E_1^{p,−p} = ℤ/ℓ` for `p ≥ 0` and `0` for `p < 0`, so the lower bound holds; regular, with one degree; strong to `ℤ_ℓ`. `ℤ` is not complete, so excluded | Holds; completeness needed | none |
| 5.1 on §7.22 pages | "μ index shift" Check: `M = (ℤ →(×4) ℤ)`, `f = 2` | `d_2(1·1) = j(1) = 1` computed from the first derived couple, with no use of base §6.1 | Check unchanged | none |
| StableHomotopyKTheory contract (`d_r` degree) | Derived couple degrees `a, b − a, c` | `(r − 1)`-th derived `j`-degree `b − (r − 1)a`, so `jk` has degree `c + b − (r − 1)a` | Matches §7.22 | none |
| Mathlib contract (instances) | `Mathlib/Algebra/Category/ModuleCat/AB.lean` | `instance : AB5 (ModuleCat.{u} R)` at line 30; `AB4Star` at line 38 | Exists at the pin | none |

No target statement, hypothesis or Check of Layers 1–6 changed mathematically. The changes are the
supply contracts, the `*Needs:*` lines, and the reading of base §5.1 on the pinned construction. That
reading is the same object, so every Check and worked example that uses the filtered-complex
spectral sequence keeps its values. I recomputed the ones that pin its indexing: 1.2's first
differential `+2`, 1.3's finite case, 6.1's `d_1 = +1`, and 6.2's `ℤ/p^r` complex.

## Checks

- **Dependency check.** The command from the brief gives:

  ```text
  candidate: SpectralSequencesAndConvergencePartII is not in the merge order yet; checked as if placed after ArithmeticGaloisDuality (the intake inserts it when its design is accepted)
  depcheck: 240 roadmaps, 2170 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line. Absence from the merge order is expected at the design stage.
- **Citations.** `roadmaps resolve` on the README reports no cross-roadmap citation and no roadmap Lean
  name found nowhere. It does not check library names on this host, so I checked by hand at the pins
  every library name the edits add:
  - `CochainComplex.spectralObjectMap`, `CochainComplex.spectralSequence`,
    `CochainComplex.filtrationAbutmentIso` (`Filtered/Convergence.lean:51`).
  - `CategoryTheory.Abelian.SpectralObject.spectralSequenceMap` and `CategoryTheory.Abelian.SpectralObject.EInfty`
    (`SpectralObject/Stabilization.lean:45`, namespace `CategoryTheory.Abelian.SpectralObject`).
  - `CategoryTheory.Functor.towerDifference` (`CategoryTheory/Preadditive/TowerDifference.lean:77`).
  - `CategoryTheory.FilteredObject` and `.Hom` (`Mathlib/CategoryTheory/Filtration/Basic.lean:73`,
    `:90`).
  - `CategoryTheory.CohomologicalSpectralSequence` (`Mathlib/Algebra/Homology/SpectralSequence/Basic.lean:109`).
  - `HasCountableProducts` and `HasCountableCoproducts` (`Countable.lean:61`, `:108`), `CountableAB4Star`
    (`GrothendieckAxioms/Basic.lean:126`), `HasExactColimitsOfShape` (`HasExactLimitsOfShape.lean:47`).
- **Lean.** This design has no `Suggested.lean`, so there was no `#check @name` scratch file to
  elaborate and no Lean command was run.
- **Ownership.** No new target or construction was added. The two replacements cite existing owners:
  pinned Tau Ceti for the content of base §5.1, and StableHomotopyKTheory §7.22 on main for the pages
  of exact couples. The overlap tool found nothing for this roadmap.
- **Sources.** No source was added or fetched, and no `needs-references.toml` was written.

## For the maintainer

- **The gaps can only be supplied once the base is admitted.** The 19 gaps all name
  SpectralSequencesAndConvergence, which is a board design in review: it is not on main, not in an
  open roadmap pull request and not in `ORDER.txt`. Its section numbers were read from that design
  (§§1.2–1.4, 2.1, 2.2, 3.1–3.6, 4.3, 5.2–5.4, 6.1–6.3, 7.2, 7.4, 7.5) and all exist there. If the
  base renumbers them, the `section` fields and the "base §X" references here follow. The base's §§1.3,
  2.2, 3.4, 3.6 and 6.1 state their results essentially as the gaps phrase them.
- **Three gaps ask for slightly more than the base states.**
  - The §2.1 gap asks for the homological assignment on page shapes `up'(−r, r − 1)` over `ℤ × ℤ`. Base
    §2.1 registers it only on `coreE₂HomologicalNat` (`ℕ × ℕ`), although its general definition covers
    both.
  - The §3.6 gap asks that the five-term sequence's map `E_2^{0,1} → E_2^{2,0}` be `d_2` and that the
    other maps be the edge morphisms. Part II's 3.3 relies on this; the base implies it without saying
    so.
  - The §§5.3–5.4 gaps ask that the convergence isomorphisms be the canonical comparisons of base §5.2.
- **No name changed** that other roadmaps cite: no target id, section or Lean name of this roadmap
  changed. The plan's `suppliers` list no longer contains the base; the base stays as `parent`.
- **The previous human-reviewer note still applies**: the base is a board design that has not been
  accepted. This round makes the dependency explicit as gaps; it does not decide the base's
  admission, which is a merge-order decision.
