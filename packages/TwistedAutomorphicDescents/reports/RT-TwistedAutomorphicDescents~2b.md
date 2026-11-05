<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1535#issuecomment-6486501291 -->
Red team round 2 pass b (claude) of 43997ea

Verdict: needs_changes

1. **F01** (P2) The regularized split-SO₂ period branches of §§2.1, 4.1 and 4.6 are vacuous, and would be false if they were not

   **Location.** `packages/TwistedAutomorphicDescents/README.md:307` (the bold target "Regularized split-torus Bessel period"), `:418` ("If G is the special orthogonal group of a hyperbolic plane, Z is instead the regularized period"), `:647` ("for G the special orthogonal group of a hyperbolic plane, the regularized period of §1.1"), `:742` ("when G is the special orthogonal group of a hyperbolic plane, P_k is the regularized period of §1.1"), `:104` (gap:bessel-restriction-growth, the split-torus expansion and regularization clause), and the Checks at `:314`, `:434`.

   **Claim.** For G a split SO₂ carrying a cuspidal π′ (§4.1) or a cuspidal π with a generic parameter (§4.6), the regularized period performs the output transport and the reciprocal-nonvanishing equivalence.

   **Witness.** (1) Vacuity: a split SO₂ over a number field has no cuspidal automorphic representation with a generic discrete global parameter. An elliptic 2-dimensional orthogonal parameter with the trivial discriminant character is η₁⊞η₂ with η₁≠η₂ quadratic and η₁η₂=1 (impossible), or an irreducible 2-dimensional cuspidal parameter of orthogonal type, whose determinant is the nontrivial quadratic character ω_τ (L(s,τ,Sym²)=L(s,Ad τ⊗ω_τ) has a pole only when τ≅τ⊗ω_τ with ω_τ≠1), not the trivial discriminant. Moreover L²(F^×\A_F^×)=L²(R_(>0),dt/t)⊗L²(A^1/F^×) has no discrete spectrum, so the A_cusp of JZ2020 line 664 is empty for this group. Every hypothesis of §4.6 (π with a generic parameter on G), of the §4.1 output transport (π′ with a generic discrete parameter) and of §4.5 therefore excludes split SO₂. (2) Falsity if the hypothesis were dropped: on a verified fixed-character carrier the module is a finite sum Σc_iχ_i of Hecke characters; for g=χ the fibre integral is Φ(t)=Σ_(χ_iχ=|·|^(iλ_i)) c_i vol·t^(iλ_i); if the module has a nonzero χ⁻¹-component then λ_i=0 occurs with c_i≠0 and the regularized period is undefined (the README's own Check at `:314`); if not, the corrections T^(iλ)/(iλ)−T^(iλ)/(iλ) give regularized period 0. So the regularized period is 0 whenever defined and undefined exactly when the projection is nonzero: it can never witness "there are vectors with P_k(R,π)≠0". (3) The split-SO₂ critical module is zero anyway: for a=2, X=SO₅, τ=η₁⊞η₂ with distinct quadratic blocks, a character χ of the split torus has standard parameter χ⊞χ⁻¹, and χ_v=η_(1,v), χ_v⁻¹=η_(2,v) at almost all v forces η₁=η₂; so the good-place statement of §5.7 leaves no unramified constituent and the §5.9 descent on this datum vanishes.

   **Repair.** In §1.1, after case (ii), replace "In the remaining case, H≅G_m a split SO₂ … there the period used is the regularized period below." by: "In the remaining case H is the special orthogonal group of a hyperbolic plane. It carries no cuspidal realization: L²(F^×\A_F^×) has no discrete spectrum, and no Hecke character has a generic discrete global parameter (η₁⊞η₂ with η₁η₂=1 forces η₁=η₂, and a cuspidal 2-dimensional orthogonal parameter has determinant ω_τ≠1). Every period used in Layers 4–7 is therefore in case (i) or (ii)." Delete the bold target "Regularized split-torus Bessel period", its two API bullets and its four Checks. In §2.1 delete "If G is the special orthogonal group of a hyperbolic plane, Z is instead … not inferred from the convergent case." and the matching clause of the proof route and the Check at `:434`; in §2.4 delete "and for a split SO₂ stabilizer with the regularized period of §1.1 together with the contributions of its subtracted exponent terms"; in §3.2 and §4.6 delete the regularized-period clauses; in §4.1 delete the parenthesis "(for G the special orthogonal group of a hyperbolic plane, the regularized period of §1.1)". Trim gap:bessel-restriction-growth in README and `design/plan.json` to: "Supply absolute convergence and continuity of Bessel periods when the form on the ambient group is cuspidal and the form on the stabilizer has moderate growth, and when the stabilizer form is cuspidal and the stabilizer has trivial F-split centre, and restriction estimates into fixed-central-character or split-center-quotient Hilbert carriers, with all archimedean cases." Add to §5.9 Checks: "For a=2, X=SO₅, τ=η₁⊞η₂ with distinct quadratic characters and the critical datum whose stabilizer is a split SO₂, a constituent χ would need χ⊞χ⁻¹=η₁⊞η₂ at almost all places, forcing η₁=η₂; the descent on this datum is zero." Tested on the refuting instance: with f=g=1 on V=H⊥⟨1⟩, W=H, no statement of the roadmap now assigns a value or a transport; the pair is outside every period domain and outside every generic-parameter hypothesis, and the zero split-SO₂ descent is recorded as a negative control.

2. **F02** (P1) §7.4 asserts a Generic Summand witness on a form of SO₂ that may be split, where no cuspidal σ with a generic parameter exists

   **Location.** `packages/TwistedAutomorphicDescents/README.md:1135` ("for `SO_(2n+1)`, p_subregular=[2n−1,1,1], j=n−1 and the smaller group is a form of SO₂"), `:1137` ("For torus smaller groups, take an actual nonzero character projection in the verified carrier and use its generic parameter"), Check at `:1147` ("For SO₃ with n=1 … its torus projection requires the verified central-character carrier"); consumer `:1149` (§7.5).

   **Claim.** For a cuspidal realization on SO_(2n+1) with relevant generic parameter and p^m(C_π)={[2n−1,1,1]}, some rational first-occurrence datum has a generic cuspidal summand σ on its SO₂ stabilizer.

   **Witness.** For V=H^n⊥⟨c⟩ the index-(n−1) data are the anisotropic w in the middle 3-space H⊥⟨c⟩, and W=w⊥ is hyperbolic exactly when q(w)≡−c modulo squares, anisotropic otherwise; both rational orbits occur. If the only nonzero index-(n−1) coefficients of C_π are at data with W hyperbolic, the stabilizer is a split SO₂: L²(F^×\A_F^×) has no discrete spectrum, so no cuspidal σ exists there, and a Hecke character has the non-elliptic parameter χ⊞χ⁻¹ (S01 witness (1)). Nothing in the statement or the route excludes this case, and the source gives no argument: JZ2020 line 3229–3231 says only that H_m is an F-form of SO₂ "and hence Conjecture 2.3 holds". For an F-anisotropic torus K¹ every character χ has a generic discrete parameter (η⊞ηω_K when χ²=1, the dihedral induction of determinant ω_K otherwise), so the claim holds exactly for anisotropic data. The split SO₃ instance of the Check at `:1147` is empty (every cuspidal representation of PGL₂ is generic) and the nonsplit SO₃ has only anisotropic planes, so that Check tests nothing.

   **Repair.** In the statement, replace "for `SO_(2n+1)`, p_subregular=[2n−1,1,1], j=n−1 and the smaller group is a form of SO₂" by "for `SO_(2n+1)`, p_subregular=[2n−1,1,1], j=n−1 and the smaller group is an F-anisotropic form of SO₂: the hypothesis includes that some rational datum of index n−1 whose stabilizer SO(W) is F-anisotropic has a nonzero coefficient, since a datum with W a hyperbolic plane carries no cuspidal σ at all". In the proof route replace "For torus smaller groups, take an actual nonzero character projection in the verified carrier and use its generic parameter." by "For an F-anisotropic torus K¹ the automorphic quotient is compact, the image is a sum of characters, and a nonzero character projection χ has the generic discrete parameter η⊞ηω_K (χ²=1) or Ind_(K/F)χ̃ of determinant ω_K. A split SO₂ has no cuspidal σ with a generic discrete parameter, so the odd-orthogonal case needs the anisotropic datum of the hypothesis." Replace the SO₃ Check by: "A split SO₂ stabilizer carries no witness: η₁⊞η₂ with η₁η₂=1 forces η₁=η₂, and a 2-dimensional cuspidal orthogonal parameter has determinant ω_τ≠1. For SO₃ the case is empty on the split form, where every cuspidal representation is generic, and on the nonsplit form every plane of the anisotropic 3-space is anisotropic." In §7.5 add, for SO_(2n+1), the same anisotropic-datum hypothesis to the statement and the Needs line. Tested on the refuting instance: a realization whose only nonzero index-(n−1) coefficients lie on hyperbolic-plane data is excluded by the hypothesis instead of being assigned a nonexistent generic summand.

3. **F03** (P3) The §7.4 and §1.1 split-torus Checks test an empty case

   **Location.** `packages/TwistedAutomorphicDescents/README.md:434` ("For G a split SO₂ and v=1, cuspidality of v is vacuous"), `:1147`.

   **Claim.** These bullets are discriminating Checks of §2.1 and §7.4.

   **Witness.** v=1 is not a vector of a cuspidal realization C_π⊂L²_cusp(G) (§2.1 requires one), and §7.4's SO₃ instance is empty on both forms (S02 witness). A Check about an input the definition excludes discriminates nothing.

   **Repair.** Delete both bullets; the split-SO₂ negative control stays in Conventions (`README.md:45`) and the new §5.9 Check of S01 records the zero split descent.

Pass b read the whole of `packages/TwistedAutomorphicDescents/README.md` (1186 lines, 49 numbered targets, four bold sub-targets) and `packages/TwistedAutomorphicDescents/Suggested.lean` (72 lines, docstring only, no declaration), the plan's `gaps`, `sources.toml`, the two round-1 reviews and the round-1 repair report. No Lean process was run: the acceptance file declares nothing, so there is no `#check @name` audit to perform and no elaborated type to compare.

## Round-1 findings at this head

Each finding of r1a (F01–F08) and r1b (F01–F04) was located in the text at 43997ea.

| Finding | Status | Witness at this head |
| --- | --- | --- |
| r1a F01 (convergence on a split torus) | repaired | `README.md:284`: "these ordinary periods are defined exactly on that domain. Absolute integrability holds in two cases … (ii) g is cuspidal on H, f has moderate growth, and the F-split part of the centre of H is trivial"; the regularized target at `README.md:307`; gap text at `README.md:104`. The repair introduced a new defect: S01 below. |
| r1a F02 (pole order versus equal rank) | repaired | `README.md:647`: "a pole whose order is the number of i for which τ_i∨ occurs in φ_(π′) … when moreover a equals the standard dimension N … exactly when τ≅φ_(π′)∨"; SO₅ Check at `README.md:663`. Recomputed: τ=μ₁, φ=μ₁⊞μ₂, order 1=r, degrees 2≠4. |
| r1a F03 (a=1 unitary) | repaired | `README.md:959`: "For a=N≥1 …; a=1 occurs only for G=U₁, W=0, j=k₀=0, where p=p^1=[1,1]"; Check at `README.md:974`. Recomputed: a=1,m=0 gives (1,1) and (1,1^1), total 2. |
| r1a F04 (locators) | repaired | `README.md:23` "ordered basis (2.1) and the Gram matrix (2.2) … line 422, line 434"; `README.md:31` "§6.1, pp.784,792; JZ2020 line 1998, line 2353". JZ2020 line 422 is (2.1), line 434 is (2.2), line 2353 opens §6.1. |
| r1a F05 (flag versus subspace parabolic) | repaired | `README.md:150`: "the parabolic stabilizing the j-dimensional isotropic subspace … Levi Res(GL_j)×Isom(V_(j))°, and the parabolic stabilizing every member of the complete isotropic flag … Levi Res(GL_1)^j×Isom(V_(j))°"; SO₇ Check at `README.md:173` (5 against 7, recomputed). JZ2020 line 814 uses P_{ℓ+1,…,r}. |
| r1a F06 (auxiliary induction) | repaired | gap:orthogonal-auxiliary-induction at `README.md:94` and in `design/plan.json` (18 gaps); consumed at `README.md:362`, `:364`. SmoothRepresentationsOfLocalGroups *generic-irreducibility* (open head, line 2609) is stated for cuspidal σ only, so the gap is minimal. |
| r1a F07 (oriented even-SO packets) | repaired | gap:oriented-even-orthogonal-packets at `README.md:140` and in plan `gaps`; §7.2 `README.md:1099`: "the fibre is the oriented local fibre obtained by localizing one coherent global orientation … no quotient by outer conjugation is taken"; route at `README.md:1107`; Check at `README.md:1115` (4 tuples against 2). ModularityAndLanglandsExtensions §3.13 (open head, line 2137) exists and keeps outer orbits. |
| r1a F08 (bookkeeping Checks) | repaired | The 15 listed bullets are absent; every definition keeps ≥3 Checks (counts in Verified sound). |
| r1b F01 (GGP §3.7/3.9/3.11) | repaired | `README.md:11`, `:85`, `:1109` cite §§3.7, 3.9 and 3.11; at the #1404 head §3.7 is nonarchimedean tempered (line 730), §3.9 real (line 786), §3.11 split (line 836). |
| r1b F02 (= r1a F03) | repaired | as above. |
| r1b F03 (primary SO uniqueness sources) | repaired | `README.md:360` cites Waldspurger2012 Théorème 1 (line 44, PDF page 2 = printed 313) and SunZhu2012 Theorem B (line 66); both keys are in `sources.toml` (certified) and in References. |
| r1b F04 (Needs lines) | repaired | `README.md:937` "§4.1 (output transport)"; `:869` "§1.3 (tower calculation)"; `:1109` "§4.1 (recovery transport); §1.4 (multiplicity-free decomposition); §5.6 (outer stability)". All point to earlier sections. |

No repair introduced a wrong locator, a wrong supplier section or an upward edge (depcheck below). The r1a F01 repair introduced S01.

## Verified sound

Counts: 0 Lean declarations (the acceptance file declares nothing; its docstring was read in full, 23 headlines, all named as not statable); 49 numbered targets and 4 bold sub-targets read; 68 JZ2020 line locators and 14 secondary-source line locators opened against the cached extractions; 23 printed pages recomputed from page markers; 52 Checks recomputed with values (table below); 16 supplier roadmaps and 58 cited sections or anchors resolved at main, at the named open heads or in the board design; 8 pinned library declarations opened at the pins; 18 declared gaps matched between README and plan.

### Policy and form

- `git diff --stat origin/main...HEAD`: nine files, all under `packages/TwistedAutomorphicDescents/` (README.md, Suggested.lean, design/plan.json, metadata.toml, sources.toml, four reports).
- README: no pull-request number, no process word (the only hits of "lemma" are "geometric lemma" at lines 91, 851, 896), no `set_option`, no machine path, no computational algorithm; every target and every bold sub-target carries a locator.
- `Suggested.lean`: single `import Mathlib`, one module docstring of the required form, the namespace, no declaration, no `sorry`, no `set_option`, no `lemma`, no `#check`.
- `sources.toml`: ten keys, one work each; GRS2011 settled uncertified and cited by locator only; no local path.
- Merge order: TwistedAutomorphicDescents is line 315; every cited supplier is earlier (ReductiveGroupsPartII 24, SmoothRepresentationsOfLocalGroups 26, AutomorphicFormsOnReductiveGroups 76, GeometryOfNumbersAndQuadraticArithmetic 78, AutomorphicLFunctionsAndLocalFactors 93, AutomorphicSpectralTheory 95, EndoscopicTransferAndUnitaryTraceComparison 162, ModularityAndLanglandsExtensions 255, GanGrossPrasadUnitaryGroups 262, ClassicalGroupsPartII 272, LieHighestWeightPartII 293).

The required dependency check printed exactly:

~~~text
depcheck: 188 roadmaps, 1236 edges, 0 problem(s)
~~~

No UPWARD, CYCLE or moved line. `roadmaps resolve` on the README (main c994070, 416 open heads, index of 2026-10-29T01:50:13Z): no cross-roadmap citation and no Lean name found nowhere.

### Supplier citations resolved

| Citation in README | Resolved at | Content matches the use |
| --- | --- | --- |
| ReductiveGroups Layer 7, 7b | main `TauCetiRoadmap/ReductiveGroups/README.md:627`, `:732` | structure theory and algebraic parabolics/Levi intersections |
| ReductiveGroupsPartII RG2.4 | main `ReductiveGroupsPartII/README.md:5509` (decompositions and double cosets; `δ_P(z)^{-1}` at `:5867`) | local adjoint modulus; Hermitian Witt theory is the declared gap |
| OrthogonalSpinGroups Layers 0–2; Completed RestrictedProducts Layers 0–3; RepresentationTheory/ClassicalGroups Layer 6 | main `:306/:383/:585`; `Completed/RestrictedProducts/README.md:248/:268/:305/:361`; `ClassicalGroups/README.md:310` | ownership statements only |
| ClassicalGroupsPartII CG.0–CG.3 | #1492 `:237`, `:560`, … | rational GSp representations, as Scope says |
| GeometryOfNumbersAndQuadraticArithmetic §2.9 | open head line 775: carrier `SignedHermitianSpace K V ε` "apply to any commutative field with involution and finite-dimensional V"; its form is conjugate-first (`h(x,y)=conj(x)y`) | field carrier and adjoint only; the README's slot-swap convention is needed and stated |
| LieHighestWeightPartII N0/nilpotent-orbit, N2/classical-partitions | board `packages/LieHighestWeightPartII/design/README.md:75`, `:349` (design accepted; merge order line 293; not on main, not an open PR) | geometric orbits and classical partitions; rational and dominance supplements are the declared gaps |
| GanGrossPrasadUnitaryGroups §§1.1–1.3, 2.1–2.6, 3.7, 3.9, 3.10, 3.11, 4.1–4.4, 7.1 | #1404 lines 209, 284, 314, 354–528, 730, 786, 806, 836, 866–940, 1300 | §1.1 relevant Hermitian pairs over étale E with frames; §2.6 odd-codimension multiplicity one without temperedness; §3.7 nonarchimedean, §3.9 real tempered theorems, §3.11 split; §4.1 period with `ν(h)⁻¹`; §7.1 adjacent iff. Its consumer note (line 1405) lists this roadmap. |
| SmoothRepresentationsOfLocalGroups SR.0.1–0.4, SR.2.1–2.3, *geometric-lemma*, SR.3.1–3.3, *generic-irreducibility*, SR.4.1–4.4 | open head lines 560–802, 1836–2125, 2095, 2490–2793, 2609, 3109–3377 | *generic-irreducibility* is for cuspidal σ only (line 2610), so gap:orthogonal-auxiliary-induction is minimal; no spherical Whittaker formula, so gap:spherical-whittaker-normalization is minimal |
| AutomorphicFormsOnReductiveGroups §§2.3, 2.6, 2.7, 3.4, 3.5, 4.1–4.3 | open head lines 363, 435, 460, 552, 569, 597, 615, 633 | `archimedeanUnitaryDual`, `genericUnitaryClassification` (line 443–445), `dixmierMalliavin` (line 468), fixed-central-character `DiscreteOccurrence(G,ω)` (§4.2); its only "Bessel" is the K-Bessel function (line 684), not a period |
| AutomorphicLFunctionsAndLocalFactors AL.3 *whittaker-model*, *rs-global-poles*, *rs-global-functional-equation*, *rs-boundary-nonvanishing*, *isobaric-strong-multiplicity-one*, "Poles, functional equations and the closed boundary"; AL.4 *l-group-local-factor*, *local-parameter-comparison*, *satake-factor-operations* | open head anchors at lines 1983, 2264, 2281, 2294, 2319, 2261; 2797, 2835, 2848 | present; "Asai" occurs nowhere in that README, so both signed-Asai gaps ask for something absent |
| AutomorphicSpectralTheory §0.15, §§1.1–1.5, 2.4, 2.4a, 2.5–2.9, 2.13, 2.14, 4.1–4.4 | open head lines 360, 891–969, 1602, 1621, 1640–1715, 1759, 1770, 2312–2365 | §2.8 `β_v` and `N_v=β_v M_v` quoted verbatim at README line 116, with `ρ=Asai⊗ξ^m` matching Asai^((−1)^m); §2.13 `jiang_zhang_holomorphy` for Re s≥1/2 including nongeneric members of pure inner forms; §2.14 isobaric sums with strong multiplicity one |
| EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 | open head lines 4172, 4191, 4220 | §11.4 is for CM extensions and pure inner forms, as README line 122 says |
| ModularityAndLanglandsExtensions §§3.3–3.4 (*self-dual-cuspidal-type* at 1913), 3.8, 3.12, 3.13, 3.15–3.18, 3.23–3.25, 5.4 | open head lines 1884, 1914, 2008, 2118, 2137, 2187, 2206, 2225, 2246, 2375, 2394, 2413, 3454 | §3.13 and §3.15 keep even-SO outer orbits ("even-SO outer orbits need further data to select members", line 2289), so the oriented gap is a genuine extension; §3.18 and §3.23 are odd-orthogonal; §5.4 GRS descent is for split SO_(2n+1) with other quasi-split groups "subject to local Bessel uniqueness" |

### Sources

JZ2020 line locators opened and found at the cited material: 81, 87, 408, 422, 434, 454, 490, 664, 694, 715, 731, 743, 779, 799, 814, 848, 856, 867, 1092, 1132, 1135, 1139, 1165, 1190, 1224, 1256, 1520, 1532, 1566, 1610, 1627, 1650, 1670, 1769, 1815, 1826, 1869, 1986, 1998, 2042, 2054, 2067, 2090, 2112, 2130, 2150, 2159, 2223, 2296, 2353, 2366, 2386, 2426, 2503, 2563, 2702, 2833, 2865, 2907, 2976, 2985, 2991, 3077, 3118, 3190, 3217, 3246, 3292. Printed pages recomputed from the markers (extraction page N is printed 738+N) agree with the README for Prop. 2.2 (756), Conj. 2.3 (756–757), Lemma 2.4 and Props. 2.5–2.6 (759), Prop. 4.1 (768), Prop. 4.2 (775), Cor. 4.4 (776), Thm 4.5 (777), Thm 4.8 (781), Prop. 5.2 (784), Thm 5.3 (786), Prop. 5.4 (787), Prop. 5.6 (789), Thm 5.7 (791), Prop. 6.1 (792–793), Prop. 6.2 (793–794), Prop. 6.3 (794), Prop. 6.4 (795), Lemma 6.5 (797–799), Thm 6.6 (799–800), Conj. 6.7 (802–803), p and p¹ (804), Conj. 6.8 (804), Prop. 6.9 and Thm 6.10 (805), Cor. 6.11 (806–807), Thm 7.1 (807), §7.2 (809), §7.3 and Prop. 7.3 (809–810), Cor. 7.4 (810), Prop. A.1 (811).

Secondary sources: GGP2012 Theorem 14.1 (line 2287; SO case attributed to Waldspurger and Sun–Zhu at lines 2300–2301), Theorem 15.1 (line 2351), Corollary 15.3 and the archimedean remark (lines 2476–2490; the auxiliary supercuspidal and Waldspurger irreducibility at 2480–2483); Waldspurger2012 Théorème 1 (line 44, PDF page 2 = printed 313: special orthogonal groups, codimension one, admissible irreducible); SunZhu2012 Theorem B (line 66) with G′ list including SO(p,q), SO_n(C) (line 44) and Casselman–Wallach (line 57); AGRS2010 Theorem 1′ (line 59; unitary group of a hermitian form over D, codimension one, line 50–55); JSZ2010 Theorem A (line 24) with n≥2r+1, p≥r, q≥r+1 (line 15) and completed projective tensor (line 29); JLXXZ2016 Theorem 1.2 (line 189: cuspidal τ on GL_(2n), ∧² pole, σ on SO₂^δ with L(1/2,τ×σ)≠0; parts (1)–(3) at 193–198) and Proposition 3.3 (line 1025: partition [(2n+1)1^(2n+1)]); JLS2016 Definition 10.4 (line 816–818), §11 (line 830–834: Sp, metaplectic, O) and Theorem 11.2 (line 855); Zhang2022 Theorem 1.1 (line 87) with ρ = Asai (even unitary), Asai⊗ω (odd unitary), ∧² (even orthogonal), Sym² (odd orthogonal) at lines 93–98, and §3 unramified data at line 166.

Statements checked against the text with their hypotheses: Prop. 5.2 (line 1998–2006) assumes distinct τ_i and opposite parity and gives order r iff type poles and L(1/2,τ×σ)≠0, as §4.3; its own clause "L(s,τ×σ) is holomorphic at s=1/2" is the cross-value holomorphy the README derives in §3.5; Thm 5.3 (2067–2076) assumes a=N=n∨, nonzero residue and π of parameter φ_τ, as §4.6; Prop. 5.4's proof (2147–2181) derives the order-r pole of Z from the numerator and holomorphy of Z*_S from the order bound, as §4.5; Prop. 6.2 (2386–2391) has the range a−ℓ₀−1<κ≤a+r_m, as §5.4; Prop. 6.3 (2426–2432) is cuspidality for every member, as the two-quantifier split of §5.5; Lemma 6.5's two case lists (2574–2578) are the split/nonsplit branches of §5.7; Conj. 6.7 (2865–2898) has the two-case orbit conclusion of §7.1; Conj. 6.8 (2976–2978) is existential in σ, as §6.2; Thm 6.10 (2991–3001) assumes Conj. 6.8 for (φ,(φ′)^w) and concludes an inner product witness, as §6.4 after the dictionary; §7.3's case list (3223–3239) is §7.4's, with the README adding n≥3 for SO_(2n) and (S02) the missing anisotropy for SO_(2n+1); the pairing (4.8)–(4.9) (1145–1155) is ⟨φ_π,F(E)⟩ with conjugation of one argument, so the paper's integral is a bilinear test against the conjugate realization, as §4.1 says; (4.7)'s convergence sentence (1135–1142) adds "otherwise some regularization may be needed", which concerns the case where neither form is cuspidal.

### Libraries at the pins

Opened at the pinned checkouts (`content/.lake/packages`): `Nat.Partition` (`Mathlib/Combinatorics/Enumerative/Partition/Basic.lean:52`); `Representation.IntertwiningMap` (`Mathlib/RepresentationTheory/Intertwining.lean:36`, extends a linear map; no topology); `MeromorphicOn` (`Mathlib/Analysis/Meromorphic/Basic.lean:494`, pointwise `MeromorphicAt` on a set); `TauCeti.RegularFormClass.wittDecomposition` (`TauCeti/LinearAlgebra/QuadraticForm/Witt/Decomposition.lean:262`, namespace `TauCeti`, `[Field K] [Invertible (2 : K)]`); `TauCeti.QuadraticMap.specialOrthogonalGroup` (`OrthogonalGroup/Basic.lean:403` membership `f ∈ orthogonalGroup Q ∧ LinearEquiv.det f = 1`); `TauCeti.QuadraticMap.det_reflection` (same file); `QuadraticMap.IsometryEquiv.exists_extension` (`Witt/Extension.lean:50`, restricted-form hypothesis `hW`); `TauCeti.equivalent_of_equivalent_prod` (`Witt/Cancellation.lean:32`, finite-dimensional regular summand). The README's descriptions at lines 53–59 are exact.

### Headlines, statability, padding

The 23 docstring headlines are the README's end theorems (§§1.3, 1.4×2, 3.4–3.6, 4.3, 4.5–4.7, 5.2, 5.4–5.8, 6.3–6.5, 7.2–7.5). Each needs cuspidal automorphic realizations on SO(V)(𝔸) or U(V)(𝔸), rational Bessel coefficient maps, smooth admissible or Casselman–Wallach categories, classical-group Eisenstein families or Arthur packets, none of which exists at the pins (Tau Ceti's automorphic material is classical modular forms; Mathlib's `Representation` carries no admissibility or topology). No statable headline is absent; nothing is declared, so there is no padding, no sorry'd data and no signature to audit.

### Declared gaps

All 18 slugs occur in `design/plan.json` `gaps` and in the README supplier contracts with the same supplier and section; every section cited exists at the supplier's head (table above). None has supplier `none`. Minimality spot-checks: SR has no spherical Whittaker formula and only cuspidal generic irreducibility; AL has no Asai factor; GNQA §2.9 has no Witt extension with prescribed complements; AST §2.8 is stated for σ in a generic local packet; ML §§3.13/3.15 keep outer orbits; AFR §4.1 convergence is for two cusp forms. gap:bessel-restriction-growth over-asks by the split-torus regularization clause: S01. Observation for the intake, not a finding: GanGrossPrasadUnitaryGroups declares gap:hermitian-unitary to the same RG2.4 (its line 75), overlapping gap:hermitian-witt-complements.

### Ownership

`roadmaps grep` over main and 416 open heads (index of 2026-10-29): "twisted (automorphic) descent" occurs outside this package only as the unrelated word "descent" in other roadmaps; "Bessel (period|model)" occurs only in GanGrossPrasadUnitaryGroups (18, the cited unitary owner) and AutomorphicFormsOnReductiveGroups (1, the K-Bessel function); no open roadmap named GanGrossPrasad*PartII or any orthogonal GGP roadmap exists in the index. The orthogonal relevant pairs, the orthogonal local uniqueness and the residue-to-period comparison have no other owner. Ownership against open pull requests outside the index was not checked.

### Computed adversarial pass

t=s−1/2, T=q^(−s−1/2); q,B denote the quadratic form and its bilinear form with q(y)=B(y,y).

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Conventions, N and r | SO₅; U₅; nonsplit quasi-split SO₄ | N=4; 5; r=1 vs label 2 | holds |
| Conventions, j<a | a=N≥m+2j, a=0 iff SO₁; a=d=m+2j+1>j | j<a fails only for SO₁ | holds |
| Conventions, Hermitian slots | h(i,1)=i, h(1,i)=−i; e,f hyperbolic | h(e±f,e±f)=±2; GNQA's conj-first form gives −i at (i,1) | holds; slot swap needed and stated |
| Conventions, split U(1,1) | τ=(χ₁,χ₂); Levi (g,h) | diagonal (χ₁,χ₂⁻¹); det=det g/c(det g)·det h | holds |
| Conventions, modulus and L-value | GL₂, \|a\|=4; q=2, s=1, roots ±1 | δ^(1/2)=2; (1−T)(1+T)=3/4, L=4/3 | holds |
| Conventions, critical arithmetic | (5,2,1,4); (a,j)=(1,2) | k₀=2, 8+2−4−1=5; truncated 0 gives m+1≠m+5 | holds |
| §0.1 Levis | SO₇, j=2; j=1 | 1+1+3=5 vs 4+3=7; both GL₁×SO₅ | holds (r1a F05) |
| §0.1 datum existence | (d,r)=(4,2),(5,2),(3,0) | valid ℓ {0,1},{0,1,2},{0}; q(e₂+e₋₂)=2 | holds |
| §0.2 partition | (5,1),(3,0),(4,2) | [3,1,1] sum 5 length 3; [1³]; part 5>4 | holds |
| §0.3 character | x=δ, x=1, c(δ)=−δ | Tr(1)/2=1; Tr(1/δ)/2=(1/δ−1/δ)/2=0 | holds |
| §0.3 signatures | q=2xy, (1,±1/2) | values ±1; perpendiculars (1,∓1/2) values ∓1 | holds |
| §0.4 normal form | B(e_r,e₋ᵣ)=1, y=e_r+c e₋ᵣ | q(y)=2c=(−1)^(d+1)κ; κ=2 gives 2,−2 | holds |
| §0.5 Witt index | w=y_κ, w⊥=H^(r−ℓ−1)⊥⟨y_(−κ)⟩⊥V_an, q(y_(−κ))=−q(y_κ) | index r−ℓ iff V_an represents q(y_κ); ℝ,⟨1⟩,κ=±1: ⟨−1,1⟩ index 1, ⟨1,1⟩ index 0 | holds |
| §0.5 unitary stabilizer | Levi (t₁,…,t_ℓ,h) on z_(i,i+1) and q(t_ℓ y,h⁻¹w) | t_i=t_(i+1)=t, h w=c(t)w, so t∈E¹ and H={t=1}; t=−1 fixes ψ, sends e to −e | holds |
| §0.6 ambient datum | (5,2,1,4); a=j+1 | 2a+m−2k−1=d; k≤r_X=a+r_W, 2k+1=2a−2j−1≤2a+m; middle H^(j+1)⊥W, w with q(w)=−q(e) | holds |
| §1.1 case (ii) domain | H=U(W); SO(W), dim≥3; SO₂ anisotropic; SO₂ split; trivial | centre U₁ anisotropic; finite; compact; G_m; trivial | only split SO₂ excluded, as stated |
| §1.1 case (i) | SO₃⊃split SO₂, f cuspidal, g=χ | Hecke integral ∫f(diag(t,1))χ(t)d^×t converges | holds |
| §1.1 regularized period | Φ=1; Φ=min(t,1/t), T=1; Φ=t^(1/2) | undefined; 0+0+1+1=2=∫min(t,1/t)dt/t; 2T^(1/2)−2T^(1/2)=0 | arithmetic holds; branch vacuous: S01 |
| §1.1 regularized on a fixed-character carrier | f=Σc_iχ_i, g=χ | Φ=Σc_i vol t^(iλ_i); λ=0 occurs iff χ⁻¹-component nonzero; else value 0 | never a nonzero value: S01 |
| split SO₂ parameters | η₁⊞η₂, η₁η₂=1; Ind_K χ̃ with det 1 | η₁=η₂; symplectic, not orthogonal | Φ̃₂(split SO₂)=∅: S01, S02 |
| anisotropic SO₂=K¹ parameters | χ²=1; χ²≠1 | η⊞ηω_K, det ω_K; dihedral of det ω_K | generic discrete: S02 repair |
| §1.2 index | support {0,2}; r=0,d>0; split d=4 | ℓ₀=2; 0; ℓ=2 needs 5≤4 | holds |
| §1.3 torus | split SO₂ | no proper parabolic; ∫₁^∞dt/t=∞ | holds |
| §1.4 local uniqueness | V=k,W=0; (p,q)=(1,2),(1,1); ψ_B(n)=−1 trivial action; σ⊕σ | Hom=ℂ; 3≥3 vs 2<3; b=−b⇒0; two maps vs ≤1 | holds |
| §1.4 auxiliary induction | j=1,W=0,σ trivial; dim W=3, principal series | cuspidal datum; non-cuspidal datum | gap needed only in the second: holds |
| §2.1 convergence | G with trivial split centre, v cuspidal, E moderate growth | case (ii) | holds |
| §2.3/2.4 cells | a=1,r_W=0: ℓ=0; ℓ=1 | β−α=1: (0,1); β=α: (0,0),(1,1); open β=max(a−ℓ,0)=1,0; C₂ average (1−1)/2=0 | holds |
| §2.4 open cell validity | α=0,β=a−ℓ (a>ℓ); β=0 (a≤ℓ) | a≤ℓ+β=a≤a+r_W; needs ℓ≤a+r_W=r_X | holds |
| §2.6 inner index a≤ℓ | ℓ−a≤r_W; 2(ℓ−a)+1≤m from 2ℓ+1≤2a+m | both hold | holds |
| §3.3 ratio, ρ | m=1,2; JZ line 1834 As⊗ξ^m; Zhang2022 line 93–98 | Asai⁻, Asai⁺; parity sign(τ_i)=(−1)^m from (−1)^(2a+m−1)=sign(τ_i)·(−1) | holds |
| §3.3 numerator twist | η′=η(x/c(x)); (τ,σ,π)↦(τη′,ση,πη⁻¹) | I_s⊗η∘det, integrand unchanged; φ_π,φ_σ∨ both ×η′⁻¹; As(τη′)=As(τ) since η′\|_F=1; τ×φ_π∨ would change by η′² | holds, discriminating |
| §3.3 split U₃ roots | Levi (χ₁,μ,χ₂⁻¹), Borel of GL₃ | roots χ₁μ⁻¹, μχ₂, χ₁χ₂; (2,3,5): 2/5, 15 vs 10, 3/5 | holds |
| §3.4 split U(1,1)⊃U₁ | h(t)=t on (1,1), 1 on (1,−1); odd residue char | \|t\|≤1: χ₁(t)\|t\|^(s+1/2) ⇒ ΣX^n; \|t\|>1: h(t)=t·h₂(1/t) ⇒ χ₂⁻¹(t)\|t\|^(−s−1/2) ⇒ ΣY^n; sum (1−XY)/((1−X)(1−Y)); q=3: (8/9)/(4/9)=2; dual twist 1/2 | holds |
| §3.5 exponents | α=1/3,β=1/4; 1/2 | 5/12, 11/12, 4/3; 0 | holds |
| §4.1 U(1,1) | τ trivial on A_F^× | τ=ξ(x/c(x)) by Hilbert 90, ξ trivial on U₁(F); residue ξ∘det, restriction ξ; ∫ξπ′≠0 iff π′=ξ⁻¹ | holds |
| §4.1 self-pair order | SO₅, φ=μ₁⊞μ₂, τ=μ₁; a=N | order 1=r, degrees 2≠4; τ∨⊆φ with equal degree ⇒ equality | holds (r1a F02) |
| §4.1 paper's pairing | (4.8)–(4.9) | ⟨φ_π,F(E)⟩=∫φ_π conj F(E); conj φ_π realizes π∨; pole at τ≅φ_π | holds |
| §4.3 types automatic | τ=φ_π∨: G odd SO ⇒ X even, ∧², symplectic blocks; G even SO ⇒ X odd, Sym²; U: sign (−1)^m=(−1)^(d−1) | consistent in all three | holds |
| §4.5/4.6 reverse | ℒ order r from numerator; denominators finite nonzero at 3/2, 2 | Z pole order r forces E order r hence cross value ≠0 | consistent with §4.7 |
| §4.7 duality | conjugate-self-dual χ,μ | L(1/2,χ∨μ∨)=L(1/2,c(χμ))=L(1/2,χμ); χμ∨=χ·c(μ) differs unless μ²=1 | holds |
| §5.1 parameter | a=6, H_W=SO₃; odd ambient | 15; 12+2=14; 2a+(m−1) | holds |
| §5.3 critical index | even-SO H_W: a=m+2j ⇒ 2k₀+1=a+m−1; odd-SO and U: a=m+2j+1 ⇒ a+m | (5,2,1,4): [5,1⁵]; (6,1,2,6): [7,1⁶] | holds |
| §5.7 index | d=a=6, W split dim 1 | k₀=a−j−1=3=a/2+r_W; general 2r_W+j+1 | holds |
| §5.7 unitary | a=4,m=1: 2a+1−2k₀−1=4; a=5 weights μ₁,μ₂,1,μ₂⁻¹,μ₁⁻¹ | U₄; degree 5 | holds |
| §5.9 split-SO₂ descent | a=2, τ=η₁⊞η₂ distinct quadratic, G split SO₂ | constituent χ needs χ⊞χ⁻¹=η₁⊞η₂ a.e. ⇒ η₁=η₂ | descent zero: S01 Check |
| §6.1 partitions | (a,m)=(4,2),(6,1),(2,1),(1,0); part counts | [5,5]/[5,1⁵]; [7,5,1]/[7,1⁶]; [3,1,1]=[3,1,1]; [1,1]=[1,1]; 2 vs a+2, 3 vs a+1, 2 vs a+1 | holds |
| §6.1 p¹ vs critical | even-SO: (a+m−1,1^(a+1)), d=a+1 | equals [2k₀+1,1^d] | holds |
| §6.3 ranks | n=1 anisotropic SO₂; JLXXZ ambient 4n+2 | (4,2) total 6; a=2,k₀=1,[3,1³]; p¹=(2n+1,1^(2n+1)) | holds |
| §6.3 GRS m=0 | W=0, d=2j+1, a=2j | k₀=j−1, X=H^(2j), p¹=(2j−1,1^(2j+1)) | matches ML §5.4 descent |
| §6.4 labels | (φ∨,φ′); residue τ=φ∨ | constituents parameter φ∨, π=π₀∨ parameter φ; L(1/2,φ∨×φ′∨)=L(1/2,φ×φ′) | holds |
| §7.3 partitions | SO_(2n) split and nonsplit; U_(2n+1); U_(2n); U₂ | N_(n−1) is the maximal unipotent, w anisotropic ⇔ generic; U₀; [2n−1,1], U₁; index 0 only | holds |
| §7.4 cases | SO₆: [3,3] vs [3,1³], stabilizer 3; U₅: [4,1] vs [3,1,1], U₂; SO_(2n+1): W=w⊥ in H⊥⟨c⟩ hyperbolic iff q(w)≡−c | both rational orbits occur | S02 |
| §7.5 dominance | SO₈ [5,3] vs [4,4], [7,1]; U₅ [4,1] vs [3,2]; SO_(2n+1) [2n−3,3,1] vs [2n−1,1,1] | (5,8)≥(4,8); (4,5)≥(3,5); (2n−3,2n)≤(2n−1,2n) | holds |

## Not verifiable

- GRS2011 (Theorems 5.1, 5.4, 5.6, 7.3): settled uncertified; read only through JZ2020 lines 713, 2399, 2412, 2439, 2560. Not requested.
- JZ2020's references [43] (unramified computation in full generality) and [62, Th. B] (Mœglin's irreducibility): the source defers to them (lines 1865–1866, 2949); not in the manifest and not needed to decide any finding here.
- The analytic targets the roadmap owns (all-place continuation of §2.5, the uniform spherical evaluation of §3.4, the corrected Appendix A argument of §3.6, the even-unitary regular-to-[2n−1,1] comparison of §7.3, the split-SO₃ and U₂ assertions of §7.4) were checked on their finite witnesses only; no counterexample to a stated target was found.
- Whether a cuspidal representation of a split SO_(2n+1) with generic parameter and maximal support {[2n−1,1,1]} can have nonzero index-(n−1) coefficients only on hyperbolic-plane data (S02) is not decided here; the finding is that the roadmap and its source give no argument excluding it.
- Conclusions conditional on the 18 declared gaps, Generic Summand, weak support, the distinct-isobaric proposition, the exact local proposition and the inner-form classification hypothesis remain conditional; their current absence is not a defect.
- Ownership against open pull requests outside the brief's index was not checked. No Lean elaboration was run (read-only pass, nothing declared).

## Source issues

- **Gap** in JZ2020 at §7.3, printed p.809, JZ2020 line 3229–3231: the source says that for split SO_(2n+1) with subregular maximal support the smaller group is a form of SO₂ and hence the Generic Summand conjecture holds; it should exclude the hyperbolic-plane datum, whose split SO₂ carries no cuspidal representation with a generic discrete parameter; affects a stated result (Proposition 7.3, Corollary 7.4).
- **Error** in JZ2020 at §4.1 after (4.7), printed p.766, JZ2020 line 1135: the source says the period converges absolutely when one of the two forms is cuspidal; for a split SO₂ stabilizer a Hecke character is vacuously cuspidal and the integral of a nonzero constant diverges; affects nothing in the theorems, whose hypotheses exclude this stabilizer (the split SO₂ has no discrete spectrum), but affects the stated convergence remark.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "43997ea5d6eefaaae2d78eec0e126562a889f81d", "job": "RT-TwistedAutomorphicDescents~2b", "model": "fable", "worker": "chris-x9"} -->
