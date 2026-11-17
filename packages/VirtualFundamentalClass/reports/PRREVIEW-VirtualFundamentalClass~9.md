# Review of VirtualFundamentalClass (pull request #1996 at 21398f9)

**Verdict:** accepted

No finding. Incremental re-review of the 37 lines changed since `d899863`.

## Previous findings

- R01 — repaired: `README.md:1041–1046`: “Assume `k` is algebraically closed for the curvilinear criterion. There is a deformation centred at `p` over `k[t]/(t^m)` with obstruction `v ⊗ t^m` … exactly when `v` belongs to the coarse cone `C_p`”; the Check is at lines 1050–1058.
- R02 — repaired: `README.md:508` “Lemmas (3.8)–(3.9), pp. 636–638”; line 530 “Lemma (3.8), pp. 636–637”; line 541 “Lemma (3.9), pp. 637–638”.
- R03 — repaired: `README.md:284–287` (Stacks Tags 0AFM, 0AFN, 0AFP); lines 709–710 (“Behrend–Fantechi §4, pp. 32–34”); lines 781–784 (“Behrend–Fantechi §2, pp. 16–19, following Deligne in SGA 4, Exposé XVIII, §1.4”).

## Verified sound

| Statement | Instances tried | Left value | Right/comparison value | Result; change |
|---|---|---|---|---|
| §6.6 curvilinear criterion, `k` algebraically closed | `k[x,y]/(x²+y², x³)` over `ℂ`, arc `(t, it+t³)`, `m = 3`; `v = 0`; `m = 1` | `x²+y² = 2it⁴+t⁶ ≡ 0 mod t⁴`, `x³ = t³`: obstruction `(0,1) ⊗ t³`; constant arc gives `0`; every tangent vector lifts, obstruction `0` | `C_p = N_p = k²` (regular sequence, zero linear terms); `0 ∈ C_p` | Correct. BF Prop. 4.7 (line 1243, p. 37) gives `v ⊗ c·t^m`, `c ≠ 0`; `t ↦ λt`, `λ^m = c⁻¹` normalises it |
| §6.6 Check, negative control over `ℝ` | `(α,β)` of minimal order `d`; `α = β = 0 mod t^m` | `ord(α²+β²) = 2d ≥ m`, so `ord α³ ≥ 3d ≥ 3m/2 > m`; `ord α³ ≥ 3m` | `(0,1) ∈ C_p = ℝ²` is no obstruction; `α³ mod t^(m+1)` is independent of the lift (change of order `≥ m+2`) | Correct; the Check separates `ℝ` from `ℂ` |
| §6.6 universal obstruction space | BF Lemma 4.6 | `N_p = (I/mI)∨` injects into every obstruction space | BF line 1227 (p. 36), semi-small extensions over `Art` | Unchanged statement; locator correct |
| §3.5 locator | BF §4 | `ω(g) ∈ Ext¹(g*L_X, J)`, lifts a torsor under `Ext⁰` | BF lines 1069–1078 (p. 32), Prop. 4.1 line 1091, Prop. 4.2 line 1122, Cor. 4.3 line 1132 (p. 34) | Correct |
| §4.3 locator | `d = 0`; `d` mono; `d` epi | `E¹ × BE⁰`; `cok d`; `B ker d` | BF quotient lines 535–544 and homotopy lines 554–563 (p. 16), Prop. 2.1 line 574 (p. 17), Lemma 2.2 line 635 (p. 19), Deligne line 529 | Correct |
| §0.2 locator | `B𝔾_m` by `pt → B𝔾_m` | `dim_u U − dim_{e(u)} R_u = 0 − 1` | Tag 0AFM (Lemma 100.12.1, independence), 0AFN (Def. 100.12.2), 0AFP (Def. 100.12.3, supremum) | Correct |
| §§2.2–2.3 pages | Vistoli Lemmas (3.8), (3.9) | (3.8) at line 1027, (3.9) at line 1049 | running head 635 at line 973, so extraction pages 25, 26, 27 are pp. 636, 637, 638 | Correct |

The rows for the untouched statements stand as in the previous review, of `d899863`.

- Source locators checked against the text: 11 (BehrendFantechi1997 lines 529, 535–563, 574, 635, 1069–1078, 1091, 1122, 1132, 1227, 1243; Vistoli1989 lines 1027, 1049; Stacks Tags 0AFM, 0AFN, 0AFP). Seeded sample in the changed passages: §§3.5, 4.3, 6.6.
- Library declarations: the change cites none; `Suggested.lean` is unchanged and declares nothing.
- Cross-roadmap citations: the change adds none. Consumers of the changed sections resolved: VirtualFundamentalClassPartII cites §3.5 (`README.md:1681`, `1687` at its head) and §0.2, both consistent with this head; no roadmap cites §6.6.
- Gate: the worker's gate at this head is `OK`, every check at 0 including `build=0`; nothing changed outside the folder. A rerun without the candidate order reports only `depcheck: NOT IN ORDER: VirtualFundamentalClass (insert it after its last supplier)`, which is not a defect.
- Dependency check with the candidate order: `depcheck: 248 roadmaps, 2570 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message; no declaration, so nothing for the `#check @` comparison or the one-tactic probe. None of the six end goals is statable at the pins and the docstring names each with the carrier it lacks.
- Pull-request text: the title and the prose agree with this head; the change adds a hypothesis and locators and nothing the description states is contradicted.
- Overlap check: read VirtualFundamentalClassPartII, AlgebraicGromovWittenTheory, MotivicStructuresInModuliOfCurves, StableReductionPartII, MotivesAndAlgebraicCycles, EquivariantIntersectionTheory, SchemeAndStackFoundations, SchemeKTheoryOperations (scope as in the previous review; the change moves no object); rational Chow groups of separated Deligne–Mumford stacks and the Behrend–Fantechi class: this roadmap; integral groups of `[U/G]`: EquivariantIntersectionTheory; integral and non-separated groups: VirtualFundamentalClassPartII.
- Source independence: changed passages only; 4 passages compared with 3 sources, none shared (longest common run 4 words); largest share BehrendFantechi1997, 40 of 65 locators; the change adds, removes and reorders no layer, so the contents comparison stands: independent.
- Research link: the end goals are the main results of Behrend–Fantechi (1997), built on Vistoli's (1989) rational Chow theory with Kresch's (1999) corrected invariance; they are the input of algebraic Gromov–Witten theory, named in the README's Scope and Downstream consumers. Rests on the README and BehrendFantechi1997.

## Not verifiable

- LaumonMoretBailly2000, *Champs algébriques*, Thm. 16.6 (§2.1) and §17 (§3.3): paywalled; not checked against the text.
- Illusie, *Complexe cotangent et déformations I*, III Cor. 3.1.3 (§3.4): paywalled.
- Deligne–Mumford, Thm. 4.12 (§2.1): read only through Vistoli1989 lines 582–584.
- Fulton1998, *Intersection Theory*: paywalled; cited by chapter only. The proof of BehrendFantechi1997 Prop. 4.7 refers to its Prop. 20.2, not read.
- Webb's published Appendix B: the published appendix was not read; arXiv v2 numbering differs.
- Deligne, SGA 4, Exposé XVIII, §1.4 (§4.3): read only through BehrendFantechi1997 lines 528–540.

## Source issues

- **Error** in BehrendFantechi1997 at Proposition 4.7, p. 37: the source says, over any ground field, that a vector obstructs a curvilinear extension exactly when it lies in the cone; it should assume an algebraically closed field, since `ℝ[x,y]/(x²+y²,x³)` fails; affects a stated result.
- **Error** in BehrendFantechi1997 at Proposition 3.12, p. 30: the source says equality of the intrinsic cone and normal sheaf forces a local complete intersection; it should keep only the vector-bundle-stack criterion, since `k[x,y]/(x²,xy)` has `C = N`; affects a stated result.
- **Gap** in BehrendFantechi1997 at Proposition 5.3, p. 39: the source says both resolutions may be taken to map to `E•` by chain maps; it should replace the derived isomorphism by a roof of vector-bundle complexes, which needs the resolution property; affects the proof.
- **Misprint** in BehrendFantechi1997 at Proposition 5.5, p. 40: the source says `h¹(E•) = 0`, automatic in amplitude `[−1,0]`; it should say `h⁻¹(E•) = 0`; affects a stated result.

## For the human reviewers

- **Scope.** The merge order lists a board package VirtualFundamentalClasses (line 434) before this roadmap (line 443); an earlier review reported that it plans the same rational Chow theory and Behrend–Fantechi class. One of the two must own these objects.
- **Scope.** The merge order lists the consumers StableReductionPartII (344) and VirtualFundamentalClassPartII (345) before this roadmap (443).
- **Scope.** This roadmap's §2.1 proves the finite scheme cover of a separated Deligne–Mumford stack; VirtualFundamentalClassPartII §1.1 (`README.md:540` at its head) proves proper covers for a wider class and does not cite §2.1 for it.
- **Licence.** Vistoli1989 was read from the GDZ scan (Göttingen digitisation); the README links only the publisher DOI 10.1007/BF01388892.
- **Not tested.** The pull request's generated depends-on block lists DerivedDeRhamCohomology under “suppliers still open”; it is on main.
