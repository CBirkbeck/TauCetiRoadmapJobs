<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1338#issuecomment-6392629932 -->
Review (claude) of b61ddc0

Verdict: needs changes

1. **F01** (P1) Gap ILLUSIE-2003 has no supplier; the §5.5 route only cites its own target

   Location: `packages/EtaleDualityAndPerverseSheavesPartII/README.md` line 878; `design/plan.json` gap `EtaleDualityAndPerverseSheavesPartII/gap/ILLUSIE-2003` (no `supplier` key). Quote (line 878): "Use the trait affine Lefschetz theorem of Ill03, Théorème 2.4, in the form explicitly recalled by ILO XV 1.1.3."

   Claim: §5.5 is proved. Its proof route takes the trait affine Lefschetz theorem itself from Ill03, a source cited by locator only (uncertified, not read). The route is therefore circular, and the gap that records this has no owner.

   Witness: ILO14 line 10337 (XV Remarque 1.1.3) and ILO14 lines 10557–10560 (XV 3.3.2) only cite Gabber's trait theorem; they do not prove it. The plan's gap names no supplier. By the brief, a gap with supplier `none` is P1.

   Repair: either (a) write the §5.5 route from inputs that are owned or supplied: semistable alteration over the trait (SchemeAndStackFoundations §4.20), absolute purity on the regular model (LefschetzPencilsAndVanishingCycles §0.10), proper cohomological descent (SchemeAndStackFoundations §2.16) and the nearby-cycle stalk formula (LefschetzPencilsAndVanishingCycles §§0.2–0.5), each with a locator into a readable source, and then delete the gap; or (b) give the gap a named earlier supplier with a one-sentence `needs`. LefschetzPencilsAndVanishingCycles is the natural owner: its §6.2 already cites Illusie 2003 for Gabber's perversity of vanishing cycles.

2. **F02** (P1) Gap EPP-1973 has no supplier; §1.3's route is the statement of Epp's theorem

   Location: README lines 358 and 368; `design/plan.json` gap `EtaleDualityAndPerverseSheavesPartII/gap/EPP-1973` (no supplier). Quote (line 358): "A proof route uses the elimination theorem in Epp73, Theorem 1.9, in the complete-trait form recorded in ILO IV §3".

   Claim: §1.3 (owned here) has a proof route.

   Witness: the route invokes Epp73 Theorem 1.9, the target (ILO14 line 2524 only recalls it); only K10 lines 84–89 were read. The plan calls Epp73 freely available from GDZ; `sources.toml` records it as paywalled.

   Repair: describe Epp's route at the level that ILO IV §3 (sorites, ILO14 lines 2539 onwards) and K10 support, and delete the supplier-none gap; or name an owner. The manifest entry for Epp73 is settled as uncertified, and only a human can reopen it given the GDZ remark.

3. **F03** (P1) Gap NONABELIAN-ORIENTED-LIMIT has no supplier; §3.5 states a conditional companion that depends on it

   Location: README line 23 ("its non-abelian companion is a conditional statement with the continuity assumption specified there") and line 702 (the companion paragraph). `design/plan.json` gap `.../NONABELIAN-ORIENTED-LIMIT` lists the abelian targets 3.4–3.6 under `neededBy`, although its own text says that no abelian consumer uses it.

   Claim: the roadmap states non-abelian oriented descent under an assumed continuity theorem.

   Witness: ILO14 lines 9013–9017 (XII 1.3.4) and ILO-final-XII line 209 (XII-A 1.4) both say that the needed limit passage has no published justification. No roadmap owns it. The hypothesis of the companion is an unowned theorem.

   Repair: delete the non-abelian paragraph at line 702 and the clause on line 23, state in Conventions that Layer 3 treats torsion abelian coefficients only, and remove the gap (or clear its `neededBy`). This is the alternative that the gap text itself offers.

4. **F04** (P2) Gabber's cohomological-dimension bound (§5.8) is statable at the pins but absent; the docstring says otherwise

   Location: `Suggested.lean` lines 22–24. Quote: "Affine Lefschetz, including the trait theorem, and the cohomological-dimension bound need scheme support dimensions and torsion étale cohomological dimension". README lines 920–936 (§5.8, a headline named in the Summary).

   Claim: the cd bound is not statable.

   Witness: §5.8 needs neither quasi-excellence nor support dimensions. Using the pinned `HenselianLocalRing`, `Scheme.smallEtaleTopology` (with its `HasSheafify` instance) and `Sheaf.H`, the declaration below, appended to a copy of the file, elaborates with only the `sorry` warning.

   Repair: add this theorem under `/-! ## Layer 5: ... -/`, name it in README §5.8, and remove the cd bound from the docstring's list of non-statable headlines (affine Lefschetz stays there, since quasi-excellence is not in Mathlib):

   ```lean
   theorem cohomologicalDimension_le_of_strictlyLocal
       (A : Type u) [CommRing A] [IsNoetherianRing A] [HenselianLocalRing A]
       [IsSepClosed (IsLocalRing.ResidueField A)]
       (d : ℕ) (hd : 0 < d) (hdim : ringKrullDim A = d)
       (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : IsUnit (ℓ : A))
       (U : (AlgebraicGeometry.Spec (CommRingCat.of A)).Opens)
       (F : CategoryTheory.Sheaf U.toScheme.smallEtaleTopology AddCommGrpCat.{u})
       (htors : ∀ (V : U.toScheme.Etale) (s : F.obj.obj (Opposite.op V)),
         ∃ k : ℕ, ℓ ^ k • s = 0)
       (q : ℕ) (hq : 2 * d ≤ q) :
       Subsingleton (F.H q) := by
     sorry
   ```

   This is ILO XVIII-A 1.1 (ILO14 lines 16193–16199): cd_ℓ(U) ≤ 2d − 1, with cd_ℓ defined over ℓ-torsion sheaves. Tested: A = k⟦x⟧ with k separably closed and d = 1 satisfies the hypotheses, so the statement is not vacuous.

5. **F05** (P2) Gap general-base-open-duality is outside its supplier's scope and is formal from supplied operations

   Location: README line 106. Quote: "What EtaleDualityAndPerverseSheaves must provide (gap:general-base-open-duality): For an open immersion j of noetherian schemes … without assuming a field base or a duality theorem." See also line 1150.

   Claim: EtaleDualityAndPerverseSheaves §0.2 must supply the exchange RHom_X(j_!F,K) ≅ Rj_*RHom_U(F,j^*K) on general noetherian schemes.

   Witness: EtaleDualityAndPerverseSheaves (at its head) is scoped to separated finite-type schemes over a field. The exchange follows by Yoneda from j_! ⊣ j^* and the tensor compatibility of j_! (EtaleCohomologyFoundations §0.7) with EnhancedDerivedSheaves §§0.3–0.4 tensor–Hom.

   Repair: drop this contract. State the exchange as a short lemma in §6.8 with *Needs:* EtaleCohomologyFoundations §0.7 and EnhancedDerivedSheaves §§0.3–0.4. If a missing ingredient remains, assign it to EtaleCohomologyFoundations §0.7, which treats open immersions of arbitrary schemes.

6. **F06** (P2) Gap general-base-exceptional-pullback asks for what EtaleCohomologyFoundations F.5–F.6 and §0.7 already state

   Location: README lines 98–100. Quote: "provide exceptional inverse image as the right adjoint of derived proper-support pushforward, with composition, the closed-support identification and smooth purity, independently of the existence of a dualizing complex on the base."

   Claim: these items are missing from the supplier.

   Witness: EtaleCohomologyFoundations F.5 (main, line 1181) builds f^! as the right adjoint of Rf_! on the F.2.4 domain (line 594: separated finite type, noetherian, invertible torsion, with composition). F.6 gives smooth purity; §0.7 constructs i^! for closed immersions.

   Repair: cite F.5 (with F.2.4), F.6 and §0.7 directly. Keep a gap only for an ingredient that is shown to be missing (for instance, if smooth purity over non-field bases is not covered by F.6), and state that ingredient alone.

7. **F07** (P2) False Check in §0.4: normalisation of a DVR in a finite extension need not be an alteration covering

   Location: README line 250. Quote: "For X the spectrum of a DVR, the normalisation of X in a finite extension of its fraction field is an alteration covering".

   Claim: true for every DVR and every finite extension.

   Witness: SchemeAndStackFoundations §0.22 `nonJapaneseDVR` (main, README line 1464; Stacks 00PB) is a DVR whose normalisation in a finite inseparable extension is not finite. That normalisation is then not of finite type, so it is not an object of alt/X.

   Repair: restrict the Check to finite separable extensions, where the integral closure of a noetherian normal domain is finite, or to Japanese (for example excellent) DVRs. Retested on the counterexample: a separable extension is excluded from that construction, and the restricted Check holds.

8. **F08** (P3) Duplicated, malformed and misplaced Checks

   Location and repair, item by item:
   - Duplicate Checks to delete. In each pair the second line repeats the first: 168/176, 172/178 (§0.1); 206+208/216 (§0.2); 430/440, 432/438 (§1.5); 608/616 (§3.1); 808/818, 812/820 (§5.1); 976/984, 978/986 (§6.1); 1038/1046, 1040/1048 (§6.3); 1092/1100, 1094/1102 (§6.5); 1162/1172, 1168/1174 (§6.8); 1344+1346/1352, 1348/1354 (§8.1). After deletion every definition still has at least three distinct Checks.
   - §4.2 has two `**Checks.**` headings (lines 758 and 764). Merge them.
   - Line 280 (§0.6): "For X regular with Z an snc support, U(X) holds with the identity family". U(X) quantifies over every rare Z. Reword as "for regular X and an snc support Z, the identity family witnesses the instance (X, Z) of U".
   - Line 368 (§1.3) repeats the proof route after the Checks. Merge it into the route paragraph.

9. **F09** (P3) Locators and cross-references

   - Line 794: "This applies to strictly local quasi-excellent schemes by XIV 2.4.4". The universal catenarity of henselian local quasi-excellent schemes is ILO XIV Proposition 1.3.2 (ILO14 line 9860), not 2.4.4. Cite 1.3.2.
   - Line 996 (§6.2 route): "(§3.4)", "(§3.5)", "(§3.6.2)" and "(§3.6.3–3.6.4)" mean ILO XVII sections but read as this roadmap's §§3.4–3.6. Write "ILO XVII §3.4", and so on.
   - Line 1198: "a dualizing complex forces a global dimension function, Gabber 2004 Lemma 8.1". G04 §8 (G04 lines 441–451) assumes X finite-dimensional and dualizing in the sense of SGA 5 (finite quasi-injective dimension), which is narrower than the §6.8 notion. State those hypotheses, or cite the factorwise argument.

10. **F10** (P3) Downstream consumers overstates PurityForFlatCohomology's use

   Location: README line 1446. Quote: "PurityForFlatCohomology §§PF.1 and PF.4 use local Lefschetz (§7.3) and tilting with supports (§8.6)".

   Witness: the PurityForFlatCohomology design (board main) records only gap `EDP-PII-local-lefschetz` (CS24 Lemma 3.2.3) for PF.1 (its design README lines 104 and 2073). No use of §8.6 is recorded in PF.4.

   Repair: state that PF.1 consumes §7.3, and drop the PF.4/§8.6 claim unless that design cites it. Informational: the merge order lists PurityForFlatCohomology (line 67) above this roadmap (line 122). Its gap supplier is therefore later than it is, which is the intake's matter, not a defect of this package.

11. **F11** (P3) Build order, labels and scope wording

   - §5.3(2) uses §5.4 (line 846, *Needs:* "§5.4"), a later section. Renumber so that regular base change comes before the regular-morphism transport rule, as "How to read the build" already says.
   - `Suggested.lean` line 46 heads the section "Layer EQ.1"; the README calls it "Layer 1". Use the README label. `sources.toml` `cited_for` values use "EQ.x" stage keys (for example "EQ.2.1"), while the README numbers sections "§2.1". Align them.
   - Line 23: "Stack operations and ind-perverse Serre quotients have separate mathematical scope" and "Quasi-excellent ℓ-adic finiteness is outside the finite-coefficient theory developed here" exclude topics without naming an owner. Name the owning roadmap, or drop the sentences.

Eleven findings: three P1 (declared gaps with no supplier), four P2 (a statable headline missing from `Suggested.lean`, two gaps that ask for what earlier roadmaps already provide or that sit outside their supplier's scope, one false Check), four P3. The Lean file elaborates cleanly. Its five statements are faithful to ILO IV and V, and none of them is padding. The fifteen seeded locators are all supported by the sources.

## Verified sound

**Elaboration.** I ran `lake env lean` on `Suggested.lean` from the content checkout (Mathlib 6b7abb3c). The output was five `declaration uses sorry` warnings and nothing else. The one-tactic probe (`rfl | simp | infer_instance | trivial | decide`) closes none of the five theorems. A `#check @name` sweep of all eight declarations shows every binder in the declaration's own signature, with no section variables (only `universe u v`). Nothing was lost.

**Library declarations opened at the pin:** `Algebra.IsEtaleAt` is formal étaleness of the localization (Mathlib/RingTheory/Etale/Locus.lean:35). For the finite maps in `MixedCohenGabberPresentation` it is étaleness at q, so the README line 58 claim holds. Also opened: `IsRegularLocalRing` (Mathlib/RingTheory/RegularLocalRing/Defs.lean:51), `Module.IsTorsionFree` (Mathlib/Algebra/Module/Torsion/Free.lean:45), `MvPowerSeries.C` (Mathlib/RingTheory/MvPowerSeries/Basic.lean:334), `HenselianLocalRing` (Mathlib/RingTheory/Henselian.lean:108), `Scheme.smallEtaleTopology` (Mathlib/AlgebraicGeometry/Sites/Etale.lean:50) and its `HasSheafify` instance (Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean:112), `Sheaf.H` (Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56), Tau Ceti `Module.Baer.zmod_self` (TauCeti/Algebra/Module/ZMod/Injective.lean:50). `IsExcellent`, quasi-excellence and strict henselisation are absent from Mathlib, which confirms the docstring's other non-statability claims.

**Headline theorems** (from the Summary): Gabber finiteness §4.2; affine Lefschetz §§5.5–5.7; cd bound §5.8; existence, uniqueness, biduality and local duality §§6.6–6.12; local Lefschetz §7.3; algebraic tilting §§8.5–8.6. Among the deep inputs, Cohen–Gabber §§1.1/1.2/1.4 and partial algebraization §§1.6/1.7 are stated in Lean. Only §5.8 is statable but absent (R04). The others need constructibility, quasi-excellence, supports or perfectoid carriers, which are absent at the pins, as the docstring says. I considered whether `cohenGabber_equalCharacteristic` is padding next to `cohenGabber_equivariant` (trivial G). It is the source's separately numbered theorem (ILO IV 2.1.1) and carries the torsion-free conclusion that 2.2.2 does not state, so I do not count it as padding.

**Seeded sample (15 of 15 read at their locators; theorem number, page and hypotheses checked):**
- §0.1: ILO14 line 1221 (Def. 1.2.2, printed p. 24) ✓.
- §0.2: line 1374 (2.3.1–2.3.4, pp. 27–28) ✓. Flat base change needs only a locally noetherian source, line 1386 ✓.
- §0.5: lines 1887 and 1958 (Def. 4.2 p. 39; Thm 5.1 p. 41; Cor. 5.4 pp. 42–43) ✓.
- §1.4: lines 2677 and 2729 (IV 4.2.2 and 4.3.1, pp. 58–59) ✓. All three clauses of 4.3.1 are matched by the Lean structure. The compatibility of the H-action on V with the action on the residue field follows from `equivariant` and `residue_eq`.
- §1.7: line 2957 (V 3.1.1–3.1.4, p. 66) ✓. A′ is chosen before the ideals, line 2959. The regular base V^H⟦t_1,…,t_{d−2}⟧ comes from the proof, line 3016.
- §2.1: DJ97 line 139 (Thm 2.4, pp. 602–603) ✓; ILO-final-IX line 35 (geometrically irreducible, p. 161) ✓. ILO14 line 5903 (v1) says only irreducible; see Source issues.
- §2.2: line 3577 (VII 1.1, p. 81) ✓.
- §3.3: line 9020 (XII 2.1.1–2.1.2, p. 191) ✓. The restriction to finite type over S₀ repairs the source; see Source issues.
- §3.4: line 8936 (XII 1.2.1, p. 189; hypotheses at line 8910) ✓; ILO-final-XII line 209 ✓.
- §5.1: line 9864 (XIV 2.1.1–2.1.8, pp. 209–212) ✓. The 2.4.5 normalisation is at line 10182. Locator nit in R09.
- §5.2: line 9995 (2.2.1 p. 212; 2.3.1 p. 213; 2.3.3 at line 10085) ✓.
- §5.6: line 10333 (XV 1.1.2, p. 219) ✓.
- §6.7: line 13512 (XVII 4.1.1–4.1.3, p. 280) ✓.
- §7.1: CS24 line 1365 ((3.2.3.2), p. 33) ✓.
- §8.6: CS24 line 834 ((2.2.7.1), p. 21) ✓.

Further locators checked beyond the sample: II 4.2.1 and 4.3.1–4.3.3 (lines 1571–1631); III 5.4; IV 2.1.1, 2.2.2 and 3.1.2; V 2.1.1 and 2.1.2; XI 2.4 (line 8381, the direction f^*Rg_* → Rp_{1*}p_2^*, matching §3.2); XIV 2.5.2–2.5.4; XV 1.2.2–1.2.4 and 3.3.2; XVII 0.8–0.9 and 3.1.1; XVIII-A 1.1–1.4; XIX 2.2 (line 17123, the §4.1 negative control ✓); Exposé 0 Cor. 8 (line 396); SGA4half line 7774 (Th. finitude 1.9, p. 236 ✓); K10 lines 84–100 ✓; G04 lines 26–80 (strong and weak perversities, matching §6.5) ✓; CS24 (2.1.7.2) at line 516 ✓ and Lemma 2.2.4 at line 774 ✓.

**Dependency check** (`tauceti-roadmap gate --depcheck … --movable`): output `depcheck: 47 roadmaps, 520 edges, 0 problem(s)`. No UPWARD or CYCLE line.

**Cross-roadmap citations resolved.**
- Main: SchemeAndStackFoundations §§0.7, 0.12–0.16, 0.20–0.22, 2.11–2.16, 4.16–4.20; EtaleCohomologyFoundations F.0.1–F.0.3, 0.7, F.1, F.2.1–F.2.4, F.3, F.5, F.6, F.8; EnhancedDerivedSheaves §§0.1–0.4 and Layer E2 (E2.6 hypercovers); AdicEtaleGeometry A1.14–A1.15 (Deligne's enough-points theorem is in A1.15); PerfectoidSpaces P1.24.
- Pull-request heads (via `roadmaps show`): EtaleDualityAndPerverseSheaves §§0.1, 0.2, 1.1, 2.2, 2.4, 2.11; LefschetzPencilsAndVanishingCycles §§0.2–0.5, 0.10; ClassicalAdicEtaleCohomology §5.4 (`OrientedEtaleProduct`); DeformationAndDerivedPatchingAlgebra §1.10; AlgebraicModuliForArithmeticGeometry §§6.0–6.1 (`polynomial_approximation`); PerfectoidQuotients §§0.4–0.6.
- Board packages on board main (design stage): AdicCoefficientsAndComparisonsPartII PA.0.2–PA.0.12, PA.1.2–PA.1.4, PA.4.1–PA.4.8, PA.5.1–PA.5.4; ArcTopologyAndDescent §§3.6, 8.3, 8.6–8.9, 11.1, 11.2, 11.5, 12.6; PerfectoidQuotientsPartII Q5.1–Q5.3, Q6.3–Q6.7; PurityForFlatCohomology PF.1 and PF.4.
- The worker's four "found nowhere" leads (AdicCoefficientsAndComparisonsPartII, ArcTopologyAndDescent, PerfectoidQuotientsPartII, PurityForFlatCohomology) are false leads: all four exist under `packages/` on the board's main branch.

**Duplication and ownership audit, by object** (using `roadmaps grep` over main and the 350 open heads, plus the board packages):
- Cohen–Gabber, partial algebraization, Epp's theorem, local uniformization, potential dualizing complexes and Gabber's affine Lefschetz: no other owner.
- Dimension functions: only Artin's rectified trait function, in LefschetzPencilsAndVanishingCycles §6.2, which is a different object.
- Oriented products: ClassicalAdicEtaleCohomology §5.4 owns the scheme version and is cited. The general-topos version and the tube theorem are new here.
- Absolute purity: cited from LefschetzPencilsAndVanishingCycles §0.10, not restated.
- CS24 Theorem 2.2.7: not planned by ArcTopologyAndDescent. PerfectoidQuotientsPartII line 48 attributes it there; that is drift in PerfectoidQuotientsPartII, so this roadmap is the owner.
- Very tame quotients and Gabber's equivariant modification appear both in LefschetzPencilsAndVanishingCycles §0.10 and in AdicCoefficientsAndComparisonsPartII PA.4. This package cites one of them, which is a matter between those two suppliers.
- No Lean name here duplicates a fully qualified name elsewhere.
- Part I (EtaleDualityAndPerverseSheaves) is imported by section and not re-planned. §§6.5 and 6.8 extend its §§2.11 and 0.2 from a field base to noetherian bases.

**Gap audit.** generic-constructibility-noetherian: precise, matches SGA4half 1.9, and EtaleCohomologyFoundations F.3 covers only field and excellent-trait bases ✓. equicharacteristic-cohen-coefficients: DeformationAndDerivedPatchingAlgebra §1.10 gives strict Cohen rings and lifts but not p-basis coefficient fields ✓. The other five gaps are R01, R02, R03, R05 and R06.

**Adversarial table** (one row per statement; values computed):

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Conv.: Λ = ℤ/n, n ≥ 2 in Layer 6 | n = 1 | Λ = 0, so Λ ≅ Λ² and the §6.8 non-example collapses | convention needed | none |
| Conv.: Tate witness | strict trait; regular surface | H²_s(Λ(1)) = Λ; H⁴_x(Λ(2)) = Λ | ✓ | none |
| Conv.: δ normalised, perversity monotone | strict trait | δ(s) = 0, δ(η) = 1; p = −2δ gives 0 ≥ −2 | ✓ | none |
| Conv.: formal ℓ values 1 and ∞ | ℓ = ∞ | ℓ′-decomposed = Nisnevich (ILO14 line 1298) | ✓ | none |
| §0.1 alt/S | S = Spec k; S = 𝔸², X = Bl₀ | objects 0-dimensional; X×_S X ⊃ ℙ¹×ℙ¹ of dim 2, not dominant | ✓ | dedupe (R08) |
| §0.2 alt_ℓ′ | Spec ℤ[i]→Spec ℤ, ℓ = 3 and 2 | degree 2 prime to 3: covering. For ℓ = 2, the pro-2 fixed field omits ℚ(i): not a covering | ✓ | dedupe |
| §0.3 standard forms | integral henselian X, finite flat degree prime to ℓ | Y = X, V = X | ✓ | none |
| §0.4 valuative criterion | 𝔾_m→𝔸¹; non-Japanese DVR | no lift at the origin ✓; normalisation not finite | Check false | R07 |
| §0.5 approximation | X = Spec Â[t]/(t²−a), 2 invertible | approximations étale; for a ≥ 2 regularity transfers | ✓ | none |
| §0.6 reduction to henselian | regular X, snc Z | identity witnesses the instance | Check malformed | R08 |
| §0.7 reduction to complete | T complete | statement = hypothesis | ✓ | none |
| §1.1 Cohen–Gabber char p | k⟦x,y⟧/(y²−x³), p = 2, 3 | p = 2: t↦y, degree 3, derivative x² ≠ 0. p = 3: t↦x, degree 2, derivative 2y ≠ 0 | ✓ | none |
| Lean `cohenGabber_equalCharacteristic` | above; d = 0; k⟦x,y,z⟧/(xz,yz) | f = residue⁻¹ when d = 0; the non-equidimensional ring fails `hequi` (component dimensions 2 and 1), and torsion-freeness would fail there | ✓, hypothesis needed | none |
| §1.2 / Lean `cohenGabber_equivariant` | k⟦x⟧, μ₂; S₃ on k⟦x₁,x₂,x₃⟧; char 2, x↦x/(1+x) | t = x², degree 2; symmetric functions, degree 6; σ² = x/(1+2x) = x but 2 ∤ unit: excluded | ✓ | none |
| §1.3 Epp | unramified T/S with separable residue extension | S′ = S | ✓ statement; route unowned | R02 |
| §1.4 / `MixedCohenGabberPresentation` | ℤ_p⟦x⟧, H = 1; t↦x^p; V = W[π]/(π^ℓ−p) | finrank 1, coprime to ℓ; residue extension k((t))⊂k((x)) purely inseparable, so not étale at (p); [Frac B:Frac A] = ℓ, B^H = A, invariant degree 1 | ✓ | none |
| Lean `cohenGabber_mixedCharacteristic` | p-dense ⇔ étale at primes over (π) | finite map + open étale locus + closed image ⇒ open U ∋ (π) | ✓ | none |
| §1.5 / `PartialAlgebraization` | k⟦x,y⟧ with (y−x²); A = k | B = k⟦x⟧, C = B[y], n = (x,y); for a field, dim B < 0 is impossible | ✓ | dedupe |
| §1.6 / Lean equal char | k⟦x,y⟧/(xy) with (x),(y); k⟦x⟧ | B = k, regular, 0+1 = 1; C = k[x] | ✓ | none |
| §1.7 / `PrimeToEllLocalExtension` | identity; quadratic | finrank 1; gcd(2,2) = 2 excluded, gcd(2,3) = 1 admitted | ✓ | none |
| Lean `partialAlgebraization_mixedCharacteristic` | ℤ_p⟦x⟧, E = id, I = (x−p) | P.B = ℤ_p (char 0, residue 𝔽_p, 1+1 = 2), C = ℤ_p[x], n = (p,x) | ✓ | none |
| §2.1 de Jong | ℙ¹_L→Spec K, L/K separable | not geometrically irreducible, so excluded | ✓ | none |
| §2.2 weak uniformization | cone xy = z² (also char 2) | chart y₁ = z₁² regular; conic smooth since x = y = 0 forces z = 0 | ✓ | none |
| §2.3 prime-to-ℓ | 𝔽₃[t]_(t), x³+x²+2x+t | closed fibre: x·(x²+x+2), disc 2 non-square, so 𝔽₃ × 𝔽₉. With the rational point removed, the cover is alt but not alt_2′ (pro-2 residue field omits 𝔽₉) | ✓ | none |
| §2.4 hypercovers | regular X, snc Z | constant hypercover | ✓ | none |
| §3.1 oriented product | strict trait | points (s,s), (η,η), (s,η); (η,s) absent | ✓ | dedupe |
| §3.2 tube base change | ILO XI 2.4 direction | f^*Rg_*F → Rp_{1*}p_2^*F; stalk RΓ(Y×_S S_(f(x))) | ✓ | none |
| §3.3 oriented topology | blow-up S′→𝔸², X = S′, Y = S | type (iv) covering | ✓ | none |
| §3.4 proper acyclicity | π = id | ←ρ is an equivalence | ✓ | none |
| §3.5 descent | S = X a point, Čech nerve of a proper surjection | ordinary proper descent | ✓; companion unowned | R03 |
| §3.6 base change | S_• constant | identity | ✓ | none |
| §4.1 constructibility | ILO XIX 2.2 | stalk dimensions 2 and 1, not constructible (non-quasi-excellent) | ✓ | none |
| §4.2 finiteness | snc complement with r = 0, 1, 2 | ranks (1), (1,1), (1,2,1) | ✓ | merge headings (R08) |
| §5.1 dimension functions | 𝔸¹_R, closed point (πt−1); line ∪ plane | dim closure 0 vs 2 fails; −dim O at the meeting point gives −2 ≠ −1, fails | ✓ | dedupe; locator (R09) |
| §5.2 existence | strict trait | δ(η) = 1, δ(s) = 0 | ✓ | none |
| §5.3 transport | 𝔸¹_k→Spec k | trdeg gives δ(η) = 1, δ(closed) = 0 | ✓ (source misprint) | order (R11) |
| §5.4 regular base change | k[t]_(t), z² = 1+t | no section over A, a section over k⟦t⟧ | ✓ | none |
| §5.5 trait affine Lefschetz | X = S strict, f = j_η | R¹ at s; δ = 0 = 1 − 1, sharp | ✓; route unowned | R01 |
| §5.6 affine Lefschetz | X = Spec k | Artin vanishing | ✓ | none |
| §5.7 local form | W(k̄)⟦x⟧[1/p] | d = 2, H^q = 0 for q > 2 | ✓ | none |
| §5.8 cd bound | d = 0 boundary; strict trait | 2d−1 = −1 < 0 = cd, so d > 0 is needed; cd(η) ≤ 1 | ✓ | statable (R04) |
| §6.1 transitions | inseparable degree p^r | p = 2, Λ = ℤ/3: 2·2 = 1; p = 3, Λ = ℤ/2: inverse 1 | ✓ | dedupe |
| §6.2 top class | regular surface | H⁴_x(Λ(2)) = Λ via two immediate maps | ✓ | locator (R09) |
| §6.3 potential complexes | strict trait, K = Λ(1)[2] | RΓ_η = Λ(1)[2], RΓ_s = Λ in degree 0 | ✓ | dedupe |
| §6.4 regular case | strict trait, δ = −codim | RΓ_s(Λ) = Λ(−1)[−2] | ✓ | none |
| §6.5 perverse t-structure | trait, p = −2δ | Λ(1)[2] in heart: degree −2 ≤ −2 and ≤ 0; RΓ_s in degree 0 ≥ 0. Λ: degree 0 > −2, so not in D^{≤p}. Shift law D^{≤p}[−k] = D^{≤p+k} | ✓ | dedupe |
| §6.6 existence | X regular | K_X = Λ | ✓ | none |
| §6.7 functoriality | 𝔸¹_X→X | f^! = f^*(1)[2], δ + 1 | ✓ | none |
| §6.8 dualizing | point, Λ²; Λ = ℤ/6, L = 𝔽₂ ⊕ 𝔽₃[1] | DDΛ = Λ⁴ ≠ Λ; L ⊗ L⁻¹ = 𝔽₂ ⊕ 𝔽₃ = Λ | ✓ | dedupe; gap (R05) |
| §6.9 biduality | strict regular local ring | K = Λ(d)[2d] | ✓ | none |
| §6.10 duality theorem | regular strict local ring | Λ and Λ(d)[2d] differ by an invertible object | ✓ | locator (R09) |
| §6.11 normalised complex | d = 1; d = 0 | Λ(1)[2]; Λ | ✓ | none |
| §6.12 local duality | trait, F = Λ | H²_x(Λ) = Hom(Λ(1), Λ) = Λ(−1) | ✓ | none |
| §7.1 punctured vanishing | d = 1, f uniformiser; f = 0 | H^i = 0 for i > 1; empty open | ✓ | none |
| §7.2 extension by zero | d = 1 | H⁰_𝔪(j_!) = 0 | ✓ | none |
| §7.3 local Lefschetz | DVR; R = R̃/(f) | 0 → ℤ/ℓ injective at degree d−1 = 0; vanishing below d−1 | ✓ | consumer (R10) |
| §8.1 matched opens | p-adic completion of W(k̄)[p^{1/p^∞}], ϖ = p^{1/p} | rank-one valuation ring, so exactly two pairs | ✓ | dedupe |
| §8.2 multiplicative tilt | perfect characteristic-p A | identity | ✓ | none |
| §8.3 idempotents | A₁ × A₂ | (1,0), (0,1) ↔ the tilts | ✓ | none |
| §8.4 valuation products | singleton, ϖ = 0 | empty generic open; H⁰ = G | ✓ | none |
| §8.5–8.6 tilting | 𝒪_C, Z = V(ϖ) | both affine terms G → G iso, so supports vanish; Spec 𝔽_p H¹ = ℤ/ℓ control | ✓ | none |
| Proposed cd-bound Lean (R04) | A = k⟦x⟧, d = 1 | hypotheses satisfiable; elaborates | ✓ | add |

## Not verifiable

- Ill03 (Illusie 2003, Théorème 2.4): paywalled and settled as uncertified in the manifest, so not requested. §5.5's trait statement was checked only through ILO XV 1.1.3 and 3.3.2 (ILO14 lines 10337 and 10552–10560).
- Epp73 Theorem 1.9: settled as uncertified, so not requested. The statement was checked against ILO IV 3.1.2 (ILO14 line 2524), and the correction against K10.
- Published Exposés other than II, IX, XII-A and XIV were not compared with arXiv v1. For other Exposés only the v1 numbering cited by the README was checked.
- The full proof steps of ILO XVII §§3–6 (top class, gluing, biduality) were read only at the statement level. The route sketches in §§6.2, 6.6 and 6.9 were not re-derived.
- Ownership against open pull requests: checked with `roadmaps grep` over all 350 open heads and main. The sibling checkouts listed in the brief are covered by that index.

## Source issues

- **Misprint** in ILO14 at II Théorème 4.2.1, printed p. 32: the source requires the valuation ring to have an algebraically closed residue field; it should be an algebraically closed fraction field, which is what the proof uses; affects nothing; corrected in print at ILO-final-II 4.2.1, p. 33.
- **Misprint** in ILO14 at III Théorème 5.1, printed p. 41: the source says X is of finite type over S; it should be over the completion Ŝ, since X has a model over S_α0 whose limit is Ŝ; affects nothing.
- **Misprint** in ILO14 at V 3.2.3(i), printed p. 67: the source writes the dimension condition for A′/I + p, without the prime or brackets; it should be dim A′/(I′ + pA′) = d − 1; affects nothing.
- **Misprint** in ILO14 at V 3.2.4, printed p. 68: the source henselises in the variable t_{d−2}; it should be t_{d−1}, matching 3.2.3; affects nothing.
- **Gap** in ILO14 at IX Théorème 1.2, printed p. 131: the source assumes only an irreducible generic fibre and invokes only condition (2.1.1) of de Jong; geometric irreducibility, giving de Jong's (2.1.5), is needed for the quotient clause (iii); affects a stated result; corrected in print at ILO-final-IX 1.2, p. 161.
- **Error** in ILO14 at XII 2.1.1, printed p. 191: the source says finite limits of diagrams of noetherian schemes exist and are computed termwise; termwise fibre products of noetherian schemes need not be noetherian, so the category must be all schemes or finite type over a fixed noetherian base; affects a stated result; corrected in print at ILO-final-XII 2.1.1, p. 241.
- **Gap** in ILO14 at XII Théorème 1.2.2 with 1.3.4, printed pp. 189–190: the source states non-abelian 1-acyclicity as a theorem while flagging that the limit passage it needs is unpublished; it should be a conditional remark; affects a stated result; corrected in print at ILO-final-XII 1.4, p. 241.
- **Misprint** in ILO14 at XIV Corollaire 2.5.2, printed p. 216: the source takes the transcendence degree of κ(f(y)) over κ(y); it should be κ(y) over κ(f(y)), as the affine line over a field shows; affects a stated result as printed (the same misprint appears in ILO-final-XIV 2.5.2, p. 289).
- **Misprint** in ILO14 at XVII Théorème 0.9, second item, printed p. 257: the source uses exceptional pullback for a flat morphism with geometrically regular fibres, which need not be of finite type; it should be ordinary pullback, as in XVII 4.1.1; affects nothing.
- **Error** in G04 at §8, opening paragraph, p. 10: the source asserts that for ℤ/n coefficients each local exceptional restriction of a dualizing complex is a single shift of the coefficients; for composite n the shifts can differ between prime factors (twist by 𝔽₂ ⊕ 𝔽₃[1] when n = 6); it should be stated for prime powers or factorwise; affects a stated result (Lemma 8.1 holds factorwise).
- **Gap** in Epp73 at the equal-characteristic Artin–Schreier step of the proof of Theorem 1.9 (page as located in K10, p. 2): the source assumes the most negative exponent carries a coefficient that is not a p-th power; coincident exponents can cancel, so the argument must recombine terms and iterate; affects the proof; corrected in print at K10, pp. 1–3.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b61ddc0", "job": "REV-PKG-EtaleDualityAndPerverseSheavesPartII", "model": "opus", "worker": "fable-rev83"} -->
