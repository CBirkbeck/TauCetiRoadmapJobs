# Review of SchemeAndStackFoundations (pull request #2531 at 9139803)

**Verdict:** needs changes

**Summary.** Changes are needed for three findings in the four new subsections. First, the routes of §§0.2a, 1.1a and 1.2 and the comparison in §2.9a cite as Tau Ceti's sixteen declarations and seven files that the pinned Tau Ceti does not have; they exist only on a newer Tau Ceti. Second, §2.9a says that its coefficient lift from fpqc to fppf sheaves is exact, which is false. Third, fppf cohomology with supports now has two owners, since the open PurityForFlatCohomology §0.2 plans the same construction. There are also five small corrections and one format note, none blocking. Nothing is left for a human to decide.

## R01 (P2) — §§0.2a, 1.1a, 1.2 and 2.9a cite as pinned Tau Ceti sixteen declarations and seven files that exist only on a newer Tau Ceti

An implementer working against this repository's pins cannot find the inputs that the effective-descent routes rest on. The quasi-affine descent of §0.2a, the fppf gluing lemmas and 02W8 of §1.1a, and `quasiFiniteDescent` of §1.2 therefore depend on results that neither a pinned library nor a layer of this roadmap provides.

The Tau Ceti pin in `lake-manifest.json` is `2fd255d` (4 November). Each item below is missing there, and each is present at Tau Ceti `91942aa9ff` (19 November), the commit the description says was checked:

- **Files.** `TauCeti/AlgebraicGeometry/Descent/Fpqc.lean`, `Descent/Open.lean`, `Descent/Gluing.lean`, `TauCeti/CategoryTheory/EffectiveEpi/Refinement.lean`, `TauCeti/AlgebraicGeometry/Modules/Algebra/Quasicoherent.lean`, `Modules/Algebra/BaseChange.lean` and `TauCeti/CategoryTheory/MorphismProperty/Representable.lean`.
- **Declarations.** `TauCeti.DescentDatum.refine`, `.restrict`, `.IsStable`, `.Hom.mem_of_descendsAlong`, `.exists_isAffineHom_baseChange_hom_isIso_of_quasiCompact`, `.exists_baseChange_hom_isIso_restrict`, `.isStable_baseChange_iff`, `.existsUnique_preimage_eq_of_isStable`, `.exists_baseChange_hom_isIso_of_forall_affineOpens` and its `_pullbackAlong` form, `exists_baseChange_hom_isIso_iff_refine`, `Scheme.Hom.pushforwardAlgebra`, `isIso_pushforwardStructureAlgebraBaseChange`, `MorphismProperty.relative_of_descendsAlong`, `TauCeti.CommAlgCat.isDenseSubsite_algSpec` and `IsAlgebraicSpace.diagonal_locallyQuasiFinite`.
- **Where.** README lines 540–551, 826–828, 856–858, 867–876, 2950–2963, 2972–2977, 3045, 3051 and 5010–5012.

At the pin, `Descent/MorphismProperty.lean:194`, cited for `Hom.mem_of_descendsAlong`, is `descended_hom_mem`. Tau Ceti's effective descent of affine morphisms exists there only along a flat affine `p` (`TauCeti.DescentDatum.isIso_toBaseChangeDescended_hom`, `Descent/AffineMorphism.lean:405`).

The README also contradicts itself on one of these names. §1.2 calls the diagonal lemma "the property Tau Ceti's `IsAlgebraicSpace.diagonal_locallyQuasiFinite` already uses" (line 3045), while §1.3 lists it under "Prove what Tau Ceti lacks" (line 3095). At the pin, §1.3 is right.

The smallest repair is one of two:

- Rebase once the repository's Tau Ceti pin has passed `91942aa9ff`, name that pin bump in the description as a dependency, and recheck the cited line numbers: `DescentDatum.lean:96` and `FreeYoneda.lean:82` are `:86` and `:68` at the current pin.
- Or, at this pin, state the missing inputs as targets of §§0.2a and 1.1a, in prose. The Layer 1 introduction (line 2897) already derives effective descent of affine schemes from §1.1's `qcoh_fpqc_descent`.

Either way, the §1.2 sentence should point at §1.3's target.

## R02 (P2) — The lift `Scheme.fppfSheafLift` of §2.9a is not exact: restriction from fpqc sheaves to fppf sheaves does not preserve epimorphisms

The README says, at line 4975: "with its form on `AddCommGrpCat.{u}`-valued fppf sheaves. It is exact and fully faithful." A consumer would read this as permission to turn every short exact sequence of §2.9's fpqc sheaves into a long exact sequence of fppf cohomology.

Here is a counterexample. Let `k` be a field, `S = Spec k`, and let `G = Spec k[ℚ]`, the diagonalisable group with character group `ℚ`. Let `π : G → 𝔾_m` be the map dual to `ℤ ⊂ ℚ`.

- **An epimorphism of fpqc sheaves.** `k[ℚ]` is free over `k[t, t⁻¹]`, with basis the `tᵠ` for `q` running over representatives of `ℚ/ℤ`. So `π` is affine and faithfully flat, and the universal section `t` of `𝔾_m` lifts after the fpqc cover `π` itself. Any map from `Gm S` to an fpqc sheaf that kills `π` therefore kills `t`, so `π` is an epimorphism in `Sheaf (fpqcTopology.over S) AddCommGrpCat.{u}`. That is the carrier of `Gm S` (Tau Ceti `Sites/Big/StructureSheaf.lean:126`).
- **Not an epimorphism of fppf sheaves.** An fppf cover `V → 𝔾_m` on which `t` lifts would give compatible `n`-th roots of `t`, for every `n`, in the residue field `L` of a closed point of the generic fibre of `V`. That field is finite over `k(t)`. The `t`-adic valuation extends to `L` with ramification index `e ≤ [L : k(t)]`, so `t` has no `n`-th root in `L` once `n > e`. Hence the fppf cokernel of the lifted `π` is nonzero.

The sequences this roadmap uses are not affected. The `n`-th power map on `𝔾_m` is finite locally free and surjective, and Artin–Schreier is étale-surjective. Only the general claim fails.

Repair: replace "It is exact and fully faithful" with "It is fully faithful and left exact. It carries a short exact sequence of fpqc sheaves to a short exact sequence of fppf sheaves when the epimorphism is fppf-locally surjective, as for the Kummer and Artin–Schreier sequences."

## R03 (P2) — Fppf cohomology with supports gets a second owner: PurityForFlatCohomology §0.2 (open) plans the same construction, long exact sequence, open excision and triple sequence

If both texts merge, the same group `H^i_Z(X, F)` on the big fppf site will be built twice under two names.

- **The other owner.** Open pull request #1840 states, in `TauCetiRoadmap/PurityForFlatCohomology/README.md` lines 78–79, that it owns "fppf cohomology with supports on the big fppf site of a scheme". Its §0.2 (lines 834–873) constructs the group as the fibre of restriction, together with `H^0_Z = ker(F(X) → F(X ∖ Z))`, the long exact sequence, excision for an open `V ⊇ Z` and the triple sequence.
- **A third roadmap hands it over.** Open pull request #2272 assigns the object to PurityForFlatCohomology §0.2 in `TauCetiRoadmap/SchemeAndStackFoundationsPartII/README.md:369`.
- **This roadmap.** §2.9a defines *Scheme.fppfCohomologyWithSupport* (line 5022) with the same `H⁰`, long exact sequence, triple sequence and open excision. Its Check at line 5055 is the same example as PurityForFlatCohomology's Check at line 880.

SchemeAndStackFoundations is on main and comes before every open roadmap, so it can be the single owner, and the open roadmap cites it. The smallest change on this side is to name PurityForFlatCohomology §0.2 in the scope sentence at line 5042 as the roadmap that builds étale excision, the local-to-global spectral sequence, Mayer–Vietoris and the comparisons on this carrier. On the other side, PurityForFlatCohomology §0.2, and with it SchemeAndStackFoundationsPartII line 369, would cite §2.9a for the construction, `H⁰_Z`, the long exact sequence, open excision and the triple sequence instead of planning them. The two texts need to agree before either merges.

## C01 — §1.1a sends the implementer to reprove an fppf instance that the pinned Mathlib already has

Lines 2966–2968 say that `p` and its base changes are effective epimorphisms "exactly as Mathlib proves the fpqc instance". `Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:124` already proves the fppf instance: a surjective, flat morphism locally of finite presentation is an effective epimorphism. Citing that instance would remove one of the "three places".

## C02 — The 02W8 route in §1.1a leaves "quasi-compact over `S'`" unjustified when `S'` is not quasi-separated

The route reduces to `q` "the inclusion of a quasi-compact open of `S'`" (line 2978) and then asserts that each saturation "is stable and quasi-compact over `S'`" (line 3000). A quasi-compact open of `X` need not be quasi-compact over a quasi-compact but non-quasi-separated `S'`. Take `S'` to be infinite-dimensional affine space with a doubled origin: one copy meets the other in the complement of the origin, which is not quasi-compact.

The step holds once the datum is effective, so it is circular at that point of the route. Taking `T` to be a finite disjoint union of affine opens of `S'`, which is an affine scheme and is allowed by the refinement bullet, repairs it. Stacks also reduces to affines, through Lemma 35.36.2 (02W3).

## C03 — Read literally, the Needs lines of §§1.2, 1.15 and 1.17 make a cycle through `artinBootstrap`

§1.2 now needs §1.17 `artinBootstrap` for `spaceFppfDescent` (line 3061). §1.15's `torsorRepresentability` needs §1.2 for exactly that statement (line 3639). §1.17's single Needs line (line 3778) gives §1.15 as a need of the whole subsection, including `artinBootstrap`. Its proof (Stacks 04S6) uses nothing from §1.15. Saying that `artinBootstrap` needs only §1.2 `quasiFiniteDescent`, §1.9a and the presentation sections, and not §1.15, removes the apparent cycle.

## C04 — Two Stacks numbers are off, and one locator covers only the quasi-compact case

- Tag 02LN is Lemma 37.41.4; Lemma 37.41.5 is 02LO (line 3354).
- Tag 03BM is Proposition 39.23.9, not 39.23.10 (line 663).
- Lemma 35.35.13 (0AP4), cited for gluing over stable opens when `p` is "either quasi-compact or locally of finite presentation" (line 2984), is stated for quasi-compact `p` only. Saying so would tell the reader that the fppf case is this roadmap's extension.

## C05 — The locator for `smoothGroup_fppf_etale_comparison` (§2.10) does not contain the theorem

"Česnavičius 2018, §2, proof of Proposition 2.3 and Remark 2.7, Appendix A" (line 5079) points at passages that use the comparison but do not state it:

- The proof of Proposition 2.3 is entirely étale (cesnavicius-2018 lines 160–171).
- Remark 2.7 uses it for `𝔾_m` and refers to [Gro68b, 11.7] (line 202).
- Corollary A.4 uses it over a field (line 594).

Citing the primary source that Česnavičius refers to, Grothendieck's *Le groupe de Brauer III*, Theorem 11.7, would repair it. That source is already in the References (line 9327); it was not read here.

## N01 — Proposed target names in §§0.2a and 1.1a are in code font and declared nowhere

`IsQuasiAffineHom`, `isQuasiAffineHom_iff`, `IsQuasiAffineHom.of_locallyQuasiFinite`, `Scheme.Hom.toRelativeSpec`, `LocallyQuasiFinite.descendsAlong` and the three `TauCeti.DescentDatum.exists_…` targets are in code font. With the `TauCeti.` prefix they read as existing Tau Ceti declarations. §§1.9a and 2.9a write proposed names in italics; the same would do here.

## Questions for the author

- Does Grothendieck's *Le groupe de Brauer III*, Theorem 11.7, need `G` quasi-projective for the comparison in §2.10? Milne's *Étale Cohomology*, III.3.9, assumes it, as far as I recall. If it is needed, `smoothGroup_fppf_etale_comparison` needs that hypothesis too. Neither text is in the sources cache, so I could not check.

## Verified sound

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §0.2a Checks on `IsQuasiAffineHom` | `𝔸²∖0`; `ℙ¹`; doubled line over `𝔸¹`; `∐ℕ Spec k` | `Γ = k[x,y]`, open immersion into `𝔸²`; `Γ = k`, not injective; étale, not separated; not quasi-compact | Pass |
| §0.2a Galois Check | `W = 𝔸²_ℂ`, conjugation | `W∖{(i,0)}` goes to `W∖{(−i,0)}`; `W∖{±i}` stable; model `𝔸²_ℝ∖V(x²+1,y)` | Pass |
| §0.2a `of_locallyQuasiFinite` | Mathlib `ZariskisMainTheorem.lean:358`, `Normalization.lean:309`; Stacks 02LR | open immersion under LQF, LFT, separated, qc; then integral, so affine | Pass |
| §0.2a tags | 01SK, 01SL, 01SM, 01SN, 01SO, 02JR, 01SP, 054G, 01LY, 02KQ, 02KU, 02L7, 0247, 0245 | statements and numbers as cited; 054G hypothesis "`h` quasi-separated" matches | Pass |
| §1.1a Check, `∐ℤ Spec ℂ` | `n ↦ −n` with conjugation | orbits `{0}`, `{n,−n}`; model `Spec ℝ ⊔ ∐ Spec ℂ`; `ℂ⊗_ℝℂ = ℂ×ℂ` | Pass |
| §1.1a separatedness Check | doubled line over `𝔸¹_ℂ`, origins swapped | fibre `Y_0 = Spec ℂ`, one point; affine neighbourhood contains both origins | Pass |
| §1.1a route | `S'` = `𝔸^∞` with doubled origin | one copy is qc, but its meet with the other copy is not qc | C02 |
| §1.1a effective epimorphisms | Mathlib `Sites/Fpqc.lean:124` | fppf instance already proved | C01 |
| §1.2 locally quasi-finite convention | Mathlib `QuasiFinite.lean:72`; Stacks 01TD | quasi-finite `appLE`, no finite type; 01TD includes finite type | Pass |
| §1.2 route, Needs | 02W5, 02W8, 046J, 04SK, 0ADV | 046J uses 03XX and 02W8; 04SK and 0ADV are proved from 04S6 | Pass; C03 |
| §1.9a folded-line Check | `x ↦ x²` on `𝔸¹/(Δ⊔Γ)`, `char ≠ 2` | invariant; atlas composite quasi-finite; not locally separated (02Z1) | Pass |
| §1.9a `etaleEquivalence_splitting` | total relation on `∐ℕ Spec k` (fails Stacks hypothesis 6) | stated conclusion holds with `U'` one point; it is weaker than 03X5 | Pass |
| §1.9a tags | 03XJ, 03XK, 03XL, 03XU, 03XX, 0418, 03JH, 03FY, 03KN, 02WU, 03FL, 03X5, 03XW | as cited; 02LN is 37.41.4 | C04 |
| ModularCurves 0C, item 3 | ModularCurves README on main, lines 919–945, 4505 | 0C is Layer 0.3 by its label table; affine `X/R`, finite locally free, `R = X ×_{X/R} X` | Pass |
| §2.9a lift exactness | `Spec k[ℚ] → 𝔾_m` | fpqc epimorphism; no `n`-th root of `t` in `L/k(t)` for `n > e` | R02 |
| §2.9a universe claims | Lean probe | `HasSheafify` at `u+1` found; at `u` (fppf, fpqc) fails; abelian at `u+1` | Pass |
| §2.9a Checks | `μ_p` on `𝔽_p[t]/(tᵖ)`; `𝔾_m` on `𝔸¹`, `Z = {0}`; `k[ε]` | `1+(t)`, order `p^{p−1}`; `H¹_Z = k[t^±]^×/k^× = ℤ`; `H⁰_Z = k[ε]` | Pass |
| §2.9a triple sequence | Tau Ceti `tripleδ` for `U ⊂ U' ⊂ V` | `H(V,U') = H_{Z'}`, `H(V,U) = H_Z`, `H(U',U) = H_{Z∖Z'}(T∖Z')` | Pass |
| §2.10 Checks | `Spec 𝔽_p[t^±]`, `μ_p`; `Spec ℝ`, `μ_2` | `O^×/p = ℤ/p` against étale `0`; `ℝ^×/ℝ^{×2} = ℤ/2` against Zariski `0` | Pass |
| §2.10 locators | 03DW, 0DDK; Česnavičius 2018 Prop 2.3, Remark 2.7, Cor. A.4 | 03DW and 0DDK as cited; Česnavičius only uses the smooth comparison | C05 |
| §0.17 `depth_localization_le`, Checks | `k[x,y]_(x,y)`, `p = (x)`; `M = R/(x)`, `p = (y)`; `k×k[t]` | `1+1 = 2 ≥ 2`; `M_p = 0`; height 0, `dim R/p = 0`, `0 < 1`; 0FCC p. 607 | Pass |
| §0.17 `satisfiesSerreS_two_iff_hartogs` | `R/(x)` over `k[x,y,z]`; `k[x,y]/(x²,xy)`; `𝔪 ⊂ k[x,y]` | depth 1 at height 2; embedded prime of height 1; depth 1, not surjective | Pass |
| §0.19 locators | Česnavičius 2021 Def. 1.2, Ex. 1.3, §2.10 | pp. 2, 2, 7; `(S_0)` is vacuous, so equivalent to local Noetherianity | Pass |
| §0.20 Checks, tags | `k[t_i², t_i³]`; `R_r`; 032W, 0334, 032I, 03GH, 07QV, 09E1 | specialisation forces `t_j ∈ k[t_j²,t_j³]`, false; `2^r` generators | Pass |
| §0.28 Checks | `ℙ¹`, two points; `𝔸²∖0 → 𝔸²`, `(x,y)` | `k` against `k×k`; `k` against `0`; 01JU (26.17.6 (1)), 01HM | Pass |
| §1.1, §1.5, §1.11 | 023T, 04TQ, 04TR, 04TS, 01BG; `Δ⊔Γ`; folded line `Γ(X,O)` | as cited; `x = −x` forces `x = 0`; even polynomials, `k[x²]` | Pass |
| §1.20 | `Spec k ×_{BG} Spec k`; `ℂ((t))`, `√t`; 04SZ, 04YW, 0CL5, 0CQM, 0CLA–0CLN | 2 points against 1; odd valuation, trivial after `t = u²`; tags as cited | Pass |
| §2.12, §2.21 | `x²+1` over `ℤ[1/2]`; DVR `A[1]`; `k[x,y]/(x²,xy)`; 48.19 list | discriminant `−4` unit, roots `±2` mod 5; `Ext¹(κ,A) = κ`; not CM, 2 degrees; (1)–(9) match | Pass |
| §4.14, §4.17 | Nitsure Thm 5.1, 6.5–6.6; `Hom¹(ℙ¹,ℙ¹)`; node blow-up; `V(xy(x−y))` | pp. 24, 30–31; `PGL₂ ⊂ ℙ³`; `C̃+2E` not reduced, `C̃+E` SNC; 3 branches | Pass |
| §5.2 | `Spec k'/k`, degree `d`, over `𝔸¹`; `[0]` on `𝔸¹`; 02R3, 02S0, 0AZ0, 02RA, 02RF, 02RV, 02TY | both sides `d[𝔸¹_k]`; `[0] = div t ∼ 0`, degree 1; tags as cited | Pass |
| Headlines, one-tactic probe | 48 sorried declarations; `rfl`, `infer_instance`, `simp` | none closes (two time out at 40000 heartbeats); `artinBootstrap` matches 04S6 | Pass |

- Source locators read against the text: about 140 Stacks tags (fifteen sampled sections and the four new ones), with the July 2026 book and the current More on Morphisms and Groupoids chapters for numbering; Česnavičius 2021 (3), Česnavičius 2018 (4), Morel–Voevodsky (3), Nitsure 2005 (7).
- Library declarations opened at the pins: Mathlib `Sites/Fpqc.lean:84, :102, :124`, `FlatDescent.lean:42–200`, `LocalFlatDescent.lean:36`, `QuasiAffine.lean:34`, `QuasiFinite.lean:72`, `ZariskisMainTheorem.lean:48, :358`, `Normalization.lean:309`. Tau Ceti `DescentDatum.lean:86`, `EffectiveEpi/Descent.lean:312`, `Descent/AffineMorphism.lean:405`, `Descent/MorphismProperty.lean:122–208`, `Relative.lean:265, :357, :382, :391, :460`, `FreeYoneda.lean:68, :195`, `Fppf.lean:61, :99`, `StructureSheaf.lean:103, :126, :202`, `AlgebraicSpace/Basic.lean:195`. Every name added by the pull request was searched at both pins.
- Cross-roadmap citations resolved: ModularCurves (main) 0C, now its Layer 0.3; PurityForFlatCohomology (#1840) lines 78, 834–880; SchemeAndStackFoundationsPartII (#2272) lines 155–200, 369; open pull request #2489 on this folder, which merges cleanly with this one in the stated order.
- Automatic checks: one form check set aside as a false positive (below). Dependency check: `depcheck: 200 roadmaps, 2262 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` exits 0 with 48 warnings, all `sorry`. `Suggested.lean` is unchanged by this pull request; no section binder is lost (elaborated signatures compared for the sampled declarations).
- Headline theorems: unchanged. The new targets are not headlines, and the module docstring is accurate.
- Previous review (of #2489 at another head): no findings. Its two small corrections concern text added by #2489 (the route of `integral_point_descent` in §0.9, and §1.22a), which this head does not contain; neither applies here.
- Pull-request text: the title and description match the head. The description itself says that the descent API is newer than the Tau Ceti pin (R01).

Overlap check: read PurityForFlatCohomology, SchemeAndStackFoundationsPartII, VirtualFundamentalClassPartII, FunctorOfPoints, QuasicoherentSheavesOnPrestacks, StableReductionPartII (open) and StackPointsAndResidualGerbes, AlgebraicModuliForArithmeticGeometry, JacobianChallenge, ModularCurves (main); searched every open head and main for quasi-affine morphisms, 02W8, 03XX, 0418, 0247, the fppf coefficient universe and the affine fppf sheaf equivalence. Shared: fppf cohomology with supports, owned both here (§2.9a) and by PurityForFlatCohomology §0.2 (R03); SchemeAndStackFoundations, being on main, should own it. Nothing else is shared.

Source independence: 21 passages compared with 6 sources (Stacks Project, Česnavičius 2021, Česnavičius 2018, Morel–Voevodsky, Nitsure 2005, the PurityForFlatCohomology README for the duplicated Check); no wording shared beyond forced statements and short phrases ("is a morphism of descent data", five words). The §1.9a proof plan follows the steps of Stacks' proof of 03XX in the README's own words. Largest share stacks-project, about 880 of about 1,100 locators. Contents compared with stacks-project: independent; the new subsections each combine several chapters (Morphisms, Descent and More on Morphisms for §0.2a; Spaces, Properties and Morphisms of Spaces and More on Groupoids for §1.9a).

Research link: §2.9a is the carrier of fppf cohomology with supports in Česnavičius–Scholze's purity for flat cohomology, as planned by PurityForFlatCohomology; §§1.1a and 1.9a feed Artin's bootstrap (Stacks 04S6) behind §1.17 and the Keel–Mori theorem; §2.10 rests on Česnavičius 2018. This rests on the README's text and the PurityForFlatCohomology README.

## Not verifiable

- Grothendieck, *Le groupe de Brauer III*, Theorem 11.7 (suggested in C05): not in the sources cache; its hypotheses were not read.
- de Jong 1996 (§4.17), Fulton 1998 (§5.2) and Hartshorne 1977: recorded as cited by locator only; their texts were not read.
- The claim in §1.1a that quasi-compactness enters Tau Ceti's gluing proofs in exactly three places: those proofs are only on Tau Ceti `91942aa9ff`, which was not read in full.

Automatic checks set aside as false positives: one name, the comparison of the fppf and fpqc topologies in §2.9a, is flagged as a declaration this roadmap claims, but it is Mathlib's `AlgebraicGeometry.Scheme.fppfTopology_le_fpqcTopology` (`Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:84`), and the README's Needs line attributes it to Mathlib.

## Source issues

- none

## For the human reviewers

- none
