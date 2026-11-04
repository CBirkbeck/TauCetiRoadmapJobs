<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1314#issuecomment-6391952754 -->
Review (claude) of 618a2fa

Verdict: needs changes

1. **F01** (P1) Fourteen design gaps have no supplier

   Location: `packages/ExceptionalThetaCorrespondencesForG2/design/plan.json`, top-level `gaps`, entries `ExceptionalThetaCorrespondencesForG2/G1` to `/G14`. Entry G2 has the title "Primary minimal-model inputs not obtained"; none of the fourteen has a `supplier`, a `section` or a `slug` (keys are only `id`, `title`, `detail`, `neededBy`).

   Claim: these are declared supplier gaps (the brief lists each as `supplier none`).

   Witness: every `neededBy` list names only this roadmap's own nodes (for example G1: `EX.0/octonion-group`, `EX.0/null-subspaces`, `EX.9/quaternion-pointwise-stabilizer`). So each is an unowned prerequisite or this roadmap's own proof obligation written as a gap, and several repeat declared slugs.

   Repair: (a) G3, G4, G7, G12 and G14 restate the declared slugs `wavefront-all-residue`, `rank-one-plancherel`, `schwartz-ext`, `ramified-spin-factor` (as narrowed in R06) and `regular-real-unitarity`. Retire them in favour of those slugs. (b) G1, G2, G5, G6, G8, G9, G10, G11 and G13 are proof obligations of targets this README already states: §0.1 and §9.1 for G1; §2.4, §3.2 and §10.2 for G2; §1.8 and §8.10 for G5; §4.1, §4.2 and §4.4 for G6; §5.5 and §7.5 for G8; §3.5, §3.7 and §3.8 for G9; §3.10, §6.3 and §6.4 for G10; §5.2 for G11; §10.2 to §10.5 for G13. Record that these subsections own them, and have the intake retire the supplier-less entries. If no gap entry may be removed after the design stage, give each one an owner field that names this roadmap's subsection. (c) Drop the process wording ("not obtained", "audit", "was read") from those texts. Test: after the repair, no `gaps` entry lacks a supplier, and each obligation appears exactly once, either as a slug or as a named target.

2. **F02** (P2) Suggested.lean states only Layer 0 input lemmas (padding)

   Location: `packages/ExceptionalThetaCorrespondencesForG2/Suggested.lean` lines 37–79, which declare `IsOctonionAutomorphism`, `IsNullSubspace`, `nullSubspace_finrank_le_two`, `nullSubspace_transitive` and `nullFlag_transitive`. The docstring says "The split-octonion null-space geometry is statable on the native octonions using two elementary predicates."

   Claim: these are headline theorems.

   Witness: the Summary (line 3) lists the end results: lifts, Howe duality, dichotomy, tables, trichotomy. Line 111 says Layer 0 "fixes groups, coordinates and parameter bookkeeping". These theorems are §0.2 inputs that define P and Q, so they are input lemmas: padding, blocking under the operator's rule.

   Repair: delete the two definitions and the three theorems, and the now-unused `import TauCeti.Algebra.Octonion.Basic`. Keep a module docstring that says no headline theorem is statable at the pins, and keep its current list of the missing carriers (as corrected by R03). In the README, keep the §0.1 and §0.2 statements as prose targets but drop the backticks from the five names (lines 120, 149). Rewrite the Conventions sentence "The two elementary predicates in Suggested.lean are defined over any field F…" (line 23) and the From Mathlib sentence about "the two elementary predicates" (line 35). If the theorems are kept against this repair, make two further fixes. Drop `hpos` from `nullSubspace_transitive`, and "positive" from §0.2: the zero-dimensional case holds without it (proved in Lean with `LinearEquiv.refl`). And credit the line-51 docstring to "Savin, appendix to HKT, A.1 (over ℚ; HKT line 946); GS §13.4 (p-adic; GS line 1656)", not "Harris--Khare--Thorne".

3. **F03** (P2) Tau Ceti's exceptional group carriers at the pin are misdescribed and not cited

   Location: `Suggested.lean` lines 14–15: "Exceptional minimal representations and their five Jacquet filtrations lack the exceptional group models and smooth admissible representation categories." README "From Tau Ceti", lines 39–45, lists only the octonion, spin and Albert declarations.

   Claim: the pinned libraries lack exceptional group models.

   Witness: the pinned Tau Ceti has split, simply connected Chevalley carriers. `TauCeti.E7Minuscule.groupScheme` is at `TauCeti/Algebra/Lie/E7/Minuscule/Carrier.lean:188`, an E₆ carrier at `TauCeti/Algebra/Lie/E6/Minuscule/GroupScheme.lean:109`, a D₄ carrier at `TauCeti/Algebra/Lie/D4/Tripled/GroupScheme.lean:119` with `trialityAutomorphism` (`Triality.lean:142`), and `TauCeti.Octonion.g₂ToDerivationLieAlgebra` at `TauCeti/Algebra/Octonion/Serre.lean:267`.

   Repair: the docstring names what is actually missing. That is the adjoint E₇ and the E₆⋊C₂ and E₆^D forms; any identification of the native minuscule carriers with Chevalley or reductive groups (their docstrings disclaim it); and the smooth admissible categories and minimal representations. "From Tau Ceti" lists the native carriers above, plus `TauCeti.E6DoubledMinuscule.graphAutomorphism` (`TauCeti/Algebra/Lie/E6/DoubledMinuscule/GraphAutomorphism.lean:468`) and `TauCeti.G2ShortRoot.serreRepresentation` (`TauCeti/Algebra/Lie/G2/ShortRoot/Basic.lean:173`), and says in one clause why §0.1, §2.1–2.3, §2.6 and §3.1 use the LieHighestWeight and SpinRepresentations routes instead, or else cites the carriers on those *Needs:* lines. Test: each of the declarations listed resolves at the pin, and none of them is the adjoint E₇ or a nonsplit form.

4. **F04** (P2) The see-saw identity in §2.5 uses the wrong dual

   Location: README line 578: "The triality square identifies HJ,E-periods on ΘJ(π) with Hom_G₂(RJ(E),π∨), with both duals recorded." Line 767 (§4.1) pairs Hom_G₂(RJ(E),π∨) with "the corresponding exceptional theta module", which is ambiguous.

   Claim: H_{J,E}-invariant functionals on Θ_J(π) correspond to Hom_G₂(R_J(E), π∨).

   Witness: GS (5.1) (GS line 589) gives Hom_{H_{J,E}}(Θ(π),ℂ) ≅ Hom_{G₂}(R_J(E),π). With R_J(E) = Θ(1) these are both Hom_{G₂×H_{J,E}}(Π, π⊗ℂ). GS Lemma 6.4 (GS line 754) pairs π∨ with Θ(π∨), not with Θ(π).

   Repair: line 578 should read "identifies H_{J,E}-periods on Θ_J(π) with Hom_G₂(R_J(E),π) (GS (5.1)); applied to π∨ it identifies periods on Θ_J(π∨) with Hom_G₂(R_J(E),π∨)". Line 767 should say "on Θ_J(π∨)". Test: by the universal property of the maximal π-isotypic quotient, a nonzero G₂-map R_J(E)→π gives a nonzero H_{J,E}-functional on Θ_J(π), consistent with §4.7 and GS Lemma 6.4.

5. **F05** (P2) gap:prasad-restriction asks for a theorem an earlier roadmap already states

   Location: README line 75, "What SmoothRepresentationsOfLocalGroupsPartII must provide (gap:prasad-restriction): … there is a nonzero GLₙ₋₁(F)-equivariant map V→W, in particular for n=3"; consumed at §5.7 (line 978).

   Claim: no earlier roadmap supplies this.

   Witness: AutomorphicLFunctionsAndLocalFactors (earlier in the merge order), "Central periods", target *normalized-rs-period* (README at its open head 5d22a23, line 2303). For generic π_m⊠π_{m+1}, it gives a nonzero continuous GL_m-invariant functional, unique up to scalar.

   Repair: delete the gap from the README and from `plan.json` `gaps` (if the plan cannot change, have the intake retire the slug). On §5.7 *Needs:* cite "AutomorphicLFunctionsAndLocalFactors, Central periods (*normalized-rs-period*), with m=n−1 applied to π_m=W∨". Add one sentence: a nonzero GL_{n−1}-invariant functional on V⊗W∨ gives a nonzero GL_{n−1}-map V→W, because W∨ is generic exactly when W is, and (W∨)∨≅W. Test at n=3 with V=τ supercuspidal on PGL₃ and W=st, as in GS line 1013: the functional is nonzero, so st is a quotient of τ|GL₂.

6. **F06** (P2) gap:ramified-spin-factor is compound and contains this roadmap's own §8.9 theorem

   Location: README line 101, "(gap:ramified-spin-factor): Construct the normalized Langlands–Shahidi spin γ-, L- and ε-factors for generic PGSp₆ representations and the supercuspidal equivalence between a pole of the degree-eight spin L-factor at zero and a Shalika functional."

   Claim: this is one supplier contract for AutomorphicLFunctionsAndLocalFactorsPartII D.6.

   Witness: SW Theorem 5.3 (SW line 1954) is exactly the equivalence of a nonzero Shalika functional with a pole at 0. §8.9 (line 1344) states it as this roadmap's target, so §8.9 would restate the gap. D.6 is the doubling-method layer for classical groups (its design headings D.6/local-zeta to D.6/high-ramified-stability).

   Repair: narrow the gap to a single needs sentence. For generic irreducible σ of PGSp₆ over a characteristic-zero nonarchimedean F, construct Shahidi's L(s,σ,Spin) from the Heisenberg parabolic of F₄ with Levi GSp₆, normalized as in SW §5.1, and prove that it has a pole at s=0 exactly when I(σ,−1) is reducible (SW Lemma 5.4, line 1980). Keep the Shalika equivalence as §8.9's own content, with its route (SW §5: the reducibility point, the E₈ minimal representation, and the Bump–Ginzburg integral). Declare the Bump–Ginzburg integral as a separate gap if it has no owner. Test: with σ = θ(π) for π generic supercuspidal outside the PGL₃ image, §8.9 then follows from the narrowed gap together with §5.6, and does not restate it.

7. **F07** (P2) Three supplier gap needs are vague

   Location: README line 77 (wavefront-all-residue: "…character-expansion comparison … with the rational-orbit multiplicity statement needed for finite G₂ cubic coefficients"); line 79 (steinberg-unipotent: "with the compatibility needed for all Siegel twisted coefficients"); line 107 (regular-real-unitarity: "For each specified real reductive group").

   Claim: these are precise contracts.

   Witness: none of the three fixes its hypotheses. "The comparison" and "the statement needed" are not stated. The wavefront gap is also hosted in SRU.0, which in the design is "Unitary representations and functions of positive type" and contains no character theory. "Each specified" group is not named.

   Repair: wavefront-all-residue should read: "For connected reductive G over a characteristic-zero nonarchimedean local field of any residue characteristic, irreducible smooth π, and a nilpotent orbit O maximal in the wave-front set of π, the degenerate Whittaker space of π for O has finite dimension equal to the coefficient c_O of the Harish-Chandra–Howe expansion (Mœglin–Waldspurger; Varma for p=2)." Host it in SRU.3. steinberg-unipotent should read: "For split connected reductive H over F and a maximal unipotent U, St_H|U ≅ C_c^∞(U); hence St_{N,ψ}≠0 for every subgroup N⊂U and every character ψ of N." regular-real-unitarity should name split G₂(ℝ) and PGSp₆(ℝ). Test: G₂ and the subregular orbit give finite, nonzero W_E for some E, as in GS Lemma 3.4.

8. **F08** (P3) Definition subsections with fewer than three Checks and no API list

   Location: §0.3 (lines 174–185, 2 Checks), §0.5 (2), §0.6 (2), §0.9 (2), §0.10 (2), §2.2 (2), §2.3 (2), §2.6 (1).

   Claim: every definition carries its API list and at least three discriminating Checks.

   Witness: each of these defines objects (P and Q with their radicals; the long-root and unitary stabilizers; the dual-group inclusions; the 15-dimensional Jordan model; the Weyl chamber; the dual pairs; H_{J,E}; the extended Π) but has no "construction has the following API" list.

   Repair: add API bullets and a third Check to each, using values computed in the adversarial table. For example §0.3: center of U has roots 3α+β and 3α+2β; §0.10: GS's printed form gives q(1,2,3)=5 but q(6,−3,−2)=48.75; §2.6: square 1 on Π.

9. **F09** (P3) Locator defects

   Location: §5.7, line 974, "(as cited by GS in the proof of Proposition 8.4)"; §7.7, line 1210, "(GS, Propositions 12.2–12.3 and the remark after 12.2, p. 39"; §9.1, line 1382, "a characteristic-zero local field F" with line 1384 "including R"; References, line 1613, and `sources.toml`, LL "§3.5 p. 15".

   Claim: the locators support the statements as written.

   Witness: GS line 1013 cites nothing, and GS's reference list (lines 2126–2181) has no Prasad entry. The uniqueness and injectivity claims of §7.7 are Theorem 12.4 (GS line 1468). LL §10.1 assumes F p-adic (LL line 1126); the ℝ case is Lemma 10.4 (line 1162). LL §3.5 starts on p. 14 (line 595).

   Repair: in §5.7, drop "as cited by GS". In §7.7, add "Theorem 12.4, p. 39". In §9.1, add "LL Lemma 10.4, p. 28" for F=ℝ. In References and the manifest, use "§3.5, pp. 14–15", as §5.3 already does.

10. **F10** (P3) §0.9 pairs four Levis with three moduli

   Location: README line 283: "M₃≅GL₃ …, M₂≅(GL₂×GL₂)/{(z,z⁻¹)}, M₁≅GSp₄, M₁₃≅GL₂×GL₁. Their moduli are |det|², |det α det β|⁵ and |ν|³ respectively."

   Claim: the moduli listed "respectively".

   Witness: GS gives δP₃=|det|² (GS line 1141), δP₂=|det(αβ)|⁵ (line 1162) and δP₁=|ν|³ (line 1687). No modulus is given for P₁₃, so "respectively" is misaligned.

   Repair: write "The maximal parabolics P₃, P₂, P₁ have moduli |det|², |det α det β|⁵, |ν|³; P₁₃=P₁∩P₃ has Levi GL₂×GL₁". Test: the 3 moduli match the 3 maximal parabolics.

11. **F11** (P3) A mandated proof route and a Check that tests the wrong object

   Location: §1.10, line 432: "The proof must include the nilpotent-wavefront reduction to the subregular orbit …". §2.2, line 529, Check: "passage to the opposite gives −1/3=2/3 in ℚ/ℤ, a different rational form; a geometric outer involution does not identify these invariants over F."

   Witness: house style says a route never binds a target. In the §2.2 Check, D⁺=(D^op)⁺ and inversion gives PD×≅P(D^op)× (§5.3; LL line 658). So the E₆^D group pair of §2.2 is the same for D and D^op, and the Check, which only tests the algebra invariant, cannot fail for any version of §2.2.

   Repair: make §1.10 read "One proof route uses the wave-front reduction …". Replace the §2.2 Check with one that discriminates the group pair, for example: "D and D^op give the same Jordan algebra and the same E₆^D; the pair differs only by the identification PD×≅P(D^op)×, x↦x⁻¹, which exchanges JL_D(τ) and JL_D(τ)∨."

Scope of this review: `packages/ExceptionalThetaCorrespondencesForG2/README.md` (1627 lines, read in full), `Suggested.lean` (81 lines, elaborated and probed), `metadata.toml`, `sources.toml`, and the design `design/plan.json` (its `gaps` and `sourceIssues` lists). Pins: content main `ae2562c`, Mathlib `6b7abb3`, Tau Ceti `a91d3aa`. No previous review exists, so every section was reviewed in full. Eleven findings: one P1, six P2, four P3. Under the operator's binding rules for this review, padding in `Suggested.lean` and claims inaccurate against the pinned Tau Ceti are blocking, so they are filed as P2 rather than P3.

## Verified sound

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: the only output is three `declaration uses sorry` warnings (lines 52, 59, 70). The binder check (`#check @IsOctonionAutomorphism`, `#check @IsNullSubspace`) shows each takes `(F) [Field F]` and its carrier, matching README line 23. The theorems carry `[Field F] [CharZero F]` explicitly. One-tactic probe on a scratch copy: `simp` makes no progress on all three; `aesop` fails on the dimension bound; `exact?` finds nothing in the library. So nothing is a one-tactic closure, and the padding verdict of R02 rests on the operator's input-lemma rule. Also verified: no `set_option`, `#eval`, `lemma`, sorry'd data or `True`, and a single `import Mathlib` plus one Tau Ceti module, which exists at the pin.

**Pinned declarations opened** (all exist with the stated hypotheses): `TauCeti.Octonion` multiplication `mul_a/mul_b/mul_v/mul_w` (`TauCeti/Algebra/Octonion/Basic.lean:263–270`), `conj_mul` (:334), `norm` (:375), `mul_self` (:410), `norm_mul` (:416), `imaginary` (:589, kernel of the trace), `finrank_imaginary` (:619, StrongRankCondition), `finrank_derivationLieAlgebra` (`Derivation.lean:995`), `isIrreducible_imaginaryLieSubmodule` (`Fundamental.lean:317`, hypothesis `(2:K)≠0`), `SpinPolarizationData` (`Spin/Polarization/Basic.lean:82`), `spinAction` (`CliffordAction.lean:230`), `spinRep` (`Spin/Representation.lean:56`), `AlbertAlgebra` (`AlbertAlgebra/Basic.lean:104`, product needs `Invertible 2` at :229), `finrank_eq_twentySeven` (:213); Mathlib `Representation` (`Mathlib/RepresentationTheory/Basic.lean:48`) and `Representation.Coinvariants` (`Coinvariants.lean:57`). Neither Mathlib nor Tau Ceti has a division-octonion carrier or a G₂ group scheme, so the docstring's "not statable" claims for §0.1 and §9.6 are correct.

**Sampled locators (15, plus the two waived keys).** These were checked against the text: 0.3 (GS §2.4, lines 248–273), 1.1 (Prop. 3.1(i), lines 299–309), 1.4 (Prop. 3.2(i), lines 343–353), 1.10 (Lemma 3.4, lines 512–518), 2.3 (§§4.3–4.4, lines 560–583), 2.6 (§8.1, lines 864–873), 3.6 (Prop. 13.5, lines 1647–1681), 3.8 (Prop. 13.7, lines 1772–1790), 4.6 (GS lines 757–759 and 838–839; GrS Lemma 2.9 on printed p. 213, GrS line 8250), 5.1 (Prop. 7.1, Thm 7.2, lines 829–853; Sav §5, lines 232–293), 5.7 (Prop. 8.4, lines 991–1015; Pra Thm 3, line 250), 5.9 (Thm 8.5, lines 1017–1030), 7.3 (Lemma 11.4, lines 1343–1360), 7.7 (Props 12.2–12.3, lines 1448–1465) and 9.1 (LL §10.1, lines 1126–1131). Twelve are correct in theorem, page and hypotheses. 5.7, 7.7 and 9.1 have the P3 defects of R09. 7.3 is restated for coinvariants under a fixed central character, while GS proves it for functional spaces; the restatement is true by Stone–von Neumann and needs no change. No locator was flagged unverified by the author.

**Waived keys.** GS05 statements were checked against secondary text: the GS04 §5 characterization (GS04 lines 228–257: spherical, with Satake parameter from the subregular SL₂ of the dual group, unique up to twist for split simply-laced groups) agrees with README §2.4, and HS's remark (HS lines 438–440) agrees with nonspherical minimal representations of non-quasi-split forms. HPS statements: LL p. 25 (LL lines 1038–1040) uses only the matching of infinitesimal characters and the far-from-walls unitarity, which is what §10.7 states. No inconsistency was found.

**Cross-roadmap citations resolved** (main, open heads, board designs). ReductiveGroups Layer 3 (line 234), 3A.1 (line 249 ff.) and Layer 9 (line 1092). ReductiveGroupsPartII RG2.5.1–2. LieHighestWeight Layer 8, including "The positive division-octonion algebra". SpinRepresentations Layers 4 and 8. ClassicalGroups Layer 6. LieGroups Layers 2 and 7. CompactGroups Layers 3–5. ClassFieldTheory Layer 9. LanglandsParameterStacks LP0.5, LP1.11 and LP1.12. SmoothRepresentationsOfLocalGroups SR.0.2, SR.0.4, SR.2.1–2.3, SR.2a.1, SR.3.1–3.4 (*isotypic-quotient-regular* is in SR.3.4), SR.5.1 (inverse-twist coinvariants) and SR.5.2 (*classical-llc-normalization*); its Whittaker multiplicity one is for GL₂ only, as the README says. SmoothRepresentationsOfLocalGroupsPartII SRU.0–SRU.4 (board design). MetaplecticAutomorphicForms §§0.15–0.17, 1.1, 2.4a–2.7, 3.4–3.8, 3.34, 3.37–3.40 and 3.38a. EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30 and 10.31. ModularityAndLanglandsExtensions §3.5, part (vi). AutomorphicLFunctionsAndLocalFactors AL.4 (Euler factor for any finite-dimensional r). AutomorphicLFunctionsAndLocalFactorsPartII D.6 (board design). AutomorphicFormsOnReductiveGroups §§2.1–2.7, 3.1–3.5, 4.1–4.2 and 5.4. ArithmeticLocallySymmetricSpaces ALS.F.6 (rapid decay of cusp forms). AutomorphicSpectralTheory §§1.1–1.2, 2.4–2.6 and 4.4. LocalLanglandsCorrespondenceForG2 is a board design, a consumer, placed after this roadmap in ORDER.txt. All 20 cited roadmaps exist.

**Supplier order.** `gate --depcheck … --movable` printed: `depcheck: 44 roadmaps, 452 edges, 0 problem(s)`. There are no UPWARD or CYCLE lines. ORDER.txt places this roadmap at line 295, after its last supplier SmoothRepresentationsOfLocalGroupsPartII (line 294).

**Ownership.** Searches over main, all 348 open heads and the 190 board packages for octonion automorphisms, null subspaces, exceptional minimal representations, the G₂ dual pairs and Freudenthal or Koecher constructions found no other owner. The only competitor is the consumer LocalLanglandsCorrespondenceForG2. No `Suggested.lean` elsewhere declares these names. Ownership is checked against the open pull requests through their indexed heads.

**Adversarial table.** The table below has one row per README subsection and Lean declaration, with computed values. The P/Q identifications use the root realization α=e₁−e₂, β=−2e₁+e₂+e₃.

| Statement | Instances tried | Values computed (README / source or library) | Result | Change |
|---|---|---|---|---|
| `IsOctonionAutomorphism` (§0.1) | identity; conjugation; diag(2,½,1); ε-derivation | conj(u₁u₂)=−v₃ vs conj u₁·conj u₂=+v₃; diag(2,½,1) has det 1, so (g⁻ᵀw)×(g⁻ᵀw′)=g(w×w′); ε-coefficient D(u₁)u₂+u₁D(u₂)=v₃−v₃=0 | Checks true | none (R02 moves it to prose) |
| `IsNullSubspace`, `nullSubspace_finrank_le_two` (§0.2) | u₁=⟨0,0,e₁,0⟩; span{u₁,v₂}; u₁v₁ | Annihilator of u₁ in O⁰ is {⟨0,0,te₁,(0,w₂,w₃)⟩} (dim 3); products there are ⟨0,0,−w×w′,0⟩, null iff w∥w′, so dim≤2; u₁v₁=⟨1,0,0,0⟩≠0; agrees with HKT lines 975–981 | True | R02 |
| `nullSubspace_transitive` | dim 0; null lines | dim 0: W=W′=⊥, holds with `refl` (Lean-checked), so `hpos` is unused; lines = (G/Q)(F) | True | R02 (drop `hpos`) |
| `nullFlag_transitive` | incident line ⊂ plane | flags = (G/B)(F), one G(F)-orbit since B is parabolic | True | R02 |
| §0.3 P, Q, radicals | root sums | 2ρ_P=β+(α+β)+(2α+β)+(3α+β)+(3α+2β)=9α+6β=3(3α+2β); 2ρ_Q=10α+5β=5(2α+β); Z(U) roots {3α+β,3α+2β}; dim U/[U,U]=2, U/Z(U)=3; δ_P(diag(ϖ,1))=q⁻³ | True | R08 |
| §0.4 cubic Fourier data | xy(x−y); x³ | disc(0,1,−1,0)=b²c²=1; x³=(1,0,0,0) has disc 0 | True | none |
| §0.5 stabilizers | F×F, quadratic K | dim SL₃=dim SU₃=8; setwise/pointwise index 2 | True | R08 |
| §0.6 dual inclusions | restrictions | 7=1+3+3 on SL₃; 8=1+7 on G₂; (−1,−1) is trivial in SO₄ | True (GS lines 285–288) | R08 |
| §0.7 parameters | WD twist; q=2 | Ad(diag(t^½,t^−½))E=tE; \|Fr\|=q⁻¹=½ | True | none |
| §0.8 component groups | principal SL₂ in SL₃ and Spin₇ | \|μ₃\|=3→1, \|μ₂\|=2→1; S₃ irreps 1,2,1 with 1+4+1=6 | True (LL line 413) | none |
| §0.9 Jordan model | scalar z; dims | z²·z⁻²=1; dim ∧²F⁶=15≠27 | True | R10 |
| §0.10 chamber | s=(1,2,3); s=(3,2,1) | r₃(1,2,3)=(6,−3,−2); Σs²+(Σs)²: 14+36=50=49+1; GS's printed form 5 vs 48.75 (not invariant); hyperplane values 1,2,1;5,4,3;9,8,7 | README correct, GS misprint | R08 |
| §1.1 P-series, supercuspidal | ω_τ=1; ω_τ≠1; τ≇τ∨ | points ±½; 0; none (GS lines 299–309) | True | none |
| §1.2 P-series, Steinberg | χ=1, s=½; cubic χ | lengths 3 and 2 (GS lines 313–323) | True | none |
| §1.3 P-series, characters | quadratic/cubic χ at s=½ | Borel exponent α+β=(−1,0,1), \|·\|²=2, W-conjugate to 1·(2α+β); ½(2α+β) has \|·\|²=½, so the quotient is J_Q(1,·) | README corrects GS | none |
| §1.4 Q-series, supercuspidal | S₃ / det-trivial / other | s=±1; ±½; 0 (GS lines 343–353) | True | none |
| §1.5 Q-series, Steinberg/characters | I_Q(½,χ) | exponent α=(1,−1,0), \|·\|²=2, so J_Q(1,π(1,χ)); lengths 3,3 | README corrects GS | none |
| §1.6 Borel | s₁=2, s₂=1 | −s₁+½=−3/2 (−½ if s₂ were used) | True (GS line 389) | none |
| §1.7 normal forms | (2,1); (1,0) | 2>1>0 holds; 1>0>0 fails | True | none |
| §1.8 unipotent labels | ω³=1 | 3 labels; inversion swaps ω,ω² | True | none |
| §1.9 labels | subregular | Σdim²=6=\|S₃\| | True | none |
| §1.10 cubic models | π=1 | (1−ψ_E(n))v=0 ⇒ dim 0 | True | R11 (route wording) |
| §1.11 P₂/P₁₃ series | ω_τ=1 at ½ | lengths 4 vs 2 (GS lines 1176–1212) | True | none |
| §1.12 Siegel | selfdual DS | 2 summands, generic dims 1,0 (GS line 1226) | True | none |
| §1.13 P₁, SK case | τ_ρ with parameter φ_ρ⊕S₂ | std∘φ=1⊕(ρ⊗S₂): 5=1+4, contains 1, so the hypothesis holds | True | none |
| §2.1 Freudenthal | dim J=1,3,9,15; x=2 | 8+0+6=14, 8+2+18=28, 8+16+54=78, 8+35+90=133; N(2)=8, 2#=4, 4#=16=8·2; T(x,y)=3xy: T(1,1)=3, T(4,3)=36=dN₂(3) | True | none |
| §2.2 dual pairs | dims; D^op | dim PGL₃=8, PGSp₆=21; inv 1/3↦2/3, but D⁺=(D^op)⁺ | Check vacuous for §2.2 | R11, R08 |
| §2.3 H_{J,E} | cubic field; F³ | dim PE^×=2; dim Res SL₂=9 | True (GS line 581) | R08 |
| §2.4 minimal models | split E₆/E₇ | spherical line dim 1; Satake parameter from the subregular SL₂ (GS04 lines 247–257) | True | none |
| §2.5 theta modules | π vs π∨ | README gives Hom(R_J(E),π∨); GS (5.1) gives Hom(R_J(E),π) | False as stated | R04 |
| §2.6 outer extension | spherical vector | eigenvalue +1, sign twist −1, square 1 | True (GS line 864) | R08 |
| §3.1 gradings | Levi dims | D₆=66, A₁A₅=3+35=38, E₆=78, A₁D₅=3+45=48 | True (GS lines 1499, 1644) | none |
| §3.2 orbit kernels | u₁; span{u₁,v₂} | span strata 1, 2; zero quadruple excluded | True | none |
| §3.3 E₆ Jacquet | det=ϖ | \|det\|^{3/2}=q^{−3/2}, \|det\|^{1/2}=q^{−1/2} (GS04 lines 276–278) | True | none |
| §3.4 G₂-P filtration | zI | Sym³⊗det⁻¹: z³z⁻²=z; \|z\|, \|z\|³ | True (GS line 1513) | none |
| §3.5 G₂-Q filtration | (ϖ,1), (1,ϖ) | δ=\|·\|^½×\|·\|: q^{−½}, q⁻¹ | True (GS line 1554) | none |
| §3.6 P₃ filtration | det=ϖ | \|det\|(ϖ)=q⁻¹; 3 layers | True (GS lines 1673–1679) | none |
| §3.7 P₁ filtration | (ϖ,I₂); (I₂,ϖ) | ν=1, δ_{Q₁}=\|ϖ\|⁻⁴=q⁴; ν=ϖ, δ_{Q₂}=q⁻³ | True (GS line 1715) | none |
| §3.8 P₂ filtration | (zI,z⁻¹I) | det α det β=z²z⁻²=1; 4 pieces | True (GS lines 1772–1790) | none |
| §3.9 forward control | s=1 Q-input; s=0 | goes to I₂; s=0 is not positive | True (GS line 1863) | none |
| §3.10 reverse cases | standard Levis | 2³−1=7 | True | none |
| §3.11 temperedness | indicator pairs | only (1,1),(0,0) | True (GS line 1875) | none |
| §4.1 triality series | det=ϖ, s=±½ | q^{∓½}; s_J=−½,−½,+½ (GS line 610) | True | R04 (line 767) |
| §4.2 exact sequences | field / F×K / F³ | length 3 / 2 / 2 | True (GS lines 612–619) | none |
| §4.3 Ext vanishing | tempered π | Schwartz route; never asserts smooth projectivity | True | none |
| §4.4 restriction | s=½ | s/2+¼=½; s+1=3/2; m_E=3,1,0 | True (GS lines 649–661) | none |
| §4.5 open orbit | s=½ | all J_j terms vanish (GS Lemma 5.6) | True | none |
| §4.6 cubic coefficients | E=F³, J=D⁺ | no embedding ⇒ 0 | True (GS line 759; Sav line 284) | none |
| §4.7 period chain | d=1 | 1→2→1 impossible | True (GS line 754) | none |
| §4.8 nongeneric uniqueness | d=1 | two quotients give 2>1 | True (GS lines 786–803) | none |
| §4.9 existence | E=F³ | R_D(E)=0, I_E(½)=R₁₅(E) | True | none |
| §5.1 division Howe | τ=1; τ≠1 | Θ(1)=π_deg[1]; supercuspidal otherwise | True (GS lines 829–853) | none |
| §5.2 division nonvanishing | ℓ=3, E unramified, K totally ramified | q^{½(ℓ−1)(ℓ−2)m}=q^m; q=2, m=1 gives 2; gcd(3,2)=1 | True (LT lines 309–330) | none |
| §5.3 opposite algebras | Jordan product; inversion | (xy+yx)/2 symmetric; (xy)⁻¹=y⁻¹x⁻¹; JL_{D₁}(τ)∨≅i*JL_{D₂}(τ) | True (LL lines 619–663) | none |
| §5.4 outer extensions | nonselfdual; trivial τ | orbit of 2 gives 1 irreducible; trivial τ is nongeneric and selfdual (missing in GS line 888) | True | none |
| §5.5 fibers | sign −1 | v=−v ⇒ 2v=0 ⇒ v=0 | True | none |
| §5.6 generic precursor | p=2 | within-partner only; exclusivity kept for §8.8 | Consistent | none |
| §5.7 minus lift | p≠2 | no selfdual supercuspidal (GS line 932) | True | R05, R09 |
| §5.8 E₆ table | St± | π_gen[1], π_sc[1] (GS line 922) | True | none |
| §5.9 E₆ Howe | Thm 8.5(i)–(v) | image and preservation statements match | True | none |
| §6.1 Fourier–Jacobi | odd Weil | excluded case has first occurrence ≠0 | Not read (GG) | none |
| §6.2 orthogonal comparison | tempered hypothesis | kept as in GS Prop 14.2 (GS line 1929) | True | none |
| §6.3 A₅ restriction | Sp₆ on F⁶ | 1 orbit on F⁶∖0, 2 on F⁶ | True (GS line 1994) | none |
| §6.4 finiteness | parabolics | 2+3=5 filtrations | True | none |
| §6.5 nongeneric finite length | n=2 | 2 or 3 | True | none |
| §6.6 Whittaker fibers | π=1 | coefficient 0 (GS Props 11.1, 11.5) | True | none |
| §6.7 dichotomy | d=1 | d=2d forces d=0, against d>0 (GS line 779) | True | none |
| §7.1 enhanced FJ | genuine signs | (−1)(−1)=+1; U/[U,U] abelian of dim 2 | True | none |
| §7.2 Shalika | (zI,z⁻¹I) | z²z⁻²=1; stabilizer PGL₂^Δ (GS line 1364) | True | none |
| §7.3 root exchange | F_q sums | Σψ(x)=0 for nontrivial ψ, q for trivial | True | none |
| §7.4 FJ uniqueness | s=−½ | −½<½ ⇒ dim 1 (GS line 1284) | True | none |
| §7.5 Shalika fiber | exponents | I_ψ̄(½) (GS line 1414) | True | none |
| §7.6 period chain | generic endpoints | all spaces of dim 1 (GS line 1428) | True | none |
| §7.7 generic uniqueness | two generic quotients | Whittaker dim ≥2 vs 1 | True | R09 |
| §7.8 tempered E₇ Howe | Thm 12.4 | finite length, unique quotient | True | none |
| §8.1 nontempered lifts | J_Q, J_P | J₂(τ⊗τ), J₁₃(τ⊗1) (GS line 1863) | True | none |
| §8.2 Siegel table | selfdual with/without 1 | 1 sign; 2 summands (GS lines 2024–2031) | True | none |
| §8.3 three Howe theorems | indicators | Irr♣⊂Irr♥ (LL line 358); sum can be 2 | True | none |
| §8.4 tempered table | St | St_G₂↦St_H (GS line 2060) | True | none |
| §8.5 π_ρ family | injectivity | Lemma 15.4(ii),(iii) (GS lines 2079–2082) | True | none |
| §8.6 D₆ lift | Θ(π_ρ) | τ_ρ (GS line 2089) | True | none |
| §8.7 supercuspidal table | π_ρ | δ₁(τ_ρ) (GS line 2098) | True | none |
| §8.8 trichotomy | H₃ branch | H-lift nonzero but not DS | True (GS line 2116; LL line 367) | none |
| §8.9 spin pole | generic σ | SW Thm 5.3 (line 1954) | True | R06 |
| §8.10 depth-zero example | q=7, order 43 | 49−7+1=43; 7³+1=344=8·43; exponents 0,±1,∓7,±6 ≡ {0,1,42,36,7,6,37} distinct; long-root values a⁸,a⁻⁵,a⁻¹³≠1 | True | none |
| §9.1 pointwise stabilizer | M₂(F); division D; ℍ | SL₂(F) noncompact; SL₁(D) compact; SU₂; parameter −1 negates D⊥ | True | R09 (ℝ locator) |
| §9.2 Siegel orbits | rank 0 | not open; open orbits have rank 3, stabilizer dim 3 | True (LL line 1130) | none |
| §9.3 relative quotients | ranks 0,1,2 | README treats all three; LL covers rank 2 only (gap) | README stronger, correct | none |
| §9.4 supercuspidal embeddings | projectivity | quotient ⇒ submodule (LL line 1146) | True | none |
| §9.5 Steinberg summand | division D | finite volume; \|G_D\|=1 normalization | True (LL lines 1152–1159) | none |
| §9.6 SU₂ periods | (a,b,c) | interlacing (b,b) gives SU₂ weight 0 | True (LL line 1165) | none |
| §10.1 global pair | ranks | k-rank 3 (LL line 1199) vs 7 | True | none |
| §10.2 minimal residue | r=3, d=8 | 1+j·4: 1,5,9 (HS line 660); trivial at 9 (HS line 610) | True; minimal at 5 is an obligation | R01 (G13) |
| §10.3 theta lift | f↦if, φ↦iφ | Θ(if,φ)=iΘ, Θ(f,iφ)=−iΘ | True | none |
| §10.4 period nonvanishing | over k | GrS over ℚ; LL line 1208 extends to k | True | none |
| §10.5 cuspidality | constant terms | 3 maximal parabolics: (0,0,0) | True (LL lines 1202–1204) | none |
| §10.6 generic lift | three Jacquet zeros | supercuspidal H-lift | Not read (HKT A.9) | none |
| §10.7 real matching | λ=0 | ρ vs 0 detects the shift | True | R07 (gap wording) |
| Conventions, regular functions | rank-one χ | left a: χ(a); right b: χ(b)⁻¹ on f=χ⁻¹ | True | none |
| Conventions, theta integral | i-scaling | linear in f, conjugate-linear in φ | True | none |

## Not verifiable

- GS05 and HPS are waived and cited by their locator. They were checked only through the secondary texts named above.
- The following texts are readable but outside the seeded sample, and were not opened this round: SW Theorem 3.9 and the paragraph after it (SW lines 1270–1288, the p=2 overlap that §5.6 relies on); GG Theorem 9.1(d), §9.5 and Lemma 9.4; MS Theorems 1.1, 4.3 and 5.3; G99 Theorem 11.3 (the p>5 hypothesis of §8.10); Li Theorems 3.1 and 4.8; HKT A.8–A.10. Their rows above are marked "Not read" where a statement depends on them.
- HS has damaged font encoding. Theorem 6.4 and the remark after Corollary 4.6 were legible enough to read (HS lines 433–440, 652–662).

## Source issues

- **Misprint** in GS at Proposition 3.1(i), p. 9: the source lists only s=1/2 for ω_τ=1 in an "if and only if" reducibility statement; it should be s=±1/2, since s=−1/2 follows by contragredience; affects a stated result.
- **Misprint** in GS at Proposition 3.1(iii), p. 9: the source gives the quotient J_Q(1/2,π(1,χ)) for quadratic χ, writes I_P(1/2,stχ) in the cubic case, and gives J_Q(1/2,π(χ,χ⁻¹)) there; it should be J_Q(1,·) in both cases and I_P(1/2,χ), since the Borel exponent α+β is W-conjugate to 1·(2α+β); affects a stated result.
- **Misprint** in GS at Proposition 3.2(iii), p. 11: the source gives the quotient J_Q(1/2,π(1,χ)) for quadratic χ; it should be J_Q(1,π(1,χ)), since the exponent α is a short root W-conjugate to 2α+β; affects a stated result.
- **Error** in GS at §9, p. 30: the source's Weyl-invariant form Σsᵢ²−¼(Σsᵢ)², with the root hyperplanes sᵢ±sⱼ only, is not invariant under the third reflection ((1,2,3)↦(6,−3,−2) gives 5 and 48.75); it should be Σsᵢ²+(Σsᵢ)², with the three further hyperplanes sᵢ+Σsⱼ=0; affects nothing.
- **Error** in GS at §8.1, p. 24: the source says the only nongeneric selfdual irreducibles of PGL₃ are the J_B(χ|·|^½⊗1⊗χ|·|^−½); it should also include the trivial representation (Theorem 8.2(ii) covers it); affects nothing.
- **Misprint** in GS at §2.6, p. 8: the source writes the second factor of SO₄ as SL₂,r; it should be the short-root SL₂,s; affects nothing.
- **Misprint** in GS at §3.4(4), p. 14: the source calls the centralizer of a long-root SL₂ "a long root SL2"; it should be a short-root SL₂; affects nothing.
- **Misprint** in GS at §11.2, p. 34: the source places the oscillator's central character on the centre of U/[U,U]; it should be the centre U_{2α+β} of the Heisenberg quotient U/Z(U), since U/[U,U] is abelian; affects nothing.
- **Misprint** in GS at Proposition 13.7, notes, p. 47: the source says the two factors "of M3"; it should be M₂; affects nothing.
- **Misprint** in GS at §15.1, p. 54: the source defines σ_ρ as the theta lift of JL(τ); it should be JL(ρ); affects nothing.
- **Gap** in GS at the proof of Proposition 8.4, p. 27: the source asserts without reference that every generic GL₂ representation is a quotient of τ; it should cite Prasad's Theorem 3 (GL(n) to GL(n−1) restriction); affects the proof.
- **Gap** in LL at the proof of Lemma 10.1, p. 27: the source excludes only Howe N-rank exactly 2 when no open-orbit coefficient exists; it should treat ranks 0, 1 and 2, all nontempered; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "618a2fa", "job": "REV-PKG-ExceptionalThetaCorrespondencesForG2", "model": "opus", "worker": "fable-rev79"} -->
