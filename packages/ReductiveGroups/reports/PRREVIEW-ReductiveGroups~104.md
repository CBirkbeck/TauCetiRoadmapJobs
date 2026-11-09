# Review of ReductiveGroups (pull request #1332 at e08161d)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ReductiveGroups/README.md` (4769 lines) and `TauCetiRoadmap/ReductiveGroups/Suggested.lean` (415 lines, 29 declarations, 13 sorried theorems) at `e08161d`. The pins are those of the branch's `lake-manifest.json`: Tau Ceti `a91d3aaf`, Mathlib `6b7abb3c`. The folder is byte-identical to the head r101 read. The gate, the dependency check and the build pass. The sampled locators check out. There are seven findings: two P2 and five P3.

## R01 (P2) — Lang's theorem gets a second owner on main: ReductiveGroupsPartII still claims it

**Location.** `TauCetiRoadmap/ReductiveGroups/README.md:1932–1934`: "This layer owns Lang surjectivity for smooth geometrically connected finite-type groups over finite fields, including nonreductive groups, and its fixed-coset and exactness consequences". Also lines 26–29 ("ReductiveGroupsPartII … are consumers"), lines 1953–1963 and `Suggested.lean:301`.

**Claim.** ReductiveGroupsPartII consumes Layer 7a's Lang theorem, so Layer 7a is its only owner.

**Witness.** On main, `TauCetiRoadmap/ReductiveGroupsPartII/README.md:61–62` says "RG2.3 is the single owner in Tau Ceti of Lang's theorem". RG2.3.7 (lines 5201–5215) states surjectivity, H¹ = 1 and point surjectivity, and its `Suggested.lean:212` declares `Lang.lang_surjective`. No open pull request revises PartII.

**Repair.** Moving ownership down is right. Main's README line 692 consumed RG2.3.7, which closed a loop, because PartII consumes ReductiveGroups Layers 0–9. What is missing is the change on the PartII side. Make it in a companion pull request on `ReductiveGroupsPartII`, name it in this description's merge-order paragraph, and merge it no later than this one:
- at PartII lines 61–62 and 3776–3777, replace both single-owner clauses by a citation of ReductiveGroups Layer 7a;
- in RG2.3.7, cite `FiniteFieldPoints.lang_surjective` for (a) and Layer 7a for (b)–(c), and add Layer 7a to its *Needs:*;
- delete `Lang.lang_surjective` from PartII's `Suggested.lean`, keeping `lang_proAlgebraic_surjective`.

Tested: PartII's theorem is ours at `K = AlgebraicClosure F`, with σ the `|F|`-power map. Its `smoothCommHopfAlgProperty F H.obj` unfolds to `Algebra.Smooth F H` (`Smooth/CommHopfAlgCat.lean:40–42`), so nothing is lost.

## R02 (P2) — Layer 11's arrangement and braid theorems can be stated at the pins, but are neither stated nor named as unstatable

**Location.** `README.md:4404–4406`: "This gives a generator-characterized based isomorphism `π₁(B_W,[b]) ≃ TauCeti.ArtinGroup (coxeterMatrixOfBase P base)`". Also lines 4322–4323 ("Construct the based comparison with native `TauCeti.BraidGroup n`"). For Layer 11, `Suggested.lean` states only `permutation_extension_nonsplit` (lines 403–414), and the docstring (lines 13–79) does not mention these two theorems.

**Claim.** `Suggested.lean` states every headline that is statable at the pins, and its docstring names each one that is not. These are Brieskorn's theorem (§11B) and the identification of the braid group with the fundamental group of the unordered plane configuration space (§11A). GeometricTopology on main consumes the latter (`GeometricTopology/README.md:2097`).

**Witness.** Both statements below elaborate at `a91d3aaf`/`6b7abb3c` with no error. They use native `coroot'`, `weylGroupRootRep`, `MulAction.orbitRel`, `arrowAction`, `FundamentalGroup`, `TauCeti.coxeterMatrixOfBase` (`Coxeter/Matrix.lean:278`), `ArtinGroup` and `BraidGroup`, plus short definitions with real bodies.

**Repair.** In `namespace BraidMonodromy`, add the following. A `Nonempty (… ≃* …)` conclusion passes statement hygiene only under a `nonempty_*` name. `ι` is a token in this file's opened scopes, so the index type is called `Λ`.

```lean
def orderedConfiguration (n : ℕ) : Set (Fin n → ℂ) := {z | Function.Injective z}
def unorderedConfiguration (n : ℕ) :
    Set (Quotient (@MulAction.orbitRel (Equiv.Perm (Fin n)) (Fin n → ℂ) _ arrowAction)) :=
  Quotient.mk _ '' orderedConfiguration n
theorem nonempty_mulEquiv_braidGroup (n : ℕ) (z : Fin n → ℂ) (hz : z ∈ orderedConfiguration n) :
    Nonempty (FundamentalGroup (unorderedConfiguration n) ⟨Quotient.mk _ z, z, hz, rfl⟩ ≃*
      TauCeti.BraidGroup n) := by sorry
variable {Λ M N : Type*} [Finite Λ] [AddCommGroup M] [Module ℂ M] [AddCommGroup N] [Module ℂ N]
def weylRegularLocus (P : RootPairing Λ ℂ M N) : Set M := {v | ∀ i, P.coroot' i v ≠ 0}
noncomputable abbrev weylRootAction (P : RootPairing Λ ℂ M N) : MulAction P.weylGroup M :=
  MulAction.compHom M P.weylGroupRootRep
def weylRegularOrbitSpace (P : RootPairing Λ ℂ M N) :
    Set (Quotient (@MulAction.orbitRel P.weylGroup M _ (weylRootAction P))) :=
  Quotient.mk _ '' weylRegularLocus P
theorem nonempty_mulEquiv_artinGroup [TopologicalSpace M] [IsModuleTopology ℂ M]
    [FiniteDimensional ℂ M] (P : RootPairing Λ ℂ M N) [P.IsCrystallographic] [P.IsReduced]
    (b : P.Base) (v : M) (hv : v ∈ weylRegularLocus P) :
    Nonempty (FundamentalGroup (weylRegularOrbitSpace P) ⟨Quotient.mk _ v, v, hv, rfl⟩ ≃*
      TauCeti.ArtinGroup (TauCeti.coxeterMatrixOfBase P b)) := by sorry
```

Also add docstrings, the imports `TauCeti.GroupTheory.Coxeter.Artin` and `TauCeti.LinearAlgebra.RootSystem.Coxeter.Matrix` (both also exist at main's pin `2fd255d9`), and the five names in §§11A–11B and in the module docstring. Tested: with these additions (and the R03/R04 repairs), a scratch copy of `Suggested.lean` elaborates with 14 `sorry` warnings and no error. Rank checks: A₁ gives `ℂˣ/±1`, π₁ = ℤ = Art(A₁); with no roots, π₁ = 1 = Art(∅); n = 2 gives `Conf₂(ℂ) ≃ ℂ × ℂˣ`, π₁ = ℤ = B₂.

## R03 (P3) — `exists_closed_orbit` follows in one term from `exists_closed_orbit_in_closure`

**Location.** `Suggested.lean:149–156`, "A nonempty finite-type action scheme has a closed orbit", and `README.md:881–884`, "the last explicitly assumes nonempty X(k)".

**Claim.** It is a separate headline.

**Witness.** In a scratch copy, `(exists_closed_orbit_in_closure G X hx.some).imp fun _ h => h.1` closes it under the same binders, with no error. It applies the previous headline at a chosen point and forgets the containment.

**Repair.** Delete `exists_closed_orbit` from `Suggested.lean`. In §3A.4a, write the existence of a closed orbit for nonempty X(k) as a consequence of `AlgebraicOrbits.exists_closed_orbit_in_closure`, without the backticked name. Tested in the repaired scratch copy.

## R04 (P3) — `orbit_locallyClosed` assumes smoothness, affineness and separatedness that its source does not use

**Location.** `Suggested.lean:122–128` (`[hAffine : IsAffine G.left] [hSmooth : Smooth G.hom] … [hSeparated : IsSeparated X.hom]`) and `README.md:881–886`, which cites "Milne 2017, Proposition 1.65".

**Claim.** Local closedness of orbits is stated at the generality of its source.

**Witness.** Milne 2017 (author-page `iAG2017`) lines 1498–1503: for any algebraic group acting on any algebraic scheme, the orbit is locally closed "according to (1.65b)". Excluded but true: trivial `αₚ` action on `Spec k`; `𝔾_m` scaling the doubled-origin line (orbit `𝔾_m`, open).

**Repair.** Give `orbit_locallyClosed` the binders `[LocallyOfFiniteType G.hom] [QuasiCompact G.hom] [LocallyOfFiniteType X.hom] [QuasiCompact X.hom]`, without `hAffine`, `hSmooth` or `hSeparated`. Say in §3A.4a that 1.65(b) needs neither smoothness nor separatedness, and that the remaining three keep 1.66's group-variety setting. Tested: the repaired scratch copy elaborates.

## R05 (P3) — Two Layer 3 bullet ids that GroupSchemesOverABase cites are dropped without an old → new entry

**Location.** `README.md:431–444`, "Items that consumers cite under an earlier name (old → new)". It maps Layer 8 and 9B items only. Layer 3 is now §3.1 (line 697) and §3.2 (line 736).

**Claim.** Every id this pull request drops that another roadmap cites is mapped.

**Witness.** On main, `ReductiveGroups/README.md:237` and `:242` are the bullets **Normality and quotients** and **Identity component `G°` and component group `π₀(G)`**. GroupSchemesOverABase (open, `README.md:81–84` and `:233–234`) cites both bullets by name.

**Repair.** Add to the list: "Layer 3's bullet *Normality and quotients* → §3.1; Layer 3's bullet *Identity component `G°` and component group `π₀(G)`* → §3.2." The overlap check reads such rows.

## R06 (P3) — Four supplier citations name no section or no supplier

**Location.**
- `README.md:1057–1058`: "projective-space H⁰ calculation from SchemeAndStackFoundations §§0.3 and 2.6 and AlgebraicVectorBundles".
- `README.md:4485–4486`: "the finite-W invariant-algebra and quotient construction of [ReflectionInvariantTheory]".
- `README.md:1076–1077`: "the existing classical/compact representation suppliers".
- `README.md:1069`: "the existing proper/coherent theorem".

**Claim.** Every consumed result has a named owner and section.

**Witness.** AlgebraicVectorBundles on main has no relative-Proj, tautological-line or projective-H⁰ section (Layers 1–4, headings at lines 388–807). Its line 866 says ReductiveGroups cites it for locally free sheaves and relative Spec. ReflectionInvariantTheory numbers its sections 1–5.

**Repair.**
- Line 1058: drop AlgebraicVectorBundles, or cite the layer actually used.
- Line 4485: cite ReflectionInvariantTheory §§1 and 3.
- Line 1077: cite LieGroups Layer 7, bullet *Algebraic realization of compact complexifications* (LieGroups line 928).
- Line 1069: cite SchemeAndStackFoundations §2.6.

## R07 (P3) — No stated order against the five open pull requests that change this folder

**Location.** The pull-request description (data): "The dependency order is #1332, then #447, then #1334"; "Only README.md changed; existing Lean prototypes, helper, metadata and configuration are untouched."

**Claim.** The description orders this pull request against every open pull request that changes the folder, and it describes the folder correctly.

**Witness.** `scratch/overlaps.md` reports conflicts in `README.md` and `Suggested.lean` with #1676, #1797, #1807, #1808 and #1854. `git diff --stat origin/main...HEAD` deletes seven `*Targets.lean` files and changes `Suggested.lean` by 548 lines.

**Repair.** Add one sentence saying which of #1676 and #1332 is rebased on the other, and that #1797, #1807, #1808 and #1854 carry this folder as a copy to be dropped at rebase. Replace the two stale sentences with an accurate account: the README and `Suggested.lean` are rewritten, and seven helper target files are deleted. Carried from r101 R01. No repair report marks it not actionable.

## Previous findings

- r101 R01 (P3, description order): **not repaired**. The description is unchanged. Carried as R07.

## Verified sound

### Gate, dependency check, build

- **Gate (my run).** `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. My run printed no build entry; the worker's gate at this head has `build=0`.
- **Dependency check.** `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Build.** `lake env lean TauCetiRoadmap/ReductiveGroups/Suggested.lean` exits 0. It prints exactly 13 `declaration uses 'sorry'` warnings, at lines 122, 131, 140, 150, 185, 197, 212, 236, 264, 280, 301, 395 and 409.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroups'` is empty.
- **`#check` pass.** All 29 declarations elaborate and none has lost a section binder:
  - the four orbit theorems carry `IsAlgClosed k`, `IsAffine G.left`, `Smooth G.hom`, `QuasiCompact` on both, `LocallyOfFiniteType X.hom` and `IsSeparated X.hom`;
  - `reductive_iff_linearlyReductive` and `exists_levi_complement` carry `CharZero`, `Algebra.Smooth` and geometric connectedness;
  - `linearlyReductive_iff_torus` carries `Fact p.Prime`, `CharP k p`, smoothness and geometric connectedness;
  - `exists_conjugate_eq_of_isMaximalTorus` carries `IsAlgClosed k`, and `lang_surjective` carries `Finite k` and `IsAlgClosed K`;
  - `integral_pbw` carries `P.IsCrystallographic`, with reducedness a frame field.

  Each matches its README statement apart from R04.
- **One-tactic probe.** I replaced each of the 13 `sorry`s by `first | rfl | trivial | infer_instance | decide | (simp; done) | (aesop; done) | sorry`. None closes. `simp` hit the heartbeat limit on `exists_conjugate_eq_of_isMaximalTorus`. The one-term derivation is R03.

### Seeded sample (all verified)

Printed page = PDF page − 12 for Milne 2017 (author-page `iAG2017`), PDF − 5 for the Jantzen 1985 preprint, and PDF − 16 for the SGA 1 retyped edition. Conrad–Feng and Conrad's *Reductive Group Schemes* print the PDF page.

- **0.1.** Milne 3.5, p. 66 (line 3053): Δ(f)(g₁,g₂)=f(g₁g₂), ε(f)=f(e), (Sf)(g)=f(g⁻¹). This supports the convolution law.
- **0.3.** §5j, Definition 5.65 and Proposition 5.68, p. 116 (lines 4985–5008): flat sheaves and sheafification.
- **1.0b.** Remark 4.1, p. 84 (line 3765): representations ↔ comodules. The native `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` resolves at the pin.
- **1.1.** Jantzen I.3.9 (typed p. 60, line 1690): injective modules, `ind` preserves injectives. I.4.14–I.4.16 (pp. 77–79a, lines 2093–2160): the Hochschild complex `Cⁿ(G,M)=M⊗k[G]^⊗n`. I.3.3–I.3.7 lie on pp. 52–58.
- **2.1.** Proposition 10.28 and Proposition 10.29 (p. 195, lines 8143–8163), Theorem 10.23 (p. 193), 10.14 (p. 190, line 7961: Lie of a kernel or fibred product) and Proposition 1.37 (p. 18: dim Tgt ≥ dim G, with equality iff smooth).
- **3.1.** Theorem 5.13 (p. 101) and Proposition 5.18 (p. 103, line 4492: an affine quotient exists for every normal subgroup).
- **4.2.** Proposition 12.3 (p. 231), Remark 12.5 (p. 232, line 9656: D(M) smooth ⇔ no p-torsion), Theorems 12.8–12.9 (p. 233), Definition 12.14 (p. 236).
- **4.3.** Definitions 12.14 and 12.17 (p. 236), Theorem 12.23 (p. 240, line 9961: anti-equivalence with Galois lattices), Corollary 12.25 (p. 240: invariance under purely inseparable extension).
- **5.1.** Proposition 14.3 (p. 280), Theorem 14.5 (p. 281), Corollaries 14.6, 14.7 and 14.9 (p. 282), 14.12 (p. 283) and 14.18 (p. 284), Theorem 16.30 (p. 334).
- **6.1.** Propositions 19.1–19.2 (pp. 397–398), 19.5 (p. 398), 19.10 (p. 400, line 16398: semisimple ⇔ R(G)=e ⇔ Z(G) finite) and 19.13 (p. 400).
- **7.2.** `conrad-feng` §6.3 starts on p. 53 (line 2229). The Levi statement is on p. 58 (lines 2397–2401: `R_{u,k}(P)=U_G(λ)` is k-split and descends `R_u(P_k̄)`). Proposition 12.3.1 is on p. 127 (line 5345: simply transitive U(k)-action; unique Levi through each maximal k-torus).
- **7.3.** Corollary 21.12 (p. 430), 21.17–21.18 (p. 431), Proposition 21.75 (p. 448), Theorem 21.80 (p. 450).
- **8.1.** Theorem 23.25 (p. 492, continued p. 493), Remark 23.26 (p. 493: unique up to `(T/Z)(k)`), Theorem 23.55 (p. 501). `conrad-rgs` Theorems 6.1.16–6.1.17 are on pp. 196–197 (lines 8159–8182).
- **8.3.** Proposition 19.9 (p. 399). 6.47–6.48 are on p. 136 (lines 5770–5782: `R_u(G)=e` while `R_u(G_k̄) ≃ 𝔾_a`).
- **11.0.** `sga1` Exposé XII Théorème et définition 1.1, pp. 239–240 (lines 9399–9410: completed local rings agree).
- **Headline locators.**
  - Milne 1.65–1.66 (pp. 26–28), Corollary 1.39 (p. 18), Definition 17.6 (p. 353), Theorems 17.9–17.10 (p. 354), Corollary 17.3 (line 14478), 17.96–17.98 (p. 383) and 22.42 (p. 477).
  - SGA 1 XII Propositions 3.1–3.2 (pp. 244–246).
  - `mcninch` §3.1 (p. 6, line 236) and (3.2.1) (p. 7, line 280).
  - `arzhantsev` Proposition 2.2 (p. 2, line 49).
  - `ernst` Theorem 6.10 (p. 46, line 1504).
  - Conrad 3.1.1 (p. 81), 3.1.9 (p. 85), 3.1.11 (p. 88), 3.2.6 (p. 94), 3.3.4 (p. 98), 5.2.11 (p. 157), 5.3.1 (p. 160).

### Library declarations opened at the pins

`TauCeti.reductiveCommHopfAlgProperty` (`Reductive/Basic.lean:70`), `linearlyReductiveCommHopfAlgProperty` (`LinearlyReductive.lean:64`) and `torusCommHopfAlgProperty` (`Torus/Basic.lean:107`: split after `AlgebraicClosure k`) were opened, together with:
- `HopfIdeal.IsMaximalTorus` (`Torus/Maximal.lean:50`), `HopfIdeal.IsBorelOverAlgClosed` (`Borel/Basic.lean:148`: `IsAlgClosed k ∧ Minimal`), `HopfIdeal.coinvariants` (`Coinvariants/Basic.lean:92`) and `HopfIdeal.conjugate` (`Conjugation.lean:66`);
- the conditional `exists_conjugate_eq_of_isBorelOverAlgClosed` (`Borel/Conjugation.lean:161`, `hcontain`) and `exists_conjugate_eq_of_isMaximalTorus` (`Torus/Conjugation.lean:156`, `hcontainI/J`);
- `coinvariantsFppfQuotientIso` (`Fppf/Quotient/Coinvariants.lean:48`, geometrically reduced) and `characterLatticeFunctor_isEquivalence` (`[PerfectField k]`, `Torus/CharacterLattice/Equivalence.lean:36`);
- `BraidGroup.permHom` (`Braid/Basic.lean:304`) and `coxeterMatrixOfBase` (`Coxeter/Matrix.lean:278`).

The Kostant files give rational spanning only (`Kostant/Form.lean:253`, `Kostant/Basis.lean:130`). No integral PBW, Nagata, Levi, orbit, Lang or braid-nonsplitting theorem exists at `a91d3aaf`. A script checked every backticked library name in the README against the pinned sources. Each resolves, except roadmap names: `Gassmann.almostConjugate_iff_permutation_equiv` (InductionRestriction Layer 2.1) and `weylCoxeterSystem` (RootSystems §2.1).

### Cross-roadmap citations resolved on main

- SchemeAndStackFoundations §§0.3, 0.7, 0.9, 0.29, 1.1, 1.14–1.18, 2.6, 4.12 (headings at 551–5613).
- ModularCurves §0B (688), §0E (839: effective descent of group laws), §0F (886: finite locally free Weil restriction).
- RootSystems Layers 1, 2 (§2.1 at 616, §2.2 at 656), 4, 5 (§5.1 at 907) and 6, with `DynkinType.simplyConnectedRootDatum` (347).
- SmoothBundlesConnections B1.0, B1.1, B1.4 (221, 315, 421).
- LieHighestWeight Layers 3, 4, 7 (405, 537, 931) and LieGroups Layers 7, 8 (787, 1078).
- AlgebraicTopology Stages 1, 4 (289, 499), InductionRestriction Layer 2.1 (346) and GroebnerGeometry G5 (394).

LieGroups also consumes ReductiveGroups (Layers 0–4, 6, 7, 7C). The two are interleaved at layer level (ReductiveGroups 7 → LieGroups 8 → ReductiveGroups 11), with no target-level loop, and the depcheck is clean.

### Ownership against open pull requests

- ClassicalGroupsPartII (#1492), SchubertGeometry (#1224) and RootSystemsPartII (#1731) were read from their checkouts. They cite this roadmap 46, 36 and 22 times as a supplier and claim none of its objects.
- FlagVarieties and GroupSchemesOverABase were read with `roadmaps show`. FlagVarieties declares `gap:borel-conjugacy-connected` on Layer 7, which `BorelTori.exists_conjugate_eq_of_isBorelOverAlgClosed` meets without smoothness or connectedness. GroupSchemesOverABase is a consumer (R05).
- InverseGaloisAndArithmeticFundamentalGroups (#850) consumes configuration spaces, and GeometricTopology on main consumes §11A, so §11A is the owner (R02).

### Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 convolution | constant S₃; 𝔾ₘ at 2/ℚ; zero algebra | (12)(23)=(123), reversed (132); t↦2, t⁻¹↦1/2; one hom, 0=1 | holds | none |
| 0.3 base change | μ₂ to 𝔽₂ and ℚ; αₚ over 𝔽ₚ(s)⊂K | (t−1)², dim 2; ℚ×ℚ; dim p both sides | holds | none |
| 1.0b Tannakian | 𝔾ₘ weight 3 at t=2; unit; trivial group | 8; 1; one element after ulift | holds | none |
| 1.1 Hochschild/induction | H=A=M; 𝔾ₘ weight one; 1⊂C₂ over ℤ | d⁰=0, d¹=id, d²=0; d⁰(1)=1⊗(t−1); ℤ², swap trace 0 | holds | none |
| 2.1 Lie | Frobenius on 𝔾ₘ, char p; SL₂ | d(tᵖ)=0, dim Lie μₚ=1 vs dim 0; [E₁₂,E₂₁]=diag(1,−1) | holds | none |
| 3.1 quotients | (t−1),(t²−1),(t−2) in k[t^±]; αₚ²/αₚ; 𝔾ₘ/μ₂ | counits 0,0,−1; coinvariants k[y]/(yᵖ); 2 lifts over ℚ(√2) only | holds | none |
| 4.2 D(M) | ℤ/p char p; χ=3, λ=−2; ×2 | tangent dim 1, not smooth (12.5); t↦t⁻⁶; kernel μ₂, length 2 | holds | none |
| 4.3 lattices | real norm-one torus; μₚ; 𝔾ₐ | X^Γ=0, rank 1; X=ℤ/p, X_*=0; X=0 but dim 1 | holds | none |
| 5.1 unipotence | 𝔾ₐ→U₂; μₚ; diag(2,3); S₃ | (tE₁₂)²=0; invariants 0; characters 2,3; no stable line | holds | none |
| 6.1 radicals | 𝔾ₐ; 𝔾ₘ; SL₂ char 2 | dims (1,1), (1,0); centre μ₂ length 2, tangent 1, finite | holds | none |
| 7.2 Levi | GL₂ Borel; λ=diag(t,1); P=G | entry a(t−s); tE₁₂, t⁻¹E₂₁; one Levi | holds | none |
| 7.3 roots/Bruhat | 𝔾ₘ; SL₂ char 2; GL₂(𝔽₂) | Φ=∅, W=1; pairing 2; cells 1,2, total 3 | holds | none |
| 8.1 classification | rank 0/1 empty; SL₂/PGL₂; diag(2,1) | dims 0,1; root 2ϖ vs primitive; I+aE₁₂↦I+2aE₁₂ | holds | none |
| 8.3 Res 𝔾ₘ | K=k; 𝔽₂(√t); 𝔽₃(t^{1/3}) | kernel 1; (1+aε)(1+bε)=1+(a+b)ε, dim 1; ε²-coefficient b+d+ac | holds | none |
| 11.0 cotangent | 𝔾ₐ; u=2t; 𝔾ₘ | [t]↦[t], [t²]=0; 2·(1/2)=1; D(t⁻¹)=−1 | holds | none |
| `orbit_locallyClosed` | 𝔾ₘ on 𝔸¹ at 1, 0; 𝔾ₘ on ℙ¹ at [1:1]; αₚ trivial; doubled origin | D(t) open; {0} closed; ℙ¹∖{0,∞} open; point; 𝔾ₘ open | true; last two excluded | R04 |
| `boundary_dimension_lt` | ℙ¹ scaling; fixed point; trivial action on Spec k[ε]/(ε²) | 0<1; ⊥<0; ⊥<0 | holds | none |
| `exists_closed_orbit_in_closure` | SL₂ on 𝔸² at (1,0) (Milne 1.67); C₂ swapping two points | {0} ⊂ 𝔸²; two-point orbit closed | holds | none |
| `exists_closed_orbit` | one-term proof from the previous | elaborates | padding | R03 |
| `compact_complexPoints` | ℙ¹; 𝔸¹ (not proper); Spec ℂ[ε]/(ε²); ∅ | compact; excluded (n↦n unbounded); one point; compact | holds | none |
| `reductive_iff_linearlyReductive` | trivial; 𝔾ₐ; SL₂ char 0; ℤ/2 | T↔T; F↔F (ke₁ has no complement); T↔T; excluded | holds | none |
| `linearlyReductive_iff_torus` | μₚ; ℤ/ℓ; norm-one torus /𝔽ₚ; SL₂ char 2; trivial | excluded (not smooth); excluded (ℓ components); T↔T; F↔F (Sym² nonsplit); T↔T (rank 0) | holds | none |
| `exists_levi_complement` | trivial; 𝔾ₐ; 𝔾ₘ⋉𝔾ₐ; SL₂(W₂) char p | J=0; I_u=0, coinvariants k, J augmentation; {(a(1−t),t)}; excluded by `CharZero` | holds | none |
| `exists_conjugate_eq_of_isBorelOverAlgClosed` | GL₂ upper/lower; ℤ/2; μₚ; SL₂/ℝ | w swaps them, wt also; trivial Borel; trivial; predicate false | holds | none |
| `exists_conjugate_eq_of_isMaximalTorus` | SL₂/ℝ diag vs SO₂; μₚ×𝔾ₘ; trivial | excluded (eigenvalues real vs e^{±iθ}); unique 𝔾ₘ; I=J | holds | none |
| `lang_surjective` | 𝔾ₐ/𝔽₂ in 𝔽₄; 𝔾ₘ/𝔽₃; constant C₂; K=k | a²−a=1; i²=−1; constant 1 (excluded); xᵠ−x=0 (excluded) | holds | R01 (owner) |
| `integral_pbw` | m=r=0; root-free Y=ℤ; A₁ (1,0,1) | basis {1} of ℤ; binom(H,2) ∉ ℤ[H]; ef=fe+h | holds | none |
| `permutation_extension_nonsplit` | n=2; n=3; n=1 | B₂=ℤ, 2a=0 forces a=0, not odd; lift of (12) has odd exponent sum; excluded | holds | none |
| Brieskorn (R02 repair) | A₁; no roots; A₁×A₁ | ℂˣ/±1, π₁=ℤ; contractible, 1; ℤ² | holds | R02 |
| Artin (R02 repair) | n=0, 1, 2 | point, trivial; ℂ, trivial; ℂ×ℂˣ, ℤ=B₂ | holds | R02 |
| §6A sign Check | H=𝔾ₘ on 𝔾ₐ, b(t)=t−1 | db=0; reversed rule 2−2s | holds | none |
| §6B Checks | SL₂/T; S₃/C₂; 𝔾ₐ×𝔾ₘ/𝔾ₘ | xy=z(z−1), dim 2; k³; k[x] | holds | none |
| §7b Checks | GL₃ line and plane; u-conjugate in GL₂ | double cosets 4+2, dims 3 vs 5/6; (M−I)²=0, s=1 gives [[2,−1],[1,0]] | holds | none |
| §7c–7g Checks | S₃ corners; counting identity; unitary GL₁ | z_U=1/4, e_Ue_We_V=1/4\|u⟩⟨v\| vs −1/2; 6=6, 2=2, 0=0; q+1 vs q²−1 | holds | none |
| §7C Checks | A₂ w=s₁; 2ρ∨; GL₂ chart | A={α₂,α₁+α₂}, A_{s₁w₀}={α₁}, A_{w₀s₁}={α₂}; 2,2,4; [a:1] | holds | none |
| §9A.1a Checks | A₂ signs; A₃ reversal | ε(α₂,α₁)=−1, ε(α₁+α₂,−α₁−α₂)=−1; ratio 1 with E_rev bonds only | holds | none |
| §9A.2–9A.6 Checks | A₁ straightening; SL₂ lattice | EF=FE+H; E(Fv⁺/2)=v⁺/2 | holds | none |
| §9B Checks | SL₂ chart; 𝔽₂ counts; D₄ triality | (1+bc)/a=d, [[1+2x,4],[−x²,1−2x]] in no chart; 4+4−2=6; 4 vs 1 | holds | none |
| §9C–10D Checks | 𝔾ₘ jets; SL₂→PGL₂; λ=−1/3 ∈ ℤ₂; SL₂ forms | m²=m+2binom(m,2); binom(H,2)↦4binom(H′,2)+H′; digits 1,0,1,…; diag(1,2,1), rank 2 over 𝔽₂ | holds | none |
| §11B–11F Checks | A₁ cover; SL₂ cameral differential; 11E projectors | 1↦2 on π₁; det −4; diag(1,0)+diag(0,1)=I | holds | none |

## Not verifiable

- **Milne edition.** The manifest's `milne-iag` records `iAG200.pdf` (v2.00, 2015), but every locator uses the 2017 numbering. All Milne locators above were checked against the author-page `iAG2017.pdf` copy in the sources cache. The manifest is outside this folder.
- **Uncertified and unread texts.**
  - `waterhouse`, `borel` and `springer` are cited only as general references; `kohls` is uncertified.
  - Humphreys §26, Howlett–Lehrer, Dipper–Du, Carter, Lang 1956, Steinberg 1968, Serre and Gassmann are not in the cache. They are cited as background or with no theorem-level locator, and none is a headline's only locator.
  - `brieskorn-1971` is image-only (see `needs-references.toml`). For R02, Ernst Theorem 6.10 (p. 46) is the readable locator.
- **Open heads without a checkout.** The conflicts with #1797, #1807, #1808 and #1854 come from the overlap index of 2026-11-09. GroupSchemesOverABase and FlagVarieties were read through `roadmaps show`.
- **Outside the branch pins, for the author's information.** This branch predates main's pin bump (main: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`). At `2fd255d9` Tau Ceti proves all four §3A orbit headlines natively and without smoothness:
  - `TauCeti.SchemeAction.isLocallyClosed_orbit` and `topologicalKrullDim_orbitBoundary_lt` (`AlgebraicGeometry/GroupAction/LocallyClosed.lean:177, 213`);
  - `exists_isClosed_orbit_subset_orbitClosure` and `exists_isClosed_orbit` (`ClosedOrbit.lean:150, 178`).

  This is not a finding at this review's pins, which are the branch's. A rebase onto main's pin must cite these declarations and drop the targets.

## Source issues

- none
