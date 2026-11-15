# Review of LanglandsParameterStacks (pull request #1202 at 04801e3)

**Verdict:** accepted

No finding. This is an incremental re-review of the 8 lines changed since `1e9f8e8`: the three paragraphs that open Layers 1, 2 and 4 (`README.md:310`, `:564`, `:922`) and the third Downstream consumers bullet (`README.md:1331`).

## Previous findings

- R01 — not repaired, and not carried: the folder still holds only `README.md`, `Suggested.lean`, `metadata.toml`. The repair asked for a `sources.toml` in the folder, which the gate's `stray-files` rule refuses; the references stay at `README.md:1333`.

## Verified sound

The diff changes no statement; the rows are the statements whose hypotheses or edges the changed text restates.

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| Layer 1 opening, the 1.18 hypothesis "`ℓ ∤ q^{en} − 1` for every degree `e`" | `G_m` (degree 1), `q=3`, `ℓ=5` and `ℓ=2`; `SL₂` (degree 2), `q=4`, `ℓ=5`, `n=1` | `ℓ=5`: `3−1=2`, unit; Frobenius scales the fibre by 3 ≠ 1, fibre 0. `ℓ=2`: `2 ≡ 0`, fibre `k`, nullcone `{0}`. `SL₂`: `4²−1=15 ≡ 0`, excluded; `diag(a,−a)` is fixed (`−1·4 ≡ 1`). | Agrees with 1.18 (`README.md:544`); "degree", not exponent, is the right word (exponent 1 would admit the `SL₂` case). |
| Layer 1 opening, "for finite-wild `W` it is the classical quotient" (1.9) | Tame `G_m`, `q=3`; the zero relation on `k` | `b²−1` is a nonzero divisor in `ℤ_ℓ[a±,b±]`: no `H⁻¹`. The zero function has `H⁻¹=k`. | Agrees with 1.9 (`README.md:411`); the restriction to finite-wild `W` is kept. |
| Layer 1 opening, 25 asserted edges | Each against the consumer's `*Needs:*` line | 1.5, 2.1 ← 1.1, 1.2; 1.4, 1.6, 1.8, 1.14, 4.4, 4.9 ← 1.1; 1.9 ← 1.3, 1.5; 1.10 ← 1.3; 1.6, 1.16, 5.2 ← 1.5; 1.8 ← 1.7; 4.5, 4.19, 6.1 ← 1.8; 2.8 ← 1.9; 1.11 ← 1.8, 1.9; 1.15 ← 1.13, 1.14 | 25 of 25 present. |
| Layer 2 opening, "nonintegral schemes and generalized reductive groups" (2.2–2.4) | Trivial action on `Spec k[ε]/ε²`; `SL₂² ⋊ C₂` with the swap | Invariants `k[ε]/ε²`, dimension 2, not `k`. In `SL₂² ⋊ C₂`, `diag(t,t⁻¹)·U → 1`: orbit not closed though no component-surjective parabolic contains the tuple. | Agrees with 2.2 (`README.md:589`) and 2.3–2.4 (`:605`, `:621`). |
| Layer 2 opening, 19 asserted edges and "6.1 supply a datum of 2.12" | Each against `*Needs:*`; 6.1's text | 2.6, 3.3 ← 2.2, 2.4, 2.5; 3.5, 4.24, 4.25 ← 2.2; 4.23 ← 2.4; 2.13, 2.14, 3.6, 5.1, 5.3 ← 2.9; 2.15, 3.2 ← 2.10; 2.15 ← 2.12, 2.14 | 19 of 19 present; `README.md:1288` states the datum. |
| Layer 4 opening, hypotheses of 4.8–4.10 | `PGL_ℓ`, `SL_n`, `G_m` | `|π₁(G°)_tors|` = `ℓ`, 1, 1. The stated condition excludes `PGL_ℓ`, where 4.8 proves that generation fails, and admits the other two. | Agrees with 4.8–4.10 (`README.md:1024`, `:1034`, `:1044`) and FS line 11692 for the `π₀` clause. |
| Layer 4 opening, hypotheses of 4.12–4.18 and "counterexample for `|P| = ℓ`" (4.17) | Inversion on `G_m`, `P=C₂`, characteristic 3 and 2; factor swap on `(SL₂×SL₂)/μ₂`, characteristic 2 | Characteristic 3: `|P|=2` is a unit, `μ₂` has 2 reduced points. Characteristic 2: `|P|=2=ℓ`, `μ₂ = Spec k[ε]/ε²`. 4.17 has `|P|=2=ℓ`. | Agrees: prime-to-`ℓ` order throughout, solvable from 4.14 (FS line 11715); 4.18 itself needs only `G°` reductive (FS line 12088), which the run's hypotheses imply. |
| Layer 4 opening, 15 asserted edges | Each against `*Needs:*` | 4.4, 4.7, 4.12, 4.14 ← 4.2; 4.7, 4.10, 4.15, 4.16 ← 4.3; 4.11 ← 4.9, 4.10; 4.20 ← 4.9; 4.21 ← 4.13, 4.16, 4.18; 4.22 ← 4.20, 4.21 | 15 of 15 present (4.7 counted once). |
| Downstream consumers, third bullet (1.5, 1.8–1.11, 1.16–1.18) | ModularityAndLanglandsExtensions at its open head | Its `README.md:3378` needs §§1.5, 1.8–1.11 and 1.16–1.18; `:3342` and `:3356` name §§1.8–1.9, 1.5, 1.11, 1.16, 1.17 by title. | The same eight sections on both sides. |

The rows for the statements this diff leaves unchanged stand as in the previous review, of `1e9f8e8`.

- Source locators re-read against the text, 6: FS Proposition VIII.2.11, pp.284–285 (FS line 10987); VIII.5.14, pp.301–302 (FS line 11692); Theorem VIII.5.15, p.302 (FS line 11719); VIII.5.19, p.310 (FS line 12088); VIII.5.20, p.312 (FS line 12161); VIII.5.21, p.313 (FS line 12219). The diff adds and removes no locator.
- Seeded sample: 1.8, 1.10, 1.16, 2.4, 2.9, 2.15, 3.5, 4.9, 4.10, 4.15, 4.19, 4.22, 4.23 and 5.3 are named in the changed paragraphs and were checked there through their edges and hypotheses; 6.2 is not touched by the diff.
- Library declarations opened: 0. The changed text names none, and `Suggested.lean` is unchanged with 0 declarations, so the `#check @name` audit and the one-tactic probe have no subject.
- Cross-roadmap citations resolved: 1 new (ModularityAndLanglandsExtensions, above). The incoming numbered citations still resolve: GlobalShtukasAndFunctionFieldLanglands §§1.13, 2.9–2.14, 3.2–3.5; GeometricSatakeAndFusion §§0.4, 4.1; HeckeStacksAndLocalShtukas §§1.7–1.8, 4.1, 6.2–6.3.
- Pull request text against the head: the four suppliers it lists as not on main (ArithmeticGaloisRepresentations, IntegralHeckeAndGaloisDeterminants, DeformationAndDerivedPatchingAlgebra, FormalConnectionsOpers) are absent from main `1a19c9f` and the other twelve named suppliers are on it; the consuming sections it gives match the README; "the openings of Layers 1, 2 and 4" and the three downstream uses match the head; `Suggested.lean` declares nothing, as it says. Against `origin/main...HEAD` no file outside the folder changes.
- Gate (my run at `04801e3`): `gate LanglandsParameterStacks: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`. Dependency check: `depcheck: 245 roadmaps, 2237 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. `lake env lean` on `TauCetiRoadmap/LanglandsParameterStacks/Suggested.lean`: exit 0, no output.
- Overlap check: read IntegralHeckeAndGaloisDeterminants, HeckeStacksAndLocalShtukas, ModularityAndLanglandsExtensions, AnalyticStacks, GlobalShtukasAndFunctionFieldLanglands (open) and SmoothRepresentationsOfLocalGroups, EnhancedDerivedSheaves, ReductiveGroups (main); the list by results is empty. Owners: parameter stack, singular support and generation, this roadmap; finite-wild cocycle scheme and excursion algebra, SmoothRepresentationsOfLocalGroups SR.6; pseudocharacters, IntegralHeckeAndGaloisDeterminants; nothing shared with the rest.
- Source independence: changed passages only; 4 passages compared with 1 source (FS, whole text, by word runs), none shared beyond the 9-word hypothesis "of order prime to ℓ acting on G with" (FS line 12089); largest share FS, 89 mentions; no layer added, removed or reordered, so the arrangement was not compared again.
- Remark (description): it places IntegralHeckeAndGaloisDeterminants in §3.7, which uses it only through 3.1.

## Not verifiable

- Nothing in the changed passages. The limits recorded by the earlier reviews (Jantzen's second-edition pages; Lusztig 1976, Haboush 1975, Kempf, Donkin, Richardson 1988, Koppinen 1984) concern untouched text.

## Source issues

- **Misprint** in FS at Proposition VIII.2.11(ii) and the paragraph after its proof, pp.284–285: the source says "exponents" for the degrees of the homogeneous invariant generators, with supremum the Coxeter number; it should be degrees (the usual exponents plus one); affects a stated result.

## For the human reviewers

- Licence: Fargues–Scholze, the only text read this round, comes from the author-hosted copy at people.mpim-bonn.mpg.de; the board manifest `packages/LanglandsParameterStacks/sources.toml` records it as `author-page`.
