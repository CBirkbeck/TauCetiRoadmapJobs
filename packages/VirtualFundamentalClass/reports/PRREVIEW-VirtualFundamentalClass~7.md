# Review of VirtualFundamentalClass (pull request #1996 at 387d55e)

**Verdict:** needs changes

## R01 (P2) — Layer 8 and §9.5 require `v` representable, but their graph factorization uses a projection that is not

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:1147`: “let `v : Y′ → Y` be a representable lci morphism of constant virtual relative dimension”. Line 1189 (§8.4): “Use the regular local immersion of the graph followed by smooth projection to define `v^!`”. Also lines 540, 1285, 1313.
**Claim:** The projection `Y′ × Y → Y` is representable only when `Y′` is an algebraic space, so §8.2 (“Under §8.1”) and the flat orientation of §2.5 (“for representable morphisms”) do not apply to it. The source asks for a finite unramified diagonal, not representability.
**Witness:** `v = id` on `BC₂`: the projection `BC₂ × BC₂ → BC₂` has fibre `BC₂`. BehrendFantechi1997 line 1669 (p. 49) and lines 1722–1724 (p. 51): finite unramified diagonal; line 1642: flat orientation without representability; Vistoli1989 line 975, (3.6)(i).
**Repair:** In §2.5 write “Construct the flat orientation for flat morphisms of pure relative dimension with finite unramified diagonal, by the flat pullback of §2.2, and the regular-local-immersion orientation (representable by definition)”. In §8.1, §9.3 and §9.5 replace “representable lci” and “representable and flat” by “lci with finite unramified diagonal” and “flat of pure relative dimension with finite unramified diagonal”. The projection `BC₂ × BC₂ → BC₂` is then covered.

## R02 (P2) — §8.4 and §9.5 use a virtual class on `Y′ × X` that §7.3 does not provide

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:1188`: “Under §8.1, assume that `Y′` and `Y` are smooth with finite unramified diagonals over `k`.” Line 1149: “Require both `(X,E)` and `(X′,F)` to satisfy the class hypotheses of §7.3.”
**Claim:** The route applies §8.2 to the projection and §8.3 to the graph, so it needs `[Y′ × X, Ω_{Y′} ⊞ E]vir`. Nothing makes `Y′` of finite type or gives `Y′ × X` the resolution property that §7.3 requires.
**Witness:** §7.6 (line 1111) gives the resolution property of a product only when both factors have it. `Y = 𝔸¹ ⊔ 𝔸¹`, `Y′ = 𝔸¹ ⊔ (⊔_ℕ 𝔸¹)` mapping the first piece to the first and the others to the second, `X = Spec k` at the first origin: `X′ = Spec k`, but `Y′ × X = Y′` is not of finite type.
**Repair:** Add to §8.4, and with `Z′ ×_Y X` to §9.5: “Assume `Y′` is of finite type. State §§8.2–8.3 for classes evaluated on given resolutions, `0_{F₁}^![C(F•)]` of §7.2, and apply them on `Y′ × X` to the resolution `[pr^*F⁻¹ → pr^*F⁰ ⊕ pr^*Ω_{Y′}]` of `Ω_{Y′} ⊞ E`; no resolution property of `Y′ × X` is used.” (Or assume that `Y′ × X` has the resolution property.)

## R03 (P2) — Layer 2 drops the standing hypothesis of its source: a proper cover by a scheme

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:495`: “For proper `f : X → Y`, define `f_* : A_k(X)_ℚ → A_k(Y)_ℚ` with stabilizer weights.”
**Claim:** The source proves that this pushforward respects rational equivalence, and the push–pull formula, only for stacks that admit a proper surjective morphism from a scheme. No layer, supplier section or pinned declaration states that separated Deligne–Mumford stacks of finite type have one.
**Witness:** Vistoli1989 lines 888–889 (p. 632) assume the cover; lines 1041–1048 and 1068–1074 (pp. 637–638) use it; lines 582–584 (p. 626) give its source. `grep -i cover` on the README finds no such statement.
**Repair:** Add to §2.1: “Prove that a separated Deligne–Mumford stack of finite type over `k` admits a proper surjective morphism from a scheme of finite type (Deligne–Mumford, Theorem 4.12; Vistoli p. 626). This is the standing hypothesis of Vistoli §3 and is used for (3.7)(ii), (3.8) and (3.9).” Add “§2.1 (scheme cover)” to the *Needs:* lines of §§2.2–2.3.

## R04 (P2) — §2.3 takes its operations from cycle groups that the roadmap does not construct

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:512`: “Use Kresch, *Cycle groups for Artin stacks*, §2.5, … for the Chern and projective-bundle constructions and affine-bundle invariance, transferring these operations along the rational comparison with the cycle groups of §2.1.”
**Claim:** Those results are for Kresch's functor `A_*`, a limit over vector bundles on projective covers. The transfer needs `A_*` and the comparison with the naive groups; neither is a target here, in a supplier, or at the pins.
**Witness:** KreschCycle1999 lines 210–211 (Definition 2.1.11) and 225–226 (Theorem 2.1.12(ii)). VirtualFundamentalClassPartII (`README.md:9–16` at its head) builds integral naive groups, not `A_*`, and consumes this §2.3 (`README.md:1268`).
**Repair:** Replace the sentence with a route inside §2.1's groups: “Define `c₁(L) ∩ [V]` on an integral closed substack by the divisor of a rational section, computed étale locally. For a proper surjective `g : X̃ → X` from a scheme (§2.1), prove well-definedness on classes, homotopy invariance, the projective-bundle formula and Whitney sum from SchemeAndStackFoundations Layer 5 on `X̃`, using surjectivity of `g_*` and lifting of rational equivalences (Vistoli Lemma (3.8)) and `π^* g_* = g′_* π′^*` (Lemma (3.9)). Kresch §3.6 proves the same statements for his groups `A_*`.”

## R05 (P3) — The Kresch locators of §2.3 are not in the linked text

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:512`: “§2.5, in particular Prop. 2.5.6 and Cor. 2.5.7”. Line 1414: “§2.5 for Chern classes, projective bundles and affine-bundle invariance”.
**Claim:** The linked arXiv text has no §2.5; its §2 ends at §2.4, and Chern classes, the projective-bundle theorem and affine bundles are in §3.6.
**Witness:** KreschCycle1999 (arXiv math/9810166v1) lines 12–15 (contents: 2.1–2.4), line 815 (§3.6), line 873 (Proposition 3.6.3, projective bundles), line 910 (Corollary 3.6.4, affine bundles), line 235 (Theorem 2.1.12(vi), vector bundles).
**Repair:** In both places write “§3.6, Proposition 3.6.3 and Corollary 3.6.4, and Theorem 2.1.12(vi)–(viii) (arXiv v1 numbering)”, or name the version whose numbering is cited and link that version.

## R06 (P3) — §7.6 cites the wrong theorem of Gross for the resolution property

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:1112`: “by taking products of the quasi-affine quotient presentations in Gross, *Tensor generators on schemes and stacks*, Theorem B.” Line 1417: “Theorem B for the resolution property.”
**Claim:** Theorem B is about AF-schemes under finite surjective morphisms. The equivalence of the resolution property with a presentation `[U/GL_n]`, `U` quasi-affine, is Theorem A, (i) ⇔ (iii).
**Witness:** Gross2017 lines 88–90 (Theorem B) and lines 59–68 (Theorem A).
**Repair:** Write “Theorem A, (i) ⇔ (iii)” in both places, and add the step it leaves: “`[U/GL_n] × [V/GL_m] = [W/GL_{n+m}]` with `W = (U × V) ×^{GL_n × GL_m} GL_{n+m}`, quasi-affine because `GL_{n+m}/(GL_n × GL_m)` is affine.”

## R07 (P3) — Targets without a locator, and two locators that do not cover their statement

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:696` (§4.1): “the cartesian/surjectivity criterion for two quotient presentations to define equivalent cone stacks.” Line 951 (§6.4); line 389 (§1.4): “Source: Behrend–Fantechi §1, p. 5.”; line 527 (§2.4).
**Claim:** §4.1 and §6.4 give no source. §1.4's page holds only the definition of a cone. The items cited in §2.4 do not contain excess intersection, composition or the self-intersection formula.
**Witness:** BehrendFantechi1997 lines 295–299 (p. 9), 416–426 (p. 12), 442–448 (Prop. 1.7, p. 13); lines 229–243 (p. 7); line 1259 (Def. 5.1, p. 37). Vistoli1989 lines 98–99 (p. 614): excess intersection is not treated.
**Repair:**
- §4.1: “(Behrend–Fantechi, `E`-cones, p. 9; the quotient `[C/E]`, p. 12; Prop. 1.7, p. 13, with its hypotheses: the square of `E → C` over `F → D` cartesian and `F × C → D` surjective)”.
- §6.4: “(Behrend–Fantechi Def. 5.1, p. 37; Prop. 2.4, p. 20; Prop. 5.7, p. 41; Prop. 7.2, p. 50)”.
- §1.4: “Behrend–Fantechi §1, pp. 5–7”.
- §2.4: after the locator add “Excess intersection, composition and self-intersection are proved here on the test schemes of (3.10) from SchemeAndStackFoundations §5.5; Vistoli leaves them out (p. 614).”

## R08 (P3) — §6.4 proves a statement about relative theories before §9.2 defines them

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:953`: “For a cartesian base change of a relative theory, construct the map from the derived pullback of the theory to the new relative cotangent complex.”
**Claim:** Relative obstruction theories are defined in §9.2 (line 1261), whose *Needs:* line lists §§6.1–6.5; §6.4's own *Needs:* line (“§§3.2–3.4, 4.4, 6.1”) has no source for the notion.
**Witness:** `README.md:1261`: “Define relative obstruction theories `E → L_{X/Y}`, perfectness, global resolution, and constant virtual rank exactly as in the absolute case.”
**Repair:** Move lines 953–956 and the second half of the API bullet at line 962 to §9.2, where §9.3 uses them; or define relative obstruction theories in §6.1 and let §9.2 cite it.

## Previous findings

- R01: repaired. Lines 411–418: “A local immersion is a representable unramified morphism of finite type. Choose compatible smooth atlases … and descend `C_{U/V} ↪ N_{U/V}`”; the `Spec k → BC₂` Check is at line 434.
- R02: repaired. Lines 1313–1329 write the hypotheses and the two cases; line 1324: “When `Y` is smooth over `k` and both `Z,Z′` are smooth over `Y`”; end goal 5 (line 64) reads “in the smooth cases specified in §9.5”. The representability it adds is R01 above.
- R03: repaired. Lines 1059–1068 use a roof, the summands `[F₀ = F₀]`, `[H₀ = H₀]` and “degreewise surjective chain quasi-isomorphisms”; the Check is at lines 1075–1078.
- R04: repaired. Lines 1193–1203 put the obstruction in `Ext¹(P,K)`, zero on affine charts, and glue the rational equivalences. The class on `Y′ × X` that the route still needs is R02 above.
- R05: repaired. The identities are at lines 1114 (§7.6), 1169, 1179, 1190 (§§8.2–8.4), 1217 (§8.5) and 1304 (§9.4).
- R06: partly repaired. Locators added at lines 327, 528, 719, 826, 923, 1153 and 118; the one added to §2.3 points to numbers the linked text does not have (R05) and to groups the roadmap does not build (R04).
- R07: repaired. Lines 635–638 separate the representable case (Webb) from the chart formula with Laumon–Moret-Bailly §17; Webb is in References (line 1410).

## Verified sound

| Statement | Instances tried | Left value | Right/comparison value | Result; change |
|---|---|---|---|---|
| §1.4 cones | `S₀ = 𝒪×𝒪`; `Sym` of infinite rank; `C(E∨)` | `S₀ ≠ 𝒪`; `S₁` not coherent; `E` | BF lines 186–190 (pp. 5–6), abelian hull line 237 (p. 7) | Correct; page range: R07 |
| §2.2 pushforward | `q : BC₂ → pt`, `p : pt → BC₂` | `q_*[BC₂] = ½[pt]`; `p_*[pt] = 2[BC₂]` | `q_*p_* = id`; Vistoli (3.6) line 974, (3.7) line 989 (p. 635) | Values correct; cover hypothesis absent: R03 |
| §2.3 Chern classes | `c₁(𝒪(1) ⊠ χ) ∩ [ℙ¹ × BC₂]` | `[pt × BC₂] + c₁(χ) ∩ [·]` | second term 2-torsion, zero in a ℚ-space | Check correct; route and locator: R04, R05 |
| §2.4 Gysin | `i : pt ↪ 𝔸¹` | `i^![𝔸¹] = [pt]`; `i^![pt] ∈ A_{−1}(pt) = 0` | Vistoli (3.10) line 1096 (p. 638), (3.13) line 1118 (p. 639), (3.20) line 1206 (p. 641) | Correct; excess intersection not in the items cited: R07 |
| §2.5 projection formula | `q : ℙ¹ × BC₂ → ℙ¹`, `c = c₁(𝒪(1))` | `q_*[pt × BC₂] = ½[pt]` | `c ∩ ½[ℙ¹] = ½[pt]`; Vistoli (5.1) line 1550 (p. 650) | Correct |
| §2.5 tangent invariance | README naming against Kresch's | invariance under `T_{Y′}|_{X′}`, `Y′` the smooth immersed stack | Kresch1999 lines 321–336: smooth `X`, arbitrary `Y′` | Agrees after renaming; Prop. 2.3 line 242 (p. 7), Lemma 4.1 line 410 (p. 13) |
| §4.1 quotients | `d = 0 : 𝔸¹ → pt`; `d = id : 𝔸¹ → 𝔸¹`; `E = 0` | `B𝔾_a`; `pt`; `C` | BF Prop. 1.7 lines 442–448 (p. 13) | Correct; no locator: R07 |
| §4.2 cone stacks | `[F₁/F₀]`; `B𝔾_a` acting on `pt` | dimension `rk F₁ − rk F₀`; `E₀ → F` is `𝔸¹ → 0` | Prop. 1.13 needs `E₀ → F` injective: fails | Correct; BF lines 482–522 (pp. 14–15) |
| §5.1 normal sheaf | dual numbers in `𝔸¹`; `I = (x², xy)` | `∂_x ↦ 2x`; `dim I/𝔪I = 2`, generic rank 1 | zero in characteristic 2; not a bundle | Correct; BF Def. 3.6 line 902 (p. 27), presentation line 948 (p. 28) |
| §5.5 pullback | `x+y+z` on the three axes in `𝔸³` | fibre of `C_{Y/𝔸³}` at 0: monomials `x^{a+b}y^{a+c}z^{b+c}` distinct, so `𝔸³` | exactness would need `1 + 3 = 4 ≤ dim C_{X/𝔸³} = 3` | Negative control correct; BF Prop. 2.7 line 733 (p. 22), Prop. 3.14 line 1040 (p. 31) |
| §6.4 perfect theories | zero theory of `pt` pulled to `𝔸¹`; `Ω_C ⊕ V[1]`, `rk V = 2` | `H⁰`: `0 → 𝒪`; rank `1 − 2` | not an isomorphism; `−1` | Correct; no locator: R07; relative part ahead of §9.2: R08 |
| §6.5 resolutions | `[0 → L]`; summand `[K = K]` | rank `1`; rank unchanged | BF Def. 5.2 line 1282 (p. 38), Prop. 5.7 line 1366 (p. 41), Prop. 7.2 line 1682 (p. 50) | Correct |
| §7.3 independence | `K′ = K ⊕ [F₀=F₀] ⊕ [H₀=H₀]`; `0` against `[k = k]` on a point | `K′₁ → F₁` onto (`H¹` iso plus image of `F₀`); `0^![𝔸¹] = [pt]` | BF lines 1312–1319 (p. 39): `K₁ → F₁` epi, `α` smooth | Correct |
| §7.4 public class | dual numbers | `C = N = F₁`, `0^![F₁] = [X]` | `2[pt]`, rank `1 − 1 = 0` | Correct |
| §7.6 products | `[U/GL_n] × [V/GL_m]` | `[(U×V) ×^{GL_n×GL_m} GL_{n+m} / GL_{n+m}]` | Gross Theorem A lines 59–68; Theorem B lines 88–90 is about AF-schemes | True; wrong theorem cited: R06 |
| §7.7 degree | dual numbers; `BC₂` | `2`; `½` | Vistoli (3.6) third case, lines 985–987 (p. 635) | Correct |
| §8.4 functoriality | `v = id_{BC₂}`; affine chart; conic in `ℙ²` | projection has fibre `BC₂`; `Ext¹(P,K) = H¹(P∨ ⊗ K) = 0`, `Ext⁰ = 0`; `1 − 2 = −1` | §8.1 asks representable; `K` in degrees `≤ −1`; `𝒪(−2)|_C` | Local step correct; R01, R02 |
| §9.3 flat base change | `B𝔾_m → Spec k`, `X = Spec k` | `X′ = B𝔾_m`, not Deligne–Mumford | BF Prop. 7.1 line 1676, 7.2(1) line 1688 (p. 50); line 1669: finite unramified diagonal | Correct; representability narrower than the source: R01 |
| §9.4 regular base change | README against BF pp. 49–51 | `Y`, `Y′` smooth of constant dimension | BF line 1668; Prop. 7.2(2) line 1689, 7.3 line 1702, 7.4 line 1713 | Correct |
| End goal 1 | `k[x]/x² ⊂ 𝔸¹` | `dim C_{U/M} − rk T_M = 1 − 1` | `0`; BF Thm. 3.11 line 985 (p. 29) | Correct; not statable |
| End goal 2 | `id`; `Ω ⊕ V[1] → Ω`; zero theory on `𝔸¹` | `h⁰` iso, `h⁻¹` onto; fails `h⁰` | BF Def. 4.4 line 1139 (p. 34), Thm. 4.5 line 1162 (p. 35) | Correct; not statable |
| End goal 3 | `s = 0` in `𝒪(1)` on `ℙ¹` | `n = 1 − 1 = 0` | `c₁(𝒪(1)) ∩ [ℙ¹] = [pt]`; BF Prop. 5.6 line 1357 | Correct; not statable |
| End goal 4 | `H⁻¹(E) = 0`, `H⁰` free | README hypothesis | BF line 1354 prints `h¹(E•) = 0` | README correct; misprint below |
| End goal 5 | `pt → B𝔾_m`; identity of `{xy = 0}` | `d + n = −1 + 1 = 0`; `1 + 0` | `[pt]`; sum of the two axes; BF lines 1664–1667 (p. 49) | Correct; R01 for §9.5 |
| End goal 6 | §7.4 | class from the existence of a resolution | no stack carrier at the pins | Not statable; docstring names it |

- Source locators checked against the text: 44 (BehrendFantechi1997 arXiv v1, read in full; Vistoli1989 GDZ scan by OCR, pp. 614, 620, 623–626, 632–641, 650–651; Kresch1999 pp. 7, 10–13; KreschCycle1999 contents, pp. 6–7, 20–22; Gross2017 pp. 1–2; Webb2022 arXiv v2 lines 1910–1919; Stacks Tags 0AFL–0AFR, 07B1, 07BF, 0GR1, 08SL).
- Library declarations opened at the pins: 13. Tau Ceti `relativeSpec` (`RelativeSpec/Functor.lean:219`), `relativeSpecHomIso` (`RelativeSpec/UniversalProperty.lean:455`), `relativeSpecBaseChangeIso` (`RelativeSpec/BaseChange.lean:272`), `gradedRelativeSpecEquiv` (`RelativeSpec/Graded.lean:79`), `gradedSymmetricAlgebra` (`Modules/Quasicoherent/GradedAlgebra/SymmetricAlgebra/Basic.lean:110`), `SchPseudofunctor` (`Stack/Basic.lean:37`), `IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean:195`), `ChowGroup` (`Chow/Basic.lean:295`), `ChowGroup.pushforward` (`Chow/ClosedImmersion.lean:211`, locally Noetherian at line 208), `toAlgebraicCycle` (`WeilDivisor/Scheme/Basic.lean:75`), `blowup` (`Blowup/IdealSheaf.lean:120`), `FiniteLocallyFreeSheaf`, `GeometricVectorBundle`. No algebraic or Deligne–Mumford stack, cotangent complex or normal cone at either pin.
- Cross-roadmap citations resolved on main: 19. SchemeAndStackFoundations Layers 1 and 5, §§1.10, 1.18, 1.22, 4.5, 5.1, 5.5 (README:3085, 3538, 3797, 6505, 7957, 8166); AlgebraicVectorBundles Layers 1–3 and L1A–L2B (README:346–369); DerivedModuleAlgebra §§0.1, 0.4, 0.17, 0.25; EnhancedDerivedSheaves §0.3, E1.8; DerivedDeRhamCohomology §§0.20, 5.8; EquivariantIntersectionTheory Layer 2; JacobianChallenge.
- Gate: the worker's gate is `OK`, every check at 0 including `build=0`; nothing changed outside the folder.
- Dependency check: `depcheck: 250 roadmaps, 2585 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message. The file has 0 declarations, so the `#check @` comparison and the one-tactic probes have nothing to test; none of the six end goals is statable at the pins and the docstring names each.
- Pull-request text: the title and the prose agree with the head; no sentence is contradicted.
- Overlap check: read VirtualFundamentalClassPartII, AlgebraicGromovWittenTheory, MotivicStructuresInModuliOfCurves, StableReductionPartII, MotivesAndAlgebraicCycles, EquivariantIntersectionTheory, SchemeAndStackFoundations, SchemeKTheoryOperations; rational Chow groups of separated Deligne–Mumford stacks and the Behrend–Fantechi class: this roadmap, the others cite it; integral groups of `[U/G]`: EquivariantIntersectionTheory; integral and non-separated groups: VirtualFundamentalClassPartII; the scheme cover of a Deligne–Mumford stack: stated only in VirtualFundamentalClassPartII §1.1, needed here (R03).
- Source independence: 14 passages compared with 4 sources, none shared (longest common run 6 words, in the definition of a local immersion); largest share BehrendFantechi1997, 40 of 62 locators; contents compared with BehrendFantechi1997: independent (Layer 4 merges its §§1–2, Layer 6 takes Defs. 5.1–5.2 from its §5, Layers 7–8 split the rest of §5, its §6 is absent, Layers 0–3 are not from it; the order of Layers 4–9 is forced by the *Needs:* lines of §§5.1, 6.1, 7.1, 8.1 and 9.1).
- Research link: the end goals are the main results of Behrend–Fantechi (1997), on Vistoli's (1989) rational Chow theory and Kresch's (1999) corrected invariance; they are the input of algebraic Gromov–Witten theory, which BehrendFantechi1997 cites as its references [3], [4] and the README names under Scope and Downstream consumers. Rests on the README and BehrendFantechi1997.

## Not verifiable

- Fulton1998, *Intersection Theory*: paywalled; cited by chapter only.
- Illusie, *Complexe cotangent et déformations I*, III Cor. 3.1.3 (§3.4): paywalled; matched only through BehrendFantechi1997 line 946.
- LaumonMoretBailly2000, *Champs algébriques*, §17 (§3.3): paywalled; not checked against the text.
- Kresch, *Cycle groups for Artin stacks*, published version (Invent. Math. 138): paywalled; whether its numbering has a §2.5 could not be checked, only that the linked arXiv v1 has none (R05).
- Webb's published numbering (Example B.8): the published appendix was not read; the passage is Example B.3.1 in arXiv v2, lines 1910–1919.
- Deligne–Mumford, Theorem 4.12 (repair of R03): read only through Vistoli1989 lines 582–584.

## Source issues

- **Error** in BehrendFantechi1997 at Proposition 3.14, p. 31: the source says the intrinsic-cone sequence is short exact for every local complete intersection morphism; it should assert this for smooth morphisms only, since for `x+y+z` on the three axes the dimensions are 3 against 4; affects a stated result.
- **Error** in BehrendFantechi1997 at Proposition 3.12, p. 30: the source says equality of the intrinsic cone and normal sheaf forces a local complete intersection; it should keep only the vector-bundle-stack criterion, since `k[x,y]/(x²,xy)` has `C = N`; affects a stated result.
- **Error** in BehrendFantechi1997 at Proposition 3.5, p. 26: the source says Vistoli's rational equivalence is invariant under the whole restricted tangent bundle of the ambient; it should claim invariance along the immersed smooth stack only; affects the proof; corrected in print at Kresch, *Canonical rational equivalence*, Theorem 3.1, p. 10.
- **Gap** in BehrendFantechi1997 at Proposition 5.3, p. 39: the source says both resolutions may be taken to map to `E•` by chain maps; it should replace the derived isomorphism by a roof of vector-bundle complexes, which needs the resolution property; affects the proof.
- **Gap** in BehrendFantechi1997 at Proposition 5.10, p. 44: the source says `F` is compatible with `Ω_{Y′} ⊞ E` over the graph and uses a virtual class on `Y′ × X`; it should construct the lift `g^*Ω_{Y′} → F` on charts and say why `Y′ × X` has a class; affects the proof.
- **Misprint** in BehrendFantechi1997 at Proposition 5.5, p. 40: the source says `h¹(E•) = 0`, automatic in amplitude `[−1,0]`; it should say `h⁻¹(E•) = 0`; affects a stated result.
- **Misprint** in BehrendFantechi1997 at Example 7.6, p. 52: the source says the zero section of `g*N_{Y/X}`; it should say `g*N_{Y/W}`; affects nothing.
- **Misprint** in Kresch1999 at Theorem 3.1, p. 10: the source says the group is `T_{Y′}|_{X′}` with `Y′` the arbitrary stack; it should say `T_X|_{X′}`, the tangent bundle of the immersed smooth stack; affects a stated result.

## For the human reviewers

- **Scope.** The board package VirtualFundamentalClasses (merge order line 434, before this roadmap at 443) plans the same rational Chow theory and Behrend–Fantechi class (`packages/VirtualFundamentalClasses/README.md:3–12`). One of the two must own these objects.
- **Scope.** The merge order lists the consumers StableReductionPartII (344) and VirtualFundamentalClassPartII (345) before this roadmap (443).
- **Scope.** R03 asks this roadmap to state the scheme cover of a separated Deligne–Mumford stack; VirtualFundamentalClassPartII §1.1 (`README.md:540–552` at its head) states it for a wider class and would then cite this one.
- **Licence.** Vistoli1989 was read from the GDZ scan (Göttingen digitisation, terms of use on its first page); the README links only the publisher DOI 10.1007/BF01388892.
- **Not tested.** VirtualFundamentalClassPartII (`README.md:379–392` at its head) declares a gap on this roadmap's §2.1 (integral closed substacks without separatedness); it was not reviewed here.
