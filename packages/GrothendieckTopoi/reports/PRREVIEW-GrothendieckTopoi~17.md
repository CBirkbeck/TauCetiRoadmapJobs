# Review of GrothendieckTopoi (pull request #1520 at 59848bc)

**Verdict:** accepted

This is an incremental re-review of the 13 lines changed since 7d5de30: one new paragraph at the end of `### 9.5` of `TauCetiRoadmap/GrothendieckTopoi/README.md` (lines 1454–1466), after its Checks and before the Layer 9 Examples. `Suggested.lean` is unchanged. No finding. The gate passes at this head, `Suggested.lean` elaborates with `sorry` as its only warning, and the dependency check reports no problem.

## Previous findings

- None. The review of 7d5de30 raised no finding (it accepted the one-line change to Downstream consumers), and the review before it accepted with R01–R04 of the review of 6dbec25 repaired.

## Verified sound

**The changed paragraph (README lines 1454–1466), statement by statement.** It is a remark, marked "Not a target", and adds no target, Check, Lean name, supplier citation or locator. I recomputed each of its claims against the route of 9.5 (lines 1431–1441), which lifts the map `P ⟶ i_*(ℚ/ℤ)` adjoint to `h : P_x → ℚ/ℤ` along the epimorphism `(ℚ/ℤ)_V ⟶ i_*(ℚ/ℤ)` and uses `(ℚ/ℤ)_V(N) = 0`.

1. **"Every projective has zero stalk at a closed point `x` with a basis of connected open neighbourhoods and no smallest open neighbourhood."** The route needs exactly these: `x` closed, so that the skyscraper has zero stalks away from `x` and the comparison map is an epimorphism; a connected open `N ∋ x` carrying a representative of `s_x` (the connected basis); and a connected open `V` with `x ∈ V ⊊ N` (the next sentence). Then a section of `(ℚ/ℤ)_V` over `N` is a locally constant function on the connected `V`, whose support is `∅` or `V`, and `V` is not closed in the connected `N` because it is a nonempty proper open subset; so `(ℚ/ℤ)_V(N) = 0`, `φ(s) = 0`, and `h(s_x) = 0`. The claim holds.
2. **"For instance `X` is `T₁` and `x` is not isolated."** If `x` had a smallest open neighbourhood `W ≠ {x}`, pick `y ∈ W`, `y ≠ x`; `T₁` makes `X ∖ {y}` an open neighbourhood of `x` not containing `W`. So `T₁` plus non-isolated gives both "closed" and "no smallest open neighbourhood"; the connected basis stays a separate hypothesis, as the sentence says.
3. **"Inside every connected open `N ∋ x` there is a connected open `V ∋ x` with `V ≠ N`."** No smallest open neighbourhood gives an open `W ∋ x` with `N ⊄ W`; `N ∩ W` is an open neighbourhood of `x` properly inside `N`; a basic connected open `V ∋ x` inside `N ∩ W` is the one wanted.
4. **"The last hypothesis is needed: at the closed point of the Sierpiński space, `ℤ` is projective with stalk `ℤ`."** Abelian sheaves on the Sierpiński space are arrows `r : A ⟶ B` (`A = F(X)`, `B = F({o})`, as 9.2 Check 1 says); epimorphisms are the pairs of surjections (the stalks are `A` at `c` and `B` at `o`); `Hom(ℤ, F) = F(X) = A` is exact in `F`, so `ℤ` is projective, and its stalk at `c` is `ℤ`. The point `c` is closed with the connected basis `{X}`, and `X` is its smallest open neighbourhood: only the last hypothesis fails, as stated. This agrees with 9.5 Check 2 (`j_!ℤ` for `U = {o}` is also projective: `Hom(j_!ℤ, F) = B`).
5. **"Disjointly refinable basis ⇒ `ℤ_U` projective for `U` a member ⇒ enough projectives."** `Hom(ℤ_U, F) = Hom(j_!ℤ, F) = Hom(ℤ, j^*F) = F(U)` by the adjunction of 9.1. Given an epimorphism `F ⟶ G` and `t ∈ G(U)`, local surjectivity gives an open cover of `U` on whose members `t` lifts; a refinement by pairwise disjoint opens still covers `U`, the restricted lifts have empty overlaps, and they glue to a lift of `t`. The `ℤ_U`, `U` basic, generate: a nonzero sheaf has a nonzero section over some basic `U`. So `⨁ ℤ_U ⟶ F` over the sections on basic opens is an epimorphism from a projective. Negative control: open intervals in `ℝ` are not disjointly refinable (`{(−1, 1), (0, 2)}` covering the connected `(−1, 2)` has no disjoint open refinement), consistent with 9.5. Positive controls: the Sierpiński basis `{{o}, X}` (every cover of `X` contains `X`) and a discrete space.
6. **"`ℝ × C` has no connected neighbourhoods."** A neighbourhood `M` of `(t, c)` contains `I × K` with `K` clopen in `C`; `K` has at least two points (no isolated points) and splits as `K₁ ⊔ K₂` clopen; `M ∩ (ℝ × K₁)` and `M ∖ (ℝ × K₁)` are nonempty, relatively open, and partition `M`. So `M` is disconnected, whether or not it is open.
7. **"The same argument with `N = I × K`, `V = I′ × K`, `closure I′ ⊆ I`, slice by slice, shows `ℝ × C` has no nonzero projective."** The sets `I × K` form a basis, so `s_x` is represented over such an `N`, and `x` is closed (`ℝ × C` is Hausdorff), so the lift exists. A locally constant `f` on `V = I′ × K` is constant on each connected slice `I′ × {c′}`, so its support is `I′ × K′` with `K′ ⊆ K` open; this is closed in `I × K` only if `K′ = ∅`, because the endpoints of `I′` lie in `I ∖ I′` (`closure I′ ⊆ I`), so `I′` is not closed in `I`. Hence `(ℚ/ℤ)_V(N) = 0` and the rest of the route is unchanged. Wrong-model check: shrinking only in the Cantor direction, `V = I × K′` with `K′ ⊊ K` clopen, gives a clopen `V ⊆ N` and `(ℚ/ℤ)_V(N) = ℚ/ℤ ≠ 0`; the paragraph's choice, shrinking the interval, is the one that works.
8. **"Hence it has no disjointly refinable basis either."** Contrapositive of 5: enough projectives on a nonempty space gives a nonzero projective (an epimorphism onto `ℤ_X ≠ 0`).

**Consistency with the rest of the roadmap.** 9.5's title and statement (abelian sheaves on `ℝ`, `isZero_of_projective_sheaf_real`, `Suggested.lean` line 725, unchanged) are the special case `X = ℝ` of claim 1; 9.5 Check 1 (one-point space: `ℤ` projective) is the isolated case; 9.5 Check 2 and claim 4 agree on the Sierpiński space; the notation `ℤ_U = j_!ℤ` is the one of 9.5 Check 3 and the Layer 9 Examples (line 1471). The Layer 9 Dependencies paragraph (lines 1476–1478) is unchanged and still correct: the remark needs nothing beyond 9.1 and 9.2.

**Ownership of the remark.** TotallyDistributiveTopoi (open pull request, same author) has, as a non-target remark after its 4.2 Checks (its lines 608–618 at `roadmaps show`), the same "disjointly refinable" definition and the gluing argument, there for the sheaf topos of sets (`U` projective in `Sh(X)`), with the Alexandrov, Lindelöf zero-dimensional and Cantor cases. This README's version is for abelian sheaves (`ℤ_U` in `Sh(X, Ab)`), neither roadmap plans it as a target, and TotallyDistributiveTopoi is a consumer of this roadmap (later in the order), so this roadmap cannot cite it. The two agree where they overlap: that roadmap's lines 23–26 say sheaves on `ℝ` lack enough projectives and sheaves on the Cantor space have them, and its Alexandrov case contains the Sierpiński space of claim 4. No second owner of a target; `roadmaps grep` for "enough projectives" finds the phrase otherwise only in GeneralAlgebraicKTheory, MotivesAndAlgebraicCycles and HigherToposTheory, for abelian categories in general.

**Gate, build, direction.**
- **Gate.** Run here on 59848bc with `--base origin/main --build`: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. The worker's `scratch/gate.md` agrees.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` exits 0 in 5 s with 40 `declaration uses sorry` warnings and nothing else, the same as at 7d5de30. The file is unchanged since that head (`git log` shows its last change at 38e9e22), so the signature comparison and the one-tactic probe of the earlier rounds stand; its imports are `Mathlib` and `TauCeti.Topology.Sheaves.LocalCohomology.Basic`.
- **Dependency check.** `gate --depcheck … --movable`: `depcheck: 239 roadmaps, 2321 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. GrothendieckTopoi is line 399 of the merge order.
- **Pins and outside changes.** The three-dot diff outside the folder against `origin/main` is empty (the files that `scratch/changes.md` lists outside the folder come from the merge of main into the branch, not from the pull request). The pins are unchanged: Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` (`lake-manifest.json` lines 22 and 10).

**Overlaps and citations.**
- `scratch/overlaps.md`: no other open pull request changes this roadmap, no cited id that a pull request drops, no id that only an open revision defines.
- `scratch/citations.md`: no cross-roadmap citation missing. Its 19 Lean-name leads are on README lines 93–1218, all before the changed paragraph and unchanged since the previous reviews, which resolved them (this roadmap's own declared names, a generated Mathlib instance name, `IsLocallyConnectedSite` named in Scope as Mathlib's open work, AdicSpacesPartII `Topos.*` on main).
- The Downstream consumers paragraph (now lines 1482–1488, shifted by 13) is unchanged and was resolved against TotallyDistributiveTopoi in the previous review.

**Seeded sample.** None of the sampled targets (1.2, 1.4, 2.3, 3.2, 4.2, 5.1, 5.6, 6.5, 7.3, 7.4, 8.2, 8.5, 9.1, 9.2, 9.4) lies in the changed passage. The paragraph depends on 9.1's description of the sections of `j_!F` (support closed in the ambient open; SGA 4 IV 11.3.1) and on 9.2 only through 9.5's `*Needs:*` line; both are unchanged, and their locators were verified or recorded as not verifiable in earlier rounds. The README flags no locator as unverified.

**Adversarial pass.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Line 1454–1457 (changed): projective ⇒ zero stalk at closed `x` with connected basis and no smallest open neighbourhood | `ℝ` at `0`; `ℝ²` at `0`; Sierpiński closed point `c`; Sierpiński open point `o`; one-point space | `ℝ`: `N = (−2, 2)`, `V = (−1, 1)`, `(ℚ/ℤ)_V(N) = 0`, stalk `0`. `ℝ²`: discs, same. `c`: smallest neighbourhood `X`, `ℤ` projective, stalk `ℤ` (hypothesis fails, as stated). `o`: not closed and isolated, `j_!ℤ` projective, stalk `ℤ`. One point: isolated, `ℤ` projective | holds | none |
| Line 1456 (changed): `T₁` and non-isolated ⇒ closed, no smallest open neighbourhood | Sierpiński (not `T₁`): `c` has smallest neighbourhood `X`; `ℚ` at `0`: every neighbourhood contains `(−ε, ε) ∩ ℚ ⊋ (−ε/2, ε/2) ∩ ℚ` | `W` smallest with `y ∈ W ∖ {x}` contradicts `W ⊆ X ∖ {y}` | holds | none |
| Line 1457 (changed): a connected open `V ∋ x`, `V ⊊ N` | `ℝ`, `N = (−2, 2)`: `W = (−1, 1)`, `V = (−1, 1)` | `V ⊆ N ∩ W ⊊ N` | holds | none |
| Line 1458 (changed): Sierpiński, `ℤ` projective with stalk `ℤ` at `c` | arrow category `A ⟶ B`; epimorphisms = pairs of surjections | `Hom(ℤ, F) = A`, exact; stalk at `c` = `ℤ(X) = ℤ` | holds | none |
| Lines 1459–1462 (changed): disjointly refinable ⇒ `ℤ_U` projective ⇒ enough projectives | Sierpiński basis `{{o}, X}`; discrete space; Cantor clopen basis (finite subcover, disjointify); open intervals of `ℝ` | `Hom(ℤ_U, F) = F(U)`; cover of `(−1, 2)` by `(−1, 1)`, `(0, 2)` has no disjoint open refinement, so `ℝ` is excluded, consistent with 9.5; `⨁_{U, t} ℤ_U ⟶ F` epimorphism | holds | none |
| Lines 1462–1464 (changed): `ℝ × C` has no connected neighbourhoods | `M ∋ (t, c)` arbitrary neighbourhood | `M ⊇ I × K`, `K = K₁ ⊔ K₂` clopen nonempty; `M ∩ (ℝ × K₁)`, `M ∖ (ℝ × K₁)` partition `M` | holds | none |
| Lines 1464–1466 (changed): slice argument, no nonzero projective on `ℝ × C` | `N = I × K`, `V = I′ × K`, `closure I′ ⊆ I`; wrong model `V = I × K′`, `K′ ⊊ K` clopen | support of `f` on `V` is `I′ × K′`, closed in `I × K` iff `K′ = ∅`, so `(ℚ/ℤ)_V(N) = 0`; wrong model: `V` clopen in `N`, `(ℚ/ℤ)_V(N) = ℚ/ℤ ≠ 0` | holds; the paragraph's choice is the one that works | none |
| Line 1466 (changed): no disjointly refinable basis on `ℝ × C` | contrapositive of the previous two rows | `ℤ_X ≠ 0` needs a nonzero projective | holds | none |
| 9.5 route, lines 1431–1441 (unchanged; the paragraph generalises it) | `P` projective on `ℝ`, `s ∈ P(N)`, `s_x ≠ 0` | `(ℚ/ℤ)_V ⟶ i_*(ℚ/ℤ)` isomorphism on the stalk at `x`, zero elsewhere; `(ℚ/ℤ)_V(N) = 0`; `h(s_x) = 0` | holds, as in the r13–r15 tables | none |
| Downstream consumers (now lines 1482–1488, unchanged) | as in the review of 7d5de30 | the eight sections TotallyDistributiveTopoi cites, carried forward | unchanged | none |
| 5.6 `IsEssential`, 6.5 Roos, 4.4 Check 3, 8.5 Isbell locator, and the statements 1.1–1.4, 2.1–2.5, 3.1–3.3, 4.1–4.3, 4.5, 5.1–5.5, 6.1–6.4, 7.1–7.4, 8.1–8.4, 9.1–9.4, Convention 9 and their Checks | as in the r13 table, carried by the reviews of 38e9e22 and 7d5de30 | the values in those reports; the diff touches none of them | unchanged | none |

**Principles.** The paragraph is a mathematical remark in the author's words with no copied passage, no algorithm, no route-specific shortcut and no re-planned roadmap; it names no later roadmap and no pull request; it defines the one term it coins ("disjointly refinable") where it first appears. The Lean file has no sorry'd data and no `set_option`.

**Declared gaps.** None are declared: there is no readable `design/plan.json`, and the README states none.

**Remark on untouched text (no change requested).** None.

## Not verifiable

- SGA 4 IV 11.3.1 (sections of `j_!F` as sections with closed support), on which 9.1 and hence the new paragraph rest, is paywalled, as in earlier rounds; the description of `j_!F` was recomputed on the instances above.

## Source issues

- none
