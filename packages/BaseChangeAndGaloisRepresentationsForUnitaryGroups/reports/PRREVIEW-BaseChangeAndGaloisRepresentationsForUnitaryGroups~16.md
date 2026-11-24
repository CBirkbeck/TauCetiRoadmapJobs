# Review of BaseChangeAndGaloisRepresentationsForUnitaryGroups (pull request #3027 at cd123f8)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 487 changed lines since `74a09b7`. The folder's two files are the same as at the head the previous review read (`c832fa9`); since then only the family index and the supplier section EndoscopicTransferAndUnitaryTraceComparison §10.26a changed, and both still agree with what this roadmap says of them. The changed statements, labels, Checks and citations were recomputed and six sources read at their locators; there is no finding. Six small corrections and one format note remain, none blocking (five corrections and the note are carried from the previous review, whose passages are unchanged). Two points are left for the human reviewers: the forms particular to [FormalProof], and that this source could not be read.

## C01 — The statement of 10.29a follows from its own remark, but the section has no Corollary-of line

A reader of 10.29a sees an existence statement proved by a construction by cases, and is not told that the remark beside it already gives it. Take `r_n = rec_n` (the remark, line 230). It has properties 1–5, the twist rule and the duals (EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30), it is injective, it is tame at depth zero (10.35 (d)), and over `ℚ_p` it has the inertial formula (10.34 (iii) with `q = p`): every clause of the statement at line 216. The convention at line 40 says that what a Corollary-of line covers "is deduced from" the general theorem. Would a line *Corollary of:* the remark (EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30, with 10.34 (iii) and 10.35 (d)), for `r_n = rec_n`, be added?

## C02 — The Method label of 10.35 says that (c) and "depth zero ⇒ tame" hold by construction, which the label itself makes true only over `ℚ_p`

Lines 663–667 say that on a depth-zero supercuspidal representation over a field not isomorphic to `ℚ_p` the value of the map is "not a twist of a tame representation", and then that clauses (a) to (c) and the direction "depth zero ⇒ tame" of (d) hold by construction. For `F` unramified quadratic over `ℚ_p` and `π_θ̃` of `GL_2(F)` the first sentence gives a non-tame value and the second a tame one. Would the sentence read "Clauses (a), (b) and, over a field isomorphic to `ℚ_p`, (c) and the direction 'depth zero ⇒ tame' of (d) hold by construction"?

## C03 — The comparison of 16.1 with AG2.7 (line 1280) describes the remark, not the statement

The sentence says the comparison at `ℓ`, de Rham with the labelled weights, "holds for every block". That is true of each block by AG2.6, but the statement of 16.1 asserts above `ℓ` only crystallinity, and only where `Π` is unramified; de Rham at every `w ∣ ℓ` is in the remark (line 1313). Insert "(in the remark; in the statement, crystalline where `Π` is unramified above `ℓ`)".

## C04 — One sentence of the description does not hold for this roadmap

The description says that "the section now states the proof's form and the general roadmap the general theorem". For 16.1 no general roadmap states the general form: it is this roadmap's own remark (line 1313). For 10.29a the remark (line 230) restates beside the statement what EndoscopicTransferAndUnitaryTraceComparison proves. Suggested text: "… and the general roadmap the general theorem or, where none states it, a remark in the same section does (BaseChangeAndGaloisRepresentationsForUnitaryGroups 16.1)."

## C05 — The convention says the proof needs "only that case, not the general theorem in full", but for 13.0a the case is the whole general theorem

The contrast in the paragraph on corollaries (lines 41–42) holds for six of the seven sections that carry the line: 10.0a allows any subgroup `H` where InductionRestriction §6.2 has `H` elementary, 10.27 is the rank-one case of §10.26a, and 14.0a, 14.2, 15.1, 15.2 are cases of the theorems named. 13.0a (line 732) is word for word AnabelianGeometryAndNonabelianChabauty §2.0a: any field of characteristic zero, any linearly ordered alphabet, and its Method label gives no narrower form. Would the clause read "needs no more of the general theorem than that case (for 13.0a, all of it)"? The family index has the same sentence.

## C06 — The description does not say that this roadmap gains two suppliers

Against the merge base the supplier contracts gain two subsections: RepresentationTheory/CharacterTheory (§§9a.6 (d), 9a.9, for 10.33d, 10.34 and 14.2) and AnabelianGeometryAndNonabelianChabauty (§2.0a, for 13.0a). The description names the new citations of FiniteReductiveGroups only. A sentence such as "BaseChangeAndGaloisRepresentationsForUnitaryGroups now cites RepresentationTheory/CharacterTheory §§9a.6, 9a.9 and AnabelianGeometryAndNonabelianChabauty §2.0a" would cover it.

## N01 — The citation of [FormalProof] in 10.27 (line 178) is the only one without a file path

## Questions for the author

- The Origin label of 13.8a (line 742) credits the comparison of simple trace formulas for inner forms of unitary groups to "Kottwitz, Clozel, Harris and Taylor, Labesse", with no works and no locators. Which works and statements are meant? The References list these authors only for other purposes, so there was nothing to open.

## Previous findings

- none: the previous report (of `c832fa9`) raised no finding. Its small corrections C01–C05 and its format note N01 are not repaired (the folder's files are unchanged since that head) and are carried above with their numbers and line numbers. Its question on 13.8a is carried too.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 10.0a Brauer in degree zero | `G = 1`; `G = S_3`, `ρ = ε` | `0 = 0`; `ε − 1 = (0,−2,0) = Ind_{C_2}ε − Ind_{C_2}1 = (3,−1,0) − (3,1,0)` | holds; Del73 Prop. 1.5 has `H` elementary, as the label says | none |
| 10.27 and its Checks | `ℚ_3`, `n(ψ) = 0`, `a(χ) = 1, 2`; `V = ξ|·|^s`, `|·|^s` | `a = 2`: `v(c) = 2`, coset of `1 + 𝔭`; `a = 1`: any `v(c) ≤ 1`; ratio of constants `ξ_w(c_χ)` | agrees with §10.26a at head (`v(c_χ) = a(χ) + n(ψ)`) | none |
| 10.29a statement and remark | `n = 1`; `r_n = rec_n`; `GL_2(ℚ_p)`, `π_θ̃` | `χ∘Art_geo⁻¹`; inertia `θ∘t₂ ⊕ θ^p∘t₂` | remark implies statement | C01 |
| 10.30 | `n = 1` | `LLC_WD(χ) = χ∘Art_geo⁻¹`; `(rec⁻¹χ)^∨` in arithmetic normalisation gives the same | consistent; Scholze Thm 1.2 (d) | none |
| 10.33a | `n = 1, 2`; `ξ = χ∘N` | `det Ind 1(ϖ) = (−1)^{n−1}`; `n = 2`: central character `ξ|_{F^×}·η_2`; conjugates coincide, excluded | holds | none |
| 10.33b | `n = 1`; `n = 2`, `ū` elliptic; `ū` scalar | `c(ϖ^a u)`; `−(θ(z̄) + θ(z̄^q))`; a scalar unit fixes every vertex | formula applies only at elliptic reduction, as stated | none |
| 10.33c | `n = 1`; `d = 1`; `f = 1` | `f(γ̄)` against `f(N δ̄)`, norm onto on units; `φ′_f = φ_f`; unit elements | holds | none |
| 10.33d | `n = l = 2`; `n = 2, l = 3` | label `{θ},{θ^q}` over `k_2`; `(θ∘N)^{q³} = θ^q∘N ≠ θ∘N`: regular over `k_3` | agrees with 10.33a (b) | none |
| 10.34 (i)–(iv) and Checks | `n = 1, 2`; `(q,n) = (4,5)`, `θ` of order 11 | `det Ind(Δ_nθ̃)(ϖ) = (−1)^{n−1}(−1)^{n−1}θ̃(ϖ)`; `G_1(1) = −1`; `⟨4⟩ = {1,4,5,9,3} ∌ 2` mod 11; `G_5(θ⁻¹β∘N) = G_5(θ⁻²β∘N)` for all 9 pairs `(β, ψ₀)`; `32e^{2πi/3}` twice | holds; character Check: `(−1)^{(n−1)(a+1)}` recomputed | none |
| 10.35 and Method label | Steinberg of `GL_2`; trivial of `GL_2`; `F` quadratic unramified over `ℚ_p` | `N ≠ 0`, depth zero, no spherical vector; `N = 0`, spherical; label: value not tame | statement holds; label holds over `ℚ_p` only | C02 |
| 13.0a | alphabet `{a}`; `{a<b}` degree 2; characteristic 2 | `a⧢ⁿ = n!·aⁿ`; `a⧢a, a⧢b, b⧢b, ab` span 4 words; `a⧢a = 0` | characteristic zero needed and stated; equals §2.0a | C05 |
| 13.8a and Check | `r = 1`; `GL_3(𝔽_2)`, `N_1 ≅ V_4` | fixed dims `(d + 3χ(inv))/4 = 1,0,0,3,1,2`; `1+18+7+16 = 42`; `1+9+1+4 = 15` | Check true; cuspidal degree `(q−1)(q²−1) = 3` | none |
| 14.0a | `n = 1`; `π = π₀⊗|det|^t` | `χ(g⁻¹) = χ⁻¹(g)`; `φ₀(ᵗg⁻¹)|det g|^{−t}` spans `π^∨` | holds; Cog04 unitary case | none |
| 14.2 and Checks | `q = 2`, `θ` of order 7; of order 3, `n = 2` | `⟨2⟩ = {1,2,4} ∌ −1` mod 7; both routes give `θ∘t₂ ⊕ θ²∘t₂` | holds | none |
| 15.1 | `N₀ = 1`; `n = 2`, `θ` of order 3, `q = 2, 5` | `|k_2^×| = 3, 24`; `θ⁵ = θ² ≠ θ`; `N₀ = 2`, irreducible, step (8) | holds | none |
| 15.2 | `n = 2`, `w = 0`, `a_τ = (2,0)`; general | `{3,0} → {1−3, 1−0} = {−2,1} = HT_{τc}` for `a_{τc} = (0,−2)`; `w − a_{τ,j} + n − i = w + n − 1 − h` | holds; BLGGT's `w` is `w + n − 1` here | none |
| 16.1, remark and Checks | `n = 2`, `Π` trivial; `n = 1`, `Π_v = τ^m` | `s = 0, −1`; eigenvalues `{1, q}` by both formulas; weights `{0,1}`; `a_τ = −m`, `HT_τ = {−m}`; `a_{τc,i} = −a_{τ,n+1−i}` | holds; line 1280 describes the remark | C03 |

- **Source locators checked against the text: 6.** Del73 Proposition 1.5, p. 510 (Del73 lines 225–242, elementary `H`); Hof99 Theorem 2.2 (Hof99 line 119; subfield of `ℂ`, locally finite graded alphabet at lines 23–29); Cog04 Lecture 5, remark after Proposition 5.1 (Cog04 lines 1810–1811, p. 38) and Proposition 5.3 (iii) (lines 1944–1946); Scholze, arXiv:1010.1540, Theorem 1.2 (a)–(d), for 10.30 and the remark of 10.29a; BLGGT, arXiv:1010.2561, Theorem 2.1.1 (3), for 15.2 and the Conventions; Guerberoff, arXiv:0906.4189v3, Theorems 2.2 and 2.3 with its proof (sum over Speh blocks, `F/F⁺` unramified at finite places, `ℓ` odd), for 16.1.
- **Library declarations opened at the pin: 6.** `groupCohomology.exists_div_of_norm_eq_one` (Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:134), `MonoidHom.isOpenMap_of_sigmaCompact` (Mathlib/Topology/Algebra/Group/OpenMapping.lean:114), `FDRep.exists_character_eq_indClassFun_of_isNilpotent` (TauCeti/RepresentationTheory/Induction/Monomial.lean:81), `TauCeti.IsElementary.isNilpotent` (TauCeti/GroupTheory/Elementary.lean:441), `inertiaSubgroup` (TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean:112), `weilArtinMap` (TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/ArtinMap.lean:125).
- **Cross-roadmap citations resolved at this head:** InductionRestriction §6.2 (line 950), AnabelianGeometryAndNonabelianChabauty §2.0a (4484), AutomorphicLFunctionsAndLocalFactors AL.3.7.1a (1638), EndoscopicTransferAndUnitaryTraceComparison §10.26a (4035, read in full: `c_χ` on `v(x) ≥ ⌈a(χ)/2⌉`, valuation `a(χ) + n(ψ)`, unique modulo `1 + 𝔭^{⌊a(χ)/2⌋}`), RepresentationTheory/CharacterTheory §§9a.6, 9a.9 (1465, 1650), FiniteReductiveGroups §5.10 (2244, the definition of `G_n`). The citation resolver reports no cross-roadmap citation found nowhere.
- **Record:** headings at the merge base and at the head differ only by the two added supplier subsections; no layer or section is removed, renumbered or retitled. Against `main`, nothing changed outside the folders the pull request owns.
- **Since `c832fa9`:** the folder is unchanged; the family index changed in its table row on Galois representations and in "What the proof does not need" (consistent with 10.34, 14.2 and 15.1); §10.26a changed by 9 lines and still states what 10.27 and 10.34 quote.
- **Dependency check:** `depcheck: 132 roadmaps, 1481 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with no message. The file has a module docstring and an empty namespace: no declaration, so no one-tactic probe and no signature comparison applies. Its docstring names each of the four headlines and the carriers each lacks; none is statable at the pins (no smooth representations of `GL_n(F)`, Weil–Deligne representations, automorphic representations or attached Galois representations).
- **Automatic checks:** all passed at this head.
- **Overlap check:** read LocalFactorsOfTwistsAndTypes, FiniteReductiveGroups, CongruenceModulesOfThetaLifts, ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, UniformWildKernelBounds, EndoscopicTransferAndUnitaryTraceComparison (scope and the cited sections); shared objects have one owner each: the trace-defined correspondence and §10.26a, EndoscopicTransferAndUnitaryTraceComparison; uniqueness and the converse theorem, LocalFactorsOfTwistsAndTypes §§6.4–6.5; Gauss sums, labels and `π_θ̃`, FiniteReductiveGroups; Brauer in degree zero, InductionRestriction §6.2; Radford's theorem, AnabelianGeometryAndNonabelianChabauty §2.0a; the contragredient, AL.3.7.1a. 10.0a, 13.0a and 14.0a are this roadmap's items on `main`, kept with Corollary-of lines. No other open pull request changes this roadmap and none drops an id it cites.

Source independence: changed passages only; 8 passages (the statements and routes of 10.0a, 13.0a, 14.0a, 10.30, 15.2, 16.1, the Origin label of 16.1 and the convention on corollaries) compared with 6 sources (Del73, Hof99, Cog04, Scholze 2013, BLGGT 2014, Guerberoff 2011), none shared; largest share [FormalProof], 32 file-path locators, not read; contents not compared: the change adds, removes and reorders no layer.

Research link: Layers 10 and 14–16 state the explicit depth-zero local Langlands correspondence (Henniart 1992; Bushnell–Henniart 2005; Scholze 2013) and properties of the Galois representations of polarized cuspidal representations and of definite unitary groups (Shin 2011; Caraiani 2012; BLGGT 2014; Guerberoff 2011). Rests on the README's Summary and References and on Scholze Thm 1.2, BLGGT Thm 2.1.1, Guerberoff Thm 2.3.

## Not verifiable

- [FormalProof]: the sources service found no legal copy at the repository address the References give. Its 32 file paths, its declaration names and every *Method of the formal proof* label were not checked, nor the convention's claim on what the proof needs.
- DeBacker–Reeder 2009 (10.33b), Henniart 1992 and Bushnell–Henniart 2005 (10.34, 10.35), Deligne–Henniart 1981 (read only through §10.26a), Kottwitz 1986 (10.33c), Caraiani 2012 (14.1, 14.2), Kudla 1994, Harris–Kudla–Sweet 1996 and Radford 1979 (uncertified): no text read; the statements were checked by computation and against the supplier sections only.
- The comparison of 13.8a with published simple trace formulas: the Origin label gives no work to open (the question above).

## Source issues

- none

## For the human reviewers

- Scope: the statements of 10.27, 10.29a and 16.1 (README lines 172, 216, 1255) are forms particular to [FormalProof], a Lean formalization announced on 20 November 2026 (References, last two entries); published or general forms stand beside them as remarks (lines 230, 1313) or in EndoscopicTransferAndUnitaryTraceComparison §10.26a.
- Not tested: [FormalProof], the source with the largest share of locators (32), could not be read; the wording and arrangement checks were not run against it.
