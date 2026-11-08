# Review of GlobalGaloisDeformationsPartII (pull request #1837 at bffca34)

**Verdict:** needs changes

## R01 (P3) — The generator lemma is cited at a file that does not exist at the pin

**Location.** `TauCetiRoadmap/GlobalGaloisDeformationsPartII/README.md:64`: "because every canonical generator does (`TauCeti.UniversalEnvelopingAlgebra.ι_mem_augmentation` in `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/Basic.lean`)".

**Claim.** The lemma that every canonical generator of U(𝔤) lies in the augmentation Hopf ideal is in that file.

**Witness.** The pinned Tau Ceti has no directory `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/`. The theorem is at `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation.lean:82`. Of the 29 library file paths the README cites, this is the only one that does not resolve.

**Repair.** On line 64, replace `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/Basic.lean` with `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation.lean` and change nothing else. Tested at the pin:

- Line 82 states `UniversalEnvelopingAlgebra.ι R x ∈ HopfIdeal.augmentation R U` under `[CommRing R] [LieRing L] [LieAlgebra R L]`, so it applies over ℚ_p and over an algebraic closure.
- With it, the sl₂ Casimir Ω=(ef+fe)/4+h²/8 has counit 0 and lies in the ideal, as the sentence says.

This is the previous review's R01. The head has not changed since that review.

## R02 (P3) — §7.6 states its hypotheses with the undefined symbol M_ad

**Location.** `README.md:1250`: "Assume p≫G, regular geometric local μ-lifts, H⁰(Γ_F,M_ad)=z(m)∩g^der and H⁰(Γ_F,M_ad*)=0."

**Claim.** M_ad is the derived adjoint module of the residual representation.

**Witness.** `M_ad` occurs only on this line. The Conventions (line 29) define M=Lie(Gᵈᵉʳ)⊗k, but the first sentence of §7.6 uses M for the Levi of P. A reader cannot tell whether M_ad means Lie(Gᵈᵉʳ)⊗k, Lie(M)⊗k or Lie(M^ad)⊗k. The readings differ. For ρ̄=diag(χ₁,χ₂) in GL₂ with χ₁≠χ₂:

- the invariants in sl₂ are kh, of dimension 1, and equal z(m)∩g^der, as FKP22 Corollary 6.6 requires (FKP22 line 1333);
- the invariants in Lie(M)=𝔱 are all of 𝔱, of dimension 2, and the stated equality fails.

**Repair.** Replace the clause with "H⁰(Γ_F,Lie(Gᵈᵉʳ)⊗k)=z(m)∩g^der and H⁰(Γ_F,(Lie(Gᵈᵉʳ)⊗k)*)=0, for the adjoint module M of the Conventions (in P=MU the letter M is the Levi)". On the torus example above, the repaired hypothesis holds exactly when the root character χ₁/χ₂ is nontrivial. This agrees with §7.7 and its Check.

## R03 (P3) — Lazard's numbered statements (2.2.2.3) and (2.2.3.1) are cited as "Theorems"

**Location.** `README.md:911`: "Lazard V, Theorems 2.2.2.3, 2.2.3.1 and 2.4.10, pp.165–166,178–179". The same wording appears in `Suggested.lean:104–105`, the docstring of `uniformTorsion_H1`.

**Claim.** The three cited items are theorems of Lazard65, Chapter V.

**Witness.** Only (2.4.10) is a theorem (Lazard65 line 6597, printed p.178, labelled "Théorème"). The other two are not:

- (2.2.2.3), at Lazard65 line 6093 on p.165, is a numbered assertion inside §(2.2.2), whose title is "Définition du complexe quasi-minimal" (line 6082).
- (2.2.3.1), at line 6113 on p.166, is a displayed identity inside §(2.2.3), "Premières conséquences".

The same parenthesis also uses the key "Lazard V" beside the registered key "Lazard65".

**Repair.**

- On line 911, replace "Lazard V, Theorems 2.2.2.3, 2.2.3.1 and 2.4.10, pp.165–166,178–179; Lazard65, III Proposition 3.1.3, pp.91–92; III Theorem 3.1.7.4, p.94; V §§2.2.2–2.2.3, pp.165–166 and Theorem 2.4.10, pp.178–179" with "Lazard65, III Proposition (3.1.3), pp.91–92, and Théorème (3.1.7), part (3.1.7.4), p.94; V (2.2.2.3), p.165, (2.2.3.1), p.166, and Théorème (2.4.10), pp.178–179".
- In `Suggested.lean`, replace "Lazard V, Theorems 2.2.2.3, 2.2.3.1 and 2.4.10" with "Lazard65 V (2.2.2.3), (2.2.3.1) and Théorème (2.4.10)".

Checked against the text: III (3.1.3) is labelled "Proposition" (line 3305, p.91) and III (3.1.7) "Théorème" (line 3401, p.94). The repaired form agrees with the References entry on line 1633, which already uses this numbering. The docstring change does not affect elaboration.

## Previous findings

- R01 (generator lemma path): **not repaired**. Line 64 still reads "`TauCeti.UniversalEnvelopingAlgebra.ι_mem_augmentation` in `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/Basic.lean`". The change set since that review is empty: 0 changed lines in the folder and nothing outside it. Carried as R01 above. No repair report marks it as not actionable.

## Verified sound

**Gate.** The worker's gate at bffca34 passes every check. I reran it on this head and it passed again:

```
gate GlobalGaloisDeformationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

`git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Dependency check** (`gate --depcheck … --movable`) on this head:

```
depcheck: 239 roadmaps, 2432 edges, 0 problem(s)
```

It reports no UPWARD, CYCLE or moved line.

**Elaboration.** `lake env lean TauCetiRoadmap/GlobalGaloisDeformationsPartII/Suggested.lean` exits 0 in 10.7 s. Its one diagnostic is `declaration uses sorry` at 113:8. The file has the single line `import Mathlib` plus `TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree`, which exists at the pin. It has no `set_option` and no sorry'd data.

**`#check` binder comparison.** I compared the elaborated types (the worker's `signatures.md`, and `#check` lines in a scratch probe file) with README §4.4:

- `ModPow`, `modPowSub` and `modPowRep` keep only `O`, `G`, `V` and their `CommRing`, `Group`, `AddCommGroup` and `Module` instances, all of which occur in their types.
- `uniformTorsion_H1` carries every hypothesis in its own signature: compact `ℚ_p`-analytic group, semisimple `GroupLieAlgebra`, DVR `O` finite over `ℤ_p`, irreducible ϖ, finite free `V`, continuity on every `ModPow`.
- No binder is dropped. The README's generality (O the integers of a finite extension of ℚ_p, every prime p) equals the Lean statement's: a domain DVR finite over ℤ_p has injective structure map, since kernel (p) would make it a finite field.

**Padding probe.** On a scratch copy, `uniformTorsion_H1` is closed by none of six one-step attempts:

- `simp`: no progress.
- `infer_instance`: not a class.
- `rfl`: fails.
- `⟨0, fun r x => by simp⟩`: unsolved goals.
- `⟨0, fun r x => Subsingleton.elim _ _⟩`: no instance.
- `aesop`: no progress.

It is not padding.

**Headline theorems.** The README's headlines are:

- §3.6 controlled towers;
- §5.4 relative Selmer annihilation;
- §§6.3–6.6 finitely ramified and geometric lifts;
- §7.6 Levi-valued lifts;
- §§8.5, 8.10 and 8.11 actual reducible modularity, finiteness at fixed weight and level, and the boundary of fixed-level methods;
- §§9.2–9.5 function-field automorphy;
- §§10.1–10.3 symplectic lifts and the compatible system;
- §4.4 uniform torsion.

Only §4.4 is statable at the pins. Mathlib and Tau Ceti have no de Rham or Hodge–Tate condition, no unramified-outside-S predicate on absolute Galois representations, no local deformation rings, no newform Galois attachments, and no Lafforgue or automorphic carriers. A grep of the pinned Tau Ceti for `HodgeTate|IsDeRham|BdR` finds nothing. The module docstring names each non-statable headline and its missing carrier. §8.8 (Lemma 7.6) is statable but elementary and not a headline.

**Seeded sample (15 targets, each read at its locator).**

- **0.4.** Definition 3.2 and Remark 3.3 are on FKP22 p.11 (lines 468–476). A trivial prime has ρ̄|Γ_{F_w}=1 and N(w)≡1 (mod p), hence ≡1 mod p^D. Chosen decomposition groups make φ(σ_w) and φ(τ_w) meaningful. FKP19 Notation 5.1 is on pp.25–26.
- **0.5.** "Strongly linearly disjoint" is defined in FKP19 Notation 5.1, p.25 (line 1108), as an isomorphism Gal(K₁⋯K_s/K)→∏Gal(K_i/K). The cocycle fields are discussed in FKP22 §1.3, pp.7–8, and used in Lemma 3.7, pp.15–16.
- **1.11.** Examples A.16 and A.17 are on FKP22 p.50 (lines 2282–2296). The README's χ=det(r)δ⁻¹ is the correct primitive adjoint-Levi character: it is trivial on the centre (cI,c²). Its requirement of zero-exponent comparisons for GL_{2n} is stronger than Example A.17 and is needed; see Source issues.
- **1.12.** Lemma A.18 is on FKP22 p.51 (lines 2311–2338). Its conditions (1), (2) and (3) are faithfully restated.
- **2.6.** Proposition 3.6(2) is on FKP22 pp.12–13 (lines 549–560): h(v)(τ_v) and h(v)(τ_{t₀}) span F_pZ, the restriction to T is constant, and the class comes from M_Z.
- **2.7.** The construction of η_b^{(v)}=θ_b+θ_b^{(v)} is on FKP22 p.15 (lines 657–665), with inertia e_b* at v and t_b.
- **3.6.** Theorem 4.4 is on FKP22 pp.20–21 (lines 891–911): cases (1)(a) and (1)(b) with cutoff s=eD, strict equivalence at S, and image containing Ĝ^der(O/ϖ^n). The README adds the §3.2 hypothesis because Lemma 3.7 fails.
- **4.3.** Lemma 6.3 is on FKP19 p.45 (lines 2028–2034). FKP22 records the balanced numerics in the proof of Theorem 5.2, p.25 (lines 1085–1090).
- **5.1.** Lemma 5.3 is on FKP22 p.25 (lines 1095–1108).
- **5.2.** The proof of Proposition 6.8 is on FKP19 pp.48–49 (lines 2153–2206), including the reduction from level M to the residual layer. Corollary 5.5 (FKP22 pp.26–27) handles sl₂ for p≥3.
- **6.4.** Corollary 5.5 is on FKP22 pp.26–27 (lines 1152–1190): p≥3 suffices when g^der=sl₂.
- **6.6.** Theorem 6.11 is on FKP19 pp.50–51 (lines 2250–2259). Corollary A.7 (p.63) gives Assumption 5.2 (p.26, lines 1153–1159), which implies C1–C4.
- **7.6.** Corollary 6.6 is on FKP22 pp.30–31 (lines 1331–1359). The README rightly adds total reality and oddness, which the source statement omits; see Source issues.
- **7.7.** Remark 6.7 (FKP22 p.31) is refuted by the README's own Check, and the README's corrected criterion is right; see Source issues. Lemma A.18 is on p.51.
- **8.11.** Remark 7.8 is on FKP22 p.37 (lines 1701–1709), which says "for S a sufficiently large finite set", and Lemma 6.2 on p.28.

Further locators read outside the sample:

- FKP22 Appendix A: A.1–A.4 on p.44, A.5–A.7 on p.45, A.8 and A.9 on p.46, A.11 on p.47, A.13 and A.14 on p.49.
- Theorem 5.2 on pp.23–25 with footnotes 6–7, Theorem 5.6 on p.27, Theorem 8.1 and Remark 8.2 on p.38.
- FKP19 Lemma 3.9 on p.19, Lemma 6.1 and Definition 6.2 on pp.44–45, Definition 6.6 and Lemma 6.7 on pp.46–47, Lemma B.1 and Corollary B.2 on p.64, Proposition 7.8 and Remark 7.9 on pp.59–60.
- Ser05 Propositions 3.2 and 3.3 on p.207, valid over any field.
- BMR05 Theorem 5.8 on p.24, for perfect k′/k.
- Lazard65 III (3.1.3) on pp.91–92, III (3.1.7.4) on p.94, V (2.2.2.3) on p.165, V (2.2.3.1) on p.166 and V (2.4.10) on pp.178–179, with printed page = extraction page + 3.
- Pan22 Theorem 1.0.2 on p.3. The README flags no locator as unverified.

**Library declarations opened at the pins** (Tau Ceti 358314d, Mathlib f6090c7).

Tau Ceti:

- `TauCeti.ContCohomology.H1` (`…/ContCohomology/LowDegree.lean:725`): continuous cocycles `Z1 = C1 ⊓ ker d1` (line 482) modulo `B1`, the standard object.
- `explicitInfRes_exact` (`…/Inflation/Basic.lean:371`).
- `exists_isCompl_of_isKilling` (`HighestWeight/CompleteReducibility.lean:259`).
- `casimirElement` and `casimirElement_mem_center` (`UniversalEnveloping/Casimir.lean:128,178`).
- `HopfIdeal.augmentation` (`HopfAlgebra/HopfIdeal/Augmentation.lean:61`).
- `ι_mem_augmentation` (`UniversalEnveloping/Augmentation.lean:82`).
- `exists_isHighestWeightVector_and_lieSpan_eq_top` (`HighestWeight/Existence.lean:208`).
- `casimirScalar` and `casimir_smul_of_isHighestWeightVector_of_lieSpan_eq_top` (`HighestWeight/Casimir.lean:271,350`).
- `casimirScalar_eq_zero_iff` (`HighestWeight/Separation.lean:171`).
- `isTrivial_of_isHighestWeightVector_weight_zero_of_isIrreducible` (`HighestWeight/Trivial.lean:104`).

Mathlib:

- `LieAlgebra.HasTrivialRadical.instIsKilling` (`Algebra/Lie/CartanCriterion.lean:256`).
- `LieModule.instIsTriangularizableOfIsAlgClosed` (`Algebra/Lie/Weights/Basic.lean:754`).
- `LieAlgebra.exists_isCartanSubalgebra_engel` (`Algebra/Lie/CartanExists.lean:374`, which needs `[Infinite K]`).
- `RootPairing.nonempty_base` (`LinearAlgebra/RootSystem/BaseExists.lean:321`).
- `TopRep` (`RepresentationTheory/Continuous/TopRep.lean:31`).
- `continuousCohomology` (`…/ContCohomology/Basic.lean:131`).
- `ContinuousCohomology.tateShafarevich` (`…/ContCohomology/Sha.lean:71`).
- `GroupLieAlgebra` (`Geometry/Manifold/GroupLieAlgebra.lean:56`).
- `Subrepresentation.quotient` (`RepresentationTheory/Subrepresentation.lean:114`).
- `CompositionSeries.jordan_holder` (`Order/JordanHolder.lean:454`).
- `IsAbelianGalois` (`FieldTheory/Galois/Abelian.lean:25`).

Neither library has a Whitehead lemma for Lie algebras, so the NoncompactQuantumSymmetry §P.4 supply is needed. A script confirmed that 28 of the 29 cited file paths exist at the pins; R01 is the exception.

**Cross-roadmap citations resolved.**

At open heads (`roadmaps show`):

- GlobalGaloisDeformations §§3.3, 3.8 and G7 §§8.1, 8.4.
- ArithmeticGaloisDuality R02.2.1, R02.3.1, R02.4.2, R02.4.3, R02.4.5, R02.5.1, R02.6.2, D7.4 and D7.7.
- LocalGaloisDeformationRings §§1.17, 1.20, 1.21, 1.22, 2.5, 2.14, 2.28, 2.30, 3.11, 6.5, 6.17, 8.5 and 8.10.
- NoncommutativeAndEquivariantIwasawa §§0.2, 0.7, 0.11 and 0.13a, whose items 2–5 match the README's paraphrase; item 5 is the central-vanishing statement.
- NoncompactQuantumSymmetry §P.4.
- ClassicalSerreModularity R27.6 (target `R27.6/full-classical-serre-theorem`) and §I.1 (target `I.1/residually-reducible-ordinary-lifting`, 6 occurrences).
- GL2ModularityLifting §10.15.
- AutomorphicLFunctionsAndLocalFactors §AL.3, whose subsection "Leveled shtukas and ramified rank induction" is AL.3.10.13.
- ModularityAndLanglandsExtensions §§2.28 and 2.48.
- AutomorphicSpectralTheory §7.1.
- IntegralHeckeAndGaloisDeterminants §1.4, which contains "Classical Ribet lattice".
- ArithmeticGaloisRepresentations §§1.6, 1.11, 7.2, 7.4 and 7.7.
- FunctionFieldArithmetic §5.8.
- OrdinaryAutomorphicFormsAndModularityLifting §5.3.
- AutomorphicGaloisRepresentationsPartII AG2.5 and AG2.6.
- AlgebraicModularFormsAndSerreWeights Layers 4, 5 and 7, and §§6.1, 6.2 and 6.4.
- AutomorphicGaloisRepresentations Layers 1, 3 and 5.

On main: ReductiveGroupsPartII RG2.0.3, RG2.1 and RG2.2; Chebotarev and ProfiniteProPGroups, both under `Completed/`.

As accepted board designs earlier in the merge order: PotentialAutomorphyInfrastructurePartII PL.6 and PL.7, and LocallyAnalyticDistributionsPartII ND.0.

Every supplier is on main or earlier in the merge order.

**Declared gaps.** The 26 slugs of `design/plan.json` correspond one to one with the 26 "What … must provide" contracts. Every supplier is named, and the five suppliers of not-yet-merged roadmaps sit earlier in the merge order. None of the contracts asks for something a pin already provides; I grepped for the Whitehead lemma, finite-field root position and the Levi semisimplification. None is vague.

A note for the intake, not a finding: four README contracts are wider than the plan's `needs` text.

- fixed-quotient global obstructions: adds every global field;
- root cocycle lattices: adds equal-characteristic completions;
- smooth local approximation: likewise;
- finite-image semisimplification: restated over an arbitrary field, with Ser05 Propositions 3.2–3.3 and BMR05 Theorem 5.8, both checked.

An announcement built from plan.json would ask those suppliers for less than the README consumes.

**Ownership and overlaps.** `roadmaps grep` finds no other roadmap that plans the FKP doubling, relative-Selmer or finite-ramification method. ModularityAndLanglandsExtensions §§2.28 and 2.48 own residual potential automorphy and the compatible system and take the lift as input, so the hand-off is single-direction. The overlaps tool reports no other pull request that changes this roadmap and no dropped ids. Its closest-vocabulary roadmaps are PotentialModularityAndCompatibleSystems, GL2ModularityLifting, PotentialAutomorphyInfrastructure, ModularityAndLanglandsExtensions and GlobalGaloisDeformations; none owns these objects.

**Shape.** The shape follows the house form:

- every definition target has at least three Checks: §§0.1–0.5, 1.3, 1.6, 1.9, 2.1, 2.7, 3.2, 4.1, 4.6, 4.7, 6.6 (K′), 8.1, 8.8 and 9.1;
- every layer ends with Examples and Dependencies;
- References give editions;
- there is no LaTeX and no process language.

The word "Lemma" appears only in source names.

**Adversarial table.** Each row gives the values computed on both sides.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.4 trivial primes | p=3, norms 7 and 5; residual diag(1,2) at norm 7 | 7≡1 and 5≡2 mod 3; rank(diag(1,2)−I)=1, so the place does not split in F(ρ̄); a trivial prime splits in K⊃μ_{p^D}, so q≡1 mod p^D | holds; matches Def. 3.2 | none |
| §0.5 strong disjointness | three quadratic subfields of a C₂² extension; k=𝔽₉, p=3 | product of degrees 8, compositum degree 4, pairwise intersections of degree 1, so not strongly disjoint; the prime-field image has 3 elements, so degree 3, not 9 | holds; matches FKP19 Notation 5.1 | none |
| §1.11 GSp₄ D(1,1,4) | scalar Levi point (cI,c²); κ̄ of order 5 with χ=1; χ=κ̄ | χ=c²/c²=1; ord(χ^aκ̄)=5≥5 for a∈{−2,…,2}; for χ=κ̄ and a=−1 the order is 1, so the test fails | holds | none |
| §1.11 equal blocks, zero exponents | n=1, ρ̄=(κ̄⁻¹ ∗; 0 1) nonsplit, χ=κ̄⁻¹, ord κ̄>3N | Example A.17's ±1 tests κ̄⁻¹≠1, κ̄⁻¹≠κ̄², κ̄≠1, κ̄≠κ̄² all pass; D(1,1,N) at (m₁,m₂)=(0,1) compares 1 with χκ̄=1 and fails; C3 fails, since sl₂/b≅κ̄ is a subquotient (b/n)^∨(1)≅κ̄ of M* | the README's zero-exponent clause is needed | none (source issue) |
| §1.12 Borel criteria | SL₂ with quadratic χ; sl₃(𝔽₁₁), N=E₁₂+E₂₃, torus diag(2,6,1) | root χ²=1; zero unipotent image gives invariants of dimension 3; full unipotent image gives kE₁₂ of weight χ²; Ad(diag(2,6,1))N=4E₁₂+6E₂₃ since 2/6≡4; [4E₁₂+6E₂₃,N]=−2E₁₃≠0 | holds | none |
| §2.6 prescribed vector | k=𝔽₉, Z≠0 | allowed inertia values F₃Z∖0={Z,2Z}, 2 elements, against 8 in kZ∖0 | holds; Prop. 3.6(2) | none |
| §2.7 marked dual classes | one and two basis indices | η_b(τ_w)=e_b*; η_b(τ_{t_b})=e_b*+0, since θ_b^{(w)} is unramified at t_b with trivial local action; value 0 at t_{b′} and t₀; the matrix at (t₁,t₂) is I₂, of rank 2 | holds | none |
| §2.9 refutation of Lemma 3.7 | trivial SL₂ over ℚ, k=𝔽_p, p≥5, M*=𝔽_p(κ̄)³ | ζ_w=η₁ʷ−η₂ʷ is unramified at w and lies in the finite H¹(Γ_{ℚ,T},𝔽_p(κ̄)), so ζ_w=ζ_{w′}; the relation (1,−1,−1,1) among four nonzero homomorphisms Γ_K→𝔽_p survives because \|Gal(K/ℚ)\|=p−1; compositum degree ≤p³<p⁴ | the README's conditional design is justified | none (source issue) |
| §3.2 density estimate | ε=1/2, s=4; a repeated binary test; ε=1; s=0 | (1/2)⁴=1/16<1/10; a repeated test has conditional success 0 after one failure; (1−1)ˢ=0; (1−ε)⁰=1 | holds | none |
| §3.3 trivial-prime pairing | u, t basis; σ↦στ^c | inv(u∪t)=−⟨1,1⟩=−1 and inv(t∪u)=+1, as in FKP19 Lemma 3.9; under σ↦στ^c the formula changes by −c⟨φ(τ),ψ(τ)⟩+c⟨φ(τ),ψ(τ)⟩=0, so it is independent of the lift of Frobenius | holds | none |
| §3.6 controlled tower | e=2, D=1; relative depth 6 | last central level eD=2, first noncentral level 3, unchanged at depth 6; Theorem 4.4(1)(b): β(ρ₃(σ_w))≢1 mod ϖ³ | holds | none |
| §4.3 balanced images | orders 81,27 on both sides; 81,81 with kernels 27,9 | images 81/27=3 (dimension 1 over 𝔽₃); 3 against 9; Greenberg–Wiles product \|O/ϖʳ\|^{[F:ℚ]dim Flag}·\|O/ϖʳ\|^{−[F:ℚ]dim Flag}=1 under oddness and total reality | holds | none |
| §4.4 and `uniformTorsion_H1` (headline) | finite G (d=0); Γ=ℤ₃ with trivial ℤ₃; r=0; ϖ a unit; SL₂(ℤ₃) on (ℤ/3ʳ)² | zero Lie algebra is semisimple (no atoms), H¹ killed by p^{v_p\|G\|} uniformly; ℤ₃ gives H¹=ℤ/3ʳ, unbounded, but its 1-dimensional abelian Lie algebra is excluded; ModPow 0 = V/V = 0; a unit ϖ makes every ModPow zero and is excluded by `Irreducible`; sl₂ is simple, so the bound is uniform; six one-step probes fail | holds, not vacuous, not padding | none |
| §4.4 degree 0 (README i≥0, source i>0) | V^U=0 rationally | universal coefficients give H⁰(U,V/ϖʳ)≅H¹(U,V)[ϖʳ], killed by ϖ^{a₁} | holds | none |
| §4.6 Q_N | O=ℤ₃, M=2, N=8; norms 19 and 109; G=Gₘ | v₃(18)=2 passes, v₃(108)=3 fails; N≥4M since 8≥8; Gₘ has no roots, so Q_N is empty | holds | none |
| §4.7 root condition | SL₂, r=2 over ℤ₃ | \|L^α\|=9³=729=\|H⁰\|; the unramified part is 9²=81 because dα(h)=2 is a unit, so ker dα\|𝔱=0; ambient H¹=9⁶; cokernel O/9 | holds; Lemma 6.7 | none |
| §5.1 finite splitting field | M=0; residual dual invariant line | both H¹ have order 1; Hom(𝔽₃,M*) has dimension 1, so C2 is needed | holds; Lemma 5.3 | none |
| §5.2 simultaneous root position | sl₂(𝔽₃), A=h, B=evaluation at E₁₂ | dα(h)=2≠0 and B(E₁₂)=1; trace-form Gram determinant 2·(0−1)=−2≡1 mod 3, and 0 in characteristic 2 | holds; Cor. 5.5 | none |
| §6.4 sl₂ at p=3 | p=3, p=2 | coefficients −1≡2 and 2 are nonzero; H=h/2 has dα(H)=1; root vectors span sl₂; at p=2 dα(h)=0 | holds for p≥3 | none |
| §6.6 irreducible theorem | hypotheses of Thm. 6.11; a dihedral restriction | Corollary A.7 gives semisimplicity, no common subquotient and no trivial sub, hence C1–C4; for an index-2 induced representation the invariant-line count is 0, then 2 after restriction | holds | none |
| §7.6 Levi lifts | even diagonal GL₂ over ℚ; reading of M_ad | scalar complex conjugation fixes 3≠1 dimensions, so it is excluded by the README's oddness, which Cor. 6.6 omits; Lie(Gᵈᵉʳ)⊗k gives kh=z(m)∩g^der, while Lie(M) gives dimension 2 | mathematics holds; notation undefined | R02 |
| §7.7 torus criterion | SL₂ with image {±I} | lies in no proper subtorus of the rank-1 torus, but α(−I)=1, so H⁰=sl₂ (dimension 3) ≠ 𝔱 (dimension 1) | the README is right and Remark 6.7 is wrong | none (source issue) |
| §7.8 Siegel weights | a=2, w∈{2,0,−1,−2} | {0,−1,2,3} distinct; repeats for w∈{0,1−a,2−2a}; pairing sums 0+w=(1−a)+(w+a−1)=w=HT(δ) | holds | none |
| §1.7 joint determinant field | κ̄, ψ independent of order 10; blocks κ̄ψ², κ̄ψ, 1 | intersections with F(ζ_p) of degrees 1, 1, 2, leaving 10, 10, 5; the compositum contains κ̄=(κ̄ψ)/ψ, leaving 1 | holds | none |
| Conventions B_G | type A₃ over 𝔽₃ and 𝔽₇ | over 𝔽₃, 4 entries from 3 values, so no regular toral element; over 𝔽₇, 840 ordered distinct tuples and 120 of trace 0, e.g. (0,1,2,4) with sum 7 | holds | none |
| §8.10 bound | K_f=ℚ(√5), p=11 | 5≡4² mod 11 gives two primes of degree 1, so the bound is 1+2·2=5=2[K_f:ℚ]+1 | holds | none |
| §8.11 fixed set | p=5, χ̄=κ̄, S={5}, then S′={5,11} | ℤ[1/5]^×/5=⟨5⟩, since −1=(−1)⁵, with Pic=0, so dimension 1; ⟨5,11⟩ gives dimension 2>1; 11≡1 mod 5 | holds; Remark 7.8 | none |
| §9.3 non-uniformity | F=𝔽_q(t), q≡−1 mod p, ρ̄=Ind ψ from 𝔽_{q²}(t) | Ad⁰=η⊕Ind(ψ/ψ^c) with η=κ̄ of order 2; M*=M⊗κ̄ contains 1, so C2 and C3 fail for every p dividing q+1 | the README is right; Remark 8.2's bound in n alone fails | none (source issue) |
| §10.1 oddness | involution of multiplier −1 in GSp_{2n}; the identity | both eigenspaces are isotropic of dimension n; the fixed space on sp_{2n} is gl_n of dimension n² = #positive roots; GSp₄: 4; the identity fixes 10 | holds | none |
| Line 64 (Casimir) | sl₂ with Killing form; the trivial module | Ω=(ef+fe)/4+h²/8 has ε(Ω)=0; on the standard module Ω=(3/8)I=n(n+2)/8 at n=1; 0 on the trivial module | mathematics holds; file path wrong | R01 |
| §4.4 locator labels | Lazard65 V | (2.2.2.3) is an item of §(2.2.2) "Définition…"; (2.2.3.1) is a displayed identity; only (2.4.10) is a Théorème (p.178) | labels wrong, pages right | R03 |

## Not verifiable

- Gur99 Theorem A, NSW08 Theorems 8.6.7, 8.6.10 and 8.7.9, and BC14 Lemma 10 and Propositions 11 and 32 are settled as uncertified and cited by locator only; I did not read them.
- This round I did not re-read the locators of BLGGT14, BLGHT11, ANT20, LP11 or Ribet10. They are outside the seeded sample and unchanged since earlier rounds. The texts are in the cache.

## Source issues

- **Error** in FKP22 at Lemma 3.7, p.15: the source says the fields K_{η_b^{(v)}} are strongly linearly disjoint over K as v and b vary; it should require joint inertia generation, because for trivial SL₂ over ℚ with k=𝔽_p two identified cyclotomic lines give repeated unramified differences; affects a stated result.
- **Error** in FKP22 at Example A.17, p.50: the source says (C3) and (C4) follow from comparisons with exponents ±1 only; it should include the zero-exponent comparisons of Definition A.13, because n=1 with χ=κ̄⁻¹ passes the ±1 tests while C3 fails; affects a stated result.
- **Gap** in FKP22 at Corollary 6.6, p.30: the source states the number-field case without assuming F totally real or ρ̄ odd; it should assume both, as its proof applies Theorem 5.2; affects a stated result.
- **Gap** in FKP22 at the proof of Corollary 6.6, p.30: the source says H⁰ of the twisted adjoint of ρ̄′ vanishes because the semisimplifications agree; it should compare invariants through image(ρ̄,κ̄) inside image(ρ̄′,κ̄); affects the proof.
- **Error** in FKP22 at Remark 6.7, p.31: the source says a torus-valued ρ̄ lying in no proper subtorus satisfies the H⁰ condition; it should require every root character α∘ρ̄ to be nontrivial, as SL₂ with image {±I} fails; affects a stated result.
- **Error** in FKP22 at Example 6.8, p.31: the source says the Lemma A.14 conditions depend only on det ρ̄_f=κ̄^{r−1}; it should use the adjoint-Levi character det(ρ̄_f)δ⁻¹, which depends on δ (e.g. δ=κ̄⁴η, r=4); affects a stated result.
- **Error** in FKP22 at Remark 8.2, p.38: the source says absolutely irreducible ρ̄ satisfies the hypotheses for all p≫_n 0; the bound must depend on F's constant field, since q≡−1 mod p gives induced counterexamples; affects a stated result.
- **Misprint** in FKP19 at Lemma B.1, proof, p.64: the source says the universal-coefficient display tensors with O/ϖⁿ, n being the torsion exponent; it should tensor with O/ϖᵐ, the coefficient level; affects nothing.
