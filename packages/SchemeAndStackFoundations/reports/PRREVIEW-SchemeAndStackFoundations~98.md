# Review of SchemeAndStackFoundations (pull request #2531 at 5f13b01)

**Verdict:** needs changes

**Summary.** One finding blocks acceptance. §1.1a now makes the effective descent of affine morphisms along a flat surjective quasi-compact map (Stacks 0245) a target of this roadmap. ModularCurves Layer 0.5 on main already owns that statement on the same Tau Ceti descent data, and this README's own scope assigns it to ModularCurves. This head repairs every finding of the previous review except the deferred one on fppf cohomology with supports, which stands. There are five small corrections, one format note and one question for the author, none of them blocking, and nothing is left for a human to decide.

## R01 (P2) — §1.1a re-plans effective descent of affine morphisms (Stacks 0245), which ModularCurves Layer 0.5 on main owns and this README's scope assigns to ModularCurves

As written, two roadmaps would build the same theorem on the same carrier, and this README would contradict itself about who builds it.

- **This roadmap.** In §1.1a (README line 2953), under "Prove, for such `p` and `D`", the bullet reads "**Affine morphisms.** If `X ⟶ S'` is affine, `D` is effective, with a model affine over `S` (Stacks, Lemma 35.37.1 (0245))". It comes with its own route through §1.1's `qcoh_fpqc_descent`.
- **The other owner.** ModularCurves on main (`TauCetiRoadmap/ModularCurves/README.md` lines 1016–1018, Layer 0.5, formerly 0E) lists the same statement among the targets it proves, on `TauCeti.DescentDatum`: schemes affine over `S'`, along a flat surjective quasi-compact `p` that need not be affine (Stacks, Tag 0245). Its lines 4677–4679 call it "the first of the remaining forms of Layer 0.5".
- **The self-contradiction.** This README's scope (line 271) gives the object away: "Effective fpqc descent of affine schemes along one faithfully flat morphism and of finite locally free schemes: ModularCurves 0E."

ModularCurves consumes nothing from this roadmap, and this pull request already cites its 0C, so it can be the supplier here. The smallest change is to make the bullet a citation:

- for `p` quasi-compact, the statement is ModularCurves 0E (its Layer 0.5);
- for `p` locally of finite presentation, §1.1a's own gluing over the base and refinement reduce to that case, exactly as its 02W8 route already does;
- ModularCurves 0E goes into §1.1a's *Needs:* line, and the Layer 1 introduction sentence at line 2865 is aligned with the scope.

The description's sentence on 0245 changes with it.

## Deferred findings

- D01 — stands

## C01 — §0.20 credits the locality of N-1 and N-2 on `Spec R` to Lemma 10.161.6 (032J), which is a different lemma

README lines 2042–2043 read: "locality on `Spec R` (`IsN1.of_span_eq_top`, `IsJapanese.of_span_eq_top`, `:390`, `:405`; Lemma 10.161.6 (032J))". Lemma 10.161.6 says that `R` is N-1 when `R[z, z⁻¹]` is. Locality under a cover generating the unit ideal is Lemma 10.161.4 (032H), on the same page of the Stacks book (p. 877). The pinned Tau Ceti docstrings of the two declarations (`TauCeti/RingTheory/Japanese.lean`, just above lines 390 and 405) carry the same wrong tag. Replace it with Lemma 10.161.4 (032H).

## C02 — Two carrier sentences added to §§2.7 and 2.11 describe statements that do not live on that carrier

- **§2.11.** Lines 5170–5171 say that "`fppf_kummer_sequence`, `artinSchreier_sequence` and the fppf clause of `hilbert90` are on §2.9a's carrier". But `artinSchreier_sequence` is stated on `X_ét` (line 5161) and has no fppf clause. It should come off that list, unless an fppf form is meant, in which case it should be stated.
- **§2.7.** Lines 4783–4784 end "the two share Tau Ceti's `Sheaf.relativeH'`". But §2.7 defines `cohomologyWithSupport Z F q := R^q Γ_Z(X, −)` (line 4750), and `relativeH'` appears nowhere in §2.7. Either say that the two are the analogous constructions on the Zariski and big fppf sites, or state the comparison between them as a target.

## C03 — The route of *image_isScheme_of_quasiAffine* in §1.9a uses the descent datum a sheaf induces on a representing scheme (Stacks 02W5), which nothing in §1.9a's *Needs:* line provides

The route (lines 3363–3370) ends by saying the base change of the image "descends along the étale cover by §1.1a's effective descent of quasi-affine morphisms". Stacks' proof of 03XW (book p. 5467) needs two facts at that step:

- the scheme `T' ×_T U` carries a descent datum relative to `{T' → W}`, induced by the sheaf `U` (Lemma 35.39.1 (02W5));
- a model of that datum represents `U` (the last part of 02W5).

In this README, 02W5 appears only inside §1.2's route for `quasiFiniteDescent` (lines 3043–3046), and §1.9a's *Needs:* line (line 3377) does not cite §1.2. Citing §1.2 as a whole would create the coarse cycle §1.9a → §1.2 (`spaceFppfDescent` needs `artinBootstrap`) → §1.17 → §1.9a. The smallest repair is to state 02W5 as a target of §1.1a and cite it from §§1.2 and 1.9a. The target: an fppf sheaf over `S` whose base change along `p` is represented by a scheme gives that scheme a descent datum relative to `p`, and a model of the datum represents the sheaf.

## C04 — *etaleEquivalence_splitting* (§1.9a) drops a hypothesis of the lemmas it cites

The statement (lines 3354–3362) cites More on Groupoids, Lemmas 40.13.1 (03FL) and 40.13.2 (03X5). Those lemmas also assume that `s⁻¹(u)` is finite (hypothesis (6) of 03FL, book p. 3647). That hypothesis fails, for example, for the total relation on `∐_ℕ Spec k` over `Spec k`. The statement as written is still true: its conclusion is weaker than that of 03X5, since it omits clauses (b) and (c). Here is why:

- `(t, s)` is a proper monomorphism, hence a closed immersion;
- Lemma 37.41.4 (02LN), applied to `U → T` at `u`, gives the finite open and closed `U'`;
- the restriction of `R` to `U'` is then finite étale over `U'`.

The cited lemmas, however, do not prove the statement as written. Add "`s⁻¹(u)` finite", which holds where 03XX applies it because `R` is affine there, or cite 02LN with this argument instead.

## C05 — Two sentences of the pull-request description no longer match the heads

- **The other open revision.** The description says: "Open #2272 (SchemeAndStackFoundationsPartII) assigns that object to PurityForFlatCohomology §0.2." At its current head, SchemeAndStackFoundationsPartII takes fppf cohomology with supports on schemes from §2.9a (its README lines 27, 363, 424 and 475). It leaves only étale excision and the étale comparison to PurityForFlatCohomology §0.2. The single-owner paragraph should name only PurityForFlatCohomology §0.2 as still constructing the groups.
- **The affine comparison.** The description says §2.9a defines fppf cohomology and the groups with supports "and compares them with the affine fppf site". §2.9a compares only fppf cohomology (*fppfCohomology_algSpec*), not the groups with supports. "and compares fppf cohomology with the affine fppf site" would be accurate.

## N01 — In §1.2 the letter `p` names both `F → h_S` (line 3035) and the covering `∐ S_i → S` (line 3043) in one paragraph; a second letter would help the reader.

## Questions for the author

- Does Grothendieck's *Le groupe de Brauer III*, Théorème 11.7, cited in §2.10 for `smoothGroup_fppf_etale_comparison`, cover every smooth commutative group scheme? Or does it need a quasi-projectivity hypothesis, as Milne's *Étale Cohomology*, III.3.9, assumes (from memory)? Česnavičius–Scholze, Theorem 5.2.6 (cesnavicius-scholze line 2318), covers affine smooth `G` over an affine base only. What stopped me: the text of *Brauer III* is not in the sources cache.

## Findings of the previous review

- R01 — repaired: the Tau Ceti names cited in §§0.2a, 1.1a, 1.2 and 2.9a all exist at the pin. Examples are `DescentDatum.lean:86`, `:381`, `:518`, `EffectiveEpi/Descent.lean:312`, `:368` and `Descent/AffineMorphism.lean:130`, `:405`. The missing lemmas are now targets of §1.1a, and §1.2 points to "§1.3's *IsAlgebraicSpace.diagonal_locallyQuasiFinite*".
- R02 — repaired: "It is fully faithful and left exact. It carries a short exact sequence of fpqc sheaves to a short exact sequence of fppf sheaves when the epimorphism is fppf-locally surjective". A Check with `Spec k[ℚ] → 𝔾_m` was added.
- R03 — not repaired: deferred (D01).
- C01 — repaired: "Mathlib's instances in `Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:116` and `:125`".
- C02 — repaired: "refinement along their disjoint union makes `S'` affine and `p` quasi-compact".
- C03 — repaired: "for `artinBootstrap`, only §§1.4–1.6, §§1.8–1.9, §1.14, §1.2 `quasiFiniteDescent` and §1.9a … and not §1.15".
- C04 — repaired: "Lemma 37.41.4 (02LN)", "Proposition 39.23.9 (03BM)", and for 0AP4 "Stacks states it for `p` quasi-compact".
- C05 — repaired: the locator is now *Brauer III* Théorème 11.7, together with Česnavičius–Scholze Theorem 5.2.6 (5.2.6.2). The hypotheses of 11.7 remain unread; see the question above.
- N01 — repaired: the proposed names of §§0.2a and 1.1a are now in italics.

## Verified sound

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §0.6 reflexive hulls, Hartogs | `k[t]⊕k[t]/(t)`; cusp `k[t²,t³]`; planes `V(x,y)∪V(z,w)`; `k[x,y,z,w]/(xw)` | `F^∨∨=k[t]`, `j_*=k[t^±]`; `(A:m)=k[t]`, `(A:k[t])=m`; depth 1, `j_*O_U=O_{P₁}×O_{P₂}`; depth 3 | Pass; 13 tags as cited |
| §0.7a linear normalization | `XY(X+Y)` over `𝔽₂`; `z=x²+xy+y²`; `k[X,E]/(E²)`; Milne AG 2.43–2.47 | `A/(ℓ)=k[X]` for all three forms; `x³−zx=−xy(x+y)=0`, 9 monomials; `d=1`, basis `1,E` | Pass; pp. 52–53, CA 8.4 p. 35 |
| §0.20 Japanese and Nagata | `k[t_i²,t_i³]`, `j` outside supports; `R_r`; eventually constant `𝔽₂`-sequences | `t_j∈k[t_j²,t_j³]` false; `2^r` generators, `{1,t₁}` at `r=1`; image in a domain is `𝔽₂` | Pass; 21 tags, 33 Tau Ceti lines; 032J (C01) |
| §0.22 two counterexamples | 00PB p. 719, 09E1 p. 887, 02JE p. 7354 | `f^p∈k^p[[x]]⊂A`; `dim A[x]_{m'}=3`, maximal chain of length 2 | Pass |
| §1.2 fppf descent | 02W8, 01TD, 02W5, 046J, 04SK, 0ADV, 04S6; Mathlib `Algebra.QuasiFinite` | Mathlib: finite fibres only (`ℤ→ℚ` qualifies); route equals 046J's proof | Pass; N01 |
| §1.9 separation | 03HL, 03HI, 03ZM, 02X5, 0AHR, 0AHS; folded line | `Δ⊔Γ→U×U` quasi-compact, not closed, not an immersion | Pass |
| §1.19 algebraic, DM stacks | 02ZW, 03YJ, 026O, 04T2, 03YO, 06N3; `Bμ_p` over `𝔽_p` | diagonal `μ_p` not unramified, so not DM | Pass |
| §1.20 inertia, points, valuative | `Spec k×_{BG}Spec k`, `G=ℤ/2`; `ℂ((t))`, `√t`; 0CQM, 04SZ, 04XG–04Y8, 0CL5–0CLN | 2 points against 1; odd valuation, trivial after `t=u²` | Pass |
| §2.3 torsors | `ℤ/2` on `(Spec ℝ)_ét`; two transpositions in `S₃`; `Torsor.lean` 10 lines | `H¹=ℤ/2`; product is a 3-cycle, not of order 2 | Pass; 03AH–03AJ |
| §2.16 Tsen, curves, hypercovers | 03RC, 03RD, 03RH, 03RM pp. 4874–4875, 0DHM, 0DHP | 0DHM holds for every `K∈D⁺`; nodal cubic `H¹(C,ℤ/n)=ℤ/n` | Pass |
| §2.21 dualising complexes | `k[x,y]/(x²,xy)` local; DVR `A[1]`; `ℙ¹` | dim 1, depth 0: two degrees; `RHom(κ,A[1])=κ[0]`; `O(−2)[1]` | Pass; 10 tags |
| §4.8 completion | 0AIZ, 0AMC, 0GBA, 087W, 0881; `k[x₀,x₁,…]/(x_i)` | finite, not finitely presented | Pass |
| §4.10 existence, algebraization | 0883–088F, 0899, 09ZT, 0A42, 01K4, 05GI (4); `∐_ℕ 𝔸¹_A` | maximal ideals contain `I`; compatible system lands in one copy | Pass |
| §5.11 Weil bound | intersection table; Milne AG11 11.12, 11.53–11.55; Hermitian curve | `Γ₀²=−2gq`, `Δ₀²=−2g`, `Γ₀·Δ₀=N−q−1`; `q³+1=q²+1+2gq`, `g=q(q−1)/2` | Pass |
| §5.12 Bézout | plane curves; skew lines in `ℙ³`; twisted cubic | `≤de`; `0≤1`, no equality since `2<3`; length 3 | Pass; Fulton not read |
| §0.2a Checks | `𝔸²∖0`; `ℙ¹`; doubled line over `𝔸¹`; `∐_ℕ Spec k` | `Γ=k[x,y]`, open immersion; `Γ=k`, not an immersion; not separated; not quasi-compact | Pass |
| §0.2a `of_locallyQuasiFinite`, `iff` | Mathlib `ZariskisMainTheorem.lean:358`; 01SM, 054G, 02LR | open immersion into the normalization, which is affine over the base | Pass; 14 tags |
| §1.1a Checks | `𝔸²_ℂ∖{(±i,0)}`; `∐_ℤ Spec ℂ`; doubled line, origins swapped | model `𝔸²_ℝ∖V(x²+1,y)`; orbits `{n,−n}`; `κ(y)=ℂ`, affine open would hold both origins | Pass |
| §1.1a route | 02W0 (two fpqc coverings), 0AP4 proof (03N0, 040L), 01UA | `T=∐` affine opens: `T→S` flat, lfp, quasi-compact | Pass |
| §1.1a affine bullet | ModularCurves lines 1016–1018; own scope line 271 | same 0245 statement, same `TauCeti.DescentDatum` | R01 |
| §1.9a splitting | total relation on `∐_ℕ Spec k` | `s⁻¹(u)` infinite; stated conclusion holds with `U'={u}` | C04 |
| §1.9a image lemma | 03XW proof, p. 5467 | needs 02W5; §1.9a Needs lacks it | C03 |
| §2.9a coefficient universe | Lean probe | `HasSheafify` found at `u+1`, fails at `u`; Grothendieck abelian via `isGrothendieckAbelian_of_essentiallySmall` | Pass |
| §2.9a lift | `Spec k[ℚ]→𝔾_m` | fpqc epimorphism; no `n`-th root of `t` in `L` once `n>e` | Pass |
| §2.9a supports Checks | `μ_p` on `𝔽_p[t]/(tᵖ)`; `𝔾_m` on `𝔸¹`, `Z={0}`; `k[ε]` | `1+(t)`, order `p^{p−1}`; `H¹_Z=ℤ`; `H⁰_Z=k[ε]` | Pass |
| §2.9a excision, triple | Tau Ceti `Relative.lean:203`, `:460–481` | sections on `V` vanishing on `V∩U` glue with `0` on `U` | Pass |
| §2.10 locators | cesnavicius-scholze line 2318; cesnavicius-2018 line 202 | 5.2.6.2 for affine smooth `G`; Remark 2.7 cites 11.7 with `𝔾_m` | Pass; question |
| §§2.7, 2.11 sentences | lines 4750 against 4784; line 5161 against 5171 | `R^qΓ_Z` against `relativeH'`; étale statement listed as fppf | C02 |
| §0.20 locality locator | 032J and 032H, p. 877 | 032J: `R[z,z⁻¹]` N-1 implies `R` N-1; 032H: unit-ideal cover | C01 |
| Headlines stated (12) | one-tactic probe on all 48 sorried declarations | 46 fail, 2 time out at 40000 heartbeats; none closes | Pass |
| Headlines not statable (7) | module docstring | Keel–Mori, duality, Brauer class, Picard torsors, Schlessinger, GRR, `K₀→G₀`: carrier named | Pass |

- Source locators read against the text: about 190 Stacks tags in the July 2026 book (the fifteen sampled sections and the four new subsections), plus Milne AG (6 items), Milne AG11 (4), Milne CA (1), Česnavičius–Scholze (1) and Česnavičius 2018 (1).
- Library declarations opened at the pins:
  - Mathlib: `Sites/Fpqc.lean:84, :116, :125`, `Morphisms/FlatDescent.lean:179`, `LocalFlatDescent.lean:36`, `ZariskisMainTheorem.lean:48, :358`, `Normalization.lean:132, :169`, `QuasiAffine.lean:34`, `RingTheory/QuasiFinite/Basic.lean:67`, `MorphismProperty/Descent.lean:32, :40`, `DenseSubsite/InducedTopology.lean:133`, `DenseSubsite/Basic.lean:788`, `Group/Affine.lean:72, :156`, `GrothendieckAxioms/Sheaf.lean:78`.
  - Tau Ceti: `DescentDatum.lean:86, :123, :381, :518`, `EffectiveEpi/Descent.lean:312, :368`, `Descent/AffineMorphism.lean:130, :405`, `Descent/Affine.lean:532`, `RelativeSpec/UniversalProperty.lean:138`, `RelativeSpec/Counit.lean:78, :139`, `Pushforward/QuasiSeparated.lean:107`, `SheafCohomology/Relative.lean:203, :265–481`, `FreeYoneda.lean:68, :195`, `SheafCohomology/Over.lean:141`, `CommAlgCat/Fppf.lean:61, :99`, `Sites/Big/StructureSheaf.lean:103, :126, :202`, and the §0.20 and §2.3 lines.
- Cross-roadmap citations resolved:
  - ModularCurves (main): 0C is Layer 0.3, item 3; 0E is Layer 0.5.
  - PurityForFlatCohomology (open): its scope and §0.2.
  - SchemeAndStackFoundationsPartII (open): its lines 27, 363, 369, 424 and 475.
  - StackPointsAndResidualGerbes (main): the gaps it declares on this roadmap.
  - The other open revision of this folder merges cleanly in the stated order.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 200 roadmaps, 2263 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` exits 0 with 48 warnings, all `sorry`. The file is unchanged by this pull request. The elaborated signatures of the eleven sampled declarations match their README statements, and none has lost a binder.
- Pull-request text: the title and description were read against the head; two sentences are stale (C05).
- Ownership against open pull requests whose files were not given (FunctorOfPoints) was not checked.

Overlap check: read PurityForFlatCohomology, SchemeAndStackFoundationsPartII, VirtualFundamentalClassPartII, QuasicoherentSheavesOnPrestacks and StableReductionPartII (open), and StackPointsAndResidualGerbes, AlgebraicModuliForArithmeticGeometry, JacobianChallenge and ModularCurves (main); FunctorOfPoints (open) has no files given and was not read. Two objects are shared:

- fppf cohomology with supports, owned here (§2.9a) and by PurityForFlatCohomology §0.2 (D01); this roadmap, being on main, is the right owner;
- effective descent of affine morphisms along a flat surjective quasi-compact map (Stacks 0245), owned by ModularCurves Layer 0.5 on main and re-planned in §1.1a (R01); ModularCurves is the owner.

Nothing else is shared.

Source independence: 9 passages compared with 5 sources: the Stacks Project (the proofs of 0AP4, 03XX, 03XW and 0EBJ, and §110.19), Milne AG Lemma 2.43, Milne AG11 §11.d, Česnavičius–Scholze 5.2.6 and Česnavičius 2018 Remark 2.7. Nothing is shared beyond forced statements and standard terms; the longest shared run is "maximal chain of primes", four words, at 02JE. The largest share of locators is stacks-project, about 860 of about 1,100. Contents compared with stacks-project: independent. The new subsections each combine several chapters: Morphisms, Descent and More on Morphisms for §§0.2a and 1.1a, and Spaces, Properties of Spaces, Morphisms of Spaces and More on Groupoids for §1.9a; §2.9a follows no source's arrangement.

Research link: §2.9a is the carrier of fppf cohomology with supports in Česnavičius–Scholze's purity for flat cohomology (2019), which PurityForFlatCohomology and SchemeAndStackFoundationsPartII import; §§0.2a, 1.1a and 1.9a feed Artin's bootstrap (Stacks 04S6) behind §1.17 and Keel–Mori. This rests on the README and on cesnavicius-scholze §5.2.

## Not verifiable

- Grothendieck, *Le groupe de Brauer III*, Théorème 11.7 (§2.10): not in the sources cache, so its hypotheses were not read.
- Fulton 1998 (§5.12: Example 8.4.6, Theorem 12.3, Example 12.3.1), de Jong 1996 and Hartshorne 1977: cited by locator only; their texts were not read.
- Equation (30.23.3.1), tag 0880 (§4.8): the Stacks book does not print equation tags, so only the equation number was checked.

## Source issues

- none

## For the human reviewers

- none
