# Review of CohomologyComparisons (pull request #1064 at b62daf6)

**Verdict:** accepted

**Summary.** Accepted: no finding. The new opening overview states the four main theorems with the hypotheses the layers and the sources give them, and the restated relative filtered comparison of §6.3 (derived sections taken after the period-sheaf extension) is the correct reading of Guo–Reinecke's sheaf statement; the fifteen sampled targets agree with their sources at the locators. There are two small corrections and one format note, none blocking, one question for the author, and one observation on wording left for the human reviewers.

## C01 — §§6.4–6.8 attribute to Betts–Stix a range over the general base `K`; their statements are over a finite extension of `ℚ_p`

A reader takes the trace, duality, cycle and Chern compatibilities over an arbitrary complete discretely valued `K` with perfect residue field to be the cited propositions, and they are not: Betts–Stix fix `K_v` as a finite extension of `ℚ_p` (bettsstix line 336, and Propositions 3.19–3.20 at lines 1366–1426 are stated for finite `L_w/K_v`). The README's `K` is the general one of Conventions, and the scope paragraph says "Betts–Stix's trace and cycle statements above are restricted to smooth proper algebraic varieties over `K`" (line 1412). The statements themselves are not in doubt, since the argument is formal from naturality, Künneth and the `P¹` normalization on the comparison of §2.13.

Smallest change: in §6.4 (line 1193) or in that scope sentence, say that Betts–Stix prove these for `K` finite over `ℚ_p` and that the extension to perfect residue field is this roadmap's, by the same argument applied to the comparison of §2.13.

## C02 — `prismaticSpecializationAgreement` is not a name PadicHodgeTheory uses

§§1.7 and 1.8 (lines 211, 217, 221, 227) and the supplier contract (line 1454) cite "PadicHodgeTheory §8.2's `prismaticSpecializationAgreement`", and Conventions says supplier names "are declared where the cited roadmap or library says". PadicHodgeTheory §8.2 on main states the target in prose only ("the prismatic specialization agreement target", its README line 1326, with the same hypotheses: bounded prism, `W(A/I)` p-torsion-free); the code-font name occurs in no roadmap and no library file, so a search for it finds nothing. The section and the content cited are right.

Smallest change: cite it as PadicHodgeTheory §8.2 (*prismatic specialization agreement*), without code font.

## N01 — One page locator in §2.24

Guo–Reinecke Theorem 6.4 begins on p.57 and its proof ends on p.58 (gr lines 2875–2945); the Sources line of §2.24 gives "pp.56–58".

## Questions for the author

- §4.8 states Beilinson's algebraic comparison only under the countable-residue hypothesis of Colmez–Nizioł, which is the standing hypothesis of the manuscript cited (cn5 lines 69–72). Is the restriction intended for the algebraic theorem too, or only for the Banach–Colmez arguments of §§4.9a–4.11? I did not open Beilinson's paper, so I could not check which hypotheses its own statement carries.

## Verified sound

Previous review (of 830e424): accepted with no finding, so there is none to check against this head.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Overview, crystalline comparison over `O_K` | bms Thm 1.1(i), 14.6(i) | `H_ét⊗B_cris≅H_crys(X_k/W(k))⊗B_cris`, Galois, `φ`, filtration; proper smooth formal, no projectivity | equal | none |
| Overview, torsion inequality and `ℤ₂` surface | `n=0`; bms Thm 14.5(ii), 2.1 | `n=0`: 0≤0; source: `length_W ≥ length_Zp` all `n`; `H²_crys,tor=𝔽₂`, étale free | equal | none |
| Overview, `C_st` with countable residue field | cn5 lines 69–72, Thm 6.4 | `k` perfect countable; `G_K`-equivariant `B_st` iso, `φ`, `N`; potentially semistable only | equal | none |
| Overview, degeneration over `C` | bms Thm 13.3; `P¹`, `b=1` | `E₁` and `E₂` degenerate; twist `(−b)`: `H²(P¹)=ℚ_p(−1)`, weight −1 | equal | none |
| 1.10 universal-coefficient sequence | `(ℤ,p,ℤ/p)`; `(ℤ/4,2,ℤ/2)` | degrees −1,0 both `ℤ/p`; `Tor₂^{ℤ/4}(ℤ/2,ℤ/2)=ℤ/2≠0`; derived quotient: only degrees −1,0 | Checks true; bms Lemma 4.16 p.38 | none |
| 2.21 coefficient functor | gr Prop 10.10, lines 4893–4914 | `D_perf(X_{p=0,crys})→D_perf(X/Y_inf)`, vector bundles preserved; map `D_pd→(D_pd[1/p])^∧_J` | equal, pp.97–98 | none |
| 2.24 analytic F-crystals | gr Def 3.5, Props 3.7–3.8, Thms 5.10, 6.4, A | bundle on `Spec A∖V(p,I)`, `φ` after `1/I`; embedding fully faithful; equivalence at `Spf O_K` | equal; one page off | N01 |
| 3.7 graded Beilinson square | `i=0`; `R=ℤ_p,i=1`; `𝔽_p` | `i=0`: bottom identity; `ℤ_p(1)(𝔽_p)`: `p−1` unit, 0; pullback of `0→ℚ_p←0` is `ℚ_p[−1]` | ammn Thm 6.17 pp.44–45; `N` depends on `i` only | none |
| 4.8 algebraic period comparison | cn5 Thm 6.2, fn 17, p.40 | any variety, `r≥0`; `B_st`-linear, `φ`, `N`, filtered `B_dR`; (6.3) with smooth Hom and duals | equal | question |
| 5.3 lattice recovery over `O_C` | bms Thm 14.5(iii) | degree `i` free: BKF iso and inclusion `⊃`; degrees `i,i+1`: equality | two levels equal | none |
| 5.4 recovery from `G_K`-lattice | bms Thm 14.6(iii), line 153 | `𝔖→A_inf`: `T↦[π♭]^p`, Frobenius on `W(k)`; `𝔖→W(k)`: `T↦0`, Frobenius | equal | none |
| 5.6 mod-p bound | bms (1), p.3 | `dim_k H^i_dR(X_k) ≥ dim_Fp H^i_ét(X_C,𝔽_p)` | equal | none |
| 5.9 log de Rham lattice | ck §8.5, Thm 8.7 | `L_dR=(M(T)⊗_θ O_C)^G`; `H^i,H^{i+1}_logdR` free ⇒ `L_dR=H^i_logdR` | equal, pp.73–74 | none |
| 5.10 small weights | `p=2` | `[0,p−2]=[0,0]`; bms §4.4 at pp.43–44 gives `𝔖→A_inf` | interval and locator right | none |
| 5.12 truncated lengths | `ℤ/p²`, `(ℤ/p)²` | `n=1`: 1,2; `n≥2`: 2,2; inequality étale ≤ crystalline holds | equal | none |
| 5.13 non-determination | bms Remark 2.4, p.15 | `D`: `H²_ét` torsion-free; `D′=S×E`: 2-torsion; same special fibre | equal | none |
| 6.2 canonical subgroups | `p=2,m=1,ε=0`, `R′={a≡b mod 2}` | `s=(−1,1)∈μ₂(R′)`; `s−1=(−2,0)∉√2R′`; exponents `m=1`: 1, `m=2`: `p+1` | README's inclusion-only form right | none |
| 6.2 flag basis | `U₁∩U₂`; `∅`; pan2 lines 818–826 | annulus `|x|=1` in basis; nullary intersection `P¹` excluded; three properties as source | equal, Pan II p.19 | none |
| 6.3 relative filtered comparison | identity, `T=ℤ_p`; `U=Spa(L,O_L)` Gauss point | sheaf form: `B_dR(A)` both sides; fibrewise form: `H¹=Hom(G_L,ℤ_p)⊗B_dR≠0` | README form true; source's section form not | none |
| 6.3 Check, `K=ℚ_p(√p)` | `b²=p` in `A_inf` | `b̄²=0` in domain `O_C^♭` ⇒ `b=pz` ⇒ `pz²=1`, impossible | true | none |
| 6.4a de Rham trace | `P¹`; `Spec L`, `[L:K]=2` | `tr c₁(O(1))=1`; `Tr_{L/K}(1)=2`; degree-`m` point trace `m` | Checks true; bettsstix pp.27–28 | C01 |
| 6.8 projective-bundle relation | rank 1; `L⊕M` | `h−c₁`; `h²−(l+m)h+lm=(h−l)(h−m)` | quotient-line sign consistent | none |
| 6.10 export | bms Thm 14.1 p.118; §1.2 p.6 | four specializations listed at lines 251–258 | locators right | none |
| 6.13 flag descent | pan2 Lemma 7.2.6, lines 5085–5099 | (1) for any p-complete torsion-free `M`; (2) `R^iπ_HT,*=0`, `i≥1` | equal, p.120 | none |
| 4.5 monodromy transport | `N e₁=e₀`; `e=2` | `exp(−cN)e₁=e₁−ce₀`; `(2ℓ)(N/2)=ℓN`; `Nφ e₁=pe₀=pφN e₁` | sign and scaling consistent | none |
| 0.1 dictionary | primitive `ε`; `ε=1`; `ε′=ε^p` | `θ(ξ)=0`, `w(ξ)=p`, `θ(ξ̃)=p`; `μ=0`; `ε′^{1/p}` untilts to 1 | consistent | none |
| 1.7–1.8 supplier citation | PadicHodgeTheory §8.2 on main | target present in prose, same hypotheses; code-font name absent everywhere | section right, name not | C02 |

- Source locators read against the text, each with its page marker: 75 (bms 17, gr 21, ck 6, cn5 8, ammn 9, bettsstix 3, pan2 6, pan1 5); 74 agree, one page range is off by one (N01).
- Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, equal to `lake-manifest.json`): `AdicCompletion.isAdicComplete` (`Mathlib/RingTheory/AdicCompletion/Completeness.lean:181`), `AdicCompletion.evalₐ` (`.../Algebra.lean:132`), `IsAdicComplete.liftRingHom` (`.../RingHom.lean:48`), `AdicCompletion.ext_evalₐ` (`.../Algebra.lean:171`), `WittVector.fontaineTheta` (`Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166`), `BDeRhamPlus` (`.../BDeRham.lean:75`), `WittVector.frobeniusEquiv` (`Mathlib/RingTheory/WittVector/Frobenius.lean:283`), `IsNilpotent.exp_add_of_commute` (`Mathlib/RingTheory/Nilpotent/Exp.lean:77`), `inter_mem_spaRationalFamily` (`TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basis.lean:250`).
- Statability: the pinned Tau Ceti has affine `Spf` only (`TauCeti/AlgebraicGeometry/FormalScheme/Spf`) and de Rham cohomology of manifolds only; neither library has crystalline, prismatic, Hyodo–Kato or rigid analytic cohomology, nor algebraic de Rham cohomology of schemes. No headline is statable; the module docstring names each family and what it lacks.
- Cross-roadmap citations resolved on main (74dd064): 11 AInfCohomology target titles, PrismaticCohomologyPartIII §§6.8–6.9, 7.0, 7.1, 7.5, 7.8–7.10, 7.13, 7.22 with the nine `Prismatic.*` names, PartII §§5.23–5.25, PartIV §§8.35, 8.41–8.42, 8.56, 8.60, 8.69, CompletedCohomologyPartII §§4.5, 8.4, 8.6–8.7, ModularCurvesPartII `contractionMapsBetweenLevels`, `fixedPairingIntegralComponents`, FiniteFlatGroupsAndIntegralPadicHodgeTheory `illusieObstructionHomomorphisms`, PerfectoidSpaces P3.21, CrystallineCohomology CR.3.5, CR.3:Frobenius-isogeny.1; all found; one name not found (C02).
- Automatic checks, run again on this head: every text scanner 0; dependency check `depcheck: 169 roadmaps, 1994 edges, 0 problem(s)`, no UPWARD or CYCLE line. No change outside the folder against the base.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so the binder check and the one-tactic probe have nothing to test.
- Title and description against the head: adds a new folder of three files; "declares nothing"; the four main results, the three consumers and the Mathlib coefficient rings all hold; no sentence contradicted.
- Arrangement: of about 87 locator lines in the layers, bms has about 48. Its contents (§§2–14) against Layers 0–6: Layer 1 draws on §§8, 9, 12, 14, Layer 2 on §13, Layer 3 on §§13–14, Layer 5 on §§2, 4, 14; no run of layers follows a run of sections. §§2.1–2.11 follow the order of the statements inside bms §13 (13.5 to 13.19, then 13.1); that order is forced, each construction being the input of the next (envelope, approximation, lift, normal form, independence, spreading, definition, finite freeness, period map, comparison), and these subsections only record AInfCohomology §AI.6.5.

Overlap check: read AInfCohomology, PrismaticCohomologyPartIII, PrismaticCohomologyPartIV, PadicHodgeTheory (main) and HodgeTateAndCanonicalSubgroups, HabiroCohomologyFoundations, ProetaleCohomologyOfPAdicCurvesAndTowers, RefinedTraceMethodsPartII, GaloisSectionsPadicPeriodMaps (open); nothing shared. Each open one cites this roadmap as a consumer (§§0.4, 2.15, 4.5, 4.9a, 6.1, 6.2, 6.4–6.7, 6.10). PadicHodgeTheory §§7.2, 8.1 own Hodge–de Rham degeneration and the rational maps for a finite base; §§2.14–2.15 here are the statements over `C` and §3.4 names the agreement. The abelian-family canonical subgroup of §6.2 has this roadmap as sole owner: HodgeTateAndCanonicalSubgroups and AutomorphicBundles import it. The open revision of CrystallineCohomology drops no id cited here.

Source independence: 18 passages compared with 9 sources (bms, ck, gr, ammn, cn5, bettsstix, pan1, pan2, scholzetorsion), none copied; closest is the trace sentence of §3.7 beside ammn lines 1993–1999, the same four steps in the same order with a longest shared run of 7 words (a standard phrase), reported to the human reviewers; largest share bms, about 48 of 87 locator lines; contents compared with bms: independent. The Annals text of scholzetorsion could not be read; its arXiv version was.

Research link: Layers 3–5 are the comparison theorems of Bhatt–Morrow–Scholze (2018), Česnavičius–Koshikawa (2019) and Colmez–Nizioł (2025); Layer 2 and §6.3 those of Guo–Reinecke (2024); §§6.11–6.15 the comparisons Pan (2022, 2026) uses for locally analytic vectors of completed cohomology. Rests on the README's references and the texts read.

## Not verifiable

- The Annals pagination of Scholze, *On torsion in the cohomology of locally symmetric varieties* (pp.971–972, 975–979, cited in §6.2): the publisher's copy could not be fetched as a classified legal source. The statements were checked in arXiv:1306.2070v2, III.1.2 and III.2.1–III.2.8, whose numbering corresponds to 3.1.2 and 3.2.1–3.2.8.
- Diao–Lan–Liu–Zhu, Koshikawa, Koshikawa–Yao, Guo, Colmez–Dospinescu–Nizioł, the second Bhatt–Morrow–Scholze paper and Colmez–Nizioł I: cited only by targets outside the sample and not opened this round.

## Source issues

- **Error** in gr at Theorem 10.13, printed p.99: the source says the étale side is the cohomology of the fibre over the perfectoid base, tensored with the period ring over the sections of the constant sheaf; it should be the sections over the base of the completed tensor of the direct image with the period sheaf, as its Remark 10.14 has it; affects a stated result.

The error at Corollary 3.2.6 of Scholze's torsion paper (the point description of the canonical subgroup over a test ring that is not integrally closed), recorded by the first review of this roadmap, stands; the README states the corrected form.

## For the human reviewers

- **Licence.** In §3.7 (README line 646) the description of the trace map on graded pieces makes the same four steps in the same order as ammn Construction 6.16 (lines 1993–1999); longest shared run 7 words, "left Kan extended from p-complete polynomial algebras".
- **Not tested.** The Annals pagination of Scholze's torsion paper cited in §6.2 was not read; the theorem numbers and statements were checked in its arXiv version.
