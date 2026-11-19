# Review of GaugeQuiltFieldTheory (pull request #2577 at e5a7b31)

**Verdict:** needs changes

**Summary.** Changes are needed, for one finding. The third Check of §4.4 asserts that `[id]` and `[S_C^4]` are distinct classes of `H⁰Fun(C,C)`; this is false for the zero category of the sphere value, and for every surface category once `S_C` is the grading shift on lifts to a fourfold Maslov cover, which the text never says it is. There are three small corrections (the cylinder hypothesis of the extension principle, the locator of the categorical field theory in Wehrheim–Woodward, the ambient space of the codimension-one stratum) and one format note, none blocking. Nothing is left for a human to decide.

## R01 (P2) — The third Check of §4.4 says that `[id]` and `[S_C^4]` are distinct classes in `H⁰Fun(C,C)`; they are equal for the zero category, and for every surface category when `S_C` is the grading shift

An implementer reading this Check would build a shift of infinite order, or look for a proof that `S_C^4` is not isomorphic to the identity, and neither exists. The Check (line 360) ends: "where `[id]` and `[S_C^4]` are distinct classes identified only by the congruence". Take `C` the value of `M = ∅`, the category with the single formal zero object (§4.2, line 322): "The shift fixes the chosen zero" and every Hom complex is zero, so `S_C` is the identity functor and `[S_C^4] = [id]`. For the other values the same holds once `S_C` is what Wehrheim–Woodward use: their shift moves the grading of the last Lagrangian, `L ↦ L[1]` (Definition 4.1.5 and Remark 4.1.6(a), ww-coprime lines 1828–1841), and by Conventions 5 a grading is a lift to a fourfold Maslov cover, whose deck group is `ℤ/4`; so `L[4] = L`, the Hom gradings shift by `4 ≡ 0`, and `S_C^4` is the identity on objects.

The underlying gap is that §4.4 says "Construct a shift autoequivalence `S_C`" without saying what it does: `S_C = id` satisfies every law stated there (equivariance, the congruence, descent of composition), and then `A∞(4)/S` is just the category of functor classes. The smallest change: in §4.4 define `S_C` as the shift of the grading of the last factor by the generator of the deck group, with `Hom(S_C L₀, L₁)[1] = Hom(L₀, L₁) = Hom(L₀, S_C L₁)[−1]` (Wehrheim–Woodward Definition 4.1.5, Remark 4.1.6(a)); and replace the last clause of the Check by one that is true, for instance "the congruence identifies `[id]` with `[S_C]` without asserting that `S_C` is isomorphic to the identity in `H⁰Fun(C,C)`". The sentence of the main text "the grading does not assert `S⁴ = id`" (line 354) would then read "no isomorphism `S_C ≃ id` is assumed".

## C01 — The extension principle of §3.1 asks the assignment to send "cylinders to identities", but by Conventions 7 a cylinder is any elementary bordism without critical point, and a mapping cylinder cannot go to an identity

In §3.1 (line 277) the hypothesis reads "sending cylinders to identities". Conventions 7 (line 19) calls every elementary bordism with no critical point a cylinder, and §0.1 (line 29) includes the mapping cylinders of determinant-preserving diffeomorphisms, which run between different decorated surfaces and are only invertible morphisms. Read with that definition the hypothesis fails for the roadmap's own assignment, so the principle could not be applied in §4.5. Wehrheim–Woodward's Theorem 2.2.13 asks only that the trivial morphism `[[0,1] × X]` go to the identity (ww-coprime line 450). A possible wording: "sending the product cylinder `[0,1] × X` with the pulled-back data, the identity of §0.1, to the identity".

## C02 — The functor to `A∞(4)/S` is Wehrheim–Woodward's Theorem 4.2.1, with the target of Definitions 4.1.5 and 4.1.8; the README cites Theorem 3.5.1 for it and no statement of their §4

A reader who opens Theorem 3.5.1 finds the field theory valued in the symplectic category (ww-coprime lines 1489–1499) and, from "with the categorical target replacing their symplectic category" (§4.5, line 366) and "the categorical form of Wehrheim–Woodward Theorem 3.5.1" (§5.1, line 384, and the overview), would conclude that the source does not state the categorical theorem. It does: Theorem 4.2.1 (lines 1877–1891, for coprime positive `r`, `d`), with `ℤ_N`-graded categories with shift in Definition 4.1.5, shift equivalence and `A∞(N)/S` in Definition 4.1.8, and the generalized objects in Definition 4.1.3; §4.1 (line 310) cites Remark 3.5.2 for the latter, which is about correspondences of bordisms. The smallest change: cite Theorem 4.2.1 in §4.5, §5.1 and the *Needs* lines beside Theorem 3.5.1, Definitions 4.1.5 and 4.1.8 in §4.4, Definition 4.1.3 in §4.1, and add them to the References entry. What the README adds to Theorem 4.2.1 (integral coefficients, all integer degrees, rank one, coherent rather than strict shift equivariance) can then be said against the right statement.

## C03 — The codimension-one statement of §3.1 gives its ambient space as "the union of the two strata", which reads as the birth and crossing strata themselves

Unchanged since the previous review. In the first bullet of §3.1 (line 272) the nearest two classes before "the two strata" are the birth and crossing functions, and on that reading a set is a codimension-one submanifold of itself. Cerf's property 1° (cerf-stratification line 744, printed p. 24) takes as ambient space the excellent functions together with those of codimension one, an open subset of the function space. A possible wording: "together they form a submanifold of codimension one of the open set of functions of codimension at most one (the excellent functions together with these)".

## N01 — The connected-level-set target of §3.1 (line 273) names no route; Gay–Kirby prove the `[0,1]`-valued case by their Lemma 4.10 followed by Theorem 4.5 (gay-kirby-morse2 lines 1944–1953), which the bullet could name.

## Questions for the author

- §4.3 (line 338) ends "Concatenation remains the object operation when such geometric replacement is unavailable", while §4.2 (line 324) defines `F_L` by concatenation throughout. Is geometric composition ever the object operation of `F_L`? If not, the clause could go; I could not tell which reading the layers intend.
- §1.6 (line 129) says that Daemi–Fukaya–Lipyanskiy's eq. (2.5) is the form `−∫_X tr₂(a∧b)`. Their `tr` is "defined by applying the inner product of `F`", the `SO(3)` vector bundle (dfl-atiyah-floer line 254), and the text I read does not fix the constant between that pairing and the trace of `2×2` matrices (the trace form of `so(3)` is four times that of `su(2)`). Is the constant `1`? The source does not say, so I could not check it.

## Verified sound

| statement | instances tried | values computed on each side | result |
|---|---|---|---|
| §0.1 decorated bordisms (WW Def. 2.2.1, 2.2.6) | degrees of the two ends; one-handle compression body | `⟨c₁(Λ_Q),[X_+]−[X_-]⟩ = 0` since `[∂Y] ↦ 0` in `H₂(Y)`; ww-coprime 190–209, 297–308 | holds |
| §1.1 moduli and R5 adapter | R5 on main; `r = 1` | R5: "fixed positive definite Ad-invariant inner product", ineffective kernel, finite residual stabilizer; `r=1`: one connection, a point | resolves |
| §1.2 relation model (WW Thm 3.3.3, Rem. 3.3.7 eq. (31)) | `r=2`, `ζ=−1`; `g=0`; `ζ=1`; clock/shift | `ABA⁻¹B⁻¹=−1`; empty product `1≠−1`; pillowcase; `det C = det S = (−1)^(r−1)`; `BAB⁻¹=−A` | holds; ww-coprime 1225–1237, 1320–1348 |
| `relationModuli_genus_one` | `r=1`; `r=2` | `ζ=1`, `SU(1)` trivial, point; `r=2` pair above, unique by Heisenberg uniqueness | statable, not one-tactic |
| `relationSet_stabilizer_central` | `g=0`, `r≥2`; `r=1`; eigenspace of dimension `m` | set empty; centre is everything; `det` of restricted product `1 = ζ^m` forces `r∣m` | holds |
| `relationModuli_simplyConnected` | `g=1`; `ζ=1`, `r=2`, `g=1` | point; pillowcase `S²` is simply connected but hypothesis kept for the model | holds; ww-coprime 1237, 1266 |
| §1.3 `c₁ = 2r[Ω]`, dimension | `r=2`; `r=3,g=2`; `U(r)` count | `c₁=2α`, `α=2[Ω]` gives `4[Ω]`; `16`; `2g·r²−2(r²−1) = (2g−2)(r²−1)+2g` | holds; ss-rank-two 18, 862 |
| §1.5 line tensoring (WW Lemma 3.3.6) | `r=3,d=5,ℓ=−1`; two covering isomorphisms | `d′=2`, `ζ=e^(4πi/3)` both; difference is a gauge of constant determinant, acts as determinant-one | holds; ww-coprime 1290–1297 |
| §1.6 rank two (DFL Rem. 2.2, Lemma 2.43) | sign changes on the §1.2 pair; `r=2` class | `(−A,B)=B(A,B)B⁻¹`; `4π²·(1/4)·c₁ = π²c₁`; dfl 241–246, 673–682 | holds; constant of (2.5) a question |
| §2.1 correspondences (WW Thm 3.4.3, Lemma 3.4.4) | cylinder; `g=1→2`, `r=2`; sphere end | diagonal, dim half; `S³`, dim `3` of `6`; `[C,1]=1≠ζ`, empty | holds; ww-coprime 1366–1397 |
| §2.2 evaluation bundles (SS introductions) | parity `g=2,3`; full turn; Whitney | `p*b₂+q*b₃=p*η₂`; lifts `(−1)(−1)=+1`; `w₂(E⊕E)=2w₂+w₁²=0` | holds; ss-rank-two 30–31, ss-newstead 23–28 |
| §2.3 non-spin handle | `r=2`, `g=2→3` | `w₂(TL₂)=p*η₂`, `η₂=α mod 2≠0` (transgression `d₂y=α`, ss-newstead 314–315), `p*` injective | holds; corrects WW Thm 3.4.3 |
| §2.4 composed lift | ranks in the exact sequence | `TF ⊕ TM₁ ≅ TL₀₁ ⊕ TL₁₂`; both sides add `B₀⊕2B₁⊕B₂` | consistent |
| §2.5 orientation lines (WW orientations Thm 1.0.1) | invertible `D`; `diag(t,1,…,1)` | sign `(−1)^(0·0)=+1`; `(−1)^(1·1)=−1` at `t=0`, `+1` for `t>0` | holds; ww-orientations 143–146 |
| §2.6 monotonicity | `r=2` sphere of Chern number `2`; incoming factor | area `τ_WW·2=1/2=τ_FK·4`; `−1/2=τ_FK·(−4)`; FukayaTheory §3.1 `ω(B)=2τc₁(B)` | holds |
| §3.1 Cerf decompositions (WW 2.2.1–2.2.13; Cerf p. 24; GK Thm 1.4) | interior local minimum; `m=2`; mapping cylinder | level set `{p}` plus a separating part, disconnected; GK needs `m>2`; cylinder ≠ identity (C01) | holds; C01, C03 |
| §4.1 objects and degrees (MWW Thm 1.1) | `m₁,m₂,m₃` mod 4; arity-two terms | `1,0,3`; each term degree `3−k=1` | holds; mww-functors 63–78 |
| §4.2 zero extension and functors | `M=∅`; `L₀₁=∅`; `F_pt` on `C(pt)` | one zero object; composite sends all to `0`; `() ↦ (pt)`, length `0→1` | holds |
| §4.3 weighted adjoints (MWW Thm 1.2) | `φ=λs` on half-line; eigenvalue `a` | `e^((a−2λ)s)v` weighted-`L²` iff `a<λ`; `e^(as)v` iff `a<−λ`; differ on `[−λ,λ)` | holds; mww-functors 90–97 |
| §4.4 shift target, third Check | `C` the zero category; fourfold cover | `S_C=id`, so `[S_C^4]=[id]`; deck group `ℤ/4`, `L[4]=L` | false as written (R01) |
| §4.5, §5.1 field theory (WW Thm 2.2.13, 3.5.1, 4.2.1) | target of Thm 3.5.1 against Thm 4.2.1; rank one; sphere to sphere | 3.5.1 is `Symp`-valued; 4.2.1 is `A∞(4)/S`-valued; zero functor is the identity of the zero category | supported; locator (C02) |

- Source locators read at their lines: 38 (ww-coprime 24, mww-functors 3, ww-orientations 1, dfl-atiyah-floer 3, ss-rank-two 2, ss-newstead 2, cerf-stratification 1, gay-kirby-morse2 2).
- Library declarations opened at the pins: 19. Tau Ceti `CategoryTheory/AInfinity/Basic.lean:83`, `Functor/Basic.lean:97`, `Functor/Comp.lean:419`, `Unit.lean:57,75`, `HomotopyCategory.lean:99,104,294,335,385,396`, `Functor/HomotopyCategory.lean:191,237`, `Geometry/Symplectic/Manifold/TwoForm.lean:115`, `Manifold/TwistedProd.lean:47` (`pr₁*σ − pr₂*τ`), `Lagrangian/Manifold.lean:120`, `Topology/Algebra/UnitaryGroup.lean:115`; Mathlib `LinearAlgebra/UnitaryGroup.lean:278`, `AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:41`. No Stiefel–Whitney class of vector bundles, Cerf decomposition or transformation between `A∞` functors of categories at the pins.
- Cross-roadmap citations resolved on main: HamiltonianReduction R5, SmoothBundlesConnections B1–B5, SpinGeometry G4, CharacteristicClasses C3.2, GeometricTopology §§1.1, 1.3, 1.3.1, HeegaardFloer §1.5 (M.5) and Layers 2–5, FukayaTheory FK0, FK1.1, FK3, FK3.1, FK4.1, FK4.2, FK6.1, DGAInfinity Layer 2 and Standing conventions, DifferentialGeometry Layers 5, 6, 8, AlgebraicTopology §2.6, Layers 4, 6, §6.1, InstantonFloerTheory IF0, IF9.
- Overlap check: read InstantonFloerTheory, FukayaTheory, HeegaardFloer (main and its open revision); DGFloer, FourManifolds and HomotopySpheres searched by object (quilts, the relation model, Gay–Kirby, decorated bordisms); nothing shared. InstantonFloerTheory names this roadmap's Layer 1 the one owner of `M(P,δ)`; FukayaTheory excludes quilt functors and gauge field theories; one-parameter Cerf theory on closed manifolds is HeegaardFloer's and is cited.
- Dependency check: `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder. Automatic checks: all passed.
- Elaboration of `TauCetiRoadmap/GaugeQuiltFieldTheory/Suggested.lean`: three `declaration uses sorry` warnings (lines 59, 67, 78), nothing else. Elaborated types compared with README §1.2: `1 ≤ r`, `IsPrimitiveRoot ζ r` and, for simple connectivity, `1 ≤ g` are in each signature; no binder lost. One-tactic probe on a copy (`simp`, `infer_instance`, `constructor <;> infer_instance`, `exact?`): none of the three theorems closes; no padding.
- Headline theorems: the three relation-model theorems are stated; the moduli, correspondence, Cerf and field-theory headlines are named in the module docstring with the missing carriers.
- Pull request text: agrees with the head (39 Checks counted, the §3.1 targets, the supplier list, no Lean declaration changed). Previous review: it had no finding; its small correction (now C03), its format note (N01) and its question on §4.3 stand, the head being unchanged.

Source independence: 17 passages compared with 8 sources; the longest shared run is 11 words (the determinant connection with curvature concentrated near a base point, ww-coprime lines 1346–1347, a technical phrase); none reproduces a sentence. Largest share ww-coprime, 23 of 34 parenthesized locators. Contents compared with ww-coprime: independent. Its §2.2 (Cerf theory) precedes its moduli sections, while Layer 3 here joins §2.2 and §3.5 after the correspondences, and Layers 2 and 4 draw on the orientation and functor papers; the order moduli, correspondences, Cerf relations, functors is forced by the *Needs* lines of §§2.1, 3.2 and 4.5.

Research link: Layers 2–5 are the connected Floer field theory of Wehrheim–Woodward (2016, Theorem 4.2.1), built on the functors of Ma'u–Wehrheim–Woodward (2018); Layer 1's rank-two case is the surface moduli of Daemi–Fukaya–Lipyanskiy's Atiyah–Floer comparison (2021), consumed by InstantonFloerTheory IF9. Rests on the README and the sources read.

## Not verifiable

- Atiyah–Bott (1983), Theorem 9.12: not read; the README cites it only as cited in the proof of Wehrheim–Woodward Theorem 3.3.3 (ww-coprime line 1266).
- Drezet–Narasimhan (1989), Theorem F: not read; mentioned only as cited in the proof of Proposition 3.3.2 (ww-coprime line 1220).
- The theorem numbering of the published Gay–Kirby (Geom. Topol. 19, 2015) was not read; the README says it cites arXiv v5, which was read.

## Source issues

- **Error** in ww-coprime at Theorem 3.3.3(a) with eq. (26) and Remark 3.2.2(b), printed pp. 17, 27, 29: the source says `c₁ = 2r[ω]` for the form built from `−Tr` with no further constant; it should be for that form divided by `4π²` (rank two: `c₁ = 2α`, `α` twice the level-one class); affects a stated result.
- **Error** in ww-coprime at Theorem 3.4.3 and its proof, printed pp. 32–33: the source says the correspondence of an elementary bordism is a principal `SU(r)`-bundle over the smaller moduli and is spin; it should be an associated bundle with fibre `SU(r)` under conjugation, relatively spin only (rank two, genus two to three: `w₂ ≠ 0`); affects a stated result.
- **Misprint** in ww-coprime at Remark 3.3.4, printed p. 30: the source says that in genus zero the moduli is empty exactly when `d/r` is an integer and a point otherwise; it should be empty when `d/r` is not an integer and a point when it is, as its own proof says; affects nothing.

## For the human reviewers

- none
