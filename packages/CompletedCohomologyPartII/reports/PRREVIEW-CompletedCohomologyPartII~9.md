# Review of CompletedCohomologyPartII (pull request #2547 at 393e53e)

**Verdict:** accepted

**Summary.** Accepted. This head is the one the previous review read, and a second full pass finds no false statement: every Check and worked example was recomputed, the fifteen sampled targets and the four headline theorems agree with their sources at the stated locators, every supplier section and library declaration resolves, and `completedHecke_decomposition` elaborates and is not closed by one tactic. There are two small corrections (the misplaced "these constructions" of the previous review, still present, and a section range in §6.7 that disagrees with its own *Needs:* line) and one format note; none blocks. One licence question is left for the human reviewers.

## C01 — In the PadicLocalLanglandsForGL2Qp supplier contract, "these constructions" now points at the locally analytic vectors, not at the two dualities

In the "From TauCetiRoadmap.PadicLocalLanglandsForGL2Qp" paragraph (line 2014) the last two sentences read "Section 0.1 also gives the locally analytic vectors … F.4 above imports them. F.1 and §3.1 above write `D_t` and `D_O` for these constructions." A reader takes `D_t` and `D_O` to name the locally analytic-vector constructions, whereas §3.1 (line 608) defines them as the compact–discrete duality of §0.3 and the Schikhof dual of §0.1. This is the small correction of the previous review; the head has not changed since.

Either move the `D_t`/`D_O` sentence before "Section 0.1 also gives the locally analytic vectors", or write "for the two dualities" in place of "for these constructions".

## C02 — §6.7 cites LocallyAnalyticDistributions "§§0.0–0.3", a range that includes §0.2, which no other line uses and the description says was dropped

In the statement of §6.7 (line 1368): "constructed in F.4 on the carriers of LocallyAnalyticDistributions §§0.0–0.3". The *Needs:* lines of F.4 (line 117) and of §6.7 (line 1379), the Dependencies of Layers F and 6 (lines 142 and 1387) and the supplier contract (line 2022) all say §§0.0, 0.1 and 0.3, and the description says "LocallyAnalyticDistributions §0.2 is dropped." That roadmap has a §0.2 on main ("Strict sequences and three-space properties", its README line 1081), so the range names a supplier section that the dependency lines exclude, and an implementer cannot tell whether F.4 uses it.

Write "§§0.0, 0.1 and 0.3" at line 1368; or, if the strict sequences of §0.2 are in fact used by the strict derived category of F.4, add §0.2 to the two *Needs:* lines and the contract instead.

## N01 — A page number is set in code font

In "Further source corrections" (line 2094), "Remark 5.4.3, p. `57`": the page number would read as plain text, like the other locators.

## Verified sound

| # | Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|---|
| 1 | 1.5 tame-level variation | two-point tame cover, `R=O/ϖ^s`; `ℤ₂` tame tower, `O=ℤ₃`; circle double cover, `p=3` | pullback `a↦(a,a)`, trace `a+b`, composite 2; `f(0)−f(2^r)=Σ_{n>r}3^n≠0`; `H¹`: res 2, tr 1; `H⁰`: res 1, tr 2 | holds; E06 line 1535, CE line 305 | none |
| 2 | 2.4 admissible-complex control | `O --ϖ→ O` | `H⁰=0`; `H⁰(S/ϖ^s)=ϖ^{s−1}O/ϖ^s≅k`, transitions 0, so essentially null, limit 0; `H¹=k` both sides | holds; E06 lines 721, 764–769 | none |
| 3 | 2.5 complete torsion-free control | `M=O`; `[O→O]`; `M=E`; `c₀` with `d(e_n)=ϖ^n e_n` | `dy=x̃_0−lim ϖ^N x̃_N=x̃_0`; `ϖK=K` from `x=ϖ(ϖ^k y)`; `lim E/ϖ^n=0≠E`; `w−d(Σ_{n<k}e_n)∈ϖ^kM¹` | all four clauses hold; Pan22 lines 2117–2137 | none |
| 4 | 3.17 definite degree zero | `D_O(O/ϖ)`, `D_t(O/ϖ)` | `Hom_O(k,O)=0`, `Hom_O(k,E/O)=k`; LLHLM line 5380 covariance `f(gu)=u⁻¹f(g)`; line 5460 Pontryagin dual | holds | none |
| 5 | 4.6 stabiliser replacement | point with `C_p` over `k`; `C₂`, `p` odd | `H^i(C_p,k)=k` for all `i≥0`, unbounded; `k[C₂]` semisimple, trivial summand projective | holds; E06 line 1242, GN lines 313–323 | none |
| 6 | 5.2 bounded torsion | `Λ⊕Λ/ϖ^a`; chain `M[ϖ^n]` | torsion killed by `ϖ^a`; ascending chain stabilises by noetherianity; `O --ϖ→ O` has `H¹=k` | holds; CE lines 94–103, E06 line 585 | none |
| 7 | 6.2 fixed-exponent descent | point regular tower; circle, `U=ℤ_p` | `H^i(U,C^∞(U,O/ϖ^s))=0`, `i>0`, `H⁰=O/ϖ^s`; circle `A¹_s=0`, `H¹_cts(ℤ_p,O/ϖ^s)=O/ϖ^s=H¹(S¹)` | holds; E06 (2.1.10), line 1183 | none |
| 8 | 6.6 lowest-degree recovery | circle, `n=0` and `n=1` | `n=0`: `O→O^U=O` iso; `n=1`: `H̃⁰=O≠0`, hypothesis fails, edge `O→H̃¹=0` is zero | holds; E06 line 1219 | none |
| 9 | 6.7 derived analytic recovery | `H` trivial; `W=V_κ^∨` | `RLA=id`, `𝔤=0`, both sides `RΓ(Y,W)`; BCGP line 4551 has `RHom_𝔤(V_κ,−)=colim RΓ(V_κ^∨)`, same variance | holds; E06 line 1687 is only a spectral sequence | none (C02 on its citation) |
| 10 | 7.2 support sequence | compact quotient; `ℤ` tower with transitions `p` | `H̃_∂=0`, `H̃_c=H̃`; `lim=0`, `lim¹=ℤ_p/ℤ`, so the hypothesis is needed | holds; CE (1.3), line 287 | none |
| 11 | 8.4 realisation comparisons | two points; open curve | `H⁰=R²`, both idempotents kept; `H⁰_c=0≠R=H⁰`; Scholze line 2942 `j_!`; Milne line 5007 | holds | none |
| 12 | 8.7 transported actions | `C₂` sign, `p=2`; two shears; product of finite discrete representations | `−1≠1` in `O`, equal mod 2; `AB=[[2,1],[1,1]]≠BA=[[1,1],[1,2]]`; coordinate stabilisers open, common kernel not | holds; GN lines 487–489 | none |
| 13 | 8.8 finite derived image diagram | `k[x]` with `x=0`, `x=1`; zero complex | images `k[x]/(x)`, `k[x]/(x−1)`; an `H`-map forces `0=1`; zero complex gives the zero ring | holds; GN lines 457–478 | none |
| 14 | 8.12 residual projectors | `O×O`; `T={a≡b mod ϖ}` | idempotents `(1,0),(0,1)`; in `T`, `(1,0)` needs `1≡0`, so only `0,1` | holds; GN lines 490–495 | none |
| 15 | 8.13 residual localisation | `O×O`, `e=(1,0)`; `e=0`; `e=1` | range `O×{0}=ker(1−e)`, closed; `0`; all of `M` | holds; GN lines 812–817, 1111–1113 | none |
| 16 | Headline: chain model (4.2–4.4) | procyclic circle, `U=p^rℤ_p` | `𝒫=[Λ --(γ−1)→ Λ]`, `H₀=O`, `H₁=0`; coinvariants `O[ℤ/p^r]`, `H₁=O·N` (norm), `H₀=O`: the finite circle | holds | none |
| 17 | Headline: finiteness and torsion (5.1, 5.2, 5.7) | `Λ/(γ−1)`, `Λ/ϖ`, `Λ`; `SL₂/ℚ` | ranks 0, 0, 1; grades 1, 1, 0; `d=3`, `dim X=2`, middle `n=1`; `H̃₀=O` rank 0 | holds; CEbounds lines 186–233, CE lines 267–274 | none |
| 18 | Headline: Hochschild–Serre (6.1) | circle, `U=ℤ_p` | `E₂^{0,0}=O`, `E₂^{1,0}=Hom_cts(ℤ_p,O)=O`, row 1 zero; abutment `H⁰=H¹=O` | holds; integral form at E06 line 1219 | none |
| 19 | Headline: semilocal decomposition (8.11, Lean) | `F_s=(ℤ/p^s)²`, `A₀=𝔽_p²`; `F_s={a≡b mod ϖ}⊂(O/ϖ^s)²`, `A₀=k`; `A₀=0`; parallel arrows | `ℤ_p²`: 2 maximal ideals, factors `ℤ_p`; second local; `A₀=0` forces `F_j=0`, empty spectrum, one-point product; `F(g)=F(h)` by surjectivity | true | none |
| 20 | `Localization.ringTopology` in 8.11 | `ℤ_p²→ℤ_p`; instance at the pin | projection open, quotient topology is p-adic and a ring topology; `inferInstance = Localization.ringTopology.toTopologicalSpace` by `rfl` | holds | none |
| 21 | One-tactic probe of `completedHecke_decomposition` | `simp`, `rfl`, `infer_instance`, anonymous constructor with `simp`, `aesop`, `simp_all`, `exact?` | all fail; `exact?` proposes only the sorried theorem itself | not padding | none |
| 22 | Corrections E1–E5 | circle; `(p,T)`; weighted `ℤ_p²`; `U={1}`; Pan22 | CE line 105 whole `H̃_{•−1}`: `Hom(ℤ_p,ℚ_p/ℤ_p)≠0=H̃¹`; line 514; `p^r` vs `p^{3r/2}`; line 216, `Ext¹_O(k,O)=k`; Pan22 line 2130 | all five confirmed in the texts | none |
| 23 | F.5 rank criterion and CEbounds normalisation | `Λ/(γ−1)`; `C(K,E)`; restriction `U⊃V` | `Hom(Λ/f,Λ)=0`, `Ext¹=Λ/f`; invariants `[K:U_r]`, rank 1; rank × `[U:V]` | holds; CEbounds lines 118–121, 128–130 | none |
| 24 | 3.9 normalised duality square | `K'⊂K`, zero-dimensional tower | `μ(K')h_{K'}(tr x)(f)=μ(K)[K:K']⁻¹h_K(x)(cor f)=μ(K)h_K(x)(e_K f)`; coset `gK ↦ ∫_{gK}f dμ` | commutes | none |
| 25 | PadicLocalLanglandsForGL2Qp contract | sentence order at line 2014; line 608 | "these constructions" follows the analytic-vector sentence; line 608 defines `D_t`, `D_O` as dualities | referent displaced | C01 |
| 26 | Description against head and main | Check counts; pins; removed names | 235 Checks at head, 305 on main; pins `1b1ccf4b`, `2fd255d9`; the four roadmaps not on main and `DualitySupport` absent | consistent, except §0.2 | C02 |

- Source locators checked against the text: 46, in 9 sources (E06, CE, GN, Pan22 arXiv v3, LLHLM, BCGP, Scholze, MilneEC, CEbounds), covering all fifteen sampled targets and the four headline theorems; none disagrees.
- Library declarations: the 32 Mathlib names the README cites resolve by `#check` in one probe file at the pin; the 52 Tau Ceti names were opened in the pinned sources, each in the file the README states (for example `TauCeti/Algebra/Category/ModuleCat/Tower/Exact.lean` lines 213 and 226, `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean` line 322, `TauCeti/Algebra/Category/ModuleCat/AB.lean` line 33).
- Cross-roadmap citations resolved on main (`1b7b481`): 94 section or layer headings in 17 roadmaps, and the folders of ProfiniteCohomology and ProfiniteProPGroups, all present (ProfiniteProPGroups is under `Completed/`); the three `CanonicalTower.*` names are ShimuraVarieties' own proposed names in its README. No other roadmap, on main or open, cites an id this pull request removes.
- Dependency check with `--movable`: `depcheck: 200 roadmaps, 2207 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- Automatic checks rerun: every check 0, OK. Nothing changed outside the folder.
- Elaboration of `Suggested.lean`: one warning (`60:8 declaration uses sorry`). The elaborated type of `completedHecke_decomposition` carries `IsCofiltered`, finiteness, discreteness, `hs`, `hq` and `hr`, the hypotheses of 8.11; no binder is lost.
- Previous review (accepted, of this same head): its findings of the review before it stay repaired (`Suggested.lean` lines 57–59, F.4 at line 106, lines 1442, 1467 and 1910); its one small correction is not repaired and is C01 above.
- Overlaps: no other open pull request changes this roadmap, no cited id is dropped, and no id is defined only by an open revision.

Overlap check: read CompletedCohomologyAndLocalGlobalCompatibility, TorsionCohomologyInfrastructure, AutomorphicBundlesPartII, CompletedCohomologyAndLocalGlobalCompatibilityPartII and HilbertModularVarietiesAndShimuraCurvesPartII (open), and SelmerIwasawaCohomology, NoncommutativeAndEquivariantIwasawa and HilbertModularVarietiesAndShimuraCurves (main); nothing shared. The open ones consume this roadmap by section (F.1, F.2, F.4, Layers 1–3, 5 and 8); NoncommutativeAndEquivariantIwasawa exports to §§0.1, 3.11, 5.1, 5.5 and F.2 here; AutomorphicBundlesPartII and SelmerIwasawaCohomology do not mention it. The third list is empty. The limit multiplicity theorems of §5.6 are stated by no other roadmap on main.

Source independence: 24 passages compared with 9 sources, none shared beyond formulas and forced hypothesis lists (longest common run 6 words, the hypothesis list of 2.5 against Pan22 line 2117); largest share E06, 40 of 176 locators (CE 36, GN 28); contents compared with E06 (§§1.1–1.2, 2.1–2.4, 3, 4): independent, since its §2.1 is split over Layers 1, 2, 4 and 6 and its §§2.3, 3 and 4 are not used.

Research link: Layers 2–6 state Emerton's (2006) completed cohomology and the finiteness, torsion and descent theorems of Calegari–Emerton (2009, and their survey); Layer 8 is the completed Hecke algebra of Gee–Newton. Scholze (2015), Pan (2022), Fu (2024) and Boxer–Calegari–Gee–Pilloni (2025) use them. Rests on the README's References and on E06, CE, CEbounds, GN, Pan22, Scholze and BCGP as read.

## Not verifiable

- Pan22 Lemma 4.4.4 at its published pages 44–45: the sources service returns arXiv v3 for the DOI, where the lemma is on p. 48; the published pagination was not read.
- Locators outside the sample in ST, Venjakob, Marshall, Fu, BP, Nakamura, E11, MilneSV and PanII were not opened this round.

Automatic checks set aside as false positives: the change summary counts one added Lean declaration named "for", and the signature extraction lists it with a parse error; both come from the docstring line of `Suggested.lean` that begins "theorem for semisimple congruence towers", which is not a declaration.

## Source issues

- **Error** in CE at Theorem 1.1(3), p. 3: the source says the first sequence starts with the `ℚ_p/ℤ_p`-dual of all of `H̃_{•−1}`; it should be the dual of its torsion submodule, since the circle tower gives a nonzero term inside `H̃¹=0`; affects a stated result.
- **Error** in CE at the proof of Lemma 1.17, p. 14: the source says that for `p`-torsion-free `M` the `Ext` groups reduce modulo `p` isomorphically onto the residual `Ext` groups; it should be a Bockstein sequence with an adjacent `Ext[p]` term (`M=(p,T)` gives cokernel `𝔽_p`); affects the proof.
- **Error** in CE at Theorem 1.18, p. 14: the source says the growth exponent holds for the arbitrary normal basis `G_r` of its setup; it should be for a uniform-power filtration, since `p^rℤ_p×p^{2r}ℤ_p` gives `p^r`, not `p^{3r/2}`; affects a stated result.
- **Error** in CE at §1.3, p. 6: the source says the amplitude of the `Ext` functors is `dim G_0`; it should be `dim G_0 + 1` integrally, since `Ext¹_{ℤ_p}(𝔽_p,ℤ_p)≠0` for the trivial group; affects a stated result.
- **Misprint** in Pan22 at the proof of Lemma 4.4.4, arXiv v3 p. 48: the source says the limit of the `H^{i+1}[p^n]` is `Hom(ℚ_p/ℤ_p, H^i)`; it should be `Hom(ℚ_p/ℤ_p, H^{i+1})`; affects nothing.
- **Gap** in GN at the proof of Lemma 2.1.14, p. 11: the source says nilpotence of the radical's image at every finite level makes the algebra radical-adically complete; this needs the powers of the radical to be closed, which is not argued; affects nothing (8.11 claims only the inverse-limit topology).

## For the human reviewers

- Licence: E11 (Emerton, the local–global compatibility manuscript of 23 March 2011) is listed in the References (README line 2060) as unpublished and read from the author's page; F.1 and §§3.13–3.16 cite its Appendices B and C.
