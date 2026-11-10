# Review of GrothendieckTopoi (pull request #1520 at 25f804d)

**Verdict:** accepted

This is an incremental re-review of the 75 lines changed since 59848bc, all in `TauCetiRoadmap/GrothendieckTopoi/README.md`: Deligne's theorem for coherent topoi is now consumed from AdicEtaleGeometry A1.15 (Summary, Scope, supplier contracts, 6.4, Layer 6 Dependencies), the stalks of extension by zero on a space are now consumed from DiamondEtaleCohomology (Scope, supplier contracts, 9.1, Layer 9 Dependencies), and Downstream consumers gains a sentence on ClassifyingTopoi. `Suggested.lean` is unchanged. No finding. The gate passes at this head with the candidate merge order, `Suggested.lean` elaborates with `sorry` as its only warning, and the dependency check reports no problem.

## Previous findings

- None. The review of 59848bc accepted with no finding.

## Verified sound

**The two new supplier citations, resolved against the suppliers as they are now.**

- **AdicEtaleGeometry A1.15** is on main (`TauCetiRoadmap/AdicEtaleGeometry/README.md`, heading `### A1.15 points` at line 5673, the statement *coherent-topos-enough-points* at lines 5763–5778). It states: a site with `C : Type u`, morphisms in `Type v`, `EssentiallySmall.{w} C`, coherent topos (algebraic with quasicompact quasiseparated terminal object, "for instance" finite limits and finite covering subfamilies), conclusion `GrothendieckTopology.HasEnoughPoints.{w} J`. The contract paragraph at README lines 246–250 restates exactly this, hypothesis by hypothesis. A1.15 is marked there "README only (no Lean declaration)", and `coherentTopology_hasEnoughPoints` does not occur in that roadmap's `Suggested.lean`, so `hasEnoughPoints_coherentTopology` here duplicates no declared name. AdicEtaleGeometry does not cite GrothendieckTopoi (no occurrence), so no cycle.
- **DiamondEtaleCohomology, "Topological open extension by zero"** is the heading at line 152 of that roadmap's README at its open head (a new roadmap folder, earlier in the merge order: line 75, with GrothendieckTopoi at line 76), under `## Exact supplier contracts` (line 49), as README line 252 says. Its bullets state, for every ring `Λ`, a space `X` and an open `U`: left adjoint to restriction, preservation of finite limits and colimits, stalk the input stalk at `x ∈ U`, stalk zero at `x ∉ U`, with the functor defined through `sheafEquivOver` and the sheaf pullback along `Over.forget U`, the same functor as 9.1's. README lines 93–95, 252–254 and 1342–1344 describe it correctly; `Λ = ℤ` is the stated specialisation. DiamondEtaleCohomology does not cite GrothendieckTopoi. The pull request description's generated `depends-on` block names it.
- Pinned Mathlib has `HasEnoughPoints` instances only for the small étale topology (`Mathlib/AlgebraicGeometry/Sites/EtalePoint.lean:157`), spaces (`Mathlib/Topology/Sheaves/Points.lean:72`) and the over-site transfer (`Mathlib/CategoryTheory/Sites/Point/Over.lean:87`); none for a coherent topology. Pinned Tau Ceti mentions `coherentTopology` only in `TauCeti/Condensed/Light/Replete.lean`. So 6.4 is not already in the libraries.

**6.4 as changed (README lines 1005–1024).**

- "Generalises A1.15 by dropping the quasicompactness of the terminal object": coherent is locally coherent plus that condition in 6.3's definitions (line 980), so the claim is the definition. Separating instance: `Sh(ℕ)`, discrete `ℕ`, is locally coherent and not coherent (6.3 Check 3), has enough points (the `n : ℕ`), and is outside A1.15.
- "A1.15 is the more general in universes": true as stated (three universes there, one here; A1.15's own Check uses `{1,1,0}` for profinite `G`-sets, which a `SmallCategory` hypothesis does not admit). Neither statement contains the other, and the text says so.
- The route's use of A1.15 "with `v = w = u`": for small `C` and `c : C`, `Over c` is a small category in `Type u`; it has a terminal object, binary products (pullbacks in `C`) and equalizers (the pullback of `(f, g) : d → e ×_c e` along the diagonal, recomputed: a map `h` into `d` equalizes `f, g` exactly when `(f, g) h` factors through the diagonal). Every covering family of `(coherentTopology C).over c` has a finite covering subfamily: the generated sieve contains a finite effective-epimorphic family `g_j`, each `g_j` factors through some member `f_{i(j)}`, and the `f_{i(j)}` generate a sieve containing the `g_j`. This is A1.15's "for instance" clause, so the slice is coherent and A1.15 applies. No step uses 6.4 itself.
- The `*Needs:*` line and the Layer 6 Dependencies paragraph (lines 1079–1080) now name A1.15; the Lean statement (`Suggested.lean` lines 458–461: `C : Type u`, `[SmallCategory C]`, `[Precoherent C]`, `[HasPullbacks C]`) equals the README's.
- Summary (line 15), How-to-read sentence (line 45) and Scope (lines 65–67) say the same thing as 6.4.

**9.1 as changed (lines 1342–1348).** The stalk statement is no longer a target of this roadmap and is cited; the remaining "prove" clause (sections with closed support) is unchanged. The 9.1 Checks (Sierpiński, `ℝ` with `U = (0, ∞)`) agree with the supplier's two stalk bullets. Layer 9 Dependencies (lines 1500–1502) names the supplier.

**Downstream consumers (last sentence).** ClassifyingTopoi at its open head cites GrothendieckTopoi Convention 1 (its line 110), Convention 4 (136), 1.1 (59, 194, 397), 1.2 (358, 452), 2.1 and 2.2 (61, 134, 397), 2.4 (381), 2.5 (62, 400 and later), 4.1–4.2 (63, 542) and 6.1 (64, 591): eleven ids, exactly the list given, and each exists here. The TotallyDistributiveTopoi sentences are only re-wrapped.

**Gate, build, direction.**

- **Gate.** The worker's gate at 25f804d passes every check (`depcheck=0 … build=0 OK`). Run here without the candidate order it reports only `depcheck: NOT IN ORDER: GrothendieckTopoi (insert it after its last supplier)`, which is the placement of a roadmap the public merge order does not list yet, not a defect; every other counter is 0.
- **Dependency check** with the candidate order and `--movable`: `depcheck: 234 roadmaps, 2264 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` exits 0 with 40 `declaration uses sorry` warnings and nothing else, as at 59848bc. The file's last change is 38e9e22, so the `#check` signature comparison and the one-tactic probe of the earlier rounds stand.
- **Outside changes.** `git diff --stat origin/main...HEAD` lists only the three files of the folder. Pins unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.

**Overlaps and citations.** `scratch/overlaps.md`: no other pull request changes this roadmap, no dropped id, no id only a revision defines. `scratch/citations.md`: no cross-roadmap citation missing; the 19 Lean-name leads are the same as in the previous rounds (this roadmap's own declarations, a generated Mathlib instance name, `IsLocallyConnectedSite` named as Mathlib's open work, AdicSpacesPartII `Topos.*`), none in a changed line. Ownership against TotallyDistributiveTopoi and ClassifyingTopoi (the two closest open roadmaps): both are consumers and leave these objects to this roadmap (ClassifyingTopoi lines 58–66).

**Seeded sample.** Of the sampled targets (1.1, 2.3, 2.5, 3.1, 3.2, 4.3, 4.5, 6.2, 6.4, 6.5, 7.1, 8.2, 8.5, 9.2, 9.5) only 6.4 lies in a changed passage; its statement and locators (SGA 4 VI 9.0; Mac Lane–Moerdijk IX.11) are unchanged, and A1.15 on main cites the same Proposition 9.0 of Deligne's appendix. See Not verifiable. The README flags no locator as unverified.

**Adversarial pass.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 6.4 (changed text): locally coherent ⇒ enough points; `hasEnoughPoints_coherentTopology` | `C` empty; `C` one object (`Type u`); `Sh(ℕ)` discrete; `Sh` of the regular opens of `ℝ` | empty: degenerate topos, empty family conservative. `Type u`: one point, conservative. `Sh(ℕ)`: points `n`, `F ↦ F({n})` jointly conservative. Regular opens: a nonzero `b` splits into infinitely many disjoint nonzero pieces, so only `⊥` is compact, no quasicompact generators, not locally coherent, and no point, consistent | holds | none |
| 6.4 (changed): relation to A1.15 | `Sh(ℕ)`; profinite `G`-sets with universes `{1,1,0}` | `Sh(ℕ)`: terminal not quasicompact, A1.15 silent, 6.4 applies. `G`-pfsets: not a `SmallCategory`, 6.4 silent, A1.15 applies | both directions as the text says | none |
| 6.4 route (changed): slice over `ℓ c` coherent, A1.15 at `v = w = u` | `Over c` limits; a covering family `{f_i}` of the over-topology | terminal `id_c`; product = pullback; equalizer = pullback along the diagonal of `e` over `c`; finite subfamily `{f_{i(j)}}` covers | A1.15's "for instance" hypotheses hold | none |
| Contract "From AdicEtaleGeometry" (new) | compared with A1.15 lines 5763–5778 on main | `C : Type u`, `Type v`, `EssentiallySmall.{w}`, coherent, `HasEnoughPoints.{w}` on both sides | agrees | none |
| 9.1 stalks (changed: cited) and contract "From DiamondEtaleCohomology" (new) | `U = ∅`; `U = X`; Sierpiński `U = {o}`; `ℝ`, `U = (0, ∞)` at `0` | `∅`: `j_!F = 0`, all stalks `0`. `X`: `j_! = id`, stalk `F_x`. Sierpiński: `j_!ℤ(X) = 0` (support `{o}` not closed), stalk `0` at `c`, `ℤ` at `o`. `ℝ`: stalk `0` at `0`. Supplier bullets give the same four values with `Λ = ℤ` | agrees | none |
| Downstream consumers, ClassifyingTopoi sentence (new) | 11 cited ids against that README | all 11 found, none extra | agrees | none |
| 9.5 remark, 5.6, 6.5, 4.4 Check 3, 8.5, and the statements 1.1–1.4, 2.1–2.5, 3.1–3.3, 4.1–4.3, 4.5, 5.1–5.5, 6.1–6.3, 7.1–7.4, 8.1–8.4, 9.2–9.4, Convention 9 and their Checks | as in the review of 59848bc and the tables it carries | the values in those reports; the diff touches none of them | unchanged | none |

**Principles.** The change replaces two statements this roadmap would otherwise restate by citations of their owners, by roadmap and section, with no pull-request number in the README; no copied passage, algorithm, process wording, sorry'd data or `set_option`.

**Declared gaps.** None are declared.

**Remark on untouched text (no change requested).** The description's sentence "It consumes:" lists AdicSpacesPartII R0.19.10 and Mathlib; at this head the README also consumes AdicEtaleGeometry A1.15, DiamondEtaleCohomology and Tau Ceti's local cohomology sheaves, and has nine layers where the description lists eight. The list was already a summary in the rounds that accepted it, and the generated `depends-on` block names the one open supplier.

## Not verifiable

- SGA 4 VI 9.0 (Deligne's appendix) and Mac Lane–Moerdijk IX.11, the locators of 6.4, and SGA 4 IV 11.3.1–11.3.2 for 9.1: not in the sources cache (the manifest records only `isbell1972`, `isbell1981`, `hofmann-lawson1978`) and not read here, as in earlier rounds. The statements were recomputed on the instances above, and AdicEtaleGeometry A1.15 on main gives the same locator for the coherent case.

## Source issues

- none
