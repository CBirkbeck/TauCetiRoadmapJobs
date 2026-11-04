<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1029#issuecomment-6627166728 -->
Red team round 2 pass b (claude) of 67bd670

Verdict: needs_changes

1. **F01** (P1) `Suggested.lean` imports a Tau Ceti module that does not exist at the pin

   **Location.** `packages/AutomorphicBundlesPartII/Suggested.lean:2` "import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower"; `README.md:53` "`SheafOfModules.exteriorPower` in `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean` (line 49)".

   **Claim.** The acceptance file elaborates against the pinned Mathlib and Tau Ceti.

   **Witness.** The pin in `lake-manifest.json` is Tau Ceti 358314d4 (bumped 2026-10-08, before this head). At that revision `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean` does not exist; commit c262bf105 (2026-10-07) moved it to the directory `Sheaf/ExteriorPower/` with `Basic.lean` (the `def exteriorPower` is at its line 60, signature `(R : Sheaf J CommRingCat) (n : ℕ) : SheafOfModules (ringCatSheaf R) ⥤ SheafOfModules (ringCatSheaf R)`) and `Free.lean`. The worker's elaboration attempt (`scratch/signatures.md`) failed with "object file …/TauCeti/Algebra/Category/ModuleCat/Sheaf/Exterio[rPower]" missing. The round-1 repair report's "lake env lean … exit 0" cannot have been run at this pin.

   **Repair.** In `Suggested.lean` replace line 2 by `import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower.Basic`. No other change: the carrier `SheafOfModules.exteriorPower X.sheaf d` keeps the same argument shape and target (`X.Modules`, as the module header of `ExteriorPower/Basic.lean` line 19 states). In README line 53 write "`SheafOfModules.exteriorPower` in `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower/Basic.lean` (line 60)". Then re-run the signature check (`#check @finiteCoefficientSerreDuality` etc.) at this pin and record it in the repair report. Tested statically: the three other imports exist at the pin (`Differentials/Basic.lean` line 85, `TensorProduct.lean` line 66, `Cohomology/Module/Base.lean` line 45), and nothing else in the file names the old path.

2. **F02** (P1) `LanglandsParameterStacks LP3.0` does not exist; Weyl and induced modules, including integral lattices, are owned by ReductiveGroups §§9A, 10B on main

   **Location.** `README.md:87` "LP3.0: Highest-weight Weyl and induced dual-Weyl modules over fields"; `README.md:89` gap:integral-dual-weyl-lattices "The supplying section is LP3.0"; `README.md:7`, `:198`, `:202`, `:212`, `:344`, `:969`, `:1187` cite "LanglandsParameterStacks LP3.0"; `design/plan.json` gap `integral-dual-weyl-lattices` has `section: LP3.0`.

   **Claim.** LanglandsParameterStacks LP3.0 supplies field Weyl/dual-Weyl modules, and the integral lattices are a gap on that section.

   **Witness.** LanglandsParameterStacks at #1202 numbers its targets k.n; it has no "LP" labels and no 3.0 (Layer 3, lines 794–897, is pseudocharacters; the nearest target, 4.1 "Highest-weight modules and good filtrations", line 919–921, itself imports "the induced modules ∇_λ=H⁰(λ) and Weyl modules Δ_λ=H⁰(−w₀λ)* of ReductiveGroups §10B, with its dominance/nonvanishing and arbitrary-field base change"). ReductiveGroups is on main; its §10B (README line 1760–1800) constructs ∇(λ)=Ind_{B⁻}^G k_λ with "f(gb)=λ(b)⁻¹f(g) and G acts by a·f(g)=f(a⁻¹g)", Δ(λ)=∇(−w₀λ)*, arbitrary-field base change, and states "induced/Weyl base change and integral Weyl lattices with their actual freeness and action equations" with "the perfect integral evaluation pairing with the dual"; its §9A (line 1593–1605) builds "a full finite free admissible ℤ-lattice generated from the highest line by the 9A divided powers" for every dominant λ. `roadmaps resolve` lists LP3.0 as found nowhere (`scratch/citations.md`).

   **Repair.** (1) Replace the `### From TauCetiRoadmap.LanglandsParameterStacks` contract (README:85–89) by `### From TauCetiRoadmap.ReductiveGroups` with: "§10B: the induced module ∇(λ)=Ind_{B⁻}^G k_λ with f(gb)=λ(b)⁻¹f(g) and left translation a·f(g)=f(a⁻¹g), the Weyl module Δ(λ)=∇(−w₀λ)*, their arbitrary-field base change, and the integral Weyl lattices with their freeness, action equations and perfect integral evaluation pairing; §9A: the finite free admissible ℤ-lattice generated from the highest line by divided powers." (2) Replace every "LanglandsParameterStacks LP3.0" (lines 7, 198, 202, 212, 344, 969, 1187) by "ReductiveGroups §10B". (3) Keep gap:integral-dual-weyl-lattices only for what §10B does not state, re-pointed to supplier ReductiveGroups §10B: "the integral induced (dual-Weyl) lattice ∇(λ)_ℤ as the ℤ-dual of the Weyl lattice Δ(−w₀λ)_ℤ in the right-B function realization, for the split Siegel Levi, with the symmetric-power versus divided-power identification in residue characteristic and base change to the field modules"; the plan.json entry's `supplier`/`section` must change with it, which is a plan edit the intake must record (the package stage may only add gaps). If the worker prefers not to touch the plan, add a new gap slug on ReductiveGroups §10B with that sentence and state in the repair report that the LP3.0 gap is void. Tested on §1.2's Checks (weight zero gives O; f(m⁻¹m′) fails the identity law; Sym² over ℤ with divided-power index 2): all are statements about ∇, Δ and their ℤ-forms as §10B names them, unchanged.

3. **F03** (P2) every ShimuraCompactifications section label is dead at #1053 (the roadmap renumbered its layers)

   **Location.** `README.md:11` "ShimuraCompactifications C3–C5 … C5.19–C5.21 and C5.31; C4.16 … C5.21 … C5.29"; `README.md:83` contract "C3.3–C3.10, C4.1–C4.11, C4.16–C4.17, C5.3–C5.17, C5.19–C5.31 … (C5.21) … (C4.16)"; the same labels at lines 173, 177 ("C4–C5"), 187, 344, 478, 488, 657, 752, 767, 814, 853, 865, 871, 881, 899, 917, 931, 942, 948, 957, 969, 1069, 1187, 1457, 1485, 1515, 1588.

   **Claim.** These sections exist at the head of ShimuraCompactifications.

   **Witness.** ShimuraCompactifications at #1053 says "Internal references k.n name target n of Layer k" (line 203) and has no C-labels and no alias table; its Layer 3 has the single target 3.1, Layer 4 ends at 4.11 and Layer 5 at 5.1, so C3.3–C3.10, C4.16–C4.17 and C5.3–C5.31 resolve to nothing. The cited content exists under new numbers: 4.3 toroidal Hecke correspondences, 4.9 boundary ideal along refinements, 4.10 fan-independence of coherent cohomology (lines 1521, 1654, 1679); 6.1–6.11 semi-abelian schemes, polarized degeneration data and isogenies at the boundary, 6.16 "The compactified Klingen correspondence", 6.17 its first-projection acyclicity (lines 1787–2159); 7.3 "Integral toroidal compactifications", 7.15 Fourier–Jacobi expansions of Hodge-line sections, 7.16 the integral minimal compactification, 7.19 "Finite normalizations at higher p-level", 7.21 "Formally canonical coefficient sheaves" with `IntegralToroidalModel.formallyCanonical`, 7.25–7.26 Hilbert–Siegel minimal boundary codimension and formal Koecher, 7.29 "The canonical bundle of a Siegel threefold" (ω_X=(det E)³(−D)), 7.31 "Normalized blow-ups of minimal compactifications" (lines 2295–2983). The mapping is C3.n→4.n, C4.n→6.n, C5.n→7.n, C1→Layer 1 (1.1–1.6 mixed boundary data and cusp labels). `roadmaps resolve` flags C4.1, C4.16, C5.3, C5.19 and C5.21.

   **Repair.** Relabel mechanically: "C3.3–C3.10"→"4.3–4.10"; "C4.1–C4.11"→"6.1–6.11"; "C4.11"→"6.11"; "C4.16–C4.17"→"6.16–6.17"; "C4.16"→"6.16"; "C5.3–C5.17"→"7.3–7.17"; "C5.19–C5.31"→"7.19–7.31"; "C5.19–C5.21, C5.31"→"7.19–7.21, 7.31"; "C5.21"→"7.21"; "C5.29"→"7.29"; "C5.3, C5.16 and C5.25–C5.26"→"7.3, 7.16 and 7.25–7.26"; "C5"→"Layer 7"; "C4–C5"→"Layers 6 and 7"; "C3–C5"→"Layers 4, 6 and 7"; "C1"→"Layer 1"; and in the contract heading line 83 and the Scope line 11 write the layer names ("Layer 4: refinements and Hecke maps; Layer 6: degenerations of polarized abelian schemes; Layer 7: integral PEL compactifications"). Tested on the three objects the README names: `IntegralToroidalModel.formallyCanonical` is in 7.21 (line 2724), ω_X=(det E)³(−D) is 7.29 (line 2905–2908), the Klingen span is 6.16 (line 2133); the depcheck edge to ShimuraCompactifications is unchanged.

4. **F04** (P3) AutomorphicBundles labels: B3.10 is not defined by the supplier's alias table

   **Location.** `README.md:7` "AutomorphicBundles B3.10"; `README.md:59` "B0–B5, B3.10, B3.BGG"; `README.md:61` "The supplying section is B3.BGG.2–B3.BGG.3"; `README.md:533` "AutomorphicBundles B5.10 `ClassicalHecke.operator`"; B3.10 again at lines 9, 173, 187, 198, 212, 931, 969, 985, 999, 1013, 1027, 1041, 1055, 1069, 1083, 1097, 1111; B5.10 and B3.BGG also at lines 9, 969, 1187.

   **Claim.** The labels resolve at the head of AutomorphicBundles.

   **Witness.** AutomorphicBundles at #1069 numbers layers 0–12 and keeps an alias table (README line 217–222): "B0 = Layer 0, B1 = Layer 1, … B3 = Layer 5 (its gluing target B3.3 = 5.2 precedes the canonical extension B3.2 = 5.3), … B3.BGG = Layer 9, … B4 = Layer 11 and B5 = Layer 12 (B5.1a = 12.2, B5.n = 12.(n+1) for n ≥ 2)". So B5.10 = 12.11 "Geometric Hecke operators on classical sections" (`ClassicalHecke.operator`, line 4925–4927) and B3.BGG.2–3 = 9.2–9.3 resolve, but B3.10 is not covered (the table only maps B3.2 and B3.3, and swaps them). The intended target is 5.10 "Integral canonical coefficients on good-prime PEL models" (`integralLeviCoefficient`, line 2037–2054), which is the good-prime integral Levi torsor and formally canonical/subcanonical coefficients the README attributes to B3.10. `roadmaps resolve` flags B3.10 and B5.10.

   **Repair.** Write "AutomorphicBundles 5.10 (`integralLeviCoefficient`)" for every "B3.10"; "AutomorphicBundles 9.2–9.3 (`siegelDualBGGComplex`, `siegelBGGGradedComparison`)" for "B3.BGG.2–B3.BGG.3" (line 61 and the gap's section, which the intake must mirror in plan.json); "AutomorphicBundles 12.11 `ClassicalHecke.operator`" at line 533; and for the layer labels "B0 (Layer 0, 0.4 `associatedCoefficient`), B1 (Layer 1), B2 (Layer 3), B3 (Layer 5), B4 (Layer 11), B5 (Layer 12)". Tested: 5.10 states that `Ecan(W)` is formally canonical in the sense of "ShimuraCompactifications Layer 7 (§7.21 `IntegralToroidalModel.formallyCanonical`)", which also confirms the S03 mapping C5.21→7.21.

5. **F05** (P3) a Tau Ceti line locator is off at the pin

   **Location.** `README.md:53` "`AlgebraicGeometry.Scheme.Modules.instMonoidalClosed` in `TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean` (line 63)".

   **Witness.** At Tau Ceti 358314d4 the instance is declared at line 66 (its docstring starts at line 64; line 63 is the end of `instSymmetricCategory`).

   **Repair.** "(line 66)". The other quoted lines were checked at the pin and are right: `cohomologyBaseModule` 45, `cohomologyMapBaseLinear` 57, `cohomologyZeroBaseLinearEquiv` 110, its naturality lemma 127, `cohomologyδBaseLinear` 242, `relativeDifferentials` 85, `isKProjective_of_projective` 113, `Qh_map_bijective` 43.

6. **F06** (P3) CrystallineCohomology CR.5.2 is consumed but not in the contract; a bare "CR.5" in the Layer 5 dependencies

   **Location.** `README.md:969` "*Needs:* … CrystallineCohomology CR.5.4 (gap:coefficient-logarithmic-splitting), CR.5.1–CR.5.3"; `README.md:1187` "CrystallineCohomology CR.5.1–CR.5.4; CrystallineCohomology CR.5"; contract `README.md:147` "CR.5.1, CR.5.3–CR.5.4, CR.DDR.6.11–CR.DDR.6.14".

   **Witness.** At #857 CR.5.2 is "Exactification and log PD envelopes" (line 8670) and "CR.5" is the whole layer "Logarithmic differentials and log crystalline cohomology" (line 8458); CR.5:log-algebra is a different layer (line 7597). The contract omits CR.5.2, and the layer dependency cites a whole layer where the section rule asks for targets.

   **Repair.** Either add "CR.5.2 (exactification and log PD envelopes)" to the contract at line 147, or write "CR.5.1, CR.5.3" at line 969; at line 1187 delete "; CrystallineCohomology CR.5" and make the range match the contract.

## Round 1 findings at this head

Each finding of the two round-1 passes was re-read against the head; the repaired passage is quoted (at most 40 words) with its line.

| Finding | Status at 67bd670 | Witness |
|---|---|---|
| a-F01 (P2) finite part does not determine the contribution | repaired | `packages/AutomorphicBundlesPartII/README.md:1289` "For a full discrete automorphic representation π=π_∞⊗π_f … define the σ-isotypic degree-i contribution as the image of the sum of these source spaces over all full π with π_f≃σ"; Check at line 1311 gives (d,0)+(0,d)=(d,d). |
| a-F02 (P1) uncited purity theorem | repaired | README:109 adds §5.5 `clozelPurity` to the contract; README:1541 "apply AutomorphicFormsOnReductiveGroups §5.5's cuspidal purity theorem `clozelPurity`"; Needs at 1543; Check at 1548 shifts (3/2,3/2,5/2−a,5/2−a) to (0,0,1−a,1−a). The supplier target exists at #1037 line 817–819 and concludes essential temperedness at every archimedean place for algebraic cuspidal GLₙ. |
| a-F03 (P1) ampleness sign | repaired | README:942 "D′ is the effective Cartier divisor supported on the boundary supplied by Lan17 Corollary 6.7, with O(−D′) relatively ample"; route at 946; Check at 953 (degree n versus −n). Lan17 line 1163–1166 says exactly this. |
| a-F04 (P1) nongeneral-type exclusion restricted to limits | repaired | README:1373 steps (a)–(b): the infinitesimal character is identified first, "That is the only hypothesis of BCGP21 Lemma 2.9.1"; §8.7 route at 1541 applies (a)–(b) before purity. BCGP21 line 1831–1834 states only the infinitesimal-character hypothesis. Check at 1386 (type (d)). |
| a-F05 (P2) absolute separation constant | repaired | README:111 declares gap:uniform-global-gsp4-separation with supplier AutomorphicFormsOnReductiveGroups §6.6; plan.json gaps has the same slug (10 gaps); §8.8 route at 1556 and Needs at 1558 cite it; Check at 1563 (R_F=2+[F:ℚ]). AFRG §6.6 at #1037 line 1049 still fixes F before "There exists R>2". |
| b-F01 (P2) SolidAnalyticRings imported for (A,A)■ | repaired (applied differently, as the repair report says) | `grep SolidAnalyticRings README.md` returns nothing; README:159 contract now VS2.1/VS2.2; README:455 "Every solid category here is the κ-condensed abelian category D((A,A)■) of CS19; no light-condensed or spectral carrier is used". VS2.1 (#1230 line 588) and VS2.2 (line 692) exist and are the κ-condensed theory. The deliberate non-use of VS2.2's `AnSpec` is justified at README:37 (integer-solid principal localization is closed). |
| b-F02 (P3) dual-frame scale factor | repaired | README:191 "scaling the Lie frame by a unit u scales the dual frame by u⁻¹; with Lie frame u the dual frame is c/u. At ψ₁=4 and c=3 the dual frame is 3/4". Recomputed: 4·(3/4)=3=c. |
| b-F03 (P3) unused completeness and n>0 | repaired | `Suggested.lean:65–66` has no `IsAdicComplete` and no `hn`; docstring line 61–63; README:19, 282, 323, 335 say "stated for every n … vacuous at n=0 … does not use the completeness of O". |
| b-F04 (P3) CS19 Definition 9.1 locator | repaired | README:37 and 455 "defined after CS19 Definition 9.1 (p. 62) as the filtered colimit over finitely generated discrete Huber pairs"; References line 1627. CS19 lines 2318–2325 confirm. |
| b-F05 (P3) five accepted notes | repaired | README:69 `upperShriek_lci` (§2.19) and §0.18; README:1187 "SchemeAndStackFoundations §§0.18, 1.1, 2.23"; README:1509 "unless k_v=l_v=k is independent of v (the scalar-parallel case)" (BCGP21 line 3323–3334 confirms the two-way split); README:1617 arXiv link; README:53 "(line 49)" — but see S01: the file has moved at the pin, so this locator is stale again. |

No repair introduced a new mathematical error. The repaired §7.0 exclusion paragraph, the §8.7 purity step and the §8.8 gap were recomputed below (rows §7.0, §8.7, §8.8). One repaired locator (README:53, b-F05 item 5) is dead at the pinned Tau Ceti for a reason outside the repair: the module itself has moved (S01).

## Verified sound

Read in full: README.md (1627 lines), Suggested.lean (85 lines), design/plan.json (10 gaps), the three round-1 reports. Counts: declarations read 3; numbered targets read 69 plus the two acceptance-file definitions and the three sub-targets of §5.0; bold worked-example targets 4; Check bullets read 190, recomputed 41 (table below); locators verified against the cached texts 32; sibling citations resolved at main or at the open head named 22 roadmaps (every section listed in the contracts was located by heading except the three drifted roadmaps of S02–S04, whose content was located under its new numbers); ownership greps 9.

**Dependency gate.** Output of the brief's depcheck command on this README:

```text
moved: AutomorphicBundlesPartII moved in the merge order from #178 to #230, right after its last supplier AutomorphicBundles; checked as moved (the worker moves it there when it submits)
depcheck: 204 roadmaps, 1759 edges, 0 problem(s)
```

No UPWARD or CYCLE line; the moved line is permitted. S02's repointing to ReductiveGroups (on main) adds an edge from a main roadmap and cannot create an upward edge.

**Policy.** `git diff --stat origin/main...HEAD` lists 11 files, all under `packages/AutomorphicBundlesPartII/`. No `lemma` declaration, no `set_option`, no pull-request number or process word in README.md or Suggested.lean (the word "lemma" occurs only in prose, "Dolbeault lemma", "the lemma attaches"). Every target has a locator. No machine path. No computational algorithm (the Lan–Suh substitution formulas in the worked example are closed-form choices, not a procedure).

**Suggested.lean ledger (static, no Lean run; see S01 for the import).**

| Declaration | Binders kept | Instances computed (left / right) | Result |
|---|---|---|---|
| `dvrCoefficientRing O ϖ n` (line 52) | O, CommRing, ϖ, n; no DVR hypothesis in the abbrev | ℤ₃, ϖ=3: n=0 → O/(1)=0; n=1 → 𝔽₃; n=2 → ℤ/9 with 3≠0, 3²=0 | matches README 272–282 |
| `integerCoherentCohomology R X F i` (line 56) | R, CommRing, X, `X.Over (Spec (.of R))` (needed by `cohomologyBaseModule`, Base.lean 45), F, i | Spec A, F=O: i=−1,0,1 → 0, A, 0; F=0 → 0,0,0; `ULift.{u} PUnit : Type u` so the universe matches `ModuleCat.{u}` | matches README 284–294 |
| `finiteCoefficientSerreDuality` (line 65) | O, CommRing, IsDomain, IsDiscreteValuationRing (which extends IsLocalRing, pin line 56), ϖ, Irreducible ϖ, n, X, Over, d, SmoothOfRelativeDimension (pin Smooth.lean 127), IsProper (Proper.lean 41), F, IsLocallyFree (LocallyFree.lean 61), IsFinitePresentation (Quasicoherent.lean 269), i | A=O/ϖⁿ Artinian Gorenstein, self-injective, so H^{−i}RHom_A(C,A)=Hom_A(H^iC,A); Grothendieck duality with f^!A=ω[d], ω=⋀^dΩ, gives Hom_A(H^i(Hom(F,ω)),A)≃H^{d−i}(F) for finite locally free F. Spec A, d=0, F=O: i=0 → A ≃ A, i=±1 → 0≃0; ℙ¹_k, F=O(−2), d=1: i=0 → Hom(H⁰(O(2)⊗ω)=H⁰(O),k)=k / H¹(O(−2))=k; i=1 → 0 / 0; n=0: both 0; X=∅: 0≃0 | true as typed; `(d:ℤ)−i` is integer subtraction |

**Adversarial pass (values on both sides; "=" means agreement).**

| Statement | Instances | Values | Result |
|---|---|---|---|
| §1.1 ψ₂=c(ψ₁ᵗ)⁻¹ scaling | ψ₁=2→4, c=3 | 3/2→3/4; 4·3/4=3=c; c/u rule gives 9/4, product 9 | = (repair verified) |
| §1.3 scalar x^{a+b} and ν⁻³ | (5,2), x=2; (4,2) | 128·4⁻³=2; 64·1/64=1 | = |
| §1.3 W/V central relation | (a,b;c)=(5,2;−4) | V_(−2,−5;−1), a+b+2c=−1 | = §6.7 Check |
| §1.4 derived reduction of [O→O,ϖ] | ℤ₃ | H⁰=0,H¹=k; after ⊗ᴸk: k,k | = |
| §1.4 perfectness needs target flatness | Spec k→Spec k[ε]/ε² | Tor_j(k,k)=k ∀j | excluded by E1.9 (EDS line 1057–1060: termwise flat over the target) |
| §1.5 inverse deck action | 𝔽₅, δ=2, λ(1)=1 | (δλ)(1)=3, 3·2=1; wrong rule 4 | = |
| §1.6 trace not an isomorphism | genus-one curve over k | RΓ(ω)[1]: H⁻¹=k, H⁰=k | = |
| §2.2 free rank one over 𝔽₂[C₂] | 𝔽₂×𝔽₂ | basis (1,0),(0,1); trace(1,0)=1 | = |
| §2.3 freeness needs O-flat N | N=O/ϖ, n=2, Δ=1 | k not free over ℤ/9-type ring | hypothesis needed |
| §2.3 mod-ϖ freeness | N/ϖ⊗B/ϖ projective over local k[Δ] | Kaplansky → free, any rank | = route |
| §2.4 unshifted dual reverses degree | ℙ¹_k, F=O | (k,0) vs (0,k) | = |
| §2.5 five-term edge | R=𝔽₂[t]/t², C=[R→R,t] | Tor₂=k→H₁⊗k=k iso; H₁⊗k→H₁(C⊗k)=k zero; H₁(C⊗k)→Tor₁=k iso | = (Tor_i^R(k,k)=k ∀i) |
| §2.5 homological descent via norm | free A_n[Δ]-term P=A_n[Δ] | Hom(P,A_n)_Δ ≅ Hom(P,A_n)^Δ ≅ A_n = downstairs term | = |
| §3.0a completion vs local cohomology | k[x], I=(x); I=0,(1) | k[[x]] in degree 0 vs H¹=k[x,x⁻¹]/k[x]; endpoints A, 0 | = |
| §3.3 composition order | ℚ[x], x↦x+1 then x↦2x | 2x+1 vs 2x+2 | = |
| §3.6 Tor-independence | ℤ₃, k⊗ᴸk | degrees −1,0 | = |
| §3.9 transpose shape | D_C(p₁^!G)=Lp₁^*D_XG, D_C(Lp₂^*F)=p₂^!D_XF | BP26 line 1185–1187 same arrow | = |
| §3.9 blow-up Check | Bl_pt ℙ², b^!O=O(E), coker O_E(−1) | H⁰=H¹=0; Rb_*O(E)=O_X; actions 1,1 | = |
| §3.9 closed point of 𝔸¹ | i^!O=k[−1], D_XO=O[1] | arrows k→k both identity | = |
| §3.10 contraction direction | BP26 Def 2.1.19(4) line 433: p̄₁*D⊆p̄₂*D | {0,1}, p₂≡0, Z={1}: {1}⊄∅; Frobenius: all closed sets | = |
| §4.1 normalization | P20 line 1084–1085 | T_{ℓ,2}=ℓ⁻³T′, T_{ℓ,i}=ℓ⁻⁶T′ (i=0,1) | = |
| §4.3 double cosets | BCGP21 line 1035–1037 β_{v,1}=diag(ϖ,ϖ,1,1), β_{v,2}=diag(ϖ²,ϖ,ϖ,1) | same double cosets as diag(1,1,x,x), diag(1,x,x,x²) after w₀∈GSp₄(O) | = |
| §4.3 similitudes | antidiagonal form | x², x, x² | = |
| §4.3 spin polynomial | BCGP21 (2.4.8) line 1045; q=2,(1,3,2) | X⁴−3X³+14X²−24X+64; reciprocal 1−3X+14X²−24X³+64X⁴ = SR.4.5's Check at (1,2,3) in its T₁↔T₂ order | = |
| §5.2 range | Lan17 line 1511 | i>0, n>0 resp. n≥0 | = |
| §5.3 ↔ LanSuh Cor 7.24 | line 2069–2073 | μ∈X^{+,<rep}, max(2,r_τ)<p, w∈W^{M₁}, ν positive parallel, i<d / i>d | = |
| §5.3 GSp₄ weights | μ=0, t=2; t=1 | (4,2),(5,3),(5,5); (3,1),(4,2),(4,4) | = |
| §5.4 substitutions | t=max(1,b,⌈(a+b−2)/2⌉), α=t−b, β=a−2−t | α≥β⇔2t≥a+b−2; β≥0⇔t≤a−2, true when a≥3, b≤a−2; α+β=a−b−2<p−3⇔a−b≤p−2 | = |
| §5.5 substitutions | t=max(1,b−1), α=a−3−t, β=1+t−b | α≥β⇔a+b−4≥2t, needs a+b≥6 when t=1 | = |
| §5.6 substitutions | t=b−3, α=a−b, β=0 | t>0⇔b≥4; α+β=a−b<p−3⇔a−b≤p−4 | = |
| §5.7 dual weight | (Sym^nE)^∨=Sym^nE⊗det^{−n}, n<p | (a,b)↦(3−b,3−a); involutive | = |
| §5.8 ranges from §5.5/§5.4 | b=2: a+2≥6, 2≤a−2≤p−2 | 4≤a≤p; (a,3−a): 2a−3≤p−2 ⇔ a≤(p+1)/2 | = CG20 line 1232–1236 |
| §6.6 σ-isotypic | (4,2), m=1, dim σ^K=d | (d,0)+(0,d)=(d,d) | = (repair verified) |
| §6.7 Check | (5,2), x=2 | c: −7→−4; scalar 128→2 | = |
| §7.0 spin orbit | formula with w=a+b−6 | (3/2, 3/2−(b−2), 3/2−(a−1), 3/2−(a+b−3)); (4,2): ±3/2 twice, sum 0; (5,2): sum −2; (3,2;0): (7/2,7/2,3/2,3/2), sum 10 | = CG20 Thm 5.6(2) line 1191–1193 |
| §7.0(a) hypothesis | BCGP21 line 1831–1834 | only the infinitesimal character of ϕ(2;k_v−1,l_v−2) | = (repair verified) |
| §7.2 chambers | (a−1,0); (a−1,1−a); (0,b−2), b≤1 | {C₀,C₁}; {C₁,C₂}; {C₂,C₃} | = |
| §7.3 bound | P20 line 4939 | k≥R−1 ⇔ −λ₁=k+1≥R | = |
| §8.3 boundary coefficient | P20 line 4975–4980 | ω^{k+2}(−cusp) for k≠0, ω² at k=0; T_{ℓ,2}=2T_ℓ | = (source misprint k=2 at 4980 noted) |
| §8.4 factorization | q=2, α=1, β=2, u=4, D=2, T₀=1 | roots 1,2,4,8; X⁴−15X³+70X²−120X+64; T₁=15, T₂=30; uD=8=q³T₀; e₃=uDA(1+u)=q³T₀T₁ | = |
| §8.5 split | BCGP21 line 3323–3334 | points: k_v=l_v=k constant; curves: l_v parallel, weight (k_v) | = (repair verified) |
| §8.7 Clozel shift | (a,2) orbit −3/2 | (0,0,1−a,1−a) integral; (0,0,1,1) shifts to half-integers | = (repair verified; AFRG §5.5 line 819 concludes essential temperedness) |
| §8.8 coroot values | λ=(k−1,l−2) | k−l+1, k−1, k+l−3, l−2; (8,4): 5,7,9,2; (12,6): 7,11,15,4; (8,2): 7,7,7,0 | = AFRG §6.6 predicate (line 1046) |
| §8.8 central reduction | z=2 at one place | 4·1/4=1; unipotent ν=1 | = |
| §8.8 sum index | BCGP21 line 3271–3284 | (π^∞)^K_m over cuspidal π, holomorphic where l_v>2, nonholomorphic at i places | = |

**Supplier resolution (22 roadmaps).** AutomorphicFormsOnReductiveGroups #1037: §§1.1–1.3 (233–273), 4.1–4.2 (607, 625), 5.5 `clozelPurity` (817–819), 6.1–6.7 (931–1069; §6.6 fixes F first, line 1049; `Separated` predicate line 1046). EndoscopicTransferAndUnitaryTraceComparison #999: §11.1 (4440) with `GSp4ClassificationInputs`. AutomorphicSpectralTheory #925: 4.1–4.5 (2296–2370), 4.10 `wallach_cuspidality` (2425, semisimple setting with the essentially tempered central adaptation), 5.1–5.8 and 5.7a (2698–2833; §5.2 is the full (𝔪_G,K_∞) pair, so gap:su-parabolic-regularization is not already supplied). DeformationAndDerivedPatchingAlgebra #1034: 7.1, 7.3–7.10 (1367–1551). AlgebraicModuliForArithmeticGeometry #853: §7.5 `fundamental_class_boundary` (9513, 9580, both construction cases and the Cartier/inverse-image hypotheses as §3.4 states). SmoothRepresentationsOfLocalGroups #1688: SR.0–SR.4, SR.4.1, SR.4.5 (3553; its spin polynomial agrees with §4.3 after the T₁↔T₂ relabel the README records; no Klingen identity there). IntegralHeckeAndGaloisDeterminants #1689: 2.2–2.3, 3a.1–3a.2, 3b.1–3b.2. ArithmeticGaloisRepresentations #856: 1.1–1.2, 1.7–1.12, 2.2, Layer 5 and 5.1–5.3. WeightsInEtaleCohomology #1001: R34.5 (585), R34.6 (691). ModularCurvesPartII #913: 14.1–14.4a (3499–3600). HilbertModularVarietiesAndShimuraCurves #1005: R18.3.29 (3920) with branch (a) including the even-degree case and the Normalization paragraph (contragredient). CrystallineCohomology #857: CR.5.1–CR.5.4 (8466–9058), CR.DDR.6.11–6.14 (9635–9785). ComplexComparisonPartII #848: C1.9 (1673), Layer C2 (1710), C3.3 (2110). VStackSheavesAndLisseCategories #1230: VS2.1 (588), VS2.2 (692; analytic measures on the κ-condensed site, integer-solid `AnSpec` kept separate as README:37 says). SchemeAndStackFoundations (main): 0.18, 1.1, 2.6–2.8, 2.18–2.21, 2.23, 4.8–4.10, `upperShriek_lci` (4129). DerivedModuleAlgebra (main): 0.2–0.3, 1.1.1, 1.3–1.5, 1.E.0–1.E.1, 1.M.1–1.M.2, S.1. EnhancedDerivedSheaves (main): 0.1–0.3, E1.3, E1.9 `perfect_proper_pushforward` (1057, hypotheses as README:155), E2:towers, E3.2–E3.3, E5:abstract. AlgebraicVectorBundles (main): L0A–L0C. AutomorphicBundles #1069, ShimuraCompactifications #1053, LanglandsParameterStacks #1202: see S02–S04. ReductiveGroups (main): §§9A, 10B as quoted in S02.

**Gaps.** All 10 slugs in plan.json appear in the README with the same supplier and section. Each `needs` is one sentence with hypotheses. Not already provided (checked at the heads): boundary-spin-satake (SR.4.5 has no Klingen identity), su-parabolic-regularization (AST §5.2 is the full pair), coefficient-logarithmic-splitting (CR.5.4 is the log Poincaré lemma), classical-weight-one-realization and nonparallel-hilbert-realization (R34.6, R18.3.29 are weight ≥2 / parallel), coefficient-linear-coherent-comparison (SSF §2.18 has no base-linear comparison), gaga-duality-trace (C1.9/C3.3 state no trace compatibility), integral-small-weight-dual-bgg (AutomorphicBundles 9.2–9.3 are characteristic-zero), uniform-global-gsp4-separation (AFRG §6.6 fixes F first). integral-dual-weyl-lattices: supplier section does not exist and the object is on main (S02).

**Ownership.** `roadmaps grep` finds no other declaration of the three Lean names, no other "coherent homology", "Lan–Suh" or "Harris–Zucker"; coherent cohomological correspondences and their transpose are not built elsewhere (EtaleDualityAndPerverseSheaves Layer 6 and EndoscopicTransfer §7.10a are ℓ-adic); EO strata appear only in IgusaVarietiesAndTorsionConcentration (#1090, 2.12), later in the merge order (238 against 230), so §5.0 stays the owner. Ownership against open pull requests was checked through `roadmaps grep` and the sibling checkouts the brief lists; no sibling in that list touches these objects.

**Headlines and padding.** The fifteen headlines of the module docstring were compared with the README's layer endpoints; fourteen are not statable at the pins for the carrier each names and the only statable one, §1.6, is stated. The two definitions are the minimum the statement needs (a quotient ring, an extension by zero to ℤ-degrees); neither mirrors a Check or computes a value; no declaration follows in one tactic from the pins (there is no relative coherent duality over an Artinian base in Mathlib or Tau Ceti at the pins; the curve theorem `cohomologyOneDualEquivCohomologyZero` is over a field). No padding.

## Not verifiable

- Elaboration of Suggested.lean at the pin: the brief allows no Lean command here, and the worker's own elaboration failed on the missing module (S01). The signature comparison is static.
- GK19 Remark 10.1.3, p. 962: uncertified; cited by locator only.
- Sch15 published pages 1035–1036: only the arXiv text (p. 83) is in the cache.
- H90 Theorem 2.7 beyond part (a): the OCR of the displayed maps is damaged; (a) (injection) was read at line 2242–2247.
- The multiplicity-counted strengthening of BCGP21 (3.10.2) in §8.8: the source sums over representations (line 3271–3280); the README's form is what its cusp-injection route proves and was not tested on a multiplicity greater than one.
- Whether ReductiveGroups §10B's "integral Weyl lattices" include the integral induced module in the function realization for a Levi, or only the Weyl lattice and its dual: the wording (line 1773–1780) covers both through the evaluation pairing, but the residual gap in S02 is left to the repair worker's reading.

## Source issues

- **Misprint** in BCGP21 at proof of Lemma 3.10.7, printed p. 238 (BCGP21 line 3352–3354): the source lists the monomial [1,ϖ,1,ϖ] twice among the four Satake terms of [1,1,ϖ,ϖ]; it should list four distinct monomials, the missing one being [ϖ,1,ϖ,1] on the second line; affects the proof.
- **Misprint** in P20 at proof of Corollary 15.2.3.1, manuscript p. 109 (P20 line 4979–4980): the source says the boundary space is sections of ω² "if k=2"; it should say k=0, as in its own pushforward formula two lines above; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "67bd670db780c7928f538e70596b71460f23bd42", "job": "RT-AutomorphicBundlesPartII~2b", "model": "fable", "worker": "chris-x9"} -->
