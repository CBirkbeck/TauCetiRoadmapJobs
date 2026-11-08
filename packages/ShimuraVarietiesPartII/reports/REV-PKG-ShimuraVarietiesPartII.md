<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2460#issuecomment-6675060583 -->
Review (claude) of d079ea1

Verdict: needs_changes

1. **F01** (P2) FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII is cited by design target ids that do not exist at its pull-request head

   **Location.** `packages/ShimuraVarietiesPartII/README.md:80` ("TD.2/very-good and TD.2/tensor-family-independence (very-goodness at a point …"), and the same ids in the Scope paragraph (line 21) and in the `*Needs:*` lines of §§1.1, 1.2, 2.3, 2.4, 5.3, 5.7, 5.8 and the Layer 1, 2 and 5 Dependencies (lines 333, 345, 465, 513, 537, 595, 845, 1036, 1084, 1132, 1144, 1178): 14 lines in all.

   **Claim.** The supplier states targets named `TD.2/very-good`, `TD.2/tensor-family-independence`, `TD.3/nonexceptional-embedding`, `TD.3/D-central-cover`, `TD.3/A-central-cover`, `TD.3/polarized-chain`, `TD.4/integral-tensor-frame`, `TD.4/crystalline-tensor-integrality`, `TD.4/versal-adapted`, `TD.6/ordinary-adapted-lift`, `TD.6/sigma-centralizer-action`.

   **Witness.** Those ids occur only in the board design `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/README.md`. The roadmap's open pull request (the head the brief names) is the ported package with numbered sections, and none of the eleven ids occurs in it (grep count 0 for each). The same objects are there under new numbers: `### 2.10 Very good integral Hodge embedding`, `### 2.11 Independence of the defining tensors`, `### 3.13 Very-good chains in the nonexceptional cases`, `### 3.15 Symplectic type-A central enlargement`, `### 3.16 Very-good chains with a perfect pairing`, `### 3.17 Dᴴ central enlargement with very-good chains`, `### 4.3 Tensor frames for crystalline lattices`, `### 4.4 Integral crystalline and Witt tensor comparison`, `### 4.12 Versal adapted deformation theorem`, `### 6.4 Existence of the adapted ordinary lift`, `### 6.5 Rational σ-centralizer action on the ordinary lift`. The pull-request gate resolves citations at that head, so every one of these 14 lines fails there.

   **Repair.** Replace, in all 14 lines: TD.2/very-good → §2.10; TD.2/tensor-family-independence → §2.11; TD.3/nonexceptional-embedding → §3.13; TD.3/A-central-cover → §3.15; TD.3/polarized-chain → §3.16; TD.3/D-central-cover → §3.17 (with §3.14 for the Dᴴ representations); TD.4/integral-tensor-frame → §4.3; TD.4/crystalline-tensor-integrality → §4.4; TD.4/versal-adapted → §4.12; TD.6/ordinary-adapted-lift → §6.4; TD.6/sigma-centralizer-action → §6.5. Tested on §5.8's `*Needs:*` line: "FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§6.4–6.5" names the adapted ordinary lift and the lift of all of `J_b(ℚ_p)` by quasi-isogenies, which is exactly what §5.8 consumes (§6.5 at the head: "every element of J_b(Q_p) … lifts to a self-quasi-isogeny over O_K", in the isogeny category).

2. **F02** (P2) GeometricSatakeAndFusionPartII is cited by design target ids that do not exist at its pull-request head

   **Location.** `packages/ShimuraVarietiesPartII/README.md:88` ("LM.1/adjoint-comparison …, LM.3/canonical-abelian-model and LM.7/general-normal-representative …, LM.3/special-fibre-interfaces … LM.5/same-field-curve"), line 90 (the `gap:local-models` section), and the `*Needs:*` and Dependencies lines 371, 409, 455, 465, 753, 765, 789, 809, 1048, 1132, 1178, 1190, 1224, 1226, 1248: 17 lines; also `design/plan.json` gap `local-models`, field `section` ("LM.3/canonical-abelian-model and LM.7/general-normal-representative …").

   **Claim.** The supplier states targets with those ids.

   **Witness.** Grep count 0 for every `LM.*` id in the roadmap's pull-request head; the ids are the board design's. At the head the objects are `### 1.4 Polynomial adjoint and derived-isogeny comparisons`, `### 3.1 The canonical model in the classical abelian-type range`, `### 3.4 Algebraic and Witt special-fibre interfaces`, `### 5.5 Same-residue-field curve theorem`, `### 7.6 General normal minuscule local models`.

   **Repair.** Replace LM.1/adjoint-comparison → §1.4; LM.3/canonical-abelian-model → §3.1; LM.3/special-fibre-interfaces → §3.4; LM.5/same-field-curve → §5.5; LM.7/general-normal-representative → §7.6, in the 17 README lines and in the `section` field of the `local-models` gap in `design/plan.json` (the gap stays declared; see R04 for its `needs`). Tested on §6.3: "GeometricSatakeAndFusionPartII §5.5" is the statement used (curve over `F_q` through an `F_q`-point of a lower stratum, dense in a strictly higher one, field of definition exactly `F_q`), with the supplier's own hypotheses `p>2`, very special connected level and `p∤|π₁(G^der)|`, which §2.1's strongly acceptable triple provides.

3. **F03** (P2) gap:arbitrary-dvr-good-reduction asks NeronModelsAndSemistableAbelianVarieties for what it already states

   **Location.** `packages/ShimuraVarietiesPartII/README.md:176` ("§§5.1–5.2. Extend the good-reduction criterion and descent to an arbitrary mixed-characteristic DVR … §§5.1–5.2 state the excellent-DVR case"), line 174, the `*Needs:*` line of §1.8 (line 441) and Layer 1 Dependencies (line 465); `design/plan.json` gap `arbitrary-dvr-good-reduction`.

   **Claim.** The supplier's good-reduction criterion is stated only for excellent discrete valuation rings.

   **Witness.** At the supplier's pull-request head, `### 5.1 Néron–Ogg–Shafarevich` begins "Let `R` be a henselian discrete valuation ring and `ℓ ≠ char k`", and `### 5.2 Good reduction is isogeny invariant` begins "Let `R` be a discrete valuation ring" and ends "for a non-henselian `R` the abelian-scheme model descends from the henselisation …, which is part of this target". The word "excellent" does not occur in §§5.1–5.2. What §1.8 needs is exactly this: with the full prime-to-p level the Galois group of `R[1/p]` acts trivially on the prime-to-p Tate module, so §5.1 after henselisation and §5.2's descent give good reduction over `R`; the extension to the Siegel model and the lift to the normalization (finite, because the normalization is of a finite-type scheme over the excellent `O_E`) need nothing about `R`. HT Lemma 1.3.6's "finite flat `R′/R`" step is used only for (iii)⇒(i), potential good reduction, which §1.8 does not assert.

   **Repair.** Delete the gap from the README contract (lines 174–176 become "§5.1 (Néron–Ogg–Shafarevich over a henselian discrete valuation ring) and §5.2 (isogeny invariance and descent from the henselisation to an arbitrary discrete valuation ring)"), from §1.8's `*Needs:*` and the Layer 1 Dependencies, and from `design/plan.json` `gaps`. Tested on §1.8: its statement is for "every discrete valuation `O_E`-algebra `R` of mixed characteristic (0,p)", and the two cited sections cover that `R` without an excellence hypothesis.

4. **F04** (P2) gap:local-models asks GeometricSatakeAndFusionPartII for a smooth-locus statement it already proves

   **Location.** `packages/ShimuraVarietiesPartII/README.md:90` ("… prove that the geometric special fibre of the canonical normal local model is integral, the μ-admissible set having a unique extremal element, and that the extremal Schubert stratum lies in the smooth locus, including ramified groups"); `design/plan.json` gap `local-models`, field `needs`.

   **Claim.** The supplier has no statement that the extremal Schubert stratum lies in the smooth locus.

   **Witness.** At the supplier's head, `### 3.7 The smooth open of maximal admissible orbits` states: for every connected reductive `G` over a finite extension of `ℚ_p`, every parahoric and minuscule `μ`, the weakly normal representative has an open subscheme smooth over `O_E` whose geometric special fibre is the union of the maximal admissible orbits and is dense; §7.6 then makes that representative the normal model. No tameness restriction. So two of the three clauses of the gap are supplied; only the very-special statement that `Adm({μ})_J` has a unique maximal element, hence that the geometrically reduced special fibre (§7.6) is irreducible and so integral, is missing (KZ Theorem 4.4.4 proof, p.43; §5.2.1, p.49, KZ line 2160).

   **Repair.** Narrow the `needs` sentence in both files to: "For a very special parahoric and odd p, prove that the μ-admissible set has a unique maximal element, so that the geometric special fibre of the normal local model of §3.1 and §7.6 is irreducible, hence integral (KZ Theorem 4.4.4 and its proof, p.43; §5.2.1, p.49)"; cite §3.7 directly, in the contract and in the `*Needs:*` lines of §§1.9, 5.7 and 6.1, for the smoothness of the extremal stratum. Tested on §5.7 (ordinary points are very good): it needs only "the ordinary point lies in the smooth extremal local-model locus", which §3.7 plus BunGAndNewtonStrata §1.29 gives, and KPZ Corollary 5.3.16, p.60 then applies.

5. **F05** (P3) gap:open-curve-companions is not minimal

   **Location.** `packages/ShimuraVarietiesPartII/README.md:170` ("Extend the algebraic p-plain companion theorem of §§6.1–6.2 to semisimple lisse sheaves on smooth geometrically connected open curves … by direct sums, allowing a constant twist and a finite coefficient extension"); `design/plan.json` gap `open-curve-companions`.

   **Claim.** The supplier's §§6.1–6.2 lack the constant twist, the coefficient extension and the open curve.

   **Witness.** At the supplier's head, §6.1 states the constant twist making the determinant finite order and its algebraic p-plain refinement (Chin Proposition 4.3), and §6.2 states, for an irreducible lisse sheaf "on a smooth curve", the companion "after a finite local coefficient extension" and the compatible system "by the constant-twist reduction", with KZ §5.3.1 among its sources. What remains for §7.4 is the passage from irreducible to semisimple sheaves, a direct sum over constituents, and at most the explicit reading of "smooth curve" as an open curve.

   **Repair.** Narrow the `needs` sentence in both files to the two missing clauses ("state §6.2 for semisimple lisse sheaves on a smooth geometrically connected open curve over `F_q`, as the direct sum of the companions of its irreducible constituents, with one common finite coefficient extension"), and cite §§6.1–6.2 directly for the irreducible case. Tested on §7.4: its proof route uses companions of the pulled-back semisimplified local system on the dense open and Chebotarev; both inputs are then named.

6. **F06** (P3) four supplier sections cited by numbers that do not exist at the suppliers' heads

   **Location and witness.**

   - `README.md:114` and `:1036`: "BunGAndNewtonStrata §0.5 and §0.8 (point and family G-isocrystals)". At the supplier's head Layer 0 has §§0.2, 0.6, 0.7, 0.8, 0.9 and no §0.5; the point G-isocrystals and `B(G)` are `### 0.6 The Kottwitz set B(G)` (with the `WittVector.Isocrystal` comparison), families are §0.8. Repair: §0.5 → §0.6.
   - `README.md:146`, `:263`, `:1168`, `:1260`, `:1354`: "AutomorphicBundles §§B2.4–B2.7". The supplier's head has no `B2` numbering; the Betti, étale, filtered de Rham coefficients, their comparison and tensor/Hecke coherence are `### 3.4`–`### 3.8` of its Layer 3. Repair: §§B2.4–B2.7 → §§3.4–3.8.
   - `README.md:180`, `:182`, `:930` and `design/plan.json` gap `component-specialization` (`section`): "ShimuraCompactifications Layer C5 (integral PEL compactifications)". At the head the integral PEL compactifications are `## Layer 7`; there is no C-numbering. Repair: Layer C5 → Layer 7, in the contract, the gap's section (README and plan.json) and §4.7's `*Needs:*`.
   - `README.md:186` and `:870`: "IgusaVarietiesAndTorsionConcentration Layers IG.0 and IG.2 (B(G), the Newton and Kottwitz maps and the PEL Newton strata)". At the head these are `### 0.1 Isocrystals with G-structure and the set B(G)`, `### 0.2 The Newton and Kottwitz maps, the order and B(G, μ)` and `### 0.12 The Newton map and stratification`, all in Layer 0; Layer 2 is "Partial compactifications and cusp geometry". Repair: "Layers IG.0 and IG.2" → "§§0.1–0.2 and §0.12".

   Tested on §4.3's fourth Check: the PEL genus-one strata it compares with are the ones §0.12 defines.

7. **F07** (P3) the library contracts cite commits that are not the pins and line numbers that are off at the pins

   **Location.** `README.md:44` ("At 6b7abb3c…: `WittVector.Isocrystal` (Mathlib/RingTheory/WittVector/Isocrystal.lean:113)") and `README.md:48` ("At a91d3aaf…: … Basic.lean:95 … End/Basic.lean:83 … SymplecticMultiplier.lean:76 … Reductive/Basic.lean:70").

   **Claim.** Those are the pinned commits and the lines of the declarations.

   **Witness.** `lake-manifest.json` pins mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and TauCeti `2fd255d997f47c0b5d834ee416c7015d55444ce5` (both checked-out package heads agree; the cited commits are earlier ancestors). At the pins: `class Isocrystal` is at `Mathlib/RingTheory/WittVector/Isocrystal.lean:112`; `structure AbelianVariety` at `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` (correct); `def End` at `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:74` (line 83 is `toHom`); `theorem transpose_mul_J_mul_eq_det_smul` at `TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean:63` (line 76 is the docstring of the adjoint lemma); `def reductiveCommHopfAlgProperty` at `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:71`. The descriptions themselves are right: the symplectic lemma carries `[Unique l]`, so "rank-two block matrix" is exact, and the Hopf-algebra property has no conjugation coaction (no `coaction` in the file).

   **Repair.** Replace the two hashes by the manifest pins and the lines by 112, 95, 74, 63, 71. Tested: each `grep -n` above returns the declaration on that line.

8. **F08** (P3) three locator slips and one work cited with a proposition number but not in the manifest

   **Location and witness.**

   - `README.md:247` (§0.3): "(HT, §2.1.1–2.1.2, pp.20–21 …)". Both paragraphs are on p.21 (HT line 938 starts page 21; §2.1.1 at line 940, §2.1.2 at line 963); p.20 holds only the section title. Repair: "p.21".
   - `README.md:437` (§1.8): "(HT, Lemma 1.3.6, p.17)". The lemma (HT line 764) is the finite-level criterion "extends iff good reduction"; the pro-level bijection `lim S(R) = Sh(R[1/p])` that §1.8 states is KPZ Theorem 7.1.3(1), p.73 (KPZ line 3196). Repair: add "KPZ Theorem 7.1.3(1), p.73" to the locator, keeping HT for the normalization criterion.
   - `README.md:142` (Motives contract): "the closed-immersion criterion of Deligne–Milne Proposition 2.21(b)". Deligne–Milne is not in `sources.toml`; the supplier's §6.3 states the criterion ("a closed immersion exactly when every object of `C` is a subquotient of an object in the image"). Repair: either record Deligne–Milne, *Tannakian categories*, with that locator in the manifest, or cite MotivesAndAlgebraicCycles §6.3 alone.

Files reviewed: `packages/ShimuraVarietiesPartII/README.md` (1380 lines, 63 targets in 8 layers), `Suggested.lean` (41 lines, docstring only), `metadata.toml`, `sources.toml` (five certified entries), `design/plan.json` (21 gaps). No previous package review. The package-stage report and the three design-stage review and repair reports were read first; the one item the round-2 repair marked `not actionable in this package` (the two-way ownership between this roadmap's §7.6 and ReductiveGroupsPartIII RG3.5) is settled and is not re-raised: the README neither cites RG3.5 nor is cited by name from RG3, the direction problem lives in ReductiveGroupsPartIII, and the depcheck is clean.

Eight findings: four P2 (two supplier drifts that make 31 citations unresolvable at the suppliers' current heads, and two declared gaps that ask for what the supplier already states), four P3. No P1. The mathematics checked out: every sampled locator holds, every numerical Check recomputes, the elaboration is clean, and nothing in `Suggested.lean` is padding because it declares nothing.

## Verified sound

**Principles.** No route-specific shortcut: every statement is at the generality of its source (p>2 throughout, as KZ and KPZ assume; arbitrary prime-to-p level through the stack of §0.2; ramified groups included via KPZ 7.2.19/7.2.21). Nothing re-plans ShimuraVarieties, PELModuli, BunGAndNewtonStrata, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII or GeometricSatakeAndFusionPartII: each is imported by section and the Scope paragraph says where ShimuraVarieties stops (§8.1). No copied passage (spot-checked every sampled statement against the source text: all are paraphrases). No algorithm. No sorry'd data, no `set_option`: `Suggested.lean` declares nothing.

**Dependency check.** Output of the prescribed command:

```
moved: ShimuraVarietiesPartII moved in the merge order from #252 to #305, right after its last supplier GeometricSatakeAndFusionPartII; checked as moved (the worker moves it there when it submits)
depcheck: 242 roadmaps, 2497 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The `moved:` line is not a defect. The one `roadmaps resolve` lead "ReductiveGroupsPartIII RG3.0: no roadmap" is a false positive: ReductiveGroupsPartIII is a board design (`packages/ReductiveGroupsPartIII/design/README.md`) and at #238 of the merge order, before this roadmap; its targets RG3.0/conjugacy-quotient (line 109), RG3.0/character-separation (146), RG3.0/faithful-quotient-finite (165), RG3.0/orthogonal-outer-action (185), RG3.1/degree-one-residue-descent (245), RG3.1/finite-fibre-algebraicity (265), RG3.2/elliptic-maximal-torus (384), RG3.3/cyclic-torus-and-neatness (610) and Layer RG3.5 (810) all exist there. The other two leads (AutomorphicBundles B2.4, BunGAndNewtonStrata 0.5) are real and are R06.

**Supplier citations resolved** at the suppliers' current heads (pull-request copies via `roadmaps show`, or main for SchemeAndStackFoundations and ReductiveGroupsPartII): ShimuraVarieties §§4.5, 5.6, 6.3–6.6, 8.1; ShimuraData Layers 1 and 4; PELModuli §§M4.5–M4.6, M6.1–M6.4; AbelianSchemesAndArithmeticModuli §§A4.1, A4.3, A4.8, A4.9, A6.7, A6.14, A6.20, A6.21, A6.22, A6.28, A6.29; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2 with R07.2.6, .7, .12, .14, .20; GeometricSatakeAndFusion Layer GS0; ReductiveGroupsPartII §§RG2.0, RG2.1, RG2.3 (RG2.3.4 states the very-special parahorics and cites KZ Lemma 4.2.4 for the connected-fixer criterion); BunGAndNewtonStrata §§0.8, 1.16 (the finite twisted norm centralizer, with the same iterated product `δσ(δ)⋯σ^(r−1)(δ)`), 1.22–1.26, 1.28, 1.29, 1.34, 1.37, 2.16; HeckeStacksAndLocalShtukas HS2.1, HS2.10, HS2.11, HS2.13; CrystallineCohomology CR.7.1, CR.7.3; PadicDifferentialEquationsAndRigidCohomology RD.3.43, RD.5.116; PadicHodgeTheory §5.5; MotivesAndAlgebraicCycles Layer 6 and §6.3; SchemeAndStackFoundations §§1.17–1.23; AlgebraicModuliForArithmeticGeometry Layers 1, 4, 6; ArithmeticGaloisRepresentations §§5.1, 5.13, Layer 6; GlobalShtukasAndFunctionFieldLanglands §§6.1–6.2; NeronModelsAndSemistableAbelianVarieties §§5.1–5.2; ShimuraCompactifications and IgusaVarietiesAndTorsionConcentration (see R06). All 31 other cited sections exist.

**Declared gaps** (21 in `design/plan.json`, the same 21 slugs under `## Exact supplier contracts`, each with a named supplier). Checked against the suppliers' heads for what they already state: the 17 not named in R03–R05 are genuine and precise. In particular ReductiveGroupsPartII's scope list defers `r-smooth-torus`, `centralExtension_exact_rSmooth` and `fixer_closedImmersion_of_rSmooth` (KZ §2.4, Propositions 2.4.6, 2.4.8, 2.4.10) out of RG2, and the ReductiveGroupsPartIII design has no "R-smooth", "Borel" or compact-quotient statement, so the four `rg3-*` gaps and `compact-quotient-borel` are needed; HeckeStacksAndLocalShtukas has no canonical-integral-model or completion comparison (PR24/DvHKZ), so `integral-local-shimura` and `general-connected-reduction` are needed; NeronModels §6.0 is Noot's Hilbertian specialisation (1995), not the Conj′ Frobenius comparison (2009), so `noot-coarse-comparison` is needed; no roadmap on main or at an open head states Poonen's finite-field Bertini (`roadmaps grep` for Bertini/Poonen finds only citations of his book and of Poonen–Stoll), so `finite-field-bertini` is needed; CrystallineCohomology CR.7 has no convergent-isocrystal tensor descent or rigid parallel transport.

**Sampled locators** (all 15 targets of the seed, read in the cached texts):

| Target | Source passage | Result |
|---|---|---|
| 0.3 | HT §2.1.1–2.1.2, lines 940–968 (p.21); KZ §4.1.5, line 1299 (p.30) | supports: finite étale transitions, `G(A_f^p)`-action, sections extend by normality; page slip (R08) |
| 2.2 | KPZ §7.2.2–7.2.3, lines 3380–3416 (pp.77–78): CM field `K` with every prime of `F` above p split; Prop 7.2.19(2), line 3675 (p.83) | supports |
| 2.5 | KPZ Prop 7.2.19, lines 3669–3682 (p.83): (1) 2-group `π₁`, (D); (2) splitting; (3) R-smooth centre, quasi-tame `Z^c`; (4) self-dual very good embedding; torsion-free `X_*(G_ab)_I` only without p-divisible indices | supports, hypothesis by hypothesis |
| 2.6 | KZ Prop 4.2.3, lines 1491–1515 (p.34); Lemma 4.2.4, lines 1516–1549 (pp.34–35) | supports; the source's "(5) torsion" is the misprint the README records |
| 3.6 | KPZ §7.3.1(3), lines 3814–3847 (pp.86–87): pieces `Sh^{j,+}` at level `jK_p°j⁻¹`, union over `J`, quotient by `𝒜(G_{Z(p)})°` | supports |
| 3.8 | KPZ Thm 7.2.21, lines 3735–3763 (pp.84–85); Prop 7.1.14, lines 3317–3348 (pp.75–76) | supports: DVR bijection, étale-local model, `G^ad`-torsor diagram |
| 3.10 | KZ Thm 4.2.6(3), lines 1560–1568 (p.35); Remark 4.2.7(2), line 1578 (p.36); KPZ Prop 7.1.14(3), line 3337 ("if `G=G°` then π reduces to a `G^{ad,°}`-torsor") | supports |
| 4.6 | KZ Def 4.4.3 and the standing assumption, lines 1884–1885 (p.43); Def 2.2.4 and Remark 2.2.5, lines 437–443 (p.10); HT §1.3.15, line 909 (p.20) | supports; existence premise explicit |
| 4.9 | HT §2.1.5–2.1.7, lines 1011–1078 (pp.22–24): `γ_{m,p}=δσ(δ)⋯σ^{rm−1}(δ)` (2.1.7.2), `I_{m,δ}⊂J_δ`; K17 §2.1.2, lines 1281–1314 (p.29) | supports |
| 4.10 | HT §2.1.3, lines 969–981 (p.21): compact modulo scalars, reductive; K17 Cor 2.1.7, lines 1381–1395 (p.31) | supports |
| 4.11 | HT Lemma 2.1.4, lines 989–1010 (p.22): unique `φ∈Aut(A)`, fixes both tensor families, `I(Z_(p))=I(Q)∩Aut(A)` | supports, one direction only, as stated |
| 6.2 | KZ proof of Cor 5.2.7, lines 2333–2336 (p.52): Lang on the `G^ad`-torsor with connected special fibre, `x̃∈S̃(F_q)`, `y∈M^λ(F_q)` | supports |
| 7.3 | KZ Lemma 5.3.3, lines 2381–2388 (pp.53–54): ℓ-adic units via one faithful representation | supports; the README's "every finite place away from p" follows since the `H₁` eigenvalues are `ᾱ/q` for Weil numbers α |
| 7.4 | KZ Prop 5.3.5 and proof, lines 2392–2425 (p.54): Chin's refinement, Chebotarev on the dense open, start at ordinary points, top stratum, descending induction | supports |
| 7.5 | KZ §5.3.6, lines 2428–2439 (p.55): finiteness of `Conj_G→Conj_GL(V)`, Steinberg 6.6, Chebotarev descent | supports |

Also read, outside the seed: KZ Thm 5.1.4 (line 2104, p.48, including `y∈S_K(F_q)` with `F_q/k_E` finite and the (5.1.1.1) torsor `Isom(V, V_ℓ∨)` = `Isom(V,H₁)`, which is the README's convention), §4.1.10 and Thm 4.1.11 (lines 1392–1437, pp.32–33), Prop 4.3.2 and Cor 4.3.4 (lines 1636–1643, 1710), Prop 4.4.10 (line 1973), Cor 4.4.13 and Remark 4.4.14 (lines 2038–2056, p.46), §5.2.1 (lines 2131–2166, pp.48–49), Thm 4.4.4 (line 1887, p.43); HT Lemma 1.3.6, Prop 1.3.7, Lemma 1.3.9, Prop 1.3.10 (pp.17–18), Thm 1.3.14 (pp.19–20), Cor 1.3.16 (p.20), Cor 2.1.9 (pp.24–25); KPZ Thm 7.1.3 (lines 3191–3206, pp.72–73), Thm 7.1.8 and Remark 7.1.9 (lines 3254–3277, p.74), Prop 7.1.11 (p.75), Cor 5.3.16 (line 2632, p.60), Cor 7.2.24 (p.85), and the pages of Props 7.2.10 (p.79), 7.2.16 and Lemmas 7.2.13–14 (p.81), 7.2.11 (p.80), 7.2.5, 7.2.7, 7.2.8 (pp.78–79), 2.1.5 (p.10); KP: the pdf page of every cited statement plus 120 equals the journal page the README gives (Thm 4.2.7 p.186; Lemmas 4.3.2, 4.3.5, Cor 4.3.9 pp.189–191; Lemmas 4.5.2–4.5.9 pp.194–196; §4.6.1–4.6.5 pp.197–199; Lemmas 4.6.6, 4.6.9 pp.200–201; Lemma 4.6.13, Cor 4.6.15 pp.202–203; (4.6.20), Cor 4.6.18 p.205). All consistent.

**Adversarial pass** (statement, instances, values computed, result):

| Statement | Instances | Values | Result |
|---|---|---|---|
| Conventions, Check 2: `E: y²=x³+x` over `F₅` | enumerate x=0..4 | affine counts 1,0,1,1,0; `#E(F₅)=4`; trace 2; `H¹` polynomial `T²−2T+5`; tower polynomial `T²−(2/5)T+1/5`; multipliers 1/5 and 5 | agrees |
| Conventions, Check 3: `F₂₅` | `a₂=a²−2p` | trace −6; `T²+6T+25`; tower `T²+(6/25)T+1/25`; Teichmüller ζ of order 24: `ζσ(ζ)=ζ^{1+5}=ζ⁶ ≠ ζ²` | agrees |
| Conventions, Check 1: Hodge weights | `h(z)=z^{−a}z̄^{−b}` on type (a,b), `μ_h=h_C(z,1)` | `μ_h`: `z⁻¹` on `H^{1,0}`, 1 on `H^{0,1}`; on `H₁`: z and 1; `μ_h⁻¹` has det exponent −1, slopes (0,−1)/(−1/2,−1/2), κ=−1 | agrees |
| Conventions, Check 4: `SL₂(ℝ)` rotations | `R=[[0,−1],[1,0]]`, `C=diag(1,−1)` | `CRC⁻¹=R⁻¹`, `det C=−1`, `tr R=tr R⁻¹=0` | agrees; `Conj(ℝ)` does not separate |
| Conventions: `det(T−g)` | `g=diag(1,1/5)` | `T²−(6/5)T+1/5`, constant `(−1)²det g=1/5`; `det(1−gT)=1−(6/5)T+T²/5` | agrees (§7.2 Check) |
| 0.1 Check 3 | `U=[[1,ε],[0,1]]` over `k[ε]/ε²` | `U e₁ U⁻¹=[[1,−ε],[0,0]]` | agrees |
| 0.1 Check 4, Zarhin | `E` principally polarized | `(E×E∨)⁴=E⁸`, dim 8 vs dim 2 for `E×E∨` | agrees |
| 0.x Example: `Y(9)→Y(3)` | full-level `GL₂` tower | `|GL₂(ℤ/9)|/|GL₂(ℤ/3)| = 81 = 3⁴` (27 on the geometric `SL₂` fibre times 3 components) | agrees as stated ("full-level tower") |
| 1.4 / Layer 1 Example | hyperspecial `GL₂` | dim G=4, dim S=dim P¹=1, dim S̃=5, relative dim of q = 4 | agrees; q not invariant (frame change outside the stabilizer moves the filtration) |
| 1.7 Check 3 | blow-up of `A¹_{ℤ_p}` at `(p,t)` | special fibre: 2 components vs 1; generic fibres both `A¹_{ℚ_p}` | agrees |
| 2.1 Checks | `GU(1,1)`, p split; `GSp_{2g}` | `Z_G=Res_{K/ℚ}G_m`, `Z_{G,0}=U(1)`, `Z^c=U(1)`, split at p to `G_m` (induced); `GSp`: `Z_{G,0}=1`, `Z^c=Z(Sp)=μ₂`, not a torus | agrees |
| 3.4 Check 3 | `γ=diag(ℓ,1)`, `K_ℓ=GL₂(ℤ_ℓ)` | `γ[[1,0],[1,1]]γ⁻¹=[[1,0],[ℓ⁻¹,1]]∉K_ℓ`; `γ[[1,1],[0,1]]γ⁻¹=[[1,ℓ],[0,1]]` | agrees |
| 3.10 Checks | `GU(1,1)` | dim `G_ad`=3, dim S̃_ad=4, relative dim 3; full: dim G=5, dim S̃=6; `H¹(F_q,ℤ/2)=ℤ/2` vs Lang | agrees |
| Layer 3 Example | Iwahori, `j=diag(p,1)` | `jMj⁻¹=[[a,pb],[c/p,d]]`; c=p gives c/p=1 | agrees |
| 4.3 Checks | `GL₂`, `PGL₂` | ordinary rep `diag(p⁻¹,1)σ`, κ=−1; `PGL₂`: Newton points both 0, Kottwitz 0 and 1 in `ℤ/2` | agrees |
| 4.9 Checks | r=1 over `F₅`, `δ_D=[[0,−1],[5,0]]` | `δ_D²=−5`; `(δ_D^{−T})²=−1/5`; centralizer of `δ_D` in `GL₂(ℚ₅)` is `ℚ₅(√−5)^×` (char. poly `T²+5` irreducible), `J_δ=D^×`; over `F₂₅` the norm `δ²=−5` is scalar | agrees |
| 4.9, q=p degenerate | r=1 | `N₁(δ)=δ`; no σ-twist (σ=id on `W(F_p)`) | consistent |
| 4.10 compactness | supersingular E | `I=B^×`, rank 2, `I(ℝ)/ℝ^×≅SO(3)` compact | agrees (Layer 4 Example) |
| 4.11 direction | hyperspecial `GL₂`, `g₂=−g₁` | same point, relating automorphism −1 ∈ `I_x(ℤ_(p))`; converse not claimed | consistent with HT Lemma 2.1.4 |
| 5.2 Checks | `diag(2,1)`, `diag(3,1)` on symplectic planes | `AᵀJA = det A·J`: multipliers 2 and 3; block sum has no single multiplier | agrees |
| 7.2 / Layer 7 Example | elliptic point over `F₅`, `F₂₅` | tower coordinates (2/5,1/5) and (−6/25,1/25); `H¹` coordinates (2,5) | agrees |
| 7.3 | eigenvalues of `H₁` | `α⁻¹=ᾱ/q` for a Weil number α with `αᾱ=q`: unit at every finite place ∤p, not at p | statement correct as written |
| 7.6 uniqueness | `Conj(G)(ℚ)→Conj(G)(ℚ_ℓ)` | injective (ℚ⊂ℚ_ℓ), so γ_y unique | holds |
| 4.6 degenerate | non-quasi-split inner form | maximum of `B(G,{μ})` with `ν≠μ⁻¹◇` (KZ Remark 2.2.5): no ordinary locus; existence premise is explicit in §4.6 | correct |
| Torus datum | `G=T`, `G_ad=1` | `M_loc` a point, π identity, q relative dim 0 (§3.10 Check 2) | consistent |
| Non-neat level | `−1∈K^p` | stack inertia of §0.2, §7.6 on the stack | consistent with KZ §4.1.5 |
| p=2 | excluded by Conventions (p>2) | every source statement used assumes p>2 | consistent |

No instance refuted a statement; no Check contradicts a theorem of its section.

**Suggested.lean, headlines and padding.** Elaboration: `lake env lean` on the file from the content checkout, exit 0, no output (no `sorry` warning because nothing is declared), 4.8 s. Headline theorems listed in the README summary: KZ Theorem 5.1.4 (§7.6), KPZ Theorem 7.2.21 (§3.8), KZ Theorem 4.4.6 (§5.9), KZ Corollary 4.4.13 (§5.10), HT Corollary 2.1.9 (§4.13), density of the ordinary locus HT Corollary 1.3.16 (§4.7), KZ Corollary 5.2.7 (§6.3). Each is named in the module docstring with the carrier it lacks, and none is statable at the pins: at the pinned Mathlib and Tau Ceti there is no Shimura variety, integral model, parahoric or Bruhat–Tits group scheme, abelian scheme, Newton stratum or conjugacy quotient of a reductive group (greps for `Shimura`, `parahoric`, `BruhatTits`, `AbelianScheme`, `Newton strat` in declaration lines return nothing; `TauCeti.reductiveCommHopfAlgProperty` exists at `Reductive/Basic.lean:71` with no conjugation coaction; the only conjugacy-class files are for `GL_n` matrices). Nothing is forced through a stand-in. One-tactic probe: no sorried theorem to probe; no padding. `#check` comparison: no declarations. Import header: `import Mathlib` only, no `TauCeti.*` module used, which is correct since none is cited in the file. No `lemma`, `set_option`, `#eval`, process comment or path.

**README shape.** 63 numbered sections; every Definition/Construction (30) has an `**API.**` block and at least three Checks (two have four); every Theorem (33) carries a locator in parentheses and exactly one `*Needs:*` line; each of the eight layers ends with `### Examples` and `### Dependencies`; the headings `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Downstream consumers`, `## References` are present. No LaTeX delimiters, no pull-request numbers, no process words ("current", "removed", "round", "checkpoint", "handoff" absent), no local paths. All 21 gaps appear in the README with the same slugs as `plan.json`.

**Ownership.** Searched by object (Kisin–Zhou ℓ-independence on Shimura special fibres, normalized Hodge-type integral models at parahoric level, Kottwitz–Rapoport strata on Shimura models, μ-ordinary locus, the tensor isogeny group `I_x`) across main, the board packages and the open heads via `roadmaps grep`: no other owner. ReductiveGroupsPartIII RG3.5/common-frobenius-class is KZ Theorem 6.2.7 for abelian varieties over number fields and takes KZ Theorem 5.1.4 as an input it does not prove; this roadmap owns 5.1.4. Note for the maintainer, not a finding here: RG3 sits before this roadmap in the merge order while RG3.5 consumes §7.6; that is to be settled when ReductiveGroupsPartIII is packaged.

## Not verifiable

- KZ in the Annals version: the manifest records arXiv v2 only and says the numbering is not collated with Annals 202 (2025); all KZ locators were checked against v2.
- GeometricSatakeAndFusionPartII §5.5's own hypotheses (`p∤|π₁(G^der)|`) were read at the pull-request head but not checked against its source (that roadmap's review).

## Source issues

- **Misprint** in HT at §2.1.3, printed page 21 (HT line 984): the source defines the integral automorphism group as the `ℚ_p`-points of the isogeny group intersected with the automorphisms; it should be the `ℚ`-points, as the proof of Lemma 2.1.4 (line 1009) uses; affects nothing.
- **Misprint** in KZ at Proposition 4.2.3(5), printed page 34 (KZ line 1503): the source says the inertia coinvariants of the abelianized cocharacter lattice are torsion; it should be torsion-free, as Lemma 4.2.4 and the use on page 41 require; affects a stated result.
- **Misprint** in KZ at proof of Proposition 4.2.3, printed page 34 (KZ lines 1504–1515): the source cites KPZ Propositions 7.2.14 and 7.2.18 by preprint numbers; in the published KPZ these are Proposition 7.2.19 (and Remark 4.1.13's "Corollary 4.3.9" is Corollary 5.3.16); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d079ea1366ba67382d3fa80767801d5240f4af1e", "job": "REV-PKG-ShimuraVarietiesPartII", "model": "fable", "worker": "chris-x9"} -->
