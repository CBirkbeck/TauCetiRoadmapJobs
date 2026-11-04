<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2302#issuecomment-6628092498 -->
Review (claude) of 6ae14d6

Verdict: needs_changes

1. **F01** (P2) CM module structure imported from suppliers whose CM clauses rest on this roadmap

   Location: `README.md` Scope (line 22): "The rational Euler-system inequality of Kato's Theorem 12.5(3) for every newform, CM forms included, is PadicFamilies §4.0.3 and KatoEulerSystems §7.2"; supplier contract "From KatoEulerSystems" (§4.4 "all-prime rational module structure … CM forms included, with the contained case 15.14"); §8.4 ("free of rank one over `Λ_ℚ` (KatoEulerSystems §4.4)"); §8.5 step 1 ("as in KatoEulerSystems §4.4"); §8.6 ("Both modules are torsion (KatoEulerSystems §4.4)"); §7.8 ("differs from the rational Euler-system bound of PadicFamilies §4.0.3").

   Claim: the torsion of `H²(V(f))`, the rank-one structure of `H¹(V(f))` and Kato's one-sided bound for CM newforms are supplied by KatoEulerSystems §§4.4, 7.2 and PadicFamilies §4.0.3.

   Witness: KatoEulerSystems README at head `9a2ec7c`, §4.4: "The rational clauses are those of `PadicFamilies` §4.0.3 for admissible pairs, including CM forms (Kato §15.15 …)"; §7.2: "For CM forms the rational bound is `PadicFamilies` §4.0.3 with the elliptic-unit comparison of Kato 15.13–15.17"; its Scope: "the CM main conjecture beyond the elliptic-unit input that `PadicFamilies` §4.0.3 uses" is not claimed. PadicFamilies §4.0.3 (open head): "Include the CM case through its induced-character decomposition and the corresponding elliptic-unit argument" with sources "Kato §§15.12–15.17"; a search of the PadicFamilies README for elliptic units, CM pairs, Kato's realizations or §15 finds only that sentence. Kato proves 12.4(1) and 12.5(3) for CM forms exactly through 15.9, 15.12.2, 15.13 and 15.17 (Kato lines 5738–5772), which are this roadmap's §§3.3, 7.3, 7.5, 7.8 and 8.2. Both suppliers precede this roadmap in the merge order and cannot cite it. The design planned this ownership: `design/README.md` lines 175 and 196 list `cm-h2-torsion` ("The CM case of Kato's Theorem 12.4: H² torsion and H¹ free of rank one") and `cm-kato-divisibility` ("Theorem 12.5(3), CM case") as targets of CZ.5–CZ.6, and the consumer CMRankZeroConverse (open head) imports "cm-h2-torsion … independent CM module structure" from this roadmap. The package dropped both (54 design targets, 50 in the package) and replaced them by the supplier citations above. The result is a cycle at the level of mathematics (KatoEulerSystems §4.4 CM ⇐ PadicFamilies §4.0.3 CM ⇐ elliptic-unit argument ⇐ this roadmap ⇐ KatoEulerSystems §4.4), invisible to the depcheck because the suppliers do not name this roadmap.

   Repair (tested on the instance `f = 32.2.a.a`, `p = 2`, where KatoEulerSystems §4.4 would be invoked through the contained case 15.14 that only §7.6 here provides):

   1. Add a target after §8.2, "The CM case of Kato's Theorem 12.4" (restore `cm-h2-torsion`): for a CM newform `f` and every `p`, `λ`, `H²(V(f))` is `Λ_ℚ`-torsion, `H¹(V(f))` is torsion-free of rank one, and at every height-zero prime `𝔭` of `O_λ[[G_∞]]`, with `q` its inverse image, the image of `z_{p∞f} ⊗ V_L(ψ)(−1)` generates `H¹_{p∞f}(V(ψ))_q` (Kato, 15.15, p. 265, Kato lines 5738–5753; contained case through §7.6). Route: §7.4 (free of rank one at `q`); §8.2 with KatoEulerSystems §4.2 (a character with `L_{{p}}(f*, χ, k−1) ≠ 0` makes the image nonzero in `H¹(T̃)_𝔭`, hence not in `aH¹_q`, hence a generator over the discrete valuation ring `A_q`); §7.8 at `q` (`p ∉ q`) gives `H²_{p∞f}(T)_q = 0`; §7.5(2) gives `H²(T̃)_𝔭 = 0`. *Needs:* §§7.4–7.8, 8.2; KatoEulerSystems §4.2. Three Checks: the zero module is torsion but not of rank one; `K = ℚ(i)`, `p = 2` passes through §7.6, not §7.5; at `k = 2` the trivial character may have `L(f, 1) = 0`, so a ramified twist is used.
   2. Scope, line 22: replace the sentence by "The CM case of Kato's Theorem 12.4 and of the inequality of Theorem 12.5(3) is proved here (§§7.8 and the new target); PadicFamilies §4.0.3 and KatoEulerSystems §§4.4, 7.2 are cited for non-CM forms only." Remove §4.4 and §7.2 from "From KatoEulerSystems" (keep §§4.2, 5.1, 5.3) and §4.0.3 from "From PadicFamilies".
   3. §8.4: "`H¹(V(f))`, torsion-free of rank one (new target)" (torsion-freeness suffices for the density argument: a nonzero element of a torsion-free rank-one module lies in `𝔭H_𝔭` for only finitely many height-one `𝔭`); §8.5 step 1: "by the new target"; §8.6: "Both modules are torsion (new target and §8.4)"; §7.8: "differs from the non-CM rational Euler-system bound of PadicFamilies §4.0.3". Update the Layer 8 Dependencies.
   4. Record in Scope, for the intake, that the CM clauses of KatoEulerSystems §§4.4, 7.2 and PadicFamilies §4.0.3 depend on this roadmap.

2. **F02** (P2) Layer 5 and §4.8(i) plan again what NoncommutativeAndEquivariantIwasawa §4.3 plans

   Location: §5.1 "Define the Coleman map `Col : U_∞ → Λ_Ô`"; §5.2 "`Col(𝒞̄_∞)^χ` generates … the `χ`-part of Katz's two-variable measure"; §5.3; §4.8(i); Scope and supplier contracts, which do not name NoncommutativeAndEquivariantIwasawa.

   Claim: these constructions and theorems are owned here.

   Witness: NoncommutativeAndEquivariantIwasawa README at its open head (earlier in the merge order), §4.3, "Construction (elliptic units and the two-variable `𝔭`-adic measure)", "Coleman map and the ideal comparison" (`Col_𝔣 : U_(𝔣,D) → A_D(𝔣)` on the ray tower `K(𝔣p^∞)`, image `J_𝔣`, the law `Col_𝔣(β(𝔞)) = (σ_𝔞 − N𝔞)ν_𝔣` for the elliptic-unit system, and `char((U_∞/C̄_∞)^χ)·A_D = (μ_χ)`), and "Theorem (Rubin's two-variable main conjecture)" (`char X_∞^χ = char (U_∞/C̄_∞)^χ` for every `χ`), all for `E/ℚ` with CM by `O_K` and `p ≥ 5` of good ordinary reduction (so `h_K = 1`, `p` split). The same objects (Coleman map, elliptic-unit/Katz identification, Katz form of the main conjecture) are §§5.1–5.3 and §4.8(i) here, which say nothing about the overlap.

   Repair (tested on `K = ℚ(i)`, `p = 5`, `E : y² = x³ − x`, which is in both roadmaps' hypotheses): in Scope ("It leaves the following to their owners") add "The Coleman map of the formal group of a rational CM curve on the ray tower `K(𝔣p^∞)`, its explicit reciprocity law in Coleman form, the identification of `char((U_∞/C̄_∞)^χ)` with the Katz measure and Rubin's two-variable main conjecture, for `E/ℚ` with CM by `O_K` and `p ≥ 5` of good ordinary reduction, are NoncommutativeAndEquivariantIwasawa §4.3." Add the supplier subsection "From NoncommutativeAndEquivariantIwasawa" (§4.3). In §§4.8, 5.1, 5.2 and 5.3 say in one clause how the kept statements differ (any abelian `K₀ ⊃ H` with `p ∤ [K₀ : K]`, any class number, inert and ramified `p` in 4.8(ii), the classical form at every `p`), cite §4.3 in their `*Needs:*` lines, and add a Check to §5.2 that for `E/ℚ`, `p ≥ 5`, the ideal equality is that of NoncommutativeAndEquivariantIwasawa §4.3, with the same moments (its measure `ν_𝔣` and AutomorphicPadicLFunctionsPartII §8.5's `μ_f` must agree on critical characters; a Check with one computed moment at `K = ℚ(i)`, `p = 5`, type `(1,0)` is the witness).

3. **F03** (P2) §5.1 uses Coleman power series of a relative Lubin–Tate group but cites a cyclotomic-only supplier

   Location: §5.1 "interpolates a norm-compatible family of local units by its Coleman power series for `F`, applies `(1 − φ/p)·dlog` … *Needs:* §4.7; ColemanPowerSeries Layers 1–2".

   Claim: ColemanPowerSeries Layers 1–2 supply Coleman power series for the relative Lubin–Tate formal group `F` of the CM curve over `Ô`.

   Witness: ColemanPowerSeries README (open head), Scope: "Class field theory, global class groups, the main conjecture, general Lubin–Tate interpolation and ramified arithmetic coefficient fields are outside this scope." Its Layers 1–2 are the cyclotomic theory on the chosen roots of unity. IntegralIwasawaTheory §§7.1–7.3 are likewise cyclotomic. NoncommutativeAndEquivariantIwasawa §4.3 extends the construction to `Ê` only for `E/ℚ`, `p ≥ 5`. The existence and uniqueness of Coleman power series for `F` under Rubin's general hypotheses (§4.7's `K₀`, `K_∞`) is used by the definition and owned by no one.

   Repair: state in §5.1, before the Coleman map, the target "Coleman power series for the relative Lubin–Tate group `F` over `Ô`": for a norm-compatible system `(u_n)` of principal units in the tower `F(F[𝔭^n])` there is a unique `g_u ∈ Ô[[X]]^×` with `g_u^{φ^{-n}}(ξ_n) = u_n` for the Tate-module basis `ξ`, with the norm-operator and logarithmic-derivative API (Yager, Chapter 3, Yager line 71; de Shalit, *Iwasawa theory of elliptic curves with complex multiplication*, Chapter I, §2.2 and §3, cited by locator and recorded `uncertified`), with three Checks (the constant system gives `g = 1`; the cyclotomic case is ColemanPowerSeries Layer 2; the inert case is excluded because `F` has height two). Cite NoncommutativeAndEquivariantIwasawa §4.3 for the case `E/ℚ`, `p ≥ 5`, and keep ColemanPowerSeries Layer 2 only in the cyclotomic Check. Add de Shalit to `sources.toml`.

4. **F04** (P3) Supplier drift in ComplexMultiplicationAndExplicitReciprocity citations

   Location: supplier contract "§1.1 (lattice curves and the ideal action `[a] ⋆ E_I = E_{a⁻¹I}` with the isogeny `φ_a` of degree `N(a)`), §1.3 (CM period and de Rham pairings)"; §2.2 and §2.3 `*Needs:*` ("§§1.1, 2.2, 3.2"); §3.1 `*Needs:*` ("§§1.3, 4.1"); Layer 2 and 3 Dependencies.

   Witness: ComplexMultiplicationAndExplicitReciprocity at its open head: §1.1 is "Rational CM twisting" (the quadratic self-twist isogeny) and delegates the ideal action to ImaginaryQuadraticClassNumber §H3.1; the Serre tensor by a CM ideal with `[c] : A → c⁻¹ ⊗ A` of kernel `A[c]` and the paragraph "CM period and de Rham pairings" are both in §1.2 "Serre tensor, Lie and period comparisons"; there is no §1.3.

   Repair: cite §1.2 for the ideal isogenies and for the period pairing, and ImaginaryQuadraticClassNumber §H3.1 (on main) for the lattice-ideal dictionary, in the supplier contract, §§2.2, 2.3, 3.1 and the two Dependencies lists.

5. **F05** (P3) Downstream consumers names a supplier that precedes this roadmap

   Location: "Downstream consumers": "The inert anticyclotomic main conjecture (InertAnticyclotomicCMMainConjecture) uses the elliptic units of §2.4 and the `χ`-part equality of §4.8(ii)."

   Witness: `merge-order/ORDER.txt` lists InertAnticyclotomicCMMainConjecture at line 219, before this roadmap (moved to #263 by the gate); its `design/plan.json` on the board does not mention ModularIwasawaMainConjecturesPartII. An earlier roadmap cannot consume this one; Scope already says nothing is exchanged with it. Also CMRankZeroConverse (open head) cites this roadmap as "§§CZ.4–CZ.6" with target ids `cm-contained-descent`, `cm-h2-torsion`, `cm-kato-main-conjecture`, the design's labels; that drift is the consumer's to repair, but the paragraph here should name the sections consumers can cite (§§6.2, 7.6, 8.6, 8.7 and the target of R01).

   Repair: delete the InertAnticyclotomicCMMainConjecture sentence and name the sections consumed by CMRankZeroConverse.

6. **F06** (P3) §1.4 constructs a map without Checks

   Location: §1.4 "Construct an `R`-linear map `h² → H²_{p∞f}(ℤ_p(1))` whose kernel and cokernel are finitely generated `ℤ_p`-modules".

   Witness: every other construction of the README carries a `**Checks.**` list; §1.4 has none, though the two correction terms it retains are exactly what a wrong definition would drop.

   Repair: add three Checks: for `K′` with two primes above `p` the Brauer term is the kernel of `ℤ_p² → ℤ_p`, of rank one, so `H²(O_{K′}[1/p], ℤ_p(1)) ≠ Pic(O_{K′}[1/p])[p^∞]`; for `K = ℚ(i)`, `p = 2` the base layer has `Cl = 1` and one prime above 2, so both terms vanish there; a finitely generated `ℤ_p`-module is killed by an ideal of height two of the three-dimensional `R`, so the localization at every height-one prime of either correction term is zero.

7. **F07** (P3) §4.2 does not cite the library's Tamagawa-number-conjecture predicate

   Location: §4.2 "prove the rational and integral Tamagawa number conjectures for `h⁰(F)` at `s = 0`".

   Witness: PeriodsAndSpecialValues (earlier in the merge order) PS.5.2 "The equivariant Tamagawa number conjecture as a predicate" and PS.6.5 "The Bloch–Kato Tamagawa number conjecture as a predicate" define the predicates; §4.2 restates the conjecture "in the form used" without naming them.

   Repair: cite PS.5.2 and PS.6.5 for the predicate and say that the form proved is Johnson-Leung–Kings' determinant identity, equivalent to the predicate for `h⁰(F)(0)` by their Theorem 2.6.

8. **F08** (P3) A second open pull request builds elliptic units

   Location: Scope, which names no other builder of elliptic units.

   Witness: EllipticCurvePeriodsAndModularParametrizations (open pull request, listed in the brief) constructs, in the one-variable `𝔩`-adic tower, "the norm limit of the closures of elliptic units … generated by norms of the CM values of the classical elliptic modular units in ray class fields" in Vatsal's and de Shalit's convention, with their distribution and norm relations.

   Repair: add one Scope sentence recording that this roadmap owns Kato's ideal-indexed elliptic units at every prime (§§2.2–2.6) and that the one-variable units of that roadmap are norms of the units of §2.4 along its tower, so that the intake can settle the ownership; no mathematics changes.

Files reviewed (read-only): `packages/ModularIwasawaMainConjecturesPartII/README.md` (857 lines), `Suggested.lean` (35 lines, no declaration), `metadata.toml`, `sources.toml` (8 sources, all `certified`). No previous review. The sources manifest was not changed: every text the README cites is already recorded, and no new source was needed.

Mechanical checks:

- Elaboration: `lake env lean` on `Suggested.lean` from the content checkout exits 0 with no output (the file has a module docstring and an empty namespace, so there is no `sorry` warning). The `#check @name` pass and the one-tactic padding probe have nothing to act on: the file declares nothing. That is the right shape here (see §7 below).
- Dependency direction: the gate printed

      moved: ModularIwasawaMainConjecturesPartII moved in the merge order from #219 to #263, right after its last supplier ModularIwasawaMainConjectures (KatoEulerSystems also came after it); checked as moved (the worker moves it there when it submits)
      depcheck: 205 roadmaps, 1762 edges, 0 problem(s)

  No UPWARD or CYCLE line. The `moved:` line is not a defect. Note that `KatoEulerSystems` has no README in the board checkout (only `sources.toml` and `reports`); its README was read at its pull-request head (board index: #163, head `9a2ec7c`). Its own supplier edges are therefore not in the depcheck graph, which is why the mathematical cycle of R01 is invisible to the gate.
- Declared gap `gap:height-one-explicit-reciprocity` (supplier PadicHodgeRegulators §1.4): present with the same slug in `design/plan.json` and in the README's supplier contracts. It is precise (the dual-exponential form of Kato's [KK3, Thm 4.3.1] with h = 1, hypotheses stated) and minimal: PadicHodgeRegulators §1.4 (Kato's dual exponential), §1.7 (twists, corestriction), §2.4 (cyclotomic Kummer classes) and §8.18 (Perrin-Riou's law) do not contain a relative-height-one law for a p-divisible group with `O_𝔭`-action; ColemanPowerSeries excludes Lubin–Tate interpolation (its Scope, "general Lubin–Tate interpolation … outside this scope"); NoncommutativeAndEquivariantIwasawa §4.3 states a Coleman-form reciprocity only for `E/ℚ`, `p ≥ 5` ordinary. Acceptance of a repaired package should remain conditional on this gap.

## Verified sound

Sources (sampled targets and flagged locators; every locator opened at its line):

- §1.1: Kato 15.6 (Kato lines 5293–5297: finite generation, vanishing outside degrees 1, 2) and 8.2 (lines 2490–2515: `H^q(R, 𝔄)` means `j_*`, vanishing above degree 2 for totally imaginary `K`); JLK Lemma 4.7 (JLK lines 935–943) and Lemma 4.3 (lines 861–875). Correct, hypotheses as stated.
- §1.5: JLK Lemma 4.3 and proof (lines 861–880, 1039–1045): the supported determinant `(1 − η(𝔩)Frob_𝔩⁻¹)⁻¹` at unramified `𝔩`. The limit sequence is derived here; recomputed below.
- §1.7: Kato 15.1 (lines 5189–5195: `h¹` torsion-free, one-dimensional at height-zero primes, `h²` torsion); BT lines 141–143; JLK Corollary 7.3 (lines 1427–1457). Correct.
- §2.3: Kato 15.3 and (15.3.1)–(15.3.3) (lines 5210–5241). Correct, including the uniqueness remark.
- §3.2: Kato (15.9.1)–(15.9.2) and proof (lines 5529–5571). Correct; the auxiliary-factor and ray-class re-indexing are as stated.
- §3.3: Kato Proposition 15.9 and proof (lines 5463–5527): reduction to `K′ = K(g)` and `γ = β^{⊗(−r)}`, the [KK3, 4.3.1] law with `h = 1`, good reduction by Serre–Tate. Correct; the gap statement matches lines 5495–5504.
- §4.4: JLK Definition 6.3, Theorem 6.4, Corollary 6.5 (lines 1248–1312), Lemma 4.6 (lines 915–932). Correct, hypotheses as stated (large level).
- §4.6: JLK Corollary 5.3 and proof (lines 1025–1045). Correct.
- §5.4: CGLS Theorem 1.2.2 with proof and Remark 1.2.3 (CGLS lines 394–421). Correct; the README's extra hypothesis `p ∤ h_K` is what Rubin's input needs (see Source issues).
- §6.2: BT Theorem 2.1 (BT lines 152–157) and footnote 3 (lines 185–186); JLK §7.2 (lines 1475–1495). The README's correction is right: JLK's regular-prime equality is for `H²(O_K[1/pf], Ω(1))` and `H¹(O_K[1/pf])/J_Ω(ζ(f))`, and Kato's `z` (lines 5288–5292) is generated by conductor-`p^n f` units only; see the computed row below.
- §7.2: Kato 15.10, Lemma 15.11(1) and its proof (lines 5572–5625), the paragraph on (15.11.3) (lines 5670–5676). Correct.
- §7.7: Kato Lemma 14.15 and proof (lines 4912–4931). Correct, including the codimension hypotheses; Kato's 15.17 proof prints "Lemma 14.12" (line 5769), as the README notes.
- §8.3: Kato 15.15 (lines 5738–5753) and BT lines 213–218. Correct.
- §8.5: Kato Proposition 15.17 and proof (lines 5762–5772), Lemma 15.13 (lines 5704–5730), 14.15. Kato's argument gives the inequality; the equality route of the README is verified in the table.
- §8.7: BT §§2.2.1–2.2.4 (lines 160–196) and proof of Theorem 3.1 (lines 231–249). Correct.
- Also opened: Kato 3.8 and (3.8.1)–(3.8.4) (lines 883–961, `E(0, τ, z, s)` vanishes at `s = 0`); Kato 12.4–12.5 (lines 4046–4080); Remark 12.8 (lines 4119–4129); Kato 15.4–15.5 (lines 5242–5292); JLK Definition 3.2, Proposition 3.3, Lemma 3.7, Theorem 3.9, Corollary 3.10 (lines 590–798), §4.1 (lines 802–827), Theorem 5.2 ("for all primes p with no exceptions", lines 1010–1024), Conjecture 5.5 and Theorem 5.7 (lines 1054–1090), §5.4 and Lemma 5.8 (lines 1091–1126); Rubin91 §4 and Theorem 4.1 with Remarks (1)–(2) (lines 495–571); Kriz Theorem 27 (lines 1034–1064); CGLS (2.11) (lines 834–837); Yager contents and Theorem 1 (lines 64–82, 201–205) and the class-number-one hypothesis (line 90); BT §2.1.1 and footnote 4 (lines 130–147, 228).

Pinned library declarations opened: `HeckeRing.GL2.Newform` (`TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`, namespace `HeckeRing.GL2`); `TauCeti.GlobalNumberFields.Modulus` (`…/RayClass/Modulus.lean:96`), `RayClassGroup` (`…/RayClass/Basic.lean:180`), `HeckeCharacter` (`…/HeckeCharacter/Basic.lean:70`), all in namespace `TauCeti.GlobalNumberFields`; `completedGroupAlgebra` (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`); no ray class field in Tau Ceti (only `cyclotomicArtin` and `ratModulusEquivGal` for cyclotomic moduli) and no Galois representation attached to a newform; Mathlib `Module.length` (`Mathlib/RingTheory/Length.lean:30`, the Krull dimension of the submodule lattice, as the README says), `IsLocalization.AtPrime` (`Mathlib/RingTheory/Localization/AtPrime/Basic.lean:50`), `Ideal.height` (`Mathlib/RingTheory/Ideal/Height.lean:35`), `NumberField.Units.regulator` and `regulator_ne_zero` (`Mathlib/NumberTheory/NumberField/Units/Regulator.lean:266, 289`), `NumberField.Units.torsion` (`…/Units/Basic.lean:145`), `NumberField.IsTotallyComplex` (`…/InfinitePlace/TotallyRealComplex.lean:209`), `cyclotomicCharacter` (`Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean:307`), `IsCyclotomicExtension` (`Mathlib/NumberTheory/Cyclotomic/Basic.lean:74`).

Cross-roadmap citations resolved at main or at the open heads (all present with the stated content unless listed in the findings): ClassFieldTheory §2.6 (arithmetic Frobenius), Layers 10, 11, 13; GlobalNumberFields Layers 2, 9, 10; ProfiniteProPGroups "Layer 9 prerequisites"; ModularForms Layers 4, 5, 7, 9; EllipticCurves Layers 1–2; ModularCurves Layers 0, 2; LFunctions Layer 7; PadicMeasuresIwasawaAlgebras §§4.1, 4.6, 5.1, Layer 1; SelmerIwasawaCohomology §§0.9, 0.10, 2.8, 3.0 (twists `Tw_κ(γ) = κ(γ)γ`, as in Conventions), 3.1–3.3, 3.7, 3.13 (cyclotomic, odd `p`, as the README says), 3.15, 3.17; ArithmeticGaloisDuality §§R02.4.3, R02.4.4, D7.5; IntegralIwasawaTheory §§2.6 (weak Leopoldt "for every K and p"), 10.0; EulerSystemsAndKolyvaginSystems §§2.2, 2.5, 8.1, 8.2, 8.6, 8.7, 8.14, 8.25 (no hypothesis on `p`), 8.37 (valid for `p = 2`); ComplexMultiplicationAndExplicitReciprocity §§2.2, 3.2, 4.1, 4.2; AutomorphicGaloisRepresentations §§1.5, 7.3; AutomorphicGaloisRepresentationsPartII AG2.0; AutomorphicLFunctionsAndLocalFactors AL.1.5–AL.1.6; PadicHodgeRegulators §§1.4, 1.7; AutomorphicPadicLFunctionsPartII §§3.3 (the conjugation identity reading `E(k, τ, z, s)` as `K^k` at `k + s/2` is correct), 3.4, 8.5 (ordinary split `p` only, as used); PadicFamilies §4.0.1; KatoEulerSystems §§4.2, 5.1 (`z^Ka`, conjugation law `z(ιγ) = −σ_{−1}z(γ)`), 5.3; ModularIwasawaMainConjectures §§0.1, 0.6, 0.7 (`KMC_rational`); NeronModelsAndSemistableAbelianVarieties §5.1; the 1 lead of the worker's citation scan (KatoEulerSystems §5.1) resolves at the package head `9a2ec7c`.

Ownership by object: Kato's length lemma (14.15), the CM comparison map, the descent lemmas and the ray-tower modules `h¹`, `h²`, `z` have no other owner on main, in the board packages or at the open heads given; the overlaps found are R01, R02, R08. "CM pair" in ComplexMultiplicationAndExplicitReciprocityPartII is the (CM algebra, type) pair of the Colmez conjecture, a different object.

Adversarial table (values computed on each side):

| Statement | Instances | Computed | Result |
|---|---|---|---|
| §0.1 `Δ` trivial for `ℚ(i)`, `p = 2`, `f = 1` | `ℤ_2[i]^×` | residue field `𝔽_2`, so `ℤ_2[i]^× = 1 + (1+i)ℤ_2[i] ≅ μ_4 × ℤ_2²`; quotient by the global `μ_4` is `ℤ_2²` | holds |
| §0.1 `Δ ≅ ℤ/4` for `ℚ(i)`, `p = 5` | `(ℤ_5^×)²/μ_4` | torsion `μ_4²/diag ≅ ℤ/4`, order prime to 5 | holds |
| §0.1 `Δ ≅ ℤ/8` for `ℚ(i)`, `p = 2`, `f = (3)` | `(μ_4 × ℤ/8)/⟨(i, i mod 3)⟩` | `i` has order 4 in `𝔽_9^×`; image of the order-8 generator has order 8 in the quotient of order 8, so cyclic `ℤ/8`, and `2 ∣ #Δ` | holds |
| §0.1 cyclotomic image, `ℚ(i)`, `p = 2` | `Gal(ℚ(μ_{2^∞})/ℚ(i))` | `ζ_4 = i` is fixed by `1 + 4ℤ_2`, index 2 in `ℤ_2^×` | holds |
| §0.2 `ξ(ℤ_p[[T]]/(p))` | after inverting `p` | module is zero, `ξ = (1)`; integrally `(p)` | holds |
| §0.2 `ℤ_2[ℤ/2]` | `x² − 1` | `(x−1)² = 2(x−1) − (x²−1)` ... ring is local with maximal ideal `(x−1, 2)`, not a product; `ℤ_2[ℤ/2][1/2] ≅ ℚ_2²` by idempotents `(1 ± x)/2` | holds |
| §0.2 `ξ` records lengths | `ℤ_p[[T]]/(T²)` vs `(ℤ_p[[T]]/(T))²` | both have length 2 at `(T)`, `ξ = (T²)`; not isomorphic (cyclic vs not) | holds |
| §1.1 `H⁰_{p∞f}(ℤ_p(1)) = 0` | finite levels `μ_{p^∞}(K′)` finite | corestriction on invariants is multiplication by the degree, which runs through all `p`-powers in a `ℤ_p`-direction; inverse limit of a finite group under maps divisible by growing `p`-powers is 0 | holds |
| §1.1 semilinearity | `χ(g) = −1` | `g·(x ⊗ t) = gx ⊗ χ(g)t`, so `φ(gx) = χ(g)⁻¹gφ(x) = −gφ(x)`; the opposite convention agrees only when `χ(g)² = 1` | holds |
| §1.5 limit sequence | localization triangle at each layer | `H²_Z = ⊕_{w∣𝔩} ℤ_p` with corestriction = multiplication by residue degrees, unbounded `p`-powers since `Frob_𝔩` has infinite order: limit 0; `H³_Z = ⊕_w H¹(κ(w), ℤ_p) = ℤ_p[G_{K′}/D]` with corestriction an isomorphism (`cores ∘ res = f` and `res` is multiplication by `f` on `Hom(Ẑ, ℤ_p)`): limit `ℤ_p[[G/D_𝔩]]`; `H¹_p = H¹_{pf}` and the four-term sequence follow | holds |
| §1.5 `ℚ(i)`, `p = 5`, `f = (3)` | `I_{(3)}` | `3` inert, `(O_K/3)^× = 𝔽_9^×` cyclic of order 8; diagonal `μ_4` meets `{1} × 𝔽_9^×` trivially, so `I ≅ ℤ/8`; on components trivial on `I`, `1 − Frob⁻¹` is a non-unit (infinite order) | holds |
| §1.5 not pseudo-null | `ℤ_p[[G/D_𝔩]]` | `G/D_𝔩` has `ℤ_p`-rank 1, module of Krull dimension 2 in a ring of dimension 3 | holds |
| §1.7 rank one | Tate's formula per layer | `K′` totally imaginary, `rank T = 1`: `rank H¹ − rank H² = r₂(K′) = [K′ : K]`, so rank one over `R` after §1.6 | holds |
| §1.7 zero module | `h¹ = 0` | torsion-free, rank 0 ≠ 1: the two assertions are independent | holds |
| §2.2 uniqueness | ratio `u` constant | `N_b(u) = u^{b²}`; `u³ = u⁸ = 1` gives `u = 1`; cube root of unity passes `b = 2`, fails `b = 3` (`u⁸ = u² ≠ 1`) | holds |
| §2.2 degree of divisor | `N(a)(0) − E[a]` | `#E[a] = N(a)`, degree 0; `E[a]` of odd order sums to 0, so principal | holds |
| §2.2 unrestricted isogeny law | `q : E → E/E[a]` | pushes the divisor to `N(a)(0) − N(a)(0) = 0`: norm constant, cannot be `aθ` | holds (refutes the printed (15.4.2)) |
| §2.3 `ℚ(i)`, `f = (3)` | `μ_4 → 𝔽_9^×` | injective, `[K(3) : K] = 8/4 = 2` | holds |
| §2.3 `f = (1+i)³` | `(O_K/f)^×` | order 4; `v(i−1) = 1`, `v(i²−1) = v(−2) = 2 < 3`, so `i` has order 4 mod `f`, injective, `K(f) = K`; `4·8 = 32` | holds |
| §2.4 sign of (15.5.1) with `a z_f = θ(α)⁻¹` | `f = 𝔩` prime, `χ = 1` | right side `(N(a) − 1)·ζ_K(0)·log N𝔩 < 0`; `α` reduces to 0 above `𝔩` where `θ` vanishes to order `N(a)`, so `θ(α)⁻¹` has negative log-norm | consistent |
| §2.5 inverse detected | `a = (5)`, `χ(a) = i` | `25 − i⁻¹ = 25 + i` vs `25 − i` | holds |
| §2.6 non-zero-divisor | `N(a) − σ_a` | `R ⊂ ∏_χ O′[[Γ]](χ)`; each component nonzero because `N(a) − η(σ_a) ≠ 0` for every finite-order `η` (`N(a) > 1` is not a root of unity) | holds |
| §2.7 nonvanishing | `η` nontrivial finite order | `L(η, s)` has a simple zero at 0, leading term `L′(η, 0) ≠ 0 ⟺ L(η̄, 1) ≠ 0`; removed factors `1 − η(𝔩)` at `𝔩 ∣ pf` are nonzero by the choice of `η` | holds |
| §3.1 Frobenius eigenvalue | `𝔮 = (2+i)` | `|ψ(𝔮)| = √5`, eigenvalue `ψ(𝔮)⁻¹` of absolute value `5^{−1/2}` | holds |
| §3.2 auxiliary factor | `r = 1`, `N(a) ≥ 2` | `|N(a) − ψ(a)χ(a)⁻¹| ≥ N(a) − √N(a) > 0` | holds |
| §3.2 vanishing factor | `r = 2`, `a = (c)` | `ψ((c)) = c² = N(a)`, factor 0 at `χ = 1` | holds |
| §3.2 split `𝔮`, `r = 2` | `𝔮^h = (π)` | `(ψ(𝔮)/N𝔮)^h = ε π²/(ππ̄) = ε π/π̄`, a root of unity only if `(π) = (π̄)`, i.e. `𝔮 = 𝔮̄` | holds |
| §3.3 Hecke value identity (used in §8.2) | split `ℓ = 𝔩𝔩′`, `𝔩 ∣ f` | `f` has `a_ℓ = ψ(𝔩′) ≠ 0`; `L_{pf}` omits `𝔩` (factor 1 anyway, `ψ̄` ramified) and keeps `𝔩′`; `L_{{p}}(f*)` keeps `(1 − ψ̄(𝔩′)χ(ℓ)ℓ^{−s})`: equal; inert and ramified primes agree likewise; primes above `p` omitted on both sides | holds (needs `f` = conductor, as stated) |
| §4.2 `ζ_{ℚ(i)}(0)` | `h = 1`, `w = 4`, `R = 1` | `−1/4`: unit for odd `p`, valuation `−2` at 2 | holds |
| §4.5 `p ∤ #μ(H)` | `ℚ(i)`, `ℚ(√−3)` | `μ_4`, `μ_6`: excludes 2, resp. 2 and 3 | holds |
| §4.7/4.8 decomposition modules | `O_p[[G_f/D_v]]`, `v ∣ p` | `G_f/D_v` finite (JLK Lemma 4.6), module finitely generated over `O_p`, pseudo-null in dimension 3 | holds |
| §4.8 Example | `ℚ(√−7)`, `p = 2` | `−7 ≡ 1 mod 8`: split; `μ(H) = μ_2`, excluded by Rubin, covered by JLK | holds |
| §5.4 `p ∤ #O_K^×` | `p > 2` split | `#O_K^× ∈ {2, 4, 6}`; 3 divides only for `ℚ(√−3)`, where 3 ramifies | holds |
| §5.4 Example | `ℚ(√−2)`, `p = 3` | `−2 ≡ 1 mod 3`, a square: split | holds |
| §5.5 involution | `ι(T) = (1+T)⁻¹ − 1` | `= −T(1+T)⁻¹`, `λ = 1` on both sides | holds |
| §6.2 correction of BT 2.1 | `ℚ(i)`, `p = 5`, `f = (3)`, trivial component | JLK: `length(h¹/z)_q = length(H²_{pf})_q = length(h²)_q + length(ℤ_5[[G/D_{(3)}]])_q`, last term positive at the prime generated by `1 − Frob_{(3)}⁻¹` (order-infinite Frobenius, `I_{(3)}` trivial on this component); so `ξ(h²_ℚ) ≠ ξ((h¹/z)_ℚ)` | README correct; printed BT 2.1 and Kato 15.2(2) overclaim |
| §7.1 non-CM witness | 11.2.a.a | `|d_K| ∣ 11` forces `ℚ(√−11)`, `−11 ≡ 5 mod 8` so 2 inert, but `a_2 = −2 ≠ 0` | holds |
| §7.2 uniqueness | automorphism of irreducible induction | scalar `c ∈ L_λ^×`, forced to 1 by the de Rham normalization | holds |
| §7.5 residue hypothesis | `p ∉ 𝔭` | residue field of characteristic 0, so 2 and `#Δ` invertible | holds |
| §7.6 classification | `ℚ(μ_{p^∞})` | odd `p`: unique quadratic subfield `ℚ(√p*)`, imaginary iff `p ≡ 3 mod 4`; `p = 2`: `ℚ(i), ℚ(√2), ℚ(√−2)`, `ζ_8 + ζ_8³ = i√2` | holds |
| §7.7 Check | `A = ℤ_p[[T]]`, `M = A/(T)`, `a = p` | `M_{(p)} = 0` (`T` a unit there), `M/pM = 𝔽_p`, `M[p] = 0`, right side `1·[A/(T,p)] = [𝔽_p]` | holds |
| §7.8 primes above `p` | condition (b) | `−1 ∈ μ(H)`, so (b) forces `p` odd; §7.5's residue hypothesis then holds when `p ∤ #Δ` | consistent |
| §8.3 killing Euler terms | `g ∈ I_𝔩`, `q′ ⊂ q`, `p ∉ q` | `g^n = 1` gives `∏(g − ζ) ∈ q′`, some `g − ζ ∈ q′`; `ζ − 1 ∈ q ∩ O_λ = 0` since `p ∉ q`; twisted module killed by `χ_T(g)⁻¹ − 1 ∈ O_λ∖{0}`, a unit in characteristic 0; `ψ∣_{I_𝔩} ≠ 1` because `𝔩` divides the conductor | holds |
| §8.5 dimension of `A` | `q` over height-one `𝔭` | kernel of `O_λ[[G_{p∞f}]] → O_λ[[G_∞]]` has height 1 and is principal at `q` (15.13(1)); `A/aA = O_λ[[G_∞]]_𝔭` of dimension 1, so `dim A = 2` | holds |
| §8.5 step 4 | `A ⊂ H ⊂ Frac(A)`, `H_{(a)} = A_{(a)}` | `ah = x ∈ A`, `h = y/s` with `a ∤ s`: `xs = ay`, `a` prime, `a ∣ x`, so `h ∈ A`; `M₂[a] = 0` | holds |
| §8.5 bookkeeping | `M₁ = H²_q`, `M₂ = H¹_q/Az` | 14.15 with `C` = finite length: `ℓ(M₁/a) − ℓ(M₁[a]) = ℓ(M₂/a) − 0`; `H¹(T̃)_𝔭/Z` is an extension of `M₁[a]` by `M₂/a` (15.13.2); so `ℓ(H¹(T̃)_𝔭/Z) = ℓ(M₂/a) + ℓ(M₁[a]) = ℓ(M₁/a) = ℓ(H²(T̃)_𝔭)` | equality holds; Kato's inequality is the same computation with `≤` |
| §8.5 Check | regular local `(x, y)`, `M = A/(y)`, `a = x` | `M/xM = A/(x,y)` of length 1, `M[x] = 0`, right side `1·1` | holds |
| §8.6 descent of `ξ` | `O_λ[[G_∞]] → O_v[[G_∞]]` | finite free, faithfully flat; lengths multiply by residue degrees uniformly | holds |
| §8.7 central character | `k = 2`, odd `p` | `σ_c ↦ c⁻¹`, quotient `O_λ` of characteristic 0; on `Δ = μ_{p−1}` it is `ω⁻¹` | holds |
| Conventions `Tw_χ` | SelmerIwasawaCohomology §3.0 | `Tw_κ(γ) = κ(γ)γ` there; `x ↦ x ⊗ t_χ` is `Tw_{χ⁻¹}`-semilinear as computed above | agree |
| Suggested.lean headline list | five headlines | newform Galois representation, ray class fields, two-variable Iwasawa cohomology, Katz measure, two-variable Coleman map: none at the pins (greps above) | docstring correct; nothing statable |

Headline theorems and padding: the README's headlines are Kato's main conjecture for CM newforms (§8.6), the rational equivariant main conjecture (§6.2), Johnson-Leung–Kings' theorem (§4.5), Rubin's theorem (§4.8) and the Katz form with its anticyclotomic components (§§5.3–5.4). Each is named in the module docstring with the carrier it lacks, and each lack was confirmed at the pins. No declaration, so no padding and no stand-in.

Shape and style: README shape as upstream (Summary, Scope, Conventions, supplier contracts, build, eight layers with Examples and Dependencies, consumers, worked examples, references); mathematics in Unicode, no LaTeX delimiters, no process words, no pull-request numbers, no target tables, no `lemma`; every target carries a locator; every definition except §1.4 has at least three discriminating Checks; `Needs:` lines are per target.

## Not verifiable

- Yager, Theorem 1 (Yager line 201) and Chapters 3 and 8: the OCR of the thesis is too garbled to confirm the hypothesis `p ≥ 5` with good reduction above `p` stated in §5.2 beyond the class-number-one hypothesis (Yager line 90). The citation of Rubin91 Remark (1) (Rubin91 lines 556–562) for the full generality is readable and supports §5.2.
- Rubin91 is an OCR of an image scan; Theorem 4.1 and the Remarks (lines 545–571) are legible, but the statements of Theorems 3.3, 9.2–10.6 referred to in §4.8's route were not checked.
- Kato (15.9.1)–(15.9.2), (15.4.4) and (15.5.1) (Kato lines 5266, 5280, 5530–5536) are legible only in part; the sign of (15.5.1) was checked by the valuation computation in the table rather than from the text. Whether Kato's displayed `L_{pf}(ψ, χ, r)` in 15.9 carries a bar lost by the OCR could not be decided; the README's `ψ̄`, consistent with (15.12.2) and Theorem 12.5(1), is the value the lattice sum gives.
- Ownership against open pull requests whose files the brief does not give was not checked; the open heads named in the brief were searched with the roadmap grep for elliptic units, Yager, Johnson-Leung, Kronecker's limit formula, Katz measures, CM pairs, Kato's length lemma and the Tamagawa number conjecture.

## Source issues

- **Error** in BT at Theorem 2.1, printed page 4: the source says the characteristic ideals of `h²_ℚ` and `(h¹/z)_ℚ` are equal for every nonzero `f`; it should include the Euler-factor modules `ℤ_p[[G/D_𝔩]]` at `𝔩 ∣ f`, `𝔩 ∤ p` (equivalently use `H²` over `O_K[1/pf]`, as Johnson-Leung–Kings §7.2 do); affects a stated result (Theorem 2.1; Theorem 2.6 is unaffected because `f` is the conductor of `ψ` there).
- **Error** in Kato at Theorem 15.2(2), printed page 251: the source says that under (b) and (c) the lengths of `h²` and of `h¹/z` agree at every height-one prime, with `z` generated by the units of conductor `p^n f`; it should allow the Euler-factor modules on components where inertia at `𝔩 ∣ f`, `𝔩 ∤ p` acts trivially, since Rubin's elliptic units include all conductors dividing `f`; affects nothing in §15, which uses it only on `ψ`-components with `f` the conductor.
- **Gap** in BT at the proof of Theorem 2.6, printed page 5: the source says the CM case of Kato's rational main conjecture follows from Theorem 2.1 through Kato §15; it should add the length-lemma argument of Lemma 14.15 run in both directions, since Proposition 15.17 as proved gives only an inequality; affects the proof.
- **Misprint** in Kato at the proof of Proposition 15.17, printed page 265: the source says "Lemma 14.12"; it should be Lemma 14.15; affects nothing.
- **Misprint** in Kato at (15.4.2), printed page 252: the source says the norm along any `O_K`-linear isogeny carries `aθ_E` to `aθ_{E′}`; it should require the degree prime to `N(a)` (the quotient by `E[a]` sends the divisor to zero); affects nothing.
- **Gap** in CGLS at Theorem 1.2.2, printed page 8: the source says Rubin's main conjecture identifies the characteristic ideal of the Greenberg Selmer group with the anticyclotomic Katz projection; it should state the hypothesis `p ∤ [K_θ H : K]` (so `p ∤ h_K`) that Rubin's Theorem 4.1 needs, or cite Johnson-Leung–Kings for `p ∣ h_K`; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6ae14d633d88e49447521522e58fb7c5c7f756e7", "job": "REV-PKG-ModularIwasawaMainConjecturesPartII", "model": "fable", "worker": "chris-x13"} -->
