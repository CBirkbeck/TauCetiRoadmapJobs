# Review of ShimuraVarieties (pull request #933 at c62ab38)

**Verdict:** needs changes

This is an incremental re-review of the 96 lines changed since `ff31cd8`. All five findings of the previous review are repaired. The repair of its R03 (the References list) adds two entries with locator defects; they are this report's two findings. Both are P3, and neither blocks.

## R01 (P3) — The new Peterzil–Starchenko reference links to the DOI of a different paper

**Location.** `TauCetiRoadmap/ShimuraVarieties/README.md` line 2940: "Y. Peterzil and S. Starchenko, [Complex analytic geometry and analytic-geometric categories](https://doi.org/10.1515/CRELLE.2009.039), Journal für die reine und angewandte Mathematik 626 (2009), pp.39–74".

**Claim.** The link resolves to the cited paper.

**Witness.** Crossref resolves `10.1515/CRELLE.2009.039` to Gajda–Górnisiewicz, "Linear dependence in Mordell-Weil groups", Crelle issue 630. A Crossref bibliographic query for the Peterzil–Starchenko title returns `10.1515/crelle.2009.002`, Crelle issue 626.

**Repair.** On line 2940, replace `https://doi.org/10.1515/CRELLE.2009.039` with `https://doi.org/10.1515/crelle.2009.002`. I checked that Crossref resolves this DOI to Peterzil–Starchenko, "Complex analytic geometry and analytic-geometric categories", Crelle 626 (2009).

## R02 (P3) — The new Margulis entry assigns Milne 1983's arithmeticity and superrigidity citations to the 1991 book

**Location.** `TauCetiRoadmap/ShimuraVarieties/README.md` line 2956: "G. A. Margulis, *Discrete Subgroups of Semisimple Lie Groups*, … Springer (1991); Chapter II, §6.3, cited by Milne 1999, p.4, with the arithmeticity and superrigidity theorems used through Milne 1983, Lemmas 3.5–3.7."

**Claim.** The arithmeticity and superrigidity theorems that Milne 1983 uses in Lemmas 3.5–3.7 come from the 1991 book.

**Witness.** Milne 1983 uses "[10, Thm. 7]" for arithmeticity (milne-1983a line 316) and "[10, Thm. 8]" for superrigidity (line 351). Its reference [10] (lines 812–813) is Margulis, *Discrete groups of motions of manifolds of nonpositive curvature*, Amer. Math. Soc. Transl. 109 (1977), 33–45, not the 1991 book.

**Repair.**
- Shorten the 1991 entry to end at "Chapter II, §6.3, cited by Milne 1999, p.4."; that part is correct (milne-1999 lines 178–179).
- Add a separate entry: "G. A. Margulis, *Discrete groups of motions of manifolds of nonpositive curvature*, Amer. Math. Soc. Transl. 109 (1977), pp.33–45; Theorem 7 (arithmeticity) and Theorem 8 (superrigidity), as used in Milne 1983, Lemmas 3.5–3.7, pp.248–250."

These locators are exactly the ones Milne 1983 gives at the lines quoted in the witness.

## Previous findings

- R01 — repaired: new §P.3a (line 189) constructs `MT(V)` for every finite-dimensional rational Hodge structure, with connectedness, scalars in nonzero pure weight and polarizable reductivity. Line 13 gives it single ownership; §7.0i.1 (line 2031) specializes it.
- R02 — repaired: §P.6 is linked from §§1.2, 2.5, 3.5 and the Layer 1–3 dependency lines (6 links). §P.5 is linked from §4.8, a new *This uses* line in §4.9a (line 1341) and Layer 4 (3 links). §1.2 adds "Remark 3.13(a), p.39".
- R03 — repaired: References now lists van den Dries–Miller with its erratum, Clozel, Schmid, Cattani–Kaplan–Schmid, Peterzil–Starchenko, Cartan, Rydh, the Stacks Project and Margulis. Two of the new entries carry the locator defects R01 and R02 above.
- R04 — repaired: line 836 reads "Over any commutative ring `R` carrying a linear order, which need not be compatible with the ring operations, …". A new `ZMod 3` Check (line 843) and the Lean docstring (line 145) agree with it.
- R05 — repaired: line 431 is "`/-- The conjugate `star φ` of an embedding lies in the type exactly when `φ` does not. -/`". The `IsCell` and `IsCellDecomposition` constructors also gained docstrings that match their types.

## Verified sound

**Gate.** My run on `c62ab38` printed:
```
gate ShimuraVarieties: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```
The worker's gate also reports `build=0`. Nothing changed outside the folder (the `git diff --stat` is empty), and the folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Dependency check.** It printed `depcheck: 237 roadmaps, 2433 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. In the merge order, ShimuraVarieties is line 105 and the newly cited AbelianSchemesAndArithmeticModuli is line 41. ReductiveGroups is on main.

**Elaboration.** `lake env lean` on `Suggested.lean` gives 27 `sorry` warnings and nothing else.

**`#check` file.** A scratch copy with 45 `#check @` lines elaborated cleanly. It covers the 38 declarations, the five constructors of `IsCell` and `IsCellDecomposition`, `CMType.star_mem_iff` and `TauCeti.HopfIdeal.sSup_toIdeal`. No type changed. Each one matches its README statement. `definable_of_isSemialgebraic` has only `[CommRing R] [LinearOrder R]`, which is now the README's generality.

**Padding.** No declaration was added and no statement changed, so the previous one-tactic probe still applies: no theorem closes.

**Pinned declarations opened (Tau Ceti `2fd255d`).**
- In `Geometry/Hodge/`:
  - `HodgeStructureOn` (`Structure.lean:62`: a decreasing filtration, opposed in weight `n`) and `HodgeStructure` (`:75`, on the complexification of a lattice).
  - `IsPolarization` (`Polarization.lean:72`: integral form, Hodge–Riemann relations), `Polarization` (`:159`) and `IsPolarizable` (`:221`).
  - `RationalHodgeSubstructure` (`RationalSubstructure.lean:75`).
  - `RationalHodgeSubstructure.orthogonal` (`Orthogonal.lean:230`) and `exists_isCompl_of_isPolarizable` (`Orthogonal.lean:277`, with `[Module.Finite ℚ Vℚ]`).

  The contract on line 59 describes them correctly, including that they carry no group and no Deligne-torus action.
- In `Algebra/HopfAlgebra/HopfIdeal/`:
  - `HopfIdeal` (`Basic.lean:66`), `instSupSet` (`:329`) and `sSup_toIdeal` (`:360`).
  - `HopfIdeal.ker` (`Kernel.lean:165`), which needs a bialgebra map over the base. `h*` lands in an ℝ-Hopf algebra, so it does not apply. This agrees with the README's remark that the kernel of `h*` need not be a Hopf ideal.
- No Mumford–Tate group exists in Mathlib, in Tau Ceti or in any roadmap on main (`grep -i mumford`), so §P.3a duplicates nothing.

**§P.3a sources, recomputed.**
- SVI p.28 (milne-svi lines 1213–1216): polarizable means a polarization on each weight component.
- SVI Aside after 2.16, p.31 (lines 1360–1362): the smallest algebraic subgroup of `GL(V)` with `h(S)⊂G_ℝ`.
- Deligne 1982, Prop. 3.6, pp.24–25 (deligne82 lines 1033–1060): reductivity inside `GL(V)×G_m` through a compact real form.

**Other changed locators.**
- §7.0e: Milne 1983 p.258 cites "[9, VII.6]" (milne-1983a lines 612–613). Reference [9] is Langlands, *Les débuts d'une formule des traces stables* (lines 810–811, OCR "[6]"), so the switch from Kneser is correct.
- Milne 1994 entry: Milne 1999 Remark 1.3(c) (milne-1999 lines 82–83) replaces Milne 1994 Lemma 3.23.
- Borel–Harish-Chandra 7.5 is replaced by BGST 28.1 per the BKT erratum §1.5 (erratum lines 121–125).
- Crossref confirms the DOIs, volumes and pages of van den Dries–Miller 85 (1994) 19–56 and its erratum 92 (1995) 427, Schmid 22 (1973) 211–319, Cattani–Kaplan–Schmid 123 (1986) from p.457, Clozel 83 (1986) 265–284, and Cartan pp.90–102.

**Cross-roadmap citations resolved.**
- AbelianSchemesAndArithmeticModuli: "Layer A5: Complex uniformization and families" is its README line 2502 at its head. §A5.2 (line 2558) identifies Riemann forms with Tau Ceti polarizations (`isRiemannForm_iff_isPolarization`, line 2565).
- ReductiveGroups on main: "Layer 3: subgroups, quotients, components" (line 234), with Hopf ideals ↔ closed subgroups (line 235).
- New in-README anchors: `#p3a-mumfordtate-groups-of-rational-hodge-structures` (4 links) and `#34a-quasi-projective-finite-quotients` both resolve.
- The overlaps file reports no open pull request that changes this roadmap and no dropped id. This change drops no id.

**Remarks on untouched text (no change requested).**
- Line 998 carries the same Peterzil–Starchenko DOI as R01.
- The module docstring (lines 15–16) says "every o-minimal expansion of an ordered ring". That is narrower than the Lean theorem, which needs no compatibility.
- ShimuraData still constructs its own Mumford–Tate group at its head:
  - §§1.2–1.4 (its README lines 185, 226 and 245), with *Needs* on line 296 citing no §P.3a.
  - SatoTateGroups line 103 assigns the generic group to ShimuraData §1.2, and its README does not cite ShimuraVarieties.

  As the previous review set out, switching those to §P.3a belongs to those roadmaps' own reviews.
- The pins now contain `GeneralLinear.coordinateHopfAlgebra`, Weil-restricted `G_m` (`MultiplicativeGroup/WeilRestriction/Basic.lean`) and `geometricallyConnectedCommHopfAlgProperty`. §P.3a is nevertheless a prerequisite, not one of the Summary's end theorems, so its absence from `Suggested.lean` is not a headline gap.

**Headline theorems.** The headline list is unchanged:
- canonical towers (§§7.14, 8.22);
- Baily–Borel (§2.7);
- Borel algebraicity (§§3.2, 3.7);
- uniqueness (§4.12);
- main CM (§5.10);
- Siegel and abelian-type models (§§5.13, 6.7);
- minimal compactifications (§§8.18–8.23);
- `GL₂` comparisons (§§8.10–8.16);
- reflex fields (§5.1);
- o-minimal foundations (§§3.4b–3.4e) and `R_an,exp` (§3.5a).

The statable ones (§§3.4b–3.5a and §5.1) are stated. The docstring names the missing carriers for the rest.

**Seeded sample.**
- §3.4b is the only sampled target the diff touches. Its README generality now equals the Lean signature; the van den Dries locator is under Not verifiable.
- For §3.5a only the References entry changed, and Crossref confirms it.
- The other sampled targets (0.4, 0.6, 2.1, 3.1, 3.4e, 3.5b.1, 5.0, 6.4, 7.2, 7.6, 8.3, 8.7, 8.12) are untouched by the diff and were not re-read in this incremental review.

**Adversarial table.** Rows marked (r13) are carried forward from the previous report (`PRREVIEW-ShimuraVarieties~13`) for statements the diff leaves untouched.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §P.3a `MT(V)` definition (new) | `V=0`; trivial `ℚ(0)`; `ℚ(1)`; `ℚ(0)⊕ℚ(1)` | `GL(0)=MT=1`; `MT=1`; `h(z)=zz̄`, image `ℝ_{>0}` is Zariski dense in `G_m`, so `MT=G_m`; `MT={diag(1,t)}` | holds | — |
| §P.3a: wrong model "ℚ-closure of `h(S)`" (`ker h*`) | `ℚ(ζ₅)`, `h=z/z̄` at one place | ℚ-closure is `U×1 ∪ 1×U^σ` over `ℚ(√5)`; `(u,1)(1,v)=(u,v)` lies outside it, so it is not a group; the Hopf-ideal supremum gives the 2-dim torus | excluded by the definition, as the Check says | — |
| §P.3a: wrong model "real closure" / Deligne's `GL(V)×G_m` | same `ℚ(ζ₅)`; `ℚ(0)` | real closure is 1-dim `U(1)`, not defined over `ℚ`; for `ℚ(0)` Deligne's group is `1×G_m`, while SVI p.31's (inside `GL(V)`) is `1` | the README follows SVI's convention | — |
| §P.3a cocharacter Check | `μ_h` and its orbit under `(ℤ/5)^×` | type `(−1,1)` on `e₁` gives `z^{−p}=z`, so `μ_h=e₁−e₄`; `σ₂` gives `e₂−e₃`; the orbit `±(e₁−e₄),±(e₂−e₃)` has rank 2, which equals the rank of `ker(N:ℤ⁴→ℤ²)`; scalars satisfy `t²=1`, so `±1` | holds | — |
| §P.3a connectedness | the `ℚ(ζ₅)` torus; `S→π₀` | a torus is connected; `S` connected maps trivially to a finite étale group | holds | — |
| §P.3a sub-Hodge ⟺ `MT`-stable | non-CM `H¹`; CM `H¹⊕H¹` | `GL₂` fixes no line, and no rational line is sub-Hodge (it would lie in `H^{1,0}`, which is not conjugation-stable); the diagonal `{(v,v)}` is sub-Hodge and stable under the diagonal `Res_{K/ℚ}G_m` | holds both ways | — |
| §P.3a scalars and the `r^{−n}` sign | `ℚ(1)`, `n=−2`; weight-one `H¹`; `ℚ(0)` | `h(r)=r²=r^{−(−2)}`; `h(r)=r⁻¹`; `n=0` forces no scalar | holds; `V≠0`, purity and `n≠0` are each needed (Checks 1–2) | — |
| §P.3a reductivity | elliptic `H¹`; extension torus `E→X→X/E` not split up to isogeny | `GL₂` or `Res_{K/ℚ}G_m` are reductive; in `X`, `H¹(X/E)` has no complementary sub-Hodge structure, so `MT` is not reductive; changing types `(p,q)→(−p,−q)` changes positivity by the uniform sign `(−1)^n`, so `IsPolarizable` is convention-free | holds | — |
| §7.0i.1 (changed) | `dim A=0`; `g≥1` | `V_B=0`, so `MT` and the homotheties are trivial; `h(r)=r⁻¹·id`; reductive via the A5.2 Riemann form on `H₁` and its dual on `V_B` | holds | — |
| `definable_of_isSemialgebraic`, README line 836 (changed) | `ZMod 3`, `0<1<2`, power-set structure; `ℝ`, `{x²−2>0}` | `2+1=0<1`, all five axioms hold since `R` is finite; the set is the projection of `graph(x²−2)∩{0<y}` | README equals Lean | R04 repaired |
| `IsCell` constructors (docstrings) | `zero`; `graph` of constant `c` over `R⁰`; `band none none`; `band (some 0) (some 1)` | `R⁰`; `{c}⊂R¹`, dimension 0; `R¹`, dimension 1; `(0,1)`, dimension 1 | docstrings match | — |
| `IsCellDecomposition.succ` (docstring) | `R¹=(−∞,0)∪{0}∪(0,∞)` | images under `Fin.tail` are all `R⁰`, so `{univ}` and `zero` apply | matches | — |
| `CMType.star_mem_iff` (docstring) | `ℚ(i)`, `Φ={id}`; `ℚ` | `star id=conj∉Φ`; `star φ=φ` contradicts the iff | matches | R05 repaired |
| §§P.5, P.6 links | anchor counts | P.6: 6 links; P.5: 3 links | complete | R02 repaired |
| §7.0e and §1.2 locators | milne-1983a lines 612–613, 810–811; milne-svi line 1722 | `[9, VII.6]` is Langlands; Remark 3.13(a) covers torsion `Γ` | correct | — |
| References (new) | DOIs via Crossref; milne-1983a lines 316, 351, 812 | 6 correct; Peterzil–Starchenko resolves to Gajda–Górnisiewicz; Milne 1983's Margulis is the 1977 Transl. paper | 2 defects | R01, R02 |
| `exists_oMinimalStructure_definable_iff` (r13) | ordered field `ℚ`; `ℝ` | `√2∉ℚ`, so `hone` fails; on `ℝ` both hypotheses hold | holds | — |
| `exists_oMinimalStructure_isSemialgebraic` (r13) | `ℝ` | a sign condition has finitely many boundary roots | holds | — |
| `monotonicity` (r13) | `1/x`; step function | `F=∅`; `F={0}` | holds | — |
| `exists_isCellDecomposition` (r13) | `xy=1` | 7 cells | holds | — |
| `exists_ncard_le` (r13) | `{t≤x}` over `ℕ` | fibres unbounded, so the set is not definable | consistent | — |
| `dim_eq_iff_nonempty_interior` (r13) | `n=0`; `ℚ²⊂ℝ²` | `0=0`; `dim=0≠2`, interior empty | holds | — |
| `dim_image_appendEquiv_prod`, `dim_inter_setOf_dim_fibre_eq` (r13) | `A×∅`; `d=⊥,⊤` | `⊥=dim A+⊥`; `⊥` on both sides | holds | — |
| `dim_closure_diff_lt`, `dim_eq_semialgebraicDim` (r13) | half-plane; `[0,1]²` | `1<2`; `2=2` | holds | — |
| `denselyOrdered_…`, `exists_nsmul_eq_…` (r13) | `ℤ`; `k=0` | no structure on `ℤ`; `0•y=0≠x` | holds | — |
| `exists_definableMapOn_section`, `exists_tendsto_of_mem_closure` (r13) | `{x≤y≤x+1}`; topologist's sine | `f=id`; the sine set is not definable | holds | — |
| `ranExpLanguage`, `exists_oMinimalStructure_ranExp` (r13) | `x=0,1,−1/2`; `sin(1/(1−x))` | `1,e,0`; infinitely many zeros near 1 | holds | — |
| `reflexField_isCMField`, `reflexField_representation` (r13) | `ℚ(i)×ℚ(√−3)`; `ℚ(ζ₈)`; `k=ℚ` | degree 4, CM; `E*=ℚ(√−2)`; `i∉ℚ`, so no `ρ` | holds | — |
| Sample 0.2, 0.6, 1.1–1.5, 2.3, 2.9, 3.2–3.5c, 4.3–4.12, 5.1–5.11, 6.1, 7.0e–7.0i, 8.1–8.14 (r13) | as in the previous report's table | values as recorded there (e.g. `Y(3)`: 2 components; `X(3)→X(1)`: degree 12) | holds | — |

## Not verifiable

- **van den Dries, *Tame Topology and o-minimal Structures* (1998), §3.4b.** Only the Cambridge landing page is available, with no open copy. I checked the mathematics, not the chapter numbering.
- **Peterzil–Starchenko page range.** The Crossref record lacks pages, so I did not confirm pp.39–74.
- **Margulis 1977 and 1991, Langlands 1983.** Neither text was read; I used Milne 1983's and Milne 1999's bibliographies and citation lines quoted above.
- **Settled `uncertified`:** van den Dries–Miller 1994, Clozel 1986 and Platonov–Rapinchuk 1994. They are cited by locator.
- **Ownership against open pull requests.** I checked by object with `roadmaps grep -i 'mumford.tate'` across all open heads. The hits are ShimuraData, SatoTateGroups, AdmissiblePairsAndPadicHodgeStructures, ComplexMultiplicationAndExplicitReciprocityPartII and AbelianSurfacesModularity. Only ShimuraData constructs the general group (see the remark above).

## Source issues

- none
