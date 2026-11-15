# Review of AInfCohomology (pull request #1044 at 99b809b)

**Verdict:** needs changes

## R01 (P2) — The proper torsion theorem, a stated end theorem, has no statement

**Location:** `TauCetiRoadmap/AInfCohomology/README.md` line 2649 "**Torsion and lattice statements for proper cohomology**. State the generic length inequality and the adjacent-degree recovery maps for use by CohomologyComparisons." and line 2651 "Use `H^i` and `H^(i+1)` hypotheses exactly where the recovery map needs them."

**Claim:** this target carries the end theorem the Summary announces (line 28, "BMS1, Theorem 1.1, p.2") and that CohomologyComparisons and PadicHodgeTheory import.

**Witness:** the target names no inequality, no quantifier and no hypothesis. bms1 lines 5888–5903 (Theorem 14.5(ii)–(iii), pp.120–121) has three distinct assertions with different hypotheses on degrees `i` and `i+1`; the semistable twin (line 3690) is stated exactly.

**Repair:** replace lines 2649–2651 by: "**Torsion and lattice statements for proper cohomology**. Standing hypotheses (C); `𝔛` proper smooth over `O_C` with generic fibre `X`; `i≥0`. (a) For every `n≥0`, `length_{W(k)}(H^i_crys(𝔛_k/W(k))_tor/p^n) ≥ length_{ℤ_p}(H^i_ét(X,ℤ_p)_tor/p^n)`; so `H^i_ét(X,ℤ_p)` is torsion-free when `H^i_crys(𝔛_k/W(k))` is. (b) If `H^i_crys(𝔛_k/W(k))` is p-torsion-free, then `H^i_Ainf(𝔛)` is finite free with étale realization `H^i_ét(X,ℤ_p)`, hence is the BKF module of the pair `(H^i_ét(X,ℤ_p), H^i_Ainf(𝔛)⊗_{A_inf}B_dR⁺)` under *Fargues classification of finite free BKF modules* (§AI.2.3), and `H^i_Ainf(𝔛)⊗_{A_inf}W(k)→H^i_crys(𝔛_k/W(k))` is injective and `φ`-equivariant. (c) If `H^{i+1}_crys(𝔛_k/W(k))` is also p-torsion-free, the map in (b) is an isomorphism. These are length inequalities, not injections of torsion groups." Add the Checks: `Spf O_C` (all terms zero for `i>0`); the Enriques example of the layer's Examples, through (a) at `i=2`, `n=1` (`H¹_ét(X,𝔽_2)=H²_ét(X,ℤ_2)[2]=𝔽_2`); a case where (b) holds and (c) fails must keep the degree `i+1` hypothesis.

## R02 (P2) — A proof plan follows the source's proof clause by clause

**Location:** line 2965 "Since `φ_A(μ)=ξ̃·μ`, … gives … (BMS1 Lemma 6.11), and … (BMS1 Proposition 6.12) identifies the right side with the complex whose i-th term is … Each `Ω^i_{𝔛/O_C,log}` is a vector bundle …"; the same form at line 2951 ("CK Theorem 4.2. … CK Propositions 4.4 and 4.8. … CK §§4.9–4.10 and Theorem 4.11. …").

**Claim:** the plan is the roadmap's own wording of a route.

**Witness:** ck lines 1188–1207: the same five steps in the same order with the same citations (6.11; 6.12; the cotangent argument with Illusie III.3.2.4(iii); (4.11.2); 14.1(ii) "or" Bhatt 7.9); longest shared run 7 words. Line 2951 walks ČK §§4.2, 4.4, 4.8, 4.9–4.10, 4.15 in order.

**Repair:** line 2965, replace the plan (keep the locators) by: "Route. The Frobenius of *Semistable AΩ Frobenius* (§AI.6.2) turns the reduction along `θ` into the reduction along `θ̃` of `Lη_{ξ̃}AΩ_𝔛`, which *Reduction to the Bockstein complex* (§AI.1.4) computes as the Bockstein complex of the Hodge–Tate reduction: its terms are `H^i(Ω̃_𝔛)` twisted by the i-th power of the conormal line of `θ̃`. That line is `O_C{1}`, the `r=1` term of *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1), so *Log Hodge–Tate reduction* (§AI.6.3) makes the terms `Ω^i_{𝔛/O_C,log}`. Two maps of locally free sheaves that agree on the dense open `𝔛^sm` are equal, and there the differential is the de Rham differential by *De Rham specialization* (§AI.4.3). The global statement follows because `O_C=A_inf/ξ` is a perfect `A_inf`-module." Line 2951, replace by four named inputs: "(i) `ξ̃≡p` modulo `μ` and *Nonintegral cohomology annihilation* (b) let *Nonflat quotient base change for décalage* (§AI.1.6) commute `Lη_μ` with reduction along `θ̃` on each object of `𝔛^psh_ét`; the two edge comparisons of §AI.6.2 transport this to sheaves. (ii) On a chart `H^i(Ω̃)` is `H^i_cont(Δ,R)≅∧^i R^d` (§AI.1.7), compatibly with étale maps and cup product. (iii) The map from `Ω¹{−1}` comes from *Completed cotangent description of the twist* and is an isomorphism onto `(ζ_p−1)H¹` over `𝔛^sm` by *Cotangent description of the first Hodge–Tate truncation* (§AI.4.1). (iv) On a compactified chart, algebraise by *Formal GAGA over a complete rank-one valuation ring*, compare determinants on the generic fibre by *The first higher direct image of the completed structure sheaf* (§AI.3.1), and extend from `𝔛^sm` by *Extension of vector bundles across codimension two over a valuation base*."

## R03 (P3) — Undefined labels stand where target titles should

**Location:** "aomega" (16 times: lines 2903, 2907, 2951, 2974, 2976, 3085, 3171, 3288, 3585, 3589, 3610, 3614, 3745); "complete-flat-descent" (lines 3808, 3812, 4217, 4225, 4227); "mod-ideal-detection" (3812); "chart-ring/divisorial-log" (3761); "API item intertwined", "API item injective", "API item semilinear" (3171, 3214, 3585, 3610).

**Claim:** each names something a reader can find.

**Witness:** `grep -n "aomega" README.md`: no target, section or definition has that name; line 2974 reads "`AΩ^psh`, `φ` and `AΩ_{𝔛_Zar}` are those of aomega". No API bullet is called "intertwined", "injective" or "semilinear".

**Repair:** "aomega" → "*Semistable AΩ complex* (§AI.6.2)"; "complete-flat-descent" → "DerivedModuleAlgebra, §1.9 (*Complete faithful-flat module descent*)"; "derived Nakayama (mod-ideal-detection)" → "the derived Nakayama criterion of DerivedModuleAlgebra, §1.3"; "chart-ring/divisorial-log" → "*Standard semistable chart ring* and *Divisorial semistable log structure* (§AI.6.1)"; replace each "API item X" by the fact it means, for example line 3585 "(*Semistable AΩ complex*: functoriality for isomorphisms over a continuous automorphism of `O_C`)".

## R04 (P3) — Eight citations of a PerfectoidSpaces title that does not exist

**Location:** lines 553, 571, 593, 618, 638, 841, 3948 and 3961: "PerfectoidSpaces, P1 (*Fontaine's θ: W(S♭+) → S+ is surjective with kernel generated by a primitive nonzerodivisor (ECD Lemma 3.14)*)".

**Claim:** PerfectoidSpaces P1 has a target of this title.

**Witness:** `TauCetiRoadmap/PerfectoidSpaces/README.md` on main, line 4658, in §P1.18: "**Fontaine's `θ: W(S♭⁺) → S⁺` has kernel generated by a primitive nonzerodivisor.**" The cited string occurs in no roadmap but this one and CrystallineCohomology.

**Repair:** replace all eight by "PerfectoidSpaces, P1.18 (*Fontaine's `θ: W(S♭⁺) → S⁺` has kernel generated by a primitive nonzerodivisor*)".

## R05 (P3) — Works cited with locators but absent from the References

**Location:** line 2591 "Lodh, *Almost étale extensions of Fontaine rings*, Lemma 1.3, proof, printed p.1893"; line 2965 "Illusie, Complexe cotangent et déformations I, III.3.2.4(iii)" and "Bhatt, Specializing varieties and their cohomology …, proof of Proposition 7.9"; line 2951 "Fontaine, Formes différentielles …, Théorème 1′(ii)"; line 2871 "Bhatt–Scholze, The pro-étale topology for schemes, 3.4.4 and 3.4.14"; lines 1786, 1808 "(Kedlaya)"; line 3422 "(Conrad–Gabber)".

**Claim:** every cited work is in `## References` (lines 4323–4348).

**Witness:** `sed -n '4323,4348p' README.md | grep -c "Lodh\|Specializing\|Formes\|pro-étale topology\|Kedlaya\|Complexe cotangent"` is 0. "(Kedlaya)" and "(Conrad–Gabber)" name no text and no locator.

**Repair:** add "**Lod11**: Rémi Shankar Lodh, *Almost étale extensions of Fontaine rings and log-crystalline cohomology in the semi-stable reduction case*, Ann. Inst. Fourier 61 (2011), 1875–1942"; "**Bha18**: Bhargav Bhatt, *Specializing varieties and their cohomology from characteristic 0 to characteristic p*, Proc. Sympos. Pure Math. 97.2 (2018), 43–88"; "**Ill71**: Luc Illusie, *Complexe cotangent et déformations I*, Lecture Notes in Math. 239, Springer (1971)"; "**Fon82**: Jean-Marc Fontaine, *Formes différentielles et modules de Tate des variétés abéliennes sur les corps locaux*, Invent. Math. 65 (1982), 379–409"; "**BS15**: Bhargav Bhatt and Peter Scholze, *The pro-étale topology for schemes*, Astérisque 369 (2015), 99–201". At lines 1786, 1808 and 3422 name the work and the locator, with its entry, or drop the parenthesis where the SW20 or BMS1 locator of the same sentence already covers the step.

## R06 (P3) — `Suggested.lean` states targets of three layers with no layer comments

**Location:** `TauCetiRoadmap/AInfCohomology/Suggested.lean` lines 49 and 66: "section Cyclotomic", "section Coefficients".

**Claim:** the file has the roadmap form.

**Witness:** the six theorems belong to AI.0 (lines 79, 87, 96), AI.0:period-comparison (113) and AI.2 (118, 127); `grep -c "/-! ## Layer" Suggested.lean` is 0.

**Repair:** insert `/-! ## Layer AI.0: Cyclotomic periods and finite Witt coefficients -/` before line 44, `/-! ## Layer AI.0:period-comparison: Comparison with the rational period rings -/` before line 105, and `/-! ## Layer AI.2: Breuil–Kisin–Fargues modules, lattices and modifications -/` before line 116.

## R07 (P3) — Two slips in statements of sampled and headline targets

**Location:** line 4187 "f(E) generates `ξ̃`"; line 2548 "(BMS1 (arXiv v3), Theorem 14.3(i) and proof, printed pp.119–120)" at *Perfectness of proper A_inf cohomology*.

**Claim:** `f(E)` generates the element `ξ̃`; item (i) of Theorem 14.3 is perfectness.

**Witness:** bms1 line 2127: `f(E)` is a generator of the kernel of `θ̃`, so it is a unit multiple of the cyclotomic `ξ̃=φ(ξ)` fixed in Conventions, not that element. bms1 lines 5842–5850: perfectness is in the opening sentence; (i) is the `W(k)` comparison.

**Repair:** line 4187: "`f(E)` generates `ker θ̃=(ξ̃)`, so `E`-inversion on the source is `ξ̃`-inversion on the target". Line 2548: "(BMS1 (arXiv v3), Theorem 14.3, opening assertion, and its proof, printed pp.119–120)".

## Previous findings

- R01 — repaired: lines 331–343 add "**Integral perfectoid rings.** `TauCeti.Perfectoid.IsIntegralPerfectoid p A`, in `TauCeti.RingTheory.Perfectoid.Integral`, is the predicate of BMS1 Definition 3.5"; line 269 "it is a clause of Tau Ceti's `TauCeti.Perfectoid.IsIntegralPerfectoid`"; line 583 cites the class.
- R02 — repaired: line 3704 "Use the normalized length of *Normalized length over a rank-one valuation ring* (§AI.6.7; CK §7.10)"; lines 102–103 put the valuation-ring modules under "(AI.1)"; line 329 "§AI.1.3 adds diagonal presentations".
- R03 — repaired: `grep -n -P "\x{00AD}" README.md` finds nothing.
- R04 — repaired: line 2704 "a valuation subring `O` of the integral closure of `W(k̄)` in `C` that is the union of a filtered family of discrete valuation subrings `O_i` with `O ∩ Frac(O_i) = O_i`"; line 2706 "`O` and `π` as stated for the second".
- R05 — repaired: line 1323 "`completion_I(Lη_I C) → Lη_I Ĉ`"; line 1607 "Patch over the two opens `D(p)` and `D([ϖ^♭])` of `U`"; line 2238 "`E∞`-algebra `E` over `𝔽_2`"; no "used subsequent", "direct` sum", or "as in §3" remains.
- R06 — repaired: lines 4340–4342 are the keyed entries **Kat89**, **Kat94**, **GR03**; no code-span initials and no "Bökstedt's computation" item remain in the References.
- R07 — repaired: no "corrected PD envelope", "corrected `λ`" or "as corrected in" remains; "corrected" now occurs only for the pro-étale site of the corrigendum **Sch13-corr**.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Coherence of a square-zero extension | `k[ε]/ε²→k`; `k[x_1,x_2,…]/(x_ix_j)→k` | first: `I=k` f.p., coherent; second: `Ann(x_1)=(x_1,x_2,…)` not f.g., `(x_1)` not f.p. | hypothesis on `I` needed; bms1 line 1396 (p.29) | none |
| Intrinsic Breuil–Kisin twist | basis `e=μ⁻¹⊗ε`; p=2 | `φ(1/μ)=1/(ξ̃μ)`: factor `1/ξ̃`; `φ`-invariants `x=μc`, `c∈ℤ_p`: `ℤ_p(1)`; `θ̃(μ)=ζ_p−1`, `−2` at p=2 | bms1 lines 1972–1988 (p.41); bms2 lines 1713, 1739 (pp.40–41) | none |
| Divisibility equation | `[ℤ →4 ℤ]`, f=2; f=1; f=0 | `δ_0(1)=2`, `2·2=4`; `δ=d`; `E_0=ker d` | bms1 line 2337 (Def 6.2, p.49) | none |
| Derived p-completion, non-replete site | point: `ℤ`, `ℚ`, `ℤ/p^n` | `ℤ_p`; `0`; `ℤ/p^n` | ck line 268 ((1.7.1), p.7) | none |
| Perfectness of finitely presented A_inf modules | `A_inf/p`; `A_inf/(p,[ϖ])`; `k` | `[A→A]`; Koszul on `(p,[ϖ])`; `k` is not finitely presented, excluded | bms1 lines 1718–1720 (p.35) | none |
| Primitive mod-p comparison and finiteness | `Spa(C,O_C)`; `P¹` | `O_C/p→O_C/p`; `𝔽_p, 0, 𝔽_p(−1)`, bound `2=2·dim` | sch13 line 1279 (Thm 5.1, p.28) | none |
| Divisorial semistable log structure | chart r=1 | `ℕ²⊔_ℕ(O_C∖0)`, `(1,1)∼p^q`; `t_0t_1=p^q` a unit after `1/p` | ck lines 220–240 (Claims 1.6.1, 1.6.3, p.6) | none |
| Integral semistable local edge comparison | d=0; torus | `A_inf`; `([ε]^n−1)/μ≡n` mod `μ`: unit iff `p∤n`; `n=0` gives `H¹⊃A_inf` | ck lines 717–730 (p.18) | none |
| Proper compactifications of standard semistable charts | r=1; r=2 | `XY=p^qZ²`, chart `X=1`: `y=p^qz²` smooth; r=2 at infinity `t_1t_2=p^q s` is not a semistable chart, so the subdivision the target requires is needed | ck lines 1153–1158 (pp.29–30) | none |
| Log de Rham specialization | torus | `Σa_nt^n↦Σna_nt^n dlog t`; `H¹/p=⊕_{p∣n}O_C/p`, infinite rank | ck lines 1185–1211 (pp.30–31) | R02 |
| Normalized length | `V/(p^n)`; `V/(π^a)`, `π^e∼p`; DVR | `n`; `a/e`; ordinary length when `p` is a uniformizer | ck lines 3123–3136 (p.71) | none |
| Nodal conic and good reduction model test | special fibre `L_1∪L_2` | `H⁰(O)=k₀`, `H¹(O)=0`; `ω|L_i=O(−1)`: `H⁰(ω)=0`, `H¹(ω)=k₀`; log de Rham `O_K,0,O_K`; `A_inf,0,A_inf{−1}` | ck lines 3088, 3237 (pp.70, 74) | R03 (line 3761) |
| Quasisyntomic unfolding of the trace coefficient sheaf | `S=R` perfectoid | `π_*TC⁻=A_inf[u,v]/(uv−ξ)`: `v^iπ_{2i}=ξ^iA_inf`, `gr^i≅R=π_{2i}THH`; `φ(ξ^i)=ξ̃^i` | bms2 lines 1046, 1914–1932 (pp.25, 46) | none |
| Cohomological Breuil–Kisin complex | `R=O_K` | `D_𝔖=𝔖`, `F=φ_𝔖`; `E≡u^e` mod p so `(p,E)`- and `(p,u)`-completeness agree | bms2 lines 3282–3298, 3505–3529 (pp.79, 84) | none |
| Exact cohomological BK to BKF tensor functor | `M=𝔖/p`; `E` | `A_inf/p=O_C^♭`, rank 0 after `1/p`; `θ̃(f(E))=E(π)=0` | bms1 lines 2107–2130 (p.43) | R07 |
| BMS1 Theorem 1.8 (§AI.5.1) | `Spf O_C`; the four specializations | `A_inf` in degree 0; (i)–(iv) of bms1 lines 251–258 match the four targets | pp.5–6; Thm 14.3 p.119 | R07 (line 2548) |
| Proper torsion theorem (§AI.5.2) | Enriques, p=2 | `H¹_ét(𝔽_2)=H²_ét(ℤ_2)[2]=𝔽_2`; (a) at i=2, n=1 gives `H²_crys` torsion, so `H¹_dR(𝔛_k)≠0` | bms1 lines 5888–5903 | R01 |
| Rational Frobenius bijectivity over A_cris | `Spec k[T]`, i=1 | `H¹=⊕̂W/n·e_n`, `φ(e_n)=p·e_{pn}`: kernel 0, cokernel `⊕k`, killed by `p≤p²` | consistent with the bound `p^{d(i+1)}` | none |
| Semistable BKF modules and torsion inequalities (ČK 7.4, 7.9, 7.12) | DVR; `O_K/(π)` | `length(H/p^n)=nr+length(H_tors/p^n)`; normalized length `1/e`; `M=O_C^♭`: `1=1−0` | ck lines 3056, 3107, 3138–3147 (pp.69–71) | none |
| De Rham lattice (ČK 8.4–8.7) | `ℤ_p(1)`; ramified quadratic `η` | `θ(t/μ)=1`: `L=O_K(t⁻¹⊗ε)`; `L=O_K√π⊗e`, `L⊗O_C=√π·M_dR⊊M_dR` | equality `L⊗O_C=M_dR` rightly not claimed | none |
| Breuil–Kisin descent (BMS2 1.2, §AI.7.4) | `K=ℚ_p(p^{1/p})`; `K=ℚ_p` | `θ_𝔖(u)=p`; `ℤ_p/p^a⊗O_K=O_K/π^{pa}`; `c(u)=0`; `E≡u^e` mod p, so `(E)=φ(J)𝔖` forces `p∣e` | bms2 line 88 (p.3), 3282–3298 | none |
| `ker_fontaineTheta_eq_span_xi` | hypothesis on `(ε^{1/p})^♯` only; `ε=1` | `θ(ξ)=Σζ_p^j=0`; `v^♭(ξ mod p)=p/(p−1)−1/(p−1)=1=v(p)`: primitive; `ε=1` excluded by `hε` | BMS1 3.16–3.17 | none |
| `iInf_span_xiLevel_eq_span_mu` | r=1,2; direction of `θ_r` | `θ_r([ε])=[1]`, so `μ∈ker θ_r`; `ξ_r=μ/φ^{−r}(μ)`; valuations `(p/(p−1))(1−p^{−r})→p/(p−1)` | bms1 line 1320 (p.27) | none |
| `finite_witt_coherence` | r=1; zero map; m=0 | valuation rings `O_C`, `O_C^♭`; kernel = source, FG | bms1 line 1365: `O` the integers of any perfectoid field, so both rings | none |
| `ainf_deRhamPlus_flat` | carrier | body is `AdicCompletion (ker fontaineThetaInvertP) (Localization.Away p)` = `BDeRhamPlus` (`BDeRham.lean:75`) | flat: completion of the DVR `A_inf[1/p]_{(ξ)}` | none |
| `ainf_invert_p_projective_free` | `M=0`; rank 1 | free of rank 0, 1 | bms1 line 1778 (Cor 4.12, p.37) | none |
| `ainf_free_of_torsionFree_reduction` | `A_inf/p`; `A_inf/ξ` | `M/ξ=O_C/p` has p-torsion: excluded by `hred`; `C` not projective over `A_inf[1/p]`: excluded by `hproj` | bms1 lines 1792–1793 (p.37) | none |
| Finite Witt coefficient maps; Witt almost ideal | r→r+1; `q_(2,0)`; p=2 `q_(2,1)` | `Fθ_{r+1}=θ_rφ`, `Rθ_{r+1}=θ_r`, `Vθ_r(x)=θ_{r+1}(λφ⁻¹x)`; `0`; `1+[ζ_4]` | Checks agree with the API | none |
| Décalage conventions and Bockstein | `ℤ/p`, `ℤ/p²`; `[ℤ→pℤ]`, `[ℤ→p²ℤ]` | `Lη_p`: `0`, `ℤ/p` (not a triangle); `β=id`, `β=0`; `[R→f²R]↦[R→fR]` | bms1 Lemma 6.4, Prop 6.12 | none |
| Worked examples | q-integers | `[−1]_q=−q⁻¹→−1` at `q=1` | consistent | none |

- Gate: the worker's gate passes every check. `lake env lean` on `Suggested.lean`: six `declaration uses sorry` warnings (lines 79, 87, 96, 113, 118, 127), nothing else. One-tactic probe (`first | rfl | infer_instance | simp_all`) closes none of the six. Elaborated signatures compared with the README: `mu` and `deRhamMap` lose only binders their types do not use. Nothing is changed outside the folder.
- Dependency check: `depcheck: 245 roadmaps, 2239 edges, 0 problem(s)`; no UPWARD or CYCLE line; AInfCohomology is line 83 of the merge order.
- Source locators checked against the text (41): 19 in bms1 (arXiv v3), 17 in ck, 3 in bms2 with pages and 10 by statement number, sch13 Theorem 5.1; the theorem numbers and arXiv pages agree with the README except as R07 says.
- Library declarations opened at the pins (6): `TauCeti/RingTheory/Perfectoid/Integral.lean:76, 95, 106`, `TauCeti/RingTheory/Perfectoid/FontaineTheta.lean:63`, `Mathlib/RingTheory/Perfectoid/BDeRham.lean:62, 75`; no pinned declaration proves a statement of `Suggested.lean`.
- Cross-roadmap citations resolved (29): 13 on main, 16 at open heads (PerfectoidQuotients, CrystallineCohomology, FiniteFlatGroupsAndIntegralPadicHodgeTheory, ArithmeticGaloisDuality, PadicPeriodRings, DerivedDeRhamCohomology, ClassicalAdicEtaleCohomology); all resolve except the title of R04. `ProEtaleSite.affinoidPerfectoid_basis` and `ProEtaleSite.proEtale_rootTorus_exists` are names of PerfectoidSpaces P7.16 on main.
- Pull request text: the title, the summary block and the prose agree with the head; the open suppliers named in the README are those of the description.
- Overlap check: read PrismaticCohomologyPartIV, PrismaticCohomologyPartIII, PrismaticCohomology, CohomologyComparisons, CrystallineCohomology, PerfectoidSpaces, EnhancedDerivedSheaves, AdicSpacesPartIV, PadicHodgeTheory; `Lη_I`, BKF modules, `AΩ`, the canonical `B_dR⁺`-deformation and Scholze's primitive comparison: here, imported by the Prismatic parts, CohomologyComparisons and PadicHodgeTheory §2.7; principal p-décalage and log regularity: CrystallineCohomology, cited; nothing has two owners.
- Source independence: 14 passages compared with 4 sources (bms1, ck, bms2, sch13), one following its source clause by clause (R02); largest share ČK, 332 of the 575 `ČK`/`BMS1`/`BMS2` locators, all in Layer AI.6; contents compared with ČK and BMS1: the ten layers are independent of both; inside AI.6, §§AI.6.1–AI.6.2 ↔ ČK §§1–3, AI.6.3 ↔ §4, AI.6.4 ↔ §§5, 9, AI.6.5–AI.6.6 ↔ §6 (with BMS1 §13), AI.6.7 ↔ §§7–8, an order the `*Needs:*` lines of §AI.6.7 force (see the last section).

## Not verifiable

- The Publ. IHÉS page numbers of BMS1 and BMS2 (for example lines 3982, 4191): only the arXiv texts were read; the statement numbers agree.
- Kato, *Toric singularities*, 2.1 and 11.6; Fujiwara–Kato I.10.1.2; EGA IV₂ 5.10.5; Stacks tags 0940, 0A07, 0944, 04D1: not opened; taken through ČK's own citations (ck lines 230–231, 269–270).
- Lodh, Lemma 1.3; Zav, Theorem 3.3.3; Nikolaus–Scholze IV.4.4; BMS2 Remark 11.16 (the dichotomy of line 4131): not opened.
- Targets outside the sample and the headline rows were read for statements, Checks and citation form, not recomputed.

## Source issues

- none

## For the human reviewers

- Arrangement: within Layer AI.6 the subsections follow ČK §§1–9 in order (pairs in the Source independence line), and ČK supplies 332 of 575 primary locators (`TauCetiRoadmap/AInfCohomology/README.md` lines 2665–3775).
- Wording: Layer AI.6 proof plans refer to ČK's equation numbers as if they were the roadmap's, for example "(7.6.2) of *Degreewise semistable specialization sequences*" (line 3694); only lines 2951 and 2965 were compared clause by clause (R02).
