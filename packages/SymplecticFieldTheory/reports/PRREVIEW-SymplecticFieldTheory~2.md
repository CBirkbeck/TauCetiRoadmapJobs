# Review of SymplecticFieldTheory (pull request #1054 at 8a8ce9d)

**Verdict:** needs changes

Gate at this head: every check passed (`depcheck=0 build=0`). `lake env lean` on `TauCetiRoadmap/SymplecticFieldTheory/Suggested.lean` gives exactly three `sorry` warnings (lines 72, 80, 93) and nothing else. The pull request changes nothing outside the roadmap folder. The dependency check on the README as it stands:

```
depcheck: 204 roadmaps, 1417 edges, 0 problem(s)
```

Two blocking findings (an engine planned again, a false degree formula), two P3 notes (Checks, locators).

**The previous review's findings at this head.** R01 (ImplicitAtlases and GromovWittenTheory cited upward, no `*Needs:*` lines): repaired as to the mechanics. The README now has 44 `*Needs:*` lines, one per subsection, naming ContactGeometry CG2/CG4, HeegaardFloer §§2.2, 3.1–3.5, 4.1, 4.3–4.5, DGAInfinity Layers 0–1, StablePeriodicCurved Layer 3, MorseTheory M1 and MorseNovikov N1, all on main; neither later roadmap is cited as a supplier. The GromovWittenTheory comparison is cut from scope (lines 75–80, "takes nothing from the closed theory"), which is a legitimate deferral. The ImplicitAtlases supply was replaced by owning the engine in Layer 4.2; that replacement is the new R01 below. R02 (not in TauCetiRoadmap form): repaired. Counts at this head: `## Layer` 10, `### k.n` 44, `**Checks.**` 44, `### Examples` 10, `### Dependencies` 10, `## Downstream consumers` 1; locators sit at the claims (50 Pardon, 32 EGH, 10 BEHWZ, 12 Latschev, 3 Hind–Siegel citations); the three process sentences are gone (grep for "upstream", "proposal", "when available", "so far", "removed", pull-request numbers: none). R03 (ℤ→ℤ/2 pushforward cited as a "fibre-sum construction"): repaired at lines 339–344, which define the parity grading in words and prove it internal.

## R01 (P2) — Layers 4.1–4.2 plan the virtual fundamental cycle engine that ImplicitAtlases plans

Location: `TauCetiRoadmap/SymplecticFieldTheory/README.md` lines 807–858 (4.2: "construct the package Pardon uses for M(T) … the virtual cochain complex … the canonical isomorphism between its cohomology and the Čech cohomology … quasi-isomorphisms … the direct limit over finite subatlases … the stratified virtual complex … the product map … Prove that the presheaf of virtual cochains … is a pure homotopy sheaf"), lines 759–797 (4.1, the atlas axioms restated from Pardon Definition 3.2), and the scope paragraph at lines 57–66 ("ImplicitAtlases, later in the build, owns the generic virtual-class engine … Nothing here is stated for a general zero set").

Claim: because ImplicitAtlases is later in the merge order, this roadmap states and proves the whole package itself, restricted to the contact atlases, and the generic statements of ImplicitAtlases "specialise to those of 4.2".

Witness: the package is ImplicitAtlases' end-theorem set, stated there for every implicit atlas. At the head of #974, `TauCetiRoadmap/ImplicitAtlases/README.md` line 413 constructs the virtual cochain complex (its §2.3), line 490 the Čech comparison (§3.4), line 550 the virtual class with finite-subatlas independence (§4.3), line 714 the stratified virtual complex (§6.3), line 743 the Čech external product (§6.5), line 208 pure homotopy K-sheaves (§0.8); its lines 25 and 853 name SymplecticFieldTheory as a consumer of V0–V6 that "construct[s] their atlases and witnesses". The proofs are the same in both places: Pardon's §4.1 is, in his words, a review of the results of his 2016 paper (pardon15 lines 2462–2466), and every statement 4.2 lists is quoted there from that paper ((4.1)–(4.4), (4.6)–(4.7), (4.12)–(4.13), (4.16)–(4.18), Lemmas 4.2–4.3, lines 2472–2628), whose structure ImplicitAtlases follows. Restricting the statements to the atlases of 4.1 does not change a line of those proofs. The one genuine difference is that Pardon's contact atlases are stratified by finite categories rather than posets (pardon15 lines 1857–1859, and lines 2570–2572: the argument "applies without modification"), while ImplicitAtlases §6.1 takes a finite poset (its line 685). That extension is the only part of 4.1–4.2 that ImplicitAtlases does not state.

The merge order is not an obstruction: this roadmap is not merged, and the dependency check moves it. On a scratch copy of the README whose 4.2 `*Needs:*` line adds `ImplicitAtlases Layer 2.3, Layer 3.4, Layer 4.3, Layer 6.3, Layer 6.5`, the check reports

```
moved: SymplecticFieldTheory moved in the merge order from #192 to #199, right after its last supplier ImplicitAtlases; checked as moved (the worker moves it there when it submits)
depcheck: 204 roadmaps, 1418 edges, 0 problem(s)
```

so there is no cycle (ImplicitAtlases names this roadmap only as a consumer).

Repair (tested on that scratch copy): make ImplicitAtlases a supplier. Add `### From TauCetiRoadmap.ImplicitAtlases` to the supplier contracts (Layer 1 atlases and boundary atlases, Layers 2–4 virtual cochains, Čech comparison and the virtual class, Layer 5 boundary, refinement, pushforward and regular-manifold normalization, Layer 6 cell-like strata, stratified complex and products), move the scope paragraph's "later in the build" sentence into it, and rewrite 4.1–4.2 so that they own only what is contact-specific: the thickening data, index sets, thickened moduli spaces, regular loci, Kuranishi and footprint maps of Pardon §§3.3–3.6 and the proof that they satisfy ImplicitAtlases' axioms (Theorem 3.23, §§3.7–3.8), the identification of the resulting atlas with o_T and vdim(T), and one new target, the cell-like stratification indexed by a finite category with a final object and poset undercategories (Pardon §3.1, p. 45) with the stratified complex and its Čech identification for it, proved by the poset argument of ImplicitAtlases §6.3 as Pardon's remark at lines 2570–2572 indicates. Everything else in 4.2 becomes a citation: "the virtual cochain complex, pushforward, Čech comparison, finite-subatlas independence, stratified complex and product map of ImplicitAtlases §§2.3, 3.4, 4.3, 6.3, 6.5, applied to the atlases of 4.1". Put the ImplicitAtlases sections on the `*Needs:*` lines of 4.1–4.3 and 5.1; the check then emits the `moved:` line above, which the brief records as not a defect.

## R02 (P2) — The degree formula for the Fock-level derived brackets l_k is wrong unless n = 3

Location: `TauCetiRoadmap/SymplecticFieldTheory/README.md` line 1324 ("l_k has degree |H_Y|−(k−1)|ℏ| in the integer lane and is graded symmetric"), in 7.8, where l_k(f_1,…,f_k)=[…[Q_Y,m_(f_1)],…,m_(f_k)](1) with Q_Y(g)=H_Y·g in the representation p_γ↦κ_γℏ∂/∂q_γ (lines 1303–1306, 1313–1314).

Claim: the k-th derived bracket of the Fock operator has degree |H_Y|−(k−1)|ℏ|.

Witness: the representation preserves degree, since |κ_γℏ∂/∂q_γ| = |ℏ|−|q_γ| = 2(n−3)−|q_γ| = |p_γ| by 7.2 (line 1129), so |Q_Y| = |H_Y| = −1 and a nested graded commutator of Q_Y with k multiplication operators, evaluated at 1, has degree |Q_Y|+Σ|f_i|: every l_k has degree −1. Computed instance with n = 2 (|ℏ| = −2): three orbits with |q_1| = |q_2| = 0, |q_3| = 3, hence |p_1| = |p_2| = −2, and H = p_1p_2q_3 of degree −1. Then Q(g) = ℏ²q_3∂_1∂_2 g, [Q,m_(q_1)](g) = ℏ²q_3∂_2 g, and l_2(q_1,q_2) = [[Q,m_(q_1)],m_(q_2)](1) = ℏ²q_3, of degree 2·(−2)+3 = −1 = |q_1|+|q_2|−1. The README's formula gives the operation degree −1−(2−1)(−2) = +1, which would make |l_2(q_1,q_2)| = 1. The formula is the degree of the rational brackets {…{h,f_1},…,f_k} of 9.4 before that section's regrading by |f|−d (lines 1639–1641 compute exactly ((d−1)+Σ|f_i|−kd)−d), not of the Fock-level brackets defined here. The bullet also contradicts the next bullet (line 1325), since a curved L∞ structure needs all l_k of one degree.

Repair: replace the bullet by "l_k has degree |H_Y| = −1 for every k, because the normal-order representation preserves degree; it is graded symmetric. The rational brackets of 9.4 have degree −1−(k−1)·2(n−3) before the regrading of that section, and the two agree after dividing l_k by ℏ^(k−1)." Add the n = 2 instance above as a Check of 7.8.

## R03 (P3) — Four Checks do not test what they claim

Location and claims, all in `TauCetiRoadmap/SymplecticFieldTheory/README.md`:

- Line 1176–1178 (7.3, third Check): "K=ℏ·(q_γ) with K⋆K=0 and [K,−]/ℏ=[q_γ,−] … D(p_γ)=−κ_γ ℏ·ℏ⁻¹·… so the master equation forces the p-free part of K to be absent". Witness: for q_γ odd, K⋆K = ℏ²q_γ² = 0, D = [q_γ,−] and D² = 0, so K is a solution of the master equation with a nonzero p-free part; D(p_γ) = −(−1)^(|p||q|)κ_γℏ ≠ 0 shows only that D is not zero. The master equation forces nothing here; the absence of p-free terms in the punctured sector is a property of the carrier (7.5, line 1232: "exclusion of standalone constant maps is part of the specified punctured carrier"), which this Check contradicts. The displayed formula is also truncated ("·…"). Repair: replace the Check by "K=ℏq_γ with q_γ odd satisfies K⋆K=0 and D²=0 although it is p-free; the master equation does not exclude p-free terms, the punctured carrier of 7.5 does, and 7.7 keeps them in the vacuum sector."
- Line 1203 (7.4, second Check): "D_X²(m)=H⁻H⁻m−(−1)^(|m|+1)(H⁻m)H⁺−(−1)^(|m|)H⁻(mH⁺)+mH⁺H⁺". Witness: with |m| even, D_X(m) = H⁻m − mH⁺ is odd and D_X²(m) = H⁻(H⁻m−mH⁺) + (H⁻m−mH⁺)H⁺ = H⁻H⁻m − mH⁺H⁺; the last sign is minus. The conclusion of the Check is unaffected. Repair: change the last sign.
- Lines 1056–1058 (6.3, fourth Check): "With da=b and db=1 … d₁²=0, while d²(a)=d(b)=1≠0: the full d is not a differential, and the projection has hidden the failure." The target (line 1045) and 5.2's Check (line 948) promise the opposite phenomenon: a genuine differential whose length-one projection loses square zero. The example given is not a differential, so it witnesses nothing about projections. Witness of the promised phenomenon: generators a (odd), u, v, w with da = 1, du = v − a·w, dv = w, dw = 0 (degrees |a| = 1, |v| = |w|+1, |u| = |w|+2). Then d²u = dv − d(aw) = w − (w − a·dw) = 0, d²v = d²a = d²w = 0, so d² = 0 by 0.5; the length-one part has d₁u = v, d₁v = w, so d₁²u = w ≠ 0. Repair: replace the Check by this example.
- Line 279 (0.2, third Check): "The double cover of a hyperbolic orbit with one negative eigenvalue pair in (−1,0) is bad". Witness: a pair of eigenvalues in (−1,0) is an even count and the double cover is good by Pardon (2.59) (pardon15 line 1747); the intended instance is one eigenvalue in (−1,0) (its partner 1/λ lies below −1). Repair: "with exactly one eigenvalue in (−1,0)".

## R04 (P3) — Locators that point to the wrong section, page or statement

Location: `TauCetiRoadmap/SymplecticFieldTheory/README.md`. Each item gives the line, the locator as written, the passage read, and the correction.

- Line 498 (1.4): "BEHWZ §9.2, p. 49" for compactness of buildings. behwz03 line 1913: §9.2 is "Energy bounds for holomorphic curves in the process of splitting"; the compactness theorems are §10, Theorems 10.1–10.3, printed page 849 (behwz03 lines 2020–2031; Pardon cites them as Theorem 2.27, pardon15 line 1381). Correction: "BEHWZ §10, Theorems 10.1–10.3, p. 51 of the arXiv text; Pardon Theorem 2.27, p. 34".
- Line 1154 (7.3): "Latschev §2.5, p. 10, the coderivation D_h for h of degree 2N−1". latschev22 lines 93–119 define D_h in §2.1 (p. 3) and Lemma 1 (p. 4, line 122) gives the codifferential property; §2.5 (line 440) is about Maurer–Cartan elements and morphisms. Correction: "Latschev §2.1, pp. 3–4".
- Line 1519 (9.2): "Latschev §2.5, pp. 10–11, the filtered ground ring and the completion before the exponential". latschev22 lines 400–416: this is §2.4 (p. 10), and (4) and Definition 8 are on p. 11 (lines 422–425). Correction: "Latschev §2.4, pp. 10–11".
- Line 259 (0.2): "Pardon Definition 2.46 (p. 42)". pardon15 line 1685: Definition 2.46 is on p. 41. Line 416 (1.1) and lines 566–567 (2.1): "Definitions 2.34 and 2.36 (p. 35)". Definition 2.36 is on p. 36 (pardon15 line 1485). Line 955 (5.3): "Pardon §1.3, p. 5, (1.11)". (1.11) is on p. 6 (pardon15 line 233).
- Lines 465–466 (1.3): "EGH Theorem 2.2.2, p. 49, the Stokes argument" for the exclusion of nonconstant closed components in the exact case. Theorem 2.2.2 is the master equation; the positive-puncture statement is Proposition 1.6.4 (egh00 lines 630–631, p. 16) and Proposition 2.2.1(c) with inequality (18) (egh00 lines 2103–2133, p. 48). Correction: cite those.
- Line 1192 (7.4): "prove D_X²=0 from the endpoint master equations (EGH Proposition 2.3.2, p. 57)". Proposition 2.3.2 (egh00 lines 2585–2597) is about D_F with D_W(e^F) = 0 as hypothesis; D_W² = 0 from Theorem 2.2.2 is the sentence after (41) (egh00 lines 2573–2574). Correction: "EGH (41) and the remark following it, p. 57".
- Lines 807–858 (4.2): every locator is into Pardon's §4.1, which only recalls the results from his 2016 paper (pardon15 lines 2462–2466; the paper is J. Pardon, An algebraic approach to virtual fundamental cycles on moduli spaces of pseudo-holomorphic curves, Geom. Topol. 20 (2016), arXiv:1309.2370). Whatever 4.2 keeps after R01 cites that paper at the statements Pardon names (Definitions 4.2.4, 4.2.6, 4.2.7, Theorem 4.3.4, Proposition 4.3.3, Lemma 5.2.6, Definition 6.2.2, Proposition 6.2.3, Definition 6.3.2, Definition A.2.5, A.5.1, Proposition A.5.4; pardon15 lines 2475–2601), and the References list it.

## Verified sound

**Principles.** No route-specific shortcut: the contact construction is over ℚ for every closed cooriented contact manifold with nondegenerate orbits and tame cylindrical J (lines 91–104), as in Pardon's Setups I–IV (pardon15 lines 307–321). No copied passages (4.1 and 4.2 paraphrase Pardon Definition 3.2 and §4.1 clause by clause but in the README's words). No algorithm, no sorry'd data, no `set_option`, no `lemma`; the only import beyond `Mathlib` is `TauCeti.Algebra.Module.GradedModule.Internal`, which exists at the pin. The duplication question is R01.

**Gate and build.** `gate.md`: every check passed. `lake env lean` from the pull-request worktree: three `sorry` warnings only. Dependency check: quoted above, 0 problems, no UPWARD, CYCLE or `moved:` line.

**Supplier citations resolved on main** (content at fa41b37): ContactGeometry CG1 (line 59), CG2 (75), CG4 (121, with `ω=dθ=−dλ` at line 126), CG6 (242) in `TauCetiRoadmap/SymplecticGeometry/ContactGeometry/README.md`; HeegaardFloer §2.2 = F0.0 (line 1222), §3.1–3.5 = F1.1–F1.5 (1818–1982), §4.1 = F2.1 (2081), §4.3–4.5 = F2.3–F2.5 (2259–2282) in `TauCetiRoadmap/HeegaardFloer/README.md`; the small-rotation witness there (lines 1960–1970: exp(tJS) has CZ = −signature(S)/2, a small positive rotation has index −1, S = −εI gives CZ = +1, CZ(Ψ) = −μ_RS(graph Ψ,Δ)) agrees with the README's 1.1 Check (S_γ = ε gives −1) and 2.3 Check (S = −εI gives +1); the punctured Riemann–Roch with `A_e=−J∂t−S_e(t)`, `D=∂s−A_e` and the sign −Σ⁺CZ+Σ⁻CZ in HF's convention (lines 2022–2029) is what 2.3 inverts to +Σ⁺CZ_SFT−Σ⁻CZ_SFT. DGAInfinity Layer 0 (line 263) and Layer 1 (293); StablePeriodicCurved Layer 3 (273, differential modules and periodic complexes); MorseTheory M1–M6 (lines 90–649); MorseNovikov N1 (line 75, Nov(R,H,N) at 77). HamiltonianFloerOperations line 22 names this roadmap as owner of contact/Reeb buildings. ImplicitAtlases at the head of #974 as in R01.

**Pinned declarations opened** (all present): Mathlib `CategoryTheory.cechComplexFunctor` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean` line 65), `Representation.invariants` (`Mathlib/RepresentationTheory/Invariants.lean` line 73), `RingQuot.mkAlgHom` (`Mathlib/Algebra/RingQuot.lean` line 462), `SymmetricAlgebra`, `GradedTensorProduct`, `Int.negOnePow`, `TensorAlgebra.gradedAlgebra`; Tau Ceti `InternalGrading` with `isInternal` (`TauCeti/Algebra/Module/GradedModule/Internal.lean` lines 85–89), `gradedTensorGrading` (line 71), `isInternal_gradedTensorGrading` (76), `gradedTensorLift` (166) in `TauCeti/RingTheory/GradedAlgebra/TensorProduct.lean`, `isDGAlgebra_gradedTensorGrading` (164) and `dgTensorLift` in `TauCeti/Algebra/Homology/DG/Algebra/TensorProduct.lean`, `GradedAlgebra.isInternal_quotientPiece` (45) and `quotientPiece` in `TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.lean`, `IsDGAlgebra` in `TauCeti/Algebra/Homology/AInfinity/Algebra/DG.lean`.

**Signatures.** A scratch file with `#check @name` for all 7 declarations was elaborated; every type agrees with the worker's `signatures.md` and with the README's 0.3 and 0.5 statements (an internal ℤ-grading on a ℚ-module, ℚ-linear maps, the Leibniz rule for homogeneous a and arbitrary b, hδ into the piece of degree p+1). No binder lost.

**Padding probe.** Each of the three sorried theorems was tried, on a scratch copy, with `first | infer_instance | rfl | simp | aesop | exact ⟨inferInstance⟩ | simp [LinearMap.ext_iff] | decide`: all three fail (free-variable error for the `Nonempty (GradedAlgebra …)` goal, unsolved goals for the other two). None is padding. The three are the only statable headline theorems; the docstring lists the unstatable ones with the missing carriers (contact structures, Reeb fields, punctured maps, virtual counts), which the pinned libraries indeed lack (grep of both trees for "contact", "Reeb", "symplectization": none).

**Sources read** (arXiv texts in the worker's cache; ids as in the previous review): pardon15 (1508.03873v4), egh00 (math/0010059v1), behwz03 (math/0308183v3), latschev22 (2212.01814v1), hindsiegel24 (2410.19936v1), ishikawa18 (1807.09455v3). All printed pages equal the arXiv page numbers used in the README. The seeded sample:

- 0.3: Pardon (1.1), p. 3, free supercommutative algebra on o_γ for good γ (pardon15 lines 130–141).
- 1.4: BEHWZ §7.2 buildings of height k with cross-ordering, pp. 35–37 (behwz03 lines 1428–1516); Pardon §2.9 Gromov topology, p. 29 (line 1166); Pardon §2.10, p. 32, with Theorem 2.27 at p. 34 (lines 1292, 1381–1385). The BEHWZ compactness locator is R04.
- 2.1: Pardon §2.11, p. 34 (line 1393), Definition 2.34, p. 35 (line 1449); Definition 2.36 is p. 36 (R04).
- 4.2: Pardon §4.1 pp. 58–62: (4.1) line 2472, (4.2)–(4.4) lines 2478–2482, (4.6)–(4.7) lines 2500–2503 and the direct limit lines 2505–2507, Lemma 4.2 line 2508, (hSh1)–(hSh3) lines 2521–2525, (4.8)–(4.9) lines 2531–2533, (4.12)–(4.13) lines 2559–2569, (4.16)–(4.18) lines 2598–2612, Lemma 4.3 line 2607, (4.23) line 2649. Every statement matches, and every statement is a quotation from Pardon's 2016 paper (R01, R04).
- 5.2: Pardon §1.2, pp. 3–4, the coefficient 1/|Aut| and the Leibniz rule (lines 173–181); Theorem 1.1 in §1.6, pp. 7–8 (lines 302, 322–342).
- 6.2: Pardon §1.8, p. 12, cylindrical contact homology and asymptotically hypertight forms (lines 484–494).
- 6.3: no external locator; the algebra examples are recomputed below.
- 7.1: Latschev §2.1, p. 2, power series in p with polynomial q-coefficients (latschev22 lines 61–67); EGH §2.2, p. 49, the Weyl algebra (egh00 lines 2141–2146).
- 7.2: Latschev §2.1, p. 2, bracket of degree −2N with {p_γ1,q_γ2} = κδ (lines 68–72); EGH (19), p. 49 (line 2151); degrees of p, q at p. 47 (lines 2034–2035), of ℏ at p. 48 (line 2073); Example 2.2.4, p. 50, deg ℏ = −4 (line 2260).
- 7.5: no external locator; the weight argument is recomputed below.
- 7.7: EGH §2.2, p. 48, H|_(p=0) = H_const counting constant curves (lines 2082–2096).
- 7.8: EGH p. 49, the left representation p_γ = κ_γℏ∂/∂q_γ (lines 2152–2158); p. 48, H at p = 0 (line 2084).
- 8.1: Hind–Siegel §3, p. 5 (hindsiegel24 line 201) and §4, p. 11 (line 423); EGH Proposition 1.7.2, p. 17 (lines 694–708).
- 8.4: Hind–Siegel p. 27, nonexact twisted functoriality and the Maurer–Cartan element from rigid planes (lines 1113–1128); EGH (38), p. 56 (lines 2523–2537).
- 9.6: Hind–Siegel p. 27 (lines 1113–1116: a nonexact cobordism "does not typically induce a map").

Other locators checked: Pardon Definition 2.48 and (2.58), p. 42 (lines 1733–1740); (2.59) and Definition 2.49, p. 43 (lines 1747–1757); Definition 2.28, p. 34 (line 1396); (2.50) and Definition 2.43 (2.52), p. 40 (lines 1642–1658); Definition 3.2, pp. 46–47 (lines 1889–1924), Definition 3.3 and Remark 3.4, p. 47 (lines 1925–1929), §3.1 pp. 45–46 (lines 1855–1877), §§3.3–3.6 pp. 49–55 and Theorem 3.23, p. 55 (line 2329), §3.7 p. 55 (line 2333), §3.8 p. 57 with Theorems 3.31–3.32; §1.7 (1.22) pp. 8–9 (lines 350–357); §1.8 pp. 14–15 chain homotopy versus DGA homotopy (lines 595–614); §1.8 p. 11 grading (line 457); §§4.3–4.9 pp. 63–76 and §§5.1–5.4 pp. 78–94 (section starts confirmed). EGH Proposition 1.7.1, p. 16 (lines 644–652); Lemma 1.8.8, p. 27 (lines 1127–1129); Remark 1.9.2, p. 34 (lines 1454–1465); (36) p. 55 (lines 2487–2508); (41) p. 57 (line 2572); Theorem 2.3.3, p. 58 (lines 2600–2609); (78) p. 67 (lines 3002–3021); Lemma 2.5.1, p. 68 (lines 3052–3054); (79) and (80) p. 69 (lines 3105, 3115–3116). Latschev p. 11 h^a and h^a|_(p=0) = 0 (lines 435–439), pp. 11–12 Φ(1) = e^(f⁰) and the p⁺-degree-zero part (lines 453–461), Lemma 10 and Φ_a, pp. 12–13 (lines 471–494), L_f at p. 6 (lines 219–227). BEHWZ §2.1 p. 4, §2.2 p. 5, §2.3 p. 6, §3.2 p. 9, §3.3 p. 10, §5.3 p. 22 (Hofer energy, lines 836–860), §6.1 p. 31 (line 1247). Ishikawa abstract, p. 1 (lines 8–23). Hind–Siegel §5, p. 15 with Disclaimer 5.1 (lines 633–644).

**Duplication by object.** `roadmaps grep` over the 433 open pull requests and main: "contact homology", "holomorphic building", "supercommutative", "Reeb orbit" occur only in this roadmap (plus ContactGeometry line 266, which defers contact homology to a Floer roadmap); "symplectic field theory" elsewhere only in reference lists and consumer sentences (AnalyticStableMaps line 1107, GromovWittenTheory line 766, GaugeQuiltFieldTheory line 3); "implicit atlas" and "virtual fundamental cycle/class" in ImplicitAtlases, GromovWittenTheory, AnalyticStableMaps, DGFloer and FukayaTheory, all as consumers of ImplicitAtlases V0–V6 (R01). No second owner of the orbit algebra, the Reeb-end compactification, the Weyl, Fock and potential carriers or the twisted receiving maps.

**Adversarial pass** (values computed on each side):

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `signedSwapRel`: x⊗y ~ (−1)^(pq) y⊗x (0.3) | x=y odd; p=0,q=5; p=−1,q=3 | x² ~ −x², 2x²=0, x²=0 over ℚ; sign +1; (−1)^(−3)=−1 via `Int.negOnePow` (elaborated as (−1)^natAbs) | correct | none |
| `signedSymPiece` (0.3) | V=0; V=ℚx, \|x\|=1, piece 2; \|x\|=0, piece 2; empty word | ℚ in degree 0 only; x²=0 so piece 2 = 0; ℚx² ≠ 0; 1 ∈ piece 0 | agrees with the five Checks | none |
| `nonempty_gradedAlgebra_signedSymPiece` | T(⊕V_p) = ⊕ words; relation homogeneous | pieces of T(V) are ⊕V_(p_1)⊗…⊗V_(p_k); generators of the relation lie in one piece; `isInternal_quotientPiece` descends the grading | true | none |
| `exists_unique_odd_extension`, existence | relation compatibility | d(xy)=δx·y+(−1)^p x·δy; d((−1)^(pq)yx) = (−1)^(pq)(δy·x+(−1)^q y·δx); with \|δx\|=p+1: y·δx = (−1)^(q(p+1))δx·y gives equality | true with hδ | none |
| same, hδ dropped | V=ℚ³ odd, δx=z, δy=δz=0 | d(xy)=zy, d(−yx)=yz=−zy, so 2zy=0 but zy≠0 in Λ(ℚ³) | fails; hδ present and the README's second Check records it | none |
| same, uniqueness and d(1) | a=1∈piece 0; induction on word length | d1=d1+d1 so d1=0; d(x_1⋯x_k) determined by δ | determined | none |
| `odd_square_zero_iff_generators` | a∈piece p, b arbitrary | d²(ab)=d²a·b+(−1)^(p+1)da·db+(−1)^p da·db+a·d²b = d²a·b+a·d²b; zero on generators ⇒ zero on words ⇒ zero (words span, `mkAlgHom` surjective) | true | none |
| same, hdeg dropped | \|x\|=\|y\|=0, d=y∂_x | d²x=d²y=0 on generators, d²(x²)=d(2xy)=2y²≠0 | fails; hdeg present, third Check records it | none |
| parity grading of G (0.4) | G on ℚx⊕ℚy, \|x\|=0, \|y\|=3 | even piece ℚx, odd ℚy; signs (−1)^(pq) depend only on parities, so the ℤ- and parity relations generate the same ideal | sound | none |
| good/bad criterion (0.2) | simple; odd cover; double cover with one eigenvalue in (−1,0); with two | ℤ/1 trivial; hom from odd cyclic to ±1 trivial; (2.59): (k+1)·#=3·1 odd ⇒ bad; # = 2 ⇒ even ⇒ good | criterion right; Check wording wrong | R03 |
| parity = sign det(I−A_γ) (0.2) | RS identity (−1)^CZ = (−1)^(n−1) sign det(I−Ψ(1)) on rank 2n−2 | (−1)^(CZ+n−3) = (−1)^(CZ−(n−1)) = sign det(I−A) | agrees with pardon15 lines 1733–1738 | none |
| ellipsoid CZ and parity (6.4) | n=2, a_1<a_2, k=1: CZ=(n−1)+2Σ⌊ka_i/a_j⌋ | 1+2(1+0)=3; \|q\|=CZ+n−3=2; general parity n−1+even, \|q\| ≡ 2n−4 even; elliptic return maps have no eigenvalue in (−1,0) | all even, d=0, all good | none |
| trivial-loop spectrum (1.1 Check) | A=−i∂_t on period-1 loops | eigenfunctions e^(2πikt), eigenvalues 2πk; S=ε shifts to 2πk−ε, 0 ↦ −ε | agrees; CZ=−1 matches HF line 1962 | none |
| trivial cylinder kernel (2.1 Check) | ∂s−A on ξ ⊕ (ℝ⊕ℝ) | nondegenerate A: no bounded solutions; tangential constants: 2 dimensions; positive weight on both ends excludes constants | kernel 2 then 0 | none |
| index formula (2.3) | trivial cylinder; plane; one-positive tree | 0+0+CZ−CZ=0, vdim −1 after the symplectization vertex; (n−3)+CZ⁺+2c₁; (n−3)(1−k⁻)+CZ⁺−ΣCZ⁻+2c₁ = pardon15 (2.50) | agrees | none |
| plane automorphisms (2.2 Check) | Aff(ℂ), g=0, k=1 | dim Teich − dim Aut = 6g−6+2k = −4; n(2−k)+2c₁+CZ−4 = (n−3)(2−k)+… for k=1 | formula subtracts the 4 affine dimensions | none |
| trivialization change (2.3) | winding w on a positive end | CZ^τ ↦ CZ^τ+2w, c₁^τ ↦ c₁^τ−w, so 2c₁^τ ↦ 2c₁^τ−2w | total unchanged; HF line 2018 has CZ_(e′)=CZ_e+2wind | none |
| two negative ends on one odd orbit (3.3) | swap sign (−1)^1 | labelled count = −(labelled count), unlabelled coefficient of q_γ² is 0, and q_γ²=0 for odd γ | consistent with 0.3 | none |
| atlas axioms (4.1) vs Pardon Definition 3.2 | data (i)–(vii), axioms (i)–(x) | footprint of a union = intersection (iii); homeomorphism axiom (v); free action (vii); submersion model X_I^reg × ℝ^(dim E_(J∖I)) (ix); covering (x) | faithful paraphrase; ownership is R01 | R01 |
| VFC package (4.2) vs Pardon §4.1 | (4.1)–(4.4), (4.6)–(4.9), (4.12)–(4.13), (4.16)–(4.18), Lemmas 4.2–4.3, (4.23) | each matches the quoted statement; each is quoted from Pardon's 2016 paper, planned in ImplicitAtlases §§2.3, 3.4, 4.3, 6.3, 6.5 | statements right; owner wrong | R01, R04 |
| regular rigid curve (4.2 Check) | M a point, trivial isotropy | Čech cohomology ℚ in degree 0; Lemma 4.2 gives evaluation on the fundamental class, ±1 | agrees | none |
| face with Aut of order 2 (4.2, 4.3 Checks) | (4.23) | factor 1/\|Aut(T′/T)\| = 1/2 | agrees with pardon15 line 2652 | none |
| d on generators (5.2) | plane term; ellipsoid; hypertight | constant term present; all generators even so odd d vanishes; no planes so word length preserved | agrees | none |
| disjoint union symmetry (5.3) | a⊗b ↦ (−1)^(\|a\|\|b\|)b⊗a | matches pardon15 lines 356–357 | agrees | none |
| augmentation and constant terms (6.1, 6.2) | da=1; d=0 | ε(da)=ε(1)=1≠0: none exists; for d=0 every functional killing products is one, linearized complex V | agrees | none |
| da=bc (6.3) | a odd, b,c even | d²a=db·c+b·dc=0; [bc]=0 | agrees | none |
| da=1 contracting homotopy (6.3) | H=m_a | d(ax)=x−a·dx, so dH+Hd=id, homology 0 | agrees | none |
| projection loses d²=0 (6.3 Check 4) | the README's da=b, db=1 | d²a=1≠0: d is not a differential, so the Check tests nothing; with da=1, du=v−aw, dv=w, dw=0: d²=0, d₁²u=w≠0 | Check misses its claim | R03 |
| finite coefficients (7.1) | output p-word of length 2 | right p-subwords of length ≤2, finitely many; Σ_γ p_γq_γ squared has constant term (Σκ_γℏ)², infinite | agrees | none |
| degrees and bracket degree (7.2) | n=1, 2, 3 | \|ℏ\|=−4, −2, 0; \|p\|+\|q\|=2(n−3), bracket degree −2(n−3) = −2N | agrees with egh00 line 2260, latschev22 line 69 | none |
| κ_γ=2 witness (7.2) | [p,q]=2ℏ, p=2ℏ∂_q | p(q)=2ℏ | agrees | none |
| h=p_γq_ηq_θ (7.3) | distinct orbits | {h,h}=0; {h,q_γ}=κ_γq_ηq_θ | agrees | none |
| K=ℏq_γ (7.3 Check 3) | q_γ odd | K⋆K=ℏ²q_γ²=0, D=[q_γ,−], D²=0, D(p_γ)≠0 | master equation holds with a p-free K; Check's conclusion false | R03 |
| D_X² (7.4) | \|m\| even | H⁻(H⁻m−mH⁺)+(H⁻m−mH⁺)H⁺ = H⁻H⁻m − mH⁺H⁺ | README's last sign wrong; conclusion right | R03 |
| \|F\|=0, \|H\|=−1 (7.4) | rigid curve term q⁻_Γ⁻p⁺_Γ⁺ℏ^(g−1)z^d | Σ(CZ⁻+n−3)−Σ(CZ⁺−(n−3))+(g−1)2(n−3)−2c₁ = −vdim = 0; for H, vdim M/ℝ = 0 gives −1 | agrees with egh00 line 2081 | none |
| right vs left super derivative (7.4) | m=p·m′, \|p\|=1, \|m\|=0 | ∂R_p m = (−1)^(1·(0−1))∂L_p m = −∂L_p m | agrees | none |
| weight w=N+length (7.5) | ℏ^(−k)F_0^k; one contraction | ≥ −k+k=0; N+1, length −1 | preserved, w≥0 | none |
| exp(F>0) coefficient at word I (7.6) | each F factor has ≥1 p | at most length(I) factors | agrees | none |
| genus law (7.6) | k=1; k=2; self-loop | g₁+g₂; g₁+g₂+1; +1 genus, +1 ℏ | agrees with egh00 (78) | none |
| identity kernel (7.6, 9.3) | g=q⁺, q⁺=κℏ∂R_(p⁺) | κℏ·q⁻/(κℏ)=q⁻; without ℏ⁻¹, g(ℏq⁻) | README right; egh00 line 3115 omits ℏ⁻¹ (Source issues) | none |
| vacuum filtration (7.7) | ℏ⁻¹c scalar; one term of energy e | filtration 0, exp diverges; coefficient e^k/k! at ke, converges | agrees | none |
| c_Y=Q_Y(1) (7.8) | p ↦ κℏ∂_q on 1 | only p-free terms survive = H\|_(p=0) | agrees | none |
| l_1 and curvature (7.8) | f homogeneous; c odd | l_1(f)=Q(f)−(−1)^(\|f\|)f·c; l_1(c)=Q²(1)+c²=0; l_1²(f)=−cQf−Q(cf)=−l_2(c,f) | identities hold | none |
| degree of l_k (7.8) | n=2, H=p_1p_2q_3, \|q_1\|=\|q_2\|=0, \|q_3\|=3 | l_2(q_1,q_2)=ℏ²q_3 of degree −1 = Σ\|f_i\|−1; README formula predicts +1 | false | R02 |
| graph examples (8.3) | p_γp_ηq_θ with γ=η; p_γq_ηq_θ with η=θ odd; two edges | 1/2 from 1/s⁺!; q²=0; ℏ¹, κ_γκ_η | agrees | none |
| energy completion (9.1) | Σ_k q_(γ^k) | energies kT → ∞, finitely many below each cutoff; infinitely many degrees | agrees | none |
| admissibility (9.2) | a∈F¹ mod F^r; a scalar of filtration 0 | polynomial of degree r−1; divergent | agrees with latschev22 lines 410–425 | none |
| Z_W, T_W, Q^(−,a) (9.3) | H⁻E=EH⁺; p⁺=0 | Q⁻Z=ZQ⁺ since left and right actions commute and H⁻ has no p⁺; (Q^(−,a))²=0; T(1)=1; Q^(−,a)T=TQ⁺; c^(−,a)=T(c⁺) | hold | none |
| φ_W multiplicativity (9.4) | q_1q_2 | κ_1κ_2ℏ²(∂_1∂_2F+∂_1F∂_2F): first term O(ℏ), second φ(q_1)φ(q_2)+O(ℏ) | agrees | none |
| \|b\|=d, \|a\|=0 (9.4, 9.6) | F=ℏ⁻¹F_0+… of degree 0 | \|F_0\|=d, b=F_0\|_(p⁺=0), a=ℏ⁻¹b+… | agrees | none |
| h^(−,b)=h⁻(q,p+κ∂_qb) (9.4) | D_b(p_γ)={p_γ,b}=κ_γ∂_(q_γ)b, D_b(q)=0 | exp(D_b) is the substitution automorphism; {h^b,h^b}=exp(D_b){h,h}=0 | agrees with latschev22 line 437 | none |
| regraded bracket degree (9.4) | h of degree d−1, k inputs | ((d−1)+Σ\|f_i\|−kd)−d = Σ(\|f_i\|−d)−1 | −1 | none |
| nonexact regression (9.4) | n=3, κ=1, h⁻=θp_1p_2, h⁺=θ(p_1+t)p_2, f=tx_1⁻+Σq⁻p⁺ | L_f: p_1⁻=t+p_1⁺, p_2⁻=p_2⁺, q⁺=q⁻; h⁻\|_L=θ(t+p_1⁺)p_2⁺=h⁺\|_L; d⁻x_i=0, d⁺x_2=tθ, b=tx_1, h^(−,b)=θ(p_1+t)p_2, d^(−,b)x_2=tθ, h^(−,b)\|_(p=0)=0 | regression correct | none |
| composition (9.5) | T_2^[a_1]=e^(−a_21)Z_2m_(e^(a_1)) | T_21=T_2^[a_1]T_1; T_2^[a_1]Q_1^(a_1)=e^(−a_21)Z_2Q_1e^(a_1)=Q_2^(a_21)T_2^[a_1] using Z_2Q_1=Q_2Z_2 | holds | none |
| gauge transport (9.5) | U̇=AU | d/dt(U⁻¹d_tU)=U⁻¹(ḋ−Ad+dA)U=0 | holds | none |
| supplier order | positions in ORDER.txt | SFT 193; suppliers on main; IA 200, GWT 284 not cited; with IA cited: moved to 199, 0 problems | no upward edge | R01 repair |

## Not verifiable

- The geometric statements of Layers 1–9 have no carrier at the pins, so they were checked on paper against the sources, not elaborated.
- Pardon's 2016 paper (arXiv:1309.2370) was not opened; its statements were read as quoted in pardon15 §4.1 and as planned in ImplicitAtlases. R04 asks the README to cite it where 4.2 keeps a construction.

## Source issues

- **Misprint** in egh00 at §2.5, proof of Proposition 2.5.2, printed page 69 (line 3115): the source says the trivial-cylinder element in the identity (80) is the sum over orbits of κ_γ⁻¹p_γq_γ; it should carry a factor ℏ⁻¹, since under the normalisation (78) the exponential of the displayed element sends g(q) to g(ℏq) rather than to g(q); affects nothing (the identity is meant with the ℏ⁻¹, and the rational formula (82) has the term at the ℏ⁻¹ level).
