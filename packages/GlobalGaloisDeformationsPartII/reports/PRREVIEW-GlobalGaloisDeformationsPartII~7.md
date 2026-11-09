# Review of GlobalGaloisDeformationsPartII (pull request #1837 at 837c272)

**Verdict:** needs changes

This is a full review of the same head the r6 review read. Nothing has changed in the folder or outside it since then.

## R01 (P2) — The all-degree uniform torsion theorem of §4.4 is statable at the pins

**Location.** `TauCetiRoadmap/GlobalGaloisDeformationsPartII/Suggested.lean:21–23`: "The all-degree form of §4.4 needs the differentiated action of the Lie algebra on `V ⊗ ℚ_p` for its no-invariants hypothesis, which the pins do not provide, and stays in prose." README line 913 says the same.

**Claim.** The all-degree statement of §4.4 cannot be stated at the pins.

**Witness.** For free V, "no 𝔤-invariants in V⊗ℚ_p" is equivalent to "no open subgroup fixes a nonzero v∈V": take n=0 in NoncommutativeAndEquivariantIwasawa §0.13a item 3, colim_U H⁰(U,V)≅H⁰(𝔤,V). Mathlib `continuousCohomology` (`…/ContCohomology/Basic.lean:131`) covers every degree. The statement below elaborates.

**Repair.** Keep `uniformTorsion_H1`. Add the following after it. Appended verbatim to a scratch copy of the file, this block elaborated with exit 0 and only the expected `sorry` warnings. `continuousCohomology` of a `TopRep` needs G and V in one universe at the pin, so the theorem puts them there.

```lean
universe uG

/-- The action of `G` on `V/ϖʳV` by continuous `ℤ`-linear maps for the discrete topology. -/
noncomputable def modPowContHom {O : Type*} [CommRing O] {G : Type*} [Group G] {V : Type*}
    [AddCommGroup V] [Module O V] (ρ : Representation O G V) (ϖ : O) (r : ℕ) :
    G →* (ModPow ρ ϖ r →L[ℤ] ModPow ρ ϖ r) where
  toFun g := ⟨((modPowRep ρ ϖ r) g).restrictScalars ℤ, continuous_of_discreteTopology⟩
  map_one' := by ext x; simp
  map_mul' g h := by ext x; simp

/-- `V/ϖʳV` as a continuous representation over `ℤ`. -/
noncomputable def modPowCont {O : Type*} [CommRing O] {G : Type*} [Group G] {V : Type*}
    [AddCommGroup V] [Module O V] (ρ : Representation O G V) (ϖ : O) (r : ℕ) :
    ContRepresentation ℤ G (ModPow ρ ϖ r) :=
  ContRepresentation.ofMonoidHom (modPowContHom ρ ϖ r)

/-- README §4.4, all degrees (FKP19 Lemma B.1). If no open subgroup fixes a nonzero vector of
`V`, one power of `p`, depending on the degree, kills `Hⁿ(G, V/ϖʳV)` for every `r`. -/
theorem uniformTorsion {p : ℕ} [Fact p.Prime] {d : ℕ} {G : Type uG} [TopologicalSpace G]
    [ChartedSpace (Fin d → ℚ_[p]) G] [Group G] [IsTopologicalGroup G] [CompactSpace G]
    [LieGroup 𝓘(ℚ_[p], Fin d → ℚ_[p]) ω G]
    [LieAlgebra.IsSemisimple ℚ_[p] (GroupLieAlgebra 𝓘(ℚ_[p], Fin d → ℚ_[p]) G)]
    {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [Algebra ℤ_[p] O]
    [Module.Finite ℤ_[p] O] {ϖ : O} (hϖ : Irreducible ϖ)
    {V : Type uG} [AddCommGroup V] [Module O V] [Module.Finite O V] [Module.Free O V]
    (ρ : Representation O G V) [∀ r : ℕ, ContinuousSMul G (ModPow ρ ϖ r)]
    (hfix : ∀ U : Subgroup G, IsOpen (U : Set G) → ∀ v : V, (∀ g ∈ U, ρ g v = v) → v = 0) :
    ∀ n : ℕ, ∃ a : ℕ, ∀ r : ℕ,
      ∀ x : continuousCohomology n (TopRep.of (modPowCont ρ ϖ r)), (p ^ a : ℤ) • x = 0 := by
  sorry
```

Also make these edits:

- In README §4.4, add one sentence saying that for free V the no-invariants hypothesis is equivalent to `hfix`, citing NoncommutativeAndEquivariantIwasawa §0.13a item 3 at n=0.
- Name the new declarations in §4.4.
- Replace the docstring sentence quoted above.

A degenerate-case check on the repair: for finite Γ the trivial subgroup is open, so `hfix` forces V=0. That matches V^𝔤=V for 𝔤=0, the case §4.4 excludes.

## R02 (P3) — §2.5 requires less disjointness of L than FKP22 Proposition 3.6 does

**Location.** README line 677: "finite Galois L/F containing K, unramified outside T and disjoint over K from K∞ and the fields cut out by all old classes in `H¹(Γ_{F,T},M*)`".

**Claim.** Under this hypothesis an arbitrary g_i∈Gal(L/K) can be prescribed together with q_i mod pᶜ and the classes h^{(w)}.

**Witness.** FKP22 lines 531–533 (p.12) require disjointness from the compositum of K∞ with the K_ψ. A separately disjoint L can lie in K_ψ·K(μ_{p^{D+1}}). Then σ_w|L=a−b with b fixed by q_i and a=ψ(σ_w)≠0, so −b is never attained.

**Repair.** Write "linearly disjoint over K from the compositum of K∞ with the fields K_ψ for all ψ∈H¹(Γ_{F,T},M*)". §3.5 already proves exactly this for L=K(ρ_{n−1}(g^der)), so §§2.6, 3.4 and 3.6 need no further change. Tested on the instance above: that L lies in K_ψ·K(μ_{p^{D+1}}), so it fails the repaired hypothesis. When the compositum C of the K_ψ already meets K∞, the two readings coincide (computed in the table), so the gap only matters when C∩K∞=K.

## R03 (P3) — ND.0, PL.6 and PL.7 resolve only in the suppliers' superseded design files

**Location.** README line 178: "Consume ND.0, especially the p-valued analytic structure and ordered-basis charts." README line 270: "Consume PL.7, “The ANT lifting theorem with source primitivity”, and its full eight hypotheses."

**Claim.** These ids of LocallyAnalyticDistributionsPartII and PotentialAutomorphyInfrastructurePartII supply the cited content.

**Witness.** Both board packages' current `README.md` contain no `ND.`/`PL.` id (grep count 0). LocallyAnalyticDistributionsPartII Scope (its line 21) hands analytic structure, ordered coordinates and p-valuations to NoncommutativeAndEquivariantIwasawa §§0.2, 0.6, 0.7. The ANT theorem is PotentialAutomorphyInfrastructurePartII §8.17.

This differs from red-team round 1 a-F01/a-F02, which were settled because the ids then existed in the suppliers' `design/README.md`. The package READMEs written after that renumber the layers: design PL.6 is now Layer 7 and PL.7 is now Layer 8. ND.0's p-valuation and chart targets have moved to NoncommutativeAndEquivariantIwasawa.

**Repair.**

- Delete the subsection "From TauCetiRoadmap.LocallyAnalyticDistributionsPartII" (lines 176–178) and its mentions at lines 15, 917, 925 and 1000. Cite NoncommutativeAndEquivariantIwasawa §§0.2, 0.6 and 0.7 instead. That roadmap is already a supplier, at merge-order line 29; §0.2 proves that every compact ℚ_p-analytic group has an open normal uniform subgroup.
- At lines 19, 270, 1578, 1580, 1587 and 1621, cite PotentialAutomorphyInfrastructurePartII §8.17 "The ANT lifting theorem with weak primitivity" in place of PL.7; its statement is that of §8.8.
- Cite §7.3 "Primitivity below the characteristic" for the small-rank comparison, and §§7.4 and 7.14 for image invariance, in place of PL.6.

The dependency check is unaffected, because both suppliers stay earlier in the merge order.

## R04 (P3) — The generator lemma is still cited at a file that does not exist at the pin

**Location.** README line 64: "(`TauCeti.UniversalEnvelopingAlgebra.ι_mem_augmentation` in `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/Basic.lean`)".

**Claim.** The lemma is in that file at the pinned Tau Ceti.

**Witness.** This head's `lake-manifest.json` pins Tau Ceti 358314d. There the file is absent, and the theorem is at `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation.lean:82`. The quoted path exists only at main's pin, 2fd255d.

This is r6 R01. The head is unchanged, and no repair report marks it not actionable.

**Repair.** Either of the following:

- Keep the current pin and change the path to `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation.lean`, as r6 tested.
- Or merge main so the manifest pins 2fd255d. In that case, also cite Tau Ceti's Whitehead lemmas `LieModule.Cohomology.exists_eq_lie_of_d₁₂_eq_zero` and `LieModule.Cohomology.exists_d₁₂_eq` (`TauCeti/Algebra/Lie/Whitehead.lean:105, 113` at 2fd255d) by name. NoncompactQuantumSymmetry §P.4 itself only consumes them. They are absent at 358314d, so citing §P.4 is right at the current pin.

Say in the pull-request description which pin the file paths follow.

## R05 (P3) — The first Check of §0.7 does not test the distinction it states

**Location.** README line 404: "If V=F_p with trivial conjugation, its cocycle field may be the first degree-p cyclotomic layer; absence of nontrivial constituents cannot be replaced by absence of submodules."

**Claim.** The Check separates §0.7's criterion from a submodule condition.

**Witness.** The criterion at line 398 is "no nonzero trivial quotient", not a condition on nontrivial constituents. V=𝔽_p trivial has both a trivial submodule and a trivial quotient, so it cannot separate a quotient condition from a submodule condition.

**Repair.** Replace the Check with this one: if Gal(K_z/K) is a nonsplit extension W of 𝔽_p by 𝔽_p(χ) with χ≠1, then W has a trivial quotient but no trivial submodule, so K_z may meet K∞ in degree p. The reverse nonsplit extension W′ of 𝔽_p(χ) by 𝔽_p has a trivial submodule but no trivial quotient, and the intersection is K.

Tested:

- A trivial line in W maps isomorphically onto the quotient 𝔽_p, which would split W.
- An equivariant W′→𝔽_p that is nonzero on the trivial line would split W′. One that vanishes on it factors through 𝔽_p(χ)→𝔽_p, which is 0.

## Previous findings

- r6 R01 (generator-lemma path): not repaired. Line 64 still reads "`TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/Basic.lean`", and the folder diff since 837c272 is empty. It is carried as R04 above.

## Verified sound

**Gate.**

- The worker's gate at 837c272, including the targeted build, passes with every check 0.
- I reran the text checks on this head: `gate GlobalGaloisDeformationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Dependency check** (`gate --depcheck … --movable`), complete output: `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.

**Elaboration.**

- `lake env lean TauCetiRoadmap/GlobalGaloisDeformationsPartII/Suggested.lean` exits 0 in 22 s. Its only message is `declaration uses 'sorry'` at 113:8.
- The phantom declaration `in` in the worker's signature extraction comes from its parser reading the `module` header; it is not in the file.

**`#check @name` binder comparison.** I elaborated a scratch copy with `#check @ModPow`, `@modPowSub`, `@modPowRep` and `@uniformTorsion_H1`. The types match README §4.4 and keep every binder in the declaration's own signature: `CompactSpace`, `IsTopologicalGroup`, `LieGroup … ω`, `LieAlgebra.IsSemisimple ℚ_[p] (GroupLieAlgebra …)`, `IsDomain`, `IsDiscreteValuationRing`, `Module.Finite ℤ_[p] O`, `Irreducible ϖ`, `Module.Finite O V`, `Module.Free O V` and `∀ r, ContinuousSMul G (ModPow ρ ϖ r)`. Nothing is dropped and nothing changed.

**One-tactic probe on `uniformTorsion_H1`.** Each attempt failed:

- `simp` made no progress.
- `⟨0, fun r x => by simp⟩` left `x = 0`.
- `aesop` made no progress.
- `⟨1, …subsingleton⟩` could not synthesize `Subsingleton (H1 …)`.

It is not padding, and the file states nothing else.

**Headline theorems.** The README's headlines are:

- §6.3, Theorem E;
- §6.5 and §6.6;
- §7.6;
- §8.5, Theorem B;
- §§8.10–8.11;
- §§9.2–9.5;
- §§10.1–10.3;
- §4.4.

Only §4.4 has native carriers. Its degree-one form is stated; for the all-degree form see R01. The docstring names every other headline and the carrier it lacks: newform and Lafforgue attachments with lattices, G-valued deformation spaces, ordinary local conditions, compatible systems. I found none of those carriers at the pins.

**Library declarations opened at the pins.**

Mathlib f6090c7:

- `GroupLieAlgebra` bracket, `LieRing` and `LieAlgebra` instances (`Mathlib/Geometry/Manifold/GroupLieAlgebra.lean:93, 230, 262`). They assume `minSmoothness 𝕜 3`, which is ω over ℚ_p, so the semisimplicity hypothesis concerns the group bracket.
- `continuousCohomology` (`…/ContCohomology/Basic.lean:131`).
- `TopRep` (`Mathlib/RepresentationTheory/Continuous/TopRep.lean:31`).
- `ContRepresentation` (`…/Continuous/Basic.lean:54`). Each operator is individually continuous; joint continuity is not included, which is why the theorem carries the `ContinuousSMul` hypothesis.
- `Subrepresentation.quotient` (`Mathlib/RepresentationTheory/Subrepresentation.lean:114`).

Tau Ceti 358314d:

- `TauCeti.exists_isCompl_of_isKilling` (`…/HighestWeight/CompleteReducibility.lean:259`);
- `TauCeti.casimirElement` and `TauCeti.casimirElement_mem_center` (`…/UniversalEnveloping/Casimir.lean:128, 178`);
- `TauCeti.HopfIdeal.augmentation` (`TauCeti/Algebra/HopfAlgebra/HopfIdeal/Augmentation.lean:61`);
- `TauCeti.UniversalEnvelopingAlgebra.ι_mem_augmentation` (`…/UniversalEnveloping/Augmentation.lean:82`);
- `TauCeti.exists_isHighestWeightVector_and_lieSpan_eq_top` (`…/HighestWeight/Existence.lean:208`);
- `TauCeti.casimirScalar` and `TauCeti.casimir_smul_of_isHighestWeightVector_of_lieSpan_eq_top` (`…/HighestWeight/Casimir.lean:271, 350`);
- `TauCeti.casimirScalar_eq_zero_iff` (`…/Separation.lean:171`);
- `TauCeti.isTrivial_of_isHighestWeightVector_weight_zero_of_isIrreducible` (`…/Trivial.lean:104`);
- `TauCeti.ContCohomology.explicitInfRes_exact` (`…/ContCohomology/Inflation/Basic.lean:371`);
- `TauCeti.ContCohomology.H1` (`…/ContCohomology/LowDegree.lean:725`).

All 29 backticked library file paths in the README were checked at the pins. 28 exist; the missing one is R04's. No carrier for V/ϖʳV as a representation exists at either pin, so `ModPow` duplicates nothing.

**Cross-roadmap citations resolved: 75 section ids or id ranges across 25 suppliers, headings read at the heads or on main.**

At open heads:

- NoncommutativeAndEquivariantIwasawa §§0.2, 0.6, 0.7, 0.11 (step 6: the length-d resolution) and 0.13a. Items 2–5 of §0.13a say what the README consumes.
- NoncompactQuantumSymmetry §P.4 (Whitehead lemmas in degrees 1 and 2 over any field of characteristic zero).
- ArithmeticGaloisDuality R02.1.2–R02.1.3, R02.2.1, R02.3.1, R02.3.4, R02.4.2 (where Ш^r_S is defined), R02.4.3, R02.4.5, R02.5.1, R02.6.2, D7.4, D7.7.1–D7.7.4.
- LocalGaloisDeformationRings §§1.17, 1.20, 1.21, 1.22, 2.5, 2.14, 2.28, 2.30, 3.11, 6.5, 6.17, 8.5, 8.10.
- GlobalGaloisDeformations §§3.3–3.8 and G7 §§8.1–8.4.
- ArithmeticGaloisRepresentations §§1.1–1.2, 1.6–1.11 (with the paragraph "Complete reducibility and closed tuples" in §1.11), Layer 2, §§7.2–7.7.
- IntegralHeckeAndGaloisDeterminants §1.4, the paragraph "Classical Ribet lattice".
- AlgebraicModularFormsAndSerreWeights Layers 4, 5, 7 and §§6.1, 6.2, 6.4.
- AutomorphicGaloisRepresentations Layers 1, 3, 5; AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6.
- ClassicalSerreModularity Layer R27.6 (`R27.6/full-classical-serre-theorem`) and §I.1 (`I.1/residually-reducible-ordinary-lifting`, whose hypotheses match line 232).
- OrdinaryAutomorphicFormsAndModularityLifting §5.3; GL2ModularityLifting §10.15.
- AutomorphicLFunctionsAndLocalFactors Layer AL.3. The quoted title resolves to AL.3.10.13, which proves both directions.
- ModularityAndLanglandsExtensions §§2.28, 2.48; AutomorphicSpectralTheory §7.1; FunctionFieldArithmetic §5.8.

On main:

- ReductiveGroups Layers 2, 7, 8; ReductiveGroupsPartII RG2.0.3, RG2.1, RG2.2.
- ProfiniteCohomology Layers 2–8; ClassFieldTheory Layers 7, 13.
- ModularForms Layers 4, 8G, 10C; AffineLieAlgebras Layer A1.
- Chebotarev Layer 10 and ProfiniteProPGroups Layer 3, both under `Completed/`.

The only failures are R03's three ids.

**Supplier order.** Every named supplier is on main or earlier in the merge order than this roadmap (line 367). For example: NoncommutativeAndEquivariantIwasawa 29, ArithmeticGaloisDuality 59, LocalGaloisDeformationRings 84, GlobalGaloisDeformations 85, ModularityAndLanglandsExtensions 193, PotentialAutomorphyInfrastructurePartII 278, FunctionFieldArithmetic 352.

**Ownership and overlaps.**

- No other roadmap, on main or at the 466 open heads, plans relative Selmer groups, the doubling method or FKP22 Theorem E. I searched for "relative Selmer", "Hamblen", "doubling method", "Fakhruddin" and "FKP".
- ModularityAndLanglandsExtensions §2.28 owns residual potential automorphy and only cites FKP22 Theorem E for its two-place variant. That is one owner per object.
- The overlaps tool reports no pull request changing this roadmap, no dropped id and no id defined only by an open revision.
- No declaration of `Suggested.lean` reuses a name declared in another roadmap.

**Declared gaps.** `design/plan.json` has the 26 gaps of the brief and the README has 26 matching "What … must provide" contracts. Every gap names a supplier earlier in the merge order. None is vague, and none asks for what a pin provides: I grepped for the root-position, centralizer, Larsen–Pink and Levi-semisimplification statements.

Four README contracts are worded more broadly than their `plan.json` `needs`:

- the fixed-quotient obstruction, root cocycle lattice and smooth local approximation contracts add global-function-field and equal-characteristic generality;
- the finite-image semisimplification contract is stated over an arbitrary field, with the Levi and scalar-extension clauses.

This is not a finding under the brief's gap rules. The worker should make sure the announcement to each supplier carries the README wording.

**Seeded sample.** I read all 15 targets at their locators:

- §0.4 is FKP22 Definition 3.2 (line 468) and Remark 3.3 (line 472) on p.11, with FKP19 Notation 5.1 (line 1106, pp.25–26).
- §0.7 is FKP22 p.11 (lines 482–483) and p.13 (lines 578–579).
- §2.4 is Lemma 3.4(2) (lines 494–498).
- §§2.5–2.6 are Proposition 3.6 (lines 527–560), with the proof through p.15.
- §2.7 is the construction at lines 657–665.
- §2.8 is Lemma 3.7 (lines 666–694).
- §3.3 is FKP19 Lemma 3.9 (line 851, p.19).
- §3.5 is FKP22 Lemma 4.3 (line 875, p.20; Assumption 4.1, line 851, p.19).
- §4.4 is FKP19 Lemma B.1 (line 2842, p.64), with Lazard65 III (3.1.3) on printed p.91 (line 3305), (3.1.7.4) on p.94 (line 3415), V (2.2.2.3) on p.165 (line 6093), (2.2.3.1) on p.166 (line 6113) and Theorem (2.4.10) on pp.178–179 (line 6597).
- §4.5 is FKP19 Corollary B.2 (line 2867).
- §5.4 is FKP19 Theorem 6.9 (line 2209, p.49) and Remark 6.10 (line 2242, p.50).
- §7.2 is FKP22 Lemma 6.2 (line 1253, p.28).
- §8.2 is Lemma 7.1 (line 1409, p.32).
- §10.1 is Proposition 9.1 (line 1864, pp.41–42), Definition B.2 (line 2378, p.52) and Lemma B.4 (pp.54–55).

All the hypotheses agree except §2.5's (R02). §4.5 deliberately uses the full Γ_F image in place of FKP19's Γ_{F̃} (line 2037), which is what C1 needs. §10.1 adds a second Steinberg place, as ModularityAndLanglandsExtensions §2.28's finite-set variant does. §10.1 also uses the corrected weight sign (see Source issues).

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.4 trivial primes | p=3; norms 7, 5, 19; ρ̄(Frob)=diag(1,2) at norm 7 | 7−1=6, v₃=1, trivial if ρ̄ is trivial there; 5≡2 mod 3, not trivial; rank(diag(1,2)−I)=1, not trivial; 19−1=18, v₃=2 ≥ D=1 | holds | none |
| §0.7 first cyclotomic layer | p=3, D=1; function field with constants 𝔽_Q, Q≡1 mod 3; V=𝔽₃ trivial; a −1 character | Gal(K∞/K)= closure of Q^ℤ in 1+3ℤ₃ ≅ ℤ₃; Gal(K_z/K) killed by 3, so the intersection has degree 1 or 3, never 9; Gal(K/F) acts trivially on Gal(K∞/K) (Lemma 2.1), so a −1 action forces degree 1 | holds | R05 (Check wording) |
| §2.4 one-prime sequence | M_Z=𝔽₃ trivial at w; Z=0 | H¹(Γ_{F_w},𝔽₃)=𝔽₃² (σ,τ); L_{w,Z}=𝔽₃², L^ur=𝔽₃, increase 1=dim 𝔽₃Z; Z=0: L=L^ur, increase 0, target {0} | holds | none |
| §2.5 spanning classes | cokernel 𝔽₃²; a degree-p L inside K_ψ·K(μ_{p^{D+1}}) that is neither factor, with K_ψ∩K∞=K and C∩K∞=K | ranks: (1,0),(0,1) give 2, a repeated (1,0) gives 1; Gal(K_ψK(μ)/K)=𝔽_p×𝔽_p, σ_w↦(a,b), L cut out by a−b; the class exists only if a=ψ(σ_w)≠0, b is fixed by q_i, so g=−b is missed. If C∩K∞=K(μ_{p^{D+1}}): H+(0×pℤ_p)=H+(ker π×0)=Γ forces H=Γ, so the two readings coincide | holds with the source's composite hypothesis, fails with separate disjointness | R02 |
| §2.6 prescribed vector | k=𝔽₉, Z≠0 | 𝔽₃Z∖0 has 2 elements; kZ∖0 has 8 | holds | none |
| §2.7 marked dual classes | one and two basis indices | inertia at (w,t_b,t₀)=(1,1,0); the matrix at (t₁,t₂) is I₂, rank 2; η(gσg⁻¹)=gη(σ) on Γ_K and η(τ_w)=e_b*, so the image is 𝔽_p[Γ_F]e_b* | holds | none |
| §2.8 inertia-generated disjointness | three 𝔽₃-lines in a C₃² extension; general L_i, B | degree product 27, compositum 9; there the hypotheses fail (L₁⊂L₂L₃ is unramified at v₁); in general inertia at v_i in ∏L_j lies in factor i and dies in any quotient unramified at v_i | holds | none |
| §3.3 normalized pairing | u=(1,0), t=(0,1); 𝔽₅; t∪t | inv(u∪t)=−1, inv(t∪u)=+1, which are 4 and 1 mod 5; t∪t=−t∪t gives 2(t∪t)=0, so t∪t=0 for p odd; FKP19 Lemma 3.9 states the two one-unramified cases | holds | none |
| §3.5 congruence field | SL₂, p=3, O=ℤ₃, level 3 | [h,e]=2e, [h,f]=−2f, [e,f]=h span sl₂(𝔽₃); (1+3X)³≡1+9X mod 27, so the abelianization of Ĝ(ℤ/27) is sl₂(𝔽₃), of dimension 3; a trivial quotient is excluded by C1 and the nondegenerate trace form (FKP19 Assumption 2.1, lines 582–587) | holds | none |
| §4.4 and `uniformTorsion_H1` | Γ=ℤ₃ acting trivially on ℤ₃; Γ=S₃, p=3; r=0; SL₂(ℤ₃) on ℤ₃² | H¹(ℤ₃,ℤ/3ʳ)=ℤ/3ʳ is unbounded, but 𝔤=ℚ₃ is abelian, so excluded; S₃ has 𝔤=0 semisimple and H¹ killed by 6 and by 3ʳ, hence by 3 (a=1); ModPow at r=0 is V/V=0; sl₂ is simple, so the theorem applies | holds, not padding | none |
| §4.4 in all degrees | Γ finite; scratch statement | U={1} is open, so the hypothesis forces V=0, matching V^𝔤=V; colim_U V^U=V^𝔤 (NoncommutativeAndEquivariantIwasawa §0.13a item 3, n=0); scratch exit 0 | statable | R01 |
| §4.5 deep H¹ reduction | C₃ acting by ζ₃ on ℤ₃[ζ₃], ϖ=ζ₃−1 | 1+ζ+ζ²=0, so H¹=(O/ϖʳ)/ϖ has order 3 for every r≥1 and reduction to level 1 is the identity on k; H⁰(C₃,k)=k, so excluded; with exponent a and injective inclusions, N≥m+a gives the zero map | holds | none |
| §5.4 annihilation | ℤ₃, M=2, \|Sel_M\|=81 | 81→27 strictly decreases a positive integer while the relative dimension stays 1; at most 4 drops from 3⁴ | holds | none |
| §7.2 extension spaces | W⁰ of dimension 1, m new primes; W⁰=0 | L_v=W⊕W⁰ against h⁰=dim W gives +1 per prime, +m in total; W⁰=0 gives 0 | holds | none |
| §8.2 nonsplit GL₂ | p=5, ⟨diag(−1,1), I+E₁₂⟩; p=3 with χ̄=κ̄ | commutant in sl₂ is diag(a,−a) with [X,E₁₂]=2aE₁₂=0, so a=0 and the dimension is 0; at p=3, κ̄=κ̄⁻¹, so the exceptional case is excluded there | holds | none |
| §10.1 symplectic lift | n=1, ξ=0; n=2; a multiplier −1 involution of GSp₄; the source's sign | weights 0,1 sum to 1=HT(κ⁻¹); 0,1,2,3 pair to 3=HT(κ⁻³); the involution fixes gl₂, of dimension 4=\|Φ⁺(C₂)\|, while the identity fixes 10; the source's 0,−1,−2,−3 pair to −3≠3 | README right, source misprint | none |
| §6.3 Theorem E | Gₘ; GL₂; t=2, e′=3; finite μ | derived kernel of order 1 and the lift is μ; dim sl₂=3; ϖ²=ϖ′⁶; closure dimension 3+0 | holds | none |
| §8.5 Theorem B | p=3, χ̄ of ℚ(√−2) | χ̄(c)=−1; −2≡1 mod 3, so χ̄ is trivial on Γ_{ℚ₃} (Pan route) and the ratio 1≠ω (Pan22 lines 100–104); κ̄⁻¹ is ramified at 3, so it is not χ̄; μ reduces to κ̄^{r−1}χ̄κ̄^{1−r}=χ̄ | holds (FKP22 Theorem 7.4, line 1601) | none |
| §8.10 finiteness | K_f=ℚ(√5), p=11 | 4²≡5 mod 11 gives two degree-1 primes; bound 1+2·2=5=2[K_f:ℚ]+1 | holds | none |
| §8.11 boundary | p=5, χ̄=κ̄, S={5} and S′={5,11} | ℤ[1/5]× modulo 5th powers is ⟨5⟩ since −1=(−1)⁵, so the dimension is 1 (Pic=0); with S′ the classes of 5 and 11 give dimension 2 | holds | none |
| §9.2 function fields | p=3, n=2 and n=3 | squaring on 1+3ℤ₃ has unit derivative 2; cubing has derivative 3≡0; the Teichmüller determinant has order dividing \|k×\| | holds with p∤n | none |
| R03 citations | the two board packages' README.md | grep count of `ND.`/`PL.` ids: 0 and 0; ANT theorem at §8.17, primitivity at §§7.3, 7.4, 7.14 | drift | R03 |
| R04 path | Tau Ceti 358314d against 2fd255d | `Augmentation/Basic.lean` absent at 358314d; `ι_mem_augmentation` at `Augmentation.lean:82` | wrong at the pin | R04 |

## Not verifiable

- Gur99 Theorem A, NSW08 Theorems 8.6.7, 8.6.10 and 8.7.9, and BC14 Lemma 10, Propositions 11 and 32 and Definitions 29–30 are settled as uncertified and cited by locator only. They were not read.
- Locators outside the seeded sample were not re-read this round: ANT20, BLGGT14, BLGHT11, LP11, Ribet10, Ser05 and BMR05 (the last two were read in r6). Their texts are in the cache.

## Source issues

- **Misprint** in FKP22 at §9, the paragraph before Proposition 9.1 and its proof, p.41: the source gives the ordinary character ψ_i Hodge–Tate weight −(ξ_{τ,n−i+1}+i−1) when HT(κ)=−1; it should be +(ξ_{τ,n−i+1}+i−1), as its "weights increase with i" and similitude κ^{1−2n} require; affects the proof.
- **Misprint** in FKP22 at Proposition 9.1, p.41: the source takes the GL_{2n} ordinary weight ξ_v in (ℤⁿ₊)^{Hom(F_v,Q̄_p)}; it should be (ℤ^{2n}₊)^{Hom(F_v,Q̄_p)} for a 2n-dimensional representation; affects nothing.
- **Gap** in FKP22 at Lemma 3.7, pp.15–16: the source deduces ramification at v of a common quotient because τ_v generates each single Gal(K_{η_b}/K); it should require the inertia conjugates to generate the joint product over b, which fails for repeated constituents; affects a stated result.

The other source issues registered in the r5 and r6 reports (FKP22 Example A.17, Corollary 6.6 and its proof, Remark 6.7, Example 6.8, Remark 8.2; FKP19 Lemma B.1 proof) concern passages this round did not re-read, and they stand as registered.
