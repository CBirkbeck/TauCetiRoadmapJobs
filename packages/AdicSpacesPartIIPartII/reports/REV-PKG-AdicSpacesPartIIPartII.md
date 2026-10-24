<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1098#issuecomment-6381263591 -->
Review (claude) of a39708a

Verdict: needs changes

1. **F01** (P1) The formal-localization gap is addressed to a roadmap that cannot own it

   - **Location.** `packages/AdicSpacesPartIIPartII/README.md` line 81 and `design/plan.json` `gaps[0]`: "What AdicSpacesPartII must provide (gap:formal-affinoid-localization): For every quasi-separated quasi-paracompact rigid K-space X, every weakly Shilov affinoid neighbourhood W of x can …".
   - **Claim.** AdicSpacesPartII R1.7 is a "formal-model localization interface" that can supply this realization. The README also files the formal-model contract under the AdicSpacesPartII heading (lines 79, 83), and its Needs lines (640 §4.1, 687 §4.3, 744 §4.6) name no roadmap.
   - **Witness.** `TauCetiRoadmap/AdicSpacesPartII/README.md` line 9806: R1.7 is the rigid–adic comparison, with no formal schemes. Formal models are `TauCetiRoadmap/AdicSpacesPartIII/README.md` R2.2–R2.5, and AdicSpacesPartIII consumes AdicSpacesPartII (line 490).
   - **Consequence.** As declared, AdicSpacesPartII could honour the gap only by consuming its own consumer, plus this roadmap's §4.4 notion "weakly Shilov"; `x` is unbound. The gap is therefore effectively unowned. The real edge to AdicSpacesPartIII (ORDER.txt #11, after this roadmap at #10) is invisible to the dependency check. On line 14, "above" should read "below".
   - **Repair.**
     1. Address the gap to AdicSpacesPartIII R2.5 (with R2.4), in the README and `plan.json` alike. Suggested needs: "For every quasi-separated quasi-paracompact rigid K-space X and every affinoid open W = Spa(R, R°) ⊆ X there are an admissible formal model 𝔛 of X and a formal affine open Spf(R₀) ⊆ 𝔛 with generic fibre W, R₀ ⊆ R° open and bounded, such that Spec(R°/R°°) → Spec(R₀/ϖR₀) is a homeomorphism." This is the input used in BH22 lines 339–344.
     2. Move lines 79 and 83 into a new `### From TauCetiRoadmap.AdicSpacesPartIII` subsection.
     3. Name "AdicSpacesPartIII R2.4–R2.5" in Needs lines 640, 687 and 744.
     4. Re-run the dependency check. A `moved:` line placing this roadmap after AdicSpacesPartIII is expected and is not a defect.
   - **Test.** On the closed disc, Spf K°⟨T⟩ gives Spec K̃[T] → Spec (K°/ϖ)[T], a homeomorphism.

2. **F02** (P2) Supplier sections cited for statements they do not make

   - **Location.**
     - Lines 15 and 87: SchemeAndStackFoundations "§§0.15, 4.11" for relative Proj and scheme blow-ups.
     - "AdicSpacesPartII R1.3" for completed local rings at classical points: lines 164, 166, 216, 281, 441/443, 487/489, 843.
     - "R0.15–R0.17, R1.8" for the Jacobian criterion: lines 463, 525, 900, 925, 944.
     - Line 796: "R1.2–R1.5" for properness of projective relative analytification.
   - **Witness.** SchemeAndStackFoundations §0.15 (line 1090) is Néron–Popescu; relative Proj is §0.3 (line 551); blow-ups are StableReduction Layer 4 (line 470). AdicSpacesPartII R1.3 is analytification; local-ring completions are R1.5 (line 9577); R1.8 is analytic groups; properness is R1.6.
   - **Repair.**
     1. Cite SchemeAndStackFoundations §0.3 and §4.11, and add a `### From TauCetiRoadmap.StableReduction` contract for Layer 4 (Rees algebra, universal property, properness, flat compatibility).
     2. Write R1.5 for R1.3 in the eight places.
     3. Drop R1.8 from the five Jacobian citations.
     4. Add R1.6 to line 796.
   - **Test.** Each repointed section states the property at the cited line.

3. **F03** (P2) Downstream consumers misdescribes DiamondsAndVStacks, which builds the affinoid resolution itself

   - **Location.** Lines 979–993, for example line 987: "The same diamond consumer takes the geometric resolution π : S̃ → S supplied by Layer 5 to a v-cover … It also proves T^♢ = (T_red)^♢". Two lists of Checks for that roadmap's targets follow.
   - **Witness.** At its open pull-request head, DiamondsAndVStacks §D6.9 takes f₀ from ResolutionOfSingularitiesCharacteristicZero §7.8. It proves itself that the analytification is smooth, proper, surjective and an isomorphism over the smooth locus. No section mentions this roadmap, rigid analytic point classes or (T_red)^♢.
   - **Repair.**
     1. Replace lines 979–993 by a short consumer note: DiamondsAndVStacks can consume §§3.1–3.2 and §§5.3–5.4, and D6.9's analytic resolution is the affinoid case of §§5.3–5.4.
     2. Delete the Checks written for DiamondsAndVStacks' interpretations, keeping line 993 as a §5.4 Check.
     3. In Scope and ownership, state that this roadmap owns the global functorial rigid resolution. It is earlier in the order (#10 against #16) and more general (any characteristic-zero K, glued, functorial).

4. **F04** (P2) The homogeneous-quotient gap is compound and asks for what §6.4 derives

   - **Location.** Line 107 and `plan.json` `gaps[2]`: "provide the smooth surjective H-torsor G → G/H, Cartier smoothness of H, and the same smoothness for the orbit morphism through every rational quotient point after arbitrary field extension."
   - **Witness.** This README's §6.4 route (line 942) derives orbit-map smoothness from the torsor. `TauCetiRoadmap/ReductiveGroups/README.md` line 238 defines G/H as the fppf quotient, so G → G/H is an H-torsor; lines 22 and 261 already invoke Cartier smoothness.
   - **Repair.** Reduce the gap, in the README and `plan.json`, to one ask: "For a smooth finite-type affine group G over a field of characteristic zero and a closed subgroup scheme H whose fppf quotient G/H is represented by a scheme, the quotient morphism G → G/H is smooth and surjective." Keep orbit-map smoothness as a §6.4 target.
   - **Test.** For G = GL₂ and H = B, GL₂ → ℙ¹ is smooth and surjective, which is what the Check at line 948 needs.

5. **F05** (P2) "Only rigid analytic point 0" holds for G = G_a, not for the B_dR⁺ affine Grassmannian in general

   - **Location.** Line 580: "the B_dR⁺ affine Grassmannian … its only rigid analytic point is 0". Line 985 repeats it, citing "(HK2, §5, p. 34)".
   - **Witness.** HK2 line 1458 (Example 5.0.5, p. 32) treats only G = G_a. For G = G_m, Gr is the constant sheaf ℤ = ⊔ₙ Spd L, with one rigid analytic point for each n.
   - **Repair.** Write, in both places: "for G = G_a, the only rigid analytic point of Gr_G is 0 (HK2 line 1458, Example 5.0.5, p. 32)".
   - **Test.** G_m is now excluded by the hypothesis.

6. **F06** (P3) §0.5: locators do not state regularity, and the smooth-case route assumes separability

   - **Location.**
     - Line 212: "(CONRAD99 line 406, Corollary 1.2.3, p. 9; TEMKIN12 line 1511 …)" for regular ring maps "without characteristic restriction".
     - Line 214: "including the separable residue-field extension".
     - Line 223: "CONRAD99 line 259, Lemma 1.1.5".
   - **Witness.** CONRAD99 Corollary 1.2.3 is about normalization, and its proof gives flatness only (lines 409–417). TEMKIN12 lines 1511–1513 assume regularity unproved. K⟨T⟩ at (T^p − a), a ∉ K^p, has inseparable residue field K(a^{1/p}). Lemma 1.1.5 is line 274.
   - **Repair.**
     1. Present the domain case as proved here by the existing excellence-and-descent route.
     2. Replace the smooth-case clause by a route that does not assume separable residue extensions, for example completed formal smoothness plus André's localisation theorem (cited by TEMKIN12 as [And], line 1577), cited by locator once checked.
     3. Change "line 259" to "line 274".
   - **Test.** The statement still holds in the example: K⟨T⟩ ⊗_K K(a^{1/p}) = K(a^{1/p})⟨T⟩ is regular.

7. **F07** (P3) Other locators that do not point at the cited statement

   - **Location.** Lines 196 (§0.4), 207 (Check), 723 (§4.5), 291 (§1.3), 243 (§1.1) and 779 (§5.1).
   - **Witness.** HK2 line 1598 is a resolution step (proper images: lines 722–727). Lemma 2.2.3 (line 711) concerns subdiamonds. The Abhyankar inequality is POINEAU13 lines 182–184. CONRAD99 components: lines 528–548; Lemma 2.1.1: line 435. TEMKIN12 line 1516 lacks a universal property.
   - **Repair.** Correct each locator as listed. For §5.1, add a source stating the universal property, properness and flat base change of rigid blow-ups (for example CONRAD10's [C2, 4.1.1], line 233) after checking it.

8. **F08** (P3) Pinned declarations that already state parts of §§3.3, 3.4, 6.1 and 6.4 are not cited

   - **Location.**
     - §3.3, line 584: injectivity of a ↦ the classical point T = a.
     - §3.4: existence of the several-variable Gauss point.
     - §§6.1 and 6.4: "locally a projection in charts".
   - **Witness.**
     - `TauCeti.ValuationSpectrum.classicalPoint_injective_of_isField` (`Polydisc/Basic.lean` line 182).
     - `MvPowerSeries.IsRestricted.gaussNorm_mul` (`TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean` line 241).
     - Mathlib's `IsSubmersionAt` (`Geometry/Manifold/Submersion.lean`) and `IsImmersionAt` (`Immersion.lean`), which give normal forms but no rank criterion.
   - **Repair.** Cite these in the supplier contracts and the corresponding Needs lines, together with `TauCeti.Huber.restrictedMvPowerSeriesGaussEquiv`. State §3.3's injectivity as consumed; §6.1 remains a genuine target.

9. **F09** (P3) A §3.3 Check is false over a finite residue field

   - **Location.** Line 594: "D(L) ⊆ |D| is not closed when n ≥ 1: its closure contains the Gauss point if the residue field is infinite".
   - **Witness.** For n = 1 over ℚ_p, D(ℚ_p) = ℤ_p is closed: each outside point has a rational neighbourhood missing ℤ_p, for example η ∈ {|T^p − T| ≥ 1} and T = √p ∈ {|T² − p| ≤ |p|²}.
   - **Repair.** "If L̃ is infinite and n ≥ 1, D(L) is not closed, since its closure contains η (§3.4); over ℚ_p, D(ℚ_p) = ℤ_p is closed."

10. **F10** (P3) Later roadmaps restate parts of §§6.1 and 6.3, and one §6.3 bullet compares with an unowned structure

   - **Location.** Line 921: "(X^an)(F) = X(F) with the analytic manifold structure of the F-points of a smooth variety". Line 995 leaves the owner of real constant rank unnamed.
   - **Witness.**
     - ReductiveGroupsPartII RG2.0.2, *smooth-group-analytic-charts* (ORDER.txt #25), builds G(K) charts, whose nonarchimedean case is §6.3.
     - AbelianSchemesAndArithmeticModuliPartII `constantRankLocal` (#134) includes k = ω, which is §6.1 at F = ℝ.
     - No earlier roadmap owns line 921's structure.
   - **Repair.**
     1. List both later roadmaps under Downstream consumers.
     2. Name the owner on line 995.
     3. Restate line 921 as: "X(F) carries the structure transported from (X^an)(F) through the bijection X(F) ≅ (X^an)(F)".

11. **F11** (P3) Invented term "finite-field points"; diamond interpretations listed as headlines

   - **Location.** README line 979 ("finite-field point functor of Layer 3") and `Suggested.lean` line 15 ("diamond interpretations of finite-field points").
   - **Witness.** Layer 3 defines finite-extension points (§3.1). Scope line 18 assigns the diamond interpretations to downstream comparisons.
   - **Repair.** Write "finite-extension points", and delete the diamond sentence from the module docstring (lines 15–16).

12. **F12** (P3) README title (non-blocking naming note)

   - **Location.** Line 1: "…, part II". Line 7: "This is a Part II extension of AdicSpacesPartII".
   - **Witness.** The roadmap continues AdicSpacesPartII, so its own title is inconsistent with the folder name AdicSpacesPartIIPartII. The name is already a recorded naming question.
   - **Repair.** Align the title with whatever the maintainer decides; nothing else changes.

13. **F13** (P3) Duplicated Checks, and a Check that names a Lean declaration

   - **Location.**
     - Repeated Checks: lines 140/144 and 141/145; 170/175 and 172/176; 265/270 and 266/271; 315/316; 343/349; 447/452 and 451/453; 494/498 and 497/499; 644/649 and 645/650; 672/677; 800/804.
     - Line 647 names a Tau Ceti declaration.
   - **Witness.** For example, line 140 ("On the closed unit disc over K, V(T) consists of the single classical point T = 0 …") and line 144 state the same Check. Line 647 reads "A° = K°⟨T⟩ = TauCeti.Huber.powerBoundedSubring A".
   - **Repair.** Delete the second copy in each pair; every section keeps at least three distinct Checks (counted). Phrase line 647 in prose.

14. **F14** (P3) Line 64 credits RigidAnalyticGeometry with statements this roadmap proves

   - **Location.** Line 64 says that, under the supplied comparisons, normalization agrees with its analytic counterpart and that X(L) consists of pairs (x, k(x) → L).
   - **Witness.** RigidAnalyticGeometry §8.1 (line 690) compares reducedness and normality, not normalization. The X(L) description is §3.2's own target (line 569), and line 257 lists the normalization comparison as an own target.
   - **Repair.** Drop "normalization" and the X(L) sentence from line 64, or cite them as §§1.1 and 3.2.

15. **F15** (P3) Line 91 presents countable invariants as supplied

   - **Location.** Line 91: "The common invariant set is countable for the synchronization used in rigid hypersequences".
   - **Witness.** ResolutionOfSingularitiesCharacteristicZero §§7.1 and 7.5–7.8 (at its head) state no countability, and §7.5 covers reduced schemes only. Countability is part of gap:generically-reduced-functorial-resolution, which TEMKIN12 line 99 (Theorem 1.2.1) otherwise supports.
   - **Repair.** Say on line 91 that countability belongs to the declared gap. In the gap sentence, make explicit that the countable-invariant clause also applies to the reduced functor, which §5.3 needs for non-quasi-compact reduced X.

Scope of this review: `packages/AdicSpacesPartIIPartII/README.md` (1015 lines), `Suggested.lean`, `metadata.toml`, `sources.toml`, read against the content repository at main, the open roadmap pull requests through the roadmaps tool (333 heads), the board packages, `merge-order/ORDER.txt`, and the pinned Mathlib and Tau Ceti of the content repository's `lake-manifest.json`. No previous review exists. The folder name is a recorded naming question and is not treated as a finding (R12 only notes the README title).

## Verified sound

### Elaboration and Lean form

- `lake env lean` on `packages/AdicSpacesPartIIPartII/Suggested.lean`, run from the content checkout, gives exactly three "declaration uses `sorry`" warnings (lines 46, 63, 95), no errors, in about 7 s. No `TauCeti.*` object file was missing.
- Form: single `import Mathlib` plus one Tau Ceti module that is actually used; no `set_option`, no `lemma`, no sorry'd data. `IsUnitGaussPoint` has a real body. Every declaration has a docstring, layer section comments are present, and the namespace is `TauCetiRoadmap.AdicSpacesPartIIPartII`.
- `#check @` on all four declarations, in one scratch file: the elaborated binders match README §§3.4, 6.1 and 6.5. The file has no `variable` block, so no binder was lost, and nothing changed.
- One-tactic probes on a scratch copy (`simp`, `rfl`, `infer_instance`, `aesop`, `fun_prop`) fail on all three theorems. No single pinned lemma closes them: Mathlib's isolated-zeros theorem is one-variable, and no constant-rank theorem exists at the pin (the `Submersion.lean` docstring defers the rank criterion). No padding was found.
- Headlines in the Summary and their status:
  - Functorial rigid resolution (§5.3), connectedness of the resolution (§5.4) and the rational-point manifold (§6.3) are named as not statable; Tau Ceti has `AdicSpace` (`PreAdicSpace/Adic.lean` line 243) but no locally-finite-type, coherent-ideal or rigid carriers, so the docstring's claim is correct.
  - Constant rank (§6.1) and subfield detection (§6.5, in its C^m form) are stated. The G(C) form is not statable.
  - The deep results of Layers 0–2, 4, 5 and 6.2/6.4 are named as not statable; Gauss closure (§3.4) is stated.
  - No statable headline is absent.

### Dependency check

`tauceti-roadmap … gate --depcheck packages/AdicSpacesPartIIPartII/README.md --name AdicSpacesPartIIPartII --order merge-order/ORDER.txt --movable` printed:

    depcheck: 30 roadmaps, 266 edges, 0 problem(s)

There are no UPWARD or CYCLE lines. The check could not see the AdicSpacesPartIII edge (R01).

### Sample locators (15 targets)

| Target | Locator checked | Result |
|---|---|---|
| 0.1 | HK2 line 220 (§1.1, p. 5): Zariski topology by coherent vanishing loci | supports |
| 0.4 | BH22 line 570 (proof of Thm 2.29, p. 13): Supp g_*O_Z = f(Z) Zariski closed | supports; HK2 locator wrong (R07) |
| 0.5 | CONRAD99 Cor 1.2.3; TEMKIN12 line 1511; Lemma 1.1.5 | does not state regularity (R06) |
| 1.7 | CONRAD10 line 160 (Thm 2.1.1, p. 4) | supports, arbitrary k, normal X |
| 2.5 | HK2 line 2590 (p. 57) | supports |
| 3.3 | HK2 lines 2723–2728 (p. 60) | supports |
| 3.4 | HK2 lines 2730–2734 (p. 60); BH22 line 228 (Ex. 2.1) | source needs algebraically closed residue field; README's own proof needs only infinite (correct) |
| 4.2 | BH22 lines 235, 310 (Prop 2.2, Def 2.4, pp. 6–7) | supports |
| 4.4 | BH22 lines 314, 319, 325 (Def 2.5, Ex 2.6, Lem 2.8, pp. 7–8) | supports |
| 4.6 | BH22 line 329 (Prop 2.9, p. 8); POINEAU13 lines 705, 857, 893 (Lem 4.4 p. 284, Cor 4.15 p. 287, Cor 4.18 p. 288) | supports; Cor 4.18 needs the unique component through x to be strict, which the route establishes |
| 4.7 | BH22 line 346 (Cor 2.10); HK2 line 2710 (Lem 9.3.5, p. 60) | supports |
| 5.1 | TEMKIN12 line 1516 | weak (R07) |
| 5.4 | TEMKIN12 line 1563 (Thm 5.3.2, p. 34); HK2 line 1598 (§5.3, p. 35); HK2 line 2708 (§9.3) | supports |
| 6.3 | HK2 line 2602 (p. 58) | supports; SCHNEIDER11 not readable |
| 6.4 | HK2 lines 2611–2614 (p. 58) | the orbit map being a submersion is asserted there, not proved; supports |

Also checked and found correct:
- CONRAD99 Thm 2.1.2 (line 459), Lemma 2.2.1 (599), Lemma 2.2.3 (658), Thm 2.2.4 (673), Cor 2.2.7 (725), Cor 2.2.8 (734), Lemma 3.3.1 proof (1008, pp. 21–22), §1.2 (329).
- CONRAD10 Lemma 2.1.3 (189, proof line 211).
- TEMKIN12 Thm 1.2.1 (99, generically reduced), Remark 1.2.2 (110), §2.2 (427–460), Thm 2.3.5 and Remark 2.3.6 (629–631), §5.2.2 "regular = smooth for rigid spaces" (1483), Thm 5.2.2 (1504).
- HK2 Def 2.2.1 (691), Remark 2.2.2 (699).

### Adversarial table (computed values)

| Statement | Instance | Computed | Result |
|---|---|---|---|
| Gauss normalisation (l. 30) | π+T, 0<\|π\|<1 | at η: max(\|π\|,1)=1; at T=0: \|π\| | consistent |
| Tangent convention (l. 32) | T↦T², a=3 | df=2a=6; char 2: 0 | matches §§2.3, 2.5 Checks |
| §0.1 Zariski closed | V(T) on D; V(0); V(1); K⟨T⟩/(T²) | {T=0}, \|T\|_η=1≠0; \|X\|; ∅; V(T)=\|X\| | correct |
| §0.1 Check l. 143 | closure of {\|T\|≤\|ϖ\|} | has interior; identity principle forces any Zariski closure = D ≠ closure | not Zariski closed |
| §0.2 | Dⁿ; K⟨T⟩×K; cusp | n everywhere; 1 and 0; dim 1, Y²−X³∈m² so tangent dim 2 | correct |
| §0.3 (a)–(e) | X=Z=∅; X=Z≠∅; K⟨T⟩/(T²), Z=V(T); XY=0, Z=V(Y) | all hold; all fail; (T) is minimal prime, dims 0=0, so fail; (Y) minimal, fail | consistent both ways |
| §0.4 | ∅→X; id; V(I)↪X | image ∅, f_*O=0; X, O_X; V(I)=Supp O/I | correct |
| §0.5 | K⟨T⟩→K⟨T,T⁻¹⟩; T↦0; char p K→K(a^{1/p}) | flat; T·1=0 so not flat; fibre K(a^{1/p})[ε]/(ε^p) nonreduced | correct; route defect R06 |
| §0.5 scalar ext. | A=K⟨T⟩, K′/K finite separable | K[[T]]→K′[[T]] | correct |
| §1.1 | cusp; XY; K⟨T⟩/(T²) | K⟨t⟩, t∉K⟨t²,t³⟩; two discs, two points over 0; A_red=K | correct |
| §1.2 | one axis of XY; X⊔Spa K | other axis not nowhere dense; open extra point in f⁻¹Z | both fail the criterion, as claimed |
| §1.3 | Spa(K×K); ∅; disc | idempotents (1,0),(0,1): 2; preconnected not connected; K⟨T⟩ has no idempotents | correct |
| §1.4 | nodal cubic | normalization A¹ connected so 1 component; t=±1 gives x=t²−1=0, y=0; y²=t²(t²−1)²=x²(x+1) | correct (but see Source issues) |
| §1.5 | ∅; closed disc | binary condition vacuous, excluded by nonempty; V(f), f≠0 finite (Weierstrass) | correct |
| §1.7 | 1/T on punctured disc; t=Y/X on cusp | \|π\|^{−n}→∞; \|t\|=\|x\|^{1/2}≤1, t∉K⟨t²,t³⟩ | hypotheses necessary |
| §1.8 | nodal cubic minus node; XY minus 0 | A¹ minus {±1} connected; two pieces | correct |
| §2.1 | cusp; XY; K⟨T⟩/(T²) | {0}; {0}; \|X\| (not nowhere dense) | reducedness needed |
| §2.2 | k(a^{1/p})⟨T⟩ over imperfect k | regular; Ω rank 2 (dT, dY) vs dim 1 | perfectness needed |
| §2.4 | plane ∪ line in D³ | Y₁ = point, Y₂ = ∅ | correct |
| §2.5 | z↦z² | V_{≥1}=D−{0}; r=0 gives V; r>ranks gives ∅ | correct |
| §3.1 | Spa L, L/K Galois of degree n | Hom_K(L,L) has n elements, 1 class | correct |
| §3.3 | n=0; ℚ_p, n=1 | one point; ℤ_p closed | statement correct; Check false (R09) |
| §3.4 | ℚ_p; ℚ_p^ur completion, ζ₃ | \|T^p−T\|_η=1, \|a^p−a\|≤1/p; \|ζ\|=\|ζ−1\|=1 | infinite residue needed |
| `IsUnitGaussPoint` | n=0; x₀ (n=1); gaussPoint radius r<1 | unique point satisfies; vle T π holds at x₀ but ‖T‖=1>\|π\|; vle T c holds (r≤r) vs 1≤r false | determines the unit Gauss class |
| `gaussPoint_mem_closure_rationalPoints` | n=0; ℚ_p; base point x | trivially true; false there but excluded by `Infinite` residue; Spa(K,K°) is a singleton | correctly hypothesised |
| §4.1 sp | K⟨T⟩; annulus XY−c | η↦(0), a↦(T−ā); K̃[X,Y]/(XY), 2 generic points | correct |
| §4.2 | disc; annulus; L; 0; p+T² | 1; 2; 1; 0; sup=1=\|f\|_η | correct |
| §4.3 Check l. 692 | K⟨ε⟩/(ε²) | A°=K°⊕Kε, tⁿA°=tⁿK°⊕Kε, so completion = K° | correct |
| §4.4–4.6 | η_{a,r}, r∈\|K×\|; type 3; classical; isolated point of K⟨T⟩×K | trdeg 1=1; 0<1; 0<1; 0=0 | correct |
| §4.7 | all classical points of D over ℂ_p | contain no type-2 point | arbitrary unions, as Check says |
| §5.1 | D² at 0; D at 0; zero ideal | exceptional P¹; (T) invertible, iso; Proj(A⊕0⊕…)=∅ | correct |
| §5.2 Check l. 833 | Y²=X^{2n+1} | X-chart Y=XY′ gives Y′²=X^{2n−1}; n steps; no global bound | correct |
| §5.3–5.4 | ∅, smooth X; K[ε]/(ε²); XY | empty tower; excluded by hypothesis; two discs, disconnected | correct |
| §6.1 | (x,y)↦(x,x²); x↦x² at 0; x↦x^p (char p) | rank 1, ψ=(u,v−u²) gives (x,0); rank 0 at 0, 1 nearby (excluded); πⁿ↦π^{np}≠0 | hypotheses necessary |
| `analytic_constantRank` | k=0; m=0 | f constant on φ.source; points are open | satisfiable; ContMDiffAt ω gives analyticity near a, so no junk mfderiv |
| Inverse Check l. 48 | T+T² | inverse T−T²+2T³−5T⁴ (signed Catalan numbers, integral) converges for \|T\|<1 over ℚ_p | correct |
| §6.2–6.3 | G_m at 1; D/ℚ_p; ℚ_p(√p); ℂ_p | needs \|c\|<1; ℤ_p dim 1; dim 1 over E′, 2 over ℚ_p; infinite over ℚ_p | correct |
| §6.4 | GL₂ on ℙ¹ at [1:0] | coordinate c/a, derivative δc, surjective | correct |
| `analytic_germ_eq_zero_of_subfield` | z(z−a), a∉E; m=0; any characteristic | E-zeros near 0 = {0} (hypothesis fails); trivial; dividing by x gives all coefficients 0 without CharZero or completeness of E | true; extra hypotheses come from the source route (note, not a finding) |

### Supplier citations resolved

At main:
- AdicSpacesPartII R0.10–R0.17 (lines 4204–6681), R1.1 (8427), R1.2 (8542), R1.5 (9575), R1.6 (9660), R1.7 (9806), R1.9 (10509).
- AdicSpacesPartIII R2.2–R2.5, R3.1–R3.3, R3.6 (4356–5714, 9136–10053, 10472).
- RigidAnalyticGeometry §1.1–1.3 (177–262), §2.1–2.3 (297–397), Layers 3–4 (398), §6.2 (479), §7.3–7.4 (617–657), §8.1–8.3 (690–761).
- SchemeAndStackFoundations §0.3 (551), §0.21 (1394), §4.11 (5528).
- StableReduction Layer 4 (468).
- ReductiveGroups Layer 3 (234).

At open heads:
- ResolutionOfSingularitiesCharacteristicZero §§7.1, 7.5–7.8 (reduced only).
- DiamondsAndVStacks D4.8, D6.4, D6.5, D6.9.
- ReductiveGroupsPartII RG2.0.2.

`roadmaps resolve` found no missing names; the mismatches are R01–R03 and R14.

### Library declarations opened

Mathlib:
- `AnalyticAt.hasStrictFDerivAt` (`Analysis/Calculus/FDeriv/Analytic.lean` line 141)
- `HasStrictFDerivAt.toOpenPartialHomeomorph` (`InverseFunctionTheorem/FDeriv.lean` line 117)
- `OpenPartialHomeomorph.hasFPowerSeriesAt_symm` (`Analysis/Analytic/Inverse.lean` line 656)
- `MvPolynomial.funext` (`Algebra/MvPolynomial/Funext.lean` line 82)
- `BaireSpace.of_completelyPseudoMetrizable` (`Topology/Baire/CompleteMetrizable.lean` line 25)
- `MvPowerSeries.gaussNorm` (`RingTheory/MvPowerSeries/GaussNorm.lean`)
- `NonarchimedeanRing` (a Prop class, not implied by `IsUltrametricDist`, so the extra binder is needed)

Tau Ceti:
- `powerBoundedSubring` (`RingTheory/Huber/PowerBounded.lean` line 433), `topologicallyNilpotentIdeal` (494), `IsPowerBounded` (117)
- `weightedRestrictedSubring` (`WeightedRestrictedSeries/Basic.lean` line 709)
- `spa` (`AdicSpace/Spa/Basic.lean` line 101)
- `closedPolydisc`, `classicalPoint`, `classicalPoint_vle` (`Spa/Polydisc/Basic.lean` lines 72, 148, 156)
- `gaussPoint` (`Spa/Polydisc/GaussPoint.lean` line 236), which is one-variable only, as the README says

### Gaps and ownership

- gap:generically-reduced-functorial-resolution is precise and minimal; see R15 for a clarity point.
- Ownership against open work: the roadmaps tool searched main and all 333 open heads, and the board packages were grepped, for weakly Shilov points, Riemann extension, rigid normalization and components, rigid blow-ups, constant rank, Gauss closure and rational-point manifolds.
- This roadmap is the owner of the rigid Zariski geometry, components, Shilov theory, rigid resolution, analytic constant rank and the V(F) atlas. The only overlaps are later roadmaps (R03, R10).
- RigidAnalyticGeometry §8.1 and AdicSpacesPartII R1.9 (on main) already use rigid irreducible components that no main roadmap constructs; Layer 1.4 supplies the construction. That ownership inversion sits on main and is not a defect of this package.

## Not verifiable

- SCHNEIDER11 (paywalled; uncertified and settled in the manifest): its locators in §§2.3, 6.1, 6.2, 6.3, 6.5 and in the analytic-inverse contract (Cor 5.8, Prop 5.9, Lemma 9.2, Prop 9.3, Remark 9.4, pp. 33–61) were not read.
- BGR, Lütkebohmert, Bartenwerfer, Conrad's relative-ampleness paper and André's localisation paper were not fetched. They are cited only inside sources or proposed in repairs, and this job does not edit the manifest.

## Source issues

- **Error** in CONRAD99 at §2.2, author p. 14 (line 648): the source says Spec of a local ring is irreducible exactly when a single irreducible component passes through the point; it should say only that local irreducibility implies a unique component, and is equivalent to a single normalization point over it (nodal cubic: one component, two local branches); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a39708a", "job": "REV-PKG-AdicSpacesPartIIPartII", "model": "opus", "worker": "fable-rev53"} -->
