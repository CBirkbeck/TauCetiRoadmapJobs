# Review of ShimuraData (pull request #1038 at 6eee3da)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `b4aa112`, and of the pull request's title and description as they stand now. No finding.

## Previous findings

- R01 — repaired: the description now reads "`Suggested.lean` states one headline theorem, the Kostant opposition involution `kostantInvolution` (§3.13) … The end results are not statable at the pins", which is what the head shows (1 theorem, 0 definitions).
- R02 — repaired: the description now reads "Claude for repairs of citations, locators and wording; the author-side red-team passes are part of the branch"; the branch has the four red-team commits `8e6b807c`, `98a9e807`, `bf2c1dd9`, `286dffad`.

## Verified sound

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| `kostantInvolution` (§3.13), as the description states it | `A₂`, `J={1}`, `w₀J=s₁`, `w₀=s₁s₂s₁`; left-minimal `w∈{1,s₂,s₂s₁}` | `1↦s₂s₁`, `s₂↦s₂`, `s₂s₁↦1`; lengths `2+0+1`, `1+1+1`, `0+2+1`, each `=3`; applied twice gives `w` | holds; matches the README Check |
| same, `J=∅` | `w₀J=1`, every `w` minimal | map `w↦w·w₀`; `ℓ(ww₀)+ℓ(w)+0=ℓ(w₀)`; `(ww₀)w₀=w` | holds |
| same, `J=B` | `w₀J=w₀`, only `w=1` minimal | `w₀·1·w₀=1`; `0+0+ℓ(w₀)=ℓ(w₀)` | holds |
| same, trivial and infinite `W` | `W=1`; `W` infinite dihedral | `W=1`: `0+0+0=0`. Infinite: `h₀` has no witness, as the README's "with longest full and parabolic elements" says | consistent |
| same, direction of minimality | native `IsMinimalCosetRep J u`: `ℓ(u)≤ℓ(u·v)` for `v∈W_J` (Tau Ceti `GroupTheory/Coxeter/Parabolic.lean` line 239) | applied to `w⁻¹`: `ℓ(w)≤ℓ(v⁻¹w)`, shortest in `W_J·w`; the description's "coset `W_J·w`" agrees | holds |
| Description: `ℓ > 5`, "every place above ℓ … a single place does not suffice" | §5.21, `ℓ=5`; `F=ℚ(√2)`, `ℓ=7`, `u=7+5√2` | `v(ζ₅−1)=1/4`, bound fails at `ℓ=5`; `u·(7−5√2)=49−50=−1`, `u≡1` at one place above 7 only | description agrees with §5.21 and its Checks |

The rows for the untouched statements stand as in the previous review, of `b4aa112`.

- Folder: 0 lines changed since `b4aa112`; no changed passage, so none of the fifteen seeded targets falls in one, and the README flags no locator as unverified. Source locators checked this round: 0.
- Changes of the pull request outside the folder (three-dot diff against the base): none; the files that differ from `b4aa112` outside the folder come from the merge of main.
- Title and description checked sentence by sentence against the head: the title against the README's; the summary block (README Summary; §1.2 "the ideal of the `ℚ`-Zariski closure of `h(S)`, which need not be a subgroup" and the Hopf-ideal join; §3.10 contract "no finiteness hypothesis"; §4.6; §4.9; §5.21; the four consumer clauses and the Hermitian-interface clause against "Downstream consumers"); the folder's three files; the statement of `kostantInvolution` against its elaborated type; the not-statable sentence against the module docstring (Layers 4 and 5); the dependency paragraph; the validation paragraph. The description says it adds the folder; the base has no ShimuraData. No sentence is contradicted and no change is left unstated.
- Dependency paragraph: the six open suppliers the README names (ShimuraVarieties, PELModuli, ArithmeticLocallySymmetricSpaces, AutomorphicFormsOnReductiveGroups, AbelianSchemesAndArithmeticModuli, ComplexComparisonPartII) are lines 107, 117, 59, 60, 43, 41 of the merge order, before ShimuraData (118); the nine others (AdelicAlgebraicGroups, ReductiveGroups, ReductiveGroupsPartII, StableReduction, ComplexManifolds, ComplexKahlerGeometry, RepresentationTheory, LocalFieldsRamification, HodgeStructures) are on main at `276e711`.
- Gate, run on this head: every check 0, `OK`. Dependency check: `depcheck: 245 roadmaps, 2239 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean`: one warning, `declaration uses sorry` at 50:8. Targeted build `lake build TauCetiRoadmap.ShimuraData.Suggested`: succeeds, warnings exactly the `sorry` and the module-system notice for `import Mathlib`, as the description says. The elaborated type of `kostantInvolution` equals the §3.13 statement; the file has no `variable` block, so no binder is lost. Library declarations opened at the pin: 2 (`CoxeterSystem.parabolic` line 109, `CoxeterSystem.IsMinimalCosetRep` line 239).
- Citations and overlaps: the resolver lists no cross-roadmap citation found nowhere (its five Lean-name leads are suppliers' names: `Neat.IsNeatAut`, `PureDatum.*`, `RationalPELDatum.toShimuraDatum`); no open pull request changes this roadmap, drops an id it cites, or is a second copy.
- Overlap check: read ShimuraVarieties, PerfectoidShimuraVarieties, ReductiveGroupsPartIII, PELModuli, AutomorphicBundles, AdelicAlgebraicGroups, HodgeStructures, ReductiveGroups; nothing shared (unchanged folder; ownership as recorded in the review of `b4aa112`, and the overlap lists name no new roadmap).
- Source independence: changed passages only; 0 passages compared with 0 sources, since the folder has no changed passage; largest share milne-svi, 26 of 68 locators; contents not compared again, since no layer is added, removed or reordered.

## Not verifiable

- Nothing new. The three items of the earlier reviews stand (Jantzen, paywalled; Milne–Shih and Deligne 1979 read from OCR of scans).

## Source issues

- none

## For the human reviewers

- none
