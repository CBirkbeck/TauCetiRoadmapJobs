# Review of VirtualFundamentalClass (pull request #1996 at d899863)

**Verdict:** needs changes

## R01 (P2) — §6.6 states the curvilinear criterion over an arbitrary field; it needs `k` algebraically closed

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:1029`: “A vector `v ∈ N_p` occurs as the obstruction to lifting some such deformation along `k[t]/(t^(m+1)) → k[t]/(t^m)` exactly when it lies in the coarse cone `C_p`”.
**Claim:** “Fix a field `k`” (line 38) is the only hypothesis in scope. Over a field that is not algebraically closed a `k`-point of `C_p` need not obstruct any curvilinear extension, even up to a scalar.
**Witness:** `X = Spec ℝ[x,y]/(x²+y², x³)`, a complete intersection, so `C_p = N_p = ℝ²`. For a real arc `(α,β)`, `ord(α²+β²) = 2·min(ord α, ord β) ≥ m` forces `ord α³ ≥ 3m/2 > m`: the `x³`-coordinate of every obstruction is `0`.
**Repair:** Replace the second sentence by: “Assume `k` algebraically closed. A vector `v ∈ N_p` is the obstruction, in `N_p ⊗ (t^m)/(t^(m+1))` with basis `t^m`, to lifting some such deformation along `k[t]/(t^(m+1)) → k[t]/(t^m)` exactly when it lies in `C_p`.” Add the Check: “For `X = Spec k[x,y]/(x²+y², x³)`, `C_p = N_p = k²`. Over `ℂ` the arc `(t, it + t³)` at `m = 3` has obstruction `(0,1) ⊗ t³`; over `ℝ` no arc has an obstruction with nonzero second coordinate.” (Over `ℂ`: `α²+β² = 2it⁴ + t⁶`, `α³ = t³`.)

## R02 (P3) — The page numbers of Vistoli's Lemmas (3.8) and (3.9) are off by one

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:503`: “Lemmas (3.8)–(3.9), pp. 637–638”; line 525: “Vistoli Lemma (3.8), pp. 637–638”; line 536: “Vistoli Lemma (3.9), p. 638”.
**Claim:** Lemma (3.8) is stated on p. 636 and its proof ends on p. 637; Lemma (3.9) is stated on p. 637 and its proof ends on p. 638.
**Witness:** Vistoli1989 line 1008 (running head 636), line 1027 (Lemma (3.8)), line 1040 (running head 637), line 1049 (Lemma (3.9)), line 1067 (running head 638).
**Repair:** Line 503: “Lemmas (3.8)–(3.9), pp. 636–638”. Line 525: “Vistoli Lemma (3.8), pp. 636–637”. Line 536: “Vistoli Lemma (3.9), pp. 637–638”.

## R03 (P3) — Three targets have no locator

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:279` (§0.2): “Define dimension and pure dimension of a locally finite-type algebraic stack over a field by a smooth scheme atlas with the relative-dimension correction.” Line 769 (§4.3); line 701 (§3.5).
**Claim:** §0.2, §3.5 and §4.3 state definitions and theorems and cite no source; each is in a source the README already uses.
**Witness:** Stacks Project Tags 0AFM (independence of the presentation), 0AFN, 0AFP. BehrendFantechi1997 lines 535–544 (p. 16), line 574 (Prop. 2.1, p. 17), line 635 (Lemma 2.2, p. 19); lines 1067–1078 (p. 32).
**Repair:**
- §0.2, after the first paragraph: “(Stacks Project, Tags 0AFM, 0AFN and 0AFP)”.
- §4.3, after the first paragraph: “(Behrend–Fantechi §2, pp. 16–19: the quotient `[E¹/E⁰]`, p. 16; Prop. 2.1, p. 17, for quasi-isomorphisms; Lemma 2.2, p. 19, for homotopies; after Deligne, SGA 4, Exposé XVIII, §1.4)”.
- §3.5, after “adjacent Ext groups”: “(Behrend–Fantechi §4, p. 32, for the class in `Ext¹(g*L_X,J)` and the torsor of lifts under `Ext⁰`)”.

## Previous findings

- R01 (representability of `v`): repaired. Line 571: “flat morphisms of pure relative dimension with finite unramified diagonal”; line 1190: “a lci morphism with finite unramified diagonal”; lines 1358, 1387 likewise; the `BC₂ × BC₂ → BC₂` Check is at line 1289.
- R02 (class on `Y′ × X`): repaired. Lines 1239–1249: “`Y′` is of finite type … evaluate §7.2 on the resolution `[pr_X^*E⁻¹ → pr_X^*E⁰ ⊕ pr_{Y′}^*Ω_{Y′}]`”; §9.5 lines 1399–1404 likewise.
- R03 (scheme cover): repaired. Lines 472–475: “Prove that every separated finite-type Deligne–Mumford stack over `k` admits a proper surjective cover by a scheme of finite type”; the *Needs:* lines 507 and 544 name it.
- R04 (Kresch's groups): repaired. Lines 516–542 work in §2.1's groups by the cokernel presentation of a finite scheme cover; Kresch is cited only “for his cycle groups”.
- R05 (Kresch locators): repaired. Lines 540–541 and 1492–1493: “§3.6, Prop. 3.6.3, Cor. 3.6.4, and Thm. 2.1.12(vi)–(viii) (arXiv v1 numbering)”.
- R06 (Gross): repaired. Line 1148: “Theorem A (i) ⇔ (iii)”, with the induced presentation at lines 1149–1156.
- R07 (locators): repaired at lines 389, 557–560, 731–733 and 990–991. §4.3, §0.2 and §3.5 remain without one (R03 above).
- R08 (relative theories in §6.4): repaired. The base-change paragraph is at lines 1332–1336 (§9.2).

## Verified sound

| Statement | Instances tried | Left value | Right/comparison value | Result; change |
|---|---|---|---|---|
| §0.1 carriers | SchemeAndStackFoundations on main | Layer 1 at README:2764; §§1.18, 1.21, 1.22 at 3538, 3744, 3797 | no stack carrier at either pin | Citation resolves |
| §0.3 quotient dimension | `B𝔾_m`; `Bμ_p` in char. `p`; `B𝔾_a` | `0−1`; `0−0`; `0−1` | Tag 0AFR: `dim X − dim G`, `X`, `G` of finite type over a field | Correct; §0.2 lacks a locator: R03 |
| §2.1 groups and cover | `BC₂`; `pt` | degree `½`; `A₀ = ℚ` | Vistoli (3.1) line 892 (p. 632), (3.4) line 960 (p. 634), degree `1/n` lines 372–376 (p. 620) | Correct |
| §2.3 cokernel presentation | `pt → BC₂`; two points over a point; two lifts `W₁,W₂` of `V` | `ℚ² →0→ ℚ → ℚ`, `g_*[pt] = 2[BC₂]`; cokernel `ℚ`; `[T]/deg(T/V) ↦ [W₁]/d₁ − [W₂]/d₂` | exact; exact; `deg(T/W_i)·d_i = deg(T/V)` | Correct; pages: R02 |
| §2.3 Chern class | `c₁(χ) ∩ [BC₂]` through `pt → BC₂` | divisor of a section of the trivial bundle: `0`, divided by 2 | README Check: character term vanishes | Correct; Kresch Prop. 3.6.3 line 873, Cor. 3.6.4 line 910, Thm. 2.1.12(vi) line 235 |
| §2.5 orientations | `q : ℙ¹×BC₂ → ℙ¹`; `n/b` on `𝔸³` | `½[pt]` both sides; divisor `[n=0]−[b=0]` | `b ↦ b+1` gives `n/(b+1)`, `a`-translation fixes it | Correct; Vistoli (5.1) line 1550 (p. 650); Kresch Prop. 2.3 line 242 (p. 7), Thm. 3.1 line 334 (p. 10) |
| §3.3 cotangent complex | `pt → B𝔾_m`; identity; `𝔸^r_X → X` | `k[−1] → 0 → k`; `0`; rank `r` in degree 0 | triangle `f*L_Y → L_X → L_{X/Y}` | Correct; Webb B.8 is arXiv Example B.3.1 (line 1910) |
| §3.4 local presentation | dual numbers in `𝔸¹` | `[(x²)/(x⁴) → Ω|_U]`, `x² ↦ 2x dx` | Tag 08SL: lci gives perfect, Tor amplitude `[−1,0]` | Correct |
| §4.1 quotients | `d = 0`; `d = id`; `E = 0` | `B𝔾_a`; `pt`; `C` | BF Prop. 1.7 line 442 (p. 13) | Correct |
| §4.2 cone stacks | `[F₁/F₀]`; trivial action of `E` | dimension `rk F₁ − rk F₀`; `C × BE` | BF Def. 1.9 line 482, Prop. 1.10 line 487, Defs. 1.11–1.12, Prop. 1.13 lines 492–522 (pp. 14–15) | Correct |
| §4.3 Picard stack | `d = 0`; `d` iso; `k[2]` | `E¹ × BE⁰`; base; `0` after truncation | BF lines 535–544 (p. 16), Prop. 2.1 line 574 (p. 17) | Correct; no locator: R03 |
| §4.5 triangles | `k[1] → 0 → k[2]` | duals of `G,F,E`: `0, 0, 𝔸¹` | not exact; `G` is not of amplitude `[−1,0]` | Negative control correct |
| §5.4 basic properties | `I = (x²,xy)`; smooth `X` | `Sym(I) = Rees(I)` since `I ≅ (x,y)`: `C = N`, not lci | BF Prop. 3.12 line 1010 asserts (3) ⇒ (1) | README's restriction correct |
| §6.1 obstruction theories | `id`; `Ω ⊕ V[1] → Ω`; zero theory on `𝔸¹` | iso, onto; iso, onto; `H⁰`: `0 → 𝒪` | BF Def. 4.4 line 1139 (p. 34), Thm. 4.5 line 1162 (p. 35) | Correct |
| §6.6 curvilinear | `ℝ[x,y]/(x²+y²,x³)`; `ℝ[x,y]/(x,y)²`, `v = (−1,0,0)` | obstructions `(c,0)`; `(a²,ab,b²)` | `C_p = ℝ²`; `v ∈ {ac = b²}`, reached only as `v ⊗ (−t^m)` | False over `ℝ`: R01 |
| §7.3 independence | `0` against `[k = k]`; `K ⊕ [F₀=F₀] ⊕ [H₀=H₀]` | `0^!α^*[pt] = 0^![𝔸¹] = [pt]`; `K₁ ⊕ F₀ → F₁` onto | BF lines 1303–1320 (p. 39) assume chain maps | Correct |
| §7.6 products | `[U/GL_n] × [V/GL_m]` | `(U×V) ×^{GL_n×GL_m} GL_{n+m}` over the affine scheme of rank-`n` idempotents | Gross Theorem A lines 59–68 | Correct |
| §8.4 functoriality | `v = id_{BC₂}`; conic in `ℙ²`; affine chart | graph is the diagonal, finite unramified of degree 2; rank `1−2`; `Ext¹(P,K) = 0` | flat pullback of degree `¼`; `𝒪_C(−2)[1]`; `K` in degrees `≤ −1` | Correct; BF Def. 5.8 line 1381 (p. 41), Prop. 5.10 line 1428 (p. 42) |
| End goal 1 | dual numbers in `𝔸¹` | `dim C − rk T = 1 − 1` | `0`; BF Thm. 3.11 line 985 | Correct; not statable |
| End goal 2 | as §6.1 | as §6.1 | BF Thm. 4.5 | Correct; not statable |
| End goal 3 | dual numbers | `0^![N] = [X] = 2[pt]`, rank `1−1` | BF Def. 5.2 line 1282, Prop. 5.3 line 1299 | Correct; not statable |
| End goal 4 | `H⁻¹(E) = 0`, `H⁰` free | README hypothesis | BF line 1354 prints `h¹(E•) = 0` | README correct; not statable |
| End goal 5 | `pt → B𝔾_m`; identity of `{xy = 0}` | `−1 + 1 = 0`, `[pt]`; `1 + 0`, sum of the axes | BF Prop. 7.1 line 1676, 7.2 line 1682 (p. 50), 7.5 line 1734 (p. 51) | Correct; not statable |
| End goal 6 | §7.4 | class from the existence of a resolution | no stack carrier at the pins | Not statable; docstring names it |

- Source locators checked against the text: 47 (BehrendFantechi1997 arXiv v1; Vistoli1989 pp. 620, 623–624, 632–639, 641, 650; Kresch1999 pp. 7, 10, 13; KreschCycle1999 lines 225–240, 815–910; Gross2017 lines 59–68; Webb2022 line 1910; Stacks Tags 0AFL–0AFR, 07B1, 07BF, 0GR1, 08SL).
- Library declarations opened at the pins: 16. Mathlib `Pseudofunctor.IsStack` (`CategoryTheory/Sites/Descent/IsStack.lean:49`), `AlgebraicCycle` (`AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`), `reesAlgebra` (`RingTheory/ReesAlgebra.lean:40`); Tau Ceti `relativeSpec` (`RelativeSpec/Functor.lean:219`), `relativeSpecHomIso` (`RelativeSpec/UniversalProperty.lean:455`), `relativeSpecBaseChangeIso` (`RelativeSpec/BaseChange.lean:272`), `gradedRelativeSpecEquiv` (`RelativeSpec/Graded.lean:79`), `gradedSymmetricAlgebra` (`Modules/Quasicoherent/GradedAlgebra/SymmetricAlgebra/Basic.lean:110`), `SchPseudofunctor` (`Stack/Basic.lean:37`), `IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean:195`), `ChowGroup` (`Chow/Basic.lean:295`), `ChowGroup.pushforward` (`Chow/ClosedImmersion.lean:211`), `toAlgebraicCycle` (`WeilDivisor/Scheme/Basic.lean:75`), `blowup` (`Blowup/IdealSheaf.lean:120`), `FiniteLocallyFreeSheaf` (`VectorBundle/FiniteLocallyFree.lean:108`), `GeometricVectorBundle` (`VectorBundle/Geometric.lean:118`). No algebraic or Deligne–Mumford stack, cotangent complex of a scheme or normal cone at either pin.
- Cross-roadmap citations resolved on main: 20. SchemeAndStackFoundations Layers 1, 5 and §§1.10, 1.18, 1.22, 4.5, 5.1, 5.5 (README:2764, 7928, 3085, 3538, 3797, 6505, 7957, 8166); AlgebraicVectorBundles Layers 1–3, L1A–L2B (README:388, 472, 620, 346–369); DerivedModuleAlgebra §§0.1, 0.4, 0.17, 0.25 (README:750, 1271, 1702, 1761); EnhancedDerivedSheaves Layer 0, §0.3, Layer E1, E1.8 (README:425, 455, 506, 840); DerivedDeRhamCohomology §§0.20, 5.8 (README:378, 4513); EquivariantIntersectionTheory Layer 2 (README:371). The consumers' citations of this roadmap (StableReductionPartII, AlgebraicGromovWittenTheory, MotivicStructuresInModuliOfCurves, VirtualFundamentalClassPartII) name sections that exist at this head.
- Gate: the worker's gate is `OK`, every check at 0 including `build=0`; nothing changed outside the folder.
- Dependency check: `depcheck: 249 roadmaps, 2578 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message. The file has no declaration, so the `#check @` comparison and the one-tactic probes have nothing to test; none of the six end goals is statable at the pins and the docstring names each with the carrier it lacks.
- Pull-request text: the title and the prose agree with the head; no sentence is contradicted.
- Overlap check: read VirtualFundamentalClassPartII, AlgebraicGromovWittenTheory, MotivicStructuresInModuliOfCurves, StableReductionPartII, MotivesAndAlgebraicCycles, EquivariantIntersectionTheory, SchemeAndStackFoundations, SchemeKTheoryOperations; rational Chow groups of separated Deligne–Mumford stacks and the Behrend–Fantechi class: this roadmap, the others cite it; integral groups of `[U/G]`: EquivariantIntersectionTheory; integral and non-separated groups: VirtualFundamentalClassPartII; the finite scheme cover of a separated Deligne–Mumford stack: this roadmap §2.1, which VirtualFundamentalClassPartII §1.1 states again for a wider class.
- Source independence: 9 passages compared with 4 sources, none shared (longest common run 6 words, “is a universal obstruction space for”); largest share BehrendFantechi1997, 38 of 62 locators; contents compared with BehrendFantechi1997: independent (Layer 4 merges its §§1–2, Layer 6 takes Defs. 5.1–5.2 from its §5, Layers 7–8 split the rest of §5, its §6 is absent, Layers 0–3 are not from it; the order of Layers 4–9 is forced by the *Needs:* lines of §§5.1, 6.1, 7.1, 8.1 and 9.1).
- Research link: the end goals are the main results of Behrend–Fantechi (1997), built on Vistoli's (1989) rational Chow theory with Kresch's (1999) corrected invariance; they are the input of algebraic Gromov–Witten theory, named in the README's Scope and Downstream consumers. Rests on the README and BehrendFantechi1997.

## Not verifiable

- LaumonMoretBailly2000, *Champs algébriques*, Thm. 16.6 (§2.1) and §17 (§3.3): paywalled; not checked against the text.
- Illusie, *Complexe cotangent et déformations I*, III Cor. 3.1.3 (§3.4): paywalled.
- Deligne–Mumford, Thm. 4.12 (§2.1): read only through Vistoli1989 lines 582–584.
- Fulton1998, *Intersection Theory*: paywalled; cited by chapter only.
- Webb's published Appendix B: the publisher's page lists Examples B.3, B.4 and B.8 where arXiv v2 line 214 lists B.2.2, B.2.3 and B.3.1; the published appendix itself was not read.
- Deligne, SGA 4, Exposé XVIII, §1.4 (repair of R03): read only through BehrendFantechi1997 lines 528–540.

## Source issues

- **Error** in BehrendFantechi1997 at Proposition 4.7, p. 37: the source says, over any ground field, that a vector obstructs a curvilinear extension exactly when it lies in the cone; it should assume an algebraically closed field, since `ℝ[x,y]/(x²+y²,x³)` fails; affects a stated result.
- **Error** in BehrendFantechi1997 at Proposition 3.12, p. 30: the source says equality of the intrinsic cone and normal sheaf forces a local complete intersection; it should keep only the vector-bundle-stack criterion, since `k[x,y]/(x²,xy)` has `C = N`; affects a stated result.
- **Gap** in BehrendFantechi1997 at Proposition 5.3, p. 39: the source says both resolutions may be taken to map to `E•` by chain maps; it should replace the derived isomorphism by a roof of vector-bundle complexes, which needs the resolution property; affects the proof.
- **Misprint** in BehrendFantechi1997 at Proposition 5.5, p. 40: the source says `h¹(E•) = 0`, automatic in amplitude `[−1,0]`; it should say `h⁻¹(E•) = 0`; affects a stated result.

## For the human reviewers

- **Scope.** The merge order lists a board package VirtualFundamentalClasses (line 434) before this roadmap (line 443); the previous review reported that it plans the same rational Chow theory and Behrend–Fantechi class. One of the two must own these objects.
- **Scope.** The merge order lists the consumers StableReductionPartII (344) and VirtualFundamentalClassPartII (345) before this roadmap (443).
- **Scope.** This roadmap's §2.1 now proves the finite scheme cover of a separated Deligne–Mumford stack; VirtualFundamentalClassPartII §1.1 (`README.md:542–556` at its head) proves it for a wider class and does not cite §2.1.
- **Licence.** Vistoli1989 was read from the GDZ scan (Göttingen digitisation); the README links only the publisher DOI 10.1007/BF01388892.
- **Not tested.** The pull request's generated depends-on block lists DerivedDeRhamCohomology as still open; it is on main.
