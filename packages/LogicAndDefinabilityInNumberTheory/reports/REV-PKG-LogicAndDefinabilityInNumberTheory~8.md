<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/164#issuecomment-6780180557 -->
Review (claude) of 8d875d1

Verdict: needs_changes

1. **F01** (P2) general o-minimal foundations have two owners, and the declared gap asks for what ShimuraVarieties provides

   **Location.** `packages/LogicAndDefinabilityInNumberTheory/README.md` line 9: "The general o-minimal foundations of §§6.4–6.5 are developed here"; line 113: "ShimuraVarieties §3.5a supplies only the R_an,exp case"; line 24; §§6.1, 6.4, 6.5; `gap:general-ominimal-block-foundations` (lines 9, 113, 1726, 1738, 1755, 1773; `design/plan.json`).

   **Claim.** No earlier roadmap states cell decomposition, definable dimension and definable choice for an arbitrary o-minimal expansion of the real field, so this roadmap develops them and B2.6 needs a gap.

   **Witness.** ShimuraVarieties at its open head 314489c (earlier in the merge order): §3.4b `OMinimalStructure` with the `Set.Definable` bridge `exists_oMinimalStructure_definable_iff`; §3.4c monotonicity, cell decomposition (I),(II), uniform finiteness; §3.4d dimension laws and `dim(closure A∖A)<dim A`; §3.4e definable choice, "Every o-minimal expansion of the real field satisfies these hypotheses".

   **Exact repair.** (1) Line 9, line 24 and the ShimuraVarieties supplier contract: say that ShimuraVarieties §§3.4b–3.4e own o-minimal structures, monotonicity, continuous cell decomposition, uniform finiteness, definable dimension with its union, image, product, fibre and frontier laws, definable choice and curve selection, for every o-minimal structure, and §3.5a the structure R_an,exp. (2) §6.1: keep `IsOMinimalExpansion` and say in one clause how it differs (the `Set.Definable` form of the hypothesis of §3.4b's bridge, with definable field operations added); cite §3.4b for the finite-union form and the closure properties instead of listing them as API to prove. (3) §6.4: keep only the C^p refinement (C^p cells, finitely many definable functions C^p on cells) and cite §3.4c for the rest. (4) §6.5: keep finitely many connected components with the uniform family bound, definable path-connectedness and triangulation; cite §3.4d and §3.4e for dimension and the definable section. Add ShimuraVarieties §§3.4c–3.4e to the *Needs:* of §§6.4–6.5. (5) Delete the gap: the sentence of line 113, the four `gap:` items in the *Needs:* and Dependencies lines, and the entry in the `gaps` list of `design/plan.json` (if the plan may only gain gaps, a maintainer withdraws it). Tested on the gap's own `needs` sentence: cell decomposition is §3.4c (I),(II), definable dimension §3.4d, definable choice §3.4e, each for every o-minimal expansion of the real field, and all three are earlier than AbelianSchemesAndArithmeticModuliPartII B2.6. This is not the round-4 item again: that one asked for a supplier, and the supplier now exists.

2. **F02** (P2) §7.7: "(I-orbit) for the pure part of S" is not a defined proposition

   **Location.** README line 1869: "Assume the mixed André–Oort input datum for S and (I-orbit) for the pure part of S"; also "(M-orbit) if the pure lower bound (I-orbit) holds for the pure part of S" and "the discriminant of the pure part".

   **Claim.** The hypothesis is a proposition about fixed objects for every connected mixed Shimura variety of abelian type.

   **Witness.** §7.1 defines (I-orbit) only for x∈A_g, with D(x)=|disc R_x| of the CM abelian variety A_x. A quaternionic Shimura curve over a real quadratic field is pure, of abelian type, and its points carry no A_x: no D(x) exists.

   **Exact repair.** State in §7.7 what the source's proof uses (`towards_the_andr_oort_conjecture_for_mixed_shimura_varieties_the_` lines 2179–2190, p.49–50): "of abelian type" means here that the pure part (G,X_G⁺) of the datum has a Shimura morphism to a product of r Siegel data of genus g with finite central kernel; fix one, write x₁,…,x_r∈A_g for the images of the pure part of a special point x, D(x)=max_i D(x_i) with D as in §7.1, and N(x) for the order of its torsion part. Then: "(I-orbit) for the pure part" is (I-orbit) of §7.1 for this g; (M-orbit) is `#(Gal·x) ≥ C_ε·N(x)^(1−ε)·#(Gal·[π](x))` for every ε∈(0,1) (Theorem 13.3), which with (I-orbit) gives `#(Gal·x) ≫ H(x̃)^ε′`; (M-lift) is `H(x̃_(G,i)) ≪ D(x_i)^(B_g)` and `H(x̃_V), H(x̃_U) ≪ N(x)`. Tested: the quaternionic curve has no such morphism and is outside the statement; for S=A_g (r=1, identity) the hypothesis is (I-orbit) verbatim and N(x)=1; for the universal elliptic curve g=1, r=1 and N(x) is the torsion order; the unconditional sentence (pure part a Shimura subvariety of A_g, Tsimerman p.380) is unchanged.

3. **F03** (P3) GlobalQuadraticForms §4.1 is cited for a statement it does not make

   **Location.** README line 95: "use vector weak approximation (§4.1)"; line 19: "§§4.1–4.4 (vector weak approximation, …)".

   **Claim.** GlobalQuadraticForms §4.1 states vector weak approximation.

   **Witness.** On main, `TauCetiRoadmap/GlobalQuadraticForms/README.md` line 441: "### 4.1 Transport along isomorphisms of number fields"; line 43 lists vector weak approximation as already in Tau Ceti; line 294 names `TauCeti.NumberField.exists_one_tmul_mem_of_mem_nhds`.

   **Exact repair.** Move the item to "From Tau Ceti": `TauCeti.NumberField.exists_one_tmul_mem_of_mem_nhds` (TauCeti/NumberTheory/NumberField/Global/Approximation/Vector.lean, line 127 at the pin), and write "§§4.2–4.3" with "§4.4 through that roadmap's section map" in lines 19 and 95. The §4.4 citation itself stays valid: main's section map sends it to `TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite`.

4. **F04** (P3) supplier links that no longer resolve

   **Location.** README lines 17, 1320, 1394.

   **Claim.** The eight links open the cited sections.

   **Witness.** Main has `Completed/Chebotarev/` and `Completed/RealAlgebraicGeometry/`, no `TauCetiRoadmap/` copies. `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md` line 893 is "### 6.2 SNC compactification". WeilConjectures at its head: "### 5.29 Curve RH from the surface bound".

   **Exact repair.** (a) In the two Chebotarev links (1320, 1394) and the two RealAlgebraicGeometry links (17) replace `blob/main/TauCetiRoadmap/` by `blob/main/Completed/`; the anchors `layer-3-sign-determination-and-semialgebraic-descriptions` and `layer-6-cad-and-quantifier-elimination` exist there, and Chebotarev's "Layer 14: natural density and consistency theorems" is as cited. (b) `#62-snccompactification` → `#62-snc-compactification` (1320, 1394). (c) `#curve-rh-from-the-surface-bound` → `#529-curve-rh-from-the-surface-bound` (1320, 1394), and cite it as "§5.29, Curve RH from the surface bound" in lines 11 and 129.

5. **F05** (P3) the stated pin hashes are not the pins

   **Location.** README line 47: "The APIs are pinned by lake-manifest.json: Mathlib `6b7abb3c…` and Tau Ceti `a91d3aaf…`."

   **Claim.** These are the revisions `lake-manifest.json` pins.

   **Witness.** The content checkout's `lake-manifest.json` has mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and TauCeti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

   **Exact repair.** Replace the sentence by "The APIs are those pinned by lake-manifest.json." (no hash, so it cannot go stale). The line numbers of line 61 (532 and 136 of Mathlib/NumberTheory/Height/NumberField.lean) are still right at the pin. The manifest's permalinks at the older commit record where a text was read and stay.

6. **F06** (P3) Layer 6 uses three suppliers that no *Needs:* or Dependencies line names

   **Location.** README line 1496 (§6.2), line 1648 (§6.11: "Use native `TauCeti.IsSemialgebraic`, with the semialgebraic/definable dimension comparison of RealAlgebraicGeometry"), §6.6; *Needs:* lines 1513, 1573, 1666; Dependencies line 1773.

   **Claim.** Each *Needs:* line lists what the statement and route need, and the layer's Dependencies list its suppliers.

   **Witness.** Line 1666 is "*Needs:* 6.5" only; lines 1513, 1573 and 1773 name neither RealAlgebraicGeometry, DifferentialGeometry nor `TauCeti.IsSemialgebraic`, which the supplier contracts (lines 65, 117, 121) assign to §§6.2, 6.6 and 6.11.

   **Exact repair.** Add "TauCetiRoadmap.RealAlgebraicGeometry, Layers 3 and 6" to the *Needs:* of §6.2 and §6.11, "Tau Ceti `TauCeti.IsSemialgebraic`" to that of §6.11, "TauCetiRoadmap.DifferentialGeometry, Boundary and corners" to that of §6.6, and all three to the Layer 6 Dependencies. Both roadmaps are on main, so the dependency check is unaffected.

7. **F07** (P3) §4.11 puts the witness-search argument in Davis §7 on a page of §8

   **Location.** README line 1011: "§7, witness-search argument p.264; §8, Definition 8.1 and Theorem 8.1, p.264; code enumeration §7, pp.260–261".

   **Claim.** The witness search is in §7 at p.264.

   **Witness.** The README's own locators: line 1001 "§7, pp.260–261; §8, pp.262–264" and line 1067 "§7, Theorems 7.2–7.4, pp.261–262". Page 264 lies in §8.

   **Exact repair.** "§8, Definition 8.1 and Theorem 8.1 with the witness-search direction of its proof, p.264; code enumeration §7, pp.260–261". The text is settled as uncertified, so this repairs the inconsistency without a reading of the page.

Independent review of the package at head 8d875d1 (the repair of round 7), against the pins of the content checkout's `lake-manifest.json` (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`), main 5fc1aa8 and the 438 open heads of the index of 2026-11-10. The round-7 finding is repaired and its new route is sound. The seven findings below are of a different kind: the suppliers and the pins have moved since the package was last resolved against them (R01, R03, R04, R05), and three points of the untouched text were not caught before (R02, R06, R07). Two are blocking.

## Verified sound

### Round-7 finding, checked at the current head

| Finding | Status | Repaired passage and verification |
|---|---|---|
| F01 (P2), §2.5(b) regime (iii) transferred a graph covering that fails in ℂ((t)) | Repaired | README 452: "each of X∖Z and Y∖f(Z) is covered by finitely many definable sets each of which, after a coordinate permutation, has at most M points in every fibre of the projection Fⁿ→Fⁿ⁻¹". README 456–458 recomputed step by step: Z is a union of balls (in an ultrametric space each point of a ball is a centre), f(Z) a union of open sets; the regime (ii) locus Z₂ lies in Z (f(B)=(f⁻¹)⁻¹(B)∩f(Z₂) is open, analytic implies strictly differentiable over the complete field κ((t)), chain rule); Kdim is the dimension of the Zariski closure (`cluckers_loeser_2008` lines 529–534, p.13), so the complements lie in a hypersurface; the elimination form is (3.3.2) (lines 634–637, p.16) with polynomials over the coefficient ring by Corollary 2.1.2 (lines 370–374, p.10); a point that is a root of no polynomial nonconstant in z at x₀ is interior to its fibre, because f(x₀,z)/f(x₀,z₀)∈1+𝔪 for z near z₀; a nonempty open fibre inside {g=0} forces g(x,·)≡0. The transferred sentence is the implication β⟹covering, true in every κ((t)); the Borel and Fubini steps hold. The pieces are defined from the formula of W alone, the hypersurface being used only for existence, so nothing outside L_O is transferred. Pattern search ("definable graphs", "graph coordinate", "single-point fibre"): the only other hit is §2.1 on cell presentations. |

The gate repair of `ax_kochen_ring` (instance binders for `letI`) is sound: `FirstOrder.Language.ring` has `Relations := fun _ => Empty` (Mathlib/ModelTheory/Algebra/Ring/Basic.lean line 61), its function symbols are the five of `ringFunc` (line 50), and the five `funMap_*` fields of `CompatibleRing` (lines 156–172) fix each, so the structure is unique and the binders are not a weakening.

### Mechanical checks

- Elaboration: `lake env lean` on `packages/LogicAndDefinabilityInNumberTheory/Suggested.lean` from the content checkout, exit 0 in 6 s, exactly twelve `declaration uses sorry` warnings (lines 40, 50, 66, 73, 89, 95, 101, 109, 127, 135, 169, 185), nothing else. No module needed building.
- Padding probe on all twelve sorried theorems (`first | rfl | (simp; done) | infer_instance | exact?` on a scratch copy): none closes (ten `exact?` failures, two timeouts on the counting theorems). No padding; the six definitions each serve a headline.
- Signatures: the 18 elaborated types of `scratch/signatures.md` compared with §§1.5, 2.6, 4.15–4.17, 4.24, 4.25, 4.28, 4.30, 4.33, 6.1, 6.11, 6.12, 6.14, 6.16. No `variable` block, no lost binder; only `ax_kochen_ring` changed.
- Library names: a scratch file with `#check` for 74 of the Mathlib and Tau Ceti names the README backticks (the others are namespaces and constants that these mention) elaborated with no unknown identifier at the pins, including `Nat.forall_exists_prime_gt_and_modEq` (Mathlib/NumberTheory/LSeries/PrimesInAP.lean line 463), `MvPolynomial.funext_set` (Funext.lean line 57), `REPred` (Computability/RE.lean line 157), `ComputablePred.halting_problem` (Halting.lean line 64), `Rat.mulHeight₁_eq_max` and `NumberField.absMulHeight₁` (Height/NumberField.lean lines 532, 136), `Poly.*` (NumberTheory/Dioph.lean lines 107–227), `TauCeti.IsSemialgebraic`, `Algebra.GrothendieckAddGroup.{instCommRing, ofRingHom, liftRingHom}` (TauCeti/RingTheory/GrothendieckRing.lean lines 180–232) and `TauCeti.finite_setOf_absMulHeight₁_le` (TauCeti/NumberTheory/Height/Absolute.lean line 187). The lead `Diophantine.mrdp` is this roadmap's own declaration (Suggested.lean line 66).
- README and Lean agree on names: all 18 Lean names occur backticked in the README and every backticked own name is declared.
- Dependency check, run as prescribed: `depcheck: 236 roadmaps, 2143 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Hygiene: no LaTeX delimiter, pull-request number, round label, machine path, "(removed)" stub, `lemma`, `set_option`, `#eval`, `#print`, `#synth` or `True` placeholder; imports are `import Mathlib` and one existing `TauCeti.*` module.
- Headlines: the statable ones (§§1.5(a) coefficient-free, 2.6, 4.15, 4.16, 4.24, 4.25, 4.28, 4.30, 4.33, 6.14, 6.16) are stated; the module docstring names the others and what each lacks. None is forced through a stand-in.
- Gaps: `neron-pairing-perfect-finite-residue` has the same slug in `design/plan.json` and README line 75, a single precise `needs`, and NeronModelsAndSemistableAbelianVarieties §4.6 at its head still proves perfectness only in the semistable case. The other gap is R01.
- Manifest: 41 entries, 41 distinct ids (33 certified, 5 uncertified, 3 waived), no local path, nothing removed. No `needs-references.toml` was needed.
- Overlaps: no other open pull request changes this roadmap; no cited id is dropped by an open revision.

### The seeded source sample

| Target | Passage opened | Result |
|---|---|---|
| 0.1 Interpretations | `hodges` settled uncertified | Statement checked by computation only (below). |
| 1.3 Relative elimination | `cluckers_loeser_2008` 318–345 (§2.1, pp.8–9), 353–359 (Theorem 2.1.1, p.9), 370–374 (Corollary 2.1.2, p.10) | Arbitrary ordered value group and arbitrary expansions L_Res, L_Ord; henselian, residue characteristic zero; disjunction of ψ(ac f_i,ξ)∧ϑ(ord f_i,α); relative form over a subring. As cited. |
| 1.5 Finite-formula transfer | `cluckers_loeser_exp` 1580–1622 (Notation 9.1.1 and §9.1.2, pp.40–41) | A_O, B_O, L_O with residue coefficients from k and valued-field coefficients from O[[t]], the uniformizer map (9.1.1), the bound N. As cited. |
| 2.3 Local constructible functions | `cluckers_loeser_exp` 1623–1640 (pp.41); `cluckers_loeser_2008` §4.1 (line 742), §5.2 (line 1189) | Fibre cardinalities (9.1.2), L↦q_K, α↦α_K. As cited. |
| 3.6 Graded Functions | `cluckers_loeser_2008` 1458–1495 (§§6.1–6.2, pp.35–36) | C^≤d is the set of finite sums Σλ_i·1_(Z_i) with Kdim Z_i≤d and is an ideal; C^d the quotient; graded sum. As cited. |
| 3.7 Motivic pushforward | same, 2437–2495 (Theorem 10.1.1, pp.59–60); §11 pp.61–73; §13.2 p.77 (line 3175); Theorem 14.1.1 p.78 (line 3226); §15.1 pp.82–84, Lemma 15.1.1 (line 3431); Theorem 12.1.1 p.74 | A0–A8 match the README's list one by one; A7 gives L^(−α−1); Remark 10.1.3: f_! is not graded. As cited. |
| 4.1 Polynomial functions | Mathlib/NumberTheory/Dioph.lean lines 79–92, 107–119, 161–227 at the pin; `eval₂Hom_C`, `eval₂Hom_X'` (Algebra/MvPolynomial/Eval.lean lines 181, 185) | `Poly α` is a subtype of functions with `IsPoly`; `CommRing` instance line 184. As cited. |
| 4.11, 4.14 | `hilbert_s_tenth_problem_is_unsolvable` settled uncertified | Locator consistency only: R07. |
| 4.29 Normic bundles | `le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres` 175–194 (Proposition 2.2, pp.5–6), 269–285 (Theorem 3.1, p.8), 337–353 (Corollary 3.2, p.10), 366–383 (Proposition 3.4, pp.10–11), 516–523 (Lemma 4.1, p.14), 547–566 (Proposition 4.2, pp.15–16), 568–601 (Theorem 4.3, pp.16–17) | Every item and page as cited; 2.2(iii) carries "irreducible of degree p and without zero in K"; d₀=2p, d=2p+1. |
| 6.1 O-minimal expansions | `bkt` 89 (finite unions of points and intervals); round-7 lines of `geometric_categories_and_o_minimal_structures` | As cited. |
| 6.7 Complex varieties | `bkt` 844–847 (Theorem 4.13, p.18); `ax_schanuel_for_shimura_varieties` 170–182 (§2.2, p.5) | The canonical R_alg-definable manifold structure of a smooth complex algebraic variety is the parenthesis of 4.13. As cited. |
| 6.11 Algebraic part | `on_the_algebraic_points_of_a_definable_set` 200–206 (p.5); `pila_wilkie` waived | X₁ (z=x^y) has an algebraic part with infinitely many components, as the Check says. |
| 6.13 Blocks | same, 220–231 (Definition 3.2, p.5), 238–262 (Proposition 3.4, pp.5–6) | As cited. |
| 7.7 Mixed André–Oort | `towards_the_andr_oort_conjecture_for_mixed_shimura_varieties_the_` 108–111 (Theorem 1.2, p.3), 695 (Remark 4.4, p.16), 1467 (§10.1, p.33), 1862 (Theorem 12.2, p.42), 2122–2124 (Theorem 13.3, p.48), 2147–2163 (Remark 13.5, Theorem 13.6, p.49), 2166–2200; `the_andr_oort_conjecture_for_a_g` 44–47 (p.380), 274–277 (Theorem 5.2) | Locators as cited; hypothesis: R02. |

### Adversarial pass (sampled targets, headlines, repaired and finding-touched passages)

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 2.5(b)(iii) covering | S′={y²=x³+x, ord x<0}⊂ℂ((t))²; W={xz=0}; W={x=0}; n=0, n=1 | S′: ≤2 points over x, ≤3 over y, M=2. Axes: polynomial xz, M=1; at x₀≠0 the fibre {0} is a root, so B={(x,0):x≠0}; at x₀=0 the polynomial is constant in z, fibre open, A={0}×K, π(A)={0}⊆{g₁=x=0}; next level M′=1, piece {0}×K with ≤1 point over each z. n=0: W=∅; n=1: W finite, A=∅ | Holds. |
| 2.5(b)(iii) old sentence | same S′, y=s³t⁻³, x=s²t⁻²(1+u) with (1+u)³+s⁻⁴t⁴(1+u)=1 | s↦−s fixes x (it lies in s²·ℚ(s⁴)[[t⁴]]) and negates y; s↦ζ₃s fixes y and sends ac x to ζ₃²s² | False in ℂ((t)); the README's new Check is correct. |
| 2.5(b)(iii) Z | f(x)=tx, O→tO; f=x⁻¹ with f(0)=0 | Z=X, complements empty, |Df|=q⁻¹ and μ(tO)=q⁻¹=∫_O q⁻¹; 0∉Z since f(B)∋0 is not open, X∖Z={0}, M=1 | Holds. |
| `ax_kochen_ring` | ∃x x²+1=0 at p=2,3,5 | ℚ₂ no (−1≡7 mod 8), 𝔽₂((t)) yes (x=1); p=3 no/no; p=5 yes/yes | N≥2; true statement, unique structures. |
| `igusa_poincare_rationality` | m=0, f=c with ord c=k; f=0; n=0 | counts 1 for n≤k, 0 after: P=1+…+T^k, Q=1; f=0: Q=1−T, P=1; n=0: one-element quotient, count 1 | Retain. |
| 0.1 | (1,2),(2,4) over a domain; two-valued graph | 1·4=2·2; uniqueness modulo E fails | Retain. |
| 1.2, 1.3 | π′=επ; t³(2+t); ℂ((t^ℚ)); ℚ₂ | ac′(π)=res(ε)⁻¹; ord 3, ac 2; divisible value group admitted by Theorem 2.1.1; residue characteristic 2 excluded | Retain. |
| 1.5(b) | ∃x x²=1+t | every κ((t)) yes; odd residue characteristic yes; ℚ₂ with ϖ=2: 3≢1 mod 8; 𝔽₂((t)): squares lie in 𝔽₂((t²)) | Bound ≥2; retain. |
| 2.3 | 1_O; constant 1 on F; Σq⁻ⁿ at q=2 | integral 1; not integrable; 2=(1−1/2)⁻¹ | Retain. |
| 3.6 | singleton in h[1,0,0] | Kdim 0: nonzero in C⁰, zero in C¹=C^≤1/C^≤0 | Retain. |
| 3.7 | A7 with α=0, ξ=1; two points→one point | L⁻¹ specialises to q⁻¹=μ{ord z=0, ac z=1} (the Check of §2.1); f_!1=2, 2²=4≠2 | Retain. |
| 4.1 | X₀−2X₁ at (1,3); constant −3, α empty; X₀ vs X₁ at (0,1) | −5; −3; 0≠1 | Retain. |
| 4.11 | `Dioph S` with an infinite witness type | Mathlib's witness type is arbitrary, so the finite compression of §4.9 is needed and is in *Needs:* | Retain. |
| 4.14 | μy with f(x,0) undefined, f(x,1)=0 | (x,1) must not be in the graph; the README requires defined earlier values | Retain. |
| 4.29 | degrees; p=2; K-points | d₀=p+p=2p; (2p+1)−2·p=1, at p=2: 5−4=1; over K the norm form is a product of coordinates and takes the value P(x)≠0; (c) stays true for u with Q or R acquiring a zero in k((du)^(1/p)): finitely many classes | Retain. |
| `nonpowers_diophantine` | ℚ, r=2: −1, 4, 0; r=3: 2, −8 | in, out, out on both sides; in (v₂=1), out | Retain. |
| `IsOMinimalExpansion` | ℤ, (0,1), ℚ; the empty language | frontier ℤ infinite; {0,1}; ℝ; order not definable, predicate false | Retain (ownership: R01). |
| 6.7 | ℙ¹ overlap; node xy=0 | z↦1/z is (x,−y)/(x²+y²), semialgebraic; not a manifold at the node | Retain. |
| `algebraicPart` | (0,1); {0}; two points | whole set; ∅; ∅ (connected subsets are points) | Retain. |
| 6.13 | point; X₃={0<x<1, 0<y<eˣ} | 0-dimensional basic block; basic block inside ℝ², not semialgebraic | Retain. |
| `pila_wilkie`, `bounded_degree_counting` | n=0; X_t=(0,1); √2, k=2, T=2 | count ≤1; algebraic part everything, count 0; X²−2, height √2≤2 | Retain. |
| 7.7 | quaternionic curve over a real quadratic field; S=A_g; special singleton | no D(x); (I-orbit) verbatim; one dense special point | R02. |
| Gap `general-ominimal-block-foundations` | its `needs` against ShimuraVarieties §§3.4c–3.4e | all three items stated there for every o-minimal expansion of ℝ | R01. |

Conventions recomputed where the sample meets them: |π|=q⁻¹ with μ(O)=1 (§§2.1, 2.3, 2.5, 3.7); base-first charts φ_j⁻¹∘φ_i (§6.6); frontier as closure minus interior in §6.1 against closure remainder in §6.5 (a line in ℝ²: remainder empty, boundary the line).

### Library, ownership and supplier audit

- Supplier citations resolved now: SchemeAndStackFoundations §§0.7, 2.20; DiophantineApproximationAndTranscendence §§0.2 (line 352, the two-sided height comparison), 0.3 (line 364), 5.6; QuadraticFormInvariants Layer 2 and §6C items 9, 10, 12; GlobalQuadraticForms §§4.2, 4.3, 5.5, 6.1; ClassFieldTheory Layers 5, 10–13; ReductiveGroupsPartII RG2.3.7; DifferentialGeometry "Boundary and corners"; ResolutionOfSingularitiesCharacteristicZero §6.2 (all on main); at their open heads HeightsRationalPointsAndObstructions §§2.16b, 2.17, 2.20, 2.21, 5.1, 5.6, 5.8; MotivesAndAlgebraicCycles §4.20; NeronModelsAndSemistableAbelianVarieties §§2.5, 4.6; ShimuraVarieties §§3.5a, 3.5d, 3.6; AdelicAlgebraicGroups §2.4 (both named items); AbelianSchemesAndArithmeticModuliPartII B2.6, B2.7, B2.14, B2.15, B2.18. The exceptions are R01, R03 and R04.
- Ownership by object (`roadmaps grep` over main and the open heads): "Denef–Pas", "Ax–Kochen", "IsOMinimal" match nowhere else; "Koenigsmann" only in an unrelated citation; "Pila–Wilkie" only in AbelianSchemesAndArithmeticModuliPartII, the B2.6 supplier. StratifiedSpacesAndTameTopology hands general o-minimal theory to ShimuraVarieties §§3.4b–3.4e, which is what led to R01.
- Principles: no route-specific shortcut, no copied passage, no algorithm, no sorry'd data, no `set_option`; the organisation is by mathematics (no layer named after a source's chapter).

## Not verifiable

- `hodges` (§5.3), `hilbert_s_tenth_problem_is_unsolvable` (§§1, 4–8), `denef_1984`, `bosch_lutkebohmert_raynaud`, `schneider`: settled uncertified. §§0.1, 4.11 and 4.14 of the sample were checked by computation and, for Davis, by the consistency of the README's own locators only.
- `pila_wilkie` (Definition 1.4), `vd_dr_tame`, `vd_dr_macintyre_marker`, `cl_addenda`: settled waived.
- LogicAndDefinabilityInNumberTheoryPartII and TopologicalMirrorSymmetryForHitchinSystems are later in the merge order; ownership against them was not checked.
- The untouched sections outside the sample rest on the computed rows of the round-7 table (§§2.2, 2.6, 2.8, 3.2, 4.4, 4.33, 5.4, 6.6, 6.8, 7.2, 7.6); they were not recomputed.

## Source issues

- **Gap** in towards_the_andr_oort_conjecture_for_mixed_shimura_varieties_the_ at Theorem 13.6, printed p.49: the source says the hypothesis is the orbit bound (13.8) for the pure part, though (13.8) is stated only for A_g; it should be the bound for the Siegel factors receiving the pure part, as its proof uses; affects a stated result.
- **Misprint** in cluckers_loeser_exp at Notation 9.1.1, printed p.40: the source says the class consists of the p-adic completions of the number field and all finite extensions of the number field; it should be the finite extensions of those completions; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8d875d1832fa27bfc71d2227ffbd15d67cee8e3a", "job": "REV-PKG-LogicAndDefinabilityInNumberTheory~8", "model": "fable", "worker": "chris-x17"} -->
