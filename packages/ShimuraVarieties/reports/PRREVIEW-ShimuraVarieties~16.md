# Review of ShimuraVarieties (pull request #933 at 314489c)

**Verdict:** accepted

This is an incremental re-review of 0 changed lines since `1b1cb6d`. The head differs from the one last reviewed only by a merge of main; the roadmap folder is byte-identical and the pins are unchanged. The previous review had no findings, the gate passes, and no finding remains.

## Previous findings

- The previous report (`PRREVIEW-ShimuraVarieties~15`, accepted at `1b1cb6d`) carried no finding, so there is nothing to account for. Its two repaired items (the Peterzil–Starchenko DOI and the Margulis 1977 entry) are unchanged at this head: `README.md` lines 998, 2940, 2956 and 2957 are the same bytes.

## Verified sound

**The folder is unchanged.** The git tree of `TauCetiRoadmap/ShimuraVarieties` is `cd2e31b0` at both `1b1cb6d` and `314489c`. It holds `README.md` (2970 lines), `Suggested.lean` (478 lines) and `metadata.toml`.

**Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ShimuraVarieties'` is empty: the files the change summary lists outside the folder all come from the merge of main, and the pull request itself changes none of them.

**Pins.** `lake-manifest.json` and `lean-toolchain` do not differ between `1b1cb6d` and this head, nor between this head and `origin/main` (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). So the native declarations the Lean file consumes (`TauCeti.IsSemialgebraic`, `TauCeti.semialgebraicDim`, from `TauCeti.Geometry.RealAlgebraic.Semialgebraic.Dimension.Basic`) are the ones the earlier rounds opened, and no native-carrier re-audit is needed.

**Gate.** My run on `314489c` printed:
```
gate ShimuraVarieties: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```
The worker's gate on the same head also reports `build=0`.

**Dependency check.** Run against the merge order and main as they are now:
```
depcheck: 235 roadmaps, 2276 edges, 0 problem(s)
```
No UPWARD, CYCLE or `moved:` line. Main has moved since the last round, so the supplier citations were re-resolved rather than carried: the citation resolver, run against main at `4452ffa` and the 454 open heads, lists no cross-roadmap citation of this README as found nowhere. Its 163 leads are all backticked Lean names of this roadmap's own targets, which the gate's `readme-ids-missing=0` covers.

**Elaboration.** `lake env lean` on `Suggested.lean` at this head exits 0 and prints exactly 27 lines, all `declaration uses sorry`, as in the previous round. The file has `import Mathlib` plus the one Tau Ceti module, no `set_option`, no `lemma`.

**Signatures.** The file and the pins are identical to the last round's, so the 38 `#check @` signatures compared there stand. The worker's signature file for this head reports 0 declarations with a lost section binder. Its one elaboration error (line 483, a `#check` of the bare namespace) is in the worker's generated check file, not in `Suggested.lean`.

**Padding and headlines.** No declaration was added, removed or changed, so the previous one-tactic probe stands (no sorried theorem closes). The headline list is unchanged: canonical towers (§§7.14, 8.22), Baily–Borel (§2.7), Borel algebraicity (§§3.2, 3.7), uniqueness (§4.12), main CM (§5.10), Siegel and abelian-type models (§§5.13, 6.7), minimal compactifications (§§8.18–8.23), `GL₂` comparisons (§§8.10–8.16), reflex fields (§5.1), o-minimal foundations (§§3.4b–3.4e) and `R_an,exp` (§3.5a). The statable ones (§§3.4b–3.5a, §5.1) are stated; the module docstring names the missing carriers for the rest.

**Seeded sample.** This round's fifteen targets (1.5, 1.6, 2.5, 3.4, 3.9, 4.9b, 5.8, 5.12, 5.13, 6.4, 7.0a, 7.0d, 7.0i.1, 7.2, 8.14) fall in no changed passage, because there is none. They were not re-read against the sources this round. 1.5, 2.5, 4.9b, 5.8, 7.0d, 7.0i.1 and 8.14 were covered by the samples of earlier rounds (rows below). The README flags no locator as unverified.

**Overlaps and ownership.** The overlaps file, computed from main at `4452ffa` and the open heads, reports no other open pull request changing this roadmap, no cited id that an open pull request drops, and no id that only an open revision defines. The closest roadmaps in vocabulary (ShimuraData, ShimuraCompactifications, PELModuli, HilbertModularVarietiesAndShimuraCurves, ModularCurvesPartII) are the same as in earlier rounds. This roadmap adds no construction since then, so the ownership position recorded in `PRREVIEW-ShimuraVarieties~14` and `~15` stands; no new by-object search was run.

**Adversarial table.** The diff touches no statement, so there is no new row. Every row is carried from the report named in brackets.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Module docstring lines 17–20 against `definable_of_isSemialgebraic` (r15) | `ZMod 3` with `0<1<2`, power-set structure; `ℝ` with a structure lacking the multiplication graph | `2+1=0<1`, so the order is incompatible, yet `[CommRing] [LinearOrder]` hold and both graphs are definable, so the theorem applies; without `hmul` it does not, and `{x²=2}` need not be definable (semilinear sets) | docstring, declaration docstring and README line 836 match the elaborated type | — |
| §7.0d locator (r15) | milne-1983a lines 315–316, 351, 812–813 | arithmeticity ← [10, Thm. 7] under `rank(G′_S) ≥ 2`; superrigidity ← [10, Thm. 8]; [10] = AMS Transl. 109 (1977) 33–45 | matches "Theorems 7 and 8 of Margulis 1977" | — |
| References lines 2956–2957, §3.5d DOI (r15) | Crossref records; milne-1999 lines 178–179 | Margulis 1977 pp. 33–45; "Margulis 1991, II 6.3"; `crelle.2009.002` → Peterzil–Starchenko, issue 626, 2009 | correct | — |
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

**Remarks (no change requested).**
- The generated `merge-order` block of the description still lists RamificationOfCompleteDiscretelyValuedFields and PolylogarithmFunctions as open links of the chain. Both are on main at `4452ffa`, which this head has not merged yet (its merge base is `f8836c48`). The block is tool-generated and is refreshed by the worker; the folder cites nothing that depends on it.
- The remarks of earlier rounds on ShimuraData and SatoTateGroups constructing their own Mumford–Tate groups stand; they are matters for those roadmaps' reviews.

## Not verifiable

- **Margulis 1977 (AMS Translations 109) and Margulis 1991.** Neither text is openly available; unchanged from the previous review, where the theorem numbers were checked against Milne 1983 and Milne 1999.
- **Peterzil–Starchenko page range pp. 39–74.** Not re-fetched this round; the previous review confirmed DOI, title, journal, issue and year but not the pages.
- **van den Dries, *Tame Topology and o-minimal Structures* (1998), §3.4b.** No open copy; unchanged.
- **Settled `uncertified`:** van den Dries–Miller 1994, Clozel 1986 and Platonov–Rapinchuk 1994, cited by locator.
- **This round's sampled targets not covered before** (1.6, 3.4, 3.9, 5.12, 5.13, 6.4, 7.0a, 7.2): not re-read against the sources, because the incremental rule limits the sample to changed passages and there are none.
- **Ownership against open pull requests.** Not re-run by object this round; the overlaps file was read and the folder adds no construction.

## Source issues

- none
