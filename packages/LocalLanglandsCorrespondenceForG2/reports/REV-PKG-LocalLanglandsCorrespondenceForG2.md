<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2382#issuecomment-6670390853 -->
Review (claude) of 8465ee4

Verdict: needs_changes

1. **F01** (P1) Griess's conjugacy theorem for G₂ is used without an owner

   **Location.** `README.md` line 146 (§0.4, route): "elements of G₂(ℂ) that are conjugate in GL₇(ℂ) are conjugate in G₂(ℂ) (the conjugacy theorem cited in GS Lemma 2.4(iii)), and acceptability of G₂ for the reductive Zariski closure". Also line 125 (§0.2 route, "The conjugacy theorem for G₂ cited in GS Lemma 2.4"), line 203 (§0.9, through Chenevier's Theorem E) and line 213 (§0.10, through Chenevier's Theorem 6.4).

   **Claim.** The injectivity of v on Φ(G₂) (§0.4), of j modulo duality (§0.2), the uniqueness in §§0.9–0.10 and the gamma-factor characterization (§3.13) all rest on the theorem that two homomorphisms into G₂(ℂ) with completely reducible seven-dimensional image that are GL₇(ℂ)-conjugate are G₂(ℂ)-conjugate.

   **Witness.** No layer states it and no supplier section is cited for it: ExceptionalThetaCorrespondencesForG2 §0.6 (inclusions and centralizers) does not contain it. The sources all defer to Griess: GS line 213–214 names "Greiss [Gr95]" as a group-theoretic input of the construction; HKT line 913 ("By [Gri95], this implies that ρ, ρ′ are themselves G₂-conjugate"); C line 2239 (the uniqueness in Theorem 6.4 "is a consequence of a result of Griess [Gri95, Thm. 1]"). The packaging report says Griess was dropped from the manifest and "no locator inside Griess is relied on"; a citation of a citation is not a supplier.

   **Repair.** Add a Layer 0 target, before §0.2, "Griess's conjugacy theorem for G₂": for a group Γ and homomorphisms ρ, ρ′ : Γ → G₂(ℂ) whose seven-dimensional representations v ∘ ρ, v ∘ ρ′ are completely reducible, v ∘ ρ ≅ v ∘ ρ′ implies that ρ and ρ′ are G₂(ℂ)-conjugate; and the elementwise form used by Chenevier (Griess, *Basic conjugacy theorems for G₂*, Invent. Math. 121 (1995), Theorem 1; C, Theorem 6.4 proof, p. 149). Give it three Checks (the trivial homomorphism; the principal SL₂ whose v-image Sym⁶ determines it; the A₂ image where v ∘ j ∘ φ_τ ≅ v ∘ j ∘ φ_τ∨ forces the duality conjugacy of §0.2). Cite it from the routes of §§0.2, 0.4, 0.5, 0.9, 0.10 and 3.13, and add Griess to `## References`. This review added the manifest entry `Griess` (status `uncertified`, DOI 10.1007/BF01884298, locator Theorem 1, cited for 0.4) through the sources service: the service found no legal text, so the theorem is cited by its locator alone.

2. **F02** (P2) The residue-characteristic-three statement is an injection in the wrong direction

   **Location.** `README.md` line 609 (§4.2): "for p = 3 it is an injection Irr(μ₃) → L⁻¹(φ) that is a bijection onto L⁻¹(φ) whenever both division lifts are nonzero"; line 619 (§4.3): "For p = 3 prove the corresponding injection"; line 829 (§7.1): "for p = 3 ... a natural injection Irr(S_φ) → L⁻¹(φ) that is a bijection for the subregular parameter".

   **Claim.** At p = 3 every label of Irr(S_φ) is realized by a distinct member of the fibre.

   **Witness.** GS Proposition 3.2 (GS lines 606–608): "For p = 3, we only know that there is an injection L⁻¹(φ) ↪ Irr(S_φ)". The proof (GS lines 664–667) says the nonvanishing of π_η at p = 3 is known only for η trivial or φ subregular, and L⁻¹([φ]) = {π_η}. An injection Irr(μ₃) → L⁻¹(φ) asserts exactly the unknown nonvanishing of both division lifts; the package's own Check at line 615 ("the division lift may vanish, and the statement does not assert that all three labels occur") contradicts the statement above it.

   **Repair.** In §4.2 write: for p = 3 the labelling (split lift ↦ 1, nonzero lifts from PD₁× and PD₂× ↦ χ, χ⁻¹) is an injection L⁻¹(φ) → Irr(μ₃), bijective whenever both division lifts are nonzero. In §4.3: an injection L⁻¹(φ) → Irr(S₃) with the same labels, bijective when the division lift is nonzero. In §7.1: "a natural injection L⁻¹(φ) → Irr(S_φ) that is a bijection for the subregular parameter". Keep the Checks.

3. **F03** (P2) The Langlands–Shahidi spin factor of PGSp₆ is requested from a second supplier

   **Location.** `README.md` lines 72–75 (contract on AutomorphicLFunctionsAndLocalFactors, gap:pgsp6-shahidi-spin-factor, "Layer AL.4"); `design/plan.json` gap `pgsp6-shahidi-spin-factor` (supplier AutomorphicLFunctionsAndLocalFactors, section "Layer AL.4"); consumed at §2.4 line 375 and §6.1 line 736.

   **Claim.** The degree-eight Shahidi spin L-, ε- and γ-factors of generic representations of PGSp₆(F) are to be built by AutomorphicLFunctionsAndLocalFactors.

   **Witness.** ExceptionalThetaCorrespondencesForG2, this roadmap's supplier (merge order line 311), already requests the same object from AutomorphicLFunctionsAndLocalFactorsPartII: its README line 112 declares gap:ramified-spin-factor ("construct Shahidi's degree-eight L(s,σ,Spin) from the Heisenberg parabolic P₄ of split F₄ ...") and its §8.9 (line 1480) consumes it; this roadmap's §6.1 consumes that very §8.9. AutomorphicLFunctionsAndLocalFactors Layer AL.4 (its README lines 2649–2746: Satake factors, Weil–Deligne normalization) has no Langlands–Shahidi theory; AutomorphicLFunctionsAndLocalFactorsPartII at #1756 has none either yet, so the two gaps would make two suppliers build one object.

   **Repair.** Repoint the gap to AutomorphicLFunctionsAndLocalFactorsPartII (earlier in the merge order), in the contract heading, the gap sentence and `plan.json`, and say that it extends gap:ramified-spin-factor of ExceptionalThetaCorrespondencesForG2 (same F₄ Heisenberg-parabolic construction) by the γ- and ε-factors, the quadratic-twist rule, holomorphy of L(s, σ, spin) in Re s > 0 for tempered σ and the global functional equation. Update the Needs lines of §§2.4, 6.1 and the Dependencies of Layers 2 and 6 accordingly.

4. **F04** (P2) gap:poincare-weak-containment is compound and half of it is already declared on the same supplier

   **Location.** `README.md` line 85 (contract on AutomorphicFormsOnReductiveGroups); `design/plan.json` gap `poincare-weak-containment`; consumed at §1.3 line 263 and §1.6 line 293.

   **Claim.** One gap asks for (a) the Sakellaridis–Venkatesh Poincaré-series weak containment for quaternion stabilizers and Whittaker data and (b) "the real isolation statement that a unitary representation with discrete-series infinitesimal character sufficiently far from the walls is a discrete series, with an explicit bound".

   **Witness.** (a) and (b) are unrelated theorems (SV lines 11075–11080 and 11239–11246 for (a); GS lines 1038–1040 for (b)). ExceptionalThetaCorrespondencesForG2 README line 120 already declares (b) on the same supplier as gap:regular-real-unitarity, for exactly the groups §1.6 needs: "For each of split G₂(ℝ) and split PGSp₆(ℝ) ... there exists C ≥ 0 ... every irreducible unitary Harish–Chandra module with real integral discrete-series infinitesimal character Λ and ⟨Λ, α∨⟩ > C for every positive root α is a discrete-series module".

   **Repair.** Restrict gap:poincare-weak-containment to (a) in the README and `plan.json`. For (b), declare gap:regular-real-unitarity on AutomorphicFormsOnReductiveGroups (Layer 2, §2.4) with the same sentence as ExceptionalThetaCorrespondencesForG2's, so that the intake sees one contract, and cite it in the Needs of §1.6 (and §6.4, which uses "discrete series far from the walls").

5. **F05** (P3) The module docstring says the pins have no local Weil group

   **Location.** `Suggested.lean` lines 16–19: "neither library has the local Weil group `W_F` of a `p`-adic field, Weil–Deligne or `L`-parameters, the category of smooth representations of `G₂(F)` or the group `G₂(F)`".

   **Claim.** W_F is missing at the pins.

   **Witness.** Tau Ceti at the pin has it: `TauCeti.ClassFieldTheory.localWeilGroup` and the topological type synonym `WeilGroup K` with `weilDegree` (`TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean`, lines 91, 181, 235) for a nonarchimedean local field K. The headline theorems remain unstatable because G₂(ℂ) (no automorphism group of `TauCeti.Octonion` as a linear algebraic group, no comparison with `spinGroup`), G₂(F), smooth representations and parameters are missing.

   **Repair.** Rewrite the two "not statable" reasons: the Weil group exists at the pin (`TauCeti.ClassFieldTheory.WeilGroup`); what is missing is G₂(ℂ) and its inclusion into Spin₇(ℂ), the group G₂(F), its smooth representations and the parameter sets.

6. **F06** (P3) The norm-character convention is labelled "geometric" and disagrees with the cited rec

   **Location.** `README.md` line 26 (Conventions): "W_F is its Weil group, normalized by the geometric reciprocity of ClassFieldTheory, Layer 9, and |w| = q^(−deg w) with arithmetic Frobenius of degree one".

   **Claim.** The convention comes from a geometric reciprocity.

   **Witness.** ClassFieldTheory Layer 9 fixes the arithmetic normalization (`TauCetiRoadmap/ClassFieldTheory/README.md` line 1534: "which fixes the arithmetic normalization"; line 114). The formula |w| = q^(−deg w) is ExceptionalThetaCorrespondencesForG2 §0.7's convention (its README line 270), but EndoscopicTransferAndUnitaryTraceComparison §10.1, cited for rec, uses ω(w) = q^{deg w} with geometric Frobenius of degree −1 (its README line 3600), the inverse character. No computed value in this README depends on the sign (every eigenvalue list is symmetric), but §§3.2, 3.5, 3.6 and 9.3 compose rec with |·|^{±1/2} without saying which character is meant.

   **Repair.** Replace "geometric" by "arithmetic", and add one sentence: rec of EndoscopicTransferAndUnitaryTraceComparison §10.1 is transported to this convention through the LP-normalized conversion of ExceptionalThetaCorrespondencesForG2 §0.7 (its |w| equals ω(w)⁻¹ of §10.1).

7. **F07** (P3) "Chebotarev density" in a Needs line has no owner

   **Location.** `README.md` line 203 (§0.9): "*Needs:* §0.4; AutomorphicGaloisRepresentationsPartII, AG2.2 and AG2.5; Chebotarev density."

   **Witness.** The completed roadmap Chebotarev on main owns it (`Completed/Chebotarev/README.md`, Layer 10 "Dirichlet-density Chebotarev", Layer 14 "natural density and consistency theorems"); it is not named. §5.2 (line 675) and §8.2 (line 896) also use Chebotarev without a citation.

   **Repair.** Cite "Chebotarev, Layer 10" in the Needs of §§0.9, 5.2 and 8.2 and list it in the Dependencies of Layers 0, 5 and 8.

8. **F08** (P3) Three definitions have no Needs line

   **Location.** `README.md` §0.6 (lines 164–178), §1.1 (lines 233–245), §1.2 (lines 247–259).

   **Witness.** Every other section of the README carries `*Needs:*`; these three definitions (weak equivalence of Spin₇-parameters; L²_D; L²_(ψ,σ)) do not, although they consume ExceptionalThetaCorrespondencesForG2 Layer 0 (parameters), Layer 9 (§9.1 pointwise stabilizers) and AutomorphicFormsOnReductiveGroups Layers 0 and 4 (§§4.2–4.3), SmoothRepresentationsOfLocalGroups SR.2.3 (Whittaker functionals).

   **Repair.** Add the three Needs lines with those items.

9. **F09** (P3) gap:pgsp6-similitude-theta-tables bundles an archimedean theorem with the nonarchimedean tables

   **Location.** `README.md` line 69, last clause: "and the matching at complex places (Adams–Barbasch)"; `design/plan.json` gap `pgsp6-similitude-theta-tables`.

   **Witness.** The other three clauses are the explicit nonarchimedean similitude tables at MetaplecticAutomorphicForms §§3.41–3.42; the Adams–Barbasch matching is a theorem about complex groups (GS lines 789–792) used only in §2.3 and §2.4 at the complex places of a totally complex globalization.

   **Repair.** State the complex-place matching as its own sentence of the contract (same supplier, a separate slug such as gap:pgsp6-pgso8-complex-theta, section §3.34), consumed by §§2.3–2.4.

Independent review of `packages/LocalLanglandsCorrespondenceForG2/README.md`, `Suggested.lean`, `metadata.toml` and `sources.toml` against the pinned Mathlib and Tau Ceti, main, the open heads of the suppliers (ExceptionalThetaCorrespondencesForG2 at #1736, SmoothRepresentationsOfLocalGroupsPartII at #1815, MetaplecticAutomorphicForms at #1063, ModularityAndLanglandsExtensions at #1180, EndoscopicTransferAndUnitaryTraceComparison at #999, AutomorphicLFunctionsAndLocalFactors at #924 and its Part II at #1756, SmoothRepresentationsOfLocalGroups at #1688, AutomorphicFormsOnReductiveGroups at #1037, AutomorphicSpectralTheory at #925, AutomorphicGaloisRepresentationsPartII at #1006) and the eleven cached sources. No previous review of this package exists.

Nine findings, four blocking (one P1, three P2), five P3. The mathematics of the sampled targets agrees with the sources at the cited locators except for the direction of the residue-characteristic-three statement (R02). The Lean file elaborates with `sorry` as its only warning and contains no padding.

## Verified sound

**Principles.** No route-specific shortcut (the p ≠ 3 restrictions are the source's and are stated as such); no re-planning (the theta correspondences, Arthur/Xu packets, GL_n correspondence and similitude theta are imported by section); supply is downward (depcheck below); no copied passages (spot-checked the sampled sections against GS); no algorithms; no sorry'd data; no `set_option`; the import header is the single `import Mathlib`.

**Dependency check.** Run as instructed; output:

```
depcheck: 241 roadmaps, 2418 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Merge order: SmoothRepresentationsOfLocalGroupsPartII line 310, ExceptionalThetaCorrespondencesForG2 line 311, this roadmap line 312; MetaplecticAutomorphicFormsPartII (line 321) is correctly not cited.

**Elaboration.** `lake env lean packages/LocalLanglandsCorrespondenceForG2/Suggested.lean` from the content checkout: exactly one message, `warning: declaration uses 'sorry'` at line 55. No Tau Ceti module is imported, so nothing was built. Elaborated types (scratch `signatures.md`): `sumSquaresSeven : QuadraticForm ℂ (Fin 7 → ℂ)`; `spin7_not_acceptable : ∃ Γ x, ∃ (_ : Finite Γ), ∃ r r', (∀ γ, IsConj (r γ) (r' γ)) ∧ ¬∃ g, ∀ γ, r' γ = g * r γ * g⁻¹`, matching README §0.8; there are no section variables, so no binder can have been lost.

**One-tactic probe.** On a scratch copy with `first | rfl | simp | infer_instance | (exact fun _ => trivial)` in place of the `sorry`: `simp` rewrites the goal and leaves it unsolved (error "unsolved goals"); no tactic closes it. Not padding. The only definition, `sumSquaresSeven`, has a real body on a native carrier and is needed to name Spin₇(ℂ).

**Headline theorems (README summary) and their status in `Suggested.lean`.**

| Headline | Statable at the pins? | In the file? |
|---|---|---|
| Spin₇(ℂ) unacceptable (§0.8) | yes, `spinGroup sumSquaresSeven` | stated (`spin7_not_acceptable`) |
| LLC for split G₂, GS Main Theorem (§7.1) | no: G₂(F), smooth representations, G₂(ℂ) | named in docstring (reason to correct, R05) |
| generic supercuspidal correspondence (§7.2) | no | named |
| characterization by G₂ × GL_r gamma factors (§§3.12–3.13) | no | named |
| exceptional spin identity (§5.6), partial enhanced PGSp₆ correspondence (§7.3) | no | named |
| weak LLC for PGSp₆ and its fibres (§§10.1, 10.9) | no | named |
| global–local compatibility (§3.15) | no | named |
| standard injectivity and quadratic rigidity (§§0.4–0.5) | no: G₂(ℂ) → Spin₇(ℂ) | named |

**Library names at the pins.** Mathlib: `spinGroup` (`Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean` line 292, `pinGroup Q ⊓ even`, with `Group` instance at line 384), `lipschitzGroup` (line 61), `QuadraticMap.weightedSumSquares` (`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` line 1410), `IsConj` (`Mathlib/Algebra/Group/Conj.lean` line 32), `Matrix.charpoly_diagonal` (`Charpoly/Basic.lean` line 150), `Matrix.det_diagonal` (`Determinant/Basic.lean` line 80), `Matrix.charpoly_monic` and `Matrix.charpoly_natDegree_eq_dim` (`Charpoly/Coeff.lean` lines 119, 115). Tau Ceti: `TauCeti.Octonion.norm_mul`, `normQuadraticForm`, `imaginary`, `finrank_imaginary` (`TauCeti/Algebra/Octonion/Basic.lean` lines 422, 436, 595, 625; namespace `TauCeti.Octonion`), `TauCeti.D4Tripled.trialityAutomorphism` and `trialityAutomorphism_pow_three` (`TauCeti/Algebra/Lie/D4/Tripled/Triality.lean` lines 142, 183). Every backticked name of the roadmap's own (`spin7_not_acceptable`, `sumSquaresSeven`) is declared in `Suggested.lean`.

**Supplier citations resolved** (all exist at the stated place): ExceptionalThetaCorrespondencesForG2 §§0.6–0.9, 1.8, 5.1–5.4, 5.7–5.9, 6.7, 8.1–8.4, 8.8–8.10, 9.1–9.6, 10.3–10.7 (titles cited in italics all match); SmoothRepresentationsOfLocalGroupsPartII SRU.1.1, 1.7–1.10, 3.8, 3.10, 4.7, 4.8; SmoothRepresentationsOfLocalGroups SR.2.1–2.3, 3.1, 3.3; MetaplecticAutomorphicForms §§3.10, 3.34, 3.41, 3.42, 6.13, 6.14 (6.13 is the isometry-range Rallis formula, so the similitude gap is needed); ModularityAndLanglandsExtensions §§3.5, 3.8, 3.15, 3.17, 3.19 (with "each member's X-self-twists equal α(S_φ)", the stabilizer equality used in §§6.2, 6.3, 7.3), 3.27; EndoscopicTransferAndUnitaryTraceComparison §§1.13, 4.7a, 4.8, 10.1, 10.26, 10.30, 10.31; AutomorphicLFunctionsAndLocalFactors AL.3 (local and global Rankin–Selberg functional equation AL.3.3.2/3.6.2, boundary nonvanishing AL.3.6.3, strong multiplicity one for isobaric sums AL.3.7.2) and AL.4; AutomorphicFormsOnReductiveGroups Layers 0, 2 (§§2.4, 2.5), 4 (§§4.2, 4.3); AutomorphicSpectralTheory §§6.16, 6.18, 6.19; AutomorphicGaloisRepresentationsPartII AG2.2, AG2.5, AG2.6; on main: ReductiveGroups Layer 9 (pinned Chevalley–Demazure groups), RepresentationTheory/SpinRepresentations Layers 2, 4, 5, 6, 8, ClassFieldTheory Layers 5 and 9, OrthogonalSpinGroups Layers 1–2, GlobalQuadraticForms. Ownership: `roadmaps grep` finds no other roadmap stating the G₂ correspondence, the spin lift of PGSp₆, Kret–Shin parameters, the weak PGSp₆ correspondence, the G₂ × GL_r gamma factors or the unacceptability of Spin₇ (the only "Spin(7)" hit on main is a nontoral-subgroup example in HamiltonianReduction). The 44 open pull requests the brief names without files were not checked for ownership.

**Declared gaps.** All nine slugs agree between `plan.json` and the README; each has a named supplier earlier in the order. spin-pole-global-converse: precise and minimal (GS20 line 44 states Theorem 1.1 "with F = ℚ"; lines 62–64 attribute the restriction to Pollack's integral). gln-generic-local-converse: precise. pgsp6-similitude-rallis: precise (MetaplecticAutomorphicForms §6.13 is the isometry range). relative-generic-isolation: precise (ILM Lemma A.2 line 1231 and Proposition A.5 line 1262 are for SO(2n+1); Remark A.3 extends A.2). automorphic-plancherel-density: precise (Shin Theorem 5.8 line 982 with Z(G) = {1}, Corollary 4.12 line 861, Definition 3.5 line 471). kret-shin-gspin-galois: precise (KS Theorem A line 97 with (St) and (L-coh), S_bad as stated; Proposition 13.1(4) line 2978 gives irreducibility for all n under (spin-REG), so the n = 3 restriction is a harmless narrowing). The three remaining gaps are R03, R04, R09.

**Sampled locators** (all verified at the text unless listed under Not verifiable):

- 0.2: GS Lemma 2.4(i), lines 396–406 (p. 9), proof lines 422–431 (p. 10): injection Φ(PGL₃)/ℤ/2 → Φ(G₂), pole criterion for discrete φ, S_φ = μ₃ or S₃. Matches.
- 0.7: GS Definition 12.1 line 1444 and Lemma 12.2 line 1448 (p. 34); CG Lemma 3.10 line 345 (p. 9) and Proposition 3.12 line 372 (p. 10). Matches; CG works in the compact group, as the README says.
- 2.4: GS Proposition 4.1(i) line 750 and proof lines 757–807 (pp. 18–19): generic discrete series, Langlands–Shahidi γ equals the GL₈ standard γ, totally complex k, |T| = 1 versus 2. Matches; the proof asserts sphericity at all other finite places while Proposition 10.7 (line 1227) allows one uncontrolled place, as the README's §2.4 and Notes say.
- 3.1: GS Proposition 3.1 line 458 (p. 11) and §3.3 lines 477–507 (pp. 11–12): globalization with a Steinberg place, Chenevier's Theorem E locally, uniqueness by Lemma 2.4(iii). Matches.
- 3.4: GS §3.2 lines 462–475 (p. 11); HD Theorem 8.5 line 1017 (p. 27), Theorem 15.2 line 2021 (pp. 52–53). Matches.
- 3.7: GS Main Theorem (i) line 106 (p. 3), §3.4 lines 517–527 (p. 12). Matches.
- 3.13: GS Main Theorem (x) line 176 (p. 4), §3.4 lines 587–591 (p. 13): tempered case by the converse theorem for GL₇, then G₂-conjugacy. Matches (and uses R01's theorem).
- 4.1: GS §3.5 lines 613–625 (p. 14): inv : H¹(F, PGL₃) → ℤ/3, D₁ and D₂ opposite, JL_{D₁}(τ)∨ ≅ i_*(JL_{D₂}(τ)), Kottwitz pairing lines 644–651 (p. 15). Matches.
- 4.3: GS Proposition 3.2 line 603 (p. 14) and proof lines 626–667 (pp. 14–15); HD Theorem 8.5(iii) line 1023. The proof's "finite of order 3" (line 628) is the gap the README's Notes record; the p = 3 direction is R02.
- 5.5: GS Main Theorem (vi) lines 146–159 (p. 4), §3.2 line 475; HD Theorem 15.2(iii) lines 2028–2031 (pp. 52–53): θ(π_gen) = I₃(τ)_gen for self-dual τ without a trivial summand, and (i) θ(π) ≅ I₃(τ) for τ ≇ τ∨. Matches; the diagram's middle term is corrected as the Notes say.
- 7.3: GS §9 lines 1083–1097 (p. 26): the two Hom(F×, μ₂)-sets, distinguished packet ↦ ι ∘ φ. Matches.
- 7.4: GS Theorem 9.1(ii) lines 1114–1121 (p. 27). Matches, with the diamond restriction the README states.
- 10.5: GS Theorem 12.7(i) lines 1631–1633 and proof lines 1635–1643 (p. 39). Matches.
- 10.6: GS proof of Theorem 12.7(ii) lines 1644–1675 (pp. 39–40): Lemma 12.4 globalization, trivial global component group, one-place substitution, near equivalence of the GL₈ transfers. Matches.
- 10.9: GS Theorem 12.7(ii) line 1634, §12.8 line 1629 (p. 39) and the final paragraph lines 1676–1680 (p. 40). Matches, and the README correctly restricts the singleton statement to Φ♦_ds(G₂) (Proposition 5.2's range).

Also verified: GS Main Theorem (vii)–(ix) lines 160–175; Proposition 5.1 line 839, Proposition 5.2 line 863, Corollary 5.3 line 883 (pp. 20–21); Proposition 6.1 line 889 and proof lines 891–918 (pp. 21–22); §7 (a)–(f) lines 925–962; Proposition 8.1 line 974, §8.2 line 992, Proposition 8.2 line 999, §8.3 lines 1001–1011, Lemma 8.3 line 1014 with proof lines 1016–1061 (pp. 23–25); Theorem 2.1 lines 341–360 (dichotomy is (ii)); Lemma 10.1 line 1134, Corollary 10.6 line 1201, Proposition 10.5 line 1179, Proposition 10.7 line 1223, Lemma 10.8 line 1243 (pp. 27–30); §§12.2–12.7 lines 1468–1621 (pp. 35–39), Theorem 12.3 line 1512, Lemma 12.4 line 1543, Lemma 12.5 line 1574, Theorem 12.6 line 1598. HKT Lemma 4.6 line 896 (p. 21) and its proof lines 905–908 (the "stabilizers of non-zero vectors" step). GF Definition 2.1 (p. 3), Proposition 2.3 line 158 (p. 4), Theorem 2.4 lines 165–204 (p. 5) with the P-, Q- and torus rules and the global hypotheses exactly as in §3.11. CG Example 1 lines 489–502 (p. 13), Corollary 4.6 line 478, Proposition 4.7 line 486, Corollary 4.8 line 505 (p. 14). C Theorem E line 235 (p. 100), Theorem 6.4 line 2176 (p. 148), Corollary 6.8 line 2282 (p. 150). SV Theorem 16.3.2 line 11075 (p. 249), Remark 16.4.1 line 11239. Shin Theorem 5.8 line 982 (p. 27), Corollary 4.12 line 861 (p. 24), Definition 3.5 line 471 (p. 14).

**Adversarial table** (values computed on each side).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 v∘j ≅ 1 ⊕ Std₃ ⊕ Std₃∨ | (a,b) = (1,1), (−1,1), (2,3) | eigenvalues (1,a,b,(ab)⁻¹,a⁻¹,b⁻¹,ab); product 1; (X−1)⁷; (X−1)³(X+1)⁴ from 1,−1,1,−1,−1,1,−1; {1,2,3,1/6,1/2,1/3,6} versus wrong 1⊕3⊕3 {1,2,3,1/6,2,3,1/6} | holds | none |
| §0.1 s∘i, s∘h, q∘h | dimensions | 8 = 1+7, 8 = 4+4, 7 = 1+6; wrong 4+1+4 = 9 | holds | none |
| §0.1 central sign | −1 ∈ Spin₇ | s(−1) = −Id₈, q(−1) = Id₇ | holds | none |
| §0.2 pole criterion and S_φ | principal SL₂ of SL₃; χ⊗Sym², χ cubic; principal G₂; 1⊕1⊕1 | S₃; det(χ⊗Sym²) = χ³ = 1, dual χ⁻¹⊗Sym² ≠ it since χ² ≠ 1, S_φ = μ₃; Sym⁶ has no invariant line, no pole; 1^⊕7 gives pole order 7 but is not discrete | holds, discreteness needed | none |
| §0.3 spin detection | principal; subregular | 1⊕Sym⁶ one invariant line; 1⊕1⊕Sym²⊕Sym² pole order 2, centralizer of Sym²⊕Sym²⊕1 in SO₇ contains O(2), not discrete | holds | none |
| §0.4 standard injectivity | A₂ image; Spin₇ analogue | v∘j∘φ_τ ≅ v∘j∘φ_τ∨ and j∘φ_τ ~ j∘φ_τ∨ by duality; spin-only version fails on (r, r′) of §0.8 | holds, but route uses Griess | R01 |
| §0.5 quadratic rigidity | ρ trivial, χ ≠ 1; isotropic spinor | χ·iρ central, not conjugate to 1; (vρ)⊗χ = χ^⊕7 has no invariant; invariant subspace of a semisimple module with invariant form is nondegenerate, so contains a nonisotropic vector | holds | none |
| §0.6 weak equivalence | trivial versus unramified central sign | q-images equal; spin Frobenius eigenvalues 1⁸ versus (−1)⁸ | distinct classes | none |
| §0.8 unacceptable pair | Γ = (ℤ/4)², weights (1,0),(1,2),(0,1),(2,1), η = (0,2) | sum (4,4) ≡ 0 so det = 1; η⊗V = (1,2),(1,0),(0,3),(2,3); V∨ = (3,0),(3,2),(0,3),(2,3); neither equals V; (x,y) has x, y or x+y even; η trivial on ker b² = {y even}; in Spin₇ every element is conjugate to its inverse (−1 ∈ W(B₃)), so conjugacy to r(g)⁻¹ in SU₄ suffices | holds; matches CG lines 490–502 | none |
| Lean `spin7_not_acceptable` | compact versus complex form | element conjugacy passes to Spin₇(ℂ) by inclusion; Spin₇(ℂ)-conjugacy of compact-valued homomorphisms descends to Spin(7) (Cartan decomposition of the reductive centralizer) | true as stated | none |
| §0.9 Chenevier | Sym⁶ f non-CM, trivial character | Satake classes Sym⁶(SL₂) ⊂ v(G₂); Steinberg place ↦ principal SL₂ | consistent with C Theorem E | none |
| §1.1 period spectrum | V⊕V, P = P₀+P₀; constant function; measure scaling | zero-period copy is the antidiagonal (λ = −1), L²_D ∩ (V⊕V) = diagonal; (v,0) has P ≠ 0 but is not contained; period of 1 = vol ≠ 0 | holds | none |
| §1.4 | S = ∅ | trivial representation satisfies the conclusion | nonempty S needed (GS Proposition 10.5 says so) | none |
| §1.7 spin regularity | t = 1; t = 0; root lattice | h = (11,6,3): (11±6±3)/2 = 10,7,4,1 and negatives, distinct; h = (3,2,1): (3−2−1)/2 = (−3+2+1)/2 = 0; coordinate sum 14t even; ⟨λ_t, e₁−e₂⟩ = 4t, ⟨λ_t, e₂−e₃⟩ = 2t → ∞ | holds; Shin Theorem 5.8 (line 982) indeed gives no weight control | none |
| §2.4 Steinberg spin lift | 2ρ∨ of B₃ | sum of positive coroots = (6,4,2); on (±½,±½,±½): 6,4,2,0,0,−2,−4,−6 = Sym⁶ ⊕ 1; standard: ±6,±4,±2,0 = Sym⁶ | holds | none |
| §2.4 change of ψ | ψ_a | both sides × det(s∘φ)(a)|a|^{8(s−1/2)}, det trivial | holds | none |
| §3.2 trivial representation | L(1) versus Steinberg | v-eigenvalues q^{−3},…,q^{3} both; N = 0 versus N ≠ 0 | distinguished by N | R06 (which |·| is meant) |
| §3.10 ψ_a rule | GL₁ twist μ | det((v∘L)⊗φ_τ)(a) = det(φ_τ)(a)⁷; exponent 7r | holds | none |
| §3.11 Levi rules | P, Q, torus | 2+2+1+1+1 = 7; 2+2+3 = 7; 1+3+3 = 7; GF Theorem 2.4(i)(a)–(c) lines 168–178 | holds | none |
| §4.2 at p = 3 | both division lifts zero | fibre {split lift}, so no injection Irr(μ₃) → L⁻¹(φ) exists; L⁻¹(φ) ↪ Irr(μ₃) does | statement as written false in that instance | R02 |
| §4.3 S₃ packet | Irr(S₃) | 3 irreducibles versus |S₃| = 6; std₂|μ₃ = χ⊕χ⁻¹, trace at ζ₃ is ζ+ζ⁻¹ = −1 | holds | none |
| §4.1 opposite algebras | D₁, D₂ | inv 1/3 ↦ 2/3 under opposite; θ_{D₁}(JL_{D₁}τ) ≅ θ_{D₂}(JL_{D₂}τ∨) (ExceptionalThetaCorrespondencesForG2 §5.3); for self-dual τ one representation, for τ ≇ τ∨ two | holds | none |
| §5.5 club bridge | τ = St_PGL₃ | Sym²⊕Sym²⊕1⊕1, dims 3+3+1+1; HD Theorem 15.2(iii) | holds | none |
| §6.5 one in, all in | field of GS20 | Theorem 1.1 with F = ℚ (GS20 line 44) | gap correctly declared | none |
| §8.2 irreducibility | KS Proposition 13.1(4) | hypotheses (St), (L-coh), (spin-REG), all n | holds | none |
| §9.2 lower tower | φ_τ = Sym³ | Λ²Sym³ = Sym⁴ ⊕ Sym⁰, 6 = 5+1; q-image 1⊕1⊕Sym⁴ not discrete; spin Sym³⊕Sym³ | holds | none |
| §9.3 Levis | C₃ | 2³ − 1 = 7 proper standard Levis | holds | none |
| §10.2 discreteness on weak classes | Levi preimages | Levis of Spin₇ are preimages of Levis of SO₇, so discreteness depends on q∘φ alone | holds (simpler than the route) | none |
| §10.4 twist | χ quadratic; μ with μ² ≠ 1 | Λ²(φ⊗χ) = χ²Λ²φ = Λ²φ; Λ²(φ⊗μ) = μ²Λ²φ | quadratic only | none |
| §10.7 Λ² insufficiency | unramified (a,b,c,(abc)⁻¹), χ unramified quadratic | Λ² unchanged, det unchanged; φ⊕φ∨ eigenvalues negated | holds | none |
| §10.9 singleton fibre | φ̃ weakly equivalent to i∘φ | same SO₇-image ⇒ φ̃ = χ·(i∘φ) (central kernel μ₂); χ⊗(1⊕v∘φ) ≅ 1⊕v∘φ ⇒ conjugate by §0.5 | holds | none |
| Conventions |w| | arithmetic Frobenius | README/ExceptionalThetaCorrespondencesForG2: q^{−1}; EndoscopicTransferAndUnitaryTraceComparison §10.1: q | opposite characters | R06 |

**README shape.** 74 targets in 11 layers, each with a locator; 17 definitions, each with an API list and at least three Checks (counts 3–6); every layer ends with Examples and Dependencies; no process residue, no LaTeX delimiters, no pull-request numbers, no paths; Unicode throughout. `metadata.toml` has `topic = "math.NT"`. Every cited work is in `sources.toml` (eleven entries, all certified, plus the Griess entry added by this review).

**Notes on the sources.** Each of the eleven discrepancies the README records was checked at the text; all are real (listed under Source issues).

## Not verifiable

- Griess, *Basic conjugacy theorems for G₂*, Theorem 1: paywalled (Invent. Math., DOI prefix 10.1007); recorded as `uncertified` by its locator. The statement is attested by C line 2239, HKT line 913 and GS line 214.
- Gross–Savin, *Motives with Galois group of type G₂* [GrS2], Chapter 4 §1, to which GS Lemma 2.4(ii),(iii) defer their proofs (GS line 432): not in the manifest and not read; the README cites the stated lemma of GS, which is legitimate.
- Sakellaridis–Venkatesh Theorem 16.3.2 is stated for an affine spherical variety with anisotropic stabilizer (SV line 11075); the Whittaker-type case GS invokes for Proposition 10.7 (GS line 1228) is not a literal instance of that statement. The gap contract asks the supplier for both cases, which is the right place for it.
- Xu's papers and Arthur's book (the content of ModularityAndLanglandsExtensions §§3.15–3.27) were not opened; the supplier's statements were checked instead.
- The 44 open pull requests named in the brief without files were not checked for ownership.

## Source issues

- **Gap** in GS at Proposition 3.2 proof, p. 14: the source says the centralizers Z_{G₂}(φ) for φ in the discrete A₂ image are finite of order three; it should be order three for φ_τ not self-dual and S₃ for self-dual φ_τ (its own Lemma 2.4(i)); affects the proof.
- **Error** in GS at Main Theorem (vi), p. 4: the source says the middle term of the spin diagram is the generic discrete series of PGSp₆; it should be generic tempered representations, since the lift of π_gen[1] is the tempered non-discrete I₃(St)_gen (HD Theorem 15.2(iii)); affects a stated result.
- **Misprint** in GS at Main Theorem (ix), p. 4: the source closes a parenthesis before the tensor product with φ_τ; it should be γ(s, (std∘L(π)) ⊗ φ_τ, ψ) as on p. 13; affects nothing.
- **Misprint** in GS at §1.2, p. 5: the source says Appendices A and B are §9 and §11 and spells the author of the conjugacy theorem "Greiss"; it should be §10 and §11, and Griess; affects nothing.
- **Misprint** in GS at §2 p. 8 and §3.1 p. 10: the source cites Theorem 2.1(i) for the theta dichotomy; it should be Theorem 2.1(ii); affects nothing.
- **Misprint** in GS at §3.3, p. 11: the source says the totally definite octonion algebra is over F; it should be over the totally real field k; affects nothing.
- **Misprint** in GS at §4.4, p. 19: the source says the gamma identity is for representations of G₂(F); it should be PGSp₆(F); affects nothing.
- **Gap** in GS at Proposition 4.1(i) proof, pp. 18–19: the source says the globalization is spherical at every finite place outside T ⊔ {u, w}; Proposition 10.7 allows one further uncontrolled finite place, whose gamma factors must be cancelled separately; affects the proof.
- **Gap** in GS at Lemma 8.3 proof, p. 25: the source applies GS20 Theorem 1.1 over a totally real field k; GS20 states it only for ℚ (GS20 p. 2); affects the proof.
- **Gap** in GS at Theorem 9.1(ii), p. 27: the source states the enhanced compatibility for every π ∈ Irr(G₂); the PGSp₆ enhanced parameter of §9 is defined only over the diamond discrete parameters; affects a stated result.
- **Gap** in GS at Lemma 10.1 proof, p. 27: the source concludes that every summand has Howe rank exactly two when all open-orbit coefficients vanish; it should be rank at most two, with ranks zero and one excluded separately; affects the proof.
- **Gap** in GS at Lemma 12.4 proof, p. 37: the source takes spin-regular real components from Shin's Theorem 5.8; that theorem gives discrete series at infinity with no control of the weight; affects the proof (Shin's Corollary 4.12 along an explicit weight sequence repairs it).
- **Gap** in HKT at Lemma 4.6 proof, p. 21: the source says the stabilizers of all nonzero spinors are the Spin(7)-conjugates of G₂; isotropic spinors have other stabilizers; it should choose a nonisotropic invariant spinor, which exists by complete reducibility; affects the proof.
- **Misprint** in Shin at the proof of Theorem 5.8, p. 27: the source cites Proposition 4.12; it should be Corollary 4.12; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8465ee41eeecc6e2a29ba1075d41c591cd7cc297", "job": "REV-PKG-LocalLanglandsCorrespondenceForG2", "model": "fable", "worker": "chris-x19"} -->
