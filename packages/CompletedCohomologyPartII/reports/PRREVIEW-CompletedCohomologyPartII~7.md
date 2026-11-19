# Review of CompletedCohomologyPartII (pull request #2547 at 3da9581)

**Verdict:** needs changes

**Summary.** Changes are needed. The mathematics holds up: the sampled statements and Checks are true when computed, and the sampled source locators say what the README credits them with, apart from one gloss. Both findings are about ownership. `Suggested.lean` declares a second global topology on `Localization`, a type Mathlib already topologises. F.4 re-defines the locally analytic vectors of Banach representations, which PadicLocalLanglandsForGL2Qp §0.1 on main already owns. There are three small corrections and no format notes; one licence question is left for the human reviewers.

## R01 (P2) — `Suggested.lean` gives `Localization.AtPrime` a second global topology, though Mathlib already topologises every localization of a topological ring

With two unequal topology instances on one type, the meaning of the headline depends on which one Lean selects. An implementer then cannot use Mathlib's localization topology API on the local factors.

Mathlib at the pin already declares `instance : TopologicalSpace (Localization M)` and `instance : IsTopologicalRing (Localization M)`, both via `Localization.ringTopology`. That is the finest ring topology making `R → Localization M` continuous (`Mathlib/Topology/Algebra/Localization.lean`, lines 34–41). `completedHeckeLocalTopology` (`Suggested.lean` line 56) adds a second global instance on the same type, defined as the coinduced topology. I checked this on a scratch copy:

- `#synth TopologicalSpace (Localization.AtPrime m.asIdeal)` returns `completedHeckeLocalTopology F m`, so the theorem uses the roadmap's instance.
- Neither `rfl` nor `with_reducible_and_instances rfl` identifies it with `Localization.ringTopology.toTopologicalSpace`.
- With the instance deleted, the file elaborates unchanged against Mathlib's instance, and the `IsTopologicalRing` conjunct then holds by `inferInstance`.

The theorem is true under either topology. Here `T̂ → T̂_m` is surjective (`T̂` is the product of its local factors), and the quotient topology of a topological ring is already a ring topology, so the two topologies agree. This also means the README's "with the two definitions it needs" (line 1924) and the description of `completedHeckeLocalTopology` at line 1742 overstate the need: only `completedHecke` is required.

**Fix.** Delete the instance and state `completedHecke_decomposition` against Mathlib's topology; the `IsTopologicalRing` conjunct can stay or go, since it is now automatic. At lines 1742 and 1924 and in the module docstring, say that the factors carry Mathlib's `Localization.ringTopology`, which here equals the quotient topology from `T̂`. List `Localization.ringTopology` under "From Mathlib".

## R02 (P2) — F.4 defines the locally analytic vectors of Banach representations, which PadicLocalLanglandsForGL2Qp §0.1 on main already owns, and never cites it

Two roadmaps on main now construct the same functor on admissible Banach representations, each with its own API. A consumer (§6.7 here, and the roadmaps that cite F.4) cannot tell which one to use, and the exactness F.4 asks for is already a target there.

PadicLocalLanglandsForGL2Qp §0.1 (its README line 228) defines "the locally analytic vectors of Π by locally analytic orbit maps with its natural locally convex topology". It also proves density, exactness, admissibility and the base-change identification on admissible Banach objects. Its Check at line 234 is the same `C(ℤ_p, L)` test as F.4's second Check (line 113). F.4 (line 106) defines the same vectors "by locally analytic orbit maps H → V", with their topology and API, for continuous representations that include the Banach ones. None of the following mentions §0.1's vectors:

- F.4 itself;
- its *Needs:* line (117);
- the PadicLocalLanglandsForGL2Qp paragraph of Scope and ownership (line 1902).

PadicLocalLanglandsForGL2Qp comes earlier in the merge order, so the citation belongs here.

**Fix.** In F.4, say that on admissible unitary Banach representations the functor is PadicLocalLanglandsForGL2Qp §0.1's, with density and exactness taken from there. Keep as F.4's own what §0.1 lacks: the extension beyond Banach representations to the strict locally convex categories, and the derived functor. Add §0.1 to F.4's *Needs:* line and to line 1902.

## C01 — The CE glosses at 7.4 and 7.5 credit Calegari–Emerton p. 8 with an image and kernel-system argument that page does not contain

CE §1.5, p. 8 states only the support long exact sequences (1.2) and (1.3) (CE lines 285–287). It defines no interior cohomology and applies no inverse-limit sequence to a kernel system. Yet the gloss at line 1442 reads "The interior term is an image of the support map; its tower comparison must retain inverse-limit errors", and the one at line 1467 credits CE with controlling the image through its kernel system.

Statement 7.5 is true and is proved by its own route. On its own example, `coker(lim ℤ → lim ℤ/p^s) = ℤ_p/ℤ = lim¹ p^sℤ`. **Fix:** cite CE (1.3) only for the support sequence whose image is taken, and present the lim–lim¹ argument as the roadmap's own, with the Tau Ceti six-term sequence it already lists.

## C02 — "The étale six operations belong to EtaleCohomologyFoundations (§F.5)" cites only the section on `f^!`

Line 1910. In EtaleCohomologyFoundations, §F.5 is "Exceptional inverse image and duality", while lower shriek is in §§0.8 and F.2.4. That roadmap's own downstream paragraph (its README line 2278) says that §§F.0.3, F.2 and F.5 supply the six operations. The citation would read "§§0.8, F.2 and F.5", or would name the roadmap without a section.

## C03 — The description leaves out two relocations and one new contract

The list after "Each item now sits in the subsection that uses it" covers G2, G3, G5–G8, G10, G12 and the two F.3 contracts. It omits:

- G1: its imports now sit in §§0.1, 3.11, 5.1 and 5.5, and its Ore-rank and growth targets in F.5 and §5.8;
- G4: the noncommutative completed-tensor verification is now in §3.12.

"What is added" names the From Tau Ceti, ShimuraVarieties and HilbertModularVarietiesAndShimuraCurves contracts, but not the new From TauCetiRoadmap.ProfiniteCohomology contract (README line 1981). One bullet each would do, for example "G1 is now in §§0.1, 3.11, 5.1, 5.5, F.5 and 5.8, G4 in §3.12" and "a ProfiniteCohomology contract for the discrete-coefficient cohomology of §6.2".

## Verified sound

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | 0.1 level index | `K_0=ℤ_p^d`, `d=0`; `p=2`; `pℤ_p, p²ℤ_p` | `[U:U^{p^r}]=p^{dr}`, `d=0` constant; refinement `p²ℤ_p`; powerful at 2 needs `U⁴`; ST p.13, Venjakob p.18 checked | holds | none |
| 2 | 0.4 non-neat realisation | point, stabiliser `C_p`, over `k` | `H¹(C_p,k)=Hom(C_p,k)=k≠0`; averaging needs `1/p=0`; GN pp.7–8 good levels; E06 line 1329 smallness | holds | none |
| 3 | 1.2 smooth action | `(gf)(x)=f(xg)`; `H=ℚ_p^×`, `W_0=O` | `g(hf)=(gh)f` checked; `p` nilpotent on `O/ϖ^s`; E06 Lemma 2.2.10 proof uses `g⁻¹W_0` (line 1501) | holds, convention matches | none |
| 4 | 2.5 complete torsion-free control | `[O→ϖO]`; `M=E`; `d(e_n)=ϖ^n e_n` | `H⁰=0`, `H⁰(M/ϖ^n)≅k`, transitions 0; `lim E/ϖ^n=0≠E`; `w=Σϖ^n e_n∈∩ϖ^kH¹`, nonzero; Pan v3 p.48 | holds; E5 confirmed | none |
| 5 | 2.7 completion and Tate module | `B=O, E/O, O/ϖ^a`; `p=uϖ^e` | `Ĥ`: `O,0,B`; `T_ϖ`: `0,O,0`; `y_s=u^{-s}t_{es}` is `p`-compatible; CE p.4, E06 (2.1.2) p.21 | holds | none |
| 6 | 3.14 coefficient-module duality | `V=c₀(ℕ,A)`; cofinitely generated `X` | `V*=A^ℕ` product topology (E11 B.5 p.100, B.11 p.102); C.5 p.104; Nakamura p.90 assumes `O`-torsion-free `A` | holds | none |
| 7 | 3.17 definite degree zero | `D_O(O/ϖ)` | `Hom_O(O/ϖ,O)=0`; `S(U,W)`, `S̃` on LLHLM p.121; (5.8) p.123 is a Pontryagin dual | holds | none |
| 8 | 4.1 lifted cellular tower | point torsor; procyclic circle | `O[K_0/U]` in degree 0; `C₁=C₀=Λ`, `d=γ−1`; E06 pp.22–24 profinite cell torsors; Thm 2.1.12 p.26 | holds | none |
| 9 | 4.4 derived coinvariants | circle, `U=p^rℤ_p`; `K_0=1`, `W_0=O²` | coinvariants `O[ℤ/p^r]→(γ−1)`, `H₁=O` (norm) while `H̃₁=0`; twist rank 2 not 4; GN p.8; Fu (38) p.23 | holds | none |
| 10 | 5.1 finite generation | `U={1}`; `U=ℤ_p` | rings `O,k`; `Λ/(γ−1)≅O` finite, nonzero torsion over a domain, so not projective; ST Prop 3.1 p.13; CE Thm 1.1(1) p.3 | holds | none |
| 11 | 5.2 bounded torsion | `Λ⊕Λ/ϖ^a`; admissible cohomology | torsion killed by `ϖ^a`; E06 Def 1.2.1(i) p.13 bounded exponent; Prop 1.2.4 pp.13–14; CE 1.1(2) p.3 | holds | none |
| 12 | 6.5 classical edge map | circle, `U=ℤ_p` | `H¹(Y_U,E)=E`, `H̃¹(E)=0`, so edge 0; `E₂^{1,0}=Hom_cts(ℤ_p,E)=E`; E06 Thm 2.2.11(v) p.31 | holds | none |
| 13 | 7.5 interior image | `A_s=ℤ`, `I_s=ℤ/p^s`, `K_s=p^sℤ` | `coker(ℤ→ℤ_p)=ℤ_p/ℤ=lim¹K_s`; `A`, `I` Mittag-Leffler, `K` not; CE p.8 has only (1.2)–(1.3) | true; gloss wrong | C01 |
| 14 | 8.2 canonical tower input | `GL₂` levels 3, 9 | `|ker GL₂(ℤ/9)→GL₂(ℤ/3)|=81`; components 2 and 6; `81/3=27=|Γ(3)/Γ(9)|`; MilneSV 5.24 p.63, 5.28–5.29 p.65, 12.10 p.115 | holds | none |
| 15 | 8.7 transported actions | `C_2` sign on `O`, `p=2`; two shears | `−1≠1` integrally, `=1` mod 2; `AB=[[2,1],[1,1]]≠BA=[[1,1],[1,2]]`; GN Rem 2.1.13 p.11; CE p.7 | holds | none |
| 16 | Headline: chain model (4.2–4.4) | procyclic circle | `𝒫=[Λ→Λ]`, `H₀=Λ/(γ−1)≅O`, `H₁=0`; coinvariants give finite circle `H₁=O` | holds | none |
| 17 | Headline: finiteness and torsion (5.1–5.7) | `SL₂/ℚ` | `dim K_0=3`, symmetric space dim 2, middle `n=1`; `H̃₀=O` has rank 0; CE Thm 1.4 pp.7–8 | holds | none |
| 18 | Headline: Hochschild–Serre (6.1) | circle, `U=ℤ_p` | `E₂^{0,0}=O`, `E₂^{1,0}=O`, row 1 zero, so `H⁰=H¹=O`; integral form in E06 Prop 2.1.11 proof p.25 | holds | none |
| 19 | Headline: semilocal decomposition (8.11, Lean) | `F=ℤ/4×𝔽₃`, `A₀=𝔽₂×𝔽₃`; `A₀=0` | `ker q=(2)×0=J`; 2 maximal ideals, factors `ℤ/4, 𝔽₃`; `A₀=0` forces `F j=0`, empty spectrum, one-element product | true under both topologies | R01 |
| 20 | `completedHeckeLocalTopology` | `#synth`; `rfl` against Mathlib | resolution picks the roadmap instance; `rfl` fails; file without it elaborates, `IsTopologicalRing` by `inferInstance` | duplicate instance | R01 |
| 21 | F.4 locally analytic vectors | translation on `C(ℤ_p,E)` | same Check in F.4 (line 113) and PadicLocalLanglandsForGL2Qp §0.1 (its line 234); both define orbit-map vectors | two owners | R02 |
| 22 | Corrections E1–E4 | circle tower; `(p,T)`; `ℤ_p²` weighted; `U={1}` | `Hom(O,E/O)≠0=H̃¹`; `Ext¹=𝔽_p`; `p^r` vs `p^{3r/2}`; `Ext¹_O(k,O)=k` | all four confirmed in CE text | none |
| 23 | Description | Check counts; G-list | 305→235 Checks confirmed; G1, G4 placement and ProfiniteCohomology contract unlisted | incomplete | C03 |

- Source locators checked against the text: about 45, in 11 sources (E06, CE, GN, ST, Venjakob, E11, Nakamura, Pan22, LLHLM, Fu, MilneSV), covering all fifteen sampled targets; one gloss is wrong (C01).
- Library declarations: all 83 Mathlib and Tau Ceti names the README cites resolve by `#check` at the pins in one scratch file, with no error; 16 stated file paths checked.
- Cross-roadmap citations resolved on main: about 110 section ids in 20 roadmaps. All suppliers are on main (ProfiniteProPGroups under `Completed/`). `CanonicalTower.*` are ShimuraVarieties' proposed names in its README.
- Dependency check with `--movable`: `depcheck: 200 roadmaps, 2207 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- Gate rerun: every check 0, OK. Nothing changed outside the folder.
- Elaboration of `Suggested.lean`: 14 s, one warning (`67:8 declaration uses sorry`). The three elaborated types carry every README hypothesis, and no binder was lost.
- Overlaps: no other open pull request changes this roadmap, no cited id is dropped, and no id is defined only by an open revision.
- Previous review (of the original pull request; accepted, no open finding): its remark that "ALS.5" should read ALS.5a is repaired, since line 1484 now reads "ALS Layer ALS.5a".

Overlap check: read CompletedCohomologyAndLocalGlobalCompatibility, TorsionCohomologyInfrastructure, CompletedCohomologyAndLocalGlobalCompatibilityPartII, AutomorphicBundlesPartII and HilbertModularVarietiesAndShimuraCurvesPartII (open), and SelmerIwasawaCohomology, NoncommutativeAndEquivariantIwasawa and HilbertModularVarietiesAndShimuraCurves (main). Nothing is shared: the open ones consume §§1.5, 2.1–2.10, 4.1–4.6, 5.4–5.5, 6.1–6.4, 7.6 and 8.4–8.14 here, and NoncommutativeAndEquivariantIwasawa exports to §§0.1, 3.11, 5.1 and 5.5. The third list is empty. Outside these lists, locally analytic vectors are owned both by F.4 and by PadicLocalLanglandsForGL2Qp §0.1 (R02).

Source independence: 16 passages compared with 9 sources (E06, CE, GN, ST, E11, Nakamura, Pan22, LLHLM, Fu). None is shared beyond formulas and forced hypothesis lists; the longest common run is 5 words, in the 2.5 proof sketch against Pan22 line 2133. Largest share: E06, with 45 of about 209 locators (CE has 42). Contents compared with E06 §§1.1–1.2 and 2.1–2.4, and with CE §§1.1–1.7: independent. The order of Layers 2 → 3 → 4 → 5 → 6 is forced by the *Needs:* lines.

Research link: Layers 2–6 state Emerton's (2006) completed cohomology and Calegari–Emerton's (2009 and survey) finiteness, torsion and descent theorems. Layer 8 is Gee–Newton's (2022) completed Hecke algebra. Scholze (2015), Pan (2022), Fu (2024) and Marshall (2012) consume them. This rests on the README's References and on E06, CE, GN, Pan22 and Fu as read.

## Not verifiable

- Pan22 Lemma 4.4.4 at its published pages 44–45: I read arXiv v3, where it is on p. 48.
- Nakamura at its Inventiones pagination: I read the arXiv version only.
- Locators outside the sample in CEbounds, Marshall, BP, BCGP, MilneEC, PanII and Scholze: not fetched this round. The Nakamura §2.3.2 diagram correction was not read.

Automatic checks set aside as false positives: the change summary counts one added Lean declaration and the signature extraction lists a declaration named "for" with a parse error. Both come from the docstring line of `Suggested.lean` (line 15) that begins "theorem for semisimple congruence towers", which is not a declaration.

## Source issues

- **Error** in CE at Theorem 1.1(3), p. 3: the source says the first sequence starts with the `ℚ_p/ℤ_p`-dual of all of `H̃_{•−1}`; it should be the dual of its torsion submodule, since the circle tower gives a nonzero term inside `H̃¹=0`; affects a stated result.
- **Error** in CE at the proof of Lemma 1.17, p. 14: the source says that for `p`-torsion-free `M` every `Ext` group reduces modulo `p` isomorphically to the residual `Ext`; it should be a Bockstein sequence with an adjacent `Ext[p]` term (`M=(p,T)` gives cokernel `𝔽_p`); affects the proof.
- **Error** in CE at Theorem 1.18, p. 14: the source says the growth exponent holds for the arbitrary normal basis `G_r` of the setup; it should be for a uniform-power filtration, since `p^rℤ_p×p^{2r}ℤ_p` gives `p^r`, not `p^{3r/2}`; affects a stated result.
- **Error** in CE at §1.3, p. 6: the source says the amplitude of the `Ext` functors is `dim G_0`; it should be `dim G_0 + 1` integrally, since `Ext¹_{ℤ_p}(𝔽_p,ℤ_p)≠0` for the trivial group; affects a stated result.
- **Misprint** in Pan22 at the proof of Lemma 4.4.4, arXiv v3 p. 48: the source says the limit of the `H^{i+1}[p^n]` is `Hom(ℚ_p/ℤ_p, H^i)`; it should be `Hom(ℚ_p/ℤ_p, H^{i+1})`; affects nothing.
- **Gap** in GN at the proof of Lemma 2.1.14, p. 11: the source says nilpotence of the radical's image at every finite level makes the algebra radical-adically complete; this needs the powers of the radical to be closed, which is not argued; affects nothing (8.11 claims only the inverse-limit topology).

## For the human reviewers

- Licence: E11 (Emerton, the local–global compatibility manuscript of 23 March 2011) is listed in the References as unpublished and read from the author's page; F.1 and §§3.13–3.16 cite its Appendices B and C.
