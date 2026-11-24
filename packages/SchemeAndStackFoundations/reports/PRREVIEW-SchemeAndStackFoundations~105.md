# Review of SchemeAndStackFoundations (pull request #2531 at 3e72c55)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 2278 changed lines since `890b66d`. Accepted: the four lettered subsections (§§0.2a, 1.1a, 1.9a, 2.9a), the restated §0.7 clause and the edited citations were read against the Stacks Project at each locator, against the pinned Mathlib and Tau Ceti, and against ModularCurves on `main`, and no statement is false or unsupported; the 1772 lines changed since the last reviewed head are a pure move of the scope and the supplier contracts to the end of the README. There is no finding; three small corrections (two on the description, which was written for an earlier head, one on a statement that NeronModelsAndSemistableAbelianVarietiesPartII on `main` also carries) and one format note, none blocking. The deferred finding on fppf cohomology with supports is resolved at the other pull request's head; nothing is left for a human to decide.

## C01 — The description does not say that the scope and the supplier contracts moved to the end of the README, and its sentence that the two pull requests "merge without conflict" no longer holds

A reader of the description expects a change of about 500 lines in four new subsections and a few edits; the diff against `main` is 2278 lines, because the head also moves `## Scope and ownership` and `## Exact supplier contracts` (with `## Conventions` and `## How to read the build` now directly after the overview) behind the layers. I checked that the move changes no text: the multiset of lines of the README at `2fdb6a3` and at this head is identical, and the section order went from scope, conventions, contracts, guide, layers to guide, conventions, layers, downstream consumers, scope, contracts, references.

The same move makes the sentence "the two pull requests touch different parts of it and merge without conflict" false: a three-way merge of this head with the head of the cohomologically-affine revision (`764265d`) reports a content conflict in `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, while the merge with `2fdb6a3` was clean. The merge-order block already gives the order. Text that would be right: "The README's scope and supplier contracts are moved, unchanged, to the end. The cohomologically-affine revision also changes this README and merges first; this pull request is rebased on it."

## C02 — The description's paragraph on ownership of fppf cohomology with supports describes an earlier state of PurityForFlatCohomology

The description says that PurityForFlatCohomology §0.2 "also constructs fppf cohomology with supports, with `H⁰_Z`, the long exact sequence, open excision and the triple sequence" and "should cite §2.9a for the construction instead of planning it". At that pull request's head it does: its §0.2 opens "Fppf cohomology with supports is SchemeAndStackFoundations §2.9a's", lists the four statements as that section's, and its *Needs:* line names §2.9a for the coefficient lift, the construction, `H⁰_Z`, the long exact sequence, excision and the triple sequence (its README, lines 889–908). The paragraph can say that PurityForFlatCohomology §0.2 takes the construction from §2.9a and adds étale excision, the spectral sequence and the comparisons.

## C03 — The schemehood of a separated locally quasi-finite algebraic space over a scheme (§1.9a, line 2760) is also stated as a target in NeronModelsAndSemistableAbelianVarietiesPartII §1.9 on `main`, and neither text mentions the other

An implementer of either roadmap would not learn that the proposition has a second statement. NeronModelsAndSemistableAbelianVarietiesPartII §1.9 has the bullet "A separated, locally quasi-finite morphism from an algebraic space to a scheme has a scheme as source" with the locator Stacks, Proposition 67.50.2 and a two-clause route (its README, lines 631–634; used at lines 573 and 584). That roadmap consumes this one throughout (its §1.9 cites the algebraic-space contracts here and §1.3's diagonal), so the owner can only be §1.9a, which has the full route; a citation in the other direction would be a cycle. The smallest change here is one sentence in `## Downstream consumers` (line 8720): NeronModelsAndSemistableAbelianVarietiesPartII §1.9 uses §1.9a's schemehood of separated locally quasi-finite algebraic spaces over a scheme. The description could note, as it does for PurityForFlatCohomology, that the bullet there should cite §1.9a; that edit belongs to a separate pull request on the other folder.

## N01 — In §1.1a's affine bullet (line 2368) the reduction of the locally finitely presented case ends at affine `S` and `S'`, where Tau Ceti already proves effectiveness

Carried over unchanged from the previous review. `TauCeti.DescentDatum.exists_isAffine_baseChange_hom_isIso` (`TauCeti/AlgebraicGeometry/Descent/Affine.lean:532`: `S`, `S'`, `X.left` affine, `p` flat) applies at the end of that reduction; naming it would show that the fppf chain (§§1.2, 1.9a) does not wait on ModularCurves 0E.

## Deferred findings

- D01 — resolved: PurityForFlatCohomology §0.2 at its open head cites §2.9a for the construction, `H⁰_Z`, the long exact sequence, excision and the triple sequence.

## Questions for the author

- Does Grothendieck's *Le groupe de Brauer III*, Théorème 11.7, cited in §2.10 for `smoothGroup_fppf_etale_comparison`, cover every smooth commutative group scheme, or does it carry a quasi-projectivity hypothesis? Česnavičius–Scholze, Theorem 5.2.6, covers affine smooth `G` only (cesnavicius-scholze line 2318). What stopped me: the text of *Brauer III* is not among the sources I can read.

## Previous findings

- The previous review, of `2fdb6a3`, had no finding (no R-numbered point) and no small correction.
- N01 (previous) — not repaired: §1.1a's affine bullet is unchanged, "For `p` locally of finite presentation it reduces to that case: by gluing over the base, `S` may be taken affine" (line 2374); restated above as N01.
- D01 — see Deferred findings.

## Verified sound

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §0.2a *IsQuasiAffineHom* (01SK) | `𝔸²∖0 → Spec k`; `ℙ¹ → Spec k`; doubled-origin line; `∐_ℕ Spec k` | functions `k[x,y]`, open in `𝔸²`: yes; functions `k`, map to a point not an immersion: no; not separated: no; not quasi-compact: no | Pass; Morphisms Def. 13.1 read |
| §0.2a canonical map to relative Spec (01LY) | `S` affine; `f` affine | `X.toSpecΓ`; inverse of `relativeSpecFunctionsToScheme` (`Counit.lean:78`); source needs `f` qcqs, stated | Pass |
| §0.2a *isQuasiAffineHom_iff* (01SM) | source's four conditions; `S` affine | README lists the same four (source (3),(4) swapped in order); affine `S` gives `X.IsQuasiAffine` by cover `{S}` | Pass |
| §0.2a stability (01SL, 01SN, 01SO, 02JR, 01SP, 054G) | 054G with composition order `g ≫ h` | source: `X` quasi-affine over `S`, `Y` quasi-separated over `S` ⇒ `g` quasi-affine; README: `g ≫ h` quasi-affine, `h` quasi-separated | Pass; Lemmas 13.2–13.8 read |
| §0.2a *of_locallyQuasiFinite* (02LR) | Mathlib instance, `ZariskisMainTheorem.lean:358`; identity; `∐_ℕ Spec k` | instance needs lqf, lft, separated, quasi-compact = README's four; open immersion then integral; non-qc example excluded | Pass |
| §0.2a descent of quasi-compact, separated, quasi-affine (02KQ, 02KU, 02L7) | Mathlib at pin | only `UniversallyClosed`, `LocallyOfFiniteType`, isomorphisms, open immersions descend there; the three are absent, so targets | Pass; Descent 23.1, 23.6, 23.22 |
| §0.7 `fibre_dimension_semicontinuity` (02FY, 02FZ, 0A3V, 02G0) | `𝔸² → 𝔸¹`; `∐_n 𝔸ⁿ → Spec k` | `U_1 = X` open; unbounded without finite type; tags sit at Lemmas 29.3–29.6 (hypotheses read at the previous head, text unchanged) | Pass |
| §1.1a stable opens (03N0) | `ℂ/ℝ`, `𝔸²_ℂ ∖ {(i,0)}`; both points removed | conjugate is `∖{(−i,0)}`: not stable; two-point complement stable, model `𝔸²_ℝ ∖ V(x²+1, y)` (one point, residue field `ℂ`) | Pass |
| §1.1a refinement (02W0, proof of 02W3) | `S' = S ⊔ S`, `q` one component (not surjective onto `S'`) | `q ≫ p = id`; data relative to `p` all effective (section), functor to `Sch/S` fully faithful: no surjectivity of `q` needed | Pass; source: refinement of fpqc coverings |
| §1.1a affine morphisms (0245) | `p` quasi-compact; `p` lfp not quasi-compact | ModularCurves §0.5 on `main` states it for flat surjective quasi-compact `p`; lfp: `p` open (01UA = Lemma 29.26.10), finite affine refinement is quasi-compact | Pass |
| §1.1a gluing over stable opens (0AP4) | source hypothesis | source: surjective, quasi-compact, flat; README says so and extends by 03N0 and 040L, both for fpqc coverings | Pass |
| §1.1a quasi-affine descent (0247) | `ℂ/ℝ` Check | relative Spec of functions of `X` is `𝔸²_ℂ` (codimension 2); `X → S'` qcqs so flat base change of `f_*O_X` applies | Pass |
| §1.1a saturation | `∐_ℤ Spec ℂ`, `W¹` = component 1 | image `{1, −1}`; open since `act` is a base change of flat lfp `p`; quasi-compact since `p` quasi-compact | Pass |
| §1.1a fppf descent of separated lqf (02W8) | `∐_ℤ Spec ℂ` with `n ↦ −n`; doubled-origin line over `𝔸¹_ℂ`; 08KF | model `Spec ℝ ⊔ ∐_{n≥1} Spec ℂ`; non-separated datum: affine open of model would pull back to separated open containing both origins; projective counterexample | Pass; More on Morphisms 57.1 |
| §1.1a *LocallyQuasiFinite.descendsAlong* (02VI) | Mathlib `LocalFlatDescent.lean:36` | finite type descends (pin); lqf descent absent at pin: target | Pass |
| §1.1a sheaves representable after base change (02W5) | `T = S'`; `T = ∅`; `J` = fppf, fpqc | pullback sieve generated by `T ×_S S' → T`; fppf and fpqc `Subcanonical` instances synthesize at pin; source lists five topologies, not fpqc | Pass |
| §1.2 `quasiFiniteDescent` convention | Mathlib `LocallyQuasiFinite` (`QuasiFinite.lean:72`) | class is ring-map quasi-finiteness on affine charts only; Stacks 01TD includes finite type; README uses the conjunction | Pass |
| §1.9a *locallyQuasiFinite_separated_isScheme* (03XX), 0418 | `F = h_X`; folded line `𝔸¹/(Δ ⊔ Γ) → 𝔸¹`, `x ↦ x²` | returns `X`; folded line lqf, not separated, not a scheme | Pass; Prop. 50.2, Lemma 51.1 read |
| §1.9a *open_restriction_quotient* (02WU) | source hypotheses | equivalence relation, `s,t` surjective flat lfp, `g` flat lfp: identical | Pass |
| §1.9a *exists_elementaryEtale_isCompl_of_quasiFiniteAt* (02LN) | `n = 1`; Mathlib `ZariskisMainTheorem.lean:48` | source gives `κ(u)=κ(s)`, singleton fibre, `κ(v)=κ(x)`, `W` clause; Mathlib has only `V`, `W`, finiteness, a point over `x` | Pass |
| §1.9a *etaleEquivalence_splitting* (03FL, 03X5) | hypotheses (1)–(7) of 40.13.1–2 | README has lft, quasi-finite at `u`, both separated, `s,t` étale (⊂ flat lfp), finite `s⁻¹(u)`, `j` universally closed; conclusions (a),(d),(g),(h) | Pass |
| §1.9a main argument | `s⁻¹(u)` finite | `R` closed in affine `U ×_T U` (03KN (3)), fibre affine and étale over `κ(u)`: finite | Pass |
| §1.9a *image_isScheme_of_quasiAffine* (03XW) | source (1)–(4) | étale map of affines, separated lqf, open subspace, quasi-affine over `T'`: identical; conclusion quasi-compact open representable | Pass |
| §2.9a coefficient universe | probe at pins | `HasSheafify (fppfTopology.over S) AddCommGrpCat.{u+1}` synthesizes; `HasSheafify fppfTopology AddCommGrpCat.{u}` fails | Pass |
| §2.9a *Scheme.fppfSheafLift* | Kummer; `Spec k[ℚ] → 𝔾_m` | `n`-th power finite locally free surjective: exact; `v(t) ≤ [L:k(t)]` but divisible by every `n`: not fppf-epi | Pass |
| §2.9a relative cohomology at `max v w` | Tau Ceti `Relative.lean:265`, `FreeYoneda.lean:68` | both assume `HasSheafify J AddCommGrpCat.{v}`, `v` = morphism universe; all eleven named API declarations exist in the file | Pass |
| §2.9a *fppfCohomology*, *fppfCohomology_algSpec* | `H⁰(𝔸¹, 𝔾_a)`; `∅`; zero algebra | `ULift k[t]`; `0`; `0` on both sites; `Fppf.lean:61`, `:99`, `InducedTopology.lean:133` as cited | Pass |
| §2.9a supports: `H⁰_Z`, sequence, naturality | `𝔸¹`, `Z={0}`, `𝔾_a`; `k[ε]`, closed point; `μ_p` on `𝔽_p[t]/(tᵖ)`; `𝔾_m` | `ker(k[t]→k[t,t⁻¹]) = 0`; `k[ε]` not `k`; `(a+tb)ᵖ = aᵖ` so `1+(t)`, order `p^{p−1}`; `H¹_Z ≅ ℤ`; `f⁻¹Z ⊆ Z'` gives `U' → U` | Pass |
| §2.9a triple, empty, univ, excision | `Z = ∅`; `Z = T`; `V ⊇ Z` | `i` iso: `0` (`subsingleton_of_isIso`, `:382`); `U = ∅`, free sheaf zero: `Hⁿ_fppf`; `{U, V}` covers `T` | Pass |
| §2.10 `smoothGroup_fppf_etale_comparison` locator | cesnavicius-2018 line 202; cesnavicius-scholze lines 2318–2323 | 2018 text uses [Gro68b, 11.7] for `𝔾_m`; Theorem 5.2.6: affine commutative smooth `G`, (5.2.6.2) | Pass for the affine clause; 11.7 itself not read |
| §0.20 locality of N-1, N-2 (032H) | Algebra Lemma 161.4 | `f_i` generate unit ideal, each `R_{f_i}` N-1 (N-2) ⇒ `R` is | Pass |

- Source locators read against the text: 55 Stacks tags, each found with the cited number in the chapter texts (Morphisms, Constructions, Descent, Topologies, More on Morphisms, Spaces, Properties of Spaces, Morphisms of Spaces, Bootstrap, Groupoids, Algebra, Examples; More on Groupoids in the full book), 31 of them read through their hypotheses; cesnavicius-scholze lines 2318–2323; cesnavicius-2018 line 202.
- Library declarations opened at the pins (Tau Ceti `2fd255d`, Mathlib `1b1ccf4b`): more than 30, every cited file and line number agreeing (`DescentDatum.lean:86`, `:381`, `:518`; `EffectiveEpi/Descent.lean:312`, `:368`; `Descent/AffineMorphism.lean:130`, `:405`; `Descent/MorphismProperty.lean:122`; `RelativeSpec/UniversalProperty.lean:138`; `RelativeSpec/Counit.lean:78`; `Sites/Fpqc.lean:116`, `:125`; `MorphismProperty/Descent.lean:40`; `SheafCohomology/Relative.lean:265`; `FreeYoneda.lean:68`; `CommAlgCat/Fppf.lean:61`, `:99`; `DenseSubsite/InducedTopology.lean:133`).
- Cross-roadmap citations resolved on `main`: ModularCurves 0C = §0.3 item 3 (affine quotient by a finite locally free equivalence relation) and 0E = §0.5 (affine schemes along a flat surjective quasi-compact `p`, tag 0245); its label table maps 0C and 0E to those sections.
- Seeded sample: none of the fifteen targets lies in a passage the change adds, alters or affects; §1.3 is touched only through §1.2's reference to *IsAlgebraicSpace.diagonal_locallyQuasiFinite*, which §1.3 states (line 2525).
- The move since `2fdb6a3`: sorted lines of the two READMEs are identical; no "above"/"below" in the moved sections points at the layers the wrong way; the guide's "prerequisite stages above" refers to the overview, which precedes it.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 132 roadmaps, 1511 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` exits 0 with 48 warnings, all `sorry`; no `set_option`. The file is unchanged against `main`, so the `#check` comparison and the one-tactic probe of the earlier reviews stand; no headline is added by the change (the new targets are supporting results, as the description says).
- Record against the merge base: no layer or heading removed or retitled, four headings added, no Lean declaration changed; no file changed outside the folder.

Overlap check: read PurityForFlatCohomology, VirtualFundamentalClassPartII, FunctorOfPoints, EtaleCohomologyFoundations (open) and StackPointsAndResidualGerbes, ModularCurves, StableReduction (main); no list of closest roadmaps by results has an entry. Fppf cohomology with supports: owned here (§2.9a), cited by PurityForFlatCohomology §0.2 and SchemeAndStackFoundationsPartII at their heads. Effective descent of affine morphisms along flat surjective quasi-compact maps and the affine quotient by a finite locally free equivalence relation: ModularCurves §§0.5, 0.3, cited here. Schemehood of separated locally quasi-finite algebraic spaces: owned here (§1.9a); also a bullet of NeronModelsAndSemistableAbelianVarietiesPartII §1.9 on main (C03). Quasi-affine morphisms and their descent: no other roadmap states them. The cohomologically-affine revision of this README conflicts with this head; the description's merge-order block puts it first (C01).

Source independence: changed passages only; 12 passages compared with 2 sources (the Stacks Project chapters, cesnavicius-scholze), none shared beyond forced hypothesis lists (longest run seven words, "surjective, flat and locally of finite presentation"); largest share stacks-project, 862 tagged locators; contents not compared again (no layer added, removed or reordered).

Research link: §2.9a is the carrier of fppf cohomology with supports in Česnavičius–Scholze, *Purity for flat cohomology* (2019); §§1.1a, 1.9a feed Artin's bootstrap theorem (§1.17); §§4.15–4.20 are de Jong's alterations (1996); §5.11 the Weil bound. Rests on the README and on cesnavicius-scholze.

## Not verifiable

- Grothendieck, *Le groupe de Brauer III*, Théorème 11.7 (§2.10): text not available to me; hypotheses not read (see the question above).

## Source issues

- none

## For the human reviewers

- none
