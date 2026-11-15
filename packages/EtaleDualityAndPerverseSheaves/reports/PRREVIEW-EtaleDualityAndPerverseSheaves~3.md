# Review of EtaleDualityAndPerverseSheaves (pull request #1040 at 763a08d)

**Verdict:** needs changes

Full review. Three P2 findings (two ownership overlaps with roadmaps earlier in the merge order, one translated passage) and six P3. The gate passes and no statement was found false.

## R01 (P2) — the curve Euler–Poincaré formula has a second, earlier owner that is not cited

**Location:** `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md` lines 4920–4926: "For a smooth connected curve `U` with smooth proper completion `C` … prove curveEulerPoincareSwan … Include the finite coefficient-field form used in BBD 4.5.1".

**Claim:** §5.2 proves `χ_c(U,L)=rank(L)χ_c(U,ℚ̄_ℓ)−Σ Swan_x(L)` on every smooth connected curve, with a finite-field form.

**Witness:** FourierDeligneTransform (#2132, merge order line 71, before this roadmap at 109) `README.md:320` proves the same formula on smooth affine curves for finite local rings, `E` and `ℚ̄_ℓ`; its line 12 says these roadmaps "can import from here". This README never names it.

**Repair:** cite FourierDeligneTransform §2.7 for affine `U` in characteristic `p` (rational and finite-field coefficients); keep here only the proper-curve and characteristic-zero cases, deduced from it, and say so in one clause in Scope and in the `*Needs:*` line of line 4941. Add in Scope that FourierDeligneTransform §5.2 is the curve case of §2.10. Add the supplier to the pull request description.

## R02 (P2) — `bettiGrowthInEtaleTowers` has no consumer: its only use is a proof this README assigns to a supplier

**Location:** `README.md` lines 4953–4979, "**Sublinear negative cohomology in étale towers.** … This yields the sublinear conclusion used in 5.2.3–5.2.8", and lines 4934–4936 (conductor bounds "for the Leray sheaves in bettiGrowthInEtaleTowers").

**Claim:** the growth estimate of BBD 4.5.1–4.5.5 is a target of §5.2.

**Witness:** line 5044: the affine weight criterion is "exported by AutomorphicLFunctionsAndLocalFactors AL.3.10.10 …, which proves it (BBD 5.2.1, including the cohomology-growth … steps of 5.2.3–5.2.8)" and is not reproved here. No other line of this README, and no other roadmap, cites the target; AL.3.10.10 (`README.md:2011` at #924) cannot consume it upward.

**Repair:** delete the target, its Checks and the Leray conductor-bound paragraph (lines 4934–4936) and the clause "Include the finite coefficient-field form used in BBD 4.5.1"; in Scope write "the étale-tower growth estimate (BBD 4.5) belongs to the proof of the affine weight criterion, AutomorphicLFunctionsAndLocalFactors AL.3.10.10". If it is kept, name the target of this roadmap that uses it.

## R03 (P2) — the statement of the general flat trace translates its source clause by clause

**Location:** `README.md` lines 556–561: "Consider triples `(f, d, F)`: `f : X → Y` compactifiable, `d` an integer, `F` a torsion sheaf on `Y` prime to the residue characteristics, where `f` satisfies `(∗)_d`: there is an open `U ⊂ X` on which …".

**Claim:** statements are in the roadmap's own words.

**Witness:** SGA4-XVIII line 2336–2345 (Théorème 2.9): the same nine clauses in the same order, from the opening "triples" through the open `U`, the two fibre bounds, the uniqueness clause and (Var 1), (Var 2); a translation, about 75 words.

**Repair:** replace the first two sentences by: "Fix `d ≥ 0`. A compactifiable `f : X → Y` satisfies `(∗)_d` when some open subscheme of `X` is flat and finitely presented over `Y` with fibres of dimension `≤ d` and its complement has fibres of dimension `< d`. For such `f` and every torsion sheaf `F` on `Y` with torsion prime to the residue characteristics, construct `Tr_f : R^{2d}f_!f^*F(d) → F`. These maps are characterised by: naturality in `F`; base change to quasi-compact quasi-separated `Y′`; transitivity for a `(∗)_e` map followed by a `(∗)_d` map; and two normalisations, multiplication by `r` for finite locally free of rank `r` (`d = 0`) and the Kummer isomorphism (2.8.1) for the affine line."

## R04 (P3) — Scope defers to unnamed "separate extensions", while a roadmap on main names this one as owner

**Location:** `README.md` line 13: "General Gabber absolute purity, semistable-trait fundamental classes, … equivariant and hyperbolic localization require separate extensions."

**Claim:** each deferral is left to a named roadmap, by section.

**Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4090` on main: "Étale supports, the étale `f^!`, absolute purity and purity for the Brauer group are EtaleDualityAndPerverseSheaves". This README excludes the first and never mentions the second (`grep -ci brauer` = 0).

**Repair:** name the owners in Scope: general noetherian bases and monotone perversities are EtaleDualityAndPerverseSheavesPartII; absolute purity is LefschetzPencilsAndVanishingCycles §0.10; purity for the Brauer group is PurityForFlatCohomology Layer 8; the étale `f^!` is EtaleCohomologyFoundations §F.5. Name a roadmap for each remaining item or drop the item.

## R05 (P3) — residue of the label repair: slugs, bare identifiers and broken code spans

**Location:** `README.md`, for example line 495 "JacobianChallenge layer a line bundles divisors picard group degree"; line 523 "§§0.3–0.7:pairings"; line 1114 "`c₁(L)=`firstChernClass `L`"; line 2972 "`R=Z/ell²` … `M=R/`ell belongs to Dbc".

**Claim:** every term is standard or defined, and formulas are in code spans.

**Witness:** further instances: slugs at lines 202, 227, 312, 458, 544, 749, 754, 785, 1237, 1315, 1319, 2756, 3491, 3527, 7486, 7528, 7534, 7535, 7645, 7658, 7685, 7690; broken spans at 2202, 2219, 2834, 3272, 3274, 3419, 4406, 4618, 4992, 5871; "(b)", "(c)" with no referent at 7120–7126; §8.1 parts start at "(b)" (line 7574).

**Repair:** replace each slug by the section it means (line 523: "§§0.3–0.7"; line 495: "JacobianChallenge Layer `A`"; line 7658: "WeilConjectures §WC.6"); line 1114: "For `L` invertible, `c₁(L)` is the Kummer class"; line 2972: "`R = ℤ/ℓ²`, `M = R/ℓ` belongs to `D^b_c`"; write `Ē` for "Ebar", `D^b_c` for "Dbc", "e.g." and "i.e." as plain text; relabel the parts.

## R06 (P3) — twenty-five Checks are stated twice

**Location:** `README.md` lines 433/443, 501/509, 507/513, 621/627, 1079/1087, 1146/1154, 1448/1462, 1532/1538, 1774/1784, 1889/1902, 1967/1977, 2437/2449, 2439/2447, 6469/6485, 6550/6558, 6635/6641 and nine more pairs.

**Claim:** one bullet per test.

**Witness:** line 433 "For `f : A¹ → A¹, x ↦ x²` … the stalk of `Tr_f` at 0 is multiplication by 2" and line 443 "`x ↦ x²` on `A¹` … `Tr` is multiplication by 2".

**Repair:** delete the second bullet of each pair (lines 441, 443, 509, 511, 513, 627, 1087, 1089, 1154, 1462, 1536, 1538, 1784, 1902, 1904, 1977, 2447, 2449, 2633, 2635, 2783, 6285, 6485, 6558, 6641).

## R07 (P3) — six targets have no `*Needs:*` line and one names less than it uses

**Location:** `README.md` lines 2980, 3002, 3024 (§3.1), 3771 (§4.1), 4576 (§4.6), 5800 (§5.7); line 2961 "*Needs:* EnhancedDerivedSheaves Layer 4."

**Claim:** every target lists what its statement and route need.

**Witness:** the target at line 2898 imports "EtaleCohomologyFoundations §F.4.1" (line 2908) and the one at 3046 uses §§0.7–0.8, F.2, F.3, F.4.2–F.4.5 and F.5 (lines 3076–3083); both `*Needs:*` lines name only EnhancedDerivedSheaves.

**Repair:** line 2961: "*Needs:* EnhancedDerivedSheaves §§0.3–0.4, E4.5; EtaleCohomologyFoundations §F.4.1." Line 3090: add EtaleCohomologyFoundations §§0.7–0.8, F.2–F.5. Lines 2980–3045: "*Needs:* §3.1 (the definition above); EnhancedDerivedSheaves §E4.5." Line 3771: EtaleCohomologyFoundations §§F.0.4, F.3, F.4.1–F.4.2, F.4.5 (the sections its proof names at lines 3804–3815). Line 4576: EtaleCohomologyFoundations §§0.9, F.3, F.4.4–F.4.5, F.5–F.6 (lines 4612–4621). Line 5800: §5.7 (the definition); `CategoryTheory.Abelian`.

## R08 (P3) — one page range is off by one; two books are cited with no reference entry and no page

**Location:** `README.md` line 5558 "[BBD-1982] Théorème 5.4.1, Corollaires 5.4.2 and 5.4.4, pp. 140–142"; lines 1178–1180 "Serre, *Algèbre locale. Multiplicités*, Chapter V §3 …; Fulton, *Intersection Theory*, §8.2 … and §20.4".

**Claim:** every claim has an exact locator into a listed source.

**Witness:** BBD-1982 line 5304: Théorème 5.4.1 begins on printed p.141 (PDF page 142); p.140 holds 5.3.10–5.3.11. The References section has no entry for Serre or for Fulton.

**Repair:** write "pp. 141–142"; add **[Serre-AlgLoc]** and **[Fulton-1998]** to References and give page numbers at line 1178.

## R09 (P3) — one paper carries two reference keys

**Location:** `README.md` lines 7815–7817: "**[Varshavsky-LocalTerms-2020]** … arXiv:2003.06815v3" and "**[Varshavsky-LocalTerms-2023]** … Compositio Mathematica 159 (2023)".

**Claim:** a preprint and its published version are one entry with both locators.

**Witness:** both keys are the article "Local terms for transversal intersections"; §7.5 (lines 7543–7545) cites the two keys side by side for the same Theorem 4.10.

**Repair:** keep one key, "**[Varshavsky-LocalTerms-2023]** … Compositio Math. 159 (2023), 985–1004; arXiv:2003.06815v3 (same numbering of statements)", and rewrite the five citations of the other key (lines 6460, 7233, 7281, 7339, 7543).

## Previous findings

- R01 (labelled API bullets and Checks) — repaired: `grep -c 'TauCeti.EtaleDuality'` is 0; line 6995 now reads "- The identity correspondence of `𝔸¹` is not contracting near `{0}`: `I²` does not contain `I`." What the stripping left behind is R05 and R06.
- R02 (two sentences of the description) — repaired: the description now reads "followed by author-side red-team passes" and "Sections 5.2–5.3 consume the affine weight criterion … from AutomorphicLFunctionsAndLocalFactors AL.3.10.10"; "Check labels … are all zero" is true at this head.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.1 `uniformizerQuotient_selfInjective`, `finiteModule_eval_bijective` | `ℤ/4`, `M=ℤ/2`; `R=ℤ`; zero ring | `M*=ℤ/2` via `1↦2`, eval bijective; over `ℤ`, `M*=0`; `m=0` gives the zero ring | hold; self-injectivity and finiteness both needed |
| §0.4 flat trace (sample) | `ℙ¹⊔ℙ¹`; double plane, `Λ=ℤ/2`; `n=1` | `Λ²→Λ` sum, surjective not injective; `Tr=2=0`; zero sheaf, so README's `n≥2` is needed | agrees with SGA4-XVIII lines 2336, 2530, 2561, 2586 |
| §0.6 integral duality (sample) | index shift; Enriques `ℓ=2`; `ℤ/4` Kummer, monodromy `−1` | `n=i−2d` gives `Ext¹(H^{2d−i+1}_c)`, `Hom(H^{2d−i}_c)`; `i=3`: `Ext¹(ℤ/2)=ℤ/2=H³`; coinvariants `ℤ/4/(2)=ℤ/2` | holds |
| §2.1 `heart_abelian` | degrees `{−1,0}` subcategory; pin | `Hom(ℤ/2,(ℤ/2)[1][−1])≠0` breaks (i); Mathlib has the criterion only | genuine target |
| §2.2 recollement (sample) | `[1]`; `RΓ(ℙ¹,Λ(1))`; glued nondegeneracy; f.d. ⊂ all vector spaces | right not left `t`-exact; `H²=Λ≠0`; iff checked with `i_*A`, `j_!B`, `j_*B`; `Hom(F,RV)=V` infinite | holds; BBD 1.3.17, 1.4.3–1.4.19 |
| §2.10 intersection complexes (sample) | nodal cubic over `𝔽₇`, `Λ=𝔽₅`; `𝔸²`, `L=ℚ_ℓ(±1)`; `Rj_*Λ[1]` | `t²=x−1`, branches `t²=−1`, non-square mod 7, Frobenius `−1`; `D IC=ℚ_ℓ(1)[2]`, resp. `ℚ_ℓ(3)[2]`; length 2 | holds |
| §2.11 nonconstructible conditions (sample) | `𝔸²∖0`, `j_!Λ[2]`; `⊕` skyscrapers on a curve | costalk `Λ[1]⊕Λ(−2)[−2]`, degree `−1<0`; stalk and costalk in degree 0, zero at the generic point | holds; BBD line 2182 |
| §3.1 normalized systems (sample) | `(O/λ)⊗^L_{O/λ²}(O/λ)`; object `O/λ` | `Tor_i=O/λ` for all `i≥0`; level `[R_n→R_n]` in degrees `−1,0`; amplitude `[a−1,b]` | holds; Bhatt–Scholze 6.5.1, 6.6.11 |
| §3.4 coefficient extension (sample) | `O/λ⊗_O O′`; `ℙ¹` | `O′/λO′` of length `e`; trace of `c₁` stays 1 | holds |
| §3.9 diamond mates (sample) | `f=id`; zero category in vector spaces; `𝔸^d` | identities; counit `0→V` not iso; `Λ(d)[2d]` | holds; hypotheses equal ECD-2026 27.4 (line 6851) |
| §5.4 `exists_unique_torsion_subobject` | `P` constantly true; quiver `1→2`; direction | `W=⊥`; `P₁` nonsplit, no `W`; `U∈S⁺` sub, `V∈S⁻` quotient as in BBD 5.3.6 | holds |
| §5.6 decomposition (sample) | `𝔸¹`, `ℚ̄_ℓ[1]`; `δ₀(−1)` and `ℚ̄_ℓ[1]`; blow-up of `𝔸²` | `Rf_!=ℚ̄_ℓ(−1)[−1]`, weight `2=1+1`; `Hom¹=ℚ̄_ℓ` trivial `F`, `Ext²_{X₀}=ℚ̄_ℓ`; `ℚ̄_ℓ[2]⊕δ₀(−1)`, `0+2·1=2` | holds |
| §5.7 Lefschetz objects (sample) | `ℙⁿ` object; `η=0`; idempotent | `P^{−r}=L^{−n}` iff `r=n`; fails; `p²=η(η^{r+2})⁻¹η^{r+2}(η^{r+2})⁻¹η^{r+1}=p` | holds |
| §5.10 over `ℂ` (sample) | blow-up of `ℂ²` | `ℂ[2]⊕ℂ₀` | holds; BBD 6.2.5 p.163, 6.2.10 p.165 |
| §6.5 `fujiwaraVarshavskyTraceFormula` (sample) | `I=0`, `I=O`; `k[ε]/ε²`; twist | `n=1`; `n=2`; `I_red^{qⁿ}⊂I_red^{d+1}⊂I`, `(I_red^{d+1})^d=(I_red^d)^{d+1}`; `d` quantified before `F,n,u` | holds; Varshavsky 2.2.3, 2.3.2 |
| §7.4 semisimple fixed subschemes (sample) | `x³+yz`, `g=(x,−y,−z)`; `g=(x,ty,t⁻¹z)`; translation on `ℙ¹` | `I=(y,z)`, `Fix=k[x]/x³`, `gr_m=k[x,y,z]/(yz)` has a fixed line; bad set `{t,t⁻¹}`; fixed ideal `(w²)`, term 2 against stalk 1 | holds; source lemma fails here, README does not use it |
| §8.1 `form_similitude_det_alt`, `_symm` (sample) | rank 1, `φ=a`, `s=±a`; rank 2 alternating; characteristic 2 | `s=a`: `m_−=0`, `det=s`; `s=−a`: `m_−=1`, `det=−s`; `det=c`; multiplicities still even | hold |
| §8.2 `poincareReciprocityExport` (sample) | `ℙ¹`; genus `g`; quadric with swapped rulings; `d=0` | `1−qt=(−qt)(1−1/(qt))`; `Δ=q^{1−g}`, `Δ²=q^{2−2g}`; `det F₂=−q²`; `Δ²=1`; `χ≡b_d` mod 2 | holds; Lean also admits `H^i≠0` outside `[0,2d]` and ignores it |
| §5.2 `curveEulerPoincareSwan` (R01) | Artin–Schreier `x^d` on `𝔸¹` | Swan `d`, `χ_c=1−d` here and in FourierDeligneTransform §2.7 | true; owned twice on affine curves |
| §5.2 `bettiGrowthInEtaleTowers` (R02) | consumers | 0 in this README, 0 in other roadmaps | unconsumed |
| §1.2, §4.4 Chern convention | `V=O⊕L`; rank one | classes `ξ`, `ξ+c₁(L)`, product 0 gives `ξ²+c₁(L)ξ=0`; `ξ=−c₁(L)`; `π_*(ξ²)=−c₁(L)` | consistent in both layers |
| §4.6 `Res`, `Van` | quadric threefold, `𝔽₂`; `ℙ¹×ℙ¹`, `L=(1,1)` | `Res=Van=⟨(1,1)⟩`; `P²=⟨(1,−1)⟩` | holds; no direct sum claimed |

- Gate rerun at 763a08d: every scanner 0, `OK`; the worker's `gate.md` adds `build=0`. Dependency check: `depcheck: 245 roadmaps, 2243 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. No change outside the folder; pins in the README equal the manifest.
- `lake env lean` on `Suggested.lean`: seven `sorry` warnings only. One-tactic probe (`simp`, `infer_instance`, `rfl`, `exact?`, `aesop`) on a scratch copy closes none of the seven theorems. The three "dropped binder" leads are false: the elaborated types carry the instances; all eleven types match their README statements.
- Headline theorems: Verdier biduality and flat trace (Layer 0), Chern classes and Chow descent (1), abelian heart, recollement, simple objects (2), adic comparison (3), refined Lefschetz (4), weight filtration, decomposition, relative hard Lefschetz (5), Fujiwara–Varshavsky (6), isolated local terms (7), graded reciprocity (8). The statable ones are stated; the docstring names the others layer by layer with the missing carrier. No padding.
- Source locators checked against the text: 84, in SGA4-XVIII (5), BBD-1982 (39), Bhatt–Scholze (8), ECD-2026 (7), Varshavsky-LV-2007 (9), Varshavsky-LocalTerms arXiv v3 (4), de Cataldo–Migliorini (6), Zhu-2017 (4), Milne-AG-2017 (2); one off by a page (R08).
- Library declarations opened at the pins: `Module.Baer.zmod_self` (`Algebra/Module/ZMod/Injective.lean:50`), `IsAlt.even_finrank` (`SymplecticBasis.lean:365`), `LinearMap.trace_pi` (`Trace/Pi.lean:42`), `det_eq_of_compl₁₂_self_eq_smul` (`Determinant/Basic.lean:246`), `det_sq_mul_det_toMatrix_self` (`Isometry.lean:370`), `dualityEquivalence` (`InvolutiveDual.lean:65`); Mathlib `AbelianSubcategory.abelian` (:298), `TExact.lean:36–52`, `trace_permutation` (`Permutation.lean:68`), `exists_finite_inj_algHom_of_fg` (:292).
- Cross-roadmap citations resolved: 54 section headings in 19 roadmaps and 26 supplier names, on main or at the open heads; `roadmaps resolve` lists none missing. DeligneWeightsAndPurity §0.16 leaves self-pairing parity and signs outside itself, as §8.1 assumes.
- Overlap check: read LefschetzPencilsAndVanishingCycles, EtaleCohomologyFoundations (main and its open revision), DeligneWeightsAndPurity, FourierDeligneTransform, EtaleDualityAndPerverseSheavesPartII, SchemeAndStackFoundations. Curve Euler–Poincaré on affine curves: owner FourierDeligneTransform §2.7 (R01). Curve case of the simple-object classification: FourierDeligneTransform §5.2; the form in every dimension is §2.10 here. Absolute purity and Brauer purity: not this roadmap (R04). Smooth and affine perverse exactness (§2.7 here): FourierDeligneTransform declares a gap placing it in EtaleCohomologyFoundations §F.8, which does not state it at either head; owner here until it does. Ownership against open pull requests outside those lists was not checked.
- Source independence: 12 passages compared with 9 sources, 1 shared (R03); largest share BBD-1982, 80 of 223 bracketed citations of non-roadmap sources; contents compared with BBD-1982: independent (Layer 2 draws on its chapters 1, 2, 3 and 4 out of order; Layer 5 splits its §5.3 over three sections, inserts §5.7, and its order is forced by the `*Needs:*` lines, for example §5.6 needs §§5.2, 5.4, 5.5).

## Not verifiable

- Jantzen-2003 (cited by sampled §7.4), Huber-1996, Dimca-2004, Liu–Tian–Xiao–Zhang–Zhu-2022: paywalled, cited by locator only.
- Varshavsky-LocalTerms-2023 (Compositio): the publisher's host is not classified by the sources service; the arXiv v3 text was read and the published page numbers were not checked.
- SGA4half, Milne-LEC, Deligne-WeilII-1980, the Stacks tags, Serre and Fulton: not opened this round (none is the only support of a sampled target).
- Outside the fifteen sampled targets, the sections of Layers 3–7 were read for statements, hypotheses and Checks; the steps their proof routes take from inside source proofs were not opened in the sources.

## Source issues

- **Error** in Varshavsky-LocalTerms-2020 at Lemma 5.1 and Corollary 5.6, arXiv v3 pp.10–11: the source says the fixed locus of the normal cone equals the normal cone of the fixed loci, so the cone at an isolated fixed point of a semisimple element has no nonzero fixed point; it should be only a closed immersion: for `ℤ/2` acting by `(x,−y,−z)` on `x³+yz=0` the cone `yz=0` has a fixed line; affects a stated result.
- **Misprint** in Zhu-2017 at Appendix A.3.1, p.55 (arXiv v3): the source says the intersection complex restricts to the constant sheaf shifted by twice the dimension and Tate-twisted; it should be shifted by the dimension, as in its §2.1.1, p.20; affects nothing.

## For the human reviewers

- Licence: ECD-2026 is an author manuscript dated 14 April 2026 on the author's page, cited by manuscript pagination for §3.9 (`README.md` line 7751; source 4ce3d123 line 41).
- Licence: SGA4-XIV, SGA4-XVII and SGA4-XVIII are cited from a retyped edition on a personal page (`README.md` lines 7775–7779); the sources service does not classify the host, and it was read as an author page.
- Licence: Milne-AG-2017 is cited from the author's copy of a Cambridge University Press book (`README.md` line 7771); the host is not classified by the sources service.
- Scope: `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4090` on main names this roadmap as owner of absolute purity and Brauer-group purity, which this README excludes (R04); main's sentence cannot be changed in this pull request.
- Scope: FourierDeligneTransform (#2132) declares a gap placing smooth and affine perverse exactness in EtaleCohomologyFoundations §F.8; §2.7 of this README states the same theorems.
