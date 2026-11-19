# Review of DGAInfinity (pull request #2574 at 56b426c)

**Verdict:** needs changes

**Summary.** Two findings block acceptance. First, this revision adds HopfologicalAlgebra and GeneralAlgebraicKTheory as suppliers, but both already consume DGAInfinity on main, so supply between these roadmaps now runs both ways. Second, a Check in §9.2 states that no finite-dimensional symmetric algebra is smooth, which fails for `k` and for every semisimple symmetric algebra. The three Lean headline theorems match their sources (Keller, Introduction, §3.7; Keller 2006, Proposition 2.4), and none of them is padding. There are nine small corrections, two of them wrong locators (Keller 1994 has no "Theorem 8.0"; the smooth/proper material of Keller's ICM survey is in §4.7, not §5), and three format notes. Two ownership questions are left to the human reviewers.

## R01 (P2) — This revision makes HopfologicalAlgebra and GeneralAlgebraicKTheory suppliers of DGAInfinity, although both already consume it, so supply between them runs both ways

No merge order can put DGAInfinity both before these two roadmaps and after them, so a reader cannot tell which of them is built first. The project's rule is one direction of supply per pair of roadmaps.

How we know:
- §7.4 (line 1312) and the contract at line 2135 take the `K₀` sequence of a thick subcategory from HopfologicalAlgebra §6.1.
- §5.5 (line 1142) and the contract at line 2129 take the triangulated idempotent completion from GeneralAlgebraicKTheory §11.4a.
- On main, HopfologicalAlgebra already consumes DGAInfinity Layers 0, 1, 5 and 7 (`TauCetiRoadmap/HopfologicalAlgebra/README.md` lines 174, 522, 600).
- On main, GeneralAlgebraicKTheory already consumes Layers 5–7 (`TauCetiRoadmap/GeneralAlgebraicKTheory/README.md` lines 13, 69, 2957).
- This README lists both roadmaps under Downstream consumers (lines 1783, 1790) and again under the supplier contracts.
- Main's version of this README cites neither roadmap, so the cycle is new in this pull request.
- Neither cited section uses DGAInfinity: HopfologicalAlgebra §6.1 needs only Mathlib's `trW` and `triangEnvelope` and Tau Ceti's `TauCeti.TriangulatedK0`, and §11.4a needs only Mathlib and its own §11.4. That is why the dependency check, which works section by section, reports nothing. The cycle is between the roadmaps.

The smallest change inside this folder is to drop both supplier contracts:
- **§5.5.** Identify `H⁰` of the DG Karoubi envelope with `Perf(C)`, the thick subcategory of `D(C)`. `Perf(C)` is triangulated as a subcategory of `D(C)` and needs no triangulation of `Karoubi`.
- **§7.4.** State the exact sequence for a thick subcategory of an essentially small triangulated category as the section's own first step, citing Grothendieck (SGA 5) and Verdier. HopfologicalAlgebra already takes Layer 7 from here, so when it is next revised it can cite §7.4 for this statement instead of stating it.

Who should own the general sequence is for the human reviewers to decide (see the last section).

## R02 (P2) — The Check of §9.2 says that every finite-dimensional symmetric algebra is not smooth, which is false for semisimple ones

As written (lines 1532–1534), the Check quantifies over all symmetric algebras: "`A` is right `0`-Calabi–Yau, but it is not smooth, so it has no left Calabi–Yau structure at all". A reader would take this as a general fact. It fails for `A = k` with the identity trace, and for `M₂(k)` with the matrix trace: both are symmetric and separable, hence smooth. For `A = k`, `k! = RHom_{k⊗k}(k, k⊗k) = k ≅ k[−0]`, so `k` is left `0`-Calabi–Yau.

In general a symmetric algebra is self-injective, and a smooth finite-dimensional algebra has finite global dimension (§9.1's own Check). So a symmetric algebra is smooth only when it is semisimple.

The fix: "… `A* ≅ A` as bimodules, so `A` is right `0`-Calabi–Yau. The dual numbers are not smooth (§9.1), so they have no left Calabi–Yau structure; a symmetric algebra is smooth only when it is semisimple."

## C01 — Keller's *Deriving DG categories* has no Theorem 8.0

The Layer 6 introduction (line 1175) and §6.4 (line 1228) cite "Theorem 8.0", so a reader looking for the generator theorem finds nothing at that label. Section 8 of the paper has two theorems: the one in 8.1 (arbitrary targets) and the one in 8.2 (k-flat targets) (KellerDeriving lines 1070–1095). Compactness of the generators is 4.2, Lemma (c), and small objects are §5 (lines 494–531, 646). The statement of §6.4 is supported by these. Cite "Section 8.1, Theorem (8.2 for a k-flat target), with 4.2 and 5.3".

## C02 — Smoothness and its Morita invariance are in §4.7 of Keller's ICM survey, not §5

The Layer 9 introduction (line 1497) points a reader to the wrong section. In Kmath0601185, smoothness, its invariance under dg Morita equivalence, and "smooth and proper" are defined at lines 905–909 (§4.7, p. 20). Section 5 treats invariants (K-theory and Hochschild theory). Replace "Section 5" by "Section 4.7", and keep §5 for the Hochschild invariants if wanted.

## C03 — Convention 12 still places the homotopy-inverse theorem in §2.2

Line 208 says that "the inverse-up-to-homotopy theorem of §2.2" needs `f₁` to be a chain-homotopy equivalence over a general ring. That theorem is now §3.5 (lines 820–823), and §2.2 states only the component equation and Theorem (a). Change "§2.2" to "§3.5".

## C04 — Contents moved out of Layers 2, 3, 4 and 6 are not recorded for the roadmaps that cite them

The layer numbers are kept, but some contents moved: the homotopy-inverse and strictification theorems from Layer 2 to §3.5, the module equivalence from Layer 3 to §6.2, the Deligne–Getzler comparison from Layer 4 to §8.2, and Morita invariance of Hochschild theory from Layer 6 to §§8.1, 9.1 and 10.1. The README records none of these moves.

FukayaTheory on main cites "the general-ring hypothesis of DGAInfinity Layer 2 for an `A∞` homotopy inverse" (`TauCetiRoadmap/FukayaTheory/README.md` lines 153 and 167), which after this change points at a layer that no longer has it. One sentence in the README would let citing roadmaps follow, for example at the head of Layer 2 or under Scope and ownership: "The homotopy-inverse and unit-strictification theorems formerly in Layer 2 are §3.5; …".

## C05 — §8.4 attributes to a Tau Ceti declaration a statement it does not make

Lines 1471–1472 say that, over a `ℚ`-algebra, "the obstruction class is invariant under `A∞` isomorphism", and cite `TauCeti.AInfinityAlgebra.IsMinimal.not_isFormal_of_not_exists_hochschildDifferential_eq_obstruction`. That declaration (Tau Ceti `TauCeti/Algebra/Homology/AInfinity/Algebra/Obstruction/Invariance.lean` line 524) proves something else. For a minimal algebra with `m₃ = ⋯ = mₙ₊₁ = 0` and the grading and product of `H`, it shows that a first obstruction that is not a Hochschild coboundary prevents formality. Its companion `…exists_hochschildDifferential_eq_obstruction_of_isIso` shows that the obstruction is a coboundary when the algebra is `A∞` isomorphic to `H`. Say this instead.

## C06 — §3.5 attaches the Lean name of one direction to an "exactly when" statement

Line 818–819 reads "an `A∞` morphism is a quasi-isomorphism exactly when it has an inverse up to homotopy, `TauCetiRoadmap.DGAInfinity.exists_homotopy_inverse_of_isQuasiIso`". The Lean theorem states only that a quasi-isomorphism has a homotopy inverse. The converse follows from Tau Ceti's `TauCeti.AInfinityHom.Homotopy.cohomologyMap_eq` (`…/Hom/Homotopy.lean` line 253). Either name the Lean statement as the forward direction and cite that lemma for the converse, or state the equivalence in Lean.

## C07 — `LinearHasDegree` restates Tau Ceti's `LinearMap.IsHomogeneous`

`TauCetiRoadmap.DGAInfinity.LinearHasDegree GA GB q f` unfolds to `∀ p x, x ∈ GA.piece p → f x ∈ GB.piece (p + q)`. That is exactly `LinearMap.IsHomogeneous f GA.piece GB.piece q` (Tau Ceti `TauCeti/LinearAlgebra/Graded/LinearMap.lean` line 56). Neither §0.1 nor the supplier contracts name the latter.

To keep StablePeriodicCurved building, define `LinearHasDegree` as that predicate, as was done for `InternalGrading`, and name `LinearMap.IsHomogeneous` in §0.1 and under From Tau Ceti.

## C08 — "Owned elsewhere and consumed here" lists material this roadmap does not consume

The bullets at lines 1846–1848 list StablePeriodicCurved (curved objects) and the downstream application roadmaps. No *Needs:* line cites them: StablePeriodicCurved consumes this roadmap, not the reverse (its Lean file imports this module). They are exclusions of scope, so they would read correctly under "What the roadmap does not claim" or with the heading "Owned elsewhere".

## C09 — The description overstates the Downstream consumers section

The description says that the section "lists the roadmaps that use this one, each checked against its README". It names seven, but about thirty roadmaps on main cite DGAInfinity in their *Needs:* lines. FukayaTheory, for one, cites Layers 2, 4 and 5–6 (its lines 147, 167, 194) and is not listed. Say "lists the main consumers", or add the others.

## N01 — Drinfeld's §1.2 is cited as "Definition 1.2" (line 1262); the paragraph carries no such label, so "Drinfeld, §1.2" would be exact.

## N02 — Convention 14 says Tau Ceti's names begin `TauCeti.`, but several cited Tau Ceti declarations do not (`DerivedCategory.Bounded.perfect_iff`, line 1586; the `CategoryTheory.EnrichedFunctor.*` names of §§1.2, 5.4, 6.1); "most of Tau Ceti's" would be accurate.

## N03 — Several targets carry no locator at the claim: §6.5 (the Morita bicategory), §7.3 (`A∞` quotients; Lyubashenko–Ovsienko appears only in the layer introduction), §10.3 and §10.4. A locator in each sentence would let an implementer find the source statement.

## Questions for the author

- Which source proves the §8.3 statement under its exact hypothesis, the vanishing of the lower `m_k` on consecutive sub-tuples? The README names only May and Keller, Introduction, §3.3. Keller's §3.3 makes only a remark that higher products lift Massey products (Kmath9910179 lines 293–297). Lu–Palmieri–Wu–Zhang's preprint states the result under a different hypothesis, that the Massey product is defined (LPWZ, arXiv math/0606144v1, Theorem 3.1, lines 364–370). We could not read the published version (J. Pure Appl. Algebra 213, 2009, paywalled) to check whether its hypothesis is yours.

## Verified sound

| Statement | Instances tried | Values computed (README / source or library) | Result |
|---|---|---|---|
| §1.2 enriched vs Keller composition | `p = q = 1`; Leibniz in Mathlib order | `f ≫ g = −g∘f`; both sides of `d(f≫g)` equal `(−1)^{pq}[dg∘f + (−1)^q g∘df]` | true |
| §1.2 Check `Λ(x)`, `|x|=1` | `H⁰` endomorphisms | degree-0 part of `H*Λ(x)` is `k` | true |
| §1.3 Check extension along `k → A` | module `k` | `k ⊗_k A = A`; Hom differential `d∘f − (−1)^n f∘d` as Keller Intro line 246 | true |
| §3.1 Check `k[ε]/(ε²)`, `|ε|=−1`, `dε=1` | cohomology, minimality | `d(ε²)=ε−ε=0`; `H=0`, so formal; `m₁(ε)=1≠0`, not minimal | true |
| §5.2 twisted complexes | Drinfeld 2.4 lines 341–353 | `dq+q²=0`, `Df = df + q′f − (−1)^l fq`, `Cone(f)=(Y⊕X[1], q₁₂=f)`: same as README | true |
| §5.3 shift signs | `r=s=1,p=0`; `r=0,s=1` | raw `−d_Hom f`, normalized `+d_Hom f`, reconciled by `(−1)^{1·1}`; second: `−da`; general factor `(−1)^{s−r}` derived | true |
| §5.4 envelope | Drinfeld 2.4 Remark | pretr Yoneda image = finitely generated semi-free modules; Tau Ceti `isTriangulated_oneSided` exists | true |
| §5.5 Perf = compact | Keller 1994 4.2, §5 | representables small and generating; small = thick closure (line 646); `D(k)`: `⨁_ℕ k` not compact | true |
| §6.5 Morita bicategory | delegated invariances | Hochschild §8.1, smooth/proper §9.1, `K₀`/Euler §10.1 each state Morita invariance | true |
| §7.1 Check `k⟨ε⟩`, `dε=1` | contracting homotopy | `d(εx)+ε dx = x`; matches Drinfeld 3.2 (lines 460–465) | true |
| §7.4 Check `B={k⊕k}` | hull, quotient, `K₀` | hull = even `χ`; quotient 0; `K₀=ℤ`; image `2ℤ` vs `ℤ` with thick closure | true; supplier R01 |
| §8.1 Checks `k`, `M₂(k)` | `HH`, derivations, first order | `HH⁰=k`, `HH^{≥1}=0`; `Der(k)=0`, `Der(M₂(k))` dim 3; cocycle from `(a∗b)∗c=a∗(b∗c)` mod `t²` | true |
| §9.1 Checks | dual numbers; acyclic quiver | `Extⁿ(k,k)=k` all `n` ⇒ infinite gl. dim ⇒ not smooth; length-one bimodule resolution ⇒ smooth | true; locator C02 |
| §9.3 Check `C=k`, Adams degrees | `n=2` | `|t|=1−n=−1`; loop `0+2·1=2`, reverse arrow `−1+2=1`, arrow `1`; Keller CY Thm 4.8, 5.2 (`HH_{n−2}`) | true |
| §10.3 Serre identity, paths Check | `χ(P_i,P_j)`, `χ(P_j,I_i)` | both `#paths j→i` (Tau Ceti Projective/EulerForm line 98, Injective/EulerForm line 112) | true |
| §10.4 radicals | left vs right | `x∈leftRad ⇔ Sx∈rightRad` from `χ(x,y)=χ(y,Sx)`; `S≅[d]` acts by `(−1)^d` | true |
| H1 Kadeishvili + Heisenberg `m₃` | `Λ(a,b,c)`, `dc=ab` | `H` dims 1,2,2,1; `m₃([a],[a],[b]) = −(−1)^1 p(a·c) = [ac]`; indeterminacy 0; `m_{≥4}=0` | true; Keller Intro 3.3 |
| H2 Whitehead (Lean) | Keller 3.7(b), probe, `k[ε]`, `|ε|=−1` | over a field, nonunital; one tactic fails; `0→A` inverse, `h₁(1)=ε`, `dh₁+h₁d=1` | true; C06 |
| H3 strictification (2 Lean) | Keller 2006 Prop 2.4; `A=0`; degree-0 minimal | statements match; `B=0,e=0` strict; `m_n=0` for `n≠2` | true |
| H4 derived Morita | `G=k⊕k⟦1⟧` over `k` | `RHom(G,G)` dims: 2 in degree 0, 1 in degrees ±1; Keller 1994 8.1 | true; C01 |
| H5 relative Koszul | BGS 2.3.3, 2.9.1, 2.10.1; `1→2→3` | left form gives `(A!)^op`; `R=0`: dims 6/5; `R=k(ba)`: 5/6 | true |
| R02 §9.2 Check | `A=k`, `M₂(k)` | symmetric, separable, smooth; `k! = k ≅ k[0]`, left 0-CY | false as stated |
| §4.4 Checks MC signs | `k⟨x⟩`, `dx=x²`; `Λ(x,z)` | `d(x²)=0`; `dx−x²=0`; `δ=−x`: `0`; `x`: `2x²`; twisted `d(z)=0` vs `−2xz` | true |
| Conv. 9 signs `n=3,4` | `(−1)^{r+st}` per `(r,s,t)` | all 6 and 10 term signs recomputed; element signs `ε(p)`, `ε(p+q)` as displayed | true |
| §2.1 `op` sign; §3.3 `m₃` | Tau Ceti Opposite line 22, Transfer/Basic line 579 | `(n−1)C2`; `n=2` gives 0 vs 1 for `n(n−1)/2`; `koszulTwist 1 x = (−1)^{|x|}x` | true |
| §10.5, Layer 10 Λ(ε) | `p[k]`; `|ε|=1` | `ch(p[k])=0` in `k`, `χ=p`; `χ(A,A)=1−1=0`, class maps to `1` | true |
| C07 `LinearHasDegree` | unfold both | identical membership condition | duplicate |

- Source locators checked against the text: 41 (Keller Intro §§3.1, 3.3, 3.4, 3.5, 3.6, 3.7, 4.2, 4.3, 7.2, 7.6; Keller 2006 §2.1, Thm 2.3, Prop 2.4; Keller 1994 §§4.1, 4.2, 5, 8.1, 8.2; Drinfeld 1.2, 1.6.2, 2.1–2.7, 3.1–3.5; Keller ICM 4.7, 5; Keller CY 4.1, 4.7, 4.8, 5.1, 5.2; Toën §§4, 6, 7; Shklyarov 2.1, 3.5, 6.2; BGS 2.3.3, 2.8.1, 2.9.1, 2.10.1). Two are wrong (C01, C02).
- Library declarations opened at the pins: 24, including Tau Ceti `CohomologicalUnit.lean` 52/64, `Unit.lean` 46, `Minimal.lean` 62/213, `Hom/Homotopy.lean` 87/253/261/267, `Hom/Cohomology.lean` 378, `Hom/Iso.lean` 199, `Opposite.lean` 325, `Transfer/Basic.lean` 579, `Obstruction/Invariance.lean` 524, `Heisenberg.lean` 648, `MaurerCartan.lean` 217/226, `Graded/LinearMap.lean` 56, `DerivedCategory/Perfect.lean` 192, the quiver Euler-form files, and Mathlib `HomComplex.lean` 980. About 30 further cited names were spot-checked; the rest were resolved by the citation tool.
- Cross-roadmap citations resolved: GrothendieckEulerForms §§2.4, 3.7, 4.4, 5.1–5.6, 7.1–7.2 and Smallness; GeneralAlgebraicKTheory §11.4a; HopfologicalAlgebra §6.1; ZigzagPreprojective §§5.2, 6.1, 7.1; McKaySkewGroup §3.3. All exist on main. The four anchors into this README used elsewhere still resolve.
- Dependency check: `depcheck: 200 roadmaps, 2202 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line). The roadmap-level cycle of R01 is not visible to it.
- Elaboration: `lake env lean` on `Suggested.lean` reports only the three `sorry` warnings. `#check @` of all six declarations matches the README's generality: field `K`, the universes of the docstrings, no lost binders. The one-tactic probe (`rfl | simp | infer_instance | trivial`) closes none of the three theorems, and none is proved at the pins.
- Automatic checks: all passed at this head.

Overlap check: read HochschildHomologyAndHKR (open), ZigzagPreprojective, RationalHomotopyModels, StablePeriodicCurved, GrothendieckEulerForms (main), DerivedInfinityCategories (open); nothing shared. All cite DGAInfinity for its objects, and HochschildHomologyAndHKR owns only the ungraded theory. HopfologicalAlgebra and GeneralAlgebraicKTheory each supply DGAInfinity and consume it (R01).

Source independence: 16 passages compared with 8 sources (Keller Intro, Keller 2006, Keller 1994, Drinfeld, Keller ICM, Keller CY, Shklyarov, BGS), none shared beyond forced formulas and statements of a dozen words; largest share Keller, Introduction (Kmath9910179), 16 of about 90 source mentions; contents compared with its table of contents (lines 12–19): independent (its §3 spreads over Layers 0, 2, 3; §§4–6 over Layers 5–6; §7 over Layers 2, 4, 5; Layers 1 and 7–11 have no counterpart).

Research link: Layers 3, 6 and 9 state Kadeishvili's minimal-model theorem (1982), Keller's derived Morita theorem (1994) and Keller's deformed Calabi–Yau completions (2011), on which ZigzagPreprojective builds its Ginzburg algebras (§6.1) and its Morita and transfer steps; this rests on the README (§§3.4, 6.4, 9.3 and Downstream consumers) and on Keller, arXiv 0908.3499, §§4–5.

## Not verifiable

- Bondal–Kapranov (both papers), Balmer–Schlichting, Schlichting, Thomason, Gerstenhaber, May, Kadeishvili (1982, 1988), Gugenheim–Lambe–Stasheff, Merkulov, Lyubashenko, Lyubashenko–Ovsienko, Lyubashenko–Manzyuk, Getzler, Getzler–Jones, Loday–Vallette, Positselski and Brav–Dyckerhoff: not opened, because they are outside the sample and no sampled target rests on them alone.
- Lu–Palmieri–Wu–Zhang, J. Pure Appl. Algebra 213 (2009): only the arXiv preprint could be read; the publisher's page is paywalled.

Automatic checks set aside as false positives: the citation resolver reports the §0.1 homogeneity predicate `TauCetiRoadmap.DGAInfinity.InternalGrading.IsHomogeneous` (README line 234) as declared nowhere, but this head's `Suggested.lean` declares it at line 81.

## Source issues

- **Misprint** in Kmath9910179 (Keller, Introduction) at §4.1, p. 13: the source says the identification of morphisms into a shift in the derived category with `Extⁿ` is a quasi-isomorphism; it should be an isomorphism of groups; affects nothing.
- **Misprint** in Kmath0510508 (Keller 2006) at §2.2, identity (2.1), p. 2: the source says the identity holds as maps out of the `p`-th tensor power of `SA`; it should be the `n`-th tensor power; affects nothing.

## For the human reviewers

- Ownership: the `K₀` sequence for a thick subcategory is stated by HopfologicalAlgebra §6.1 on main, which also consumes DGAInfinity Layer 7 (its lines 522, 600). R01's repair makes DGAInfinity §7.4 its owner, and HopfologicalAlgebra would cite it when next revised. The choice of owner is yours.
- `TauCetiRoadmap/StablePeriodicCurved/Suggested.lean` (main, line 2) imports this roadmap's Lean module. That is why `Suggested.lean` here keeps three graded definitions that none of its headline theorems uses.
