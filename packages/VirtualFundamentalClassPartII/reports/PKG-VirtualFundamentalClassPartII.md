# PKG-VirtualFundamentalClassPartII

Deliverables: `packages/VirtualFundamentalClassPartII/README.md` (2215 lines),
`packages/VirtualFundamentalClassPartII/Suggested.lean`, `packages/VirtualFundamentalClassPartII/metadata.toml`
(`topic = "math.AG"`, as the supplier folders on main), `packages/VirtualFundamentalClassPartII/sources.toml`
(one `cited_for` entry updated), and the `gaps` list of `packages/VirtualFundamentalClassPartII/design/plan.json`
(one gap narrowed; nothing else in the plan changed, checked by comparing the plan minus `gaps` before and after).

The README is the accepted design written out: every layer, section, target, API bullet, Check and
worked example of the design is kept. The design was already in roadmap prose. The changes are the
ownership corrections below, two gap statements put in the required form, one added Check, and
wording.

## Headline theorems

None is statable at the pins. The pinned Mathlib has no algebraic stacks. The pinned Tau Ceti has
only `TauCeti.AlgebraicGeometry.SchPseudofunctor` and `TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace`:
there are no algebraic or Deligne–Mumford stacks (searched for `IsAlgebraicStack`, `IsDeligneMumford`,
`AlgebraicStack`, `DeligneMumford` in both trees, no hit). `TauCeti.AlgebraicGeometry.Chow.ChowGroup`
is for locally Noetherian schemes, with pushforward along closed immersions only. Neither library has
the cotangent complex of a morphism as an object of a derived category. Tau Ceti has
`AlgebraicGeometry.Scheme.Hom.higherDirectImage` one degree at a time, not `Rπ_*` as a derived
functor. Each headline is named in the module docstring of `Suggested.lean` with what it lacks:

| # | Headline (README section) | Status | What it lacks at the pins |
|---|---|---|---|
| 1 | Integral Chow groups of Deligne–Mumford stacks that need not be separated, and their rationalisation equal to the separated rational groups (2.2–2.3) | not statable | DM stacks, integral closed substacks, Chow groups of stacks |
| 2 | Rational pushforward along every proper morphism, Gysin maps acting on stacks, homotopy invariance, Chern classes (4.1–4.3) | not statable | stacks, proper covers, Chow groups of stacks and algebraic spaces |
| 3 | Intersection ring of a smooth DM stack and Poincaré duality (5.1) | not statable | Chow groups of stacks, diagonal Gysin map, bivariant groups |
| 4 | Moduli-space comparison `p_* : A_*(ℳ)_ℚ ≅ A_*(M)_ℚ` (5.2) | not statable | stacks, Chow groups of algebraic spaces |
| 5 | Edidin–Graham comparison is a ring isomorphism (5.3) | not statable | quotient stacks, equivariant Chow groups |
| 6 | Degree of a closed point `∫[𝒢_x] = [κ(x) : k]/\|Aut(x̄)\|` (5.4) | not statable | residual gerbes, residue fields of stack points, degree on stacks |
| 7 | Virtual class without the resolution property or separatedness, and relative formulas over pure-dimensional bases (6.1–6.3) | not statable | cotangent complex of stacks, cone stacks, intrinsic normal cone, obstruction theories |
| 8 | Relative obstruction class and relative characterisation (7.1–7.2) | not statable | cotangent complex of a morphism of stacks in a derived category |
| 9 | Relative tangent invariance of the canonical rational equivalence (8.1) | not statable | normal cones of local immersions of stacks |
| 10 | Regular-immersion pullback and functoriality over pure-dimensional bases (8.2–8.3) | not statable | virtual classes, Gysin maps on stacks |
| 11 | Deformation invariance of virtual counts (8.4) | not statable | virtual classes; for schemes too, the cotangent complex |
| 12 | Perfect relative obstruction theory of relative spaces of maps, its global resolutions and virtual dimension (9.3–9.5) | not statable | stacks; `Rπ_*` in a derived category and `L_{M/𝔅}`; even for `𝔅 = Spec k` and `M` a scheme |

I also checked the scheme-level shadows for a statable headline. None qualifies.

- 9.4's cohomological lemma would need `Rπ_*` as a derived object. A version through the separate
  `R^q π_*` would be a weakened stand-in.
- 9.5's rank formula `χ(F^*T_X) = δ + ℓ(1 − g)` is the definition of `vectorBundleDegree` plus
  `χ(O) = 1 − g`, which is algebra on its hypotheses.

So `Suggested.lean` states nothing. It has the module docstring and the namespace
`TauCetiRoadmap.VirtualFundamentalClassPartII`, as the brief allows when nothing is statable.

## Corrections to the design (what changed and why)

1. **Ownership of closed substacks, residual gerbes and residue fields.**
   - StackPointsAndResidualGerbes is at line 38 of the merge order, earlier than this roadmap (line 340). It is
     on this roadmap's supplier list.
   - At its open head it owns closed substacks and their presentation description (§0.3), reduced
     stacks (§0.1), the unique reduced closed substack on a closed subset (§0.5), the automorphism
     group space `G_x` (§1.3), gerbes (§§2.3, 2.5), residual gerbes at closed points (§4.5), residue
     fields (§5.3) and the dense open gerbe (§5.4), for every algebraic stack.
   - The design report itself recorded that once this roadmap entered the merge order, the
     closed-substacks gap should be discharged by citing it and 5.4's `κ(x)` identified with its
     residue field. Both are now done:
     - a new supplier subsection "From TauCetiRoadmap.StackPointsAndResidualGerbes";
     - a Scope bullet;
     - Layer 1's standing sentence;
     - *Needs:* lines of 1.1, 1.2, 2.1, 5.4;
     - Dependencies of Layers 1, 2, 5.
2. **Function field (1.2).** `k(𝒱)` is now SPG §5.3's residue field at the generic point. Vistoli's
   colimit over open substacks becomes a theorem, proved through SPG §§5.4, 2.3, 2.5, 0.3. Before, the
   colimit was a second definition of the same object. A Check now separates it from global
   functions and from the residue field at a closed point (`[ℙ¹/μ₂]`). `e(𝒱)` is now stated through
   SPG §1.3's `G_x̄` (Convention 5, 1.2).
3. **Degree of a point (5.4).**
   - `𝒢_x` is SPG §4.5's residual gerbe, which is the reduced closed substack on `{x}`.
   - `κ(x)` is SPG §5.3's residue field, equal to `k(𝒢_x)` by 1.2.
   - `Aut(x̄)` is SPG §1.3's `G_x̄`.
   - "Residual gerbes" is no longer in the "not part of this roadmap" list.
4. **`gap:closed-substacks-of-stacks` narrowed** in the README and in `plan.json` (same slug, same
   supplier VirtualFundamentalClass §2.1). It now asks only for what nobody else states:
   - integral closed substacks;
   - their bijection with irreducible closed subsets;
   - the image of an integral closed substack under a proper morphism.

   SPG states the rest. SPG's scope expressly leaves integral closed substacks to their user, and
   VirtualFundamentalClass §2.1 builds its cycles on them, so the gap stays with it.
   - The image under a flat morphism is no longer asked for: no section uses it (3.1 forms
     `𝒱 ×_𝒢 ℱ`, a base change of SPG §0.3).
   - `neededBy` is now 1.3, 2.1, 3.2, 3.3, 4.1, 5.2. 1.3 and 4.1 use images (their *Needs:* lines
     now say so). 1.1, 1.2 and 5.4 no longer need the gap.
   - The plan's layer prerequisites, which this job may not edit, still list the gap under 1.1, 1.2
     and 5.4.
5. **Gap statements in the required form.** Both now read
   `What VirtualFundamentalClass must provide (gap:<slug>): in its §N, <needs>`.
6. **Wording.** "removes" became "does without" or "drops" (Summary, Scope, 6.2, Downstream
   consumers). "now with a rational factor" in 4.1 became "with a factor that need not be an
   integer". Convention 8 now says why `Suggested.lean` states nothing.

Review notes: the accepting review's one finding (P3, the class of the source in base-change
clauses) was repaired in fix round 17 before acceptance. `review.json` carries no further
non-blocking note. Nothing else was open.

## What the README could not support

- gillet1984 and fulton1998 are paywalled and settled as `uncertified`, so they are cited by locator
  only.
- vistoli1989 is an OCR text. The displays of (1.15), (2.1) and the covering formula are garbled and
  were matched by content, as the design recorded.
- The global gluing in 8.1–8.3 is checked on charts and on the Checks, not as a proof.
- No text is missing, and no `needs-references.toml` was written.

## Notions moved down from later roadmaps

None. AlgebraicGromovWittenTheory is named only as a consumer and for comparison, never in a *Needs:*
line or a supplier subsection.

## Duplication sweep (by object) and removals

- **Removed and cited** (StackPointsAndResidualGerbes):
  - closed substacks, their presentation description and base change (§0.3);
  - the reduced closed substack on a closed subset (§0.5);
  - reducedness (§0.1);
  - the automorphism group space (§1.3);
  - residual gerbes at closed points (§4.5);
  - residue fields (§5.3);
  - the function-field definition (now §5.3 at the generic point).
- **Checked and kept, with their owners cited.**
  - VirtualFundamentalClass at its open head, 1272 lines. Sections 0.2–9.6 were read: Scope,
    Conventions, §§0.2–0.3, 1.4–1.6, 2.1–2.5, 3.1–3.5, 4.1–4.5, 5.1–5.5, 6.1–6.6, 7.1–7.7,
    8.1–8.5, 9.1–9.6. Each says what the contract quotes. §1.5 still covers closed immersions only,
    and §2.1 still uses integral closed substacks without stating them, so both gaps stand.
  - StableReductionPartII §5.15: it holds the Edidin–Graham group comparison with Chern classes and
    proper pushforward. It states no product compatibility, so 5.3 adds only that.
  - AlgebraicGromovWittenTheory §§4.1–4.3 is the special case of 9.3–9.5. Its §4.3 formula is
    `(1 − g)(d − 3) + n + c₁(T_X)·β`. The maintainer's settled decision keeps it as a consumer.
  - SchemeAndStackFoundations on main: the 23 cited sections exist, and the 30 declaration names the
    README quotes occur in its README (counted).
- **Searches across main and all 454 open heads with `roadmaps grep`:**
  - "Vistoli": only VirtualFundamentalClass, StableReductionPartII, and unrelated
    Abramovich–Vistoli or Borne–Vistoli citations.
  - "Chow groups of (algebraic) spaces": only VirtualFundamentalClass, as a reference.
  - "integral Chow": scheme uses only.
  - Coarse-space Chow comparison: no match.
  - "deformation invarian": only AnalyticStableMaps, which is symplectic.
  - "proper cover", "generic stabiliser" and "Kodaira–Spencer": no stack-Chow or obstruction-theory
    owner.
  - Stack intersection ring and point degree: no match.
- **Board packages:** the only related design is the stopped VirtualFundamentalClasses. The other
  hits ("virtual class") are K-theory uses.
- **Pinned libraries:** no stack, stack-Chow, cotangent-complex or obstruction-theory object (above).
- **Ownership against open pull requests** was checked with the tools over all open heads. No
  declaration of `Suggested.lean` takes a name from another roadmap, since it declares none.

## Adversarial pass (statements written or changed in this job)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Convention 5: integral = reduced (SPG §0.1) + irreducible | `Spec k[ε]`; `Spec k ⊔ Spec k`; `BG`, `G` finite étale | irreducible and not reduced, so not integral (its reduction `Spec k` is); reduced with 2 components, so not integral; atlas `Spec k` reduced and one point, so integral | holds | definition stated with SPG §0.1 |
| Convention 5 / 1.2: `e(𝒱) = \|G_x̄\|` at a geometric point | `Bμ₃` over `ℚ`; `[Spec ℂ/(ℤ/4)]` over `ℝ`; `[𝔸¹/μ₂]` | `μ₃(ℚ) = 1` but `G_x̄ = μ₃(ℚ̄) = ℤ/3`, `e = 3`; `G_x̄ = ker(ℤ/4 → ℤ/2) = ℤ/2`, `e = 2` (acting group gives 4); generic `G` trivial, `e = 1` (origin gives 2) | geometric point needed | stated via SPG §1.3 |
| 1.2: `k(𝒱) := κ(ξ)` equals Vistoli's colimit | `BG`; `[𝔸¹/μ₂]`; `[Spec ℂ/(ℤ/4)]`; `𝔸¹_y × B(ℤ/p)` in char `p` | `κ = k = Γ(BG, O)`; dense open gerbe `[𝔾_m/μ₂] ≅ 𝔾_m`, `κ = k(x²) = k(x)^{μ₂}`; `κ = ℝ = ℂ^{ℤ/4}` (SPG §5.3 Check); gerbe over `𝔸¹_y`, `κ = k(y)`, and 1.3's degree `(1/p)·[k(y) : k(y^p)] = 1` unchanged | holds | definition moved to SPG §5.3; colimit is a theorem |
| 1.2: wrong models excluded (new Check) | `[ℙ¹/μ₂]`, `x ↦ −x`, char ≠ 2 | global functions `k` (trdeg `0`) against `k(t²)` (trdeg `1 = dim`); residue field at `0` (gerbe `Bμ₂`) is `k ≠ k(t²)` | both wrong models fail | Check added |
| 1.2 route: `O_Z = π_*O_𝒰`, opens of a gerbe | `BG_U → U`, trivial action; `Bμ₂ → Spec k` | invariants of the trivial action give `O_U`; `\|Bμ₂\| → \|Spec k\|` one point to one point, a homeomorphism (SPG §2.5) | holds | SPG §§2.3, 2.5 cited |
| gap: integral closed substacks ↔ irreducible closed subsets | `Spec k[ε]`, `T = {pt}`; `[𝔸¹/μ₂]`, `T = {0}`; `L`, `T = {0₁}` | closed substacks with support `T`: `Spec k`, `Spec k[ε]`, only the first reduced, so 1 for 1; `Bμ₂` reduced, `[V(x²)/μ₂]` not (cycle `2·[Bμ₂]`); the reduced point at `0₁`, distinct from `0₂` | holds | gap narrowed |
| gap: image of an integral substack under a proper `f` | coarse map `[𝔸¹/μ₂] → 𝔸¹`, `𝒱 = Bμ₂`; `π : Spec k → BG`; open immersion `𝔾_m → 𝔸¹` | `\|f\|(\|𝒱\|) = {0}`, `f(𝒱)` the reduced origin, `deg = 1/2` (1.3 Check); `f(Spec k) = BG`, `π_*[Spec k] = \|G\|·[BG]` (3.2 Check); image `𝔾_m` not closed, so not proper and excluded | properness needed | gap narrowed |
| gap: flat images dropped | `π : Spec k → BG` flat, 3.1 | `π^*[BG] = [Spec k ×_{BG} BG] = [Spec k]`, by SPG §0.3 base change, with no image | unused | dropped from gap |
| 4.1 *Needs:* gap for `f(𝒱)` | `BG → Spec k`, `𝒱 = BG` | `f(𝒱) = Spec k`, degree `1/\|G\|`, `f_*[BG] = (1/\|G\|)·[Spec k]` | uses image | *Needs:* line added |
| 5.4: `𝒢_x` = residual gerbe (SPG §4.5), `κ(x)` (SPG §5.3) | `[ℙ¹/μ₂]` at `0` and at the free orbit `{±1}`; `Bμ₃/ℚ`; `Spec K`; `[Spec ℂ/(ℤ/4)]`/`ℝ`; `ℙ¹_ℚ`, point `t² + 1` | `𝒢_0 = Bμ₂`, `κ = k`, `∫ = 1/2`; orbit point `κ = k`, trivial `G`, `∫ = 1`, and `div(t²/(t² − 1)) = 2·[𝒫] − [𝒪]` gives `2·(1/2) − 1 = 0`; `1/3`; `[K : k]`; `[ℝ : ℝ]/2 = 1/2`; `[ℚ(i) : ℚ]/1 = 2` | holds | stated via SPG |
| 5.4: wrong models excluded | the nonreduced `[V(x²)/μ₂]` at `0`; generic point of `[ℙ¹/μ₂]` | `∫ = 2·(1/2) = 1 ≠ 1/2`, so the reduced residual gerbe is needed; the generic residual gerbe is not closed (SPG §4.5), so the statement is for closed points | holds | none |
| SPG hypotheses on Convention 1 stacks | Convention 1 stack; `Bℤ` (excluded) | diagonal qc and separated, so quasi-separated, so decent (SPG §5.3 last bullet); inertia is a base change of the diagonal, so qc (SPG §5.4); `Bℤ` has inertia `ℤ`, not qc, and SPG §5.4 fails, consistent with its exclusion | hypotheses met | contract states them |
| Gap form (both) | literal form of the brief | `What VirtualFundamentalClass must provide (gap:<slug>): …` | conforms | reworded |
| `Suggested.lean` | elaboration | exit `0`, no message | nothing stated | — |

## Elaboration

`lake env lean <absolute path>/packages/VirtualFundamentalClassPartII/Suggested.lean`, run from the
content checkout: exit code 0, **0 `sorry` warnings, no other message**. The file has no declaration,
so the `#check @name` comparison has nothing to compare: no binder can be lost.

To pin the library declarations the README cites, I elaborated a scratch file that imports Mathlib
and the three built Tau Ceti modules and runs `#check` on each. All exist, with the signatures the
contracts describe:

- Mathlib: `AlgebraicGeometry.AlgebraicCycle`, `.map` (`[QuasiCompact f]`), `AlgebraicGeometry.Scheme.ord`
  (integral, locally Noetherian), `IsClosedImmersion`, `Flat`, `Etale`, `Smooth`, `IsProper`;
- Tau Ceti: `Chow.cyclesOfDimension`, `Chow.RatEquiv`, `Chow.ChowGroup`, `Chow.cycleClass`,
  `Chow.ChowGroup.equivIntOfUnique`, `Spaces.IsAlgebraicSpace`, `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree`.

The object files of `Chow/ClosedImmersion`, `Stack/Basic` and `Curves/Prestable` are not built, so
these were read at the pinned source instead:

- `ChowGroup.pushforward` (line 211);
- `SchPseudofunctor` (line 37);
- `PrestableFamily` (class at line 45, syntomic of relative dimension one at line 55, stable under base
  change at line 65).

## Dependency check (verbatim)

    depcheck: 242 roadmaps, 2263 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line.

- Suppliers named:
  - VirtualFundamentalClass, an open pull request by another author that adds a new folder;
  - StackPointsAndResidualGerbes and StableReductionPartII, both earlier in the merge order;
  - SchemeAndStackFoundations, EquivariantIntersectionTheory, StableReduction, EnhancedDerivedSheaves
    and DerivedModuleAlgebra, all on main.
- None of the never-cite roadmaps occurs in the README (counted).
- `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name found nowhere.
- `sources check`: 0 problems.
- `roadmaps overlaps VirtualFundamentalClassPartII`: no open pull request changes it.

## Sources

No source was fetched: every cited text was already in the manifest (14 entries, all cited,
none missing). The `vistoli1989` `cited_for` entry for the closed-substacks gap was updated to the
narrowed gap. No `needs-references.toml` was written.

## Suspicious text

None. The maintainer notes, reviews and supplier READMEs were read as data. None asks for any action
outside this job.
