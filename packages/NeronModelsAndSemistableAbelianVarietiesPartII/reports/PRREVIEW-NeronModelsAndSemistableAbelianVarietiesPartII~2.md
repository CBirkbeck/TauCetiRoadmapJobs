# Review of NeronModelsAndSemistableAbelianVarietiesPartII (pull request #870 at cc6f0ae)

**Verdict:** needs changes

This is a full re-review of the repaired head. The folder changed by 2595 lines since the head the previous review read; `Suggested.lean` is byte-identical to that head. The repair status of the previous review's seven findings is given first, then the new findings, then the verification record.

**Repair status of the previous review.**

- Previous R01 (conductor cycle): repaired. The Layer 1 Dependencies paragraph (`README.md:3749`) now fixes the order "§§1.35–1.37, §1.14, §1.15, §1.16, §1.42, §1.20, §§1.38–1.41"; §1.37 says it "precedes §1.14" and its `*Needs:*` line (`README.md:3169`) lists §1.35, §1.13, §1.2 and library names only; the new §1.42 needs §1.16 and §1.37, and §1.20 needs §1.42. A mechanical pass over every `*Needs:*` line of the README (157 sections) finds no cycle inside Layer 1.
- Previous R02 (general base in Shioda–Tate): repaired. §4.8 (`README.md:8976`) now has "B an arbitrary smooth proper curve", generators "f*Pic(B), the class of O, the fibre components disjoint from O and the section classes", the B=P¹ specialization, and the E×B negative control with the order-two class of O_B((0,0)−∞). I recomputed that control: constant sections restrict to O_B or 0 on O≅B, a fibre restricts to O_B(b₀) of degree one, so the proposed generators restrict into ℤ·O_B(b₀), which contains no nonzero degree-zero class, while f*L restricts to L of order two.
- Previous R03 (competing owner in K3SurfacesAndSymplecticBoundedness): partly repaired. §4.7 is now the general statement for a proper flat regular surface over a regular one-dimensional base with no genus assumption, and §4.8 is stated over an arbitrary base. The K3 package at its open head still says, at its `README.md:795`, that its §6.0b "supplies the proper-base presentation for NeronModelsAndSemistableAbelianVarietiesPartII §2.1", although K3 is at position 287 of the merge order and this roadmap at 40. That direction can only be corrected in the K3 pull request; what remains here is R04 below.
- Previous R04 (six normal-form inputs): repaired by the new §5.14 (`README.md:9667`), which states N1–N6 with the field, configuration, equation, coefficient bounds, nonvanishing conditions and allowed changes, and by the restated §5.10 (C1)–(C6). Every discriminant identity in N1–N6 verifies by enumeration (table below). One step of N6 is false (R03 below).
- Previous R05 (local freeness of R¹f_*O): repaired. The StableReduction contract (`README.md:144–148`) now imports χ-constancy and says local freeness "is not part of this contract in general"; §3.3 obtains cohomological flatness from Raynaud's criterion and carries the wild double-fibre control with (h⁰,h¹)=(2,2); §4.1 keeps the torsion T and states deg L⁻¹=χ(O_S)+length(T).
- Previous R06 (own Lean names in the README): repaired. "Lean name" occurs 0 times; the gate's readme-ids check passes; the only own backticked names are the six declarations of `Suggested.lean`.
- Previous R07 (non-discriminating Checks in §2.60 and §4.1): repaired. §2.60's Checks (`README.md:8083–8104`) now compute U↦t², V↦t³, V/U↦t on the cusp, U↦t²+t+1 and V↦t(t²+t+1) on the nonsplit chart with the wrong automorphism t↦t+1 sending V to V+U, and u↦1/t, z↦1/(tq) at infinity; §4.1 has the three computed canonical-bundle values and the wild control.

## R01 (P1) — Targets §7.4 and §§7.5–7.6 need each other

**Location:** `README.md:9977`: "*Needs:* §4.14; §§7.1–7.2; §6.1; §§5.9–5.14; §§7.5–7.6 for uniqueness." and `README.md:10004`, `README.md:10026`: "the normal-form completeness argument of §7.4 for the class count".

**Claim:** §7.4 proves "equivalent ... to exactly one of the fourteen models"; §7.5 and §7.6 prove "exactly eleven" and "exactly three" classes.

**Witness:** The mechanical pass over the `*Needs:*` lines returns the cycle 7.4 → 7.5 → 7.4 (and 7.4 → 7.6 → 7.4). §7.4's "exactly one" consumes the separation proved in §§7.5–7.6; §§7.5–7.6's "exactly eleven/three" consume §7.4's completeness. As stated, neither target can be built first.

**Repair:** Split the statements along the two halves that are already separated in the prose. Make §7.4 the completeness statement only: every surface in the family is equivalent to at least one of the fourteen models, with `*Needs:*` §4.14, §§7.1–7.2, §6.1, §§5.9–5.14 and no reference to §§7.5–7.6. Make §§7.5–7.6 the separation statements only: the eleven (three) listed models are pairwise inequivalent, with `*Needs:*` §6.1 and §7.2. Add a final target §7.7 "classification" that combines §7.4 with §§7.5–7.6 to give "exactly one" and the class counts eleven and three. The same test instance (models 3, 4, 12 with j=t², separated by III* versus I₂* and by E₄/split I₂ versus E₂/nonsplit I₂) then lives in §7.5 and is consumed, not produced, by §7.7.

## R02 (P2) — Layer 5 needs Layer 7 and Layer 7 needs Layer 5

**Location:** `README.md:9723`: "*Needs:* §4.14; §5.10; §7.1; §7.2; EllipticCurves Layer 4." and `README.md:9739`: "The normal forms of §5.14 use the admissible changes of §§7.1–7.2, which depend only on Layer 4."

**Claim:** The layers are in build order ("How to read the build": Layer 5 before Layer 7).

**Witness:** §5.14 (Layer 5) needs §§7.1–7.2 (Layer 7); §7.4 (Layer 7) needs §5.14. The target graph is acyclic, but the layer graph has the edge Layer 5 → Layer 7 → Layer 5, so neither layer can be delivered before the other as the build is described.

**Repair:** Move §§7.1–7.2 to the end of Layer 4 (their own Dependencies say they depend only on Layer 4: §4.10 and §4.14 plus Mathlib's `Polynomial.degreeLTEquiv`), or move §5.14 into Layer 7 after §7.2. Then update the Layer 5 and Layer 7 Dependencies paragraphs. Nothing else changes: §5.14's six statements and their Checks keep their `*Needs:*` items.

## R03 (P2) — N6 excludes (e₀,d₀′)=(0,1) for a false reason

**Location:** `README.md:9695–9696` (§5.14, N6): "Only (e₀,d₀′)=(1,0) gives E₅ at t=1 (model 10), and only (e₀,d₀′)=(0,0) gives E₃ at t=1 (model 11)."

**Claim:** Within the normal form y²+t²y=x³+t³e₀x+t⁵d₀′, the fibre at t=1 alone selects model 11 for the configuration IV*+E₃+IV.

**Witness:** For (e₀,d₀′)=(0,1) the equation y²+t²y=x³+t⁵ has at t=1 the curve y²+y=x³+1 with affine solutions (1,0), (1,1) and one point at infinity, so count 3, which is E₃ by §2.22; it also has Δ=t⁸ and c₄=0. What excludes it is the fibre at ∞: the reversed coefficients are a₃′=s, a₆′=s, the reduction y²=x³ is singular at the origin, and s²∤a₆′, so Tate's algorithm gives type II with Δ′=s⁴. Its configuration is IV*+E₃+II, which is not in (C6), and its resolved count is at most 15+3+3=21<25, so it fails Picard constancy. The same false step is printed in the source (Theorem 10.5 proof, p. 32; see Source issues).

**Repair:** Replace the second clause by: among the two values with E₃ at t=1, namely (0,0) and (0,1), the fibre at ∞ is IV for (0,0) and the wild type II for (0,1) (a₆′=s, s²∤a₆′), so only (0,0) realizes IV*+E₃+IV. Add the negative-control Check: y²+t²y=x³+t⁵ has E₃ at t=1, Δ=t⁸, type II at ∞ and resolved count 21, hence is outside the family. Check N5 as well: the four values (e₀,d₀)∈{0,1}² give counts 5,1,3,3 at t=1, so N5's "only e₀=d₀=0 gives E₅" is correct and needs no change.

## R04 (P3) — State the ownership of the general genus-one surface theory in Scope

**Location:** `README.md:11–30` (Scope and ownership).

**Claim:** The scope paragraph lists the owned objects; the general genus-one fibration carrier (§2.1), the fibre classification (§§2.3, 2.5), the canonical formula (§4.1), the general Picard restriction (§4.7) and the regular Jacobian (§4.17) are not named as owned.

**Witness:** `K3SurfacesAndSymplecticBoundedness/README.md:795` at its open head (merge position 287) claims to supply this roadmap's §2.1 from its §6.0b; this roadmap is at position 40 and cannot consume it. The previous review's R03 asked for one owner; the construction now lives here, but the Scope paragraph does not say so.

**Repair:** Add one sentence to Scope: this roadmap owns the genus-one fibration carrier over a smooth proper curve base (§2.1), the geometric fibre classification (§§2.3, 2.5), the canonical bundle formula (§§4.1–4.2), the general-base Picard restriction and Shioda–Tate generation (§§4.7–4.8) and the regular minimal Jacobian (§4.17), and later roadmaps import them. The reverse claim must be removed in the K3 pull request; that is outside this folder.

## R05 (P3) — Constructions with one Check, and Checks that restate the definition

**Location:** `README.md:490` (§1.4), `README.md:575` (§1.8), `README.md:3994` (§2.7), `README.md:4014` (§2.8), `README.md:4472` (§2.25), `README.md:5569` (§2.37), `README.md:8583` (§3.7), `README.md:8643` (§3.10), `README.md:8916` (§4.5), `README.md:9124` (§4.12), `README.md:9172` (§4.14): each "Construct …" target has exactly one Check. Also `README.md:6874–6876` (§2.47): "Index false of the two-member open cover is the finite chart" and `README.md:9402–9403` (§5.2): "For the expression 1+10q+q², q=2 gives 25 … q=3 gives 40".

**Claim:** Every definition has at least three discriminating Checks; a Check says what a wrong definition would get wrong.

**Witness:** §2.25 constructs Eᵢ(F₂)≃ℤ/i with the single Check "orders 2,3,5 and especially 4 use actual point addition"; §4.5 constructs the rank-ten lattice with the single Check "diag(1,−1,…,−1)"; §2.47's first two Checks repeat the definition of the cover. Computed alternatives exist: for §2.25, 2·(1,0)=(0,0) on E₄ (slope 0, since 3·1+1=0 in F₂) and 2·(0,0)=∞, so (1,0) has order four and the group is not (ℤ/2)²; on E₅, (0,0),(1,1),(1,0),(0,1),∞ is the cycle of one generator. For §4.5, O²=−1 witnesses oddness, and the fibre–section plane has determinant −1 while W has determinant ±1 and rank 8. For §2.7, the count over 𝔽₄ is 4=Q, not Q+2, because the node splits.

**Repair:** Give each listed construction at least three Checks of the computed kind above (a value, a degenerate case, a non-example), and replace the definitional bullets of §2.47 and the arithmetic of §5.2 by discriminating ones (for §5.2: the ruled surface of rank two with count 9 at q=2, already present, and a rank-ten surface whose Frobenius has one eigenvalue −1, count 21).

## R06 (P3) — Section numbering does not follow the build order

**Location:** `*Needs:*` lines at `README.md:469` (§1.3 needs §1.21), `README.md:557` (§1.7 needs §1.12), `README.md:989` (§1.14 needs §§1.35, 1.37), `README.md:1050` (§1.15 needs §§1.24–1.25), `README.md:1611` (§1.19 needs §1.34), `README.md:3996` and `README.md:4016` (§§2.7–2.8 need §§2.28–2.30), `README.md:4843` (§2.28 needs §§2.39–2.62), `README.md:4210`–`4282` (§§2.17–2.21 need §§2.23, 2.25), `README.md:4308` (§2.22 needs §2.24).

**Claim:** "§ k.n" subsections are "in build order" (shape rule 6).

**Witness:** 43 `*Needs:*` references point to a later section of the same layer; the graph is acyclic (R01 and R02 are the only cycles), so this is a numbering defect, not a dependency defect. Layer 1 already states its true order in its Dependencies paragraph; Layer 2 does not, and §2.28 (one-component cohomology) cannot be built before the twenty chart sections §§2.39–2.62 it lists.

**Repair:** Either renumber each layer so that every `*Needs:*` reference points backwards, or add to each Layer's Dependencies paragraph the explicit build order as Layer 1 does, and trim `*Needs:*` lines to what the statement and its route use (§2.28's list of twenty chart sections is the route of §2.62, not of the cohomology computation).

## R07 (P3) — Third-party copy linked for Lang (1956)

**Location:** `README.md:4164`: "([Lang (1956)](https://wstein.org/papers/bib/Lang-Algebraic_Groups_Over_Finite_Fields.pdf), Theorem 1 …".

**Claim:** Sources are read from legal places; the References entry (`README.md:10094`) cites JSTOR for this paper.

**Witness:** The §2.15 link is a scan on a third party's personal site, not the publisher, an open repository, the author's page or an institutional repository.

**Repair:** Cite Lang (1956) in §2.15 by its locator and the JSTOR record, as the References section already does, and drop the third-party link.

## Verified sound

**Gate and build.** The worker's gate at cc6f0ae passes every check (`gate.md`). I elaborated `Suggested.lean` with `lake env lean` from the worktree: exit 0, five `sorry` warnings and nothing else. Its three `TauCeti.*` imports have object files at the pin. The diff outside the roadmap folder against `origin/main` is empty.

**Dependency check.** Output of the depcheck command from the brief:

```text
depcheck: 201 roadmaps, 1317 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every supplier cited is on main or earlier in the merge order: NeronModelsAndSemistableAbelianVarieties (37), AlgebraicModuliForArithmeticGeometry (22), ComplexComparisonPartII (29), InverseGaloisAndArithmeticFundamentalGroups (34); StableReduction, JacobianChallenge, SchemeAndStackFoundations, ReductiveGroupsPartII, EtaleCohomologyFoundations, ModularCurves, EllipticCurves, IntegralLattices, ZigzagPreprojective and AlgebraicCurves on main. K3SurfacesAndSymplecticBoundedness (287) is not cited.

**Cross-roadmap citations resolved** (file and line in the cited roadmap on main or at its open head): SchemeAndStackFoundations §0.9 (848), §0.14 (1068), §0.27 (1718), §0.28 (1765), §1.3 (2105), §2.16 (3896), §3.4 (4789), §3.6 (4905), §5.9 (7129), §5.10 (7175); ReductiveGroupsPartII §RG2.3.7 with the prose *lang-theorem* (5201–5203) and the affine carrier `FiniteTypeCommHopfAlgCat`; EtaleCohomologyFoundations §F.0.3 (231), §§F.2.1–F.2.7 (504–759), §F.3 (676), §F.10.2b (1108), §F.10.5 (1411), §0.9 (1120); InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 (table at 336–339); ComplexComparisonPartII §§C3.2d.2–C3.2d.4 (1960, 1978, 1996); AlgebraicModuliForArithmeticGeometry §1.1 (306), §3.5 with `polarizedDescentComparison` and `finiteQuotientComparison` (1811), §7.3 with `RaynaudNStar` and `raynaud_degree_one_cohomologicallyFlat` (9312, 9426, 9448); NeronModelsAndSemistableAbelianVarieties §2.7 (1234), §2.8 (1270), §3.8 (1648), §3.9 (1694), and its line 216 naming Part II as the owner of Ferrand pinching; ModularCurves Layer 4D (1484); IntegralLattices 6C (1655), 6F (1676); EllipticCurves Layer 4 `ReductionSymbol` (793–819); AlgebraicCurves Layers 10 and 12 (918, 1085) with Stichtenoth 6.1.2 (929); StableReduction Layer 6 (509); ZigzagPreprojective Layer 0 (205).

**Library declarations opened at the pins** (file under the pinned Mathlib or Tau Ceti): `Algebra.TensorProduct.includeRight_injective`, `LinearEquiv.annihilator_eq`, `CommRingCat.isPushout_tensorProduct`, `IsSchemeTheoreticallyDominant.of_isPullback`, `AlgEquiv.mapIntegralClosure`, `IsLocalization.uniqueOfZeroMem`, `Scheme.IdealSheafData.ext_of_iSup_eq_top`, `Module.Flat.lTensor_exact`, `Algebra.TensorProduct.commRight_tmul`, `IsBasis.isOpenCover_mem_and_le`, `IdealSheafData.ofIdeals_ideal`, `subschemeMap`, `comapIso`, `TensorProduct.AlgebraTensorModule.tensorQuotientEquiv`, `Submodule.baseChange_span`, `Submodule.quotEquivOfEq` all exist. `TauCeti.AffineDynkinType` with `Valid`, `cartanMatrix`, `marks` (`AffineDynkinType/Basic.lean`), `Scheme.genus` (`Cohomology/Genus.lean`), `WeierstrassCurve.projModel`, `projModelOver` (`EllipticCurve/Scheme/ProjModel.lean`) elaborate in the headline signatures.

**Lean form, signatures and padding.** On a scratch copy I added `#check @name` for all six declarations and replaced each `sorry` by `first | rfl | (simp; done) | infer_instance | sorry`. The elaborated types keep every binder: `[Field k] [Finite k]`, `[Smooth] [IsProper] [GeometricallyConnected]`, the explicit `FiniteDimensional` instance for H¹, `topologicalKrullDim X = 1`, `X.genus k = 1`, the primitive positive null vector, and `∀ x, IsRegularLocalRing (stalk x)`; nothing disappeared. None of the five theorems closed by `rfl`, `simp` or `infer_instance` (each fell through to `sorry`). No `set_option`, no sorry'd data, no `lemma`, single `import Mathlib` plus three existing `TauCeti.*` modules. The five headlines statable at the pins (§1.5, §2.5's matrix classification, §2.15, §2.22, §4.16) are present and match the README's generality; the docstring names the unstatable ones and the missing carriers. No Lean padding finding.

**Ownership.** `roadmaps grep` for Ferrand pushout, Ferrand pinch and finite pinching over the open pull requests and main returns only this roadmap and the base roadmap's pointer to it. No other open pull request builds the conductor reconstruction, the quadratic pinching chart, the multiple-fibre LLR comparison or the fourteen-model classification. The K3 overlap is R04.

**Seeded source sample: 15/15 read at legal texts** (source keys are the fetched line-numbered texts; Schröer is arXiv v3 with its printed pagination).

| Target | Locator read | Result |
| --- | --- | --- |
| 1.9 | temkin-tyomkin lines 625–637 (Lemma 5.1.2, p. 14), 704–716 (Theorem 5.3.1(ii), pp. 15–16), 777–800 (Theorem 6.2.1, p. 17), 824–832 (Theorem 6.3.2, p. 18) | All present with the stated content; 5.3.1(ii) is the finite case, 6.2.1(i) the étale-affine-cover effectivity criterion, 6.3.2(i) the flat-object equivalence; no Noetherian hypothesis in any of them |
| 1.35 | stacks-00DF lines 1141–1147 (Lemma 10.12.10) | Right exactness of tensor product, as cited |
| 2.3 | schroer lines 411–450 (§3, pp. 9–10) | The R=k×k, k[ε], field cases and the I₂/III, Ĩ₂ discussion are there |
| 2.6 | schroer lines 440–449 (p. 10) | The length-two conductor algebra and the perfect-field remark are printed |
| 2.32 | schroer lines 451–479 (Props 3.1–3.2, pp. 10–11) | The adapter is a derived refinement, as the README says; the propositions are at the cited pages |
| 2.36 | ferrand lines 752–791 (Théorème 5.1, printed p. 568) | The first proof paragraph is the principal-localization argument A_t ≅ A′_{h(t)} for t in the conductor, as cited |
| 2.39 | schroer lines 440–473 (pp. 10–11) | One-component conductor diagram and the count table are printed |
| 2.47, 2.49, 2.51, 2.60 | schroer lines 440–450 (p. 10) | The conductor square before Proposition 3.1 is printed; the chart constructions are derived refinements, labelled as such |
| 4.8 | schroer lines 1124–1138 (Prop 9.3(v) proof, p. 25), 1170–1172 (after Theorem 9.4, p. 26) | Generation by a fibre, the vertical curves disjoint from O and the sections, for B=P¹; the Tsen step over F₂(t) is the known source error |
| 4.18 | schroer lines 1126–1128 (p. 25) | The Br(F)=0 invocation is at the cited place; the README confines it to algebraically closed constants |
| 5.6 | schroer lines 1178–1190 (Prop 9.5, pp. 26–27) | III*, II* settled by "at most one further terminal vertex", as restated with multiplicities (1,1,2), (1,2,3) |
| 6.16 | schroer lines 1318–1320 (Theorem 10.4, p. 29) | The extra I₁ over the F₄-point for j=t²/(t²+t+1); the README adds model 14 |

Other locators read this round: witaszek line 622 (Definition 2.17, printed p. 669), line 869 (Lemma 2.28, printed p. 675); llr lines 1142 (Theorem 3.8, printed p. 481), 1448 ((21), p. 488), 1644 (Theorem 5.9, p. 493), 1753 (Corollary 6.5, p. 496), 1766 (Theorem 6.6, p. 496); ferrand line 1114 (Théorème 7.1, printed p. 575); stacks-0C5X lines 115–120 (Lemma 55.2.3 as cited in §2.5); stacks-0C5R lines 2335, 2390 and 473 (Lemmas 54.17.1, 54.17.2, 54.4.3 as cited in §4.0); schroer lines 1236–1254 (§10 assumptions (i)–(v), p. 28: the README's family definition matches (i) and (ii)), 1258–1304 (Props 10.1–10.3), 1306–1395 (Theorem 10.4 and proof), 1397–1446 (Theorem 10.5 and proof), 487–494 (Prop 3.3 table: the five equations agree with `F2Model` after reordering by count).

**Computed adversarial pass.** Rows cover the sampled targets, the five headlines, every target a finding touches, and the sections read in full this round. Each row records values computed on both sides.

| Target | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 1.1 geometric pushout | cusp; identity g; the two-points-without-common-affine example | Pullback of k[t]→k[t]/t² and k gives k[t²,t³]; g iso gives P=Y; k[t²,t⁵] misses t³ so is not the pushout | Pass |
| 1.4 / 1.5 headline `ferrand_scheme_pushout_exists` | Z=∅; Z two points of P¹ | Z=∅: ⊥ is an affine open, P=Y⊔Z′, a open-closed finite, b closed, Z=Y×_P Z′=∅; two points lie in P¹∖{third point} | Pass |
| 1.6 | C→B with F=C[ε] | (B×_C A′)⊗F = C[ε] on both sides; nonflat F=C/(t²) kills [t³] | Pass |
| 1.7 | A⊂B finite reduced, b≡a mod I | b−a∈I⊂A so b∈A; cartesian without reducedness, as stated | Pass |
| 1.9 | affine datum; Z=Spec(k×k)→Spec k cover Check | P=Spec of the ring pullback; the pullback of the identity cover is the disjoint union of the two components | Pass |
| 1.35 | ℤ/4→ℤ/2 with B=(ℤ/4)² | [(2,0)]≠0 in B/span{(1,1)}; 1⊗[(2,0)] ↦ 0 after tensoring with ℤ/2 | Pass |
| 1.37 | same, F=ℤ/4 identity | extended and recomputed conductors both 0; includeRight(2)≠0; ring-level only, precedes §1.14 | Pass |
| 1.42 | cusp, F=C[ε]; nonflat C/(t²) | chart conductor I+εI, εt²∈, εt∉; [t³]≠0 in C/t²C maps to 0 in k[t]/t² | Pass |
| 2.1 | E×P¹; E×A¹ | (h⁰,h¹)=(1,1) both; E×A¹ excluded by the proper base of §2.1 (ownership R04) | Pass |
| 2.2 | I₀*; double smooth fibre | gcd 1 with central coefficient 2 so D_ind≠D_red; m=2 with D_ind=D_red | Pass |
| 2.3 | I₂ vs III; I₃ vs IV | same affine A₁ (resp. A₂) matrix; incidence two nodes vs length-two tangency, three nodes vs one triple point | Pass |
| 2.5 headline matrix classification | [[−2,2],[2,−2]]·(1,1); A₂ triangle; D₄ star; [−2] | kills (1,1); kills (1,1,1); kills (2,1,1,1,1); [−2]·m≠0 for m>0 so excluded by hnull | Pass |
| 2.6 | one component | length-two algebras k×k, k[ε], separable or inseparable quadratic; p_a=δ=1 | Pass |
| 2.7 / 2.11 | q=t²+t+1 over F₂, F₄ | 3+1=4 and 5−2+1=4 | Pass |
| 2.8 / 2.12 | two components | 2·3−0=6 over F₂; 2·5−2=8 over F₄ | Pass |
| 2.10 | split I_r | r(q+1)−r=rq; r=1: q+1−2+1=q | Pass |
| 2.13 | II, III, IV, stars | q+1; 2(q+1)−1; 3(q+1)−2; r(q+1)−(r−1)=rq+1 | Pass |
| 2.14 | q=2 vs q=3 | four attachment points need 4≤q+1; fails only at q=2 | Pass |
| 2.15 headline | constant ℤ/2 (disconnected) | Frob−1 has image {0}, so connectedness is used; elliptic case gives a point | Pass |
| 2.22 headline / 2.23 | all 32 binary tuples | Δ=a₃ if a₁=0, Δ=a₆+a₄+a₃(a₄+a₂) if a₁=1 (recomputed from b₂,b₄,b₆,b₈ mod 2); 8+8=16 smooth tuples; `F2Model` counts 1,2,3,4,5 recomputed; variable-change formulas with u=1 recomputed from Mathlib's action, inverse (r,s,t+rs) | Pass |
| 2.25 | E₄ | 2(1,0)=(0,0) (slope 0), 2(0,0)=∞, order four | Pass; R05 for Checks |
| 2.26 | q=0; q=1 | A_0=k; A_1=k[t]; q=t²: basis 1, t², t³, t⁴, … with no degree-one vector | Pass |
| 2.32 | q=t², P=1+T, Q=1 | P(q)+tQ(q)=1+t²+t; degrees 2·deg P even vs 2·deg Q+1 odd, so the pair is unique | Pass |
| 2.36 / 2.37 | q=0; q=t² | localization at 0 is the zero ring on both sides; t=V/U=t³/t² | Pass |
| 2.39 | cusp | [t]↦ nonzero residue, [1],[q]↦0, both quotients dimension one | Pass |
| 2.47 | overlap at t=2 over ℚ | coefficient 3↦3 on F, I and the overlap; zero map fails 1↦1 | Pass |
| 2.49 | cusp q=t² | Q∞=1≠0; L=k[t,1/t³] domain; UV=t⁵≠0; C integral | Pass |
| 2.51 | cusp | D(q)=D(t) nonempty open, t=V/U there; the closed origin is not dense | Pass |
| 2.60 | cusp; nonsplit over F₂ | U↦t², V↦t³, V/U↦t; t↦t+1 fixes U, sends V to V+U | Pass |
| 3.3 | wild involution (P,s)↦(P+τ,s/(1+s)) | s/(1+s)/(1+s/(1+s))=s and t=s²/(1+s) invariant in char 2; s/(1+s)≡s mod s²; (h⁰,h¹)=(2,2) with χ=0 | Pass |
| 3.4 / 3.5 | C→E of degree d; constant field k′ | norm∘pullback=[d]≠0 on Pic⁰; 1=h¹(C̃)+δ−([k′:k]−1) with h¹(C̃)≥[k′:k] forces δ=0 | Pass |
| 3.11 | I₂* vs IV*; ℂ[t]_(t−1) Check | component groups (ℤ/2)² and ℤ/3, seven components each; the twist by s²=t has period 2 over ℂ(t) and period 1 over the henselization | Pass |
| 4.0 | P², one blowup | rank 1→2, K² 9→8, rank+K²=10; Stacks 54.17.1, 54.17.2, 54.4.3 as cited | Pass |
| 4.1 / 4.2 | E×P¹, rational, K3 | χ=0,1,2 give deg L=0,−1,−2 and canonical base degrees −2,−1,0 | Pass |
| 4.7 / 4.8 | E×B with L∈Pic⁰(B)[2] | generators restrict into ℤ·O_B(b₀); f*L restricts to L of order 2 | Pass |
| 4.9 | v_P=(P−O)−(1+P·O)F | v_P·F=0, v_P·O=0, v_P²=−2−2P·O (using O²=−1), even | Pass |
| 4.11 | n=0,1,2,3 | h⁰=1,1,2,3 and h¹=1,0,0,0 on a genus-one fibre | Pass |
| 4.16 headline | perfect k; p=5 | perfect k makes the hypotheses contradictory, conclusion vacuous-true; (5−1)/2=2 does not divide 1 | Pass |
| 5.0 | rational point; degree-two point blowup | +q to the count; eigenvalues q,−q, trace 0 over 𝔽_q and 2q² over 𝔽_{q²} | Pass |
| 5.2 | q=2; one eigenvalue −1 | 1+10q+q²=25; trace 8 gives 1+16+4=21 | Pass |
| 5.4 / 5.5 | A₂, E₆; D_{m+4} | det 3 cannot be a unimodular summand; ω₁²=−1 odd, ω₁∈W by unimodularity contradicts evenness; m+4≤8 | Pass |
| 5.6 | Ẽ₇, Ẽ₈ | terminal multiplicities (1,1,2), (1,2,3); marking the multiplicity-one terminal kills the Ẽ₇ swap | Pass |
| 5.9 / 5.13 | bounds | 10+7+7=24<25; 25=5+2m+2n with m∈{6,8}, n≤2 forces (8,2) | Pass |
| 5.10 (C4)/(C5) | n_c | split 2r_c, nonsplit 2r_c+2 agree with Schröer's table (q=2: Ĩ₁ 4, Ĩ₂ 6) | Pass |
| 5.12 | a₁ constant | s·a₁(1/s)=s vanishes once at ∞; c₄=a₁⁴ | Pass |
| 5.14 N1 | c₁ deg≤1, c₄ deg≤4 | Δ=t⁴(1+t³+t³c₁+t⁴c₄) for all 64 pairs; Δ=t⁴ iff (c₁,c₄)=(1,0) or (1+t,1); counts at t=1: 4 and 2 | Pass |
| 5.14 N2 | d₁ deg≤1, c₂ deg≤2 | Δ=t⁸(1+t+td₁+t²c₂+t³+t⁴) for all 32 pairs; Δ=t⁸ iff (c₂,d₁)=(t+t²,1) or (1+t+t²,1+t); at ∞ the first reduces to y²+xy=x³ after y↦y+1 (split), the second to y²+xy=x³+x² (T²+T+1 irreducible, nonsplit) | Pass |
| 5.14 N3 | d₁∈{0,1,t,1+t} | Δ=t¹² in all four cases; counts at t=1: 4,2,2,4; t↦t/(1+t) with u=1/(1+t) sends (t,t,0,t⁴,0) to (t,t(1+t),0,t⁴,0) | Pass |
| 5.14 N4 | d₀, f₁ | Δ=t¹⁰(1+tf₁) for all 8 pairs; f₁=1+t gives t¹⁰(t²+t+1); d₀=1 gives count 2 at t=1 | Pass |
| 5.14 N5 | (e₀,d₀)∈{0,1}² | Δ=t⁸c₁⁴ for all 128 tuples; counts at t=1: 5,1,3,3; only (0,0) gives E₅ | Pass |
| 5.14 N6 | (e₀,d₀′)∈{0,1}² | Δ=t⁸c₁⁴ for all 64 tuples; counts at t=1: 3,3,5,1; (0,1) also gives E₃; its fibre at ∞ is type II (a₆′=s), Δ′=s⁴ | Fails as stated; R03 |
| 6.1 | all 14 models | Δ, c₄=a₁⁴, j, count at t=1 and Δ′ at ∞ recomputed (table below) | Pass |
| 6.16 / 6.17 | models 2, 14; 9–11 | t²+t+1 has no F₂ root, valuation 1, c₄ unit; Δ′=s⁴ for 9–11 | Pass |
| 7.1 | x↦x+a₂ in char 2 | a₂′=0, a₃′=a₃+a₁a₂, a₄′=a₄+a₂², a₆′=a₆+a₂a₄ (expanded); (t,t,0,0,0)↦(t,0,t²,t²,0); (0,1,0,0,0)↦(0,0,0,1,0); 2+4+5+7=18 | Pass |
| 7.2 | parameter counts | 2²·2³·2⁴=512; PGL₂(F₂)=S₃ of order 6 | Pass |
| 7.4 / 7.5 / 7.6 | Needs graph | 7.4→7.5→7.4 and 7.4→7.6→7.4 | Cycle; R01 |
| 5.14 ↔ Layer 7 | layer graph | 5.14→7.1, 7.2; 7.4→5.14 | Coarse cycle; R02 |

Fourteen-model recomputation over F₂[t] (Δ from b₂²b₈+b₆²+b₂b₄b₆, c₄=a₁⁴, count at t=1 from the specialized equation, Δ′=s¹²Δ(1/s)):

| Model | Δ | j | count at t=1 | v_∞(Δ′) |
| --- | --- | --- | --- | --- |
| 1 | t⁸ | t⁴ | 4 | 4 |
| 2 | t¹⁰(t²+t+1) | t²/(t²+t+1) | 4 | 0 |
| 3 | t¹⁰ | t² | 4 | 2 |
| 4 | t¹⁰ | t² | 2 | 2 |
| 5 | t¹¹ | t | 4 | 1 |
| 6 | t¹¹ | t | 2 | 1 |
| 7 | t¹² | 1 | 2 | 0 |
| 8 | t⁴ | t⁸ | 4 | 8 |
| 9 | t⁸ | 0 | 5 | 4 |
| 10 | t⁸ | 0 | 5 | 4 |
| 11 | t⁸ | 0 | 3 | 4 |
| 12 | t¹⁰ | t² | 4 | 2 |
| 13 | t¹¹ | t | 4 | 1 |
| 14 | t⁸(t²+t+1) | t⁴/(t²+t+1) | 4 | 2 |

All fourteen agree with the §6.1 table (E₄, E₂, E₅, E₃ at t=1 as listed; I_n at ∞ with n=v_∞(Δ′) for the multiplicative cases; models 10 and 11 at ∞: b₈=s² gives III, b₆=s² gives IV). The resolved rational-fibre counts were not recomputed this round; the previous review's blowup computation of all fourteen stands.

**Shape.** The README has the required sections in order, prose targets with locators, `### Examples` and `### Dependencies` in every layer, Unicode mathematics, no LaTeX delimiters, no process words, no pull-request numbers (gate scanners agree). Definitions with fewer than three Checks are R05.

## Not verifiable

- **Shioda (1990), §1 (new citation in §4.8):** the sources service found no legal copy (recorded in `needs-references.toml` under key `shioda`). The Néron–Severi form of Shioda–Tate over an arbitrary base is standard and the README derives the Picard form from §4.7; the locator itself was not read.
- **William E. Lang (2000):** paywalled (DOI 10.1080/00927870008827190); (C1)–(C6) of §5.10 are stated here as independent targets, so nothing is imported from the unread text.
- **Hartshorne, Chapter V, Prop. 3.2–3.3, "Theorem 3.4", Cor. 3.5 (§4.0):** paywalled; the mathematics was checked independently (table). The numbered item giving π_*O=O and Rⁱπ_*O=0 is, to my recollection, a Proposition, not a Theorem; the author should check the printed label.
- **Kac, Chapter 4 (§2.5):** no open text; the affine matrices and marks were checked against the pinned `AffineDynkinType` file instead.
- **Lang (1956):** the JSTOR record is the legal locator; the §2.15 link is R07. The content was checked through ReductiveGroupsPartII's prose target.
- **Milne LEC §16, Theorem 23.2, Lemma 33.2 (§5.0); Cossec–Dolgachev–Liedtke 2024 (§§4.11, 4.16); Bombieri–Mumford (§4.1); Raynaud 1970 (§3.3); EGA IV₄ 18.5.11 (§3.1); Liedtke (§6.1); Szydlo:** author or open copies exist but were not re-read this round; the statements attributed to them were checked by computation (table) and the previous review read Raynaud and Bombieri–Mumford. Temkin–Tyomkin cite EGA IV 18.8.10 where §3.1 cites 18.5.11(c); both are henselian decomposition statements, and the printed locator was not compared.

## Source issues

- **Error** in schroer at Theorem 10.5 proof, printed p. 32: the source says only e₀=d₀′=0 in y²+t²y=x³+t³e₀x+t⁵d₀′ yields the fibre E₃ at t=1; it should say (0,1) also gives E₃ there and is excluded by its wild type-II fibre at infinity; affects the proof.
- **Error** in schroer at Proposition 9.3(v) proof, printed p. 25: the source says Tsen gives Br(F)=0 for F=F₂(t); it should restrict to algebraically closed constants or use the section; affects the proof (already corrected by §§4.8, 4.18).
- **Gap** in schroer at Theorem 10.4 proof, printed p. 31: the source says the twisted semistable case is "similar" and lists two configurations; it should list the five of (C5), three of which give models 12–14; affects a stated result (already completed by §§5.10, 6.1).
- **Misprint** in schroer at Theorem 10.4 proof, printed p. 30: the source says r_a≥3 for r_a=7; it should be r_c≥3; affects the proof.
