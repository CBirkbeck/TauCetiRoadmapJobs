# Review of VirtualFundamentalClass (pull request #1996 at cd5dcf5)

**Verdict:** needs changes

## R01 (P2) — Kresch's tangent invariance is stated without its smoothness hypotheses

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:497`: “In the regular-immersion square with embedded base `Y′ ↪ Y` and pullback `X′ → Y′`, prove invariance under the restricted tangent action `T_{Y′}|_{X′}` of Kresch, Theorem 3.1.”
**Claim:** Kresch's theorem requires `Y′ ↪ Y` to be an immersion of smooth stacks. For a singular `Y′`, `T_{Y′}` is not a vector bundle, so the action is undefined. The negative check at line 501 states no value.
**Witness:** Kresch1999 lines 321–322 (p. 10) state the hypothesis “a local immersion of smooth Deligne-Mumford stacks”. `Y′ = {xy=0} ⊂ 𝔸²` is a regular immersion, and its tangent sheaf has fibre dimension 2 at the origin and 1 elsewhere.
**Repair:** Replace the sentence with: “In the cartesian square with `Y′ ↪ Y` a regular local immersion of smooth Deligne–Mumford stacks and `X′ = X ×_Y Y′`, prove that Vistoli's rational equivalence is invariant under `T_{Y′}|_{X′}`. The group acts trivially on `N_{Y′/Y}|_{X′}` and through Behrend–Fantechi Lemma 3.2 on `C_{X/Y}|_{X′}` (Kresch, Thm. 3.1, p. 10, where the smooth immersion is written `X → Y`). Extend this to smooth algebraic stacks by smooth pullback (Kresch, p. 12). Construct the equivalence as in Kresch, Prop. 2.3, p. 7, with smooth base change from Behrend–Fantechi Props. 3.3–3.4, pp. 25–26.” Replace the negative check with: “Let `X` be the origin of `𝔸²` and `Y′ = {t = 0}`. Then `N ×_Y C = 𝔸³` with coordinates `(n, a, b)` and `∂β = [n = 0] − [b = 0]`, so `β = (𝔸³, c·n/b)`. The translation `a ↦ a + 1` along `T_{Y′}` fixes `β`, and `b ↦ b + 1` sends it to `(𝔸³, c·n/(b + 1))`.”

## R02 (P2) — The flat virtual-pullback theorem has no hypotheses on the base change

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:1148`: “For a cartesian base change `Y' → Y`, construct `𝔠_{X'/Y'} → 𝔠_{X/Y} ×_Y Y'`; prove it is a closed immersion in general and an equivalence for flat base change. Deduce the flat virtual-pullback theorem (Behrend–Fantechi Prop. 7.1).”
**Claim:** The identity `v^![X/Y,φ]vir = [X′/Y′,u^*φ]vir` needs three hypotheses: `v` must be orientable in §2.5, which requires it to be representable; `Y′` must be pure-dimensional; and `X′` must satisfy §9.2's hypotheses for the class. The theorem is Prop. 7.2(1), not Prop. 7.1.
**Witness:** `v : B𝔾_m → Spec k` is flat, and `X = Spec k` gives `X′ = B𝔾_m`, which is not Deligne–Mumford. §2.5 orients only representable morphisms. BehrendFantechi1997 lines 1668–1670 (p. 49) require finite unramified diagonal and `X, X′` separated and Deligne–Mumford.
**Repair:** Append: “For `v : Y′ → Y` flat and representable, with `Y′` pure-dimensional and `X′` a separated finite-type Deligne–Mumford stack with the resolution property, prove `v^![X/Y,φ]vir = [X′/Y′,u^*φ]vir` (Behrend–Fantechi Prop. 7.1 for the cone map and Prop. 7.2(1), p. 50).” Add `B𝔾_m → Spec k` as a negative Check.

## R03 (P3) — Sampled targets lack locators, and §3.3 cites notes that do not construct the object

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:924`: “At a geometric point, identify the coarse intrinsic normal space as a universal obstruction space and prove the curvilinear-obstruction characterization by the fibre of `𝔠_X`.” §§1.6, 4.5 (the cohomological criterion), 6.5 and 7.7 also have no locator.
**Claim:** §6.6 neither states the characterization nor cites a source for it, and the source states it at a `k`-point. Halpern-Leistner's notes, cited at line 576, list properties of the stack cotangent complex but do not construct it.
**Witness:** BehrendFantechi1997 line 1215 (p. 36) takes `p` with residue field `k`, and line 1243 (Prop. 4.7, p. 37) states the characterization. HalpernLeistnerModuli line 3452 refers the full construction to [LMB].
**Repair:** For §6.6: “At `p ∈ X(k)`, prove that the coarse space `N_p` of `p^*𝔑_X` is a universal obstruction space for the deformations of `p` over local Artinian `k`-algebras with residue field `k`. Prove that `v ∈ N_p` obstructs some small extension `k[t]/(t^{m+1}) → k[t]/(t^m)` exactly when `v` lies in the coarse cone `C_p` of `p^*𝔠_X` (Behrend–Fantechi Lemma 4.6 and Prop. 4.7, pp. 36–37).” Add these locators:
- §1.6: “(Behrend–Fantechi Prop. 3.1, p. 23; Lemma 3.2, pp. 23–24)”.
- §4.5, the cohomological criterion: “(Behrend–Fantechi Props. 2.5–2.6, pp. 21–22)”.
- §6.5: “(Behrend–Fantechi Def. 5.2, p. 38; Prop. 5.7, p. 41; Prop. 7.2, p. 50)”.
- §7.7: “(Vistoli (3.6)(ii)–(3.7), p. 635, applied to `X → Spec k`)”.

In §3.3, replace the Halpern-Leistner citation with an exact locator in a text that constructs the cotangent complex of a morphism of algebraic stacks. Otherwise cite the notes only for the properties (§9.1.2, pp. 98–100).

## R04 (P3) — Definitions still lack exact hypotheses, APIs and computed Checks

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:465`: “Extend proper pushforward, flat pullback, localization, and exterior products to these rational stack Chow groups. State representability, relative-dimension, separation, and properness hypotheses on the morphisms”. §§2.3–2.5, 3.1, 5.2, 7.4, 7.7 and 8.1 have no Checks, and §7.2 has no API.
**Claim:** §2.2 defers its hypotheses instead of stating them. The listed definitions have no discriminating Check. Four Checks compute nothing: the third Check of §5.3, the one in §8.4, and the second Check under Layer 3 Examples and under Layer 8 Examples.
**Witness:** Vistoli1989 lines 974–987 (p. 635) define flat pullback for flat `f`, integral pushforward for proper representable `f`, and rational pushforward for proper `f`. For `q : BC₂ → Spec k`, `q_*[BC₂] = ½[pt]`, while a pushforward that ignores stabilizers gives `[pt]`.
**Repair:** In §2.2 write: “Define flat pullback `A_k(Y)_ℚ → A_{k+e}(X)_ℚ` for flat `f` of relative dimension `e`, and proper pushforward `A_k(X)_ℚ → A_k(Y)_ℚ` for proper `f`, integral when `f` is representable (Vistoli (3.6)–(3.7), p. 635).” Add these Checks:
- §2.2: `q_*[BC₂] = ½[pt]`; for `p : Spec k → BC₂`, `p^*[BC₂] = [pt]` and `p_*[pt] = 2[BC₂]`.
- §2.3: `c₁(𝒪(1) ⊠ χ) ∩ [ℙ¹ × BC₂] = [pt × BC₂]` for the sign character `χ`, because `2c₁(χ) = 0`.
- §2.4: for `i : pt → 𝔸¹`, `i^![𝔸¹] = [pt]` and `i^![pt] = 0`.
- §2.5: for `f : ℙ¹ × BC₂ → ℙ¹` and `𝒪(1)`, both sides of the projection formula equal `½[pt]`.
- §3.1: `Ext¹(𝒪, 𝒪)` on `BC_p` is `0` in characteristic 0 and `k` in characteristic `p`.
- §5.2: for the refinement `(U, M × 𝔸¹) → (U, M)`, `C_{U/M×𝔸¹} = C_{U/M} × 𝔸¹`, and its quotient by the line is `C_{U/M}`.
- §§7.4 and 7.7: `deg[Spec k[x]/(x²), L] = 2`, and `deg = ½` for `BC₂` with its canonical theory.
- §8.1: the identity square has the datum `(id, id, 0)`.
- §8.4: the graph `C → C × ℙ²` of a smooth conic has conormal `Ω_{ℙ²}|_C` of rank 2, and the projection has `L = Ω_C` of rank 1.

Add API bullets to §7.2.

## R05 (P3) — The supplier contracts credit AlgebraicVectorBundles with Tau Ceti's relative-Spec and vector-bundle API

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:221`: “`AlgebraicVectorBundles` owns finite locally free sheaves, their tensor, dual, symmetric and exterior operations, relative spectra of quasi-coherent algebras, and geometric vector bundles on schemes.” The From Tau Ceti list (lines 206–211) names none of them.
**Claim:** These objects already exist at the Tau Ceti pin. AlgebraicVectorBundles consumes them, and its labels L1A–L2B point to Tau Ceti files.
**Witness:** On main, `AlgebraicVectorBundles/README.md:359` reads “L1A (relative Spec) is Tau Ceti's RelativeSpec/AffineFunctions.lean”, and line 369 assigns L2B to `VectorBundle/Geometric.lean`. At the pin: `relativeSpecHomIso` (`RelativeSpec/UniversalProperty.lean:455`) and `GeometricVectorBundle` (`VectorBundle/Geometric.lean:118`).
**Repair:** Add to From Tau Ceti:
- `TauCeti.AlgebraicGeometry.relativeSpec` (`RelativeSpec/Functor.lean`), with `relativeSpecHomIso` and `relativeSpecBaseChangeIso` (`RelativeSpec/UniversalProperty.lean`, `RelativeSpec/BaseChange.lean`);
- `gradedRelativeSpecEquiv` (`RelativeSpec/Graded.lean`) and `gradedSymmetricAlgebra` (`Modules/Quasicoherent/GradedAlgebra/SymmetricAlgebra/Basic.lean`);
- `FiniteLocallyFreeSheaf` (`VectorBundle/FiniteLocallyFree.lean`) and `GeometricVectorBundle` (`VectorBundle/Geometric.lean`);
- the scheme blowup `AlgebraicGeometry.Scheme.IdealSheafData.blowup` (`Blowup/IdealSheaf.lean`).

Replace lines 221–224 with: “AlgebraicVectorBundles Layers 1–3 supply stalks and strong monoidality of module pullback, flat base change of internal Hom, and the pullback comparisons of symmetric and exterior powers; its labels L1A–L2B name the Tau Ceti declarations above.” In the pull-request description, replace “Reuse the stack, vector-bundle, scheme-intersection, and derived foundations owned by existing roadmaps” with “Reuse the stack, scheme-intersection and derived foundations owned by existing roadmaps, and Tau Ceti's relative-Spec and vector-bundle API.”

## R06 (P3) — *Needs:* and Dependencies lines omit inputs

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:843`: “*Needs:* §§3.1–3.4.” (§6.1). Layer 5's Dependencies line (826) reads “Layers 0, 1 and 4.” Layer 3's Dependencies line (627) omits SchemeAndStackFoundations §1.10 and DerivedDeRhamCohomology §0.20.
**Claim:** §6.1's equivalence uses `𝔑_X` (§5.1), `h¹/h⁰` (§4.4) and the closed-immersion criterion (§4.5). §5.1 uses `L_X` from §§3.3–3.4. §§3.3–3.4 cite §1.10 and §0.20.
**Witness:** Line 834 reads “Prove this is equivalent to the induced map `𝔑_X → h¹/h⁰(E∨)` being a representable closed immersion”. Line 752 reads “*Needs:* §§1.5–1.6, 3.3–3.4, 4.4.” Lines 585 and 603 cite §1.10 and §0.20.
**Repair:** For §6.1, write “*Needs:* §§3.1–3.4, 4.4–4.5, 5.1.” For Layer 5, write “Layers 0, 1, 3 and 4.” Append “SchemeAndStackFoundations §1.10 and DerivedDeRhamCohomology §0.20” to Layer 3's Dependencies.

## R07 (P3) — The summary states a wider finiteness hypothesis than the construction uses

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:14`: “Thus `X` is a separated Deligne–Mumford stack, locally of finite type over a field; the perfect obstruction theory has amplitude `[-1, 0]`”.
**Claim:** The class is constructed only for stacks of finite type: see the Conventions (line 117), §7.3 (line 984) and §9.2 (line 1130). End goal 3 (line 52) omits finite type altogether.
**Witness:** Line 117 reads “Use finite type over the field for Chow class constructions”. Line 984 reads “For a separated finite-type Deligne–Mumford stack with the resolution property”.
**Repair:** At line 14, write “Thus `X` is a separated Deligne–Mumford stack of finite type over a field”. At line 52, write “If `X` is separated and of finite type over `k`, …”.

## R08 (P3) — The Lean docstring lists the headlines by unattributed source numbers

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/Suggested.lean:10`: “* Theorem 3.11 requires Deligne–Mumford stacks, geometric cotangent complexes and cone stacks.” Line 15 reads: “* Section 7 requires the relative cone and cotangent complex over algebraic stacks”.
**Claim:** The numbers are Behrend–Fantechi's but the source is not named. “Section 7” reads as README Layer 7, which is the absolute construction; the relative case is Layer 9.
**Witness:** `README.md:943` reads “## Layer 7: construction and independence of the virtual class”, and `README.md:1103` reads “## Layer 9: the relative intrinsic cone and virtual class”.
**Repair:** Name each headline by its README end goal and its source. For example: “* End goal 1, the intrinsic normal cone (§5.4; Behrend–Fantechi Thm. 3.11), needs …” and “* End goal 5, the relative class (Layer 9; Behrend–Fantechi §7), needs the relative cone and cotangent complex over algebraic stacks and the associated Chow operations.” Treat the other end goals the same way: 2 (§6.1; Thm. 4.5), 3 (§§7.1–7.4; Def. 5.2, Prop. 5.3), 4 (§§7.5–8.4; Props. 5.5–5.10) and 6 (§7.4).

## R09 (P3) — Cross-roadmap links are pull-request URLs, and the consumed sections are not named

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:1241`: “[Algebraic Gromov–Witten theory](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1998) uses the relative class over the prestable-curve stack. [StableReductionPartII](…/pull/1841) uses rational Chow operations”. Line 231 links DerivedDeRhamCohomology to `pull/868`.
**Claim:** House style forbids pull-request references. StableReductionPartII cites §2.2 for the projection formula, which this head states in §2.5.
**Witness:** At its head, StableReductionPartII `README.md:176` reads “Its §2.2 supplies proper pushforward, flat pullback and the projection formula, including the first-Chern-class case”. This README states the formula at lines 504–506 (§2.5).
**Repair:** Replace the paragraph with: “[AlgebraicGromovWittenTheory](../AlgebraicGromovWittenTheory/README.md) uses Layer 9's relative class over the prestable-curve stack. [StableReductionPartII](../StableReductionPartII/README.md) uses §§2.1–2.3 and the cap action and projection formula of §2.5 on smooth Deligne–Mumford stacks.” At line 231, write “[`DerivedDeRhamCohomology`](../DerivedDeRhamCohomology/README.md) §5.8”.

## R10 (P3) — Scope does not state the boundary with EquivariantIntersectionTheory

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:90`: “The supplier roadmaps do not specify stack dimension, … or Vistoli's rational Chow and bivariant theory for separated Deligne–Mumford stacks.”
**Claim:** EquivariantIntersectionTheory, on main, owns Chow groups of quotient stacks `[U/G]`. For Deligne–Mumford quotients both roadmaps therefore supply a Chow group, and Scope does not say how the two differ.
**Witness:** On main, EquivariantIntersectionTheory `README.md:3` reads “Build the Chow groups of quotient stacks `[X/G]` in the sense of Edidin and Graham”. StableReductionPartII `README.md:6590` proves the comparison of the two itself.
**Repair:** Add to Scope: “EquivariantIntersectionTheory Layer 2 owns the integral Edidin–Graham Chow groups `A^G_*(U)` of quotient stacks `[U/G]`. Layer 2 here builds Vistoli's rational Chow groups of every separated Deligne–Mumford stack and states no comparison with `A^G_*(U)_ℚ`.”

## Previous findings

- R01: repaired. Lines 565–566 read “Construct the cotangent complex for every morphism between the locally finite-type algebraic stacks in scope, including `L_Y = L_{Y/k}`”, and the Check is at line 589.
- R02: repaired. Line 713 reads “`G` perfect of Tor amplitude `[−1,0]`”, and the negative Check is at line 722.
- R03: repaired. Lines 654–659 read “quotients by actions of vector bundles … The trivial action of `B𝔾_a` on a point has quotient `B²𝔾_a`”.
- R04: repaired. Lines 884–889 cover étale pullback, external sums and cartesian base change of relative theories, and the Check is at line 900.
- R05: repaired. Line 601 states the relative lci amplitude. Line 805 gives the locators and the cone map's source and target, and *Needs:* (line 810) adds §§3.3–3.4.
- R06: repaired. Line 1069 reads “apply the rational equivalence and restricted tangent invariance from §2.5”. The §2.5 statement it relies on is now R01.
- R07: repaired. The projection formula is at lines 504–506 and cites Vistoli Def. 5.1; one consumer still cites §2.2 (R09).
- R08: partly repaired. APIs and Checks were added to most subsections, together with the four replacement Checks (lines 366–368, 687, 757, 758), and Scope now precedes Conventions. §§2.2–2.5, 3.1, 5.2, 7.2, 7.4, 7.7 and 8.1 still lack them (R04).
- R09: repaired for every listed subsection; for example, line 695 reads “Behrend–Fantechi Prop. 2.4, p. 20”. Other sampled targets still lack locators (R03).
- R10: repaired at lines 404, 433 and 585.
- R11: repaired. Suggested.lean lines 19–21 open and close the namespace.
- R12: repaired. The description reads “This PR adds the `VirtualFundamentalClass` roadmap.” and “The virtual class applies to separated finite-type Deligne–Mumford stacks with the resolution property…”.
- R13: repaired. Line 126 reads “`B𝔾_a` over `Spec k` has dimension `−1`”.

## Verified sound

| Statement | Instances tried | Left value | Right/comparison value | Result; change |
|---|---|---|---|---|
| §0.1 carriers | SchemeAndStackFoundations on main; the Tau Ceti pin | §1.18 `StackInGroupoids` (README:3538), §1.19 (3612), §1.21 (3744), §1.22 (3797) | Tau Ceti has only `SchPseudofunctor` (`Stack/Basic.lean:37`) | The import is needed and resolves |
| §1.2 Checks | Trivial rank-2 bundle | Dual of rank 2; `∧²` of rank `C(2,2)=1`; `∧³` of rank `C(2,3)=0` | Tau Ceti `rank_exteriorPower_apply` gives `choose` | Correct; scheme-level only; supplier attribution R05 |
| §1.6 exact sequence | `X` = origin, `Y′ = 𝔸² → Y = 𝔸¹` smooth | `T_{Y′/Y}|_0`, `C_{X/Y′}`, `C_{X/Y}` of dimensions 1, 2, 1 | `1 + 1 = 2`; BF Prop. 3.1, p. 23 | Holds; locator missing: R03 |
| §4.4 Checks | `E = k`; `k[1]`; acyclic `[k = k]` | `[0/k] = B𝔾_a`; `[k/0] = 𝔸¹`; point | BF Prop. 2.4, p. 20 (line 674) | Correct |
| §4.5 triangles | `k[1] → 0 → k[2]` | Dual sequence `0 → 0 → 𝔸¹`, not surjective | BF Prop. 2.7, p. 22 requires `G` of amplitude `[−1,0]` | Correct; criterion locator Props. 2.5–2.6 missing: R03 |
| §5.1 Checks | `k[x]/x² ⊂ 𝔸¹`; `(x², xy) ⊂ 𝔸²` | `T → N` is multiplication by `2x`, zero in char 2; conormal ranks 2 at origin, 1 generically | `χ = 2−2 = 0` against `1−2 = −1`: not a vector-bundle stack | Correct; BF Def. 3.6, pp. 27–28 |
| §5.5 lci negative Check | `x+y+z` on the three axes, `k = ℚ` | Image `{ab+ac+bc = 0} ⊂ 𝔸³`, with `(a,b,c) ↔ (xy,xz,yz)` | `(1,1,1)` gives `3 ≠ 0`; in char 3 `(1,1,0)` is missed | Correct in every characteristic; BF Prop. 3.14 error below |
| §6.3 lifting | BF Thm. 4.5, p. 35, (3)–(4) | Obstruction in `Ext¹(g*E,J)`; lifts a torsor under `Ext⁰` | Sheaf of `𝔸¹`-equivariant isomorphisms `ob → 0` | README matches the theorem |
| §6.5 Checks | Line bundle; adding `[K = K]`; base change | `[0 → L]`; `[K → K] ⊕ F•`; `u*F•` resolves `Lu*E` | BF Def. 5.2, p. 38; Props. 5.7, 7.2 | Correct; no locator: R03 |
| §6.6 curvilinear | `k[x]/x² ⊂ 𝔸¹`, `p = 0` | `N_p = (I/mI)∨ = k`, `C_p = k` | `x ↦ t` into `k[t]/t³`: `t² ≠ 0`, obstructed | Agrees with BF Prop. 4.7; locator, `k`-point: R03 |
| §7.1 Checks | Point with zero theory; `𝔸¹`; `Ω ⊕ V[1] → Ω` | `C = pt`; `F₁ = 0`, `C = 𝔸¹`; `C = im(F₀ → F₁) = 0` | BF Def. 5.2, p. 38; proof of Prop. 5.6, p. 40 | Correct |
| §7.2 zero-section formula | Dual numbers, any characteristic | `n = 1 − 1 = 0`; class `[X] = 2[pt]` | BF p. 38: dimension `rk F₀ − rk F₁` | Correct |
| §7.4 public class | Compared with §7.3 | Defined from the existence of a resolution | API present, 0 Checks | Checks missing: R04 |
| §7.5 no obstructions | Char 2, `X = Spec k[x]/x²`, `E = L_X = [𝒪 →0 𝒪]` | `H⁰ = 𝒪` free, `H⁻¹ = 𝒪 ≠ 0`, `X` not smooth | The README hypothesis `H⁻¹(E)=0` excludes it; BF prints `h¹` | README correct; BF misprint below |
| §7.7 degree | `BC₂` with its canonical theory; dual numbers | `deg = ½`; `deg = 2` | Vistoli (3.6)(ii)–(3.7), p. 635; (1.15), p. 620 | No locator: R03; Checks: R04 |
| End goal 1 | `k[x]/x² ⊂ 𝔸¹` | `C = N` of dimension 1, minus `rk T_M = 1` | `0`; BF Thm. 3.11, p. 29 | Correct; not statable at the pins |
| End goal 2 | Pull `0 → L_pt` back to `𝔸¹` | On `H⁰`: `0 → 𝒪` | An isomorphism is required (§6.4 Check) | Correct; not statable |
| End goal 3 | `s = 0` in `𝒪(1)` on `ℙ¹` | `n = 1 − 1 = 0` | `c₁(𝒪(1)) ∩ [ℙ¹] = [pt]`; BF Prop. 5.6 | Correct; not statable |
| End goal 4 | lci dual numbers; product of two zero loci | `[X] = 2[pt]`; virtual ranks add | BF example p. 39; Prop. 5.7, p. 41 | Correct |
| End goal 5 | `pt → B𝔾_m` | `d + n = −1 + 1 = 0`; class `[pt]` (BF Prop. 7.3(1)) | Flat base change along `B𝔾_m → Spec k` is undefined | Base change hypotheses: R02 |
| End goal 6 | §7.4 | Public class from the existence of a resolution | No stack carrier at the pins | Not statable; docstring naming: R08 |
| §2.5 tangent invariance | Origin in `𝔸²`, axis `t = 0` | `∂β = [n=0] − [b=0]` forces `β = (𝔸³, c·n/b)` | `a ↦ a+1` fixes it; `b ↦ b+1` gives `c·n/(b+1)` | Only `T_{Y′}` acts: R01; BF Prop. 3.5 error |
| §2.5 hypotheses | `Y′ = {xy=0} ⊂ 𝔸²`, regular | Tangent fibre dimension 2 at origin, 1 elsewhere | Kresch lines 321–322: smooth Deligne–Mumford stacks | Not a bundle: R01 |
| §9.3 flat pullback | `v : B𝔾_m → Spec k`, `X = Spec k` | `X′ = B𝔾_m`, not Deligne–Mumford | BF p. 49: finite unramified diagonal, `X′` Deligne–Mumford | Missing hypotheses: R02 |
| §2.2 operations | `q : BC₂ → pt`; `p : pt → BC₂` | `q_*[BC₂] = ½[pt]`; `p^*[BC₂] = [pt]` | `p_*[pt] = 2[BC₂]`; Vistoli (3.6), p. 635 | Checks to add: R04 |
| §3.1 derived operations | `BC_p` | `Ext¹(𝒪,𝒪) = Hom(C_p, k)` | `0` in char 0, `k` in char `p` | Check to add: R04 |
| Tau Ceti contract | AlgebraicVectorBundles README:359, 369 on main | L1A and L2B are Tau Ceti files | `relativeSpecHomIso` (`RelativeSpec/UniversalProperty.lean:455`) at the pin | Misattributed: R05 |
| §6.1 *Needs:* | Closed-immersion equivalence | Uses `𝔑_X` (§5.1), `h¹/h⁰` (§4.4), criterion (§4.5) | *Needs:* lists only §§3.1–3.4 | R06 |
| Summary generality | Lines 14–15 against 117 and 984 | Locally of finite type | Finite type | R07 |
| StableReductionPartII citation | Its README:176, at its head | Cites §2.2 for the projection formula | The formula is at README:504–506 (§2.5) | R09 |
| EquivariantIntersectionTheory boundary | `[U/G]`, `G` smooth affine, finite stabilizers | EquivariantIntersectionTheory §2.1 `A^G_*(U)` | §2.1 here: `A_*([U/G])_ℚ` | No boundary clause: R10 |

- **Source locators checked against the text: 26.**
  - BehrendFantechi1997 (arXiv v1): pp. 15, 20, 21–22, 22, 23–24, 25–26, 27–28, 29, 30–31, 34–35, 36–37, 38–39, 40, 41, 42–44 and 48–52.
  - Kresch1999: pp. 7 and 10–12.
  - Vistoli1989 (GDZ scan): pp. 620, 632, 635 and 650–651.
  - Stacks Project: Tags 08SL, 0AFL–0AFR, 07BF and 0GR1.
  - HalpernLeistnerModuli: §9.1.2, pp. 98–100.
- **Library declarations opened at the pins: 19.**
  - Tau Ceti: `SchPseudofunctor` (`Stack/Basic.lean:37`), `Spaces.IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean:195`), `Chow.ChowGroup` (`Chow/Basic.lean:295`), `ChowGroup.pushforward` (`Chow/ClosedImmersion.lean:211`), `toAlgebraicCycle`, `relativeSpec`, `relativeSpecHomIso`, `relativeSpecBaseChangeIso`, `gradedRelativeSpecEquiv`, `gradedSymmetricAlgebra`, `FiniteLocallyFreeSheaf`, `GeometricVectorBundle` and `IdealSheafData.blowup`.
  - Mathlib: `Functor.IsFibered`, `IsStack`, `fppfTopology`, `etaleTopology` and `AlgebraicCycle`, plus `ReesAlgebra.lean:18`, which has no blowup.
  - Neither pin has normal cones, Gysin maps, Chern classes or an algebraic-stack carrier.
- **Cross-roadmap citations resolved: 20.**
  - SchemeAndStackFoundations on main: §§1.10, 1.18, 1.19, 1.21, 1.22, 4.5, 5.1 and 5.5.
  - AlgebraicVectorBundles on main: labels L1A–L2B (README:346–372).
  - DerivedModuleAlgebra on main: §§0.1, 0.4, 0.10, 0.11, 0.17 and 0.25.
  - EnhancedDerivedSheaves on main: §§0.3 and E1.8.
  - DerivedDeRhamCohomology at its open head: §§0.20 and 5.8.
- **Ownership.**
  - The board package VirtualFundamentalClasses (merge order 405) plans the same core. This roadmap comes earlier (24), and that package records the human ownership decision as pending.
  - ImplicitAtlases and GromovWittenTheory build symplectic, topological virtual classes. AlgebraicGromovWittenTheory consumes this roadmap and cites §2.5 for the projection formula.
  - Neither main nor any open head has another owner. The overlap file lists no dropped or revision-only ids.
- **Gate.** The worker's gate is `OK`, with all 29 checks at 0, including `build=0`. My rerun without the candidate order reports only `depcheck: NOT IN ORDER`, which is design-stage placement and not a finding.
- **Dependency check.** `depcheck: 223 roadmaps, 1968 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with no messages. The file has 0 declarations, so the `#check @` comparison and the one-tactic probes have nothing to test. Nothing changed outside the folder.
- **Headlines.** None of the 6 end goals is statable at the pins, because no algebraic-stack carrier or scheme cotangent complex exists there. The docstring names each one (see R08 for the naming).

## Not verifiable

- Fulton1998, *Intersection Theory*: DOI 10.1007/978-1-4612-1700-8 resolves only to a paywalled publisher page; uncertified.
- IllusieI/II, *Complexe cotangent et déformations*, III Cor. 3.1.3 (§3.4): DOI 10.1007/BFb0059052 is paywalled. It was matched only through BehrendFantechi1997 line 946.
- LaumonMoretBailly2000, *Champs algébriques*: the title search resolves only to a paywalled publisher page; uncertified, and the README gives no locator.

## Source issues

- **Error** in BehrendFantechi1997 at Proposition 3.14, p. 31: the source says the intrinsic-cone sequence is short exact for every local complete intersection morphism; it should assert this only for smooth morphisms, since for the Cartier divisor `x+y+z` on the three axes the image `{ab+ac+bc=0}` misses `(1,1,1)`; affects a stated result.
- **Error** in BehrendFantechi1997 at Proposition 3.12, p. 30: the source says that equality of the intrinsic cone and normal sheaf forces a local complete intersection; it should keep only the vector-bundle-stack criterion, since `k[x,y]/(x²,xy)` has ideal `x(x,y)` of linear type, so `C = N`, yet is not lci; affects a stated result.
- **Error** in BehrendFantechi1997 at Proposition 3.5, p. 26: the source says Vistoli's rational equivalence is invariant under `j*N ×_Y T_Y`; for the origin in `𝔸²` and an axis it is `c·n/b`, which is moved by `b ↦ b+1`; it should claim invariance under `T_{Y′}` only; affects the proof of Lemma 5.9; corrected in print at Kresch, Theorem 3.1, p. 10.
- **Misprint** in BehrendFantechi1997 at Proposition 5.5, p. 40: the source says `h¹(E•) = 0`, which is automatic in amplitude `[−1,0]`; it should say `h⁻¹(E•) = 0`; affects a stated result.
- **Misprint** in BehrendFantechi1997 at Example 7.6, p. 52: the source says the zero section of `g*N_{Y/X}`; it should say `g*N_{Y/W}`; affects nothing.
- **Misprint** in Kresch1999 at Theorem 3.1, p. 10: the source says the group is `T_{Y′}|_{X′}`, where `Y′` is the arbitrary stack; this would act trivially, while the proof on p. 12 uses the tangent bundle of the smooth `X`; it should say `T_X|_{X′}`; affects a stated result.
