# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at 7fede29)

**Verdict:** needs changes

## R01 (P2) — Local Lefschetz and local duality on regular local rings still have two owners

**Location:** `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:23`: "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 … and owns none of these statements". `README.md:1586`: "PurityForFlatCohomology §1.6 consumes local Lefschetz (§7.3)".

**Claim:** §§5.7, 6.11, 6.12, 7.1 and 7.3 have a single owner, this roadmap, and PurityForFlatCohomology consumes §7.3.

**Witness:** #1840 at 643f30e: `README.md:200–201` and `:3306–3307` name this roadmap importer of §§1.4–1.5; §1.4 (`:1075`) states principal-punctured-open affine Lefschetz and local duality; §1.5 (`:1128`) local Lefschetz; `:1169` (§1.6 *Needs*) cites §1.5.

**Repair** (on the PurityForFlatCohomology side; no change in this folder; the operator settles both pull requests together):
- Delete §§1.4–1.5 and the importer bullets at `:200–201` and `:3306–3307`.
- Cite this roadmap's §§5.7, 6.11, 6.12 and 7.3 instead.
- In `:1169`, replace "§§0.2, 1.1, 1.5" by "§§0.2, 1.1; EtaleDualityAndPerverseSheavesPartII §7.3".

This is the right direction because PurityForFlatCohomology's own route at `:1101` calls Gabber's affine Lefschetz and duality theorems "the substance of this target". Those theorems need Layers 0–6 here, and #1840's §1.4 *Needs* lists none of them.

**Test of the repair at 643f30e:** I edited only `:1169` on a scratch copy of #1840's README.
- With `--movable`, the dependency check prints `moved: PurityForFlatCohomology moved in the merge order from #218 to #386, right after its last supplier EtaleDualityAndPerverseSheavesPartII`, then `depcheck: 237 roadmaps, 2310 edges, 0 problem(s)`.
- Without it, it prints the single line `UPWARD: PurityForFlatCohomology (#218) -> EtaleDualityAndPerverseSheavesPartII (#386) at README lines [1169]`.

A `moved:` line is not a defect. I found no repair report marking this finding as not actionable.

## R02 (P2) — The field formula of §5.7 rests on a lower bound that nobody owns

**Location:**
- `README.md:990`: "if X is integral with fraction field K, cd_ℓ(K) = d + cd_ℓ(k)".
- `:996`: "the lower bound for K is the dimension bound recalled in ILO Exposé 0, Corollaire 8".
- `:994`: "The second assertion needs the ℓ-cohomological dimension of the residue field and is not part of the native statement."

**Claim:** the route proves both inequalities of the formula from listed inputs, and the formula cannot be stated at the pins.

**Witness:** ILO14 lines 396–401 state only the upper bound (0.a), then deduce equality; the lower bound is SGA 4 X 2.4–2.5 (ILO14 lines 16211, 16680–16681), supplied by no layer, *Needs* entry (`:998`) or pin. `TauCeti.cohomologicalDimensionAt` exists at the pin.

**Repair:**
1. Add a step to §5.7's route: under the hypotheses of the second assertion, cd_ℓ(K) ≥ d + cd_ℓ(k), proved by successive codimension-one specializations (SGA 4 X 2.4, as recalled at ILO14 lines 16680–16681).
   - Replace the attribution at `:996` by that step.
   - Add the step's inputs to `:998`.
   - Add SGA 4 to `## References` and to the sources manifest.
2. The invariant is `TauCeti.cohomologicalDimensionAt` (`TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean:146`). Replace the last sentence of `:994` by: "The second assertion is a corollary kept in this README; the ℓ-cohomological dimension of a field k is `TauCeti.cohomologicalDimensionAt ℓ (Field.absoluteGaloisGroup k)` at the pin."
   - Stating the formula in `Suggested.lean` instead is also acceptable: the signature recorded under Verified sound elaborates.

**Test:** the scratch statement below elaborates against the pins (`lake env lean`; the only warning is `declaration uses sorry`). Its instance `A = k⟦t⟧`, k finite, ℓ ≠ p gives cd_ℓ(k((t))) = 2 = 1 + cd_ℓ(k).

## R03 (P3) — §§2.2–2.3 cite the wrong sections of AdicCoefficientsAndComparisonsPartII for monoidal desingularization and the tame quotient

**Location:**
- `README.md:590`: "resolve by Kato–Nizioł monoidal desingularization (AdicCoefficientsAndComparisonsPartII §PA.4.5; ILO VII 4.3)".
- `:606`: "pass to the log regular quotient (AdicCoefficientsAndComparisonsPartII §PA.4.3) and resolve it by monoidal desingularization (AdicCoefficientsAndComparisonsPartII §PA.4.5)".
- `:94`: "§§PA.4.1–PA.4.8 for the shared log-regular carrier, very tame quotients, monoidal desingularization".

**Witness:** #1796 at d6d93fd5 (numbering unchanged since its first commit): §PA.4.3 (`README.md:1044`) is monoidal desingularization, §PA.4.5 (`:1087`) Gabber's preparation lemma; its `:122` takes the very tame quotient theorem from LefschetzPencilsAndVanishingCycles §0.10 (#873 `README.md:724–735`).

**Repair:**
- At `:590`, replace "§PA.4.5" by "§PA.4.3".
- At `:606`, replace "(AdicCoefficientsAndComparisonsPartII §PA.4.3)" by "(LefschetzPencilsAndVanishingCycles §0.10, very tame quotients)", and "(AdicCoefficientsAndComparisonsPartII §PA.4.5)" by "(AdicCoefficientsAndComparisonsPartII §PA.4.3)".
- Add "LefschetzPencilsAndVanishingCycles §0.10" to the *Needs* at `:608` and to the Layer 2 Dependencies at `:652`.
- At `:94`, delete "very tame quotients", and add to the LefschetzPencilsAndVanishingCycles contract (`:122`) that §0.10 supplies the very tame quotient theorem (ILO VI 3.2) used in §2.3.

LefschetzPencilsAndVanishingCycles is already a supplier (merge order #68), so the dependency check is unaffected.

## R04 (P3) — The Conventions define the codimension of a specialization through the wrong image

**Location:** `README.md:35`: "A geometric specialization ȳ ⇝ x̄ means an X-map X_(ȳ) → X_(x̄) of strict henselizations; its codimension is the dimension of the closure of its image in X_(x̄)."

**Claim:** this agrees with §5.1 (`:858`) and with ILO XIV.

**Witness:** ILO14 lines 9873–9875 (XIV 2.1.2) and §5.1 take the closure of the image of the geometric point. In 𝔸²_k, generic point of V(y) ⇝ origin: the map's image contains the generic point of X_(x̄), closure dimension 2; true codimension 1.

**Repair:** replace "the dimension of the closure of its image in X_(x̄)" by "the dimension of the closure in X_(x̄) of the image of ȳ (the closed point of X_(ȳ))". The 𝔸² example then gives 1, matching §5.1 and ILO XIV 2.1.2.

## R05 (P3) — §6.11 restricts to Λ = ℤ/ℓ, although its ILO source and its route cover every Λ = ℤ/n

**Location:** `README.md:1342`: "ℓ a prime invertible in R, Λ = ℤ/ℓ … Then K = Λ(d)[2d], the d-fold tensor power of μ_ℓ shifted by [2d], is the potential dualizing complex". `:1344` repeats the hypothesis.

**Claim:** the statement has the generality its sources support.

**Witness:** ILO XVII 2.4.4.1 (ILO14 line 12835), cited by §6.11, holds under Exposé XVII's standing Λ = ℤ/n, n ≥ 2 (line 12199); §6.11's route (`:1346`) uses no primality; Layer 6 fixes n ≥ 2 (`:1046`).

**Repair:** in `:1342` and `:1344`, state §6.11 for n ≥ 2 invertible in R and Λ = ℤ/n, with K = (μ_n^{⊗d})[2d]. Add a Check: "for n = ℓ prime this is the complex of CS24, proof of Lemma 3.2.3 (CS24 line 1367)". §7.2 then applies it with n = ℓ.

## Previous findings

- **R01 (previous review):** not repaired. `README.md:23` and `:1586` are unchanged, and #1840 at 643f30e still states §1.4 (`:1075`) and §1.5 (`:1128`) and names this roadmap as their importer (`:200–201`, `:3306–3307`). Raised again as R01.
- **R02–R04 (previous review):** stay repaired. The folder is byte-identical to the head that review read (`git diff` of the folder is empty), and the passages it quoted (`:996`, `:998`, `:66`, `:29`, `:1002`, `:1006`, `Suggested.lean:34–38`) are as it recorded.

## Verified sound

**Gate, dependency check, elaboration (run on this head):**
- The gate prints `set_option=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, and the worker's `gate.md` shows `build=0`.
- Required dependency check, complete output: `depcheck: 237 roadmaps, 2309 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder lists 0 paths.
- `lake env lean` on `Suggested.lean` exits 0 in 15.4 s. The only warnings are seven "declaration uses `sorry`", at lines 74, 97, 190, 234, 271, 291 and 306.
- `Suggested.lean` has one module docstring and the namespace `TauCetiRoadmap.EtaleDualityAndPerverseSheavesPartII`. Its imports are `Mathlib` and `TauCeti.RingTheory.RegularLocalRing.GRing` only. It has no `lemma`, no `set_option` and no sorry'd data.

**Signatures:** I compared the 10 elaborated types in `scratch/signatures.md` with the README statements; no binder is lost and none needed changing.
- `affineLefschetz_strictlyLocal` keeps `HenselianLocalRing A`, `IsSepClosed (ResidueField A)`, `IsGRing A`, `ringKrullDim A = ↑d`, `IsUnit ↑n`, `IsAffineOpen U` and `d < q`.
- `cohomologicalDimension_le_of_strictlyLocal` keeps `IsNoetherianRing`, `0 < d`, `IsUnit ↑ℓ` and the affine-basis torsion hypothesis.

**Padding probe:** each of the 7 theorems, on a scratch copy with `first | rfl | simp | infer_instance | trivial | aesop`, fails (errors at lines 89, 115, 195, 241, 280, 300, 317). There is no padding.

**Headline theorems:**
- The README's headlines are: Cohen–Gabber (§§1.1, 1.2, 1.4), partial algebraization (§§1.6–1.7), uniformization (§§2.2–2.3), oriented descent (§§3.5–3.6), Gabber finiteness (§4.2), affine Lefschetz (§§5.6–5.7), the 2d − 1 bound (§5.8), dualizing complexes (§§6.6, 6.9, 6.10, 6.12), local Lefschetz (§7.3) and algebraic tilting (§8.5).
- The statable ones are stated.
- The docstring names each unstated one with its missing carrier, and I checked those reasons at the pins:
  - The pins have no scheme-level quasi-excellence; Tau Ceti has `TauCeti.Excellence.IsGRing` and strict henselizations only.
  - The pins have no integral perfectoid predicate; Tau Ceti's `IsPerfectoidTateRing` and `IsPerfectoidField` are other carriers.
  - The pins have no supports or constructible categories.
- The field formula of §5.7 is not among the README's headlines, so I do not raise it as a missing headline; R02 covers only its stated reason.

**Library declarations opened at the pins (file:line):**
- Mathlib:
  - `Algebra.IsEtaleAt` (`Mathlib/RingTheory/Etale/Locus.lean:35`): formal étaleness of `Localization.AtPrime q`, as `README.md:60` says.
  - `CategoryTheory.Sheaf.H` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:57`): `Ext` from the constant sheaf `ULift ℤ`.
  - `AdicCompletion.maximalIdeal_eq_map` and `residueField_map_bijective` (`Mathlib/RingTheory/AdicCompletion/LocalRing.lean`).
  - `IsAdicComplete.henselianRing` (`Mathlib/RingTheory/Henselian.lean`).
  - `IsLocalRing.ResidueField.mapEquiv`, `Module.IsTorsionFree`, `FixedPoints.subring`, `IsPGroup`, `TStructure`, `smallEtaleTopology` with `HasSheafify` (`Sites/AffineEtale.lean`), `Coverage.toGrothendieck` (`Sites/Coverage.lean:257`), `Scheme.zariskiTopology` (`Sites/BigZariski.lean:51`), and `Surjective`, `IsProper`, `Etale`, `LocallyOfFiniteType`, `IsReduced`.
- Tau Ceti:
  - `Module.Baer.zmod_self`.
  - `TauCeti.AdicCompletion.ringKrullDim_eq`.
  - `IsGRing.regularAlgebraMap_adicCompletion`.
  - `TauCeti.cohomologicalDimensionAt : ℕ → (G : Type u) → [Group G] → [TopologicalSpace G] → [IsTopologicalGroup G] → ℕ∞`.

**Cross-roadmap citations resolved:**
- 61 section citations resolve mechanically against the copy the brief allows:
  - on main: SchemeAndStackFoundations, AdicEtaleGeometry, EnhancedDerivedSheaves, EtaleCohomologyFoundations, PerfectoidSpaces §P1.24 (`README.md:5049`);
  - at open heads: AlgebraicModuliForArithmeticGeometry #853, DeformationAndDerivedPatchingAlgebra #1034, EtaleDualityAndPerverseSheaves #1040, LefschetzPencilsAndVanishingCycles #873, ClassicalAdicEtaleCohomology #875, PerfectoidQuotients #1042, ArcTopologyAndDescent #1755;
  - as a board package: PerfectoidQuotientsPartII (merge order #217).
- The 12 `PA.*` citations resolve by hand to "Layer PA.k, §k.n" of #1796; R03 covers the two whose content is wrong.
- The six names in `scratch/citations.md` are EtaleCohomologyFoundations declarations on main: `etaleTateTwists` (`:233`), `supportLocalization` (`:443`), `lciCycleClass` (`:1135`), `smoothBoundaryPurity` (`:1147`), `etaleExceptionalInverseImage` (`:1181`) and `smoothPurity` (`:1202`).
- PerfectoidQuotientsPartII is in `ORDER.txt` at #217.
- Every supplier precedes #386.

**Ownership and duplication:**
- I searched the open heads and main (`roadmaps grep`) for alteration topologies, h-oriented products, Cohen–Gabber, partial algebraization, local uniformization, potential dualizing complexes, Gabber perversities, affine Lefschetz and the 2d − 1 bound.
- The only second owner is #1840 (R01).
- EtaleDualityAndPerverseSheaves §2.11 (#1040 `:2696`) stays in finite type over a field.
- ClassicalAdicEtaleCohomology §5.4 owns only the scheme oriented product, which §3.1 cites.

**Declared gaps (5):** each slug is in `design/plan.json` and in the README.
- Each gap is minimal against its supplier on main:
  - SchemeAndStackFoundations §0.14 has `henselian_finiteEtale_equivalence` and smooth lifting but not Elkik's algebraization away from V(I).
  - §0.21 has no henselization statement.
  - EtaleCohomologyFoundations §F.3 has only field and excellent-trait generic base change.
- The remaining two gaps rest on uncertified or package-side text and were not reopened.

**Seeded sample (15 targets), each checked for number, printed page, hypotheses and support:**
- §0.1: ILO14 lines 1158, 1198, 1221, 1247, 1253 (II 1.1.2, 1.1.8, 1.2.2, 1.2.5, 1.2.6; pp. 23–25).
- §0.5: lines 1887 (III 4.2, p. 39), 1958 (5.1, p. 41) and 2029 (5.4, p. 42).
- §0.7: line 2064 (III 6.1–6.2, p. 43).
- §0.8: ILO-final-XII lines 229–240 (p. 241), ILO-final-XIII lines 99–108 (p. 263) and ILO14 line 1394 (II 3.1.1, p. 28).
- §1.2: line 2419 (IV 2.2.2, p. 53).
- §2.1: DJ97 line 139 (Theorem 2.4, p. 602) and line 160 (Remark 2.5, p. 603); ILO14 line 5901 (p. 131); ILO-final-IX line 35 (p. 161).
- §2.3: lines 5893 (IX 1.1, p. 131), 6052 (IX 2.3, p. 134) and 1622 (II 4.3.2, p. 33).
- §2.4: ILO-final-XIII 2.2.2, ILO14 line 10474 (XV 3.1.2, p. 222), ILO-final-II line 301 (3.2.1, p. 28) and ILO-final-IX line 27.
- §3.4: line 8936 (XII 1.2.1, p. 189).
- §4.1: lines 9260 and 9294 (pp. 195–196), SGA4half line 7774 (p. 236) and ILO14 line 17123 (XIX 2.2).
- §5.4: lines 10193–10202 (p. 216) and 10258 (p. 217).
- §6.6: line 13878 (XVII 5.1.1, p. 287).
- §6.10: line 12220 (XVII 0.9, p. 257), line 417 (Exposé 0 (c), p. 6) and G04 lines 441–464 (pp. 10–11).
- §6.11: CS24 line 1367 (p. 33) and ILO14 line 12835 (XVII 2.4.4.1).
- §7.1: CS24 lines 1365–1366 (p. 33) and 1207 (Lemma 3.1.2, p. 30).
- All support the statements as written. The README flags no locator as unverified.

**Adversarial table** (sampled targets, the seven headlines, and every target a finding touches):

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| §0.1 alt/S | S = Spec k; T = 𝔸¹_k; origin of 𝔸¹ | objects: κ(η)/k finite ⇒ dim 0; T^md = T but [k(t):k] = ∞ ⇒ T ∉ alt/S; origin maps maximal point to closed point ⇒ not maximally dominant | holds |
| §0.2 alt_ℓ′ | Spec ℤ[i] → Spec ℤ, ℓ = 3 and 2 | degree 2 ∈ 3′ ⇒ covering; every alt_2′ cover has an odd-degree point over η, [ℚ(i):ℚ] = 2 ⇒ not covering | holds |
| §0.4 prime-to-ℓ criterion | k = 𝔽_p(t), ℓ = p ∈ {2, 3}; ℓ ≠ p | test field k^sep (trivial Galois group, no perfection required at ℓ = char) lacks t^{1/p} ⇒ no lift ⇒ not covering; perfect test fields contain t^{1/p} ⇒ lift | holds (ILO-final-II lines 522–527) |
| §0.5 a-isomorphism | X = Spec k⟦t⟧, Y = Spec k, a = 1 | gr¹(O_X) = k[t̄], degree-one piece k; gr¹(O_Y) = k in degree 0, degree one 0 | not 1-isomorphic; Check correct |
| §0.7 | T complete; T henselian | hypothesis itself; III 6.2 passes through T_(t) excellent | holds |
| §0.8 h-topology | Spec ∏_ℕ 𝔽₂; Bl_0 𝔸²_ℂ; doubled infinite-dimensional origin | infinitely many points, no finite surjective subfamily ⇒ not covering; diagonal misses (e, e′) with e ≠ e′ ∈ E ⇒ constant T not a scheme hypercover; U₁ ∩ U₂ not quasi-compact | holds |
| §1.2 / `cohenGabber_equivariant` | μ₂ on k⟦x⟧; S₃ on k⟦x₁,x₂,x₃⟧; involution x ↦ x/(1+x) in char 2; A = k⟦x,y,z⟧/(xz, yz) | t = x², degree 2; e₁, e₂, e₃, degree 6; involution: x/(1+2x) = x, but \|G\| = 2 = 0 ⇒ excluded; t₁ ↦ x, t₂ ↦ y + z: A/(x, y+z) = k⟦y⟧/(y²) finite, the line lies over t₁ = 0, generic fibre = Frac; xz = 0, and no torsion-freeness is claimed | holds |
| §2.1 | ℙ¹_L → Spec K, [L:K] = 2 separable | K would be algebraically closed in K(X′)^G = L(t), but L ⊂ L(t) is algebraic over K | geometric irreducibility needed and present |
| §2.3 Check | R = 𝔽₃[t]_(t), f = x³ + x² + 2x + t, ℓ = 2 | f mod t = x(x² + x + 2), discriminant −7 ≡ 2 a non-square ⇒ 𝔽₃ × 𝔽₉; f(1) = 1 + t, f(−1) = t − 2, f(t) = t³ + t², f(−t) = −t³ + t² − t, all ≠ 0 ⇒ generic degree 3; remaining closed point has degree 2 | not alt_2′; Check correct |
| §2.4 | X = Spec k, Z = ∅; Bl_0 𝔸²_ℂ | degeneracy image is the whole point (not nowhere dense); E × E has empty U-part, Rj_*Λ = 0 | holds |
| §3.4 | π = id; torsion F | equivalence; source states D⁺(T, ℤ/n), and F = colim F[n] on coherent T | holds |
| §4.1 | ILO XIX 2.2 | stalk dimensions 2 at ξ_{n,∞} and 1 at η̄ (ILO14 line 17126) | QE needed; Check correct |
| §5.4 | 𝔸¹_k → Spec k, δ = 0 | rule (1): 1, 0; rule (2): 0, −1 | holds (Source issues: reversed trdeg) |
| §6.6 | trait, n = 5 | Aut_D(Λ(1)[2]) = (ℤ/5)ˣ, 4 elements; pinned: 1 | holds |
| §6.10 | strict trait, Λ = ℤ/6, ⊗ (𝔽₂ ⊕ 𝔽₃[1]) | n₂ = −2, 0; n₃ = −3, −1; ⌊−n/2⌋ = 1, 0 for both | holds |
| §6.11 (R05) | d = 0, 1, 2 | Λ; Λ(1)[2] with H²_s(Λ(1)) = Λ; Λ(2)[4] with H⁴_x(Λ(2)) = Λ in degree 0 | holds for every n ≥ 2 |
| §7.1 | d = 1, f uniformizer; f = 0 | H^i(η) = 0 for i > 1; empty open | holds |
| §7.3 | k⟦x,y⟧, f = x, i = 0, 1, 2 | 0 → 0; 0 → H¹_s(k⟦y⟧) = 0; 0 → ℤ/ℓ(−1) not surjective | holds, range sharp |
| `cohenGabber_equalCharacteristic` | d = 0; cusp at p = 2, 3 | field: κ⟦⟧ = κ; p = 2, t ↦ y: x³ − y² has derivative x² ≠ 0, degree 3; p = 3, t ↦ x: 2y ≠ 0, degree 2 | holds |
| `cohenGabber_mixedCharacteristic` | V = W[π]/(π^ℓ − p), B = V⟦x⟧, H = μ_ℓ; t ↦ x^p | [Frac B : Frac A] = ℓ, B^H = A, invariant degree 1; p x^{p−1} vanishes at the p-fibre ⇒ excluded | holds |
| `partialAlgebraization_equalCharacteristic` | k⟦x,y⟧/(xy), ideals (x), (y); a field | B = k, dim 0 = 1 − 1, C = k[x,y]/(xy); field excluded by 0 < dim | holds |
| `partialAlgebraization_mixedCharacteristic` | p = 3, ℓ = 2, V = W[π]/(π² − 3) | A′ = W⟦x⟧, base W, dim 1 + 1 = 2, residue characteristic 3 | holds |
| `affineLefschetz_strictlyLocal` | n = 0, 1; d = 0; U = ∅; punctured k⟦x,y⟧; non-noetherian V with value group ℤ + ℤ√2 | IsUnit 0 false; ZMod 1 = 0; H³(X − s) = ℤ/ℓ(−2) ≠ 0; H²(K) = ∧²(ℤ/ℓ)² ≠ 0 | holds, each hypothesis used |
| `cohomologicalDimension_le_of_strictlyLocal` | k⟦t⟧, d = 1; d = 0 | H¹(η) = ℤ/ℓ(−1) ≠ 0 at q = 2d − 1; d = 0 has H⁰ ≠ 0, excluded | holds, sharp |
| §5.7 field formula (R02) | k⟦t⟧, k finite; ℓ = p | cd_ℓ(k((t))) = 2 = 1 + 1; cd_p(𝔽_p((t))) ≤ 1 ≠ 2 | true, ℓ invertible needed; lower bound unowned |
| Conventions codimension (R04) | 𝔸²_k, generic point of V(y) ⇝ origin | closure of the image of ȳ: dimension 1; closure of the image of X_(ȳ): dimension 2 | wording wrong |
| §§2.2–2.3 routes (R03) | #1796 §PA.4.3, §PA.4.5 | monoidal desingularization; preparation lemma | swapped |

The tested R02 signature (scratch file; it elaborates against `import Mathlib`, `TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.Basic` and `TauCeti.RingTheory.RegularLocalRing.GRing`):

```lean
example (A : Type) [CommRing A] [IsDomain A] [HenselianLocalRing A]
    [TauCeti.Excellence.IsGRing A] (d : ℕ) (hdim : ringKrullDim A = d)
    (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : IsUnit (ℓ : A)) :
    TauCeti.cohomologicalDimensionAt.{0} ℓ (Field.absoluteGaloisGroup (FractionRing A)) =
      (d : ℕ∞) + TauCeti.cohomologicalDimensionAt.{0} ℓ
        (Field.absoluteGaloisGroup (IsLocalRing.ResidueField A)) := by
  sorry
```

## Not verifiable

- **Ill03** and **Epp73** are settled as uncertified and were not read.
- **SGA 4 X 2.4–2.5** (the lower bound of R02) is not in the sources manifest. I relied on ILO14's own citations of it (lines 16211, 16680–16681).
- **ILO XVII in the published volume** (numbered 0.2 there) is not in the cache. I checked arXiv XVII 0.9 and CS24's citation of 0.2 (CS24 line 1367).
- **LefschetzPencilsAndVanishingCycles (#873):** I have no local checkout, so its line numbers are from `roadmaps show` minus its one-line header.

## Source issues

- **Error** in ILO14 at IX Théorème 1.2, p. 131: the source says the generic fibre X_η need only be smooth, irreducible and of dimension 1; it should require geometric irreducibility, since otherwise the birational quotient conclusion fails for ℙ¹_L over K; affects a stated result; corrected in print at ILO-final-IX Théorème 1.2, p. 161.
- **Misprint** in ILO14 at XIV Corollaire 2.5.2, p. 216: the source says δ_Y(y) = δ_X(f(y)) + degtr(k(f(y))/k(y)); it should be degtr(k(y)/k(f(y))), and the proof's "corollaire 2.5.1" is Proposition 2.5.1; affects a stated result; the same slip is in ILO-final-XIV, p. 289.
- **Error** in G04 at §8, p. 10: the source says R i_x^! K ≅ A[−n(x)] for one integer n(x) for every dualizing K with A = ℤ/n; for composite n each prime-power factor of A has its own shift (ℤ/6 with 𝔽₂ ⊕ 𝔽₃[1]); affects a stated result.
