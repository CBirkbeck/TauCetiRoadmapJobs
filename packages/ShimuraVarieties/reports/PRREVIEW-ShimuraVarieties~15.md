# Review of ShimuraVarieties (pull request #933 at 1b1cb6d)

**Verdict:** accepted

This is an incremental re-review of the 15 lines changed since `c62ab38` (9 insertions, 6 deletions in `README.md` and `Suggested.lean`). Both findings of the previous review are repaired, the repairs introduce no new problem, and the gate passes. No finding remains.

## Previous findings

- R01 — repaired: `README.md` lines 998 and 2940 now link `https://doi.org/10.1515/crelle.2009.002`; Crossref resolves it to Peterzil–Starchenko, "Complex analytic geometry and analytic-geometric categories", Crelle 2009, issue 626. The §3.5d link (line 998), which the previous review listed only as a remark, was fixed too.
- R02 — repaired: line 2956 ends at "Chapter II, §6.3, cited by Milne 1999, p.4"; line 2957 adds Margulis, *Discrete groups of motions of manifolds of nonpositive curvature*, AMS Translations (2) 109 (1977), pp.33–45, Theorems 7 and 8, as used in Milne 1983, Lemmas 3.5–3.7. §7.0d (line 1964) names "Theorems 7 and 8 of Margulis 1977" at its locator.

## Verified sound

**Gate.** My run on `1b1cb6d` printed:
```
gate ShimuraVarieties: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```
The worker's gate on the same head also reports `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Dependency check.** `depcheck: 238 roadmaps, 2354 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The change adds no supplier citation.

**Elaboration.** `lake env lean` on `Suggested.lean` prints exactly 27 lines, all `declaration uses sorry`. The only Lean change is the module docstring (lines 17–20).

**`#check` file.** The scratch file with `#check @` for every declaration elaborates to 38 signatures, each identical to the previous round's. The one edited passage describes `OMinimalStructure.definable_of_isSemialgebraic`, whose elaborated type is `∀ {R} [CommRing R] [LinearOrder R] (S : OMinimalStructure R), S.Definable 3 {x | x 2 = x 0 + x 1} → S.Definable 3 {x | x 2 = x 0 * x 1} → ∀ {n} {s}, TauCeti.IsSemialgebraic s → S.Definable n s`. The new docstring sentence ("a commutative ring with any linear order, compatible or not with the ring operations, in which the graphs of addition and multiplication are definable"), the declaration docstring (line 147) and README line 836 all state exactly this generality. The former phrase "o-minimal expansion of an ordered ring" no longer occurs in the file; the remaining "o-minimal expansion of an ordered abelian group" (line 362) belongs to the definable-choice theorem, which carries `[LinearOrderedAddCommGroup]`-type hypotheses and was reviewed before.

**Padding.** No declaration was added and no statement changed; the previous one-tactic probe stands (no sorried theorem closes).

**Sources recomputed for the changed locators.**
- Crossref `10.1515/crelle.2009.002`: Peterzil, Starchenko, "Complex analytic geometry and analytic-geometric categories", Crelle, volume 2009, issue 626, year 2009.
- Crossref `10.1090/trans2/109/07`: Margulis, "Discrete groups of motions of manifolds of nonpositive curvature", AMS Translations Series 2, container "Twenty Lectures Delivered at the International Congress of Mathematicians in Vancouver, 1974", pages 33–45, 1977. The volume 109 is the DOI path's and Milne 1983's (milne-1983a lines 812–813: "Amer. Math. Soc. Transl. 109 (1977), 33-45").
- Milne 1983 cites "[10, Thm. 7]" for arithmeticity of `Γ_{0,S}` when `rank(G′_S) ≥ 2` (milne-1983a lines 315–316) and "[10, Thm. 8]" in the proof of Lemma 3.7 to extend the adjoint representation (line 351). So §7.0d's "Theorems 7 and 8 of Margulis 1977" is Milne's own assignment.
- Milne 1999 Lemma 2.2's proof cites "Margulis 1991, II 6.3" (milne-1999 lines 178–179); the shortened 1991 entry and §7.0c's citation (line 1954) agree with it.

**Dependents of the changed passages.** §3.7 (line 1042) cites §3.5d through its anchor, which the change does not rename; §7.12's plan (line 2204) cites §7.0d for the `S`-arithmetic reconstruction, whose statement is unchanged apart from the added theorem numbers. Neither needs a change.

**Seeded sample.** None of the fifteen sampled targets (2.5, 2.8, 2.9, 3.5c, 3.7, 3.8, 4.3, 4.4, 4.9b, 4.11, 5.7, 7.8, 7.9, 7.10, 7.12) is touched by the diff; 3.7 and 7.12 depend on changed passages only as recorded above. They were checked in the full reviews and not re-read here.

**Overlaps and ownership.** The overlaps file reports no open pull request changing this roadmap, no dropped id and no id defined only by an open revision. The change adds no construction, so the ownership position of the previous review stands (ShimuraData and SatoTateGroups still restate the Mumford–Tate group at their heads; that is their reviews' matter).

**Headline theorems.** Unchanged: canonical towers (§§7.14, 8.22), Baily–Borel (§2.7), Borel algebraicity (§§3.2, 3.7), uniqueness (§4.12), main CM (§5.10), Siegel and abelian-type models (§§5.13, 6.7), minimal compactifications (§§8.18–8.23), `GL₂` comparisons (§§8.10–8.16), reflex fields (§5.1), o-minimal foundations (§§3.4b–3.4e) and `R_an,exp` (§3.5a). The statable ones (§§3.4b–3.5a, §5.1) are stated; the docstring names the missing carriers for the rest.

**Adversarial table.** Rows marked (r13) or (r14) are carried from `PRREVIEW-ShimuraVarieties~13` and `~14` for statements the diff leaves untouched.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Module docstring, lines 17–20 (changed), against `definable_of_isSemialgebraic` | `ZMod 3` with `0<1<2`, power-set structure; `ℝ` with a structure lacking the multiplication graph | `2+1=0<1`, so the order is incompatible, yet `[CommRing] [LinearOrder]` hold and both graphs lie in the power set, so the theorem applies; on `ℝ` without `hmul` the theorem does not apply, and indeed `{x²=2}` need not be definable (e.g. the structure of semilinear sets) | docstring, declaration docstring and README line 836 state the same hypotheses as the elaborated type | — |
| §7.0d locator (changed) | milne-1983a lines 315–316, 351, 812–813 | arithmeticity ← [10, Thm. 7] under `rank(G′_S) ≥ 2`; superrigidity ← [10, Thm. 8]; [10] = AMS Transl. 109 (1977) 33–45 | matches the added "Theorems 7 and 8 of Margulis 1977" | R02 repaired |
| References line 2957 (new) | Crossref record | title, author, series, pages 33–45, year 1977 agree; volume 109 from the DOI path and Milne's [10] | correct | R02 repaired |
| References line 2956 (shortened) | milne-1999 lines 178–179 | "Margulis 1991, II 6.3" in Lemma 2.2's proof | correct | R02 repaired |
| §3.5d and References Peterzil–Starchenko DOI (changed) | Crossref record | `crelle.2009.002` → Peterzil–Starchenko, issue 626, 2009 | correct | R01 repaired |
| §P.3a `MT(V)` definition and its wrong models (r14) | `V=0`, `ℚ(0)`, `ℚ(1)`, `ℚ(0)⊕ℚ(1)`, `ℚ(ζ₅)` | `MT=1,1,G_m,{diag(1,t)}`; the ℚ-closure of `h(S)` is not a group, the Hopf-ideal supremum gives the 2-dim torus | holds | — |
| §P.3a cocharacter, connectedness, sub-Hodge ⟺ stable, scalars, reductivity (r14) | as recorded there | `μ_h=e₁−e₄`, orbit rank 2; `h(r)=r^{−n}`; extension torus non-reductive | holds | — |
| §7.0i.1 (r14) | `dim A=0`; `g≥1` | `V_B=0`; `h(r)=r⁻¹·id`; reductive via the A5.2 Riemann form | holds | — |
| `IsCell`, `IsCellDecomposition.succ`, `CMType.star_mem_iff` docstrings (r14) | `zero`, constant graph, bands; `R¹` split in three; `ℚ(i)` | dimensions `0,0,1,1`; `Fin.tail` images `R⁰`; `star id=conj∉Φ` | match | — |
| `exists_oMinimalStructure_definable_iff` (r13) | ordered field `ℚ`; `ℝ` | `√2∉ℚ`, so `hone` fails; on `ℝ` both hypotheses hold | holds | — |
| `exists_oMinimalStructure_isSemialgebraic` (r13) | `ℝ` | a sign condition has finitely many boundary roots | holds | — |
| `monotonicity`, `exists_isCellDecomposition`, `exists_ncard_le` (r13) | `1/x`; step function; `xy=1`; `{t≤x}` over `ℕ` | `F=∅`; `F={0}`; 7 cells; fibres unbounded so not definable | holds | — |
| dimension laws `dim_eq_iff_nonempty_interior`, `dim_image_appendEquiv_prod`, `dim_inter_setOf_dim_fibre_eq`, `dim_closure_diff_lt`, `dim_eq_semialgebraicDim` (r13) | `n=0`; `ℚ²⊂ℝ²`; `A×∅`; `d=⊥,⊤`; half-plane; `[0,1]²` | `0=0`; `0≠2`; `⊥=dim A+⊥`; `1<2`; `2=2` | holds | — |
| `denselyOrdered_…`, `exists_nsmul_eq_…`, `exists_definableMapOn_section`, `exists_tendsto_of_mem_closure` (r13) | `ℤ`; `k=0`; `{x≤y≤x+1}`; topologist's sine | no structure on `ℤ`; `0•y=0≠x`; `f=id`; not definable | holds | — |
| `ranExpLanguage`, `exists_oMinimalStructure_ranExp` (r13) | `x=0,1,−1/2`; `sin(1/(1−x))` | `1,e,0`; infinitely many zeros near 1 | holds | — |
| `reflexField_isCMField`, `reflexField_representation` (r13) | `ℚ(i)×ℚ(√−3)`; `ℚ(ζ₈)`; `k=ℚ` | degree 4, CM; `E*=ℚ(√−2)`; `i∉ℚ`, so no `ρ` | holds | — |
| Sample 0.2, 0.6, 1.1–1.5, 2.3, 2.9, 3.2–3.5c, 4.3–4.12, 5.1–5.11, 6.1, 7.0e–7.0i, 8.1–8.14 (r13) | as in that report's table | values as recorded there (e.g. `Y(3)`: 2 components; `X(3)→X(1)`: degree 12) | holds | — |

**Remarks on untouched text (no change requested).**
- The worker's `signatures.md` scratch file carried a stray `#check` of the bare namespace, which fails; it is a tooling artefact, not a defect of `Suggested.lean`.
- The remarks of the previous review on ShimuraData and SatoTateGroups constructing their own Mumford–Tate groups stand; they are matters for those roadmaps' reviews.

## Not verifiable

- **Margulis 1977 (AMS Translations 109) and Margulis 1991.** Neither text is openly available; the theorem numbers were checked against Milne 1983's citation lines and bibliography and Milne 1999's citation, quoted above, not against Margulis's text.
- **Peterzil–Starchenko page range pp.39–74.** The Crossref record has no page field, and the zbMATH and De Gruyter pages refused the fetch (HTTP 403 and 405). The DOI, title, journal, issue and year are confirmed.
- **van den Dries, *Tame Topology and o-minimal Structures* (1998), §3.4b.** No open copy; unchanged from the previous review.
- **Settled `uncertified`:** van den Dries–Miller 1994, Clozel 1986 and Platonov–Rapinchuk 1994, cited by locator.
- **Ownership against open pull requests.** Not re-run this round: the change adds no construction, so the previous round's by-object search (`roadmaps grep -i 'mumford.tate'`) stands.

## Source issues

- none
